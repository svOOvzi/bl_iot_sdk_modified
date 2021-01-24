/*
 * Copyright (c) 2020 Bouffalolab.
 *
 * This file is part of
 *     *** Bouffalolab Software Dev Kit ***
 *      (see www.bouffalolab.com).
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *   1. Redistributions of source code must retain the above copyright notice,
 *      this list of conditions and the following disclaimer.
 *   2. Redistributions in binary form must reproduce the above copyright notice,
 *      this list of conditions and the following disclaimer in the documentation
 *      and/or other materials provided with the distribution.
 *   3. Neither the name of Bouffalo Lab nor the names of its contributors
 *      may be used to endorse or promote products derived from this software
 *      without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
#include <stdio.h>
#include <string.h>
#include <bl_i2c.h>
#include <FreeRTOS.h>
#include <task.h>
#include <semphr.h>

#include "demo.h"
#include <bl_i2c.h>
#include <hal_i2c.h>
#include <cli.h>

int i2c_data_test(void)
{
    int i;
    int flag;
    i2c_msg_t msgs[6];
    TickType_t xdelay;
    int data_len;

    uint8_t testarr[32];
    uint8_t recvarr01[32];
    uint8_t recvarr02[32];
    uint8_t recvarr03[32];

    xdelay= 80 / portTICK_PERIOD_MS;
    for (i = 0; i < 32; i++) {
        testarr[i] = 100 - i * 2;
    }


    //write
    data_len = 31;
    msgs[0].addr = 0x50;
    msgs[0].subflag = 1;
    msgs[0].subaddr = 0x04;
    msgs[0].buf = testarr;
    msgs[0].direct = I2C_M_WRITE;
    msgs[0].block = I2C_M_BLOCK;
    msgs[0].len = data_len;
    msgs[0].idex = 0;
    msgs[0].sublen = 2;
    msgs[0].i2cx = 0;
    i2c_transfer_msgs_block(msgs, 1, 0);

    vTaskDelay(200 / portTICK_PERIOD_MS);
    data_len = 31;
    msgs[0].addr = 0x50;
    msgs[0].subflag = 1;
    msgs[0].subaddr = 0x24;
    msgs[0].buf = testarr;
    msgs[0].direct = I2C_M_WRITE;
    msgs[0].block = I2C_M_BLOCK;
    msgs[0].len = data_len;
    msgs[0].idex = 0;
    msgs[0].sublen = 2;
    msgs[0].i2cx = 0;
    i2c_transfer_msgs_block(msgs, 1, 0);

    vTaskDelay(200 / portTICK_PERIOD_MS);
    data_len = 31;
    msgs[0].addr = 0x50;
    msgs[0].subflag = 1;
    msgs[0].subaddr = 0x44;
    msgs[0].buf = testarr;
    msgs[0].direct = I2C_M_WRITE;
    msgs[0].block = I2C_M_BLOCK;
    msgs[0].len = data_len;
    msgs[0].idex = 0;
    msgs[0].sublen = 2;
    msgs[0].i2cx = 0;
    i2c_transfer_msgs_block(msgs, 1, 0);

    vTaskDelay(200 / portTICK_PERIOD_MS);


    //read
    data_len = 31;
    memset(recvarr01, 0, 32);
    msgs[1].addr = 0x50;
    msgs[1].subflag = 1;
    msgs[1].subaddr = 0x04;
    msgs[1].buf = recvarr01;
    msgs[1].direct = I2C_M_READ;
    msgs[1].block = I2C_M_BLOCK;
    msgs[1].len = data_len;
    msgs[1].idex = 0;
    msgs[1].sublen = 2;
    msgs[1].i2cx = 0;

    data_len = 31;
    msgs[2].addr = 0x50;
    msgs[2].subflag = 1;
    msgs[2].subaddr = 0x24;
    msgs[2].buf = recvarr02;
    msgs[2].direct = I2C_M_READ;
    msgs[2].block = I2C_M_BLOCK;
    msgs[2].len = data_len;
    msgs[2].idex = 0;
    msgs[2].sublen = 2;
    msgs[2].i2cx = 0;

    msgs[3].addr = 0x50;
    msgs[3].subflag = 1;
    msgs[3].subaddr = 0x44;
    msgs[3].buf = recvarr03;
    msgs[3].direct = I2C_M_READ;
    msgs[3].block = I2C_M_BLOCK;
    msgs[3].len = data_len;
    msgs[3].idex = 0;
    msgs[3].sublen = 2;
    msgs[3].i2cx = 0;


    i2c_transfer_msgs_block(&msgs[1], 3, 0); 

    for(i = 0; i < 31; i++) {
        printf("test[%d] = %d, recv[%d] = %d \r\n", i, testarr[i], i, recvarr01[i]);
    }      
    flag = memcmp(testarr, recvarr01, 31);
    if (flag == 0) {
        printf("data correct \r\n");
    } else {
        printf("data not correct \r\n");
    }


    for(i = 0; i < 31; i++) {
        printf("test[%d] = %d, recv[%d] = %d \r\n", i, testarr[i], i, recvarr02[i]);
    }    
    flag = memcmp(testarr, recvarr02, data_len);
    if (flag == 0) {
        printf("data correct \r\n");
    } else {
        printf("data not correct \r\n");
    }


    for(i = 0; i < 31; i++) {
        printf("test[%d] = %d, recv[%d] = %d \r\n", i, testarr[i], i, recvarr03[i]);
    }
    flag = memcmp(testarr, recvarr03, data_len);
    if (flag == 0) {
        printf("data correct \r\n");
    } else {
        printf("data not correct \r\n");
    }

    return 0;
}

static void test_i2c_api(char *buf, int len, int argc, char **argv)
{
    int i = 0;
    uint8_t test_arr[32];
    uint8_t recv_arr[32];
    static uint8_t recv_nob[32];

    for (i = 0; i < 32; i++) {
        test_arr[i] = i + 3 * i;
    }
    
    hal_i2c_write_block(0x50, (char *)test_arr, 32, 2, 0x04);
    vTaskDelay(80 / portTICK_PERIOD_MS);//eeprom, when write ,should be delay ,then it could be read
    
    hal_i2c_read_block(0x50, (char *)recv_arr, 32, 2, 0x04);

    for (i = 0; i < 32; i++) {
        printf("test[%d] = %d  recv_arr[%d] = %d \r\n", i, test_arr[i], i, recv_arr[i]);
    }

    hal_i2c_write_no_block(0x50, (char *)test_arr, 32, 2, 0x04);
    vTaskDelay(80 / portTICK_PERIOD_MS);
    memset(recv_nob, 0, 32);
    hal_i2c_read_no_block(0x50, (char *)recv_nob, 32, 2, 0x04);
    vTaskDelay(200 / portTICK_PERIOD_MS);
    for (i = 0; i < 32; i++) {
        printf("test[%d] = %d  recv_nob[%d] = %d \r\n", i, test_arr[i], i, recv_nob[i]);
    }

    return;
}

//  TODO: For Linux only
//  int _stat(const char *file, void *pstat) { return 0; }

static void test_i2c_gpio_init(char *buf, int len, int argc, char **argv)
{
    //  Init I2C Port 0 to GPIO 3 and 4
    i2c_gpio_init(0);
}

static void test_i2c_set_freq(char *buf, int len, int argc, char **argv)
{
    //  Set I2C Port 0 to 500 kbps
    i2c_set_freq(500, 0);
}

static void test_i2c_clear_status(char *buf, int len, int argc, char **argv)
{
    //  Clear status for I2C Port 0
    i2c_clear_status(0);
}

//  Messages for sending and receiving I2C Data
static i2c_msg_t send_msg;
static i2c_msg_t recv_msg;

//  Buffers for sending and receiving I2C Data
static uint8_t send_buf[32];
static uint8_t recv_buf[32];

static void test_start_write_data(char *buf, int len, int argc, char **argv)
{
    //  Start writing data to I2C device
    int data_len = 1;
    send_buf[0] = 0xd0;  //  BME280 Chip ID Register

    //  Init the I2C message
    send_msg.addr = 0x76;  //  BME280 I2C Primary Address
    send_msg.subflag = 0;  //  TODO: Was 1
    send_msg.subaddr = 0;  //  TODO: Was 0x04
    send_msg.sublen  = 0;  //  TODO: Was 2
    send_msg.buf     = send_buf;
    send_msg.len     = data_len;
    send_msg.direct  = I2C_M_WRITE;
    send_msg.block   = I2C_M_BLOCK;
    send_msg.idex    = 0;
    send_msg.i2cx    = 0;

    //  Start the I2C transfer and enable I2C interrupts
    i2c_transfer_start(&send_msg);
}

static void test_do_write_data(char *buf, int len, int argc, char **argv)
{
    if (send_msg.len == 0 || send_msg.idex > 0) { puts("Must start_write_data before do_write_data"); return; }

    //  Write 4 bytes of data to I2C device
    //  TODO: After writing, wait for data written interrupt. Repeat until all data is written
    do_write_data(&send_msg);
}

static void test_start_read_data(char *buf, int len, int argc, char **argv)
{
    //  Start reading data from I2C device
    //  Expect result 0x60 for BME280, 0x58 for BMP280
    int data_len = 1;
    memset(recv_buf, 0, sizeof(recv_buf));

    //  Init the I2C message
    recv_msg.addr    = 0x76;  //  BME280 I2C Primary Address
    recv_msg.subflag = 1;     //  Use I2C Sub Address
    recv_msg.subaddr = 0xd0;  //  BME280 Chip ID Register
    recv_msg.sublen  = 1;     //  TODO: Was 2
    /*
    recv_msg.subflag = 0;  //  TODO: Was 1
    recv_msg.subaddr = 0;  //  TODO: Was 0x04
    recv_msg.sublen  = 0;  //  TODO: Was 2
    */
    recv_msg.buf     = recv_buf;
    recv_msg.len     = data_len;
    recv_msg.direct  = I2C_M_READ;
    recv_msg.block   = I2C_M_BLOCK;
    recv_msg.idex    = 0;
    recv_msg.i2cx    = 0;

    //  Start the I2C transfer and enable I2C interrupts
    i2c_transfer_start(&recv_msg);
}

static void test_do_read_data(char *buf, int len, int argc, char **argv)
{
    if (recv_msg.len == 0 || recv_msg.idex > 0) { puts("Must start_read_data before do_read_data"); return; }

    //  Read 4 bytes of data from I2C device
    //  TODO: Before reading, wait for data received interrupt. Repeat until all data is read
    do_read_data(&recv_msg);

    //  Dump the data received
    for (int i = 0; i < recv_msg.len; i++) {
        printf("%02x\n", recv_buf[i]);
    }
}

// STATIC_CLI_CMD_ATTRIBUTE makes this(these) command(s) static
const static struct cli_command cmds_user[] STATIC_CLI_CMD_ATTRIBUTE = {
    {"test_i2c", "test i2c", test_i2c_api},
    {"i2c_gpio_init", "i2c_gpio_init", test_i2c_gpio_init},
    {"i2c_set_freq", "i2c_set_freq", test_i2c_set_freq},
    {"i2c_clear_status", "i2c_clear_status", test_i2c_clear_status},
    {"start_write_data", "start_write_data", test_start_write_data},
    {"do_write_data", "do_write_data", test_do_write_data},
    {"start_read_data", "start_read_data", test_start_read_data},
    {"do_read_data", "do_read_data", test_do_read_data},
};                                                                                   

int i2c_cli_init(void)
{
    // static command(s) do NOT need to call aos_cli_register_command(s) to register.
    // However, calling aos_cli_register_command(s) here is OK but is of no effect as cmds_user are included in cmds list.
    // XXX NOTE: Calling this *empty* function is necessary to make cmds_user in this file to be kept in the final link.
    //return aos_cli_register_commands(cmds_user, sizeof(cmds_user)/sizeof(cmds_user[0]));          
    return 0;
}
