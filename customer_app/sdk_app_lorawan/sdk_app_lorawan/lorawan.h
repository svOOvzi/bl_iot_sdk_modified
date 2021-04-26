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

#ifndef H_APP_LORAWAN_
#define H_APP_LORAWAN_

void init_lorawan(char *buf0, int len0, int argc, char **argv);
void las_cmd_wr_mib(char *buf0, int len0, int argc, char **argv);
void las_cmd_rd_mib(char *buf0, int len0, int argc, char **argv);
void las_cmd_wr_dev_eui(char *buf0, int len0, int argc, char **argv);
void las_cmd_rd_dev_eui(char *buf0, int len0, int argc, char **argv);
void las_cmd_wr_app_eui(char *buf0, int len0, int argc, char **argv);
void las_cmd_rd_app_eui(char *buf0, int len0, int argc, char **argv);
void las_cmd_wr_app_key(char *buf0, int len0, int argc, char **argv);
void las_cmd_rd_app_key(char *buf0, int len0, int argc, char **argv);
void las_cmd_app_port(char *buf0, int len0, int argc, char **argv);
void las_cmd_app_tx(char *buf0, int len0, int argc, char **argv);
void las_cmd_join(char *buf0, int len0, int argc, char **argv);
void las_cmd_link_chk(char *buf0, int len0, int argc, char **argv);

#endif  //  H_APP_LORAWAN_
