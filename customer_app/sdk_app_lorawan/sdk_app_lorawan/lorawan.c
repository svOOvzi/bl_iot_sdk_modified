//  LoRaWAN Command-Line Interface. Based on https://github.com/apache/mynewt-core/blob/master/apps/lora_app_shell/src/las_cmd.c
/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

#include <stdio.h>
#include <string.h>
#include <limits.h>
#include "node/lora_priv.h"
#include "node/lora.h"
#include "parse.h"

void las_cmd_disp_byte_str(uint8_t *bytes, int len);

///////////////////////////////////////////////////////////////////////////////
//  LoRaWAN Callbacks

/* XXX: should we count statistics for the app shell? You know, things
   like transmitted, etc, etc. */
static void
lora_app_shell_txd_func(uint8_t port, LoRaMacEventInfoStatus_t status,
                        Mcps_t pkt_type, struct pbuf *om)
{
    struct lora_pkt_info *lpkt;

    assert(om != NULL);
    printf("Txd on port %u type=%s status=%d len=%u\r\n",
                   port, pkt_type == MCPS_CONFIRMED ? "conf" : "unconf",
                   status, om->len);

    lpkt = get_pbuf_header(om, sizeof(struct lora_pkt_info));
    assert(lpkt != NULL);
    printf("\tdr:%u\r\n", lpkt->txdinfo.datarate);
    printf("\ttxpower (dbm):%d\r\n", lpkt->txdinfo.txpower);
    printf("\ttries:%u\r\n", lpkt->txdinfo.retries);
    printf("\tack_rxd:%u\r\n", lpkt->txdinfo.ack_rxd);
    printf("\ttx_time_on_air:%lu\r\n", lpkt->txdinfo.tx_time_on_air);
    printf("\tuplink_cntr:%lu\r\n", lpkt->txdinfo.uplink_cntr);
    printf("\tuplink_chan:%lu\r\n", lpkt->txdinfo.uplink_chan);

    pbuf_free(om);
}

static void
lora_app_shell_rxd_func(uint8_t port, LoRaMacEventInfoStatus_t status,
                        Mcps_t pkt_type, struct pbuf *om)
{
    int rc;
    struct lora_pkt_info *lpkt;
    uint16_t cur_len;
    uint16_t len;
    uint16_t cur_off;
    uint8_t temp[16];

    assert(om != NULL);
    printf("Rxd on port %u type=%s status=%d len=%u\r\n",
                   port, pkt_type == MCPS_CONFIRMED ? "conf" : "unconf",
                   status, om->len);

    lpkt = get_pbuf_header(om, sizeof(struct lora_pkt_info));
    assert(lpkt != NULL);
    printf("\trxdr:%u\r\n", lpkt->rxdinfo.rxdatarate);
    printf("\tsnr:%u\r\n", lpkt->rxdinfo.snr);
    printf("\trssi:%d\r\n", lpkt->rxdinfo.rssi);
    printf("\trxslot:%u\r\n", lpkt->rxdinfo.rxslot);
    printf("\tack_rxd:%u\r\n", lpkt->rxdinfo.ack_rxd);
    printf("\trxdata:%u\r\n", lpkt->rxdinfo.rxdata);
    printf("\tmulticast:%u\r\n", lpkt->rxdinfo.multicast);
    printf("\tfp:%u\r\n", lpkt->rxdinfo.frame_pending);
    printf("\tdownlink_cntr:%lu\r\n", lpkt->rxdinfo.downlink_cntr);

    /* Dump the bytes received */
    len = om->len;
    if (len != 0) {
        printf("Rxd data:\r\n");
        cur_off = 0;
        while (cur_off < len) {
            cur_len = len - cur_off;
            if (cur_len > 16) {
                cur_len = 16;
            }
            rc = pbuf_copydata(om, cur_off, cur_len, temp);
            if (rc) {
                break;
            }
            cur_off += cur_len;
            las_cmd_disp_byte_str(temp, cur_len);
        }
    }

    pbuf_free(om);
}

static void
lora_app_shell_join_cb(LoRaMacEventInfoStatus_t status, uint8_t attempts)
{
    printf("Join cb. status=%d attempts=%u\r\n", status, attempts);
}

static void
lora_app_shell_link_chk_cb(LoRaMacEventInfoStatus_t status, uint8_t num_gw,
                           uint8_t demod_margin)
{
    printf("Link check cb. status=%d num_gw=%u demod_margin=%u\r\n",
                   status, num_gw, demod_margin);
}

///////////////////////////////////////////////////////////////////////////////
//  LoRaWAN Commands

#define LORA_APP_SHELL_MAX_APP_PAYLOAD  (250)
static uint8_t las_cmd_app_tx_buf[LORA_APP_SHELL_MAX_APP_PAYLOAD];

struct mib_pair {
    char *mib_name;
    Mib_t mib_param;
};

static struct mib_pair lora_mib[] = {
    {"device_class",    MIB_DEVICE_CLASS},
    {"nwk_joined",      MIB_NETWORK_JOINED},
    {"adr",             MIB_ADR},
    {"net_id",          MIB_NET_ID},
    {"dev_addr",        MIB_DEV_ADDR},
    {"nwk_skey",        MIB_NWK_SKEY},
    {"app_skey",        MIB_APP_SKEY},
    {"pub_nwk",         MIB_PUBLIC_NETWORK},
    {"repeater",        MIB_REPEATER_SUPPORT},
    {"rx2_chan",        MIB_RX2_CHANNEL},
    {"rx2_def_chan",    MIB_RX2_DEFAULT_CHANNEL},
    {"chan_mask",       MIB_CHANNELS_MASK},
    {"chan_def_mask",   MIB_CHANNELS_DEFAULT_MASK},
    {"chan_nb_rep",     MIB_CHANNELS_NB_REP},
    {"max_rx_win_dur",  MIB_MAX_RX_WINDOW_DURATION},
    {"rx_delay1",       MIB_RECEIVE_DELAY_1},
    {"rx_delay2",       MIB_RECEIVE_DELAY_2},
    {"join_acc_delay1", MIB_JOIN_ACCEPT_DELAY_1},
    {"join_acc_delay2", MIB_JOIN_ACCEPT_DELAY_2},
    {"chan_dr",         MIB_CHANNELS_DATARATE},
    {"chan_def_dr",     MIB_CHANNELS_DEFAULT_DATARATE},
    {"chan_tx_pwr",     MIB_CHANNELS_TX_POWER},
    {"chan_def_tx_pwr", MIB_CHANNELS_DEFAULT_TX_POWER},
    {"uplink_cntr",     MIB_UPLINK_COUNTER},
    {"downlink_cntr",   MIB_DOWNLINK_COUNTER},
    {"multicast_chan",  MIB_MULTICAST_CHANNEL},
    {"sys_max_rx_err",  MIB_SYSTEM_MAX_RX_ERROR},
    {"min_rx_symbols",  MIB_MIN_RX_SYMBOLS},
    {NULL, (Mib_t)0}
};

void init_lorawan(char *buf0, int len0, int argc, char **argv) {
    lora_node_init();
}

void
las_cmd_disp_byte_str(uint8_t *bytes, int len)
{
    int i;

    if (len > 0) {
        for (i = 0; i < len - 1; ++i) {
            printf("%02x:", bytes[i]);
        }
        printf("%02x\r\n", bytes[len - 1]);
    }
}

static void
las_cmd_disp_chan_mask(uint16_t *mask)
{
    uint16_t i;
    uint16_t len;
    uint16_t max_chans;
    PhyParam_t phy_param;
    GetPhyParams_t getPhy;

    if (!mask) {
        return;
    }

    getPhy.Attribute = PHY_MAX_NB_CHANNELS;
    phy_param = RegionGetPhyParam(LORA_NODE_REGION, &getPhy);
    max_chans = phy_param.Value;

    len = max_chans / 16;
    if ((len * 16) != max_chans) {
        len += 1;
    }

    for (i = 0; i < len - 1; ++i) {
        printf("%04x:", mask[i]);
    }
    printf("%04x\r\n", mask[len - 1]);
}

/**
 * Display list of MAC mibs
 *
 */
static void
las_cmd_show_mibs(void)
{
    struct mib_pair *mp;

    mp = &lora_mib[0];
    while (mp->mib_name != NULL) {
        printf("%s\r\n", mp->mib_name);
        ++mp;
    }
}

static struct mib_pair *
las_find_mib_by_name(char *mibname)
{
    struct mib_pair *mp;

    mp = &lora_mib[0];
    while (mp->mib_name != NULL) {
        if (!strcmp(mibname, mp->mib_name)) {
            return mp;
        }
        ++mp;
    }

    return NULL;
}

static void
las_cmd_wr_mib_help(void)
{
    printf("las_wr_mib <mib_name> <val> where mib_name is one of:\r\n");
    las_cmd_show_mibs();
}

static int
las_parse_bool(char *str)
{
    int rc;

    if (!strcmp(str, "0")) {
        rc = 0;
    } else if (!strcmp(str, "1")) {
        rc = 1;
    } else {
        printf("Invalid value. Valid values are 0 or 1\r\n");
        rc = -1;
    }

    return rc;
}

void
las_cmd_wr_mib(char *buf0, int len0, int argc, char **argv)
{
    int rc;
    int plen;
    uint8_t key[LORA_KEY_LEN];
    uint16_t mask[16];
    int mask_len;
    struct mib_pair *mp;
    MibRequestConfirm_t mib;
    GetPhyParams_t getPhy;
    PhyParam_t phy_param;

    if (argc < 3) {
        printf("Invalid # of arguments\r\n");
        goto wr_mib_err;
    }

    if (strcmp(argv[1], "help") == 0) {
        las_cmd_wr_mib_help();
        return;
    }

    mp = las_find_mib_by_name(argv[1]);
    if (mp == NULL) {
        printf("No mib named %s\r\n",argv[1]);
        goto wr_mib_err;
    }

    /* parse value */
    mib.Type = mp->mib_param;
    switch (mib.Type) {
        case MIB_DEVICE_CLASS:
            if (!strcmp(argv[2], "A")) {
                mib.Param.Class = CLASS_A;
            } else if (!strcmp(argv[2], "B")) {
                printf("Class B devices currently not supported\r\n");
                return;
            } else if (!strcmp(argv[2], "C")) {
                mib.Param.Class = CLASS_C;
            } else {
                printf("Invalid value. Valid values are A, B or C\r\n");
                return;
            }
            break;
        case MIB_NETWORK_JOINED:
            rc = las_parse_bool(argv[2]);
            if (rc == 0) {
                mib.Param.IsNetworkJoined = false;
            } else if (rc == 1) {
                mib.Param.IsNetworkJoined = true;
            } else {
                return;
            }
            break;
        case MIB_ADR:
            rc = las_parse_bool(argv[2]);
            if (rc == 0) {
                mib.Param.AdrEnable = false;
            } else if (rc == 1) {
                mib.Param.AdrEnable = true;
            } else {
                return;
            }
            break;
        case MIB_NET_ID:
            mib.Param.NetID = (uint32_t)parse_ull(argv[2], &rc);
            if (rc) {
                printf("Unable to parse value\r\n");
                return;
            }
            break;
        case MIB_DEV_ADDR:
            mib.Param.DevAddr = (uint32_t)parse_ull(argv[2], &rc);
            if (rc) {
                printf("Unable to parse value\r\n");
                return;
            }
            break;
        case MIB_NWK_SKEY:
            rc = parse_byte_stream(argv[2], LORA_KEY_LEN, key, &plen);
            if (rc || (plen != LORA_KEY_LEN)) {
                printf("Key does not parse. Must be 16 bytes"
                               " and separated by : or -\r\n");
                return;
            }
            mib.Param.NwkSKey = key;
            break;
        case MIB_APP_SKEY:
            rc = parse_byte_stream(argv[2], LORA_KEY_LEN, key, &plen);
            if (rc || (plen != LORA_KEY_LEN)) {
                printf("Key does not parse. Must be 16 bytes"
                               " and separated by : or -\r\n");
                return;
            }
            mib.Param.AppSKey = key;
            break;
        case MIB_PUBLIC_NETWORK:
            rc = las_parse_bool(argv[2]);
            if (rc == 0) {
                mib.Param.EnablePublicNetwork = false;
            } else if (rc == 1) {
                mib.Param.EnablePublicNetwork = true;
            } else {
                return;
            }
            break;
        case MIB_REPEATER_SUPPORT:
            rc = las_parse_bool(argv[2]);
            if (rc == 0) {
                mib.Param.EnableRepeaterSupport = false;
            } else if (rc == 1) {
                mib.Param.EnableRepeaterSupport = true;
            } else {
                return;
            }
            break;
        case MIB_CHANNELS:
            //mib.Param.ChannelList;
            break;
        case MIB_RX2_CHANNEL:
            //mib.Param.Rx2Channel;
            break;
        case MIB_RX2_DEFAULT_CHANNEL:
            //mib.Param.Rx2Channel;
            break;
        case MIB_CHANNELS_DEFAULT_MASK:
            /* NOTE: fall-through intentional */
        case MIB_CHANNELS_MASK:
            memset(mask, 0, sizeof(mask));

            getPhy.Attribute = PHY_MAX_NB_CHANNELS;
            phy_param = RegionGetPhyParam(LORA_NODE_REGION, &getPhy);
            mask_len = phy_param.Value / 8;
            if ((mask_len * 8) != phy_param.Value) {
                mask_len += 1;
            }

            /* NOTE: re-use of key here for temp buffer storage */
            rc = parse_byte_stream(argv[2], mask_len, key, &plen);
            if (rc || (plen != mask_len)) {
                printf("Mask does not parse. Must be %d bytes"
                               " and separated by : or -\r\n", mask_len);
                return;
            }

            /* construct mask from byte stream */
            rc = 0;
            for (plen = 0; plen < mask_len; plen += 2) {
                mask[rc] = key[plen];
                if ((mask_len & 1) == 0) {
                    mask[rc] += ((uint16_t)key[plen + 1]) << 8;
                }
                ++rc;
            }

            if (mib.Type == MIB_CHANNELS_DEFAULT_MASK) {
                mib.Param.ChannelsDefaultMask = mask;
            } else {
                mib.Param.ChannelsMask = mask;
            }
            break;
        case MIB_CHANNELS_NB_REP:
            //mib.Param.ChannelNbRep;
            break;
        case MIB_MAX_RX_WINDOW_DURATION:
            //mib.Param.MaxRxWindow;
            break;
        case MIB_RECEIVE_DELAY_1:
            //mib.Param.ReceiveDelay1;
            break;
        case MIB_RECEIVE_DELAY_2:
            //mib.Param.ReceiveDelay2;
            break;
        case MIB_JOIN_ACCEPT_DELAY_1:
            //mib.Param.JoinAcceptDelay1;
            break;
        case MIB_JOIN_ACCEPT_DELAY_2:
            //mib.Param.JoinAcceptDelay2;
            break;
        case MIB_CHANNELS_DEFAULT_DATARATE:
            mib.Param.ChannelsDefaultDatarate = parse_ll(argv[2], &rc);
            if (rc) {
                printf("Unable to parse value\r\n");
                return;
            }
            break;
        case MIB_CHANNELS_DATARATE:
            mib.Param.ChannelsDatarate = parse_ll(argv[2], &rc);
            if (rc) {
                printf("Unable to parse value\r\n");
                return;
            }
            break;
        case MIB_CHANNELS_DEFAULT_TX_POWER:
            //mibGet.Param.ChannelsDefaultTxPower;
            break;
        case MIB_CHANNELS_TX_POWER:
            //mib.Param.ChannelsTxPower;
            break;
        case MIB_UPLINK_COUNTER:
            //mib.Param.UpLinkCounter;
            break;
        case MIB_DOWNLINK_COUNTER:
            //mib.Param.DownLinkCounter;
            break;
        case MIB_MULTICAST_CHANNEL:
            //mib.Param.MulticastList = MulticastChannels;
            break;
        default:
            assert(0);
            break;
    }

    if (LoRaMacMibSetRequestConfirm(&mib) != LORAMAC_STATUS_OK) {
        printf("Mib not able to be set\r\n");
        return;
    }

    printf("mib %s set\r\n", mp->mib_name);

    return;

wr_mib_err:
    las_cmd_wr_mib_help();
    return;
}

static void
las_cmd_rd_mib_help(void)
{
    printf("las_rd_mib <mib_name> where mib_name is one of:\r\n");
    las_cmd_show_mibs();
}

void
las_cmd_rd_mib(char *buf0, int len0, int argc, char **argv)
{
    struct mib_pair *mp;
    LoRaMacStatus_t stat;
    MibRequestConfirm_t mibGet;

    if (argc != 2) {
        printf("Invalid # of arguments\r\n");
        goto rd_mib_err;
    }

    if (strcmp(argv[1], "help") == 0) {
        las_cmd_rd_mib_help();
        return;
    }

    mp = las_find_mib_by_name(argv[1]);
    if (mp == NULL) {
        printf("No mib named %s\r\n",argv[1]);
        goto rd_mib_err;
    }

    /* Read the mib value */
    mibGet.Type = mp->mib_param;
    stat = LoRaMacMibGetRequestConfirm(&mibGet);
    if (stat != LORAMAC_STATUS_OK) {
        printf("Mib lookup failure\r\n");
        goto rd_mib_err;
    }

    printf("%s=", mp->mib_name);
    /* Display the value */
    switch (mibGet.Type) {
        case MIB_DEVICE_CLASS:
            printf("%c\r\n", 'A' + mibGet.Param.Class);
            break;
        case MIB_NETWORK_JOINED:
            printf("%d\r\n", mibGet.Param.IsNetworkJoined);
            break;
        case MIB_ADR:
            printf("%d\r\n", mibGet.Param.AdrEnable);
            break;
        case MIB_NET_ID:
            printf("%08lx\r\n", mibGet.Param.NetID);
            break;
        case MIB_DEV_ADDR:
            printf("%08lx\r\n", mibGet.Param.DevAddr);
            break;
        case MIB_NWK_SKEY:
            las_cmd_disp_byte_str(mibGet.Param.NwkSKey, LORA_KEY_LEN);
            break;
        case MIB_APP_SKEY:
            las_cmd_disp_byte_str(mibGet.Param.AppSKey, LORA_KEY_LEN);
            break;
        case MIB_PUBLIC_NETWORK:
            printf("%d\r\n", mibGet.Param.EnablePublicNetwork);
            break;
        case MIB_REPEATER_SUPPORT:
            printf("%d\r\n", mibGet.Param.EnableRepeaterSupport);
            break;
        case MIB_CHANNELS:
            //mibGet.Param.ChannelList;
            break;
        case MIB_RX2_CHANNEL:
            //mibGet.Param.Rx2Channel;
            break;
        case MIB_RX2_DEFAULT_CHANNEL:
            //mibGet.Param.Rx2Channel;
            break;
        case MIB_CHANNELS_DEFAULT_MASK:
            las_cmd_disp_chan_mask(mibGet.Param.ChannelsDefaultMask);
            break;
        case MIB_CHANNELS_MASK:
            las_cmd_disp_chan_mask(mibGet.Param.ChannelsMask);
            break;
        case MIB_CHANNELS_NB_REP:
            printf("%u\r\n", mibGet.Param.ChannelNbRep);
            break;
        case MIB_MAX_RX_WINDOW_DURATION:
            printf("%lu\r\n", mibGet.Param.MaxRxWindow);
            break;
        case MIB_RECEIVE_DELAY_1:
            printf("%lu\r\n", mibGet.Param.ReceiveDelay1);
            break;
        case MIB_RECEIVE_DELAY_2:
            printf("%lu\r\n", mibGet.Param.ReceiveDelay2);
            break;
        case MIB_JOIN_ACCEPT_DELAY_1:
            printf("%lu\r\n", mibGet.Param.JoinAcceptDelay1);
            break;
        case MIB_JOIN_ACCEPT_DELAY_2:
            printf("%lu\r\n", mibGet.Param.JoinAcceptDelay2);
            break;
        case MIB_CHANNELS_DEFAULT_DATARATE:
            printf("%d\r\n", mibGet.Param.ChannelsDefaultDatarate);
            break;
        case MIB_CHANNELS_DATARATE:
            printf("%d\r\n", mibGet.Param.ChannelsDatarate);
            break;
        case MIB_CHANNELS_DEFAULT_TX_POWER:
            printf("%d\r\n", mibGet.Param.ChannelsDefaultTxPower);
            break;
        case MIB_CHANNELS_TX_POWER:
            printf("%d\r\n", mibGet.Param.ChannelsTxPower);
            break;
        case MIB_UPLINK_COUNTER:
            printf("%lu\r\n", mibGet.Param.UpLinkCounter);
            break;
        case MIB_DOWNLINK_COUNTER:
            printf("%lu\r\n", mibGet.Param.DownLinkCounter);
            break;
        case MIB_MULTICAST_CHANNEL:
            //mibGet.Param.MulticastList = MulticastChannels;
            break;
        default:
            assert(0);
            break;
    }
    return;

rd_mib_err:
    las_cmd_rd_mib_help();
    return;
}

void
las_cmd_rd_dev_eui(char *buf0, int len0, int argc, char **argv)
{
    if (argc != 1) {
        printf("Invalid # of arguments. Usage: las_rd_dev_eui\r\n");
        return;
    }

    las_cmd_disp_byte_str(g_lora_dev_eui, LORA_EUI_LEN);
    return;
}

void
las_cmd_wr_dev_eui(char *buf0, int len0, int argc, char **argv)
{
    int rc;
    int plen;
    uint8_t eui[LORA_EUI_LEN];

    if (argc < 2) {
        printf("Invalid # of arguments."
                       " Usage: las_wr_dev_eui <xx:xx:xx:xx:xx:xx:xx:xx>\r\n");
    }

    rc = parse_byte_stream(argv[1], LORA_EUI_LEN, eui, &plen);
    if (rc || (plen != LORA_EUI_LEN)) {
        printf("EUI does not parse. Must be 8 bytes"
                       " and separated by : or -\r\n");
    } else {
        memcpy(g_lora_dev_eui, eui, LORA_EUI_LEN);
    }

    return;
}

void
las_cmd_rd_app_eui(char *buf0, int len0, int argc, char **argv)
{
    if (argc != 1) {
        printf("Invalid # of arguments. Usage: las_rd_app_eui\r\n");
        return;
    }

    las_cmd_disp_byte_str(g_lora_app_eui, LORA_EUI_LEN);
    return;
}

void
las_cmd_wr_app_eui(char *buf0, int len0, int argc, char **argv)
{
    int rc;
    int plen;
    uint8_t eui[LORA_EUI_LEN];

    if (argc < 2) {
        printf("Invalid # of arguments."
                       " Usage: las_wr_app_eui <xx:xx:xx:xx:xx:xx:xx:xx>\r\n");
    }

    rc = parse_byte_stream(argv[1], LORA_EUI_LEN, eui, &plen);
    if (rc || (plen != LORA_EUI_LEN)) {
        printf("EUI does not parse. Must be 8 bytes"
                       " and separated by : or -\r\n");
    } else {
        memcpy(g_lora_app_eui, eui, LORA_EUI_LEN);
    }

    return;
}

void
las_cmd_rd_app_key(char *buf0, int len0, int argc, char **argv)
{
    if (argc != 1) {
        printf("Invalid # of arguments. Usage: las_rd_app_key\r\n");
        return;
    }

    las_cmd_disp_byte_str(g_lora_app_key, LORA_KEY_LEN);
    return;
}

void
las_cmd_wr_app_key(char *buf0, int len0, int argc, char **argv)
{
    int rc;
    int plen;
    uint8_t key[LORA_KEY_LEN];

    if (argc < 2) {
        printf("Invalid # of arguments."
                       " Usage: las_wr_app_key <xx:xx:xx:xx:xx:xx:xx:xx:xx:xx"
                       ":xx:xx:xx:xx:xx:xx\r\n");
    }

    rc = parse_byte_stream(argv[1], LORA_KEY_LEN, key, &plen);
    if (rc || (plen != LORA_KEY_LEN)) {
        printf("Key does not parse. Must be 16 bytes and separated by"
                       " : or -\r\n");
        return;
    } else {
        memcpy(g_lora_app_key, key, LORA_KEY_LEN);
    }

    return;
}

void
las_cmd_app_port(char *buf0, int len0, int argc, char **argv)
{
    int rc;
    uint8_t port;
    uint8_t retries;

    if (argc < 3) {
        printf("Invalid # of arguments.\r\n");
        goto cmd_app_port_err;
    }

    port = parse_ull_bounds(argv[2], 1, 255, &rc);
    if (rc != 0) {
        printf("Invalid port %s. Must be 1 - 255\r\n", argv[2]);
        return;
    }

    if (!strcmp(argv[1], "open")) {
        rc = lora_app_port_open(port, lora_app_shell_txd_func,
                                lora_app_shell_rxd_func);
        if (rc == LORA_APP_STATUS_OK) {
            printf("Opened app port %u\r\n", port);
        } else {
            printf("Failed to open app port %u err=%d\r\n", port, rc);
        }
    } else if (!strcmp(argv[1], "close")) {
        rc = lora_app_port_close(port);
        if (rc == LORA_APP_STATUS_OK) {
            printf("Closed app port %u\r\n", port);
        } else {
            printf("Failed to close app port %u err=%d\r\n", port, rc);
        }
    } else if (!strcmp(argv[1], "cfg")) {
        if (argc != 4) {
            printf("Invalid # of arguments.\r\n");
            goto cmd_app_port_err;
        }
        retries = parse_ull_bounds(argv[3], 1, MAX_ACK_RETRIES, &rc);
        if (rc) {
            printf("Invalid # of retries. Must be between 1 and "
                           "%d (inclusve)\r\n", MAX_ACK_RETRIES);
            return;
        }

        rc = lora_app_port_cfg(port, retries);
        if (rc == LORA_APP_STATUS_OK) {
            printf("App port %u configured w/retries=%u\r\n",
                           port, retries);
        } else {
            printf("Cannot configure port %u err=%d\r\n", port, rc);
        }
    } else if (!strcmp(argv[1], "show")) {
        if (rc == LORA_APP_STATUS_OK) {
            printf("app port %u\r\n", port);
            /* XXX: implement */
        } else {
            printf("Cannot show app port %u err=%d\r\n", port, rc);
        }
    } else {
        printf("Invalid port command.\r\n");
        goto cmd_app_port_err;
    }

    return;

cmd_app_port_err:
    printf("Usage:\r\n");
    printf("\tlas_app_port open <port num>\r\n");
    printf("\tlas_app_port close <port num>\r\n");
    printf("\tlas_app_port cfg <port num> <retries>\r\n");
    printf("\r\not implemented! las_app_port show <port num | all>\r\n");
    return;
}

void
las_cmd_app_tx(char *buf0, int len0, int argc, char **argv)
{
    int rc;
    uint8_t port;
    uint8_t len;
    uint8_t pkt_type;
    struct pbuf *om;
    Mcps_t mcps_type;

    if (argc < 4) {
        printf("Invalid # of arguments\r\n");
        goto cmd_app_tx_err;
    }

    port = parse_ull_bounds(argv[1], 1, 255, &rc);
    if (rc != 0) {
        printf("Invalid port %s. Must be 1 - 255\r\n", argv[2]);
        return;
    }
    len = parse_ull_bounds(argv[2], 1, LORA_APP_SHELL_MAX_APP_PAYLOAD, &rc);
    if (rc != 0) {
        printf("Invalid length. Must be 1 - %u\r\n",
                       LORA_APP_SHELL_MAX_APP_PAYLOAD);
        return;
    }
    pkt_type = parse_ull_bounds(argv[3], 0, 1, &rc);
    if (rc != 0) {
        printf("Invalid type. Must be 0 (unconfirmed) or 1 (confirmed)"
                       "\r\n");
        return;
    }

    if (lora_app_mtu() < len) {
        printf("Can send at max %d bytes\r\n", lora_app_mtu());
        return;
    }

    /* Attempt to allocate a mbuf */
    om = lora_pkt_alloc(len);
    if (!om) {
        printf("Unable to allocate mbuf\r\n");
        return;
    }

    /* Get correct packet type. */
    if (pkt_type == 0) {
        mcps_type = MCPS_UNCONFIRMED;
    } else {
        mcps_type = MCPS_CONFIRMED;
    }

    rc = pbuf_copyinto(om, 0, las_cmd_app_tx_buf, len);
    assert(rc == 0);

    rc = lora_app_port_send(port, mcps_type, om);
    if (rc) {
        printf("Failed to send to port %u err=%d\r\n", port, rc);
        pbuf_free(om);
    } else {
        printf("Packet sent on port %u\r\n", port);
    }

    return;

cmd_app_tx_err:
    printf("Usage:\r\n");
    printf("\tlas_app_tx <port> <len> <type>\r\n");
    printf("Where:\r\n");
    printf("\tport = port number on which to send\r\n");
    printf("\tlen = size n bytes of app data\r\n");
    printf("\ttype = 0 for unconfirmed, 1 for confirmed\r\n");
    printf("\tex: las_app_tx 10 20 1\r\n");

    return;
}

void
las_cmd_link_chk(char *buf0, int len0, int argc, char **argv)
{
    int rc;

    rc = lora_app_link_check();
    if (rc) {
        printf("Link check start failure err=%d\r\n", rc);
    } else {
        printf("Sending link check\r\n");
    }
    return;
}

void
las_cmd_join(char *buf0, int len0, int argc, char **argv)
{
    int rc;
    uint8_t attempts;

    /* Get the number of attempts */
    if (argc != 2) {
        printf("Invalid # of arguments\r\n");
        goto cmd_join_err;
    }

    attempts = parse_ull_bounds(argv[1], 0, 255, &rc);
    if (rc) {
        printf("Error: could not parse attempts. Must be 0 - 255\r\n");

    }

    rc = lora_app_join(g_lora_dev_eui, g_lora_app_eui, g_lora_app_key,attempts);
    if (rc) {
        printf("Join attempt start failure err=%d\r\n", rc);
    } else {
        printf("Attempting to join...\r\n");
    }
    return;

cmd_join_err:
    printf("Usage:\r\n");
    printf("\tlas_join <attempts>\r\n");
    printf("Where:\r\n");
    printf("\tattempts = # of join requests to send before failure"
                   " (0 -255)�\r\n");
    printf("\tex: las_join 10\r\n");
    return;
}

void
las_cmd_init(void)
{
    int i;

    /* Set the join callback */
    lora_app_set_join_cb(lora_app_shell_join_cb);

    /* Set link check callback */
    lora_app_set_link_check_cb(lora_app_shell_link_chk_cb);

#ifdef TODO
    for (i = 0; i < LAS_NUM_CLI_CMDS; i++) {
        int rc = shell_cmd_register(las_cmds + i);
        SYSINIT_PANIC_ASSERT_MSG(
            rc == 0, "Failed to register lora app shell CLI commands");
    }
#endif  //  TODO

    /* Init app tx payload to incrementing pattern */
    for (i = 0; i < LORA_APP_SHELL_MAX_APP_PAYLOAD; ++i) {
        las_cmd_app_tx_buf[i] = i;
    }
}
