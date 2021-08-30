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
//  LVGL User Interface. Based on https://gitlab.com/lupyuen/pinetime_lvgl_mynewt/-/blob/master/src/pinetime/lvgl.c
#include <stdio.h>
#include <assert.h>
#include "lvgl/lvgl.h"
#include "lv_port_disp.h"

/// Set to true if LVGL has already been lvgl_initialised
static bool lvgl_initialised = false;

/// Set to true if LVGL widgets have been created
static bool lvgl_created = false;

/// Button Widget
static lv_obj_t *btn = NULL;

/// Label Widget
static lv_obj_t *label = NULL;

/// Init the LVGL library
int lvgl_init(void) {   
    //  Assume that display controller has been initialised 
    if (lvgl_initialised) { return 0; }  //  Init only once
    lvgl_initialised = true;
    printf("Init LVGL...\r\n");

    //  Init the LVGL display
    lv_init();
    lv_port_disp_init();
    return 0;
}

/// Create a Button Widget and a Label Widget
int lvgl_create(void) {
    assert(lvgl_initialised);        //  LVGL must have been initialised
    if (lvgl_created) { return 0; }  //  Create widgets only once
    lvgl_created = true;
    printf("Create LVGL widgets...\r\n");

    btn = lv_btn_create(lv_scr_act(), NULL);  //  Add a button the current screen
    lv_obj_set_pos(btn, 10, 80);              //  Set its position
    lv_obj_set_size(btn, 220, 80);            //  Set its size

    label = lv_label_create(btn, NULL);       //  Add a label to the button
    lv_label_set_text(label, "BL602 LVGL");   //  Set the label text
    return 0;
}

/// Update the Widgets
int lvgl_update(void) {
    assert(lvgl_created);  //  LVGL widgets must have been created
    assert(label != NULL);
    printf("Update LVGL widgets...\r\n");

    //  Set the button label to a new message
    static int counter = 1;
    char msg[20]; 
    snprintf(msg, sizeof(msg), "SO COOL! #%d", counter++);
    lv_label_set_text(label, msg);
    return 0;
}

/// Render the LVGL display
int lvgl_render(void) {
    assert(lvgl_created);  //  LVGL widgets must have been created
    printf("Render LVGL display...\r\n");

    //  Must tick at least 100 milliseconds to force LVGL to render display
    lv_tick_inc(100);

    //  Call LVGL to render the display and flush our display driver
    lv_task_handler();
    return 0;
}