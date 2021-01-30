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
#include <assert.h>
#include <FreeRTOS.h>
#include <task.h>
#include <semphr.h>

#include "demo.h"
#include <hal/soc/spi.h>
#include <cli.h>

/// Use SPI Port Number 0
#define SPI_PORT  0

/// SPI Port
static spi_dev_t spi;

/// Init the SPI Port. Based on AliOS SPI API: https://help.aliyun.com/document_detail/161063.html?spm=a2c4g.11186623.6.576.391045c4bGoNKS
static void test_init_spi(char *buf, int len, int argc, char **argv)
{
    //  Set the port number, mode and frequency
    spi.port        = SPI_PORT;
    spi.config.mode = HAL_SPI_MODE_MASTER;
    spi.config.freq = 500 * 1000;  //  500 kHz. Previously 3 * 1000 * 0000

    //  TODO: Set spi.priv

    //  Init the port
    int rc = hal_spi_init(&spi);
    assert(rc == 0);

    //  TODO: int hal_spi_set_rwmode(spi_dev_t *spi_dev, int mode);
    //  TODO: int hal_spi_set_rwspeed(spi_dev_t *spi_dev, uint32_t speed);
    //  TODO: int hal_spi_transfer(spi_dev_t *spi_dev, void *xfer, uint8_t size);/* spi_ioc_transfer_t */
}

// STATIC_CLI_CMD_ATTRIBUTE makes this(these) command(s) static
const static struct cli_command cmds_user[] STATIC_CLI_CMD_ATTRIBUTE = {
    {"init_spi", "Init SPI port", test_init_spi},
};                                                                                   

int i2c_cli_init(void)
{
    // static command(s) do NOT need to call aos_cli_register_command(s) to register.
    // However, calling aos_cli_register_command(s) here is OK but is of no effect as cmds_user are included in cmds list.
    // XXX NOTE: Calling this *empty* function is necessary to make cmds_user in this file to be kept in the final link.
    //return aos_cli_register_commands(cmds_user, sizeof(cmds_user)/sizeof(cmds_user[0]));          
    return 0;
}

#ifdef NOTUSED

#define HAL_SPI_MODE_MASTER 1  /* spi communication is master mode */
#define HAL_SPI_MODE_SLAVE  2  /* spi communication is slave mode */

typedef struct {
    uint8_t mode;           /* spi communication mode */
    uint32_t freq;          /* communication frequency Hz */
} spi_config_t;

typedef struct {
    uint8_t      port;    /* spi port */
    spi_config_t config;  /* spi config */
    void        *priv;    /* priv data */
} spi_dev_t;

#endif  //  NOTUSED
