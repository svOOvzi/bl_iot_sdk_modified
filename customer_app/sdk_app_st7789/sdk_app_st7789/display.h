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
//  Display image on ST7789 display controller (240 x 240)
#ifndef ST7789_DISPLAY_H
#define ST7789_DISPLAY_H

/// Use GPIO 5 as ST7789 Data/Command Pin (DC)
#define SPI_DC_PIN 5

/// Use GPIO 11 as ST7789 Reset Pin (RST)
#define SPI_RST_PIN 11

/// Use GPIO 12 as ST7789 Backlight Pin (BLK)
#define SPI_BLK_PIN 12

#endif  //  ST7789_DISPLAY_H
