
blsp_boot2.elf:     file format elf32-littleriscv

SYMBOL TABLE:
23000000 l    d  .text	00000000 .text
22010000 l    d  .itcm_region	00000000 .itcm_region
42014000 l    d  .dtcm_region	00000000 .dtcm_region
42014000 l    d  .stack_dummy	00000000 .stack_dummy
42020000 l    d  .system_ram_data_region	00000000 .system_ram_data_region
42021080 l    d  RAM_DATA	00000000 RAM_DATA
4202109c l    d  .bss	00000000 .bss
42021950 l    d  .noinit_data	00000000 .noinit_data
42032950 l    d  .heap	00000000 .heap
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_loc	00000000 .debug_loc
00000000 l    d  .debug_aranges	00000000 .debug_aranges
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_macro	00000000 .debug_macro
00000000 l    d  .debug_line	00000000 .debug_line
00000000 l    d  .debug_str	00000000 .debug_str
00000000 l    d  .comment	00000000 .comment
00000000 l    d  .riscv.attributes	00000000 .riscv.attributes
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    df *ABS*	00000000 interrupt.c
00000000 l    df *ABS*	00000000 memmove.c
00000000 l    df *ABS*	00000000 libgcc2.c
00000000 l    df *ABS*	00000000 libgcc2.c
00000000 l    df *ABS*	00000000 blsp_boot2.c
230008fc l     F .text	0000001e PtTable_Flash_Read
2300091a l     F .text	0000001e PtTable_Flash_Write
23000938 l     F .text	0000001c PtTable_Flash_Erase
23000954 l     F .text	000001fe BLSP_Boot2_Deal_One_FW
00000000 l    df *ABS*	00000000 blsp_common.c
00000000 l    df *ABS*	00000000 blsp_media_boot.c
230010ee l     F .text	0000006e BLSP_MediaBoot_Read_Signaure
00000000 l    df *ABS*	00000000 blsp_boot_parser.c
42021000 l     O .system_ram_data_region	00000040 padding
42021040 l     O .system_ram_data_region	00000040 shaTmpBuf
00000000 l    df *ABS*	00000000 blsp_boot_decompress.c
23001b8c l     F .text	000001ee BLSP_Boot2_Fw_Decompress
42021950 l     O .noinit_data	00001000 xzOutput
00000000 l    df *ABS*	00000000 blsp_port.c
42021934 l     O .bss	00000004 pParameter.9191
42021098 l     O RAM_DATA	00000001 boot2Flag.9249
00000000 l    df *ABS*	00000000 bflb_ecdsa.c
23002062 l     F .text	00000048 bflb_ecc_basic_parameter_init.isra.0
230020aa l     F .text	000000c0 bflb_ecc_point_mul_init.isra.1
2300216a l     F .text	000001f0 bflb_ecdsa_point_add.isra.4
2300235a l     F .text	00000362 bflb_ecdsa_verify_point_mul.isra.5
00000000 l    df *ABS*	00000000 memcpy.c
00000000 l    df *ABS*	00000000 memset.c
00000000 l    df *ABS*	00000000 memcmp.c
00000000 l    df *ABS*	00000000 vsnprintf.c
230078bc l     O .text	00000011 lcdigits.1536
230078d0 l     O .text	00000011 ucdigits.1537
00000000 l    df *ABS*	00000000 strlen.c
00000000 l    df *ABS*	00000000 partition.c
230036ca l     F .text	0000005a pPtTable_Flash_Read_Fast
23003724 l     F .text	0000006c PtTable_Valid
42021099 l     O RAM_DATA	00000001 index.8374
00000000 l    df *ABS*	00000000 ring_buffer.c
00000000 l    df *ABS*	00000000 xz_crc32.c
00000000 l    df *ABS*	00000000 xz_dec_lzma2.c
23003bb6 l     F .text	0000017c lzma_len
23003d32 l     F .text	00000066 dict_repeat.part.1
23003d98 l     F .text	00000752 lzma_main
00000000 l    df *ABS*	00000000 xz_dec_stream.c
23004bc0 l     F .text	00000072 fill_temp
23004c32 l     F .text	00000098 dec_vli.isra.0
23004cca l     F .text	00000036 index_update.isra.2
00000000 l    df *ABS*	00000000 xz_port.c
42022950 l     O .noinit_data	00010000 mallocBuf
42021944 l     O .bss	00000004 malloced
00000000 l    df *ABS*	00000000 system_bl602.c
00000000 l    df *ABS*	00000000 start_load.c
00000000 l    df *ABS*	00000000 bl602_common.c
00000000 l    df *ABS*	00000000 bl602_uart.c
23007ee8 l     O .text	00000008 uartAddr
00000000 l    df *ABS*	00000000 bl602_glb.c
00000000 l    df *ABS*	00000000 bl602_ef_ctrl.c
00000000 l    df *ABS*	00000000 bl602_hbn.c
00000000 l    df *ABS*	00000000 bl602_sec_eng.c
230060c2 l     F .text	00000182 Sec_Eng_SHA256_Update.part.0
23006244 l     F .text	0000001e Sec_Eng_PKA_MREM.part.3
23006244 l     F .text	0000001e Sec_Eng_PKA_LMUL.part.4
23007ef0 l     O .text	00000014 CSWTCH.116
00000000 l    df *ABS*	00000000 platform_device.c
23006cee l     F .text	00000048 UART_RFR_Cbf
23006d36 l     F .text	00000048 UART_RTO_Cbf
23006cc6 l     F .text	00000028 UART_RTO_Cbf.part.0
23006cc6 l     F .text	00000028 UART_RFR_Cbf.part.1
42021854 l     O .bss	00000080 print_buf.8760
420218d4 l     O .bss	00000040 uartBuf
42021914 l     O .bss	00000018 uartRB
42021948 l     O .bss	00000004 init_flag
4202194c l     O .bss	00000001 uart_dbg_disable
00000000 l    df *ABS*	00000000 libgcc2.c
00000000 l    df *ABS*	00000000 softcrc.c
00000000 l    df *ABS*	00000000 bl602_romapi.c
22010842 g     F .itcm_region	0000000a XIP_SFlash_Opt_Enter
22010626 g     F .itcm_region	0000000a SFlash_Reset_Continue_Read
23005a04 g     F .text	0000009a Interrupt_Handler
23006a08 g     F .text	0000006a Sec_Eng_PKA_LCMP
42032950 g       .heap	00000000 __HeapBase
220105a4 g     F .itcm_region	0000000a SFlash_Sector_Erase
23001fd8 g     F .text	00000042 bflb_platform_init_uart_debug_gpio
22010824 g     F .itcm_region	0000000a XIP_SFlash_Read_With_Lock
2201064e g     F .itcm_region	0000000a SFlash_Cache_Flush
230000c0 g     O .text	00000140 __Vectors
2300777c g     O .text	00000020 secp256r1_1M1
220103ce g     F .itcm_region	0000000a EF_Ctrl_Sw_AHB_Clk_0
2300787c g     O .text	00000020 secp256r1_Zerox
22010680 g     F .itcm_region	0000000a SFlash_Read
23006656 g     F .text	000000c2 Sec_Eng_PKA_Read_Data
4202109c g     O .bss	000005c0 bootImgCfg
23001eb6 g     F .text	0000001c BLSP_Read_Power_Save_Mode
23005754  w    F .text	0000009a SDIO_IRQHandler_Wrapper
2201054a g     F .itcm_region	0000000a SFlash_Init
2300562e g     F .text	00000126 start_load
230058de g     F .text	00000126 Trap_Handler
23005754  w    F .text	0000009a TIMER_WDT_IRQHandler_Wrapper
42021880 g       RAM_DATA	00000000 __global_pointer$
420216ac g     O .bss	00000054 flashCfg
23006e34 g     F .text	00000006 bflb_platform_deinit_time
220108e2 g     F .itcm_region	0000000a Update_SystemCoreClockWith_XTAL
23005754  w    F .text	0000009a GPIO_INT0_IRQHandler_Wrapper
2201063a g     F .itcm_region	0000000a SFlash_IDbus_Read_Enable
23005e2e g     F .text	0000001c GLB_UART_Sig_Swap_Set
22010504 g     F .itcm_region	0000000a L1C_IROM_2T_Access_Set
2201075c g     F .itcm_region	0000000a SF_Ctrl_AES_Disable
23005754  w    F .text	0000009a SEC_PKA_IRQHandler_Wrapper
23005800 g     F .text	0000009a Trap_Handler_Stub
23005754  w    F .text	0000009a SEC_TRNG_IRQHandler_Wrapper
22010838 g     F .itcm_region	0000000a XIP_SFlash_Erase_With_Lock
22010900 g     F .itcm_region	0000000a GLB_Set_SF_CLK
22010450 g     F .itcm_region	0000000a GLB_GPIO_Init
22010946 g     F .itcm_region	0000000a HBN_Power_Off_RC32K
220105cc g     F .itcm_region	0000000a SFlash_Program
23005754  w    F .text	0000009a MAC_GEN_IRQHandler_Wrapper
23005754  w    F .text	0000009a DMA_BMX_ERR_IRQHandler_Wrapper
220106a8 g     F .itcm_region	0000000a SF_Cfg_Init_Internal_Flash_Gpio
2201096e g     F .itcm_region	0000000a PDS_Select_XTAL_As_PLL_Ref
23000202 g     F .text	0000004a memmove
00000000 g       *ABS*	00000000 __metal_chicken_bit
23003790 g     F .text	0000001e PtTable_Set_Flash_Operation
220108c4 g     F .itcm_region	0000000a GLB_Set_System_CLK_Div
2201087e g     F .itcm_region	0000000a AON_Set_Xtal_CapCode
220104d2 g     F .itcm_region	0000000a HBN_Pin_WakeUp_Mask
22010148 g     F .itcm_region	0000001a BLSP_Boot2_Get_Clk_Cfg
23006262 g     F .text	0000005a Sec_Eng_SHA256_Init
23004d00 g     F .text	00000046 xz_dec_reset
2201061c g     F .itcm_region	0000000a SFlash_Software_Reset
23005d44 g     F .text	0000004e UART_ReceiveData
22010752 g     F .itcm_region	0000000a SF_Ctrl_AES_Enable
22010644 g     F .itcm_region	0000000a SFlash_Cache_Enable_Set
23005754  w    F .text	0000009a EFUSE_IRQHandler_Wrapper
230077fc g     O .text	00000020 secp256r1_BAR4
2300558c g     F .text	0000000e simple_free
22010608 g     F .itcm_region	0000000a SFlash_SetBurstWrap
4202193c g     O .bss	00000004 PtTable_Flash_Read
23006594 g     F .text	000000c2 Sec_Eng_PKA_Write_Data
22010522 g     F .itcm_region	0000000a PDS_RAM_Config
22010748 g     F .itcm_region	0000000a SF_Ctrl_AES_Set_IV_BE
23005a9e g     F .text	000000f6 UART_Init
23005754  w    F .text	0000009a WIFI_IRQHandler_Wrapper
23007f34 g       .text	00000000 __text_code_end__
23006e92 g     F .text	0000003a bflb_platform_deinit
2201040a g     F .itcm_region	0000000a GLB_SW_System_Reset
23005754  w    F .text	0000009a SEC_CDET_IRQHandler_Wrapper
220109b4 g       .itcm_region	00000000 __tcm_code_end__
220101c4 g     F .itcm_region	00000002 BLSP_Boot2_Update_System_Flash_Clk
23001f30 g     F .text	0000002a BLSP_Is_MSP_Valid
22010428 g     F .itcm_region	0000000a GLB_Select_Internal_Flash
2201050e g     F .itcm_region	0000000a PDS_Reset
230076dc g     O .text	00000020 secp256r1N
220102c8 g     F .itcm_region	00000020 BLSP_Boot2_Get_Feature_Flag
2201072a g     F .itcm_region	0000000a SF_Ctrl_AES_Set_Key
2201055e g     F .itcm_region	0000000a SFlash_Read_Reg
220109aa g     F .itcm_region	0000000a PDS_Power_Off_PLL
23002b8a g     F .text	00000018 memcpy
23001ea2 g     F .text	00000010 BLSP_Boot2_Init_Sec_Eng_PKA
220103f6 g     F .itcm_region	0000000a EF_Ctrl_AutoLoad_Done
2201086a g     F .itcm_region	0000000a AON_Power_Off_MBG
220103d8 g     F .itcm_region	0000000a EF_Ctrl_Program_Efuse_0
42032950 g       .noinit_data	00000000 __noinit_data_end__
22010518 g     F .itcm_region	0000000a PDS_Force_Config
220108ba g     F .itcm_region	0000000a GLB_Get_Root_CLK_Sel
220107de g     F .itcm_region	0000000a XIP_SFlash_Erase_Need_Lock
230054e0 g     F .text	00000046 xz_dec_init
23005b94 g     F .text	0000006a UART_FifoConfig
22010694 g     F .itcm_region	0000000a SFlash_Write_Reg_With_Cmd
220104f0 g     F .itcm_region	0000000a L1C_Set_Wrap
220108f6 g     F .itcm_region	0000000a System_Core_Clock_Update_From_RC32M
22010978 g     F .itcm_region	0000000a PDS_Power_On_PLL
23006c72 g     F .text	00000054 bflb_platform_printf
23005754  w    F .text	0000009a SEC_AES_IRQHandler_Wrapper
23004b1c g     F .text	00000078 xz_dec_lzma2_reset
23005ed2 g     F .text	00000040 EF_Ctrl_Read_Secure_Boot
2300779c g     O .text	00000020 secp256r1_1P1
23003926 g     F .text	00000116 PtTable_Update_Entry
23006a72 g     F .text	00000064 Sec_Eng_PKA_LMUL
2300382e g     F .text	00000064 PtTable_Get_Active_Entries_By_ID
22010932 g     F .itcm_region	0000000a HBN_Power_Off_Xtal_32K
220103a6 g     F .itcm_region	0000000a BL602_MemCpy_Fast
2201077a g     F .itcm_region	0000000a SF_Ctrl_Select_Clock
22010414 g     F .itcm_region	0000000a GLB_SW_CPU_Reset
23002bd8 g     F .text	00000ad8 vsnprintf
2201090a g     F .itcm_region	0000000a GLB_Set_PKA_CLK_Sel
23005e4a g     F .text	0000001a GLB_JTAG_Sig_Swap_Set
42020000 g     O .system_ram_data_region	00001000 boot2ReadBuf
23001072 g     F .text	00000060 BLSP_Dump_Data
42032950 g       .heap	00000000 __HeapLimit
4202109c g       .bss	00000000 __bss_start__
2201078e g     F .itcm_region	0000000a SF_Ctrl_Icache_Set
220106d0 g     F .itcm_region	0000000a SF_Cfg_Init_Flash_Gpio
42021714 g     O .bss	00000140 __Interrupt_Handlers
2300773c g     O .text	00000020 secp256r1PrimeN_P
220105b8 g     F .itcm_region	0000000a SFlash_Blk64_Erase
23001e82 g     F .text	0000001a BLSP_Boot2_Show_Timer
22010536 g     F .itcm_region	0000000a SEC_Eng_Turn_On_Sec_Ring
23005544 g     F .text	00000006 simple_malloc_init
23005754  w    F .text	0000009a PWM_IRQHandler_Wrapper
2201081a g     F .itcm_region	0000000a XIP_SFlash_Read_Via_Cache_Need_Lock
22010662 g     F .itcm_region	0000000a SFlash_Cache_Hit_Count_Get
22010400 g     F .itcm_region	0000000a EF_Ctrl_Clear
22010964 g     F .itcm_region	0000000a PDS_Select_RC32M_As_PLL_Ref
23005754  w    F .text	0000009a RF_TOP_INT1_IRQHandler_Wrapper
230037ae g     F .text	00000080 PtTable_Get_Active_Partition_Need_Lock
2201091e g     F .itcm_region	0000000a HBN_Set_ROOT_CLK_Sel
22010892 g     F .itcm_region	0000000a AON_Power_Off_XTAL
230044ea g     F .text	000005ca xz_dec_lzma2_run
23001e7a g     F .text	00000008 BLSP_Boot2_Flush_XIP_Cache
23006c58 g     F .text	0000001a bflb_platform_uart_dbg_deinit
23005754  w    F .text	0000009a HBN_OUT0_IRQHandler_Wrapper
23000000 g       .text	00000000 __text_code_start__
23005c32 g     F .text	00000030 UART_Disable
23005754  w    F .text	0000009a SF_CTRL_IRQHandler_Wrapper
220105ea g     F .itcm_region	0000000a SFlash_GetDeviceId
230005aa g     F .text	00000352 .hidden __umoddi3
220106c6 g     F .itcm_region	0000000a SF_Cfg_Get_Flash_Cfg_Need_Lock
23001b20 g     F .text	0000006c BLSP_Boot_Parser_Check_Hash
23005cf4 g     F .text	00000050 UART_SendData
23005754  w    F .text	0000009a TIMER_CH0_IRQHandler_Wrapper
23003ab0 g     F .text	000000b4 Ring_Buffer_Write_Callback
220105c2 g     F .itcm_region	0000000a SFlash_Erase
220102fc g     F .itcm_region	0000000a BLSP_Boot2_Dump_Critical_Flag
2300024c g     F .text	0000035e .hidden __udivdi3
23005754  w    F .text	0000009a clic_mext_handler_Wrapper
23003a5a g     F .text	00000056 Ring_Buffer_Get_Length
23005754  w    F .text	0000009a MAC_TXRX_TIMER_IRQHandler_Wrapper
220103e2 g     F .itcm_region	0000000a EF_Ctrl_Load_Efuse_R0
23005754 g     F .text	0000009a Interrupt_Handler_Stub
42021950 g       .noinit_data	00000000 __noinit_data_start__
2300781c g     O .text	00000020 secp256r1_BAR8
220106ee g     F .itcm_region	0000000a SF_Ctrl_Select_Pad
2201039c g     F .itcm_region	0000000a BL602_MemCpy4
23005754  w    F .text	0000009a clic_csoft_handler_Wrapper
2201093c g     F .itcm_region	0000000a HBN_Power_On_RC32K
2201084c g     F .itcm_region	0000000a XIP_SFlash_Opt_Exit
2201068a g     F .itcm_region	0000000a SFlash_Read_Reg_With_Cmd
220107f2 g     F .itcm_region	0000000a XIP_SFlash_Read_Need_Lock
220104dc g     F .itcm_region	0000000a HBN_GPIO7_Dbg_Pull_Cfg
23001f1c g     F .text	0000000a BLSP_Get_User_Specified_Fw
230019e6 g     F .text	0000007e BLSP_Boot_Parse_AesIv
2201052c g     F .itcm_region	0000000a PDS_Default_Level_Config
220101c6 g     F .itcm_region	00000068 BLSP_Boot2_Set_Encrypt
42021938 g     O .bss	00000004 PtTable_Flash_Erase
22010482 g     F .itcm_region	0000000a HBN_Mode_Enter
23004d46 g     F .text	0000079a xz_dec_run
2300769c g     O .text	00000020 secp256r1InvR_N
230088e8 g       *ABS*	00000000 __dtcm_load_addr
23005c80 g     F .text	00000028 UART_TxFreeRun
42021930 g     O .bss	00000004 userHashIgnored
220107b6 g     F .itcm_region	0000000a SF_Ctrl_Get_Clock_Delay
22010554 g     F .itcm_region	0000000a SFlash_SetSPIMode
22010568 g     F .itcm_region	0000000a SFlash_Write_Reg
22010464 g     F .itcm_region	0000000a GLB_GPIO_OUTPUT_Disable
220103c4 g     F .itcm_region	0000000a BL602_MemCmp
22010586 g     F .itcm_region	0000000a SFlash_Qspi_Enable
23006d7e g     F .text	0000008c bflb_platform_get_time_ms
23001e9c g     F .text	00000006 BLSP_Boot2_Reset_Sec_Eng
22010996 g     F .itcm_region	0000000a PDS_Enable_PLL_Clk
23001a64 g     F .text	000000bc BLSP_Boot_Parser_Check_Signature
220106f8 g     F .itcm_region	0000000a SF_Ctrl_Set_Owner
22010338 g     F .itcm_region	0000000a AON_Power_On_LDO15_RF
2201043c g     F .itcm_region	0000000a GLB_Deswap_Flash_Pin
23001d7a g     F .text	000000ca BLSP_Boot2_Update_Fw
23006572 g     F .text	00000010 Sec_Eng_PKA_Reset
23005754  w    F .text	0000009a I2C_IRQHandler_Wrapper
23004ab4 g     F .text	00000068 xz_dec_lzma2_create
23005dea g     F .text	00000034 GLB_AHB_Slave1_Reset
23001ed2 g     F .text	0000004a BLSP_Boot2_Pass_Parameter
22010446 g     F .itcm_region	0000000a GLB_Swap_Flash_Pin
230077dc g     O .text	00000020 secp256r1_BAR3
23006ecc g     F .text	00000006 bflb_platform_print_set
22010716 g     F .itcm_region	0000000a SF_Ctrl_AES_Enable_LE
22010612 g     F .itcm_region	0000000a SFlash_DisableBurstWrap
23005754  w    F .text	0000009a SPI_IRQHandler_Wrapper
23005754  w    F .text	0000009a MAC_PORT_TRG_IRQHandler_Wrapper
23005754  w    F .text	0000009a PDS_WAKEUP_IRQHandler_Wrapper
220106da g     F .itcm_region	0000000a SF_Cfg_Flash_Identify
220104e6 g     F .itcm_region	0000000a HBN_Set_Embedded_Flash_Pullup
2300783c g     O .text	00000020 secp256r1_Gx
23005754  w    F .text	0000009a clic_mtimer_handler_Wrapper
220102f2 g     F .itcm_region	0000000a BLSP_Boot2_8M_Support_Flag
4202192c g     O .bss	00000001 cpuCount
42021950 g       .bss	00000000 __bss_end__
220108b0 g     F .itcm_region	0000000a EF_Ctrl_Read_RC32K_Trim
230062dc g     F .text	0000022e Sec_Eng_SHA256_Finish
22010856 g     F .itcm_region	0000000a BFLB_Soft_CRC32
23001e78 g     F .text	00000002 BLSP_Boot2_Disable_Other_Cache
23007f34 g       .itcm_region	00000000 __itcm_load_addr
220107e8 g     F .itcm_region	0000000a XIP_SFlash_Write_Need_Lock
2201057c g     F .itcm_region	0000000a SFlash_Write_Enable
220101c2 g     F .itcm_region	00000002 BLSP_Boot2_Releae_Other_CPU
23005526 g     F .text	0000001e xz_dec_end
22010982 g     F .itcm_region	0000000a PDS_Enable_PLL_All_Clks
23005754  w    F .text	0000009a L1C_BMX_ERR_IRQHandler_Wrapper
230076fc g     O .text	00000020 secp256r1P
22010770 g     F .itcm_region	0000000a SF_Ctrl_Get_Flash_Image_Offset
220107ca g     F .itcm_region	0000000a XIP_SFlash_State_Save
2201045a g     F .itcm_region	0000000a GLB_GPIO_OUTPUT_Enable
2201034c g     F .itcm_region	0000000a AON_Power_On_SFReg
23005754  w    F .text	0000009a SEC_BMX_ERR_IRQHandler_Wrapper
23005f12 g     F .text	00000030 EF_Ctrl_Read_Sw_Usage
22010310 g     F .itcm_region	0000000a AON_Power_On_BG
23003b80 g     F .text	00000002 xz_crc32_init
22010702 g     F .itcm_region	0000000a SF_Ctrl_Disable
23009968 g       *ABS*	00000000 __ram_load_addr
42021080 g     O RAM_DATA	00000018 bootCpuCfg
220104fa g     F .itcm_region	0000000a L1C_Set_Way_Disable
23001eb2 g     F .text	00000004 BLSP_Boot2_Get_CPU_Count
220109a0 g     F .itcm_region	0000000a PDS_Disable_PLL_Clk
23005e64 g     F .text	0000004a GLB_Set_MTimer_CLK
220107c0 g     F .itcm_region	0000000a SF_Ctrl_Set_Clock_Delay
220108d8 g     F .itcm_region	0000000a GLB_Get_HCLK_Div
22010860 g     F .itcm_region	0000000a AON_Power_On_MBG
230058bc g     F .text	00000012 clic_enable_interrupt
22010324 g     F .itcm_region	0000000a AON_Power_On_LDO11_SOC
23005754  w    F .text	0000009a MAC_RX_TRG_IRQHandler_Wrapper
2201031a g     F .itcm_region	0000000a AON_Power_Off_BG
23005c62 g     F .text	0000001e UART_SetRxTimeoutValue
23002bba g     F .text	0000001e memcmp
2201037e g     F .itcm_region	0000000a BL602_Delay_US
230062ce g     F .text	0000000e Sec_Eng_SHA256_Update
2201032e g     F .itcm_region	0000000a AON_Power_Off_LDO11_SOC
42020000 g       .system_ram_data_region	00000000 __system_ram_data_start__
23005ffc g     F .text	0000000c EF_Ctrl_Read_Chip_ID
23006884 g     F .text	00000066 Sec_Eng_PKA_MREM
22010720 g     F .itcm_region	0000000a SF_Ctrl_AES_Set_Region
230015d4 g     F .text	0000023c BLSP_Boot_Parse_BootHeader
22010810 g     F .itcm_region	0000000a XIP_SFlash_GetUniqueId_Need_Lock
23005754  w    F .text	0000009a MAC_TX_TRG_IRQHandler_Wrapper
23001f96 g     F .text	00000042 BLSP_Fix_Invalid_MSP_PC
2201089c g     F .itcm_region	0000000a EF_Ctrl_Get_Trim_Parity
220105ae g     F .itcm_region	0000000a SFlash_Blk32_Erase
220104b4 g     F .itcm_region	0000000a HBN_Set_Ldo11_Rt_Vout
2300771c g     O .text	00000020 secp256r1PrimeN_N
23005eae g     F .text	00000024 GLB_UART_Fun_Sel
220103ec g     F .itcm_region	0000000a EF_Ctrl_Busy
2300605c g     F .text	0000000a HBN_Get_Status_Flag
22010766 g     F .itcm_region	0000000a SF_Ctrl_Set_Flash_Image_Offset
23001f26 g     F .text	0000000a BLSP_Clr_User_Specified_Fw
23003a3c g     F .text	0000001e Ring_Buffer_Init
23002ba2 g     F .text	00000018 memset
23006066 g     F .text	0000005c HBN_Set_BOR_Cfg
23000b52 g     F .text	00000520 main
23005754  w    F .text	0000009a HBN_OUT1_IRQHandler_Wrapper
23005dac g     F .text	0000003e GLB_Set_UART_CLK
23005754  w    F .text	0000009a SEC_GMAC_IRQHandler_Wrapper
22010590 g     F .itcm_region	0000000a SFlash_Volatile_Reg_Write_Enable
220105f4 g     F .itcm_region	0000000a SFlash_Powerdown
22010432 g     F .itcm_region	0000000a GLB_Select_External_Flash
23005754  w    F .text	0000009a clic_msip_handler_Wrapper
23006988 g     F .text	00000080 Sec_Eng_PKA_MINV
22010914 g     F .itcm_region	0000000a HBN_32K_Sel
23005f42 g     F .text	000000ba EF_Ctrl_Read_MAC_Address
23000000 g       .text	00000000 _enter
22010124 g     F .itcm_region	00000014 BLSP_MediaBoot_Read
2201046e g     F .itcm_region	0000000a GLB_GPIO_Set_HZ
230068ea g     F .text	0000009e Sec_Eng_PKA_MMUL
23005754  w    F .text	0000009a UART1_IRQHandler_Wrapper
23006b1c g     F .text	0000005c Sec_Eng_PKA_Mont2GF
23003b82 g     F .text	00000034 xz_crc32
2300201a g     F .text	00000048 bflb_platform_deinit_uart_debug_gpio
2300559a g     F .text	00000094 SystemInit
22010734 g     F .itcm_region	0000000a SF_Ctrl_AES_Set_Key_BE
42021700 g     O .bss	00000014 shaCtx
220108a6 g     F .itcm_region	0000000a EF_Ctrl_Read_RC32M_Trim
220108ec g     F .itcm_region	0000000a GLB_Set_System_CLK
2201082e g     F .itcm_region	0000000a XIP_SFlash_Write_With_Lock
2201066c g     F .itcm_region	0000000a SFlash_Cache_Miss_Count_Get
220106b2 g     F .itcm_region	0000000a SF_Cfg_Deinit_Ext_Flash_Gpio
23005cf0 g     F .text	00000004 UART_Int_Callback_Install
22010138 g     F .itcm_region	00000010 BLSP_Sboot_Finish
22010630 g     F .itcm_region	0000000a SFlash_Set_IDbus_Cfg
2201048c g     F .itcm_region	0000000a HBN_Power_Down_Flash
23006eec g     O .text	00000100 .hidden __clz_tab
23006e0a g     F .text	0000002a bflb_platform_init_time
2201069e g     F .itcm_region	0000000a SF_Cfg_Init_Ext_Flash_Gpio
22010000 g     F .itcm_region	00000124 BLSP_Boot2_Jump_Entry
230088e8 g       *ABS*	00000000 __system_ram_load_addr
2300115c g     F .text	00000478 BLSP_MediaBoot_Main
42020000 g       .stack_dummy	00000000 __StackTop
2201073e g     F .itcm_region	0000000a SF_Ctrl_AES_Set_IV
23005d92 g     F .text	0000001a UART_GetRxFifoCount
23005754  w    F .text	0000009a GPADC_DMA_IRQHandler_Wrapper
23005754  w    F .text	0000009a MAC_TXRX_MISC_IRQHandler_Wrapper
23005754  w    F .text	0000009a DMA_ALL_IRQHandler_Wrapper
22010658 g     F .itcm_region	0000000a SFlash_Cache_Read_Enable
23001f5a g     F .text	0000003c BLSP_Is_PC_Valid
23005ca8 g     F .text	00000048 UART_IntMask
23003892 g     F .text	00000094 PtTable_Get_Active_Entries_By_Name
2300785c g     O .text	00000020 secp256r1_Gy
42014000 g       .dtcm_region	00000000 __tcm_data_start__
220105e0 g     F .itcm_region	0000000a SFlash_GetJedecId
23005754  w    F .text	0000009a BLE_IRQHandler_Wrapper
42021080 g       RAM_DATA	00000000 __ram_data_start__
23006b78 g     F .text	000000e0 bflb_platform_uart_dbg_init
230010d2 g     F .text	0000001c BLSP_MediaBoot_Pre_Jump
22010342 g     F .itcm_region	0000000a AON_Power_Off_LDO15_RF
23005754  w    F .text	0000009a SEC_SHA_IRQHandler_Wrapper
22010928 g     F .itcm_region	0000000a HBN_Power_On_Xtal_32K
42021940 g     O .bss	00000004 PtTable_Flash_Write
2201036a g     F .itcm_region	0000000a AON_LowPower_Exit_PDS0
22010784 g     F .itcm_region	0000000a SF_Ctrl_SendCmd
230078ec g     O .text	00000400 crc32Tab
23005754  w    F .text	0000009a IRRX_IRQHandler_Wrapper
220106e4 g     F .itcm_region	0000000a SF_Ctrl_Enable
23005754  w    F .text	0000009a BMX_TO_IRQHandler_Wrapper
22010162 g     F .itcm_region	00000060 BLSP_Boot2_Get_Efuse_Cfg
23005754  w    F .text	0000009a TIMER_CH1_IRQHandler_Wrapper
22010356 g     F .itcm_region	0000000a AON_Power_Off_SFReg
220107a2 g     F .itcm_region	0000000a SF_Ctrl_GetBusyState
2300650a g     F .text	00000054 Sec_Eng_Trng_Enable
220102e8 g     F .itcm_region	0000000a BLSP_Boot2_Get_Log_Disable_Flag
23005754  w    F .text	0000009a UART0_IRQHandler_Wrapper
220107d4 g     F .itcm_region	0000000a XIP_SFlash_State_Restore
230077bc g     O .text	00000020 secp256r1_BAR2
23005bfe g     F .text	00000034 UART_Enable
4202109c g       RAM_DATA	00000000 __ram_data_end__
220104aa g     F .itcm_region	0000000a HBN_Set_Ldo11_Aon_Vout
23005754  w    F .text	0000009a BMX_ERR_IRQHandler_Wrapper
22010572 g     F .itcm_region	0000000a SFlash_Busy
2201095a g     F .itcm_region	0000000a PDS_Trim_RC32M
23001e44 g     F .text	00000034 BLSP_Boot2_Verify_XZ_Header
230026bc g     F .text	000004ce bflb_ecdsa_verify
220103b0 g     F .itcm_region	0000000a BL602_MemSet
23005754  w    F .text	0000009a WIFI_IPC_PUBLIC_IRQHandler_Wrapper
4201fc00 g       *ABS*	00000000 __StackLimit
22010806 g     F .itcm_region	0000000a XIP_SFlash_GetDeviceId_Need_Lock
22010676 g     F .itcm_region	0000000a SFlash_Cache_Read_Disable
220105fe g     F .itcm_region	0000000a SFlash_Releae_Powerdown
2300775c g     O .text	00000020 secp256r1_1
00000400 g       *ABS*	00000000 StackSize
220103ba g     F .itcm_region	0000000a BL602_MemSet4
23006008 g     F .text	00000040 EF_Ctrl_Read_AES_Key
23005754  w    F .text	0000009a L1C_BMX_TO_IRQHandler_Wrapper
4202192d g     O .bss	00000001 psMode
230076bc g     O .text	00000020 secp256r1InvR_P
23006e3a g     F .text	00000058 bflb_platform_init
23006718 g     F .text	00000064 Sec_Eng_PKA_CREG
23004b94 g     F .text	0000002c xz_dec_lzma2_end
22010496 g     F .itcm_region	0000000a HBN_Enable
22010798 g     F .itcm_region	0000000a SF_Ctrl_Icache2_Set
22010888 g     F .itcm_region	0000000a AON_Get_Xtal_CapCode
220107ac g     F .itcm_region	0000000a SF_Ctrl_Is_AES_Enable
220104be g     F .itcm_region	0000000a HBN_Set_Ldo11_Soc_Vout
220102be g     F .itcm_region	0000000a BLSP_Boot2_Get_TX_GPIO
230036b0 g     F .text	0000001a strlen
2201059a g     F .itcm_region	0000000a SFlash_Chip_Erase
220108ce g     F .itcm_region	0000000a GLB_Get_BCLK_Div
22010392 g     F .itcm_region	0000000a BL602_MemCpy
230058ce g     F .text	00000010 clic_disable_interrupt
22010874 g     F .itcm_region	0000000a AON_Power_On_XTAL
220104a0 g     F .itcm_region	0000000a HBN_Reset
22010360 g     F .itcm_region	0000000a AON_LowPower_Enter_PDS0
2300789c g     O .text	00000020 secp256r1_Zeroy
22010388 g     F .itcm_region	0000000a BL602_Delay_MS
22010000 g       .itcm_region	00000000 __tcm_code_start__
23003b64 g     F .text	0000001c Ring_Buffer_Get_Empty_Length
23001810 g     F .text	0000010c BLSP_Boot_Parse_PKey
220106bc g     F .itcm_region	0000000a SF_Cfg_Restore_GPIO17_Fun
220104c8 g     F .itcm_region	0000000a HBN_Hw_Pu_Pd_Cfg
22010306 g     F .itcm_region	0000000a BLSP_Boot2_Get_Baudrate
2201022e g     F .itcm_region	00000090 BLSP_Boot2_Set_Cache
4202165c g     O .bss	00000050 efuseCfg
220107fc g     F .itcm_region	0000000a XIP_SFlash_GetJedecId_Need_Lock
2300191c g     F .text	000000ca BLSP_Boot_Parse_Signature
2300677c g     F .text	0000006a Sec_Eng_PKA_Move_Data
23006048 g     F .text	00000014 HBN_Set_UART_CLK_Sel
23006582 g     F .text	00000012 Sec_Eng_PKA_BigEndian_Enable
2300554a g     F .text	00000042 simple_malloc
230062bc g     F .text	00000012 Sec_Eng_SHA_Start
42021080 g       .system_ram_data_region	00000000 __system_ram_data_end__
23006ad6 g     F .text	00000046 Sec_Eng_PKA_GF2Mont
22010374 g     F .itcm_region	0000000a ASM_Delay_Us
22010540 g     F .itcm_region	0000000a SEC_Eng_Turn_Off_Sec_Ring
22010950 g     F .itcm_region	0000000a HBN_Trim_RC32K
23005754  w    F .text	0000009a BZ_PHY_IRQHandler_Wrapper
23005e1e g     F .text	00000010 GLB_Set_EM_Sel
2201098c g     F .itcm_region	0000000a PDS_Disable_PLL_All_Clks
22010478 g     F .itcm_region	0000000a GLB_GPIO_Get_Fun
2201070c g     F .itcm_region	0000000a SF_Ctrl_AES_Enable_BE
23005754  w    F .text	0000009a RF_TOP_INT0_IRQHandler_Wrapper
2300655e g     F .text	00000014 Sec_Eng_Trng_Disable
23005754  w    F .text	0000009a IRTX_IRQHandler_Wrapper
220105d6 g     F .itcm_region	0000000a SFlash_GetUniqueId
230067e6 g     F .text	0000009e Sec_Eng_PKA_MSUB
23005754  w    F .text	0000009a BOR_IRQHandler_Wrapper
2201041e g     F .itcm_region	0000000a GLB_SW_POR_Reset
42014000 g       .dtcm_region	00000000 __tcm_data_end__



Disassembly of section .text:

23000000 <__text_code_start__>:
__text_code_start__():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/entry.S:25
23000000:	1f022197          	auipc	gp,0x1f022
23000004:	88018193          	addi	gp,gp,-1920 # 42021880 <__global_pointer$>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/entry.S:30
23000008:	30047073          	csrci	mstatus,8
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/entry.S:34
2300000c:	00005297          	auipc	t0,0x5
23000010:	7f428293          	addi	t0,t0,2036 # 23005800 <Trap_Handler_Stub>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/entry.S:36
23000014:	0032e293          	ori	t0,t0,3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/entry.S:37
23000018:	30529073          	csrw	mtvec,t0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/entry.S:39
2300001c:	00000293          	li	t0,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/entry.S:40
23000020:	00028463          	beqz	t0,23000028 <__text_code_start__+0x28>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/entry.S:41
23000024:	7c105073          	csrwi	0x7c1,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/entry.S:50
23000028:	1f020117          	auipc	sp,0x1f020
2300002c:	fd810113          	addi	sp,sp,-40 # 42020000 <__StackTop>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/entry.S:54
23000030:	00000297          	auipc	t0,0x0
23000034:	09028293          	addi	t0,t0,144 # 230000c0 <__Vectors>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/entry.S:55
23000038:	30729073          	csrw	mtvt,t0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/entry.S:60
2300003c:	301022f3          	csrr	t0,misa
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/entry.S:61
23000040:	0202f293          	andi	t0,t0,32
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/entry.S:62
23000044:	00028763          	beqz	t0,23000052 <__text_code_start__+0x52>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/entry.S:64
23000048:	6299                	lui	t0,0x6
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/entry.S:65
2300004a:	3002a073          	csrs	mstatus,t0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/entry.S:66
2300004e:	00301073          	fscsr	zero
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/entry.S:76
23000052:	548050ef          	jal	ra,2300559a <SystemInit>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/entry.S:79
23000056:	5d8050ef          	jal	ra,2300562e <start_load>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/entry.S:84
2300005a:	f1402573          	csrr	a0,mhartid
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/entry.S:85
2300005e:	4581                	li	a1,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/entry.S:86
23000060:	4601                	li	a2,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/entry.S:87
23000062:	2f1000ef          	jal	ra,23000b52 <main>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/entry.S:92
23000066:	dd000097          	auipc	ra,0xdd000
2300006a:	f9a08093          	addi	ra,ra,-102 # 0 <__metal_chicken_bit>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/entry.S:93
2300006e:	00008363          	beqz	ra,23000074 <__text_code_start__+0x74>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/entry.S:94
23000072:	9082                	jalr	ra
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/entry.S:99
23000074:	00000297          	auipc	t0,0x0
23000078:	00c28293          	addi	t0,t0,12 # 23000080 <__text_code_start__+0x80>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/entry.S:100
2300007c:	30529073          	csrw	mtvec,t0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/entry.S:102
23000080:	00002303          	lw	t1,0(zero) # 0 <__metal_chicken_bit>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/entry.S:103
23000084:	bff5                	j	23000080 <__text_code_start__+0x80>
	...

230000c0 <__Vectors>:
	...
230000cc:	5754 2300 0000 0000 0000 0000 0000 0000     TW.#............
230000dc:	5754 2300 0004 0000 1007 0000 0002 0001     TW.#............
230000ec:	5754 2300 5754 2300 8480 001e 0000 0000     TW.#TW.#........
230000fc:	0000 0000 5754 2300 5754 2300 5754 2300     ....TW.#TW.#TW.#
2300010c:	5754 2300 5754 2300 5754 2300 5754 2300     TW.#TW.#TW.#TW.#
2300011c:	5754 2300 5754 2300 5754 2300 5754 2300     TW.#TW.#TW.#TW.#
2300012c:	5754 2300 5754 2300 5754 2300 5754 2300     TW.#TW.#TW.#TW.#
2300013c:	5754 2300 0000 0000 0000 0000 0000 0000     TW.#............
2300014c:	5754 2300 5754 2300 0000 0000 0000 0000     TW.#TW.#........
2300015c:	5754 2300 0000 0000 5754 2300 5754 2300     TW.#....TW.#TW.#
2300016c:	5754 2300 0000 0000 5754 2300 5754 2300     TW.#....TW.#TW.#
2300017c:	0000 0000 5754 2300 0000 0000 5754 2300     ....TW.#....TW.#
2300018c:	0000 0000 5754 2300 5754 2300 5754 2300     ....TW.#TW.#TW.#
	...
230001b0:	5754 2300 0000 0000 0000 0000 0000 0000     TW.#............
	...
230001c8:	5754 2300 5754 2300 5754 2300 5754 2300     TW.#TW.#TW.#TW.#
230001d8:	5754 2300 5754 2300 5754 2300 5754 2300     TW.#TW.#TW.#TW.#
230001e8:	5754 2300 5754 2300 5754 2300 5754 2300     TW.#TW.#TW.#TW.#
230001f8:	5754 2300 5754 2300 0000                    TW.#TW.#..

23000202 <memmove>:
memmove():
23000202:	04a5f363          	bgeu	a1,a0,23000248 <memmove+0x46>
23000206:	00c586b3          	add	a3,a1,a2
2300020a:	02d57f63          	bgeu	a0,a3,23000248 <memmove+0x46>
2300020e:	fff64593          	not	a1,a2
23000212:	4781                	li	a5,0
23000214:	17fd                	addi	a5,a5,-1
23000216:	00f59363          	bne	a1,a5,2300021c <memmove+0x1a>
2300021a:	8082                	ret
2300021c:	00f68733          	add	a4,a3,a5
23000220:	00074803          	lbu	a6,0(a4)
23000224:	00c78733          	add	a4,a5,a2
23000228:	972a                	add	a4,a4,a0
2300022a:	01070023          	sb	a6,0(a4)
2300022e:	b7dd                	j	23000214 <memmove+0x12>
23000230:	00f58733          	add	a4,a1,a5
23000234:	00074683          	lbu	a3,0(a4)
23000238:	00f50733          	add	a4,a0,a5
2300023c:	0785                	addi	a5,a5,1
2300023e:	00d70023          	sb	a3,0(a4)
23000242:	fef617e3          	bne	a2,a5,23000230 <memmove+0x2e>
23000246:	8082                	ret
23000248:	4781                	li	a5,0
2300024a:	bfe5                	j	23000242 <memmove+0x40>

2300024c <__udivdi3>:
__udivdi3():
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1319
2300024c:	87ae                	mv	a5,a1
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1024
2300024e:	8832                	mv	a6,a2
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1025
23000250:	8736                	mv	a4,a3
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1026
23000252:	832a                	mv	t1,a0
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1064
23000254:	20069663          	bnez	a3,23000460 <__udivdi3+0x214>
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1066
23000258:	00007897          	auipc	a7,0x7
2300025c:	c9488893          	addi	a7,a7,-876 # 23006eec <__clz_tab>
23000260:	0ac5fe63          	bgeu	a1,a2,2300031c <__udivdi3+0xd0>
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1070
23000264:	6741                	lui	a4,0x10
23000266:	0ae67463          	bgeu	a2,a4,2300030e <__udivdi3+0xc2>
2300026a:	0ff00713          	li	a4,255
2300026e:	00c73733          	sltu	a4,a4,a2
23000272:	070e                	slli	a4,a4,0x3
23000274:	00e656b3          	srl	a3,a2,a4
23000278:	98b6                	add	a7,a7,a3
2300027a:	0008c683          	lbu	a3,0(a7)
2300027e:	9736                	add	a4,a4,a3
23000280:	02000693          	li	a3,32
23000284:	8e99                	sub	a3,a3,a4
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1072
23000286:	ca99                	beqz	a3,2300029c <__udivdi3+0x50>
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1078
23000288:	00d797b3          	sll	a5,a5,a3
2300028c:	00e55733          	srl	a4,a0,a4
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1077
23000290:	00d61833          	sll	a6,a2,a3
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1078
23000294:	00f765b3          	or	a1,a4,a5
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1079
23000298:	00d51333          	sll	t1,a0,a3
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1082
2300029c:	01085513          	srli	a0,a6,0x10
230002a0:	02a5f733          	remu	a4,a1,a0
230002a4:	01081613          	slli	a2,a6,0x10
230002a8:	8241                	srli	a2,a2,0x10
230002aa:	01035693          	srli	a3,t1,0x10
230002ae:	02a5d5b3          	divu	a1,a1,a0
230002b2:	0742                	slli	a4,a4,0x10
230002b4:	8ed9                	or	a3,a3,a4
230002b6:	02b607b3          	mul	a5,a2,a1
230002ba:	872e                	mv	a4,a1
230002bc:	00f6fc63          	bgeu	a3,a5,230002d4 <__udivdi3+0x88>
230002c0:	96c2                	add	a3,a3,a6
230002c2:	fff58713          	addi	a4,a1,-1
230002c6:	0106e763          	bltu	a3,a6,230002d4 <__udivdi3+0x88>
230002ca:	00f6f563          	bgeu	a3,a5,230002d4 <__udivdi3+0x88>
230002ce:	ffe58713          	addi	a4,a1,-2
230002d2:	96c2                	add	a3,a3,a6
230002d4:	8e9d                	sub	a3,a3,a5
230002d6:	02a6f7b3          	remu	a5,a3,a0
230002da:	0342                	slli	t1,t1,0x10
230002dc:	01035313          	srli	t1,t1,0x10
230002e0:	02a6d6b3          	divu	a3,a3,a0
230002e4:	07c2                	slli	a5,a5,0x10
230002e6:	0067e333          	or	t1,a5,t1
230002ea:	02d605b3          	mul	a1,a2,a3
230002ee:	8536                	mv	a0,a3
230002f0:	00b37b63          	bgeu	t1,a1,23000306 <__udivdi3+0xba>
230002f4:	9342                	add	t1,t1,a6
230002f6:	fff68513          	addi	a0,a3,-1
230002fa:	01036663          	bltu	t1,a6,23000306 <__udivdi3+0xba>
230002fe:	00b37463          	bgeu	t1,a1,23000306 <__udivdi3+0xba>
23000302:	ffe68513          	addi	a0,a3,-2
23000306:	0742                	slli	a4,a4,0x10
23000308:	8f49                	or	a4,a4,a0
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1209
2300030a:	4581                	li	a1,0
2300030c:	a84d                	j	230003be <__udivdi3+0x172>
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1070
2300030e:	010006b7          	lui	a3,0x1000
23000312:	4741                	li	a4,16
23000314:	f6d660e3          	bltu	a2,a3,23000274 <__udivdi3+0x28>
23000318:	4761                	li	a4,24
2300031a:	bfa9                	j	23000274 <__udivdi3+0x28>
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1091
2300031c:	e601                	bnez	a2,23000324 <__udivdi3+0xd8>
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1092
2300031e:	4685                	li	a3,1
23000320:	02c6d833          	divu	a6,a3,a2
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1094
23000324:	66c1                	lui	a3,0x10
23000326:	08d87e63          	bgeu	a6,a3,230003c2 <__udivdi3+0x176>
2300032a:	0ff00693          	li	a3,255
2300032e:	0106f363          	bgeu	a3,a6,23000334 <__udivdi3+0xe8>
23000332:	4721                	li	a4,8
23000334:	00e856b3          	srl	a3,a6,a4
23000338:	98b6                	add	a7,a7,a3
2300033a:	0008c683          	lbu	a3,0(a7)
2300033e:	96ba                	add	a3,a3,a4
23000340:	02000713          	li	a4,32
23000344:	8f15                	sub	a4,a4,a3
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1096
23000346:	e749                	bnez	a4,230003d0 <__udivdi3+0x184>
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1105
23000348:	410787b3          	sub	a5,a5,a6
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1106
2300034c:	4585                	li	a1,1
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1124
2300034e:	01085613          	srli	a2,a6,0x10
23000352:	01081893          	slli	a7,a6,0x10
23000356:	0108d893          	srli	a7,a7,0x10
2300035a:	01035693          	srli	a3,t1,0x10
2300035e:	02c7f733          	remu	a4,a5,a2
23000362:	02c7d7b3          	divu	a5,a5,a2
23000366:	0742                	slli	a4,a4,0x10
23000368:	8ed9                	or	a3,a3,a4
2300036a:	02f88533          	mul	a0,a7,a5
2300036e:	873e                	mv	a4,a5
23000370:	00a6fc63          	bgeu	a3,a0,23000388 <__udivdi3+0x13c>
23000374:	96c2                	add	a3,a3,a6
23000376:	fff78713          	addi	a4,a5,-1
2300037a:	0106e763          	bltu	a3,a6,23000388 <__udivdi3+0x13c>
2300037e:	00a6f563          	bgeu	a3,a0,23000388 <__udivdi3+0x13c>
23000382:	ffe78713          	addi	a4,a5,-2
23000386:	96c2                	add	a3,a3,a6
23000388:	8e89                	sub	a3,a3,a0
2300038a:	02c6f7b3          	remu	a5,a3,a2
2300038e:	0342                	slli	t1,t1,0x10
23000390:	01035313          	srli	t1,t1,0x10
23000394:	02c6d6b3          	divu	a3,a3,a2
23000398:	07c2                	slli	a5,a5,0x10
2300039a:	0067e333          	or	t1,a5,t1
2300039e:	02d888b3          	mul	a7,a7,a3
230003a2:	8536                	mv	a0,a3
230003a4:	01137b63          	bgeu	t1,a7,230003ba <__udivdi3+0x16e>
230003a8:	9342                	add	t1,t1,a6
230003aa:	fff68513          	addi	a0,a3,-1 # ffff <StackSize+0xfbff>
230003ae:	01036663          	bltu	t1,a6,230003ba <__udivdi3+0x16e>
230003b2:	01137463          	bgeu	t1,a7,230003ba <__udivdi3+0x16e>
230003b6:	ffe68513          	addi	a0,a3,-2
230003ba:	0742                	slli	a4,a4,0x10
230003bc:	8f49                	or	a4,a4,a0
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1321
230003be:	853a                	mv	a0,a4
230003c0:	8082                	ret
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1094
230003c2:	010006b7          	lui	a3,0x1000
230003c6:	4741                	li	a4,16
230003c8:	f6d866e3          	bltu	a6,a3,23000334 <__udivdi3+0xe8>
230003cc:	4761                	li	a4,24
230003ce:	b79d                	j	23000334 <__udivdi3+0xe8>
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1114
230003d0:	00e81833          	sll	a6,a6,a4
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1115
230003d4:	00d7d5b3          	srl	a1,a5,a3
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1117
230003d8:	00e51333          	sll	t1,a0,a4
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1116
230003dc:	00d556b3          	srl	a3,a0,a3
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1119
230003e0:	01085513          	srli	a0,a6,0x10
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1116
230003e4:	00e797b3          	sll	a5,a5,a4
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1119
230003e8:	02a5f733          	remu	a4,a1,a0
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1116
230003ec:	00f6e8b3          	or	a7,a3,a5
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1119
230003f0:	01081793          	slli	a5,a6,0x10
230003f4:	83c1                	srli	a5,a5,0x10
230003f6:	0108d613          	srli	a2,a7,0x10
230003fa:	02a5d5b3          	divu	a1,a1,a0
230003fe:	0742                	slli	a4,a4,0x10
23000400:	8f51                	or	a4,a4,a2
23000402:	02b786b3          	mul	a3,a5,a1
23000406:	862e                	mv	a2,a1
23000408:	00d77c63          	bgeu	a4,a3,23000420 <__udivdi3+0x1d4>
2300040c:	9742                	add	a4,a4,a6
2300040e:	fff58613          	addi	a2,a1,-1
23000412:	01076763          	bltu	a4,a6,23000420 <__udivdi3+0x1d4>
23000416:	00d77563          	bgeu	a4,a3,23000420 <__udivdi3+0x1d4>
2300041a:	ffe58613          	addi	a2,a1,-2
2300041e:	9742                	add	a4,a4,a6
23000420:	40d706b3          	sub	a3,a4,a3
23000424:	02a6f733          	remu	a4,a3,a0
23000428:	08c2                	slli	a7,a7,0x10
2300042a:	0108d893          	srli	a7,a7,0x10
2300042e:	02a6d6b3          	divu	a3,a3,a0
23000432:	0742                	slli	a4,a4,0x10
23000434:	02d785b3          	mul	a1,a5,a3
23000438:	011767b3          	or	a5,a4,a7
2300043c:	8736                	mv	a4,a3
2300043e:	00b7fc63          	bgeu	a5,a1,23000456 <__udivdi3+0x20a>
23000442:	97c2                	add	a5,a5,a6
23000444:	fff68713          	addi	a4,a3,-1 # ffffff <StackSize+0xfffbff>
23000448:	0107e763          	bltu	a5,a6,23000456 <__udivdi3+0x20a>
2300044c:	00b7f563          	bgeu	a5,a1,23000456 <__udivdi3+0x20a>
23000450:	ffe68713          	addi	a4,a3,-2
23000454:	97c2                	add	a5,a5,a6
23000456:	8f8d                	sub	a5,a5,a1
23000458:	01061593          	slli	a1,a2,0x10
2300045c:	8dd9                	or	a1,a1,a4
2300045e:	bdc5                	j	2300034e <__udivdi3+0x102>
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1140
23000460:	14d5e263          	bltu	a1,a3,230005a4 <__udivdi3+0x358>
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1159
23000464:	6741                	lui	a4,0x10
23000466:	02e6fe63          	bgeu	a3,a4,230004a2 <__udivdi3+0x256>
2300046a:	0ff00813          	li	a6,255
2300046e:	00d83733          	sltu	a4,a6,a3
23000472:	070e                	slli	a4,a4,0x3
23000474:	00e6d833          	srl	a6,a3,a4
23000478:	00007597          	auipc	a1,0x7
2300047c:	a7458593          	addi	a1,a1,-1420 # 23006eec <__clz_tab>
23000480:	95c2                	add	a1,a1,a6
23000482:	0005c803          	lbu	a6,0(a1)
23000486:	02000593          	li	a1,32
2300048a:	983a                	add	a6,a6,a4
2300048c:	410585b3          	sub	a1,a1,a6
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1160
23000490:	e185                	bnez	a1,230004b0 <__udivdi3+0x264>
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1172
23000492:	4705                	li	a4,1
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1170
23000494:	f2f6e5e3          	bltu	a3,a5,230003be <__udivdi3+0x172>
23000498:	00c53533          	sltu	a0,a0,a2
2300049c:	00154713          	xori	a4,a0,1
230004a0:	bf39                	j	230003be <__udivdi3+0x172>
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1159
230004a2:	010005b7          	lui	a1,0x1000
230004a6:	4741                	li	a4,16
230004a8:	fcb6e6e3          	bltu	a3,a1,23000474 <__udivdi3+0x228>
230004ac:	4761                	li	a4,24
230004ae:	b7d9                	j	23000474 <__udivdi3+0x228>
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1194
230004b0:	01065733          	srl	a4,a2,a6
230004b4:	00b696b3          	sll	a3,a3,a1
230004b8:	8ed9                	or	a3,a3,a4
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1200
230004ba:	0106de93          	srli	t4,a3,0x10
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1196
230004be:	0107d733          	srl	a4,a5,a6
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1200
230004c2:	03d778b3          	remu	a7,a4,t4
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1197
230004c6:	00b797b3          	sll	a5,a5,a1
230004ca:	01055833          	srl	a6,a0,a6
230004ce:	00f86333          	or	t1,a6,a5
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1200
230004d2:	01069793          	slli	a5,a3,0x10
230004d6:	83c1                	srli	a5,a5,0x10
230004d8:	01035813          	srli	a6,t1,0x10
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1195
230004dc:	00b61633          	sll	a2,a2,a1
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1200
230004e0:	03d75733          	divu	a4,a4,t4
230004e4:	08c2                	slli	a7,a7,0x10
230004e6:	0108e833          	or	a6,a7,a6
230004ea:	02e78f33          	mul	t5,a5,a4
230004ee:	8e3a                	mv	t3,a4
230004f0:	01e87c63          	bgeu	a6,t5,23000508 <__udivdi3+0x2bc>
230004f4:	9836                	add	a6,a6,a3
230004f6:	fff70e13          	addi	t3,a4,-1 # ffff <StackSize+0xfbff>
230004fa:	00d86763          	bltu	a6,a3,23000508 <__udivdi3+0x2bc>
230004fe:	01e87563          	bgeu	a6,t5,23000508 <__udivdi3+0x2bc>
23000502:	ffe70e13          	addi	t3,a4,-2
23000506:	9836                	add	a6,a6,a3
23000508:	41e80833          	sub	a6,a6,t5
2300050c:	03d878b3          	remu	a7,a6,t4
23000510:	03d85833          	divu	a6,a6,t4
23000514:	08c2                	slli	a7,a7,0x10
23000516:	03078eb3          	mul	t4,a5,a6
2300051a:	01031793          	slli	a5,t1,0x10
2300051e:	83c1                	srli	a5,a5,0x10
23000520:	00f8e7b3          	or	a5,a7,a5
23000524:	8742                	mv	a4,a6
23000526:	01d7fc63          	bgeu	a5,t4,2300053e <__udivdi3+0x2f2>
2300052a:	97b6                	add	a5,a5,a3
2300052c:	fff80713          	addi	a4,a6,-1
23000530:	00d7e763          	bltu	a5,a3,2300053e <__udivdi3+0x2f2>
23000534:	01d7f563          	bgeu	a5,t4,2300053e <__udivdi3+0x2f2>
23000538:	ffe80713          	addi	a4,a6,-2
2300053c:	97b6                	add	a5,a5,a3
2300053e:	0e42                	slli	t3,t3,0x10
23000540:	41d787b3          	sub	a5,a5,t4
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1201
23000544:	6ec1                	lui	t4,0x10
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1200
23000546:	00ee6733          	or	a4,t3,a4
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1201
2300054a:	fffe8813          	addi	a6,t4,-1 # ffff <StackSize+0xfbff>
2300054e:	01077333          	and	t1,a4,a6
23000552:	01075893          	srli	a7,a4,0x10
23000556:	01067833          	and	a6,a2,a6
2300055a:	8241                	srli	a2,a2,0x10
2300055c:	03030e33          	mul	t3,t1,a6
23000560:	03088833          	mul	a6,a7,a6
23000564:	010e5693          	srli	a3,t3,0x10
23000568:	02c30333          	mul	t1,t1,a2
2300056c:	9342                	add	t1,t1,a6
2300056e:	969a                	add	a3,a3,t1
23000570:	02c888b3          	mul	a7,a7,a2
23000574:	0106f363          	bgeu	a3,a6,2300057a <__udivdi3+0x32e>
23000578:	98f6                	add	a7,a7,t4
2300057a:	0106d613          	srli	a2,a3,0x10
2300057e:	98b2                	add	a7,a7,a2
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1203
23000580:	0317e063          	bltu	a5,a7,230005a0 <__udivdi3+0x354>
23000584:	d91793e3          	bne	a5,a7,2300030a <__udivdi3+0xbe>
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1201
23000588:	67c1                	lui	a5,0x10
2300058a:	17fd                	addi	a5,a5,-1
2300058c:	8efd                	and	a3,a3,a5
2300058e:	06c2                	slli	a3,a3,0x10
23000590:	00fe7e33          	and	t3,t3,a5
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1198
23000594:	00b51533          	sll	a0,a0,a1
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1201
23000598:	96f2                	add	a3,a3,t3
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1209
2300059a:	4581                	li	a1,0
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1203
2300059c:	e2d571e3          	bgeu	a0,a3,230003be <__udivdi3+0x172>
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1205
230005a0:	177d                	addi	a4,a4,-1
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1206
230005a2:	b3a5                	j	2300030a <__udivdi3+0xbe>
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1145
230005a4:	4581                	li	a1,0
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1144
230005a6:	4701                	li	a4,0
230005a8:	bd19                	j	230003be <__udivdi3+0x172>

230005aa <__umoddi3>:
__udivmoddi4():
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1024
230005aa:	88b2                	mv	a7,a2
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1025
230005ac:	8736                	mv	a4,a3
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1026
230005ae:	87aa                	mv	a5,a0
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1027
230005b0:	882e                	mv	a6,a1
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1064
230005b2:	1c069863          	bnez	a3,23000782 <__umoddi3+0x1d8>
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1066
230005b6:	00007697          	auipc	a3,0x7
230005ba:	93668693          	addi	a3,a3,-1738 # 23006eec <__clz_tab>
230005be:	0ac5f863          	bgeu	a1,a2,2300066e <__umoddi3+0xc4>
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1070
230005c2:	6341                	lui	t1,0x10
230005c4:	08667e63          	bgeu	a2,t1,23000660 <__umoddi3+0xb6>
230005c8:	0ff00313          	li	t1,255
230005cc:	00c37363          	bgeu	t1,a2,230005d2 <__umoddi3+0x28>
230005d0:	4721                	li	a4,8
230005d2:	00e65333          	srl	t1,a2,a4
230005d6:	969a                	add	a3,a3,t1
230005d8:	0006ce03          	lbu	t3,0(a3)
230005dc:	02000313          	li	t1,32
230005e0:	9e3a                	add	t3,t3,a4
230005e2:	41c30333          	sub	t1,t1,t3
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1072
230005e6:	00030c63          	beqz	t1,230005fe <__umoddi3+0x54>
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1078
230005ea:	006595b3          	sll	a1,a1,t1
230005ee:	01c55e33          	srl	t3,a0,t3
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1077
230005f2:	006618b3          	sll	a7,a2,t1
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1078
230005f6:	00be6833          	or	a6,t3,a1
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1079
230005fa:	006517b3          	sll	a5,a0,t1
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1082
230005fe:	0108d613          	srli	a2,a7,0x10
23000602:	02c87733          	remu	a4,a6,a2
23000606:	01089513          	slli	a0,a7,0x10
2300060a:	8141                	srli	a0,a0,0x10
2300060c:	0107d693          	srli	a3,a5,0x10
23000610:	02c85833          	divu	a6,a6,a2
23000614:	0742                	slli	a4,a4,0x10
23000616:	8ed9                	or	a3,a3,a4
23000618:	03050833          	mul	a6,a0,a6
2300061c:	0106f863          	bgeu	a3,a6,2300062c <__umoddi3+0x82>
23000620:	96c6                	add	a3,a3,a7
23000622:	0116e563          	bltu	a3,a7,2300062c <__umoddi3+0x82>
23000626:	0106f363          	bgeu	a3,a6,2300062c <__umoddi3+0x82>
2300062a:	96c6                	add	a3,a3,a7
2300062c:	410686b3          	sub	a3,a3,a6
23000630:	02c6f733          	remu	a4,a3,a2
23000634:	07c2                	slli	a5,a5,0x10
23000636:	83c1                	srli	a5,a5,0x10
23000638:	02c6d6b3          	divu	a3,a3,a2
2300063c:	02d506b3          	mul	a3,a0,a3
23000640:	01071513          	slli	a0,a4,0x10
23000644:	8fc9                	or	a5,a5,a0
23000646:	00d7f863          	bgeu	a5,a3,23000656 <__umoddi3+0xac>
2300064a:	97c6                	add	a5,a5,a7
2300064c:	0117e563          	bltu	a5,a7,23000656 <__umoddi3+0xac>
23000650:	00d7f363          	bgeu	a5,a3,23000656 <__umoddi3+0xac>
23000654:	97c6                	add	a5,a5,a7
23000656:	8f95                	sub	a5,a5,a3
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1131
23000658:	0067d533          	srl	a0,a5,t1
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1133
2300065c:	4581                	li	a1,0
__umoddi3():
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1313
2300065e:	8082                	ret
__udivmoddi4():
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1070
23000660:	01000337          	lui	t1,0x1000
23000664:	4741                	li	a4,16
23000666:	f66666e3          	bltu	a2,t1,230005d2 <__umoddi3+0x28>
2300066a:	4761                	li	a4,24
2300066c:	b79d                	j	230005d2 <__umoddi3+0x28>
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1091
2300066e:	e601                	bnez	a2,23000676 <__umoddi3+0xcc>
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1092
23000670:	4605                	li	a2,1
23000672:	031658b3          	divu	a7,a2,a7
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1094
23000676:	6641                	lui	a2,0x10
23000678:	08c8f363          	bgeu	a7,a2,230006fe <__umoddi3+0x154>
2300067c:	0ff00613          	li	a2,255
23000680:	01167363          	bgeu	a2,a7,23000686 <__umoddi3+0xdc>
23000684:	4721                	li	a4,8
23000686:	00e8d633          	srl	a2,a7,a4
2300068a:	96b2                	add	a3,a3,a2
2300068c:	0006ce03          	lbu	t3,0(a3)
23000690:	02000313          	li	t1,32
23000694:	9e3a                	add	t3,t3,a4
23000696:	41c30333          	sub	t1,t1,t3
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1096
2300069a:	06031963          	bnez	t1,2300070c <__umoddi3+0x162>
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1105
2300069e:	411585b3          	sub	a1,a1,a7
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1124
230006a2:	0108d713          	srli	a4,a7,0x10
230006a6:	01089513          	slli	a0,a7,0x10
230006aa:	8141                	srli	a0,a0,0x10
230006ac:	0107d613          	srli	a2,a5,0x10
230006b0:	02e5f6b3          	remu	a3,a1,a4
230006b4:	02e5d5b3          	divu	a1,a1,a4
230006b8:	06c2                	slli	a3,a3,0x10
230006ba:	8ed1                	or	a3,a3,a2
230006bc:	02b505b3          	mul	a1,a0,a1
230006c0:	00b6f863          	bgeu	a3,a1,230006d0 <__umoddi3+0x126>
230006c4:	96c6                	add	a3,a3,a7
230006c6:	0116e563          	bltu	a3,a7,230006d0 <__umoddi3+0x126>
230006ca:	00b6f363          	bgeu	a3,a1,230006d0 <__umoddi3+0x126>
230006ce:	96c6                	add	a3,a3,a7
230006d0:	40b685b3          	sub	a1,a3,a1
230006d4:	02e5f6b3          	remu	a3,a1,a4
230006d8:	07c2                	slli	a5,a5,0x10
230006da:	83c1                	srli	a5,a5,0x10
230006dc:	02e5d5b3          	divu	a1,a1,a4
230006e0:	02b505b3          	mul	a1,a0,a1
230006e4:	01069513          	slli	a0,a3,0x10
230006e8:	8fc9                	or	a5,a5,a0
230006ea:	00b7f863          	bgeu	a5,a1,230006fa <__umoddi3+0x150>
230006ee:	97c6                	add	a5,a5,a7
230006f0:	0117e563          	bltu	a5,a7,230006fa <__umoddi3+0x150>
230006f4:	00b7f363          	bgeu	a5,a1,230006fa <__umoddi3+0x150>
230006f8:	97c6                	add	a5,a5,a7
230006fa:	8f8d                	sub	a5,a5,a1
230006fc:	bfb1                	j	23000658 <__umoddi3+0xae>
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1094
230006fe:	01000637          	lui	a2,0x1000
23000702:	4741                	li	a4,16
23000704:	f8c8e1e3          	bltu	a7,a2,23000686 <__umoddi3+0xdc>
23000708:	4761                	li	a4,24
2300070a:	bfb5                	j	23000686 <__umoddi3+0xdc>
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1114
2300070c:	006898b3          	sll	a7,a7,t1
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1115
23000710:	01c5d733          	srl	a4,a1,t3
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1117
23000714:	006517b3          	sll	a5,a0,t1
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1116
23000718:	01c55e33          	srl	t3,a0,t3
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1119
2300071c:	0108d513          	srli	a0,a7,0x10
23000720:	02a776b3          	remu	a3,a4,a0
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1116
23000724:	006595b3          	sll	a1,a1,t1
23000728:	00be6e33          	or	t3,t3,a1
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1119
2300072c:	01089593          	slli	a1,a7,0x10
23000730:	81c1                	srli	a1,a1,0x10
23000732:	010e5613          	srli	a2,t3,0x10
23000736:	02a75733          	divu	a4,a4,a0
2300073a:	06c2                	slli	a3,a3,0x10
2300073c:	8ed1                	or	a3,a3,a2
2300073e:	02e58733          	mul	a4,a1,a4
23000742:	00e6f863          	bgeu	a3,a4,23000752 <__umoddi3+0x1a8>
23000746:	96c6                	add	a3,a3,a7
23000748:	0116e563          	bltu	a3,a7,23000752 <__umoddi3+0x1a8>
2300074c:	00e6f363          	bgeu	a3,a4,23000752 <__umoddi3+0x1a8>
23000750:	96c6                	add	a3,a3,a7
23000752:	40e68633          	sub	a2,a3,a4
23000756:	02a676b3          	remu	a3,a2,a0
2300075a:	0e42                	slli	t3,t3,0x10
2300075c:	010e5e13          	srli	t3,t3,0x10
23000760:	02a65633          	divu	a2,a2,a0
23000764:	06c2                	slli	a3,a3,0x10
23000766:	02c58633          	mul	a2,a1,a2
2300076a:	01c6e5b3          	or	a1,a3,t3
2300076e:	00c5f863          	bgeu	a1,a2,2300077e <__umoddi3+0x1d4>
23000772:	95c6                	add	a1,a1,a7
23000774:	0115e563          	bltu	a1,a7,2300077e <__umoddi3+0x1d4>
23000778:	00c5f363          	bgeu	a1,a2,2300077e <__umoddi3+0x1d4>
2300077c:	95c6                	add	a1,a1,a7
2300077e:	8d91                	sub	a1,a1,a2
23000780:	b70d                	j	230006a2 <__umoddi3+0xf8>
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1140
23000782:	ecd5eee3          	bltu	a1,a3,2300065e <__umoddi3+0xb4>
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1159
23000786:	6741                	lui	a4,0x10
23000788:	04e6f563          	bgeu	a3,a4,230007d2 <__umoddi3+0x228>
2300078c:	0ff00e93          	li	t4,255
23000790:	00deb733          	sltu	a4,t4,a3
23000794:	070e                	slli	a4,a4,0x3
23000796:	00e6d333          	srl	t1,a3,a4
2300079a:	00006897          	auipc	a7,0x6
2300079e:	75288893          	addi	a7,a7,1874 # 23006eec <__clz_tab>
230007a2:	989a                	add	a7,a7,t1
230007a4:	0008ce83          	lbu	t4,0(a7)
230007a8:	02000e13          	li	t3,32
230007ac:	9eba                	add	t4,t4,a4
230007ae:	41de0e33          	sub	t3,t3,t4
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1160
230007b2:	020e1763          	bnez	t3,230007e0 <__umoddi3+0x236>
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1170
230007b6:	00b6e463          	bltu	a3,a1,230007be <__umoddi3+0x214>
230007ba:	00c56963          	bltu	a0,a2,230007cc <__umoddi3+0x222>
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1173
230007be:	40c507b3          	sub	a5,a0,a2
230007c2:	8d95                	sub	a1,a1,a3
230007c4:	00f53533          	sltu	a0,a0,a5
230007c8:	40a58833          	sub	a6,a1,a0
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1184
230007cc:	853e                	mv	a0,a5
230007ce:	85c2                	mv	a1,a6
230007d0:	b579                	j	2300065e <__umoddi3+0xb4>
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1159
230007d2:	010008b7          	lui	a7,0x1000
230007d6:	4741                	li	a4,16
230007d8:	fb16efe3          	bltu	a3,a7,23000796 <__umoddi3+0x1ec>
230007dc:	4761                	li	a4,24
230007de:	bf65                	j	23000796 <__umoddi3+0x1ec>
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1194
230007e0:	01d65733          	srl	a4,a2,t4
230007e4:	01c696b3          	sll	a3,a3,t3
230007e8:	8ed9                	or	a3,a3,a4
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1200
230007ea:	0106d813          	srli	a6,a3,0x10
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1196
230007ee:	01d5d733          	srl	a4,a1,t4
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1200
230007f2:	03077333          	remu	t1,a4,a6
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1197
230007f6:	01c595b3          	sll	a1,a1,t3
230007fa:	01d557b3          	srl	a5,a0,t4
230007fe:	8fcd                	or	a5,a5,a1
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1200
23000800:	01069593          	slli	a1,a3,0x10
23000804:	81c1                	srli	a1,a1,0x10
23000806:	0107d893          	srli	a7,a5,0x10
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1195
2300080a:	01c61633          	sll	a2,a2,t3
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1198
2300080e:	01c51533          	sll	a0,a0,t3
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1200
23000812:	03075733          	divu	a4,a4,a6
23000816:	0342                	slli	t1,t1,0x10
23000818:	011368b3          	or	a7,t1,a7
2300081c:	02e58f33          	mul	t5,a1,a4
23000820:	833a                	mv	t1,a4
23000822:	01e8fc63          	bgeu	a7,t5,2300083a <__umoddi3+0x290>
23000826:	98b6                	add	a7,a7,a3
23000828:	fff70313          	addi	t1,a4,-1 # ffff <StackSize+0xfbff>
2300082c:	00d8e763          	bltu	a7,a3,2300083a <__umoddi3+0x290>
23000830:	01e8f563          	bgeu	a7,t5,2300083a <__umoddi3+0x290>
23000834:	ffe70313          	addi	t1,a4,-2
23000838:	98b6                	add	a7,a7,a3
2300083a:	41e888b3          	sub	a7,a7,t5
2300083e:	0308ff33          	remu	t5,a7,a6
23000842:	0308d8b3          	divu	a7,a7,a6
23000846:	0f42                	slli	t5,t5,0x10
23000848:	03158833          	mul	a6,a1,a7
2300084c:	01079593          	slli	a1,a5,0x10
23000850:	81c1                	srli	a1,a1,0x10
23000852:	00bf65b3          	or	a1,t5,a1
23000856:	87c6                	mv	a5,a7
23000858:	0105fc63          	bgeu	a1,a6,23000870 <__umoddi3+0x2c6>
2300085c:	95b6                	add	a1,a1,a3
2300085e:	fff88793          	addi	a5,a7,-1 # ffffff <StackSize+0xfffbff>
23000862:	00d5e763          	bltu	a1,a3,23000870 <__umoddi3+0x2c6>
23000866:	0105f563          	bgeu	a1,a6,23000870 <__umoddi3+0x2c6>
2300086a:	ffe88793          	addi	a5,a7,-2
2300086e:	95b6                	add	a1,a1,a3
23000870:	0342                	slli	t1,t1,0x10
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1201
23000872:	6f41                	lui	t5,0x10
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1200
23000874:	00f36333          	or	t1,t1,a5
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1201
23000878:	ffff0793          	addi	a5,t5,-1 # ffff <StackSize+0xfbff>
2300087c:	00f378b3          	and	a7,t1,a5
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1200
23000880:	410585b3          	sub	a1,a1,a6
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1201
23000884:	01035313          	srli	t1,t1,0x10
23000888:	01065813          	srli	a6,a2,0x10
2300088c:	8ff1                	and	a5,a5,a2
2300088e:	02f88733          	mul	a4,a7,a5
23000892:	02f307b3          	mul	a5,t1,a5
23000896:	030888b3          	mul	a7,a7,a6
2300089a:	03030333          	mul	t1,t1,a6
2300089e:	98be                	add	a7,a7,a5
230008a0:	01075813          	srli	a6,a4,0x10
230008a4:	9846                	add	a6,a6,a7
230008a6:	00f87363          	bgeu	a6,a5,230008ac <__umoddi3+0x302>
230008aa:	937a                	add	t1,t1,t5
230008ac:	01085793          	srli	a5,a6,0x10
230008b0:	933e                	add	t1,t1,a5
230008b2:	67c1                	lui	a5,0x10
230008b4:	17fd                	addi	a5,a5,-1
230008b6:	00f87833          	and	a6,a6,a5
230008ba:	0842                	slli	a6,a6,0x10
230008bc:	8f7d                	and	a4,a4,a5
230008be:	9742                	add	a4,a4,a6
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1203
230008c0:	0065e663          	bltu	a1,t1,230008cc <__umoddi3+0x322>
230008c4:	00659c63          	bne	a1,t1,230008dc <__umoddi3+0x332>
230008c8:	00e57a63          	bgeu	a0,a4,230008dc <__umoddi3+0x332>
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1206
230008cc:	40c70633          	sub	a2,a4,a2
230008d0:	00c73733          	sltu	a4,a4,a2
230008d4:	9736                	add	a4,a4,a3
230008d6:	40e30333          	sub	t1,t1,a4
230008da:	8732                	mv	a4,a2
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1214
230008dc:	40e50733          	sub	a4,a0,a4
230008e0:	00e53533          	sltu	a0,a0,a4
230008e4:	406585b3          	sub	a1,a1,t1
230008e8:	8d89                	sub	a1,a1,a0
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1215
230008ea:	01d597b3          	sll	a5,a1,t4
230008ee:	01c75733          	srl	a4,a4,t3
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1217
230008f2:	00e7e533          	or	a0,a5,a4
230008f6:	01c5d5b3          	srl	a1,a1,t3
__umoddi3():
/scratch/carsteng/freedom-tools-qemu-src/obj/x86_64-linux-ubuntu14/build/riscv-gnu-toolchain/build-gcc-newlib-stage2/riscv64-unknown-elf/rv32imafc/ilp32f/libgcc/../../../../../riscv-gcc/libgcc/libgcc2.c:1312
230008fa:	b395                	j	2300065e <__umoddi3+0xb4>

230008fc <PtTable_Flash_Read>:
PtTable_Flash_Read():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:161
230008fc:	86b2                	mv	a3,a2
230008fe:	862e                	mv	a2,a1
23000900:	85aa                	mv	a1,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:160
23000902:	1141                	addi	sp,sp,-16
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:161
23000904:	e2c18513          	addi	a0,gp,-468 # 420216ac <flashCfg>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:160
23000908:	c606                	sw	ra,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:161
2300090a:	ff010097          	auipc	ra,0xff010
2300090e:	ee8080e7          	jalr	-280(ra) # 220107f2 <XIP_SFlash_Read_Need_Lock>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:163
23000912:	40b2                	lw	ra,12(sp)
23000914:	4501                	li	a0,0
23000916:	0141                	addi	sp,sp,16
23000918:	8082                	ret

2300091a <PtTable_Flash_Write>:
PtTable_Flash_Write():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:145
2300091a:	86b2                	mv	a3,a2
2300091c:	862e                	mv	a2,a1
2300091e:	85aa                	mv	a1,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:144
23000920:	1141                	addi	sp,sp,-16
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:145
23000922:	e2c18513          	addi	a0,gp,-468 # 420216ac <flashCfg>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:144
23000926:	c606                	sw	ra,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:145
23000928:	ff010097          	auipc	ra,0xff010
2300092c:	ec0080e7          	jalr	-320(ra) # 220107e8 <XIP_SFlash_Write_Need_Lock>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:147
23000930:	40b2                	lw	ra,12(sp)
23000932:	4501                	li	a0,0
23000934:	0141                	addi	sp,sp,16
23000936:	8082                	ret

23000938 <PtTable_Flash_Erase>:
PtTable_Flash_Erase():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:129
23000938:	862e                	mv	a2,a1
2300093a:	85aa                	mv	a1,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:128
2300093c:	1141                	addi	sp,sp,-16
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:129
2300093e:	e2c18513          	addi	a0,gp,-468 # 420216ac <flashCfg>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:128
23000942:	c606                	sw	ra,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:129
23000944:	ff010097          	auipc	ra,0xff010
23000948:	e9a080e7          	jalr	-358(ra) # 220107de <XIP_SFlash_Erase_Need_Lock>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:131
2300094c:	40b2                	lw	ra,12(sp)
2300094e:	4501                	li	a0,0
23000950:	0141                	addi	sp,sp,16
23000952:	8082                	ret

23000954 <BLSP_Boot2_Deal_One_FW>:
BLSP_Boot2_Deal_One_FW():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:293
23000954:	715d                	addi	sp,sp,-80
23000956:	c4a2                	sw	s0,72(sp)
23000958:	c0ca                	sw	s2,64(sp)
2300095a:	de4e                	sw	s3,60(sp)
2300095c:	c686                	sw	ra,76(sp)
2300095e:	c2a6                	sw	s1,68(sp)
23000960:	dc52                	sw	s4,56(sp)
23000962:	da56                	sw	s5,52(sp)
23000964:	d85a                	sw	s6,48(sp)
23000966:	d65e                	sw	s7,44(sp)
23000968:	89aa                	mv	s3,a0
2300096a:	892e                	mv	s2,a1
2300096c:	8432                	mv	s0,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:296
2300096e:	14068f63          	beqz	a3,23000acc <BLSP_Boot2_Deal_One_FW+0x178>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:297
23000972:	23007537          	lui	a0,0x23007
23000976:	85b6                	mv	a1,a3
23000978:	fec50513          	addi	a0,a0,-20 # 23006fec <__clz_tab+0x100>
2300097c:	84b6                	mv	s1,a3
2300097e:	2f4060ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:298
23000982:	85a6                	mv	a1,s1
23000984:	8622                	mv	a2,s0
23000986:	854a                	mv	a0,s2
23000988:	70b020ef          	jal	ra,23003892 <PtTable_Get_Active_Entries_By_Name>
2300098c:	84aa                	mv	s1,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:304
2300098e:	c485                	beqz	s1,230009b6 <BLSP_Boot2_Deal_One_FW+0x62>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:305
23000990:	23007537          	lui	a0,0x23007
23000994:	00850513          	addi	a0,a0,8 # 23007008 <__clz_tab+0x11c>
23000998:	2da060ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:319
2300099c:	4a05                	li	s4,1
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:320
2300099e:	40b6                	lw	ra,76(sp)
230009a0:	4426                	lw	s0,72(sp)
230009a2:	8552                	mv	a0,s4
230009a4:	4496                	lw	s1,68(sp)
230009a6:	4906                	lw	s2,64(sp)
230009a8:	59f2                	lw	s3,60(sp)
230009aa:	5a62                	lw	s4,56(sp)
230009ac:	5ad2                	lw	s5,52(sp)
230009ae:	5b42                	lw	s6,48(sp)
230009b0:	5bb2                	lw	s7,44(sp)
230009b2:	6161                	addi	sp,sp,80
230009b4:	8082                	ret
BLSP_Dump_PtEntry():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:191
230009b6:	23007537          	lui	a0,0x23007
230009ba:	00340593          	addi	a1,s0,3
230009be:	01c50513          	addi	a0,a0,28 # 2300701c <__clz_tab+0x130>
230009c2:	2b0060ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:192
230009c6:	500c                	lw	a1,32(s0)
230009c8:	23007537          	lui	a0,0x23007
230009cc:	02850513          	addi	a0,a0,40 # 23007028 <__clz_tab+0x13c>
230009d0:	2a2060ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:193
230009d4:	00244583          	lbu	a1,2(s0)
230009d8:	23007537          	lui	a0,0x23007
230009dc:	03450513          	addi	a0,a0,52 # 23007034 <__clz_tab+0x148>
230009e0:	292060ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:194
230009e4:	00244783          	lbu	a5,2(s0)
230009e8:	23007537          	lui	a0,0x23007
230009ec:	04850513          	addi	a0,a0,72 # 23007048 <__clz_tab+0x15c>
230009f0:	078a                	slli	a5,a5,0x2
230009f2:	97a2                	add	a5,a5,s0
230009f4:	47cc                	lw	a1,12(a5)
230009f6:	27c060ef          	jal	ra,23006c72 <bflb_platform_printf>
BLSP_Boot2_Deal_One_FW():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:308
230009fa:	23007537          	lui	a0,0x23007
230009fe:	06050513          	addi	a0,a0,96 # 23007060 <__clz_tab+0x174>
23000a02:	270060ef          	jal	ra,23006c72 <bflb_platform_printf>
BLSP_Boot2_Check_XZ_FW():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:211
23000a06:	00244783          	lbu	a5,2(s0)
23000a0a:	4619                	li	a2,6
23000a0c:	082c                	addi	a1,sp,24
23000a0e:	078a                	slli	a5,a5,0x2
23000a10:	97a2                	add	a5,a5,s0
23000a12:	47c8                	lw	a0,12(a5)
23000a14:	ff00f097          	auipc	ra,0xff00f
23000a18:	710080e7          	jalr	1808(ra) # 22010124 <BLSP_MediaBoot_Read>
23000a1c:	e961                	bnez	a0,23000aec <BLSP_Boot2_Deal_One_FW+0x198>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:215
23000a1e:	ff010097          	auipc	ra,0xff010
23000a22:	8de080e7          	jalr	-1826(ra) # 220102fc <BLSP_Boot2_Dump_Critical_Flag>
23000a26:	e971                	bnez	a0,23000afa <BLSP_Boot2_Deal_One_FW+0x1a6>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:218
23000a28:	0828                	addi	a0,sp,24
23000a2a:	41a010ef          	jal	ra,23001e44 <BLSP_Boot2_Verify_XZ_Header>
23000a2e:	4785                	li	a5,1
23000a30:	8a2a                	mv	s4,a0
23000a32:	0cf50863          	beq	a0,a5,23000b02 <BLSP_Boot2_Deal_One_FW+0x1ae>
BLSP_Boot2_Deal_One_FW():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:313
23000a36:	00244783          	lbu	a5,2(s0)
23000a3a:	4705                	li	a4,1
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:319
23000a3c:	4a05                	li	s4,1
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:313
23000a3e:	f6f770e3          	bgeu	a4,a5,2300099e <BLSP_Boot2_Deal_One_FW+0x4a>
BLSP_Boot2_Do_FW_Copy():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:246
23000a42:	fff7c713          	not	a4,a5
23000a46:	8b05                	andi	a4,a4,1
23000a48:	070a                	slli	a4,a4,0x2
23000a4a:	9722                	add	a4,a4,s0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:247
23000a4c:	00c72903          	lw	s2,12(a4)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:253
23000a50:	4b50                	lw	a2,20(a4)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:246
23000a52:	8b85                	andi	a5,a5,1
23000a54:	078a                	slli	a5,a5,0x2
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:253
23000a56:	964a                	add	a2,a2,s2
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:246
23000a58:	97a2                	add	a5,a5,s0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:253
23000a5a:	167d                	addi	a2,a2,-1
23000a5c:	85ca                	mv	a1,s2
23000a5e:	e2c18513          	addi	a0,gp,-468 # 420216ac <flashCfg>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:246
23000a62:	00c7a983          	lw	s3,12(a5) # 1000c <StackSize+0xfc0c>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:249
23000a66:	01c42a83          	lw	s5,28(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:253
23000a6a:	ff010097          	auipc	ra,0xff010
23000a6e:	d74080e7          	jalr	-652(ra) # 220107de <XIP_SFlash_Erase_Need_Lock>
23000a72:	e969                	bnez	a0,23000b44 <BLSP_Boot2_Deal_One_FW+0x1f0>
23000a74:	42020a37          	lui	s4,0x42020
23000a78:	6b85                	lui	s7,0x1
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:258
23000a7a:	000a9e63          	bnez	s5,23000a96 <BLSP_Boot2_Deal_One_FW+0x142>
23000a7e:	a871                	j	23000b1a <BLSP_Boot2_Deal_One_FW+0x1c6>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:267
23000a80:	e2c18513          	addi	a0,gp,-468 # 420216ac <flashCfg>
23000a84:	ff010097          	auipc	ra,0xff010
23000a88:	d64080e7          	jalr	-668(ra) # 220107e8 <XIP_SFlash_Write_Need_Lock>
23000a8c:	e545                	bnez	a0,23000b34 <BLSP_Boot2_Deal_One_FW+0x1e0>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:271
23000a8e:	99a2                	add	s3,s3,s0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:272
23000a90:	9922                	add	s2,s2,s0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:258
23000a92:	0954f463          	bgeu	s1,s5,23000b1a <BLSP_Boot2_Deal_One_FW+0x1c6>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:259
23000a96:	409a8433          	sub	s0,s5,s1
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:263
23000a9a:	000a0593          	mv	a1,s4
23000a9e:	854e                	mv	a0,s3
23000aa0:	008bf363          	bgeu	s7,s0,23000aa6 <BLSP_Boot2_Deal_One_FW+0x152>
23000aa4:	6405                	lui	s0,0x1
23000aa6:	8622                	mv	a2,s0
23000aa8:	ff00f097          	auipc	ra,0xff00f
23000aac:	67c080e7          	jalr	1660(ra) # 22010124 <BLSP_MediaBoot_Read>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:267
23000ab0:	85ca                	mv	a1,s2
23000ab2:	86a2                	mv	a3,s0
23000ab4:	000a0613          	mv	a2,s4
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:273
23000ab8:	94a2                	add	s1,s1,s0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:263
23000aba:	d179                	beqz	a0,23000a80 <BLSP_Boot2_Deal_One_FW+0x12c>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:264
23000abc:	23007537          	lui	a0,0x23007
23000ac0:	0b450513          	addi	a0,a0,180 # 230070b4 <__clz_tab+0x1c8>
23000ac4:	1ae060ef          	jal	ra,23006c72 <bflb_platform_printf>
BLSP_Boot2_Deal_One_FW():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:319
23000ac8:	4a05                	li	s4,1
23000aca:	bdd1                	j	2300099e <BLSP_Boot2_Deal_One_FW+0x4a>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:300
23000acc:	23007537          	lui	a0,0x23007
23000ad0:	85ba                	mv	a1,a4
23000ad2:	ff850513          	addi	a0,a0,-8 # 23006ff8 <__clz_tab+0x10c>
23000ad6:	c63a                	sw	a4,12(sp)
23000ad8:	19a060ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:301
23000adc:	4732                	lw	a4,12(sp)
23000ade:	8622                	mv	a2,s0
23000ae0:	854a                	mv	a0,s2
23000ae2:	85ba                	mv	a1,a4
23000ae4:	54b020ef          	jal	ra,2300382e <PtTable_Get_Active_Entries_By_ID>
23000ae8:	84aa                	mv	s1,a0
23000aea:	b555                	j	2300098e <BLSP_Boot2_Deal_One_FW+0x3a>
BLSP_Boot2_Check_XZ_FW():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:212
23000aec:	23007537          	lui	a0,0x23007
23000af0:	06c50513          	addi	a0,a0,108 # 2300706c <__clz_tab+0x180>
23000af4:	17e060ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:213
23000af8:	bf3d                	j	23000a36 <BLSP_Boot2_Deal_One_FW+0xe2>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:216
23000afa:	4599                	li	a1,6
23000afc:	0828                	addi	a0,sp,24
23000afe:	2b95                	jal	23001072 <BLSP_Dump_Data>
23000b00:	b725                	j	23000a28 <BLSP_Boot2_Deal_One_FW+0xd4>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:219
23000b02:	23007537          	lui	a0,0x23007
23000b06:	07c50513          	addi	a0,a0,124 # 2300707c <__clz_tab+0x190>
23000b0a:	168060ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:220
23000b0e:	8622                	mv	a2,s0
23000b10:	85ca                	mv	a1,s2
23000b12:	854e                	mv	a0,s3
23000b14:	266010ef          	jal	ra,23001d7a <BLSP_Boot2_Update_Fw>
23000b18:	e119                	bnez	a0,23000b1e <BLSP_Boot2_Deal_One_FW+0x1ca>
BLSP_Boot2_Deal_One_FW():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:315
23000b1a:	4a01                	li	s4,0
23000b1c:	b549                	j	2300099e <BLSP_Boot2_Deal_One_FW+0x4a>
BLSP_Boot2_Check_XZ_FW():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:223
23000b1e:	23007537          	lui	a0,0x23007
23000b22:	08850513          	addi	a0,a0,136 # 23007088 <__clz_tab+0x19c>
23000b26:	14c060ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:225
23000b2a:	00040123          	sb	zero,2(s0) # 1002 <StackSize+0xc02>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:226
23000b2e:	00042623          	sw	zero,12(s0)
BLSP_Boot2_Deal_One_FW():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:313
23000b32:	b5b5                	j	2300099e <BLSP_Boot2_Deal_One_FW+0x4a>
BLSP_Boot2_Do_FW_Copy():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:268
23000b34:	23007537          	lui	a0,0x23007
23000b38:	0d050513          	addi	a0,a0,208 # 230070d0 <__clz_tab+0x1e4>
23000b3c:	136060ef          	jal	ra,23006c72 <bflb_platform_printf>
BLSP_Boot2_Deal_One_FW():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:319
23000b40:	4a05                	li	s4,1
23000b42:	bdb1                	j	2300099e <BLSP_Boot2_Deal_One_FW+0x4a>
BLSP_Boot2_Do_FW_Copy():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:254
23000b44:	23007537          	lui	a0,0x23007
23000b48:	0a050513          	addi	a0,a0,160 # 230070a0 <__clz_tab+0x1b4>
23000b4c:	126060ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:255
23000b50:	b5b9                	j	2300099e <BLSP_Boot2_Deal_One_FW+0x4a>

23000b52 <main>:
main():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:397
23000b52:	a2010113          	addi	sp,sp,-1504
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:402
23000b56:	04800613          	li	a2,72
23000b5a:	4581                	li	a1,0
23000b5c:	08c8                	addi	a0,sp,84
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:397
23000b5e:	5c112e23          	sw	ra,1500(sp)
23000b62:	5c812c23          	sw	s0,1496(sp)
23000b66:	5b912a23          	sw	s9,1460(sp)
23000b6a:	5c912a23          	sw	s1,1492(sp)
23000b6e:	5d212823          	sw	s2,1488(sp)
23000b72:	5d312623          	sw	s3,1484(sp)
23000b76:	5d412423          	sw	s4,1480(sp)
23000b7a:	5d512223          	sw	s5,1476(sp)
23000b7e:	5d612023          	sw	s6,1472(sp)
23000b82:	5b712e23          	sw	s7,1468(sp)
23000b86:	5b812c23          	sw	s8,1464(sp)
23000b8a:	5ba12823          	sw	s10,1456(sp)
23000b8e:	5bb12623          	sw	s11,1452(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:402
23000b92:	010020ef          	jal	ra,23002ba2 <memset>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:412
23000b96:	05c00613          	li	a2,92
23000b9a:	4581                	li	a1,0
23000b9c:	0968                	addi	a0,sp,156
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:403
23000b9e:	ce02                	sw	zero,28(sp)
23000ba0:	d002                	sw	zero,32(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:404
23000ba2:	00011c23          	sh	zero,24(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:406
23000ba6:	d202                	sw	zero,36(sp)
23000ba8:	d402                	sw	zero,40(sp)
23000baa:	02010623          	sb	zero,44(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:412
23000bae:	7f5010ef          	jal	ra,23002ba2 <memset>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:418
23000bb2:	2c6010ef          	jal	ra,23001e78 <BLSP_Boot2_Disable_Other_Cache>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:421
23000bb6:	2c4010ef          	jal	ra,23001e7a <BLSP_Boot2_Flush_XIP_Cache>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:422
23000bba:	1808                	addi	a0,sp,48
23000bbc:	ff00f097          	auipc	ra,0xff00f
23000bc0:	58c080e7          	jalr	1420(ra) # 22010148 <BLSP_Boot2_Get_Clk_Cfg>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:423
23000bc4:	e2c18593          	addi	a1,gp,-468 # 420216ac <flashCfg>
23000bc8:	4501                	li	a0,0
23000bca:	ff010097          	auipc	ra,0xff010
23000bce:	afc080e7          	jalr	-1284(ra) # 220106c6 <SF_Cfg_Get_Flash_Cfg_Need_Lock>
23000bd2:	e2c18413          	addi	s0,gp,-468 # 420216ac <flashCfg>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:424
23000bd6:	00044783          	lbu	a5,0(s0)
23000bda:	8bbd                	andi	a5,a5,15
23000bdc:	00f40023          	sb	a5,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:425
23000be0:	29a010ef          	jal	ra,23001e7a <BLSP_Boot2_Flush_XIP_Cache>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:427
23000be4:	ff00f097          	auipc	ra,0xff00f
23000be8:	704080e7          	jalr	1796(ra) # 220102e8 <BLSP_Boot2_Get_Log_Disable_Flag>
23000bec:	2e0060ef          	jal	ra,23006ecc <bflb_platform_print_set>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:428
23000bf0:	ff00f097          	auipc	ra,0xff00f
23000bf4:	716080e7          	jalr	1814(ra) # 22010306 <BLSP_Boot2_Get_Baudrate>
23000bf8:	242060ef          	jal	ra,23006e3a <bflb_platform_init>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:429
23000bfc:	238060ef          	jal	ra,23006e34 <bflb_platform_deinit_time>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:430
23000c00:	ff00f097          	auipc	ra,0xff00f
23000c04:	6c8080e7          	jalr	1736(ra) # 220102c8 <BLSP_Boot2_Get_Feature_Flag>
23000c08:	4789                	li	a5,2
23000c0a:	42f50e63          	beq	a0,a5,23001046 <main+0x4f4>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:432
23000c0e:	ff00f097          	auipc	ra,0xff00f
23000c12:	6ba080e7          	jalr	1722(ra) # 220102c8 <BLSP_Boot2_Get_Feature_Flag>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:433
23000c16:	23007637          	lui	a2,0x23007
23000c1a:	230075b7          	lui	a1,0x23007
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:432
23000c1e:	4785                	li	a5,1
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:433
23000c20:	0e460613          	addi	a2,a2,228 # 230070e4 <__clz_tab+0x1f8>
23000c24:	0f058593          	addi	a1,a1,240 # 230070f0 <__clz_tab+0x204>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:432
23000c28:	42f50e63          	beq	a0,a5,23001064 <main+0x512>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:435
23000c2c:	23007537          	lui	a0,0x23007
23000c30:	12c50513          	addi	a0,a0,300 # 2300712c <__clz_tab+0x240>
23000c34:	03e060ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:440
23000c38:	230075b7          	lui	a1,0x23007
23000c3c:	23007537          	lui	a0,0x23007
23000c40:	14458593          	addi	a1,a1,324 # 23007144 <__clz_tab+0x258>
23000c44:	17050513          	addi	a0,a0,368 # 23007170 <__clz_tab+0x284>
23000c48:	02a060ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:441
23000c4c:	230075b7          	lui	a1,0x23007
23000c50:	23007537          	lui	a0,0x23007
23000c54:	18058593          	addi	a1,a1,384 # 23007180 <__clz_tab+0x294>
23000c58:	1ac50513          	addi	a0,a0,428 # 230071ac <__clz_tab+0x2c0>
23000c5c:	016060ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:442
23000c60:	230075b7          	lui	a1,0x23007
23000c64:	23007537          	lui	a0,0x23007
23000c68:	1bc58593          	addi	a1,a1,444 # 230071bc <__clz_tab+0x2d0>
23000c6c:	1e850513          	addi	a0,a0,488 # 230071e8 <__clz_tab+0x2fc>
23000c70:	002060ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:444
23000c74:	ff00f097          	auipc	ra,0xff00f
23000c78:	688080e7          	jalr	1672(ra) # 220102fc <BLSP_Boot2_Dump_Critical_Flag>
23000c7c:	3a051d63          	bnez	a0,23001036 <main+0x4e4>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:449
23000c80:	23007537          	lui	a0,0x23007
23000c84:	1f850513          	addi	a0,a0,504 # 230071f8 <__clz_tab+0x30c>
23000c88:	7eb050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:450
23000c8c:	ddc18513          	addi	a0,gp,-548 # 4202165c <efuseCfg>
23000c90:	ff00f097          	auipc	ra,0xff00f
23000c94:	4d2080e7          	jalr	1234(ra) # 22010162 <BLSP_Boot2_Get_Efuse_Cfg>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:453
23000c98:	204010ef          	jal	ra,23001e9c <BLSP_Boot2_Reset_Sec_Eng>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:455
23000c9c:	ff00f097          	auipc	ra,0xff00f
23000ca0:	62c080e7          	jalr	1580(ra) # 220102c8 <BLSP_Boot2_Get_Feature_Flag>
23000ca4:	38051263          	bnez	a0,23001028 <main+0x4d6>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:459
23000ca8:	0ac18913          	addi	s2,gp,172 # 4202192c <cpuCount>
23000cac:	4785                	li	a5,1
23000cae:	00f90023          	sb	a5,0(s2)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:463
23000cb2:	204010ef          	jal	ra,23001eb6 <BLSP_Read_Power_Save_Mode>
23000cb6:	0aa186a3          	sb	a0,173(gp) # 4202192d <psMode>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:466
23000cba:	262010ef          	jal	ra,23001f1c <BLSP_Get_User_Specified_Fw>
23000cbe:	85aa                	mv	a1,a0
23000cc0:	4611                	li	a2,4
23000cc2:	1048                	addi	a0,sp,36
23000cc4:	ff00f097          	auipc	ra,0xff00f
23000cc8:	6e2080e7          	jalr	1762(ra) # 220103a6 <BL602_MemCpy_Fast>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:467
23000ccc:	ff00f097          	auipc	ra,0xff00f
23000cd0:	626080e7          	jalr	1574(ra) # 220102f2 <BLSP_Boot2_8M_Support_Flag>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:469
23000cd4:	23001637          	lui	a2,0x23001
23000cd8:	230015b7          	lui	a1,0x23001
23000cdc:	23001537          	lui	a0,0x23001
23000ce0:	8fc60613          	addi	a2,a2,-1796 # 230008fc <PtTable_Flash_Read>
23000ce4:	91a58593          	addi	a1,a1,-1766 # 2300091a <PtTable_Flash_Write>
23000ce8:	93850513          	addi	a0,a0,-1736 # 23000938 <PtTable_Flash_Erase>
23000cec:	2a5020ef          	jal	ra,23003790 <PtTable_Set_Flash_Operation>
23000cf0:	0b018793          	addi	a5,gp,176 # 42021930 <userHashIgnored>
23000cf4:	c43e                	sw	a5,8(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:528
23000cf6:	230007b7          	lui	a5,0x23000
23000cfa:	07a1                	addi	a5,a5,8
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:469
23000cfc:	4c01                	li	s8,0
23000cfe:	23007437          	lui	s0,0x23007
23000d02:	23007bb7          	lui	s7,0x23007
23000d06:	23007b37          	lui	s6,0x23007
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:481
23000d0a:	25400493          	li	s1,596
BLSP_Boot2_Get_MFG_StartReq():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:367
23000d0e:	0002fdb7          	lui	s11,0x2f
main():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:528
23000d12:	c63e                	sw	a5,12(sp)
BLSP_Boot2_Get_MFG_StartReq():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:370
23000d14:	4985                	li	s3,1
main():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:478
23000d16:	4a89                	li	s5,2
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:485
23000d18:	03000a13          	li	s4,48
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:495
23000d1c:	03100d13          	li	s10,49
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:477
23000d20:	19a8                	addi	a0,sp,248
23000d22:	28d020ef          	jal	ra,230037ae <PtTable_Get_Active_Partition_Need_Lock>
23000d26:	00a10ba3          	sb	a0,23(sp)
23000d2a:	85aa                	mv	a1,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:478
23000d2c:	2d550863          	beq	a0,s5,23000ffc <main+0x4aa>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:481
23000d30:	029507b3          	mul	a5,a0,s1
23000d34:	5a010713          	addi	a4,sp,1440
23000d38:	21cb8513          	addi	a0,s7,540 # 2300721c <__clz_tab+0x330>
23000d3c:	97ba                	add	a5,a5,a4
23000d3e:	b607a603          	lw	a2,-1184(a5) # 22fffb60 <__tcm_code_end__+0xfef1ac>
23000d42:	731050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:483
23000d46:	01714503          	lbu	a0,23(sp)
BLSP_Boot2_Get_MFG_StartReq():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:364
23000d4a:	19bc                	addi	a5,sp,248
23000d4c:	08d0                	addi	a2,sp,84
main():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:483
23000d4e:	02950533          	mul	a0,a0,s1
BLSP_Boot2_Get_MFG_StartReq():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:364
23000d52:	230b0593          	addi	a1,s6,560 # 23007230 <__clz_tab+0x344>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:362
23000d56:	c082                	sw	zero,64(sp)
23000d58:	c282                	sw	zero,68(sp)
23000d5a:	c482                	sw	zero,72(sp)
23000d5c:	c682                	sw	zero,76(sp)
23000d5e:	04010823          	sb	zero,80(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:364
23000d62:	953e                	add	a0,a0,a5
23000d64:	32f020ef          	jal	ra,23003892 <PtTable_Get_Active_Entries_By_Name>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:366
23000d68:	14051963          	bnez	a0,23000eba <main+0x368>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:367
23000d6c:	5586                	lw	a1,96(sp)
23000d6e:	230077b7          	lui	a5,0x23007
23000d72:	23478513          	addi	a0,a5,564 # 23007234 <__clz_tab+0x348>
23000d76:	95ee                	add	a1,a1,s11
23000d78:	6fb050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:368
23000d7c:	5586                	lw	a1,96(sp)
23000d7e:	46c1                	li	a3,16
23000d80:	0090                	addi	a2,sp,64
23000d82:	95ee                	add	a1,a1,s11
23000d84:	e2c18513          	addi	a0,gp,-468 # 420216ac <flashCfg>
23000d88:	ff010097          	auipc	ra,0xff010
23000d8c:	a6a080e7          	jalr	-1430(ra) # 220107f2 <XIP_SFlash_Read_Need_Lock>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:369
23000d90:	008c                	addi	a1,sp,64
23000d92:	17840513          	addi	a0,s0,376 # 23007178 <__clz_tab+0x28c>
23000d96:	6dd050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:370
23000d9a:	04014783          	lbu	a5,64(sp)
23000d9e:	fd078793          	addi	a5,a5,-48
23000da2:	0ff7f793          	andi	a5,a5,255
23000da6:	1af9f563          	bgeu	s3,a5,23000f50 <main+0x3fe>
main():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:485
23000daa:	01714503          	lbu	a0,23(sp)
23000dae:	02414783          	lbu	a5,36(sp)
23000db2:	19b8                	addi	a4,sp,248
23000db4:	029505b3          	mul	a1,a0,s1
23000db8:	95ba                	add	a1,a1,a4
23000dba:	13478063          	beq	a5,s4,23000eda <main+0x388>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:495
23000dbe:	01a79663          	bne	a5,s10,23000dca <main+0x278>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:495 (discriminator 1)
23000dc2:	00094783          	lbu	a5,0(s2)
23000dc6:	20f9ea63          	bltu	s3,a5,23000fda <main+0x488>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:505
23000dca:	4701                	li	a4,0
23000dcc:	4681                	li	a3,0
23000dce:	08d0                	addi	a2,sp,84
23000dd0:	3651                	jal	23000954 <BLSP_Boot2_Deal_One_FW>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:506
23000dd2:	0ff57513          	andi	a0,a0,255
23000dd6:	d529                	beqz	a0,23000d20 <main+0x1ce>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:509
23000dd8:	00094783          	lbu	a5,0(s2)
23000ddc:	00f9ff63          	bgeu	s3,a5,23000dfa <main+0x2a8>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:510
23000de0:	01714503          	lbu	a0,23(sp)
23000de4:	19bc                	addi	a5,sp,248
23000de6:	4705                	li	a4,1
23000de8:	029505b3          	mul	a1,a0,s1
23000dec:	4681                	li	a3,0
23000dee:	18b0                	addi	a2,sp,120
23000df0:	95be                	add	a1,a1,a5
23000df2:	368d                	jal	23000954 <BLSP_Boot2_Deal_One_FW>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:511
23000df4:	0ff57513          	andi	a0,a0,255
23000df8:	d505                	beqz	a0,23000d20 <main+0x1ce>
23000dfa:	8a62                	mv	s4,s8
23000dfc:	4a81                	li	s5,0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:520
23000dfe:	4581                	li	a1,0
23000e00:	4501                	li	a0,0
23000e02:	0d0010ef          	jal	ra,23001ed2 <BLSP_Boot2_Pass_Parameter>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:522
23000e06:	4591                	li	a1,4
23000e08:	01710513          	addi	a0,sp,23
23000e0c:	0c6010ef          	jal	ra,23001ed2 <BLSP_Boot2_Pass_Parameter>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:524
23000e10:	01714503          	lbu	a0,23(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:525
23000e14:	5a010793          	addi	a5,sp,1440
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:524
23000e18:	19b8                	addi	a4,sp,248
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:525
23000e1a:	02950533          	mul	a0,a0,s1
23000e1e:	97aa                	add	a5,a5,a0
23000e20:	b5e7d783          	lhu	a5,-1186(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:524
23000e24:	953a                	add	a0,a0,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:525
23000e26:	00379593          	slli	a1,a5,0x3
23000e2a:	95be                	add	a1,a1,a5
23000e2c:	058a                	slli	a1,a1,0x2
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:524
23000e2e:	05d1                	addi	a1,a1,20
23000e30:	0a2010ef          	jal	ra,23001ed2 <BLSP_Boot2_Pass_Parameter>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:527
23000e34:	05614783          	lbu	a5,86(sp)
23000e38:	5a010713          	addi	a4,sp,1440
23000e3c:	078a                	slli	a5,a5,0x2
23000e3e:	97ba                	add	a5,a5,a4
23000e40:	ac07a503          	lw	a0,-1344(a5)
23000e44:	16051c63          	bnez	a0,23000fbc <main+0x46a>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:533
23000e48:	230077b7          	lui	a5,0x23007
23000e4c:	26878513          	addi	a0,a5,616 # 23007268 <__clz_tab+0x37c>
23000e50:	623050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:534
23000e54:	00094703          	lbu	a4,0(s2)
23000e58:	c705                	beqz	a4,23000e80 <main+0x32e>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:535
23000e5a:	05614783          	lbu	a5,86(sp)
23000e5e:	5a010693          	addi	a3,sp,1440
23000e62:	078a                	slli	a5,a5,0x2
23000e64:	97b6                	add	a5,a5,a3
23000e66:	ac07a783          	lw	a5,-1344(a5)
23000e6a:	ce3e                	sw	a5,28(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:534
23000e6c:	01370a63          	beq	a4,s3,23000e80 <main+0x32e>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:535 (discriminator 3)
23000e70:	07a14783          	lbu	a5,122(sp)
23000e74:	07a5                	addi	a5,a5,9
23000e76:	078a                	slli	a5,a5,0x2
23000e78:	97b6                	add	a5,a5,a3
23000e7a:	ac07a783          	lw	a5,-1344(a5)
23000e7e:	d03e                	sw	a5,32(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:539
23000e80:	080a0063          	beqz	s4,23000f00 <main+0x3ae>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:542
23000e84:	4601                	li	a2,0
23000e86:	082c                	addi	a1,sp,24
23000e88:	0868                	addi	a0,sp,28
23000e8a:	2cc9                	jal	2300115c <BLSP_MediaBoot_Main>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:548
23000e8c:	e93a85e3          	beq	s5,s3,23000d16 <main+0x1c4>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:542
23000e90:	89aa                	mv	s3,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:576
23000e92:	23007537          	lui	a0,0x23007
23000e96:	85ce                	mv	a1,s3
23000e98:	2c850513          	addi	a0,a0,712 # 230072c8 <__clz_tab+0x3dc>
23000e9c:	5d7050ef          	jal	ra,23006c72 <bflb_platform_printf>
23000ea0:	23007437          	lui	s0,0x23007
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:578 (discriminator 1)
23000ea4:	2e040513          	addi	a0,s0,736 # 230072e0 <__clz_tab+0x3f4>
23000ea8:	5cb050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:579 (discriminator 1)
23000eac:	1f400513          	li	a0,500
23000eb0:	ff00f097          	auipc	ra,0xff00f
23000eb4:	4d8080e7          	jalr	1240(ra) # 22010388 <BL602_Delay_MS>
23000eb8:	b7f5                	j	23000ea4 <main+0x352>
BLSP_Boot2_Get_MFG_StartReq():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:378
23000eba:	230077b7          	lui	a5,0x23007
23000ebe:	25878513          	addi	a0,a5,600 # 23007258 <__clz_tab+0x36c>
23000ec2:	5b1050ef          	jal	ra,23006c72 <bflb_platform_printf>
main():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:485
23000ec6:	01714503          	lbu	a0,23(sp)
23000eca:	02414783          	lbu	a5,36(sp)
23000ece:	19b8                	addi	a4,sp,248
23000ed0:	029505b3          	mul	a1,a0,s1
23000ed4:	95ba                	add	a1,a1,a4
23000ed6:	ef4794e3          	bne	a5,s4,23000dbe <main+0x26c>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:486
23000eda:	47a2                	lw	a5,8(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:487
23000edc:	4701                	li	a4,0
23000ede:	02510693          	addi	a3,sp,37
23000ee2:	08d0                	addi	a2,sp,84
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:486
23000ee4:	0137a023          	sw	s3,0(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:487
23000ee8:	34b5                	jal	23000954 <BLSP_Boot2_Deal_One_FW>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:488
23000eea:	0ff57513          	andi	a0,a0,255
23000eee:	e20509e3          	beqz	a0,23000d20 <main+0x1ce>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:500
23000ef2:	034010ef          	jal	ra,23001f26 <BLSP_Clr_User_Specified_Fw>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:503
23000ef6:	4a05                	li	s4,1
23000ef8:	02010223          	sb	zero,36(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:502
23000efc:	4a85                	li	s5,1
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:503
23000efe:	b701                	j	23000dfe <main+0x2ac>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:540
23000f00:	4605                	li	a2,1
23000f02:	082c                	addi	a1,sp,24
23000f04:	0868                	addi	a0,sp,28
23000f06:	2c99                	jal	2300115c <BLSP_MediaBoot_Main>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:556
23000f08:	230077b7          	lui	a5,0x23007
23000f0c:	85aa                	mv	a1,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:540
23000f0e:	89aa                	mv	s3,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:556
23000f10:	27878513          	addi	a0,a5,632 # 23007278 <__clz_tab+0x38c>
23000f14:	55f050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:557
23000f18:	230077b7          	lui	a5,0x23007
23000f1c:	28c78513          	addi	a0,a5,652 # 2300728c <__clz_tab+0x3a0>
23000f20:	553050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:558
23000f24:	00094783          	lbu	a5,0(s2)
23000f28:	d7ad                	beqz	a5,23000e92 <main+0x340>
23000f2a:	05410a93          	addi	s5,sp,84
23000f2e:	4c01                	li	s8,0
23000f30:	4a01                	li	s4,0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:559
23000f32:	083c                	addi	a5,sp,24
23000f34:	97d2                	add	a5,a5,s4
23000f36:	0007c783          	lbu	a5,0(a5)
23000f3a:	e3a1                	bnez	a5,23000f7a <main+0x428>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:558 (discriminator 2)
23000f3c:	00094783          	lbu	a5,0(s2)
23000f40:	0a05                	addi	s4,s4,1
23000f42:	024a8a93          	addi	s5,s5,36
23000f46:	fefa66e3          	bltu	s4,a5,23000f32 <main+0x3e0>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:567
23000f4a:	dc0c15e3          	bnez	s8,23000d14 <main+0x1c2>
23000f4e:	b791                	j	23000e92 <main+0x340>
BLSP_Boot2_Get_MFG_StartReq():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:371
23000f50:	0088                	addi	a0,sp,64
23000f52:	75e020ef          	jal	ra,230036b0 <strlen>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:372
23000f56:	47a1                	li	a5,8
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:371
23000f58:	862a                	mv	a2,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:372
23000f5a:	e4a7e8e3          	bltu	a5,a0,23000daa <main+0x258>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:373
23000f5e:	008c                	addi	a1,sp,64
23000f60:	1048                	addi	a0,sp,36
23000f62:	ff00f097          	auipc	ra,0xff00f
23000f66:	444080e7          	jalr	1092(ra) # 220103a6 <BL602_MemCpy_Fast>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:374
23000f6a:	230077b7          	lui	a5,0x23007
23000f6e:	008c                	addi	a1,sp,64
23000f70:	25478513          	addi	a0,a5,596 # 23007254 <__clz_tab+0x368>
23000f74:	4ff050ef          	jal	ra,23006c72 <bflb_platform_printf>
23000f78:	bd0d                	j	23000daa <main+0x258>
main():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:560
23000f7a:	230077b7          	lui	a5,0x23007
23000f7e:	2a078513          	addi	a0,a5,672 # 230072a0 <__clz_tab+0x3b4>
23000f82:	85d2                	mv	a1,s4
23000f84:	4ef050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:561
23000f88:	01714503          	lbu	a0,23(sp)
BLSP_Boot2_Rollback_PtEntry():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:337
23000f8c:	002ac783          	lbu	a5,2(s5)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:338
23000f90:	020aa703          	lw	a4,32(s5)
main():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:561
23000f94:	029505b3          	mul	a1,a0,s1
BLSP_Boot2_Rollback_PtEntry():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:337
23000f98:	fff7c793          	not	a5,a5
23000f9c:	8b85                	andi	a5,a5,1
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:338
23000f9e:	0705                	addi	a4,a4,1
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:337
23000fa0:	00fa8123          	sb	a5,2(s5)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:339
23000fa4:	19bc                	addi	a5,sp,248
23000fa6:	8656                	mv	a2,s5
23000fa8:	00153513          	seqz	a0,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:338
23000fac:	02eaa023          	sw	a4,32(s5)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:339
23000fb0:	95be                	add	a1,a1,a5
23000fb2:	175020ef          	jal	ra,23003926 <PtTable_Update_Entry>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:340
23000fb6:	e135                	bnez	a0,2300101a <main+0x4c8>
main():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:562
23000fb8:	4c05                	li	s8,1
23000fba:	b749                	j	23000f3c <main+0x3ea>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:528
23000fbc:	47b2                	lw	a5,12(sp)
23000fbe:	096c                	addi	a1,sp,156
23000fc0:	05c00613          	li	a2,92
23000fc4:	953e                	add	a0,a0,a5
23000fc6:	ff010097          	auipc	ra,0xff010
23000fca:	854080e7          	jalr	-1964(ra) # 2201081a <XIP_SFlash_Read_Via_Cache_Need_Lock>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:530
23000fce:	05c00593          	li	a1,92
23000fd2:	0968                	addi	a0,sp,156
23000fd4:	6ff000ef          	jal	ra,23001ed2 <BLSP_Boot2_Pass_Parameter>
23000fd8:	bd85                	j	23000e48 <main+0x2f6>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:496
23000fda:	4705                	li	a4,1
23000fdc:	02510693          	addi	a3,sp,37
23000fe0:	18b0                	addi	a2,sp,120
23000fe2:	3a8d                	jal	23000954 <BLSP_Boot2_Deal_One_FW>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:497
23000fe4:	0ff57513          	andi	a0,a0,255
23000fe8:	f00515e3          	bnez	a0,23000ef2 <main+0x3a0>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:477
23000fec:	19a8                	addi	a0,sp,248
23000fee:	7c0020ef          	jal	ra,230037ae <PtTable_Get_Active_Partition_Need_Lock>
23000ff2:	00a10ba3          	sb	a0,23(sp)
23000ff6:	85aa                	mv	a1,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:478
23000ff8:	d3551ce3          	bne	a0,s5,23000d30 <main+0x1de>
23000ffc:	230074b7          	lui	s1,0x23007
BLSP_Boot2_On_Error():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:176
23001000:	17840513          	addi	a0,s0,376
23001004:	20c48593          	addi	a1,s1,524 # 2300720c <__clz_tab+0x320>
23001008:	46b050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:177
2300100c:	1f400513          	li	a0,500
23001010:	ff00f097          	auipc	ra,0xff00f
23001014:	378080e7          	jalr	888(ra) # 22010388 <BL602_Delay_MS>
23001018:	b7e5                	j	23001000 <main+0x4ae>
BLSP_Boot2_Rollback_PtEntry():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:341
2300101a:	230077b7          	lui	a5,0x23007
2300101e:	2b078513          	addi	a0,a5,688 # 230072b0 <__clz_tab+0x3c4>
23001022:	451050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:342
23001026:	bf19                	j	23000f3c <main+0x3ea>
main():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:457
23001028:	68b000ef          	jal	ra,23001eb2 <BLSP_Boot2_Get_CPU_Count>
2300102c:	0ac18913          	addi	s2,gp,172 # 4202192c <cpuCount>
23001030:	00a90023          	sb	a0,0(s2)
23001034:	b9bd                	j	23000cb2 <main+0x160>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:445
23001036:	1808                	addi	a0,sp,48
23001038:	45c1                	li	a1,16
2300103a:	2825                	jal	23001072 <BLSP_Dump_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:446
2300103c:	45c1                	li	a1,16
2300103e:	e2c18513          	addi	a0,gp,-468 # 420216ac <flashCfg>
23001042:	2805                	jal	23001072 <BLSP_Dump_Data>
23001044:	b935                	j	23000c80 <main+0x12e>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:431
23001046:	23007637          	lui	a2,0x23007
2300104a:	230075b7          	lui	a1,0x23007
2300104e:	23007537          	lui	a0,0x23007
23001052:	0e460613          	addi	a2,a2,228 # 230070e4 <__clz_tab+0x1f8>
23001056:	0f058593          	addi	a1,a1,240 # 230070f0 <__clz_tab+0x204>
2300105a:	0fc50513          	addi	a0,a0,252 # 230070fc <__clz_tab+0x210>
2300105e:	415050ef          	jal	ra,23006c72 <bflb_platform_printf>
23001062:	bed9                	j	23000c38 <main+0xe6>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot2.c:433
23001064:	23007537          	lui	a0,0x23007
23001068:	11450513          	addi	a0,a0,276 # 23007114 <__clz_tab+0x228>
2300106c:	407050ef          	jal	ra,23006c72 <bflb_platform_printf>
23001070:	b6e1                	j	23000c38 <main+0xe6>

23001072 <BLSP_Dump_Data>:
BLSP_Dump_Data():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:106
23001072:	1101                	addi	sp,sp,-32
23001074:	c452                	sw	s4,8(sp)
23001076:	ce06                	sw	ra,28(sp)
23001078:	cc22                	sw	s0,24(sp)
2300107a:	ca26                	sw	s1,20(sp)
2300107c:	c84a                	sw	s2,16(sp)
2300107e:	c64e                	sw	s3,12(sp)
23001080:	23008a37          	lui	s4,0x23008
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:110
23001084:	02b05c63          	blez	a1,230010bc <BLSP_Dump_Data+0x4a>
23001088:	892a                	mv	s2,a0
2300108a:	84ae                	mv	s1,a1
2300108c:	4401                	li	s0,0
2300108e:	23008a37          	lui	s4,0x23008
23001092:	230079b7          	lui	s3,0x23007
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:111
23001096:	00f47793          	andi	a5,s0,15
2300109a:	e791                	bnez	a5,230010a6 <BLSP_Dump_Data+0x34>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:112 (discriminator 1)
2300109c:	d88a0513          	addi	a0,s4,-632 # 23007d88 <crc32Tab+0x49c>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:111 (discriminator 1)
230010a0:	c019                	beqz	s0,230010a6 <BLSP_Dump_Data+0x34>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:112
230010a2:	3d1050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:114 (discriminator 2)
230010a6:	008907b3          	add	a5,s2,s0
230010aa:	0007c583          	lbu	a1,0(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:110 (discriminator 2)
230010ae:	0405                	addi	s0,s0,1
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:114 (discriminator 2)
230010b0:	2f498513          	addi	a0,s3,756 # 230072f4 <__clz_tab+0x408>
230010b4:	3bf050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:110 (discriminator 2)
230010b8:	fc849fe3          	bne	s1,s0,23001096 <BLSP_Dump_Data+0x24>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:117
230010bc:	4462                	lw	s0,24(sp)
230010be:	40f2                	lw	ra,28(sp)
230010c0:	44d2                	lw	s1,20(sp)
230010c2:	4942                	lw	s2,16(sp)
230010c4:	49b2                	lw	s3,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:116
230010c6:	d88a0513          	addi	a0,s4,-632
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:117
230010ca:	4a22                	lw	s4,8(sp)
230010cc:	6105                	addi	sp,sp,32
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:116
230010ce:	3a50506f          	j	23006c72 <bflb_platform_printf>

230010d2 <BLSP_MediaBoot_Pre_Jump>:
BLSP_MediaBoot_Pre_Jump():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:128
230010d2:	1141                	addi	sp,sp,-16
230010d4:	c606                	sw	ra,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:130
230010d6:	5c7000ef          	jal	ra,23001e9c <BLSP_Boot2_Reset_Sec_Eng>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:133
230010da:	5b9050ef          	jal	ra,23006e92 <bflb_platform_deinit>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:136
230010de:	ff00f097          	auipc	ra,0xff00f
230010e2:	f22080e7          	jalr	-222(ra) # 22010000 <BLSP_Boot2_Jump_Entry>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:139
230010e6:	40b2                	lw	ra,12(sp)
230010e8:	4501                	li	a0,0
230010ea:	0141                	addi	sp,sp,16
230010ec:	8082                	ret

230010ee <BLSP_MediaBoot_Read_Signaure>:
BLSP_MediaBoot_Read_Signaure():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:150
230010ee:	1101                	addi	sp,sp,-32
230010f0:	cc22                	sw	s0,24(sp)
BLSP_MediaBoot_Read():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:338
230010f2:	23000437          	lui	s0,0x23000
BLSP_MediaBoot_Read_Signaure():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:150
230010f6:	ca26                	sw	s1,20(sp)
230010f8:	c84a                	sw	s2,16(sp)
BLSP_MediaBoot_Read():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:338
230010fa:	4611                	li	a2,4
BLSP_MediaBoot_Read_Signaure():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:150
230010fc:	84aa                	mv	s1,a0
230010fe:	892e                	mv	s2,a1
BLSP_MediaBoot_Read():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:338
23001100:	9522                	add	a0,a0,s0
23001102:	006c                	addi	a1,sp,12
BLSP_MediaBoot_Read_Signaure():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:150
23001104:	ce06                	sw	ra,28(sp)
BLSP_MediaBoot_Read():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:338
23001106:	ff00f097          	auipc	ra,0xff00f
2300110a:	714080e7          	jalr	1812(ra) # 2201081a <XIP_SFlash_Read_Via_Cache_Need_Lock>
BLSP_MediaBoot_Read_Signaure():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:161
2300110e:	4632                	lw	a2,12(sp)
23001110:	10000793          	li	a5,256
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:162
23001114:	20d00513          	li	a0,525
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:161
23001118:	02c7ec63          	bltu	a5,a2,23001150 <BLSP_MediaBoot_Read_Signaure+0x62>
BLSP_MediaBoot_Read():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:338
2300111c:	00440513          	addi	a0,s0,4 # 23000004 <__text_code_start__+0x4>
23001120:	420205b7          	lui	a1,0x42020
23001124:	0611                	addi	a2,a2,4
23001126:	00458593          	addi	a1,a1,4 # 42020004 <__StackTop+0x4>
2300112a:	9526                	add	a0,a0,s1
2300112c:	ff00f097          	auipc	ra,0xff00f
23001130:	6ee080e7          	jalr	1774(ra) # 2201081a <XIP_SFlash_Read_Via_Cache_Need_Lock>
BLSP_MediaBoot_Read_Signaure():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:170
23001134:	42020537          	lui	a0,0x42020
23001138:	4611                	li	a2,4
2300113a:	006c                	addi	a1,sp,12
2300113c:	00050513          	mv	a0,a0
23001140:	ff00f097          	auipc	ra,0xff00f
23001144:	266080e7          	jalr	614(ra) # 220103a6 <BL602_MemCpy_Fast>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:172
23001148:	47b2                	lw	a5,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:174
2300114a:	4501                	li	a0,0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:172
2300114c:	00f92023          	sw	a5,0(s2)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:175
23001150:	40f2                	lw	ra,28(sp)
23001152:	4462                	lw	s0,24(sp)
23001154:	44d2                	lw	s1,20(sp)
23001156:	4942                	lw	s2,16(sp)
23001158:	6105                	addi	sp,sp,32
2300115a:	8082                	ret

2300115c <BLSP_MediaBoot_Main>:
BLSP_MediaBoot_Main():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:354
2300115c:	711d                	addi	sp,sp,-96
2300115e:	c8ca                	sw	s2,80(sp)
23001160:	892a                	mv	s2,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:360
23001162:	23007537          	lui	a0,0x23007
23001166:	2fc50513          	addi	a0,a0,764 # 230072fc <__clz_tab+0x410>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:354
2300116a:	ce86                	sw	ra,92(sp)
2300116c:	cca2                	sw	s0,88(sp)
2300116e:	caa6                	sw	s1,84(sp)
23001170:	c6ce                	sw	s3,76(sp)
23001172:	de5e                	sw	s7,60(sp)
23001174:	dc62                	sw	s8,56(sp)
23001176:	c632                	sw	a2,12(sp)
23001178:	8c2e                	mv	s8,a1
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:364
2300117a:	42021437          	lui	s0,0x42021
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:354
2300117e:	c4d2                	sw	s4,72(sp)
23001180:	c2d6                	sw	s5,68(sp)
23001182:	c0da                	sw	s6,64(sp)
23001184:	da66                	sw	s9,52(sp)
23001186:	d86a                	sw	s10,48(sp)
23001188:	d66e                	sw	s11,44(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:360
2300118a:	2e9050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:364
2300118e:	2e000613          	li	a2,736
23001192:	4581                	li	a1,0
23001194:	09c40513          	addi	a0,s0,156 # 4202109c <__ram_data_end__>
23001198:	20b010ef          	jal	ra,23002ba2 <memset>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:365
2300119c:	00092483          	lw	s1,0(s2)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:364
230011a0:	42021537          	lui	a0,0x42021
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:366
230011a4:	000c0023          	sb	zero,0(s8)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:364
230011a8:	2e000613          	li	a2,736
230011ac:	4581                	li	a1,0
230011ae:	37c50513          	addi	a0,a0,892 # 4202137c <__ram_data_end__+0x2e0>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:365
230011b2:	cc26                	sw	s1,24(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:364
230011b4:	1ef010ef          	jal	ra,23002ba2 <memset>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:365
230011b8:	00492703          	lw	a4,4(s2)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:371
230011bc:	0ac1c783          	lbu	a5,172(gp) # 4202192c <cpuCount>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:364
230011c0:	09c40993          	addi	s3,s0,156
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:366
230011c4:	000c00a3          	sb	zero,1(s8)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:365
230011c8:	ce3a                	sw	a4,28(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:368
230011ca:	000984a3          	sb	zero,9(s3)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:371
230011ce:	3c078363          	beqz	a5,23001594 <BLSP_MediaBoot_Main+0x438>
230011d2:	09c40b13          	addi	s6,s0,156
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:357
230011d6:	4c81                	li	s9,0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:371
230011d8:	09c40413          	addi	s0,s0,156
230011dc:	4901                	li	s2,0
BLSP_MediaBoot_Read():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:338
230011de:	42020a37          	lui	s4,0x42020
BLSP_MediaBoot_Main():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:372
230011e2:	14048e63          	beqz	s1,2300133e <BLSP_MediaBoot_Main+0x1e2>
BLSP_MediaBoot_Parse_One_FW():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:194
230011e6:	230077b7          	lui	a5,0x23007
230011ea:	32478513          	addi	a0,a5,804 # 23007324 <__clz_tab+0x438>
230011ee:	85a6                	mv	a1,s1
230011f0:	283050ef          	jal	ra,23006c72 <bflb_platform_printf>
BLSP_MediaBoot_Read():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:338
230011f4:	23000537          	lui	a0,0x23000
230011f8:	0b000613          	li	a2,176
230011fc:	000a0593          	mv	a1,s4
23001200:	9526                	add	a0,a0,s1
23001202:	ff00f097          	auipc	ra,0xff00f
23001206:	618080e7          	jalr	1560(ra) # 2201081a <XIP_SFlash_Read_Via_Cache_Need_Lock>
BLSP_MediaBoot_Parse_One_FW():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:199
2300120a:	ff00f097          	auipc	ra,0xff00f
2300120e:	0f2080e7          	jalr	242(ra) # 220102fc <BLSP_Boot2_Dump_Critical_Flag>
23001212:	26051e63          	bnez	a0,2300148e <BLSP_MediaBoot_Main+0x332>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:204
23001216:	000a0593          	mv	a1,s4
2300121a:	8522                	mv	a0,s0
2300121c:	2e65                	jal	230015d4 <BLSP_Boot_Parse_BootHeader>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:205
2300121e:	0e051563          	bnez	a0,23001308 <BLSP_MediaBoot_Main+0x1ac>
BLSP_MediaBoot_Main():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:376
23001222:	6a85                	lui	s5,0x1
BLSP_MediaBoot_Parse_One_FW():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:212
23001224:	00144783          	lbu	a5,1(s0)
BLSP_MediaBoot_Main():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:376
23001228:	9aa6                	add	s5,s5,s1
BLSP_MediaBoot_Parse_One_FW():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:209
2300122a:	01542c23          	sw	s5,24(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:212
2300122e:	ebc9                	bnez	a5,230012c0 <BLSP_MediaBoot_Main+0x164>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:203
23001230:	0b048493          	addi	s1,s1,176
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:277
23001234:	00044783          	lbu	a5,0(s0)
23001238:	20079a63          	bnez	a5,2300144c <BLSP_MediaBoot_Main+0x2f0>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:294
2300123c:	00444783          	lbu	a5,4(s0)
23001240:	1e078563          	beqz	a5,2300142a <BLSP_MediaBoot_Main+0x2ce>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:296
23001244:	00744783          	lbu	a5,7(s0)
23001248:	32079863          	bnez	a5,23001578 <BLSP_MediaBoot_Main+0x41c>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:297
2300124c:	230077b7          	lui	a5,0x23007
23001250:	36c78513          	addi	a0,a5,876 # 2300736c <__clz_tab+0x480>
23001254:	21f050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:298
23001258:	00c42d83          	lw	s11,12(s0)
BLSP_MediaBot_Cal_Hash():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:107
2300125c:	4481                	li	s1,0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:111
2300125e:	4701                	li	a4,0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:113
23001260:	4781                	li	a5,0
23001262:	020d9063          	bnez	s11,23001282 <BLSP_MediaBoot_Main+0x126>
23001266:	a629                	j	23001570 <BLSP_MediaBoot_Main+0x414>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:131
23001268:	e8018513          	addi	a0,gp,-384 # 42021700 <shaCtx>
2300126c:	86ea                	mv	a3,s10
2300126e:	000a0613          	mv	a2,s4
23001272:	4581                	li	a1,0
23001274:	05a050ef          	jal	ra,230062ce <Sec_Eng_SHA256_Update>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:134
23001278:	9aea                	add	s5,s5,s10
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:113
2300127a:	87a6                	mv	a5,s1
2300127c:	4705                	li	a4,1
2300127e:	2fb4f963          	bgeu	s1,s11,23001570 <BLSP_MediaBoot_Main+0x414>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:115
23001282:	40fd8d33          	sub	s10,s11,a5
BLSP_MediaBoot_Read():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:338
23001286:	230007b7          	lui	a5,0x23000
2300128a:	00fa8533          	add	a0,s5,a5
2300128e:	6785                	lui	a5,0x1
23001290:	000a0593          	mv	a1,s4
23001294:	01a7d363          	bge	a5,s10,2300129a <BLSP_MediaBoot_Main+0x13e>
23001298:	6d05                	lui	s10,0x1
2300129a:	866a                	mv	a2,s10
2300129c:	c43a                	sw	a4,8(sp)
2300129e:	ff00f097          	auipc	ra,0xff00f
230012a2:	57c080e7          	jalr	1404(ra) # 2201081a <XIP_SFlash_Read_Via_Cache_Need_Lock>
BLSP_MediaBot_Cal_Hash():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:124
230012a6:	4722                	lw	a4,8(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:135
230012a8:	94ea                	add	s1,s1,s10
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:124
230012aa:	ff5d                	bnez	a4,23001268 <BLSP_MediaBoot_Main+0x10c>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:125
230012ac:	ff00f097          	auipc	ra,0xff00f
230012b0:	050080e7          	jalr	80(ra) # 220102fc <BLSP_Boot2_Dump_Critical_Flag>
230012b4:	d955                	beqz	a0,23001268 <BLSP_MediaBoot_Main+0x10c>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:126
230012b6:	85ea                	mv	a1,s10
230012b8:	000a0513          	mv	a0,s4
230012bc:	3b5d                	jal	23001072 <BLSP_Dump_Data>
230012be:	b76d                	j	23001268 <BLSP_MediaBoot_Main+0x10c>
BLSP_MediaBoot_Parse_One_FW():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:214
230012c0:	230077b7          	lui	a5,0x23007
230012c4:	33c78513          	addi	a0,a5,828 # 2300733c <__clz_tab+0x450>
230012c8:	1ab050ef          	jal	ra,23006c72 <bflb_platform_printf>
BLSP_MediaBoot_Read():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:338
230012cc:	23000537          	lui	a0,0x23000
230012d0:	0b050513          	addi	a0,a0,176 # 230000b0 <__text_code_start__+0xb0>
230012d4:	04400613          	li	a2,68
230012d8:	000a0593          	mv	a1,s4
230012dc:	9526                	add	a0,a0,s1
230012de:	ff00f097          	auipc	ra,0xff00f
230012e2:	53c080e7          	jalr	1340(ra) # 2201081a <XIP_SFlash_Read_Via_Cache_Need_Lock>
BLSP_MediaBoot_Parse_One_FW():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:219
230012e6:	ff00f097          	auipc	ra,0xff00f
230012ea:	016080e7          	jalr	22(ra) # 220102fc <BLSP_Boot2_Dump_Critical_Flag>
230012ee:	c511                	beqz	a0,230012fa <BLSP_MediaBoot_Main+0x19e>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:220
230012f0:	04400593          	li	a1,68
230012f4:	000a0513          	mv	a0,s4
230012f8:	3bad                	jal	23001072 <BLSP_Dump_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:223
230012fa:	4605                	li	a2,1
230012fc:	000a0593          	mv	a1,s4
23001300:	8522                	mv	a0,s0
23001302:	2339                	jal	23001810 <BLSP_Boot_Parse_PKey>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:224
23001304:	1c050263          	beqz	a0,230014c8 <BLSP_MediaBoot_Main+0x36c>
BLSP_MediaBoot_Main():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:379
23001308:	230077b7          	lui	a5,0x23007
2300130c:	3dc78513          	addi	a0,a5,988 # 230073dc <__clz_tab+0x4f0>
23001310:	85ca                	mv	a1,s2
23001312:	161050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:380
23001316:	012c07b3          	add	a5,s8,s2
2300131a:	4705                	li	a4,1
2300131c:	00e78023          	sb	a4,0(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:371 (discriminator 2)
23001320:	0ac1c783          	lbu	a5,172(gp) # 4202192c <cpuCount>
23001324:	0905                	addi	s2,s2,1
23001326:	2e040413          	addi	s0,s0,736
2300132a:	02f97863          	bgeu	s2,a5,2300135a <BLSP_MediaBoot_Main+0x1fe>
2300132e:	00291793          	slli	a5,s2,0x2
23001332:	1018                	addi	a4,sp,32
23001334:	97ba                	add	a5,a5,a4
23001336:	ff87a483          	lw	s1,-8(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:372
2300133a:	ea0496e3          	bnez	s1,230011e6 <BLSP_MediaBoot_Main+0x8a>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:373
2300133e:	23007537          	lui	a0,0x23007
23001342:	85ca                	mv	a1,s2
23001344:	31050513          	addi	a0,a0,784 # 23007310 <__clz_tab+0x424>
23001348:	12b050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:371
2300134c:	0ac1c783          	lbu	a5,172(gp) # 4202192c <cpuCount>
23001350:	0905                	addi	s2,s2,1
23001352:	2e040413          	addi	s0,s0,736
23001356:	fcf96ce3          	bltu	s2,a5,2300132e <BLSP_MediaBoot_Main+0x1d2>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:385
2300135a:	01978663          	beq	a5,s9,23001366 <BLSP_MediaBoot_Main+0x20a>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:385 (discriminator 1)
2300135e:	4732                	lw	a4,12(sp)
23001360:	4785                	li	a5,1
23001362:	0cf70863          	beq	a4,a5,23001432 <BLSP_MediaBoot_Main+0x2d6>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:394
23001366:	220c8763          	beqz	s9,23001594 <BLSP_MediaBoot_Main+0x438>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:401
2300136a:	0ac1c603          	lbu	a2,172(gp) # 4202192c <cpuCount>
2300136e:	c60d                	beqz	a2,23001398 <BLSP_MediaBoot_Main+0x23c>
23001370:	42021737          	lui	a4,0x42021
23001374:	08070713          	addi	a4,a4,128 # 42021080 <__system_ram_data_end__>
23001378:	4781                	li	a5,0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:402
2300137a:	003b4683          	lbu	a3,3(s6)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:401
2300137e:	0785                	addi	a5,a5,1
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:402
23001380:	c699                	beqz	a3,2300138e <BLSP_MediaBoot_Main+0x232>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:403
23001382:	014b2683          	lw	a3,20(s6)
23001386:	e681                	bnez	a3,2300138e <BLSP_MediaBoot_Main+0x232>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:411
23001388:	4714                	lw	a3,8(a4)
2300138a:	00db2a23          	sw	a3,20(s6)
2300138e:	2e0b0b13          	addi	s6,s6,736
23001392:	0731                	addi	a4,a4,12
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:401 (discriminator 2)
23001394:	fec7e3e3          	bltu	a5,a2,2300137a <BLSP_MediaBoot_Main+0x21e>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:416
23001398:	ff00f097          	auipc	ra,0xff00f
2300139c:	f30080e7          	jalr	-208(ra) # 220102c8 <BLSP_Boot2_Get_Feature_Flag>
230013a0:	4789                	li	a5,2
230013a2:	0ef50c63          	beq	a0,a5,2300149a <BLSP_MediaBoot_Main+0x33e>
230013a6:	0109a583          	lw	a1,16(s3)
230013aa:	0149a603          	lw	a2,20(s3)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:425
230013ae:	23007437          	lui	s0,0x23007
230013b2:	3bc40513          	addi	a0,s0,956 # 230073bc <__clz_tab+0x4d0>
230013b6:	0bd050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:426
230013ba:	2f49a603          	lw	a2,756(s3)
230013be:	2f09a583          	lw	a1,752(s3)
230013c2:	3bc40513          	addi	a0,s0,956
230013c6:	0ad050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:427
230013ca:	0069c603          	lbu	a2,6(s3)
230013ce:	0189a583          	lw	a1,24(s3)
230013d2:	3bc40513          	addi	a0,s0,956
230013d6:	09d050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:428
230013da:	2e69c603          	lbu	a2,742(s3)
230013de:	2f89a583          	lw	a1,760(s3)
230013e2:	3bc40513          	addi	a0,s0,956
230013e6:	08d050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:429
230013ea:	0099c603          	lbu	a2,9(s3)
230013ee:	0ac1c583          	lbu	a1,172(gp) # 4202192c <cpuCount>
230013f2:	23007537          	lui	a0,0x23007
230013f6:	3c850513          	addi	a0,a0,968 # 230073c8 <__clz_tab+0x4dc>
230013fa:	079050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:430
230013fe:	285000ef          	jal	ra,23001e82 <BLSP_Boot2_Show_Timer>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:433
23001402:	395000ef          	jal	ra,23001f96 <BLSP_Fix_Invalid_MSP_PC>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:436
23001406:	31f1                	jal	230010d2 <BLSP_MediaBoot_Pre_Jump>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:439
23001408:	6541                	lui	a0,0x10
2300140a:	157d                	addi	a0,a0,-1
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:440
2300140c:	40f6                	lw	ra,92(sp)
2300140e:	4466                	lw	s0,88(sp)
23001410:	44d6                	lw	s1,84(sp)
23001412:	4946                	lw	s2,80(sp)
23001414:	49b6                	lw	s3,76(sp)
23001416:	4a26                	lw	s4,72(sp)
23001418:	4a96                	lw	s5,68(sp)
2300141a:	4b06                	lw	s6,64(sp)
2300141c:	5bf2                	lw	s7,60(sp)
2300141e:	5c62                	lw	s8,56(sp)
23001420:	5cd2                	lw	s9,52(sp)
23001422:	5d42                	lw	s10,48(sp)
23001424:	5db2                	lw	s11,44(sp)
23001426:	6125                	addi	sp,sp,96
23001428:	8082                	ret
BLSP_MediaBoot_Parse_One_FW():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:314
2300142a:	000401a3          	sb	zero,3(s0)
BLSP_MediaBoot_Main():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:382
2300142e:	0c85                	addi	s9,s9,1
23001430:	bdc5                	j	23001320 <BLSP_MediaBoot_Main+0x1c4>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:387
23001432:	47f2                	lw	a5,28(sp)
23001434:	e399                	bnez	a5,2300143a <BLSP_MediaBoot_Main+0x2de>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:387 (discriminator 1)
23001436:	16ec8863          	beq	s9,a4,230015a6 <BLSP_MediaBoot_Main+0x44a>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:390
2300143a:	23007537          	lui	a0,0x23007
2300143e:	39050513          	addi	a0,a0,912 # 23007390 <__clz_tab+0x4a4>
23001442:	031050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:391
23001446:	21c00513          	li	a0,540
2300144a:	b7c9                	j	2300140c <BLSP_MediaBoot_Main+0x2b0>
BLSP_MediaBoot_Parse_One_FW():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:279
2300144c:	230077b7          	lui	a5,0x23007
23001450:	36478513          	addi	a0,a5,868 # 23007364 <__clz_tab+0x478>
23001454:	01f050ef          	jal	ra,23006c72 <bflb_platform_printf>
BLSP_MediaBoot_Read():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:338
23001458:	23000537          	lui	a0,0x23000
2300145c:	4651                	li	a2,20
2300145e:	000a0593          	mv	a1,s4
23001462:	9526                	add	a0,a0,s1
23001464:	ff00f097          	auipc	ra,0xff00f
23001468:	3b6080e7          	jalr	950(ra) # 2201081a <XIP_SFlash_Read_Via_Cache_Need_Lock>
BLSP_MediaBoot_Parse_One_FW():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:284
2300146c:	ff00f097          	auipc	ra,0xff00f
23001470:	e90080e7          	jalr	-368(ra) # 220102fc <BLSP_Boot2_Dump_Critical_Flag>
23001474:	10051b63          	bnez	a0,2300158a <BLSP_MediaBoot_Main+0x42e>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:288
23001478:	000a0593          	mv	a1,s4
2300147c:	8522                	mv	a0,s0
2300147e:	23a5                	jal	230019e6 <BLSP_Boot_Parse_AesIv>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:289
23001480:	e80514e3          	bnez	a0,23001308 <BLSP_MediaBoot_Main+0x1ac>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:294
23001484:	00444783          	lbu	a5,4(s0)
23001488:	da079ee3          	bnez	a5,23001244 <BLSP_MediaBoot_Main+0xe8>
2300148c:	bf79                	j	2300142a <BLSP_MediaBoot_Main+0x2ce>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:200
2300148e:	0b000593          	li	a1,176
23001492:	000a0513          	mv	a0,s4
23001496:	3ef1                	jal	23001072 <BLSP_Dump_Data>
23001498:	bbbd                	j	23001216 <BLSP_MediaBoot_Main+0xba>
BLSP_MediaBoot_Main():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:421
2300149a:	0059c783          	lbu	a5,5(s3)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:418
2300149e:	0189a703          	lw	a4,24(s3)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:419
230014a2:	0109a583          	lw	a1,16(s3)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:420
230014a6:	0149a603          	lw	a2,20(s3)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:421
230014aa:	2ef982a3          	sb	a5,741(s3)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:422
230014ae:	4785                	li	a5,1
230014b0:	2ef981a3          	sb	a5,739(s3)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:423
230014b4:	47bd                	li	a5,15
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:418
230014b6:	2ee9ac23          	sw	a4,760(s3)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:419
230014ba:	2eb9a823          	sw	a1,752(s3)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:420
230014be:	2ec9aa23          	sw	a2,756(s3)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:423
230014c2:	2ef98323          	sb	a5,742(s3)
230014c6:	b5e5                	j	230013ae <BLSP_MediaBoot_Main+0x252>
BLSP_MediaBoot_Parse_One_FW():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:228
230014c8:	230077b7          	lui	a5,0x23007
230014cc:	34478513          	addi	a0,a5,836 # 23007344 <__clz_tab+0x458>
230014d0:	7a2050ef          	jal	ra,23006c72 <bflb_platform_printf>
BLSP_MediaBoot_Read():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:338
230014d4:	23000537          	lui	a0,0x23000
230014d8:	0f450513          	addi	a0,a0,244 # 230000f4 <__Vectors+0x34>
230014dc:	04400613          	li	a2,68
230014e0:	000a0593          	mv	a1,s4
230014e4:	9526                	add	a0,a0,s1
230014e6:	ff00f097          	auipc	ra,0xff00f
230014ea:	334080e7          	jalr	820(ra) # 2201081a <XIP_SFlash_Read_Via_Cache_Need_Lock>
BLSP_MediaBoot_Parse_One_FW():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:233
230014ee:	ff00f097          	auipc	ra,0xff00f
230014f2:	e0e080e7          	jalr	-498(ra) # 220102fc <BLSP_Boot2_Dump_Critical_Flag>
230014f6:	0c051463          	bnez	a0,230015be <BLSP_MediaBoot_Main+0x462>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:237
230014fa:	4601                	li	a2,0
230014fc:	000a0593          	mv	a1,s4
23001500:	8522                	mv	a0,s0
23001502:	2639                	jal	23001810 <BLSP_Boot_Parse_PKey>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:238
23001504:	e00512e3          	bnez	a0,23001308 <BLSP_MediaBoot_Main+0x1ac>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:242
23001508:	23007537          	lui	a0,0x23007
2300150c:	34c50513          	addi	a0,a0,844 # 2300734c <__clz_tab+0x460>
23001510:	762050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:243
23001514:	084c                	addi	a1,sp,20
23001516:	13848513          	addi	a0,s1,312
2300151a:	3ed1                	jal	230010ee <BLSP_MediaBoot_Read_Signaure>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:247
2300151c:	ff00f097          	auipc	ra,0xff00f
23001520:	de0080e7          	jalr	-544(ra) # 220102fc <BLSP_Boot2_Dump_Critical_Flag>
23001524:	e941                	bnez	a0,230015b4 <BLSP_MediaBoot_Main+0x458>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:253
23001526:	4605                	li	a2,1
23001528:	000a0593          	mv	a1,s4
2300152c:	8522                	mv	a0,s0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:252
2300152e:	4dd2                	lw	s11,20(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:253
23001530:	26f5                	jal	2300191c <BLSP_Boot_Parse_Signature>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:254
23001532:	dc051be3          	bnez	a0,23001308 <BLSP_MediaBoot_Main+0x1ac>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:259
23001536:	23007537          	lui	a0,0x23007
2300153a:	35850513          	addi	a0,a0,856 # 23007358 <__clz_tab+0x46c>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:252
2300153e:	13cd8d93          	addi	s11,s11,316 # 2f13c <StackSize+0x2ed3c>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:259
23001542:	730050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:252
23001546:	9da6                	add	s11,s11,s1
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:260
23001548:	084c                	addi	a1,sp,20
2300154a:	004d8513          	addi	a0,s11,4
2300154e:	3645                	jal	230010ee <BLSP_MediaBoot_Read_Signaure>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:264
23001550:	ff00f097          	auipc	ra,0xff00f
23001554:	dac080e7          	jalr	-596(ra) # 220102fc <BLSP_Boot2_Dump_Critical_Flag>
23001558:	e92d                	bnez	a0,230015ca <BLSP_MediaBoot_Main+0x46e>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:270
2300155a:	4601                	li	a2,0
2300155c:	000a0593          	mv	a1,s4
23001560:	8522                	mv	a0,s0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:269
23001562:	44d2                	lw	s1,20(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:270
23001564:	2e65                	jal	2300191c <BLSP_Boot_Parse_Signature>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:271
23001566:	da0511e3          	bnez	a0,23001308 <BLSP_MediaBoot_Main+0x1ac>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:269
2300156a:	04b1                	addi	s1,s1,12
2300156c:	94ee                	add	s1,s1,s11
2300156e:	b1d9                	j	23001234 <BLSP_MediaBoot_Main+0xd8>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:303
23001570:	8522                	mv	a0,s0
23001572:	237d                	jal	23001b20 <BLSP_Boot_Parser_Check_Hash>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:304
23001574:	d8051ae3          	bnez	a0,23001308 <BLSP_MediaBoot_Main+0x1ac>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:308
23001578:	8522                	mv	a0,s0
2300157a:	21ed                	jal	23001a64 <BLSP_Boot_Parser_Check_Signature>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:309
2300157c:	d80516e3          	bnez	a0,23001308 <BLSP_MediaBoot_Main+0x1ac>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:312
23001580:	4785                	li	a5,1
23001582:	00f401a3          	sb	a5,3(s0)
BLSP_MediaBoot_Main():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:382
23001586:	0c85                	addi	s9,s9,1
23001588:	bb61                	j	23001320 <BLSP_MediaBoot_Main+0x1c4>
BLSP_MediaBoot_Parse_One_FW():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:285
2300158a:	45d1                	li	a1,20
2300158c:	000a0513          	mv	a0,s4
23001590:	34cd                	jal	23001072 <BLSP_Dump_Data>
23001592:	b5dd                	j	23001478 <BLSP_MediaBoot_Main+0x31c>
BLSP_MediaBoot_Main():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:395
23001594:	23007537          	lui	a0,0x23007
23001598:	3a450513          	addi	a0,a0,932 # 230073a4 <__clz_tab+0x4b8>
2300159c:	6d6050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:396
230015a0:	21b00513          	li	a0,539
230015a4:	b5a5                	j	2300140c <BLSP_MediaBoot_Main+0x2b0>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:388
230015a6:	23007537          	lui	a0,0x23007
230015aa:	37850513          	addi	a0,a0,888 # 23007378 <__clz_tab+0x48c>
230015ae:	6c4050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:394
230015b2:	bb65                	j	2300136a <BLSP_MediaBoot_Main+0x20e>
BLSP_MediaBoot_Parse_One_FW():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:248
230015b4:	45d2                	lw	a1,20(sp)
230015b6:	000a0513          	mv	a0,s4
230015ba:	3c65                	jal	23001072 <BLSP_Dump_Data>
230015bc:	b7ad                	j	23001526 <BLSP_MediaBoot_Main+0x3ca>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:234
230015be:	04400593          	li	a1,68
230015c2:	000a0513          	mv	a0,s4
230015c6:	3475                	jal	23001072 <BLSP_Dump_Data>
230015c8:	bf0d                	j	230014fa <BLSP_MediaBoot_Main+0x39e>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:265
230015ca:	45d2                	lw	a1,20(sp)
230015cc:	000a0513          	mv	a0,s4
230015d0:	344d                	jal	23001072 <BLSP_Dump_Data>
230015d2:	b761                	j	2300155a <BLSP_MediaBoot_Main+0x3fe>

230015d4 <BLSP_Boot_Parse_BootHeader>:
BLSP_Boot_Parse_BootHeader():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:142
230015d4:	59fc                	lw	a5,116(a1)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:135
230015d6:	1101                	addi	sp,sp,-32
230015d8:	cc22                	sw	s0,24(sp)
230015da:	ca26                	sw	s1,20(sp)
230015dc:	ce06                	sw	ra,28(sp)
230015de:	c84a                	sw	s2,16(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:142
230015e0:	00f79713          	slli	a4,a5,0xf
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:135
230015e4:	842e                	mv	s0,a1
230015e6:	84aa                	mv	s1,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:142
230015e8:	00075a63          	bgez	a4,230015fc <BLSP_Boot_Parse_BootHeader+0x28>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:142 (discriminator 1)
230015ec:	0ac5a703          	lw	a4,172(a1)
230015f0:	deadc7b7          	lui	a5,0xdeadc
230015f4:	eef78793          	addi	a5,a5,-273 # deadbeef <__noinit_data_end__+0x9caa959f>
230015f8:	1ef70c63          	beq	a4,a5,230017f0 <BLSP_Boot_Parse_BootHeader+0x21c>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:146
230015fc:	0ac00593          	li	a1,172
23001600:	8522                	mv	a0,s0
23001602:	ff00f097          	auipc	ra,0xff00f
23001606:	254080e7          	jalr	596(ra) # 22010856 <BFLB_Soft_CRC32>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:147
2300160a:	0ac42783          	lw	a5,172(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:146
2300160e:	c62a                	sw	a0,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:147
23001610:	1af51863          	bne	a0,a5,230017c0 <BLSP_Boot_Parse_BootHeader+0x1ec>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:152
23001614:	587c                	lw	a5,116(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:153
23001616:	20200513          	li	a0,514
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:152
2300161a:	4007f793          	andi	a5,a5,1024
2300161e:	eb85                	bnez	a5,2300164e <BLSP_Boot_Parse_BootHeader+0x7a>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:158
23001620:	00044703          	lbu	a4,0(s0)
23001624:	04200793          	li	a5,66
23001628:	02f70963          	beq	a4,a5,2300165a <BLSP_Boot_Parse_BootHeader+0x86>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:161
2300162c:	230075b7          	lui	a1,0x23007
23001630:	4611                	li	a2,4
23001632:	43458593          	addi	a1,a1,1076 # 23007434 <__clz_tab+0x548>
23001636:	8522                	mv	a0,s0
23001638:	582010ef          	jal	ra,23002bba <memcmp>
2300163c:	c129                	beqz	a0,2300167e <BLSP_Boot_Parse_BootHeader+0xaa>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:169
2300163e:	23007537          	lui	a0,0x23007
23001642:	43c50513          	addi	a0,a0,1084 # 2300743c <__clz_tab+0x550>
23001646:	62c050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:170
2300164a:	20300513          	li	a0,515
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:246
2300164e:	40f2                	lw	ra,28(sp)
23001650:	4462                	lw	s0,24(sp)
23001652:	44d2                	lw	s1,20(sp)
23001654:	4942                	lw	s2,16(sp)
23001656:	6105                	addi	sp,sp,32
23001658:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:158
2300165a:	00144703          	lbu	a4,1(s0)
2300165e:	04600793          	li	a5,70
23001662:	fcf715e3          	bne	a4,a5,2300162c <BLSP_Boot_Parse_BootHeader+0x58>
23001666:	00244703          	lbu	a4,2(s0)
2300166a:	04e00793          	li	a5,78
2300166e:	faf71fe3          	bne	a4,a5,2300162c <BLSP_Boot_Parse_BootHeader+0x58>
23001672:	00344703          	lbu	a4,3(s0)
23001676:	05000793          	li	a5,80
2300167a:	faf719e3          	bne	a4,a5,2300162c <BLSP_Boot_Parse_BootHeader+0x58>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:173
2300167e:	00048523          	sb	zero,10(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:176
23001682:	000481a3          	sb	zero,3(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:181
23001686:	5870                	lw	a2,116(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:200
23001688:	23007537          	lui	a0,0x23007
2300168c:	47450513          	addi	a0,a0,1140 # 23007474 <__clz_tab+0x588>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:181
23001690:	8209                	srli	a2,a2,0x2
23001692:	8a0d                	andi	a2,a2,3
23001694:	00c48023          	sb	a2,0(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:182
23001698:	586c                	lw	a1,116(s0)
2300169a:	898d                	andi	a1,a1,3
2300169c:	00b480a3          	sb	a1,1(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:183
230016a0:	587c                	lw	a5,116(s0)
230016a2:	8391                	srli	a5,a5,0x4
230016a4:	8b8d                	andi	a5,a5,3
230016a6:	00f48123          	sb	a5,2(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:186
230016aa:	587c                	lw	a5,116(s0)
230016ac:	83a1                	srli	a5,a5,0x8
230016ae:	8b85                	andi	a5,a5,1
230016b0:	00f48223          	sb	a5,4(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:187
230016b4:	587c                	lw	a5,116(s0)
230016b6:	83a5                	srli	a5,a5,0x9
230016b8:	8b85                	andi	a5,a5,1
230016ba:	00f482a3          	sb	a5,5(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:188
230016be:	587c                	lw	a5,116(s0)
230016c0:	83ad                	srli	a5,a5,0xb
230016c2:	8b85                	andi	a5,a5,1
230016c4:	00f48423          	sb	a5,8(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:189
230016c8:	587c                	lw	a5,116(s0)
230016ca:	83c9                	srli	a5,a5,0x12
230016cc:	8b85                	andi	a5,a5,1
230016ce:	00f484a3          	sb	a5,9(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:190
230016d2:	587c                	lw	a5,116(s0)
230016d4:	83b1                	srli	a5,a5,0xc
230016d6:	8bbd                	andi	a5,a5,15
230016d8:	00f48323          	sb	a5,6(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:191
230016dc:	587c                	lw	a5,116(s0)
230016de:	83c5                	srli	a5,a5,0x11
230016e0:	8b85                	andi	a5,a5,1
230016e2:	00f483a3          	sb	a5,7(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:197
230016e6:	5c78                	lw	a4,124(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:198
230016e8:	08042783          	lw	a5,128(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:194
230016ec:	5c34                	lw	a3,120(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:197
230016ee:	c8d8                	sw	a4,20(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:198
230016f0:	cc9c                	sw	a5,24(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:194
230016f2:	c4d4                	sw	a3,12(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:200
230016f4:	57e050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:204
230016f8:	ddc1c703          	lbu	a4,-548(gp) # 4202165c <efuseCfg>
230016fc:	c709                	beqz	a4,23001706 <BLSP_Boot_Parse_BootHeader+0x132>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:205
230016fe:	0004c703          	lbu	a4,0(s1)
23001702:	0e070e63          	beqz	a4,230017fe <BLSP_Boot_Parse_BootHeader+0x22a>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:211
23001706:	ddc18913          	addi	s2,gp,-548 # 4202165c <efuseCfg>
2300170a:	00294783          	lbu	a5,2(s2)
2300170e:	0014c703          	lbu	a4,1(s1)
23001712:	08f71563          	bne	a4,a5,2300179c <BLSP_Boot_Parse_BootHeader+0x1c8>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:217
23001716:	0ad1c703          	lbu	a4,173(gp) # 4202192d <psMode>
2300171a:	4685                	li	a3,1
2300171c:	0cd70463          	beq	a4,a3,230017e4 <BLSP_Boot_Parse_BootHeader+0x210>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:220
23001720:	0074c683          	lbu	a3,7(s1)
23001724:	4705                	li	a4,1
23001726:	06e68063          	beq	a3,a4,23001786 <BLSP_Boot_Parse_BootHeader+0x1b2>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:220 (discriminator 3)
2300172a:	e7b5                	bnez	a5,23001796 <BLSP_Boot_Parse_BootHeader+0x1c2>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:225
2300172c:	0b01a783          	lw	a5,176(gp) # 42021930 <userHashIgnored>
23001730:	c781                	beqz	a5,23001738 <BLSP_Boot_Parse_BootHeader+0x164>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:226
23001732:	4785                	li	a5,1
23001734:	00f483a3          	sb	a5,7(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:229
23001738:	02000613          	li	a2,32
2300173c:	08440593          	addi	a1,s0,132
23001740:	02c48513          	addi	a0,s1,44
23001744:	ff00f097          	auipc	ra,0xff00f
23001748:	c62080e7          	jalr	-926(ra) # 220103a6 <BL602_MemCpy_Fast>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:231
2300174c:	44dc                	lw	a5,12(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:232
2300174e:	20700513          	li	a0,519
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:231
23001752:	ee078ee3          	beqz	a5,2300164e <BLSP_Boot_Parse_BootHeader+0x7a>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:236
23001756:	42021737          	lui	a4,0x42021
2300175a:	00070693          	mv	a3,a4
2300175e:	00070713          	mv	a4,a4
23001762:	04068693          	addi	a3,a3,64
23001766:	4601                	li	a2,0
23001768:	4581                	li	a1,0
2300176a:	e8018513          	addi	a0,gp,-384 # 42021700 <shaCtx>
2300176e:	2f5040ef          	jal	ra,23006262 <Sec_Eng_SHA256_Init>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:237
23001772:	4501                	li	a0,0
23001774:	349040ef          	jal	ra,230062bc <Sec_Eng_SHA_Start>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:246
23001778:	40f2                	lw	ra,28(sp)
2300177a:	4462                	lw	s0,24(sp)
2300177c:	44d2                	lw	s1,20(sp)
2300177e:	4942                	lw	s2,16(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:245
23001780:	4501                	li	a0,0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:246
23001782:	6105                	addi	sp,sp,32
23001784:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:220 (discriminator 1)
23001786:	08442683          	lw	a3,132(s0)
2300178a:	deadc737          	lui	a4,0xdeadc
2300178e:	eef70713          	addi	a4,a4,-273 # deadbeef <__noinit_data_end__+0x9caa959f>
23001792:	f8e68ce3          	beq	a3,a4,2300172a <BLSP_Boot_Parse_BootHeader+0x156>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:223
23001796:	000483a3          	sb	zero,7(s1)
2300179a:	bf49                	j	2300172c <BLSP_Boot_Parse_BootHeader+0x158>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:212
2300179c:	23007537          	lui	a0,0x23007
230017a0:	46450513          	addi	a0,a0,1124 # 23007464 <__clz_tab+0x578>
230017a4:	4ce050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:213
230017a8:	00294783          	lbu	a5,2(s2)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:214
230017ac:	20600513          	li	a0,518
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:213
230017b0:	00f480a3          	sb	a5,1(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:246
230017b4:	40f2                	lw	ra,28(sp)
230017b6:	4462                	lw	s0,24(sp)
230017b8:	44d2                	lw	s1,20(sp)
230017ba:	4942                	lw	s2,16(sp)
230017bc:	6105                	addi	sp,sp,32
230017be:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:240
230017c0:	23007537          	lui	a0,0x23007
230017c4:	41450513          	addi	a0,a0,1044 # 23007414 <__clz_tab+0x528>
230017c8:	4aa050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:241
230017cc:	0068                	addi	a0,sp,12
230017ce:	4591                	li	a1,4
230017d0:	8a3ff0ef          	jal	ra,23001072 <BLSP_Dump_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:246
230017d4:	40f2                	lw	ra,28(sp)
230017d6:	4462                	lw	s0,24(sp)
230017d8:	44d2                	lw	s1,20(sp)
230017da:	4942                	lw	s2,16(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:242
230017dc:	20400513          	li	a0,516
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:246
230017e0:	6105                	addi	sp,sp,32
230017e2:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:217 (discriminator 1)
230017e4:	00494683          	lbu	a3,4(s2)
230017e8:	fe85                	bnez	a3,23001720 <BLSP_Boot_Parse_BootHeader+0x14c>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:219
230017ea:	00e483a3          	sb	a4,7(s1)
230017ee:	bf3d                	j	2300172c <BLSP_Boot_Parse_BootHeader+0x158>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:143
230017f0:	23007537          	lui	a0,0x23007
230017f4:	40450513          	addi	a0,a0,1028 # 23007404 <__clz_tab+0x518>
230017f8:	47a050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:151
230017fc:	bd21                	j	23001614 <BLSP_Boot_Parse_BootHeader+0x40>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:206
230017fe:	23007537          	lui	a0,0x23007
23001802:	45050513          	addi	a0,a0,1104 # 23007450 <__clz_tab+0x564>
23001806:	46c050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:207
2300180a:	20500513          	li	a0,517
2300180e:	b581                	j	2300164e <BLSP_Boot_Parse_BootHeader+0x7a>

23001810 <BLSP_Boot_Parse_PKey>:
BLSP_Boot_Parse_PKey():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:259
23001810:	7139                	addi	sp,sp,-64
23001812:	dc22                	sw	s0,56(sp)
23001814:	da26                	sw	s1,52(sp)
23001816:	842e                	mv	s0,a1
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:263
23001818:	41a4                	lw	s1,64(a1)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:259
2300181a:	d64e                	sw	s3,44(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:263
2300181c:	04000593          	li	a1,64
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:259
23001820:	89aa                	mv	s3,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:263
23001822:	8522                	mv	a0,s0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:259
23001824:	d84a                	sw	s2,48(sp)
23001826:	de06                	sw	ra,60(sp)
23001828:	8932                	mv	s2,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:263
2300182a:	ff00f097          	auipc	ra,0xff00f
2300182e:	02c080e7          	jalr	44(ra) # 22010856 <BFLB_Soft_CRC32>
23001832:	06a49a63          	bne	s1,a0,230018a6 <BLSP_Boot_Parse_PKey+0x96>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:266
23001836:	04000693          	li	a3,64
2300183a:	8622                	mv	a2,s0
2300183c:	4581                	li	a1,0
2300183e:	e8018513          	addi	a0,gp,-384 # 42021700 <shaCtx>
23001842:	28d040ef          	jal	ra,230062ce <Sec_Eng_SHA256_Update>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:267
23001846:	860a                	mv	a2,sp
23001848:	4581                	li	a1,0
2300184a:	e8018513          	addi	a0,gp,-384 # 42021700 <shaCtx>
2300184e:	28f040ef          	jal	ra,230062dc <Sec_Eng_SHA256_Finish>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:269
23001852:	42021737          	lui	a4,0x42021
23001856:	00070693          	mv	a3,a4
2300185a:	04068693          	addi	a3,a3,64
2300185e:	00070713          	mv	a4,a4
23001862:	4601                	li	a2,0
23001864:	4581                	li	a1,0
23001866:	e8018513          	addi	a0,gp,-384 # 42021700 <shaCtx>
2300186a:	1f9040ef          	jal	ra,23006262 <Sec_Eng_SHA256_Init>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:270
2300186e:	4501                	li	a0,0
23001870:	24d040ef          	jal	ra,230062bc <Sec_Eng_SHA_Start>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:273
23001874:	4785                	li	a5,1
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:289
23001876:	4501                	li	a0,0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:273
23001878:	00f90963          	beq	s2,a5,2300188a <BLSP_Boot_Parse_PKey+0x7a>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:290
2300187c:	50f2                	lw	ra,60(sp)
2300187e:	5462                	lw	s0,56(sp)
23001880:	54d2                	lw	s1,52(sp)
23001882:	5942                	lw	s2,48(sp)
23001884:	59b2                	lw	s3,44(sp)
23001886:	6121                	addi	sp,sp,64
23001888:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:274
2300188a:	00a9c783          	lbu	a5,10(s3)
BLSP_Boot_Parse_Is_PKHash_Valid():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:106
2300188e:	cb9d                	beqz	a5,230018c4 <BLSP_Boot_Parse_PKey+0xb4>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:110
23001890:	07278d63          	beq	a5,s2,2300190a <BLSP_Boot_Parse_PKey+0xfa>
BLSP_Boot_Parse_PKey():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:276
23001894:	23007537          	lui	a0,0x23007
23001898:	48c50513          	addi	a0,a0,1164 # 2300748c <__clz_tab+0x5a0>
2300189c:	3d6050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:277
230018a0:	20c00513          	li	a0,524
230018a4:	bfe1                	j	2300187c <BLSP_Boot_Parse_PKey+0x6c>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:285
230018a6:	23007537          	lui	a0,0x23007
230018aa:	49c50513          	addi	a0,a0,1180 # 2300749c <__clz_tab+0x5b0>
230018ae:	3c4050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:290
230018b2:	50f2                	lw	ra,60(sp)
230018b4:	5462                	lw	s0,56(sp)
230018b6:	54d2                	lw	s1,52(sp)
230018b8:	5942                	lw	s2,48(sp)
230018ba:	59b2                	lw	s3,44(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:286
230018bc:	20b00513          	li	a0,523
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:290
230018c0:	6121                	addi	sp,sp,64
230018c2:	8082                	ret
BLSP_Boot_Parse_Is_PKHash_Valid():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:107
230018c4:	02000613          	li	a2,32
230018c8:	858a                	mv	a1,sp
230018ca:	dec18513          	addi	a0,gp,-532 # 4202166c <efuseCfg+0x10>
230018ce:	2ec010ef          	jal	ra,23002bba <memcmp>
230018d2:	f169                	bnez	a0,23001894 <BLSP_Boot_Parse_PKey+0x84>
BLSP_Boot_Parse_PKey():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:281
230018d4:	85a2                	mv	a1,s0
230018d6:	02000613          	li	a2,32
230018da:	06098513          	addi	a0,s3,96
230018de:	ff00f097          	auipc	ra,0xff00f
230018e2:	ac8080e7          	jalr	-1336(ra) # 220103a6 <BL602_MemCpy_Fast>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:282
230018e6:	02040593          	addi	a1,s0,32
230018ea:	08098513          	addi	a0,s3,128
230018ee:	02000613          	li	a2,32
230018f2:	ff00f097          	auipc	ra,0xff00f
230018f6:	ab4080e7          	jalr	-1356(ra) # 220103a6 <BL602_MemCpy_Fast>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:290
230018fa:	50f2                	lw	ra,60(sp)
230018fc:	5462                	lw	s0,56(sp)
230018fe:	54d2                	lw	s1,52(sp)
23001900:	5942                	lw	s2,48(sp)
23001902:	59b2                	lw	s3,44(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:289
23001904:	4501                	li	a0,0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:290
23001906:	6121                	addi	sp,sp,64
23001908:	8082                	ret
BLSP_Boot_Parse_Is_PKHash_Valid():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:111
2300190a:	02000613          	li	a2,32
2300190e:	858a                	mv	a1,sp
23001910:	e0c18513          	addi	a0,gp,-500 # 4202168c <efuseCfg+0x30>
23001914:	2a6010ef          	jal	ra,23002bba <memcmp>
23001918:	fd35                	bnez	a0,23001894 <BLSP_Boot_Parse_PKey+0x84>
2300191a:	bf6d                	j	230018d4 <BLSP_Boot_Parse_PKey+0xc4>

2300191c <BLSP_Boot_Parse_Signature>:
BLSP_Boot_Parse_Signature():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:306
2300191c:	419c                	lw	a5,0(a1)
2300191e:	10000713          	li	a4,256
23001922:	0af76063          	bltu	a4,a5,230019c2 <BLSP_Boot_Parse_Signature+0xa6>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:303
23001926:	1101                	addi	sp,sp,-32
23001928:	cc22                	sw	s0,24(sp)
2300192a:	842e                	mv	s0,a1
2300192c:	ca26                	sw	s1,20(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:311
2300192e:	00478593          	addi	a1,a5,4
23001932:	84aa                	mv	s1,a0
23001934:	8522                	mv	a0,s0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:303
23001936:	c84a                	sw	s2,16(sp)
23001938:	ce06                	sw	ra,28(sp)
2300193a:	8932                	mv	s2,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:311
2300193c:	ff00f097          	auipc	ra,0xff00f
23001940:	f1a080e7          	jalr	-230(ra) # 22010856 <BFLB_Soft_CRC32>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:312
23001944:	4010                	lw	a2,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:311
23001946:	c62a                	sw	a0,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:312
23001948:	0ff57513          	andi	a0,a0,255
2300194c:	00460793          	addi	a5,a2,4
23001950:	97a2                	add	a5,a5,s0
23001952:	0007c703          	lbu	a4,0(a5)
23001956:	02e50063          	beq	a0,a4,23001976 <BLSP_Boot_Parse_Signature+0x5a>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:321
2300195a:	23007537          	lui	a0,0x23007
2300195e:	4ac50513          	addi	a0,a0,1196 # 230074ac <__clz_tab+0x5c0>
23001962:	310050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:326
23001966:	40f2                	lw	ra,28(sp)
23001968:	4462                	lw	s0,24(sp)
2300196a:	44d2                	lw	s1,20(sp)
2300196c:	4942                	lw	s2,16(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:322
2300196e:	20e00513          	li	a0,526
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:326
23001972:	6105                	addi	sp,sp,32
23001974:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:312
23001976:	00d14683          	lbu	a3,13(sp)
2300197a:	0017c703          	lbu	a4,1(a5)
2300197e:	fce69ee3          	bne	a3,a4,2300195a <BLSP_Boot_Parse_Signature+0x3e>
23001982:	00e14683          	lbu	a3,14(sp)
23001986:	0027c703          	lbu	a4,2(a5)
2300198a:	fce698e3          	bne	a3,a4,2300195a <BLSP_Boot_Parse_Signature+0x3e>
2300198e:	00f14703          	lbu	a4,15(sp)
23001992:	0037c783          	lbu	a5,3(a5)
23001996:	fcf712e3          	bne	a4,a5,2300195a <BLSP_Boot_Parse_Signature+0x3e>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:313
2300199a:	4785                	li	a5,1
2300199c:	00440593          	addi	a1,s0,4
230019a0:	02f90463          	beq	s2,a5,230019c8 <BLSP_Boot_Parse_Signature+0xac>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:317
230019a4:	1e048513          	addi	a0,s1,480
230019a8:	ff00f097          	auipc	ra,0xff00f
230019ac:	9fe080e7          	jalr	-1538(ra) # 220103a6 <BL602_MemCpy_Fast>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:318
230019b0:	401c                	lw	a5,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:326
230019b2:	40f2                	lw	ra,28(sp)
230019b4:	4462                	lw	s0,24(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:318
230019b6:	d09c                	sw	a5,32(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:326
230019b8:	4942                	lw	s2,16(sp)
230019ba:	44d2                	lw	s1,20(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:325
230019bc:	4501                	li	a0,0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:326
230019be:	6105                	addi	sp,sp,32
230019c0:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:307
230019c2:	20d00513          	li	a0,525
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:326
230019c6:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:314
230019c8:	0e048513          	addi	a0,s1,224
230019cc:	ff00f097          	auipc	ra,0xff00f
230019d0:	9da080e7          	jalr	-1574(ra) # 220103a6 <BL602_MemCpy_Fast>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:315
230019d4:	401c                	lw	a5,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:326
230019d6:	40f2                	lw	ra,28(sp)
230019d8:	4462                	lw	s0,24(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:315
230019da:	ccdc                	sw	a5,28(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:326
230019dc:	4942                	lw	s2,16(sp)
230019de:	44d2                	lw	s1,20(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:325
230019e0:	4501                	li	a0,0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:326
230019e2:	6105                	addi	sp,sp,32
230019e4:	8082                	ret

230019e6 <BLSP_Boot_Parse_AesIv>:
BLSP_Boot_Parse_AesIv():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:338
230019e6:	1141                	addi	sp,sp,-16
230019e8:	c422                	sw	s0,8(sp)
230019ea:	c04a                	sw	s2,0(sp)
230019ec:	842e                	mv	s0,a1
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:341
230019ee:	0105a903          	lw	s2,16(a1)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:338
230019f2:	c226                	sw	s1,4(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:341
230019f4:	45c1                	li	a1,16
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:338
230019f6:	84aa                	mv	s1,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:341
230019f8:	8522                	mv	a0,s0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:338
230019fa:	c606                	sw	ra,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:341
230019fc:	ff00f097          	auipc	ra,0xff00f
23001a00:	e5a080e7          	jalr	-422(ra) # 22010856 <BFLB_Soft_CRC32>
23001a04:	04a91163          	bne	s2,a0,23001a46 <BLSP_Boot_Parse_AesIv+0x60>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:342
23001a08:	04c48513          	addi	a0,s1,76
23001a0c:	4651                	li	a2,20
23001a0e:	85a2                	mv	a1,s0
23001a10:	17a010ef          	jal	ra,23002b8a <memcpy>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:344
23001a14:	0074c783          	lbu	a5,7(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:352
23001a18:	4481                	li	s1,0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:344
23001a1a:	cb81                	beqz	a5,23001a2a <BLSP_Boot_Parse_AesIv+0x44>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:353
23001a1c:	40b2                	lw	ra,12(sp)
23001a1e:	4422                	lw	s0,8(sp)
23001a20:	8526                	mv	a0,s1
23001a22:	4902                	lw	s2,0(sp)
23001a24:	4492                	lw	s1,4(sp)
23001a26:	0141                	addi	sp,sp,16
23001a28:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:345
23001a2a:	8622                	mv	a2,s0
23001a2c:	46d1                	li	a3,20
23001a2e:	4581                	li	a1,0
23001a30:	e8018513          	addi	a0,gp,-384 # 42021700 <shaCtx>
23001a34:	09b040ef          	jal	ra,230062ce <Sec_Eng_SHA256_Update>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:353
23001a38:	40b2                	lw	ra,12(sp)
23001a3a:	4422                	lw	s0,8(sp)
23001a3c:	8526                	mv	a0,s1
23001a3e:	4902                	lw	s2,0(sp)
23001a40:	4492                	lw	s1,4(sp)
23001a42:	0141                	addi	sp,sp,16
23001a44:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:348
23001a46:	23007537          	lui	a0,0x23007
23001a4a:	3f050513          	addi	a0,a0,1008 # 230073f0 <__clz_tab+0x504>
23001a4e:	224050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:353
23001a52:	40b2                	lw	ra,12(sp)
23001a54:	4422                	lw	s0,8(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:349
23001a56:	20900493          	li	s1,521
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:353
23001a5a:	8526                	mv	a0,s1
23001a5c:	4902                	lw	s2,0(sp)
23001a5e:	4492                	lw	s1,4(sp)
23001a60:	0141                	addi	sp,sp,16
23001a62:	8082                	ret

23001a64 <BLSP_Boot_Parser_Check_Signature>:
BLSP_Boot_Parser_Check_Signature():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:364
23001a64:	1141                	addi	sp,sp,-16
23001a66:	c422                	sw	s0,8(sp)
23001a68:	c226                	sw	s1,4(sp)
23001a6a:	c04a                	sw	s2,0(sp)
23001a6c:	c606                	sw	ra,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:368
23001a6e:	ddc18413          	addi	s0,gp,-548 # 4202165c <efuseCfg>
23001a72:	00444603          	lbu	a2,4(s0)
23001a76:	0ad1c583          	lbu	a1,173(gp) # 4202192d <psMode>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:364
23001a7a:	84aa                	mv	s1,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:368
23001a7c:	23007537          	lui	a0,0x23007
23001a80:	4cc50513          	addi	a0,a0,1228 # 230074cc <__clz_tab+0x5e0>
23001a84:	1ee050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:369
23001a88:	0ad1c703          	lbu	a4,173(gp) # 4202192d <psMode>
23001a8c:	4785                	li	a5,1
23001a8e:	06f70663          	beq	a4,a5,23001afa <BLSP_Boot_Parser_Check_Signature+0x96>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:372
23001a92:	0014c783          	lbu	a5,1(s1)
23001a96:	c7a9                	beqz	a5,23001ae0 <BLSP_Boot_Parser_Check_Signature+0x7c>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:373
23001a98:	23007537          	lui	a0,0x23007
23001a9c:	4d450513          	addi	a0,a0,1236 # 230074d4 <__clz_tab+0x5e8>
23001aa0:	1d2050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:374
23001aa4:	2da050ef          	jal	ra,23006d7e <bflb_platform_get_time_ms>
23001aa8:	842a                	mv	s0,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:375
23001aaa:	2ee5                	jal	23001ea2 <BLSP_Boot2_Init_Sec_Eng_PKA>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:376
23001aac:	10048813          	addi	a6,s1,256
23001ab0:	0e048793          	addi	a5,s1,224
23001ab4:	08048713          	addi	a4,s1,128
23001ab8:	06048693          	addi	a3,s1,96
23001abc:	02000613          	li	a2,32
23001ac0:	02c48593          	addi	a1,s1,44
23001ac4:	4501                	li	a0,0
23001ac6:	3f7000ef          	jal	ra,230026bc <bflb_ecdsa_verify>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:379
23001aca:	e131                	bnez	a0,23001b0e <BLSP_Boot_Parser_Check_Signature+0xaa>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:383
23001acc:	2b2050ef          	jal	ra,23006d7e <bflb_platform_get_time_ms>
23001ad0:	408505b3          	sub	a1,a0,s0
23001ad4:	23007537          	lui	a0,0x23007
23001ad8:	4f450513          	addi	a0,a0,1268 # 230074f4 <__clz_tab+0x608>
23001adc:	196050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:385
23001ae0:	23007537          	lui	a0,0x23007
23001ae4:	50450513          	addi	a0,a0,1284 # 23007504 <__clz_tab+0x618>
23001ae8:	18a050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:386
23001aec:	4501                	li	a0,0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:387
23001aee:	40b2                	lw	ra,12(sp)
23001af0:	4422                	lw	s0,8(sp)
23001af2:	4492                	lw	s1,4(sp)
23001af4:	4902                	lw	s2,0(sp)
23001af6:	0141                	addi	sp,sp,16
23001af8:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:369 (discriminator 1)
23001afa:	00444783          	lbu	a5,4(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:370 (discriminator 1)
23001afe:	4501                	li	a0,0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:369 (discriminator 1)
23001b00:	fbc9                	bnez	a5,23001a92 <BLSP_Boot_Parser_Check_Signature+0x2e>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:387
23001b02:	40b2                	lw	ra,12(sp)
23001b04:	4422                	lw	s0,8(sp)
23001b06:	4492                	lw	s1,4(sp)
23001b08:	4902                	lw	s2,0(sp)
23001b0a:	0141                	addi	sp,sp,16
23001b0c:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:380
23001b0e:	23007537          	lui	a0,0x23007
23001b12:	4e450513          	addi	a0,a0,1252 # 230074e4 <__clz_tab+0x5f8>
23001b16:	15c050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:381
23001b1a:	21900513          	li	a0,537
23001b1e:	bfc1                	j	23001aee <BLSP_Boot_Parser_Check_Signature+0x8a>

23001b20 <BLSP_Boot_Parser_Check_Hash>:
BLSP_Boot_Parser_Check_Hash():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:401
23001b20:	00754783          	lbu	a5,7(a0)
23001b24:	c399                	beqz	a5,23001b2a <BLSP_Boot_Parser_Check_Hash+0xa>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:414
23001b26:	4501                	li	a0,0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:415
23001b28:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:398
23001b2a:	7179                	addi	sp,sp,-48
23001b2c:	d422                	sw	s0,40(sp)
23001b2e:	842a                	mv	s0,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:402
23001b30:	860a                	mv	a2,sp
23001b32:	4581                	li	a1,0
23001b34:	e8018513          	addi	a0,gp,-384 # 42021700 <shaCtx>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:398
23001b38:	d606                	sw	ra,44(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:403
23001b3a:	02c40413          	addi	s0,s0,44
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:402
23001b3e:	79e040ef          	jal	ra,230062dc <Sec_Eng_SHA256_Finish>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:403
23001b42:	02000613          	li	a2,32
23001b46:	85a2                	mv	a1,s0
23001b48:	850a                	mv	a0,sp
23001b4a:	070010ef          	jal	ra,23002bba <memcmp>
23001b4e:	ed01                	bnez	a0,23001b66 <BLSP_Boot_Parser_Check_Hash+0x46>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:410
23001b50:	23007537          	lui	a0,0x23007
23001b54:	50450513          	addi	a0,a0,1284 # 23007504 <__clz_tab+0x618>
23001b58:	11a050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:414
23001b5c:	4501                	li	a0,0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:415
23001b5e:	50b2                	lw	ra,44(sp)
23001b60:	5422                	lw	s0,40(sp)
23001b62:	6145                	addi	sp,sp,48
23001b64:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:405
23001b66:	23007537          	lui	a0,0x23007
23001b6a:	4bc50513          	addi	a0,a0,1212 # 230074bc <__clz_tab+0x5d0>
23001b6e:	104050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:406
23001b72:	02000593          	li	a1,32
23001b76:	850a                	mv	a0,sp
23001b78:	cfaff0ef          	jal	ra,23001072 <BLSP_Dump_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:407
23001b7c:	8522                	mv	a0,s0
23001b7e:	02000593          	li	a1,32
23001b82:	cf0ff0ef          	jal	ra,23001072 <BLSP_Dump_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_parser.c:408
23001b86:	21700513          	li	a0,535
23001b8a:	bfd1                	j	23001b5e <BLSP_Boot_Parser_Check_Hash+0x3e>

23001b8c <BLSP_Boot2_Fw_Decompress>:
BLSP_Boot2_Fw_Decompress():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:106
23001b8c:	715d                	addi	sp,sp,-80
23001b8e:	c0ca                	sw	s2,64(sp)
23001b90:	de4e                	sw	s3,60(sp)
23001b92:	dc52                	sw	s4,56(sp)
23001b94:	d65e                	sw	s7,44(sp)
23001b96:	c686                	sw	ra,76(sp)
23001b98:	c4a2                	sw	s0,72(sp)
23001b9a:	c2a6                	sw	s1,68(sp)
23001b9c:	da56                	sw	s5,52(sp)
23001b9e:	d85a                	sw	s6,48(sp)
23001ba0:	d462                	sw	s8,40(sp)
23001ba2:	d266                	sw	s9,36(sp)
23001ba4:	d06a                	sw	s10,32(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:111
23001ba6:	0006a023          	sw	zero,0(a3)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:106
23001baa:	8936                	mv	s2,a3
23001bac:	89b2                	mv	s3,a2
23001bae:	8a2a                	mv	s4,a0
23001bb0:	8bae                	mv	s7,a1
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:112
23001bb2:	12061763          	bnez	a2,23001ce0 <BLSP_Boot2_Fw_Decompress+0x154>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:115
23001bb6:	7cb010ef          	jal	ra,23003b80 <xz_crc32_init>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:116
23001bba:	18b030ef          	jal	ra,23005544 <simple_malloc_init>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:122
23001bbe:	65a1                	lui	a1,0x8
23001bc0:	4505                	li	a0,1
23001bc2:	11f030ef          	jal	ra,230054e0 <xz_dec_init>
23001bc6:	84aa                	mv	s1,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:123
23001bc8:	18050863          	beqz	a0,23001d58 <BLSP_Boot2_Fw_Decompress+0x1cc>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:131
23001bcc:	42022b37          	lui	s6,0x42022
23001bd0:	950b0793          	addi	a5,s6,-1712 # 42021950 <__bss_end__>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:128
23001bd4:	42020ab7          	lui	s5,0x42020
23001bd8:	000a8713          	mv	a4,s5
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:131
23001bdc:	ca3e                	sw	a5,20(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:133
23001bde:	6785                	lui	a5,0x1
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:128
23001be0:	c43a                	sw	a4,8(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:133
23001be2:	ce3e                	sw	a5,28(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:129
23001be4:	c602                	sw	zero,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:130
23001be6:	c802                	sw	zero,16(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:132
23001be8:	cc02                	sw	zero,24(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:133
23001bea:	4701                	li	a4,0
23001bec:	4781                	li	a5,0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:137
23001bee:	23007c37          	lui	s8,0x23007
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:154
23001bf2:	23007cb7          	lui	s9,0x23007
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:136
23001bf6:	0cf70363          	beq	a4,a5,23001cbc <BLSP_Boot2_Fw_Decompress+0x130>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:147
23001bfa:	002c                	addi	a1,sp,8
23001bfc:	8526                	mv	a0,s1
23001bfe:	148030ef          	jal	ra,23004d46 <xz_dec_run>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:149
23001c02:	4762                	lw	a4,24(sp)
23001c04:	6785                	lui	a5,0x1
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:147
23001c06:	842a                	mv	s0,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:149
23001c08:	08f70763          	beq	a4,a5,23001c96 <BLSP_Boot2_Fw_Decompress+0x10a>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:163
23001c0c:	c445                	beqz	s0,23001cb4 <BLSP_Boot2_Fw_Decompress+0x128>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:171
23001c0e:	46e2                	lw	a3,24(sp)
23001c10:	e2b5                	bnez	a3,23001c74 <BLSP_Boot2_Fw_Decompress+0xe8>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:179
23001c12:	4795                	li	a5,5
23001c14:	06f40a63          	beq	s0,a5,23001c88 <BLSP_Boot2_Fw_Decompress+0xfc>
23001c18:	0287ec63          	bltu	a5,s0,23001c50 <BLSP_Boot2_Fw_Decompress+0xc4>
23001c1c:	478d                	li	a5,3
23001c1e:	10f40163          	beq	s0,a5,23001d20 <BLSP_Boot2_Fw_Decompress+0x194>
23001c22:	1087e663          	bltu	a5,s0,23001d2e <BLSP_Boot2_Fw_Decompress+0x1a2>
23001c26:	4785                	li	a5,1
23001c28:	10f41a63          	bne	s0,a5,23001d3c <BLSP_Boot2_Fw_Decompress+0x1b0>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:181
23001c2c:	8526                	mv	a0,s1
23001c2e:	0f9030ef          	jal	ra,23005526 <xz_dec_end>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:182
23001c32:	4501                	li	a0,0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:214
23001c34:	40b6                	lw	ra,76(sp)
23001c36:	4426                	lw	s0,72(sp)
23001c38:	4496                	lw	s1,68(sp)
23001c3a:	4906                	lw	s2,64(sp)
23001c3c:	59f2                	lw	s3,60(sp)
23001c3e:	5a62                	lw	s4,56(sp)
23001c40:	5ad2                	lw	s5,52(sp)
23001c42:	5b42                	lw	s6,48(sp)
23001c44:	5bb2                	lw	s7,44(sp)
23001c46:	5c22                	lw	s8,40(sp)
23001c48:	5c92                	lw	s9,36(sp)
23001c4a:	5d02                	lw	s10,32(sp)
23001c4c:	6161                	addi	sp,sp,80
23001c4e:	8082                	ret
23001c50:	4799                	li	a5,6
23001c52:	0ef40c63          	beq	s0,a5,23001d4a <BLSP_Boot2_Fw_Decompress+0x1be>
23001c56:	47a1                	li	a5,8
23001c58:	0e87e263          	bltu	a5,s0,23001d3c <BLSP_Boot2_Fw_Decompress+0x1b0>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:202
23001c5c:	23007537          	lui	a0,0x23007
23001c60:	5b450513          	addi	a0,a0,1460 # 230075b4 <__clz_tab+0x6c8>
23001c64:	00e050ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:212
23001c68:	8526                	mv	a0,s1
23001c6a:	0bd030ef          	jal	ra,23005526 <xz_dec_end>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:213
23001c6e:	6541                	lui	a0,0x10
23001c70:	157d                	addi	a0,a0,-1
23001c72:	b7c9                	j	23001c34 <BLSP_Boot2_Fw_Decompress+0xa8>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:172
23001c74:	08099b63          	bnez	s3,23001d0a <BLSP_Boot2_Fw_Decompress+0x17e>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:176
23001c78:	00092783          	lw	a5,0(s2)
23001c7c:	96be                	add	a3,a3,a5
23001c7e:	00d92023          	sw	a3,0(s2)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:179
23001c82:	4795                	li	a5,5
23001c84:	f8f41ae3          	bne	s0,a5,23001c18 <BLSP_Boot2_Fw_Decompress+0x8c>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:193
23001c88:	23007537          	lui	a0,0x23007
23001c8c:	57c50513          	addi	a0,a0,1404 # 2300757c <__clz_tab+0x690>
23001c90:	7e3040ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:194
23001c94:	bfd1                	j	23001c68 <BLSP_Boot2_Fw_Decompress+0xdc>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:154
23001c96:	550c8513          	addi	a0,s9,1360 # 23007550 <__clz_tab+0x664>
23001c9a:	7d9040ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:155
23001c9e:	04099b63          	bnez	s3,23001cf4 <BLSP_Boot2_Fw_Decompress+0x168>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:159
23001ca2:	00092783          	lw	a5,0(s2)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:158
23001ca6:	6705                	lui	a4,0x1
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:160
23001ca8:	cc02                	sw	zero,24(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:159
23001caa:	97ba                	add	a5,a5,a4
23001cac:	00f92023          	sw	a5,0(s2)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:158
23001cb0:	9bba                	add	s7,s7,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:163
23001cb2:	fc31                	bnez	s0,23001c0e <BLSP_Boot2_Fw_Decompress+0x82>
23001cb4:	47b2                	lw	a5,12(sp)
23001cb6:	4742                	lw	a4,16(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:136
23001cb8:	f4f711e3          	bne	a4,a5,23001bfa <BLSP_Boot2_Fw_Decompress+0x6e>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:137
23001cbc:	52cc0513          	addi	a0,s8,1324 # 2300752c <__clz_tab+0x640>
23001cc0:	7b3040ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:138
23001cc4:	6605                	lui	a2,0x1
23001cc6:	000a8593          	mv	a1,s5
23001cca:	8552                	mv	a0,s4
23001ccc:	ff00e097          	auipc	ra,0xff00e
23001cd0:	458080e7          	jalr	1112(ra) # 22010124 <BLSP_MediaBoot_Read>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:142
23001cd4:	6785                	lui	a5,0x1
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:138
23001cd6:	e951                	bnez	a0,23001d6a <BLSP_Boot2_Fw_Decompress+0x1de>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:142
23001cd8:	c83e                	sw	a5,16(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:143
23001cda:	c602                	sw	zero,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:144
23001cdc:	9a3e                	add	s4,s4,a5
23001cde:	bf31                	j	23001bfa <BLSP_Boot2_Fw_Decompress+0x6e>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:113
23001ce0:	fff58613          	addi	a2,a1,-1 # 7fff <StackSize+0x7bff>
23001ce4:	964e                	add	a2,a2,s3
23001ce6:	e2c18513          	addi	a0,gp,-468 # 420216ac <flashCfg>
23001cea:	ff00f097          	auipc	ra,0xff00f
23001cee:	af4080e7          	jalr	-1292(ra) # 220107de <XIP_SFlash_Erase_Need_Lock>
23001cf2:	b5d1                	j	23001bb6 <BLSP_Boot2_Fw_Decompress+0x2a>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:156
23001cf4:	85de                	mv	a1,s7
23001cf6:	6685                	lui	a3,0x1
23001cf8:	950b0613          	addi	a2,s6,-1712
23001cfc:	e2c18513          	addi	a0,gp,-468 # 420216ac <flashCfg>
23001d00:	ff00f097          	auipc	ra,0xff00f
23001d04:	ae8080e7          	jalr	-1304(ra) # 220107e8 <XIP_SFlash_Write_Need_Lock>
23001d08:	bf69                	j	23001ca2 <BLSP_Boot2_Fw_Decompress+0x116>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:173
23001d0a:	950b0613          	addi	a2,s6,-1712
23001d0e:	85de                	mv	a1,s7
23001d10:	e2c18513          	addi	a0,gp,-468 # 420216ac <flashCfg>
23001d14:	ff00f097          	auipc	ra,0xff00f
23001d18:	ad4080e7          	jalr	-1324(ra) # 220107e8 <XIP_SFlash_Write_Need_Lock>
23001d1c:	46e2                	lw	a3,24(sp)
23001d1e:	bfa9                	j	23001c78 <BLSP_Boot2_Fw_Decompress+0xec>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:185
23001d20:	23007537          	lui	a0,0x23007
23001d24:	51050513          	addi	a0,a0,1296 # 23007510 <__clz_tab+0x624>
23001d28:	74b040ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:186
23001d2c:	bf35                	j	23001c68 <BLSP_Boot2_Fw_Decompress+0xdc>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:189
23001d2e:	23007537          	lui	a0,0x23007
23001d32:	56050513          	addi	a0,a0,1376 # 23007560 <__clz_tab+0x674>
23001d36:	73d040ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:190
23001d3a:	b73d                	j	23001c68 <BLSP_Boot2_Fw_Decompress+0xdc>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:206
23001d3c:	23007537          	lui	a0,0x23007
23001d40:	5c850513          	addi	a0,a0,1480 # 230075c8 <__clz_tab+0x6dc>
23001d44:	72f040ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:207
23001d48:	b705                	j	23001c68 <BLSP_Boot2_Fw_Decompress+0xdc>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:197
23001d4a:	23007537          	lui	a0,0x23007
23001d4e:	58c50513          	addi	a0,a0,1420 # 2300758c <__clz_tab+0x6a0>
23001d52:	721040ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:198
23001d56:	bf09                	j	23001c68 <BLSP_Boot2_Fw_Decompress+0xdc>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:124
23001d58:	23007537          	lui	a0,0x23007
23001d5c:	51050513          	addi	a0,a0,1296 # 23007510 <__clz_tab+0x624>
23001d60:	713040ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:125
23001d64:	6541                	lui	a0,0x10
23001d66:	156d                	addi	a0,a0,-5
23001d68:	b5f1                	j	23001c34 <BLSP_Boot2_Fw_Decompress+0xa8>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:139
23001d6a:	23007537          	lui	a0,0x23007
23001d6e:	53c50513          	addi	a0,a0,1340 # 2300753c <__clz_tab+0x650>
23001d72:	701040ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:140
23001d76:	4521                	li	a0,8
23001d78:	bd75                	j	23001c34 <BLSP_Boot2_Fw_Decompress+0xa8>

23001d7a <BLSP_Boot2_Update_Fw>:
BLSP_Boot2_Update_Fw():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:233
23001d7a:	7179                	addi	sp,sp,-48
23001d7c:	d422                	sw	s0,40(sp)
23001d7e:	d226                	sw	s1,36(sp)
23001d80:	d04a                	sw	s2,32(sp)
23001d82:	ce4e                	sw	s3,28(sp)
23001d84:	cc52                	sw	s4,24(sp)
23001d86:	ca56                	sw	s5,20(sp)
23001d88:	d606                	sw	ra,44(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:234
23001d8a:	00264783          	lbu	a5,2(a2) # 1002 <StackSize+0xc02>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:233
23001d8e:	8a2a                	mv	s4,a0
23001d90:	8aae                	mv	s5,a1
23001d92:	fff7c993          	not	s3,a5
23001d96:	0019f993          	andi	s3,s3,1
23001d9a:	078a                	slli	a5,a5,0x2
23001d9c:	00299913          	slli	s2,s3,0x2
23001da0:	00f604b3          	add	s1,a2,a5
23001da4:	9932                	add	s2,s2,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:239
23001da6:	00c92583          	lw	a1,12(s2)
23001daa:	44c8                	lw	a0,12(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:233
23001dac:	8432                	mv	s0,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:239
23001dae:	0074                	addi	a3,sp,12
23001db0:	4601                	li	a2,0
23001db2:	3be9                	jal	23001b8c <BLSP_Boot2_Fw_Decompress>
23001db4:	c51d                	beqz	a0,23001de2 <BLSP_Boot2_Update_Fw+0x68>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:244
23001db6:	501c                	lw	a5,32(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:243
23001db8:	01340123          	sb	s3,2(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:245
23001dbc:	8622                	mv	a2,s0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:244
23001dbe:	0785                	addi	a5,a5,1
23001dc0:	d01c                	sw	a5,32(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:245
23001dc2:	85d6                	mv	a1,s5
23001dc4:	001a3513          	seqz	a0,s4
23001dc8:	35f010ef          	jal	ra,23003926 <PtTable_Update_Entry>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:246
23001dcc:	e931                	bnez	a0,23001e20 <BLSP_Boot2_Update_Fw+0xa6>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:250
23001dce:	4501                	li	a0,0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:270
23001dd0:	50b2                	lw	ra,44(sp)
23001dd2:	5422                	lw	s0,40(sp)
23001dd4:	5492                	lw	s1,36(sp)
23001dd6:	5902                	lw	s2,32(sp)
23001dd8:	49f2                	lw	s3,28(sp)
23001dda:	4a62                	lw	s4,24(sp)
23001ddc:	4ad2                	lw	s5,20(sp)
23001dde:	6145                	addi	sp,sp,48
23001de0:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:254
23001de2:	01492603          	lw	a2,20(s2)
23001de6:	00c92583          	lw	a1,12(s2)
23001dea:	44c8                	lw	a0,12(s1)
23001dec:	0074                	addi	a3,sp,12
23001dee:	3b79                	jal	23001b8c <BLSP_Boot2_Fw_Decompress>
23001df0:	e129                	bnez	a0,23001e32 <BLSP_Boot2_Update_Fw+0xb8>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:259
23001df2:	501c                	lw	a5,32(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:258
23001df4:	4732                	lw	a4,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:257
23001df6:	01340123          	sb	s3,2(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:259
23001dfa:	0785                	addi	a5,a5,1
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:258
23001dfc:	cc58                	sw	a4,28(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:259
23001dfe:	d01c                	sw	a5,32(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:260
23001e00:	8622                	mv	a2,s0
23001e02:	85d6                	mv	a1,s5
23001e04:	001a3513          	seqz	a0,s4
23001e08:	31f010ef          	jal	ra,23003926 <PtTable_Update_Entry>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:261
23001e0c:	d169                	beqz	a0,23001dce <BLSP_Boot2_Update_Fw+0x54>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:262
23001e0e:	23007537          	lui	a0,0x23007
23001e12:	60450513          	addi	a0,a0,1540 # 23007604 <__clz_tab+0x718>
23001e16:	65d040ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:263
23001e1a:	6541                	lui	a0,0x10
23001e1c:	157d                	addi	a0,a0,-1
23001e1e:	bf4d                	j	23001dd0 <BLSP_Boot2_Update_Fw+0x56>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:247
23001e20:	23007537          	lui	a0,0x23007
23001e24:	5d450513          	addi	a0,a0,1492 # 230075d4 <__clz_tab+0x6e8>
23001e28:	64b040ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:248
23001e2c:	6541                	lui	a0,0x10
23001e2e:	157d                	addi	a0,a0,-1
23001e30:	b745                	j	23001dd0 <BLSP_Boot2_Update_Fw+0x56>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:266
23001e32:	23007537          	lui	a0,0x23007
23001e36:	63850513          	addi	a0,a0,1592 # 23007638 <__clz_tab+0x74c>
23001e3a:	639040ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:267
23001e3e:	6541                	lui	a0,0x10
23001e40:	157d                	addi	a0,a0,-1
23001e42:	b779                	j	23001dd0 <BLSP_Boot2_Update_Fw+0x56>

23001e44 <BLSP_Boot2_Verify_XZ_Header>:
BLSP_Boot2_Verify_XZ_Header():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:282
23001e44:	230077b7          	lui	a5,0x23007
23001e48:	ed478793          	addi	a5,a5,-300 # 23006ed4 <bflb_platform_print_set+0x8>
23001e4c:	4398                	lw	a4,0(a5)
23001e4e:	0047d783          	lhu	a5,4(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:281
23001e52:	1101                	addi	sp,sp,-32
23001e54:	ce06                	sw	ra,28(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:282
23001e56:	c43a                	sw	a4,8(sp)
23001e58:	00f11623          	sh	a5,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:283
23001e5c:	c911                	beqz	a0,23001e70 <BLSP_Boot2_Verify_XZ_Header+0x2c>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:284
23001e5e:	002c                	addi	a1,sp,8
23001e60:	4619                	li	a2,6
23001e62:	559000ef          	jal	ra,23002bba <memcmp>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:289
23001e66:	40f2                	lw	ra,28(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:284
23001e68:	00153513          	seqz	a0,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:289
23001e6c:	6105                	addi	sp,sp,32
23001e6e:	8082                	ret
23001e70:	40f2                	lw	ra,28(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:288
23001e72:	4501                	li	a0,0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_boot_decompress.c:289
23001e74:	6105                	addi	sp,sp,32
23001e76:	8082                	ret

23001e78 <BLSP_Boot2_Disable_Other_Cache>:
BLSP_Boot2_Disable_Other_Cache():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:145
23001e78:	8082                	ret

23001e7a <BLSP_Boot2_Flush_XIP_Cache>:
BLSP_Boot2_Flush_XIP_Cache():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:157
23001e7a:	ff00e317          	auipc	t1,0xff00e
23001e7e:	7d430067          	jr	2004(t1) # 2201064e <SFlash_Cache_Flush>

23001e82 <BLSP_Boot2_Show_Timer>:
BLSP_Boot2_Show_Timer():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:186
23001e82:	1141                	addi	sp,sp,-16
23001e84:	c606                	sw	ra,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:187
23001e86:	6f9040ef          	jal	ra,23006d7e <bflb_platform_get_time_ms>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:188
23001e8a:	40b2                	lw	ra,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:187
23001e8c:	85aa                	mv	a1,a0
23001e8e:	23007537          	lui	a0,0x23007
23001e92:	65050513          	addi	a0,a0,1616 # 23007650 <__clz_tab+0x764>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:188
23001e96:	0141                	addi	sp,sp,16
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:187
23001e98:	5db0406f          	j	23006c72 <bflb_platform_printf>

23001e9c <BLSP_Boot2_Reset_Sec_Eng>:
BLSP_Boot2_Reset_Sec_Eng():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:227
23001e9c:	4511                	li	a0,4
23001e9e:	74d0306f          	j	23005dea <GLB_AHB_Slave1_Reset>

23001ea2 <BLSP_Boot2_Init_Sec_Eng_PKA>:
BLSP_Boot2_Init_Sec_Eng_PKA():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:239
23001ea2:	1141                	addi	sp,sp,-16
23001ea4:	c606                	sw	ra,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:240
23001ea6:	6cc040ef          	jal	ra,23006572 <Sec_Eng_PKA_Reset>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:242
23001eaa:	40b2                	lw	ra,12(sp)
23001eac:	0141                	addi	sp,sp,16
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:241
23001eae:	6d40406f          	j	23006582 <Sec_Eng_PKA_BigEndian_Enable>

23001eb2 <BLSP_Boot2_Get_CPU_Count>:
BLSP_Boot2_Get_CPU_Count():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:256
23001eb2:	4505                	li	a0,1
23001eb4:	8082                	ret

23001eb6 <BLSP_Read_Power_Save_Mode>:
BLSP_Read_Power_Save_Mode():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:267
23001eb6:	1141                	addi	sp,sp,-16
23001eb8:	c606                	sw	ra,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:268
23001eba:	1a2040ef          	jal	ra,2300605c <HBN_Get_Status_Flag>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:273
23001ebe:	40b2                	lw	ra,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:268
23001ec0:	b1bdb7b7          	lui	a5,0xb1bdb
23001ec4:	7a978793          	addi	a5,a5,1961 # b1bdb7a9 <__noinit_data_end__+0x6fba8e59>
23001ec8:	953e                	add	a0,a0,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:273
23001eca:	00153513          	seqz	a0,a0
23001ece:	0141                	addi	sp,sp,16
23001ed0:	8082                	ret

23001ed2 <BLSP_Boot2_Pass_Parameter>:
BLSP_Boot2_Pass_Parameter():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:285
23001ed2:	1141                	addi	sp,sp,-16
23001ed4:	c226                	sw	s1,4(sp)
23001ed6:	c606                	sw	ra,12(sp)
23001ed8:	c422                	sw	s0,8(sp)
23001eda:	84ae                	mv	s1,a1
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:287
23001edc:	c195                	beqz	a1,23001f00 <BLSP_Boot2_Pass_Parameter+0x2e>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:292
23001ede:	0b418413          	addi	s0,gp,180 # 42021934 <pParameter.9191>
23001ee2:	85aa                	mv	a1,a0
23001ee4:	4008                	lw	a0,0(s0)
23001ee6:	8626                	mv	a2,s1
23001ee8:	ff00e097          	auipc	ra,0xff00e
23001eec:	4be080e7          	jalr	1214(ra) # 220103a6 <BL602_MemCpy_Fast>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:293
23001ef0:	401c                	lw	a5,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:294
23001ef2:	40b2                	lw	ra,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:293
23001ef4:	94be                	add	s1,s1,a5
23001ef6:	c004                	sw	s1,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:294
23001ef8:	4422                	lw	s0,8(sp)
23001efa:	4492                	lw	s1,4(sp)
23001efc:	0141                	addi	sp,sp,16
23001efe:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:288
23001f00:	4501                	li	a0,0
23001f02:	71d030ef          	jal	ra,23005e1e <GLB_Set_EM_Sel>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:294
23001f06:	40b2                	lw	ra,12(sp)
23001f08:	4422                	lw	s0,8(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:289
23001f0a:	4204a7b7          	lui	a5,0x4204a
23001f0e:	c0078793          	addi	a5,a5,-1024 # 42049c00 <__noinit_data_end__+0x172b0>
23001f12:	0af1aa23          	sw	a5,180(gp) # 42021934 <pParameter.9191>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:294
23001f16:	4492                	lw	s1,4(sp)
23001f18:	0141                	addi	sp,sp,16
23001f1a:	8082                	ret

23001f1c <BLSP_Get_User_Specified_Fw>:
BLSP_Get_User_Specified_Fw():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:319
23001f1c:	4000f537          	lui	a0,0x4000f
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:320
23001f20:	10050513          	addi	a0,a0,256 # 4000f100 <__ram_load_addr+0x1d005798>
23001f24:	8082                	ret

23001f26 <BLSP_Clr_User_Specified_Fw>:
BLSP_Clr_User_Specified_Fw():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:334
23001f26:	4000f7b7          	lui	a5,0x4000f
23001f2a:	1007a023          	sw	zero,256(a5) # 4000f100 <__ram_load_addr+0x1d005798>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:335
23001f2e:	8082                	ret

23001f30 <BLSP_Is_MSP_Valid>:
BLSP_Is_MSP_Valid():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:511
23001f30:	f00007b7          	lui	a5,0xf0000
23001f34:	17fd                	addi	a5,a5,-1
23001f36:	8d7d                	and	a0,a0,a5
23001f38:	ddff87b7          	lui	a5,0xddff8
23001f3c:	17fd                	addi	a5,a5,-1
23001f3e:	97aa                	add	a5,a5,a0
23001f40:	00044737          	lui	a4,0x44
23001f44:	00e7e963          	bltu	a5,a4,23001f56 <BLSP_Is_MSP_Valid+0x26>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:515
23001f48:	bdff87b7          	lui	a5,0xbdff8
23001f4c:	17fd                	addi	a5,a5,-1
23001f4e:	953e                	add	a0,a0,a5
23001f50:	00e53533          	sltu	a0,a0,a4
23001f54:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:516
23001f56:	4505                	li	a0,1
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:522
23001f58:	8082                	ret

23001f5a <BLSP_Is_PC_Valid>:
BLSP_Is_PC_Valid():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:535
23001f5a:	ef0007b7          	lui	a5,0xef000
23001f5e:	dd000737          	lui	a4,0xdd000
23001f62:	8fe9                	and	a5,a5,a0
23001f64:	97ba                	add	a5,a5,a4
23001f66:	df000737          	lui	a4,0xdf000
23001f6a:	8ff9                	and	a5,a5,a4
23001f6c:	c39d                	beqz	a5,23001f92 <BLSP_Is_PC_Valid+0x38>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:554
23001f6e:	f00007b7          	lui	a5,0xf0000
23001f72:	17fd                	addi	a5,a5,-1
23001f74:	8fe9                	and	a5,a5,a0
23001f76:	ddff8737          	lui	a4,0xddff8
23001f7a:	973e                	add	a4,a4,a5
23001f7c:	000446b7          	lui	a3,0x44
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:559
23001f80:	4505                	li	a0,1
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:554
23001f82:	00d76963          	bltu	a4,a3,23001f94 <BLSP_Is_PC_Valid+0x3a>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:558
23001f86:	bdff8537          	lui	a0,0xbdff8
23001f8a:	953e                	add	a0,a0,a5
23001f8c:	00d53533          	sltu	a0,a0,a3
23001f90:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:559
23001f92:	4505                	li	a0,1
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:565
23001f94:	8082                	ret

23001f96 <BLSP_Fix_Invalid_MSP_PC>:
BLSP_Fix_Invalid_MSP_PC():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:595
23001f96:	1141                	addi	sp,sp,-16
23001f98:	c422                	sw	s0,8(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:599
23001f9a:	42021437          	lui	s0,0x42021
23001f9e:	09c40413          	addi	s0,s0,156 # 4202109c <__ram_data_end__>
23001fa2:	4808                	lw	a0,16(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:595
23001fa4:	c606                	sw	ra,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:599
23001fa6:	3769                	jal	23001f30 <BLSP_Is_MSP_Valid>
23001fa8:	e119                	bnez	a0,23001fae <BLSP_Fix_Invalid_MSP_PC+0x18>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:600
23001faa:	00042823          	sw	zero,16(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:602
23001fae:	4848                	lw	a0,20(s0)
23001fb0:	376d                	jal	23001f5a <BLSP_Is_PC_Valid>
23001fb2:	e119                	bnez	a0,23001fb8 <BLSP_Fix_Invalid_MSP_PC+0x22>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:603
23001fb4:	00042a23          	sw	zero,20(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:599
23001fb8:	2f042503          	lw	a0,752(s0)
23001fbc:	3f95                	jal	23001f30 <BLSP_Is_MSP_Valid>
23001fbe:	e119                	bnez	a0,23001fc4 <BLSP_Fix_Invalid_MSP_PC+0x2e>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:600
23001fc0:	2e042823          	sw	zero,752(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:602
23001fc4:	2f442503          	lw	a0,756(s0)
23001fc8:	3f49                	jal	23001f5a <BLSP_Is_PC_Valid>
23001fca:	e119                	bnez	a0,23001fd0 <BLSP_Fix_Invalid_MSP_PC+0x3a>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:603
23001fcc:	2e042a23          	sw	zero,756(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:606
23001fd0:	40b2                	lw	ra,12(sp)
23001fd2:	4422                	lw	s0,8(sp)
23001fd4:	0141                	addi	sp,sp,16
23001fd6:	8082                	ret

23001fd8 <bflb_platform_init_uart_debug_gpio>:
bflb_platform_init_uart_debug_gpio():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:713
23001fd8:	1101                	addi	sp,sp,-32
BLSP_Boot2_Get_TX_GPIO():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:622
23001fda:	230007b7          	lui	a5,0x23000
bflb_platform_init_uart_debug_gpio():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:713
23001fde:	cc22                	sw	s0,24(sp)
BLSP_Boot2_Get_TX_GPIO():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:622
23001fe0:	0e57c403          	lbu	s0,229(a5) # 230000e5 <__Vectors+0x25>
bflb_platform_init_uart_debug_gpio():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:723
23001fe4:	479d                	li	a5,7
23001fe6:	00f104a3          	sb	a5,9(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:724
23001fea:	4785                	li	a5,1
23001fec:	00f11523          	sh	a5,10(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:726
23001ff0:	0028                	addi	a0,sp,8
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:718
23001ff2:	10000793          	li	a5,256
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:713
23001ff6:	ce06                	sw	ra,28(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:722
23001ff8:	00810423          	sb	s0,8(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:718
23001ffc:	00f11623          	sh	a5,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:726
23002000:	ff00e097          	auipc	ra,0xff00e
23002004:	450080e7          	jalr	1104(ra) # 22010450 <GLB_GPIO_Init>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:729
23002008:	00747513          	andi	a0,s0,7
2300200c:	4589                	li	a1,2
2300200e:	6a1030ef          	jal	ra,23005eae <GLB_UART_Fun_Sel>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:730
23002012:	40f2                	lw	ra,28(sp)
23002014:	4462                	lw	s0,24(sp)
23002016:	6105                	addi	sp,sp,32
23002018:	8082                	ret

2300201a <bflb_platform_deinit_uart_debug_gpio>:
bflb_platform_deinit_uart_debug_gpio():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:741
2300201a:	1101                	addi	sp,sp,-32
BLSP_Boot2_Get_TX_GPIO():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:622
2300201c:	230007b7          	lui	a5,0x23000
bflb_platform_deinit_uart_debug_gpio():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:741
23002020:	cc22                	sw	s0,24(sp)
BLSP_Boot2_Get_TX_GPIO():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:622
23002022:	0e57c403          	lbu	s0,229(a5) # 230000e5 <__Vectors+0x25>
bflb_platform_deinit_uart_debug_gpio():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:752
23002026:	47ad                	li	a5,11
23002028:	00f104a3          	sb	a5,9(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:745
2300202c:	20000793          	li	a5,512
23002030:	00f11523          	sh	a5,10(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:753
23002034:	0028                	addi	a0,sp,8
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:747
23002036:	10000793          	li	a5,256
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:741
2300203a:	ce06                	sw	ra,28(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:751
2300203c:	00810423          	sb	s0,8(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:747
23002040:	00f11623          	sh	a5,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:753
23002044:	ff00e097          	auipc	ra,0xff00e
23002048:	40c080e7          	jalr	1036(ra) # 22010450 <GLB_GPIO_Init>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:756
2300204c:	45b1                	li	a1,12
2300204e:	02b475b3          	remu	a1,s0,a1
23002052:	00747513          	andi	a0,s0,7
23002056:	659030ef          	jal	ra,23005eae <GLB_UART_Fun_Sel>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:758
2300205a:	40f2                	lw	ra,28(sp)
2300205c:	4462                	lw	s0,24(sp)
2300205e:	6105                	addi	sp,sp,32
23002060:	8082                	ret

23002062 <bflb_ecc_basic_parameter_init.isra.0>:
bflb_ecc_basic_parameter_init():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:113
23002062:	23007637          	lui	a2,0x23007
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:111
23002066:	1141                	addi	sp,sp,-16
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:113
23002068:	4701                	li	a4,0
2300206a:	46a1                	li	a3,8
2300206c:	6dc60613          	addi	a2,a2,1756 # 230076dc <secp256r1N>
23002070:	4581                	li	a1,0
23002072:	450d                	li	a0,3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:111
23002074:	c606                	sw	ra,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:113
23002076:	51e040ef          	jal	ra,23006594 <Sec_Eng_PKA_Write_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:114
2300207a:	23007637          	lui	a2,0x23007
2300207e:	4701                	li	a4,0
23002080:	46a1                	li	a3,8
23002082:	71c60613          	addi	a2,a2,1820 # 2300771c <secp256r1PrimeN_N>
23002086:	4585                	li	a1,1
23002088:	450d                	li	a0,3
2300208a:	50a040ef          	jal	ra,23006594 <Sec_Eng_PKA_Write_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:115
2300208e:	23007637          	lui	a2,0x23007
23002092:	450d                	li	a0,3
23002094:	4701                	li	a4,0
23002096:	46a1                	li	a3,8
23002098:	69c60613          	addi	a2,a2,1692 # 2300769c <secp256r1InvR_N>
2300209c:	4589                	li	a1,2
2300209e:	4f6040ef          	jal	ra,23006594 <Sec_Eng_PKA_Write_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:118
230020a2:	40b2                	lw	ra,12(sp)
230020a4:	4501                	li	a0,0
230020a6:	0141                	addi	sp,sp,16
230020a8:	8082                	ret

230020aa <bflb_ecc_point_mul_init.isra.1>:
bflb_ecc_point_mul_init():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:122
230020aa:	23007637          	lui	a2,0x23007
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:120
230020ae:	1141                	addi	sp,sp,-16
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:122
230020b0:	4701                	li	a4,0
230020b2:	46a1                	li	a3,8
230020b4:	6fc60613          	addi	a2,a2,1788 # 230076fc <secp256r1P>
230020b8:	4581                	li	a1,0
230020ba:	450d                	li	a0,3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:120
230020bc:	c606                	sw	ra,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:122
230020be:	4d6040ef          	jal	ra,23006594 <Sec_Eng_PKA_Write_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:123
230020c2:	23007637          	lui	a2,0x23007
230020c6:	4701                	li	a4,0
230020c8:	46a1                	li	a3,8
230020ca:	73c60613          	addi	a2,a2,1852 # 2300773c <secp256r1PrimeN_P>
230020ce:	4585                	li	a1,1
230020d0:	450d                	li	a0,3
230020d2:	4c2040ef          	jal	ra,23006594 <Sec_Eng_PKA_Write_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:124
230020d6:	23007637          	lui	a2,0x23007
230020da:	4701                	li	a4,0
230020dc:	46a1                	li	a3,8
230020de:	75c60613          	addi	a2,a2,1884 # 2300775c <secp256r1_1>
230020e2:	45a1                	li	a1,8
230020e4:	450d                	li	a0,3
230020e6:	4ae040ef          	jal	ra,23006594 <Sec_Eng_PKA_Write_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:125
230020ea:	23007637          	lui	a2,0x23007
230020ee:	4701                	li	a4,0
230020f0:	46a1                	li	a3,8
230020f2:	7bc60613          	addi	a2,a2,1980 # 230077bc <secp256r1_BAR2>
230020f6:	45a5                	li	a1,9
230020f8:	450d                	li	a0,3
230020fa:	49a040ef          	jal	ra,23006594 <Sec_Eng_PKA_Write_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:126
230020fe:	23007637          	lui	a2,0x23007
23002102:	4701                	li	a4,0
23002104:	46a1                	li	a3,8
23002106:	7dc60613          	addi	a2,a2,2012 # 230077dc <secp256r1_BAR3>
2300210a:	45a9                	li	a1,10
2300210c:	450d                	li	a0,3
2300210e:	486040ef          	jal	ra,23006594 <Sec_Eng_PKA_Write_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:127
23002112:	23007637          	lui	a2,0x23007
23002116:	4701                	li	a4,0
23002118:	46a1                	li	a3,8
2300211a:	7fc60613          	addi	a2,a2,2044 # 230077fc <secp256r1_BAR4>
2300211e:	45ad                	li	a1,11
23002120:	450d                	li	a0,3
23002122:	472040ef          	jal	ra,23006594 <Sec_Eng_PKA_Write_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:128
23002126:	23008637          	lui	a2,0x23008
2300212a:	4701                	li	a4,0
2300212c:	46a1                	li	a3,8
2300212e:	81c60613          	addi	a2,a2,-2020 # 2300781c <secp256r1_BAR8>
23002132:	45b1                	li	a1,12
23002134:	450d                	li	a0,3
23002136:	45e040ef          	jal	ra,23006594 <Sec_Eng_PKA_Write_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:129
2300213a:	23007637          	lui	a2,0x23007
2300213e:	4701                	li	a4,0
23002140:	46a1                	li	a3,8
23002142:	79c60613          	addi	a2,a2,1948 # 2300779c <secp256r1_1P1>
23002146:	45cd                	li	a1,19
23002148:	450d                	li	a0,3
2300214a:	44a040ef          	jal	ra,23006594 <Sec_Eng_PKA_Write_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:130
2300214e:	23007637          	lui	a2,0x23007
23002152:	450d                	li	a0,3
23002154:	4701                	li	a4,0
23002156:	46a1                	li	a3,8
23002158:	77c60613          	addi	a2,a2,1916 # 2300777c <secp256r1_1M1>
2300215c:	45d1                	li	a1,20
2300215e:	436040ef          	jal	ra,23006594 <Sec_Eng_PKA_Write_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:133
23002162:	40b2                	lw	ra,12(sp)
23002164:	4501                	li	a0,0
23002166:	0141                	addi	sp,sp,16
23002168:	8082                	ret

2300216a <bflb_ecdsa_point_add.isra.4>:
bflb_ecdsa_point_add():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:184
2300216a:	1101                	addi	sp,sp,-32
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:202
2300216c:	4881                	li	a7,0
2300216e:	480d                	li	a6,3
23002170:	4791                	li	a5,4
23002172:	470d                	li	a4,3
23002174:	4699                	li	a3,6
23002176:	460d                	li	a2,3
23002178:	45b5                	li	a1,13
2300217a:	450d                	li	a0,3
2300217c:	c002                	sw	zero,0(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:184
2300217e:	ce06                	sw	ra,28(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:202
23002180:	76a040ef          	jal	ra,230068ea <Sec_Eng_PKA_MMUL>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:206
23002184:	4881                	li	a7,0
23002186:	480d                	li	a6,3
23002188:	479d                	li	a5,7
2300218a:	470d                	li	a4,3
2300218c:	468d                	li	a3,3
2300218e:	460d                	li	a2,3
23002190:	45b9                	li	a1,14
23002192:	450d                	li	a0,3
23002194:	c002                	sw	zero,0(sp)
23002196:	754040ef          	jal	ra,230068ea <Sec_Eng_PKA_MMUL>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:210
2300219a:	4881                	li	a7,0
2300219c:	480d                	li	a6,3
2300219e:	4791                	li	a5,4
230021a0:	470d                	li	a4,3
230021a2:	4695                	li	a3,5
230021a4:	460d                	li	a2,3
230021a6:	45bd                	li	a1,15
230021a8:	450d                	li	a0,3
230021aa:	c002                	sw	zero,0(sp)
230021ac:	73e040ef          	jal	ra,230068ea <Sec_Eng_PKA_MMUL>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:214
230021b0:	4881                	li	a7,0
230021b2:	480d                	li	a6,3
230021b4:	479d                	li	a5,7
230021b6:	470d                	li	a4,3
230021b8:	4689                	li	a3,2
230021ba:	460d                	li	a2,3
230021bc:	45c1                	li	a1,16
230021be:	450d                	li	a0,3
230021c0:	c002                	sw	zero,0(sp)
230021c2:	728040ef          	jal	ra,230068ea <Sec_Eng_PKA_MMUL>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:218
230021c6:	4881                	li	a7,0
230021c8:	480d                	li	a6,3
230021ca:	47b9                	li	a5,14
230021cc:	470d                	li	a4,3
230021ce:	46b5                	li	a3,13
230021d0:	460d                	li	a2,3
230021d2:	45b5                	li	a1,13
230021d4:	450d                	li	a0,3
230021d6:	c002                	sw	zero,0(sp)
230021d8:	60e040ef          	jal	ra,230067e6 <Sec_Eng_PKA_MSUB>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:222
230021dc:	4881                	li	a7,0
230021de:	480d                	li	a6,3
230021e0:	47c1                	li	a5,16
230021e2:	470d                	li	a4,3
230021e4:	46bd                	li	a3,15
230021e6:	460d                	li	a2,3
230021e8:	45bd                	li	a1,15
230021ea:	450d                	li	a0,3
230021ec:	c002                	sw	zero,0(sp)
230021ee:	5f8040ef          	jal	ra,230067e6 <Sec_Eng_PKA_MSUB>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:226
230021f2:	4881                	li	a7,0
230021f4:	480d                	li	a6,3
230021f6:	479d                	li	a5,7
230021f8:	470d                	li	a4,3
230021fa:	4691                	li	a3,4
230021fc:	460d                	li	a2,3
230021fe:	4589                	li	a1,2
23002200:	450d                	li	a0,3
23002202:	c002                	sw	zero,0(sp)
23002204:	6e6040ef          	jal	ra,230068ea <Sec_Eng_PKA_MMUL>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:230
23002208:	4881                	li	a7,0
2300220a:	480d                	li	a6,3
2300220c:	47bd                	li	a5,15
2300220e:	470d                	li	a4,3
23002210:	46bd                	li	a3,15
23002212:	460d                	li	a2,3
23002214:	458d                	li	a1,3
23002216:	450d                	li	a0,3
23002218:	c002                	sw	zero,0(sp)
2300221a:	6d0040ef          	jal	ra,230068ea <Sec_Eng_PKA_MMUL>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:234
2300221e:	4881                	li	a7,0
23002220:	480d                	li	a6,3
23002222:	47bd                	li	a5,15
23002224:	470d                	li	a4,3
23002226:	468d                	li	a3,3
23002228:	460d                	li	a2,3
2300222a:	4591                	li	a1,4
2300222c:	450d                	li	a0,3
2300222e:	c002                	sw	zero,0(sp)
23002230:	6ba040ef          	jal	ra,230068ea <Sec_Eng_PKA_MMUL>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:238
23002234:	4881                	li	a7,0
23002236:	480d                	li	a6,3
23002238:	47b5                	li	a5,13
2300223a:	470d                	li	a4,3
2300223c:	46b5                	li	a3,13
2300223e:	460d                	li	a2,3
23002240:	45c5                	li	a1,17
23002242:	450d                	li	a0,3
23002244:	c002                	sw	zero,0(sp)
23002246:	6a4040ef          	jal	ra,230068ea <Sec_Eng_PKA_MMUL>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:242
2300224a:	4881                	li	a7,0
2300224c:	480d                	li	a6,3
2300224e:	4789                	li	a5,2
23002250:	470d                	li	a4,3
23002252:	46c5                	li	a3,17
23002254:	460d                	li	a2,3
23002256:	45c5                	li	a1,17
23002258:	450d                	li	a0,3
2300225a:	c002                	sw	zero,0(sp)
2300225c:	68e040ef          	jal	ra,230068ea <Sec_Eng_PKA_MMUL>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:246
23002260:	4881                	li	a7,0
23002262:	480d                	li	a6,3
23002264:	4791                	li	a5,4
23002266:	470d                	li	a4,3
23002268:	46c5                	li	a3,17
2300226a:	460d                	li	a2,3
2300226c:	45c5                	li	a1,17
2300226e:	450d                	li	a0,3
23002270:	c002                	sw	zero,0(sp)
23002272:	574040ef          	jal	ra,230067e6 <Sec_Eng_PKA_MSUB>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:250
23002276:	4881                	li	a7,0
23002278:	480d                	li	a6,3
2300227a:	478d                	li	a5,3
2300227c:	470d                	li	a4,3
2300227e:	46a5                	li	a3,9
23002280:	460d                	li	a2,3
23002282:	45c9                	li	a1,18
23002284:	450d                	li	a0,3
23002286:	c002                	sw	zero,0(sp)
23002288:	662040ef          	jal	ra,230068ea <Sec_Eng_PKA_MMUL>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:254
2300228c:	4881                	li	a7,0
2300228e:	480d                	li	a6,3
23002290:	47c1                	li	a5,16
23002292:	470d                	li	a4,3
23002294:	46c9                	li	a3,18
23002296:	460d                	li	a2,3
23002298:	45c9                	li	a1,18
2300229a:	450d                	li	a0,3
2300229c:	c002                	sw	zero,0(sp)
2300229e:	64c040ef          	jal	ra,230068ea <Sec_Eng_PKA_MMUL>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:258
230022a2:	4881                	li	a7,0
230022a4:	480d                	li	a6,3
230022a6:	47c9                	li	a5,18
230022a8:	470d                	li	a4,3
230022aa:	46c5                	li	a3,17
230022ac:	460d                	li	a2,3
230022ae:	45c9                	li	a1,18
230022b0:	450d                	li	a0,3
230022b2:	c002                	sw	zero,0(sp)
230022b4:	532040ef          	jal	ra,230067e6 <Sec_Eng_PKA_MSUB>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:262
230022b8:	4881                	li	a7,0
230022ba:	480d                	li	a6,3
230022bc:	47c1                	li	a5,16
230022be:	470d                	li	a4,3
230022c0:	468d                	li	a3,3
230022c2:	460d                	li	a2,3
230022c4:	458d                	li	a1,3
230022c6:	450d                	li	a0,3
230022c8:	c002                	sw	zero,0(sp)
230022ca:	620040ef          	jal	ra,230068ea <Sec_Eng_PKA_MMUL>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:266
230022ce:	4881                	li	a7,0
230022d0:	480d                	li	a6,3
230022d2:	47b9                	li	a5,14
230022d4:	470d                	li	a4,3
230022d6:	4691                	li	a3,4
230022d8:	460d                	li	a2,3
230022da:	45b9                	li	a1,14
230022dc:	450d                	li	a0,3
230022de:	c002                	sw	zero,0(sp)
230022e0:	60a040ef          	jal	ra,230068ea <Sec_Eng_PKA_MMUL>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:270
230022e4:	4881                	li	a7,0
230022e6:	480d                	li	a6,3
230022e8:	4789                	li	a5,2
230022ea:	470d                	li	a4,3
230022ec:	4691                	li	a3,4
230022ee:	460d                	li	a2,3
230022f0:	4591                	li	a1,4
230022f2:	450d                	li	a0,3
230022f4:	c002                	sw	zero,0(sp)
230022f6:	5f4040ef          	jal	ra,230068ea <Sec_Eng_PKA_MMUL>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:274
230022fa:	4881                	li	a7,0
230022fc:	480d                	li	a6,3
230022fe:	47c9                	li	a5,18
23002300:	470d                	li	a4,3
23002302:	46bd                	li	a3,15
23002304:	460d                	li	a2,3
23002306:	4589                	li	a1,2
23002308:	450d                	li	a0,3
2300230a:	c002                	sw	zero,0(sp)
2300230c:	5de040ef          	jal	ra,230068ea <Sec_Eng_PKA_MMUL>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:278
23002310:	4881                	li	a7,0
23002312:	480d                	li	a6,3
23002314:	47c9                	li	a5,18
23002316:	470d                	li	a4,3
23002318:	468d                	li	a3,3
2300231a:	460d                	li	a2,3
2300231c:	458d                	li	a1,3
2300231e:	450d                	li	a0,3
23002320:	c002                	sw	zero,0(sp)
23002322:	4c4040ef          	jal	ra,230067e6 <Sec_Eng_PKA_MSUB>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:282
23002326:	4881                	li	a7,0
23002328:	480d                	li	a6,3
2300232a:	478d                	li	a5,3
2300232c:	470d                	li	a4,3
2300232e:	46b5                	li	a3,13
23002330:	460d                	li	a2,3
23002332:	458d                	li	a1,3
23002334:	450d                	li	a0,3
23002336:	c002                	sw	zero,0(sp)
23002338:	5b2040ef          	jal	ra,230068ea <Sec_Eng_PKA_MMUL>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:286
2300233c:	4785                	li	a5,1
2300233e:	c03e                	sw	a5,0(sp)
23002340:	4881                	li	a7,0
23002342:	480d                	li	a6,3
23002344:	47b9                	li	a5,14
23002346:	470d                	li	a4,3
23002348:	468d                	li	a3,3
2300234a:	460d                	li	a2,3
2300234c:	458d                	li	a1,3
2300234e:	450d                	li	a0,3
23002350:	496040ef          	jal	ra,230067e6 <Sec_Eng_PKA_MSUB>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:288
23002354:	40f2                	lw	ra,28(sp)
23002356:	6105                	addi	sp,sp,32
23002358:	8082                	ret

2300235a <bflb_ecdsa_verify_point_mul.isra.5>:
bflb_ecdsa_verify_point_mul():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:419
2300235a:	715d                	addi	sp,sp,-80
2300235c:	c0ca                	sw	s2,64(sp)
2300235e:	da56                	sw	s5,52(sp)
23002360:	c686                	sw	ra,76(sp)
23002362:	c4a2                	sw	s0,72(sp)
23002364:	c2a6                	sw	s1,68(sp)
23002366:	de4e                	sw	s3,60(sp)
23002368:	dc52                	sw	s4,56(sp)
2300236a:	d85a                	sw	s6,48(sp)
2300236c:	d65e                	sw	s7,44(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:429
2300236e:	00054783          	lbu	a5,0(a0) # bdff8000 <__noinit_data_end__+0x7bfc56b0>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:419
23002372:	8aaa                	mv	s5,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:428
23002374:	4901                	li	s2,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:429
23002376:	eb99                	bnez	a5,2300238c <bflb_ecdsa_verify_point_mul.isra.5+0x32>
23002378:	477d                	li	a4,31
2300237a:	a019                	j	23002380 <bflb_ecdsa_verify_point_mul.isra.5+0x26>
2300237c:	00e90863          	beq	s2,a4,2300238c <bflb_ecdsa_verify_point_mul.isra.5+0x32>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:430
23002380:	0905                	addi	s2,s2,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:429
23002382:	012a87b3          	add	a5,s5,s2
23002386:	0007c783          	lbu	a5,0(a5)
2300238a:	dbed                	beqz	a5,2300237c <bflb_ecdsa_verify_point_mul.isra.5+0x22>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:428
2300238c:	4a7d                	li	s4,31
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:449
2300238e:	23007b37          	lui	s6,0x23007
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:434
23002392:	014a87b3          	add	a5,s5,s4
23002396:	0007c983          	lbu	s3,0(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:436
2300239a:	4b81                	li	s7,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:437
2300239c:	4485                	li	s1,1
2300239e:	aaf5                	j	2300259a <bflb_ecdsa_verify_point_mul.isra.5+0x240>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:447
230023a0:	2a041a63          	bnez	s0,23002654 <bflb_ecdsa_verify_point_mul.isra.5+0x2fa>
230023a4:	30978763          	beq	a5,s1,230026b2 <bflb_ecdsa_verify_point_mul.isra.5+0x358>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:450
230023a8:	2a079663          	bnez	a5,23002654 <bflb_ecdsa_verify_point_mul.isra.5+0x2fa>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:452
230023ac:	3b7d                	jal	2300216a <bflb_ecdsa_point_add.isra.4>
bflb_ecdsa_point_double():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:308
230023ae:	4881                	li	a7,0
230023b0:	480d                	li	a6,3
230023b2:	4795                	li	a5,5
230023b4:	470d                	li	a4,3
230023b6:	4695                	li	a3,5
230023b8:	460d                	li	a2,3
230023ba:	45b5                	li	a1,13
230023bc:	450d                	li	a0,3
230023be:	c002                	sw	zero,0(sp)
230023c0:	52a040ef          	jal	ra,230068ea <Sec_Eng_PKA_MMUL>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:312
230023c4:	4881                	li	a7,0
230023c6:	480d                	li	a6,3
230023c8:	479d                	li	a5,7
230023ca:	470d                	li	a4,3
230023cc:	469d                	li	a3,7
230023ce:	460d                	li	a2,3
230023d0:	45b9                	li	a1,14
230023d2:	450d                	li	a0,3
230023d4:	c002                	sw	zero,0(sp)
230023d6:	514040ef          	jal	ra,230068ea <Sec_Eng_PKA_MMUL>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:316
230023da:	4881                	li	a7,0
230023dc:	480d                	li	a6,3
230023de:	47b9                	li	a5,14
230023e0:	470d                	li	a4,3
230023e2:	46b5                	li	a3,13
230023e4:	460d                	li	a2,3
230023e6:	45b5                	li	a1,13
230023e8:	450d                	li	a0,3
230023ea:	c002                	sw	zero,0(sp)
230023ec:	3fa040ef          	jal	ra,230067e6 <Sec_Eng_PKA_MSUB>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:320
230023f0:	4881                	li	a7,0
230023f2:	480d                	li	a6,3
230023f4:	47b5                	li	a5,13
230023f6:	470d                	li	a4,3
230023f8:	46a9                	li	a3,10
230023fa:	460d                	li	a2,3
230023fc:	45b5                	li	a1,13
230023fe:	450d                	li	a0,3
23002400:	c002                	sw	zero,0(sp)
23002402:	4e8040ef          	jal	ra,230068ea <Sec_Eng_PKA_MMUL>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:324
23002406:	4881                	li	a7,0
23002408:	480d                	li	a6,3
2300240a:	479d                	li	a5,7
2300240c:	470d                	li	a4,3
2300240e:	4699                	li	a3,6
23002410:	460d                	li	a2,3
23002412:	45b9                	li	a1,14
23002414:	450d                	li	a0,3
23002416:	c002                	sw	zero,0(sp)
23002418:	4d2040ef          	jal	ra,230068ea <Sec_Eng_PKA_MMUL>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:328
2300241c:	4881                	li	a7,0
2300241e:	480d                	li	a6,3
23002420:	4799                	li	a5,6
23002422:	470d                	li	a4,3
23002424:	4695                	li	a3,5
23002426:	460d                	li	a2,3
23002428:	45bd                	li	a1,15
2300242a:	450d                	li	a0,3
2300242c:	c002                	sw	zero,0(sp)
2300242e:	4bc040ef          	jal	ra,230068ea <Sec_Eng_PKA_MMUL>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:332
23002432:	4881                	li	a7,0
23002434:	480d                	li	a6,3
23002436:	47b5                	li	a5,13
23002438:	470d                	li	a4,3
2300243a:	46b5                	li	a3,13
2300243c:	460d                	li	a2,3
2300243e:	459d                	li	a1,7
23002440:	450d                	li	a0,3
23002442:	c002                	sw	zero,0(sp)
23002444:	4a6040ef          	jal	ra,230068ea <Sec_Eng_PKA_MMUL>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:336
23002448:	4881                	li	a7,0
2300244a:	480d                	li	a6,3
2300244c:	47b9                	li	a5,14
2300244e:	470d                	li	a4,3
23002450:	46bd                	li	a3,15
23002452:	460d                	li	a2,3
23002454:	45bd                	li	a1,15
23002456:	450d                	li	a0,3
23002458:	c002                	sw	zero,0(sp)
2300245a:	490040ef          	jal	ra,230068ea <Sec_Eng_PKA_MMUL>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:340
2300245e:	4881                	li	a7,0
23002460:	480d                	li	a6,3
23002462:	47bd                	li	a5,15
23002464:	470d                	li	a4,3
23002466:	46b1                	li	a3,12
23002468:	460d                	li	a2,3
2300246a:	4595                	li	a1,5
2300246c:	450d                	li	a0,3
2300246e:	c002                	sw	zero,0(sp)
23002470:	47a040ef          	jal	ra,230068ea <Sec_Eng_PKA_MMUL>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:344
23002474:	4881                	li	a7,0
23002476:	480d                	li	a6,3
23002478:	4795                	li	a5,5
2300247a:	470d                	li	a4,3
2300247c:	469d                	li	a3,7
2300247e:	460d                	li	a2,3
23002480:	459d                	li	a1,7
23002482:	450d                	li	a0,3
23002484:	c002                	sw	zero,0(sp)
23002486:	360040ef          	jal	ra,230067e6 <Sec_Eng_PKA_MSUB>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:348
2300248a:	4881                	li	a7,0
2300248c:	480d                	li	a6,3
2300248e:	479d                	li	a5,7
23002490:	470d                	li	a4,3
23002492:	46a5                	li	a3,9
23002494:	460d                	li	a2,3
23002496:	4595                	li	a1,5
23002498:	450d                	li	a0,3
2300249a:	c002                	sw	zero,0(sp)
2300249c:	44e040ef          	jal	ra,230068ea <Sec_Eng_PKA_MMUL>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:352
230024a0:	4881                	li	a7,0
230024a2:	480d                	li	a6,3
230024a4:	47b9                	li	a5,14
230024a6:	470d                	li	a4,3
230024a8:	4695                	li	a3,5
230024aa:	460d                	li	a2,3
230024ac:	4595                	li	a1,5
230024ae:	450d                	li	a0,3
230024b0:	c002                	sw	zero,0(sp)
230024b2:	438040ef          	jal	ra,230068ea <Sec_Eng_PKA_MMUL>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:356
230024b6:	4881                	li	a7,0
230024b8:	480d                	li	a6,3
230024ba:	47bd                	li	a5,15
230024bc:	470d                	li	a4,3
230024be:	46ad                	li	a3,11
230024c0:	460d                	li	a2,3
230024c2:	45bd                	li	a1,15
230024c4:	450d                	li	a0,3
230024c6:	c002                	sw	zero,0(sp)
230024c8:	422040ef          	jal	ra,230068ea <Sec_Eng_PKA_MMUL>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:360
230024cc:	4881                	li	a7,0
230024ce:	480d                	li	a6,3
230024d0:	47b9                	li	a5,14
230024d2:	470d                	li	a4,3
230024d4:	46b9                	li	a3,14
230024d6:	460d                	li	a2,3
230024d8:	45c1                	li	a1,16
230024da:	450d                	li	a0,3
230024dc:	c002                	sw	zero,0(sp)
230024de:	40c040ef          	jal	ra,230068ea <Sec_Eng_PKA_MMUL>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:364
230024e2:	4881                	li	a7,0
230024e4:	480d                	li	a6,3
230024e6:	479d                	li	a5,7
230024e8:	470d                	li	a4,3
230024ea:	46bd                	li	a3,15
230024ec:	460d                	li	a2,3
230024ee:	45bd                	li	a1,15
230024f0:	450d                	li	a0,3
230024f2:	c002                	sw	zero,0(sp)
230024f4:	2f2040ef          	jal	ra,230067e6 <Sec_Eng_PKA_MSUB>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:368
230024f8:	4881                	li	a7,0
230024fa:	480d                	li	a6,3
230024fc:	4799                	li	a5,6
230024fe:	470d                	li	a4,3
23002500:	4699                	li	a3,6
23002502:	460d                	li	a2,3
23002504:	4599                	li	a1,6
23002506:	450d                	li	a0,3
23002508:	c002                	sw	zero,0(sp)
2300250a:	3e0040ef          	jal	ra,230068ea <Sec_Eng_PKA_MMUL>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:372
2300250e:	4881                	li	a7,0
23002510:	480d                	li	a6,3
23002512:	47b5                	li	a5,13
23002514:	470d                	li	a4,3
23002516:	46bd                	li	a3,15
23002518:	460d                	li	a2,3
2300251a:	45bd                	li	a1,15
2300251c:	450d                	li	a0,3
2300251e:	c002                	sw	zero,0(sp)
23002520:	3ca040ef          	jal	ra,230068ea <Sec_Eng_PKA_MMUL>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:376
23002524:	4881                	li	a7,0
23002526:	480d                	li	a6,3
23002528:	4799                	li	a5,6
2300252a:	470d                	li	a4,3
2300252c:	46b1                	li	a3,12
2300252e:	460d                	li	a2,3
23002530:	4599                	li	a1,6
23002532:	450d                	li	a0,3
23002534:	c002                	sw	zero,0(sp)
23002536:	3b4040ef          	jal	ra,230068ea <Sec_Eng_PKA_MMUL>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:380
2300253a:	4881                	li	a7,0
2300253c:	480d                	li	a6,3
2300253e:	47c1                	li	a5,16
23002540:	470d                	li	a4,3
23002542:	4699                	li	a3,6
23002544:	460d                	li	a2,3
23002546:	4599                	li	a1,6
23002548:	450d                	li	a0,3
2300254a:	c002                	sw	zero,0(sp)
2300254c:	39e040ef          	jal	ra,230068ea <Sec_Eng_PKA_MMUL>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:384
23002550:	4881                	li	a7,0
23002552:	480d                	li	a6,3
23002554:	4799                	li	a5,6
23002556:	470d                	li	a4,3
23002558:	46bd                	li	a3,15
2300255a:	460d                	li	a2,3
2300255c:	4599                	li	a1,6
2300255e:	450d                	li	a0,3
23002560:	c002                	sw	zero,0(sp)
23002562:	284040ef          	jal	ra,230067e6 <Sec_Eng_PKA_MSUB>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:388
23002566:	4881                	li	a7,0
23002568:	480d                	li	a6,3
2300256a:	47c1                	li	a5,16
2300256c:	470d                	li	a4,3
2300256e:	46b9                	li	a3,14
23002570:	460d                	li	a2,3
23002572:	459d                	li	a1,7
23002574:	450d                	li	a0,3
23002576:	c002                	sw	zero,0(sp)
23002578:	372040ef          	jal	ra,230068ea <Sec_Eng_PKA_MMUL>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:392
2300257c:	479d                	li	a5,7
2300257e:	4881                	li	a7,0
23002580:	c026                	sw	s1,0(sp)
23002582:	480d                	li	a6,3
23002584:	470d                	li	a4,3
23002586:	46b1                	li	a3,12
23002588:	460d                	li	a2,3
2300258a:	459d                	li	a1,7
2300258c:	450d                	li	a0,3
2300258e:	35c040ef          	jal	ra,230068ea <Sec_Eng_PKA_MMUL>
bflb_ecdsa_verify_point_mul():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:436
23002592:	0b85                	addi	s7,s7,1
23002594:	47a1                	li	a5,8
23002596:	0efb8163          	beq	s7,a5,23002678 <bflb_ecdsa_verify_point_mul.isra.5+0x31e>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:437
2300259a:	017497b3          	sll	a5,s1,s7
2300259e:	0137f7b3          	and	a5,a5,s3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:438
230025a2:	e00786e3          	beqz	a5,230023ae <bflb_ecdsa_verify_point_mul.isra.5+0x54>
bflb_ecdsa_point_add_inf_check():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:154
230025a6:	4721                	li	a4,8
230025a8:	468d                	li	a3,3
230025aa:	4609                	li	a2,2
230025ac:	458d                	li	a1,3
230025ae:	0868                	addi	a0,sp,28
230025b0:	458040ef          	jal	ra,23006a08 <Sec_Eng_PKA_LCMP>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:156
230025b4:	474d                	li	a4,19
230025b6:	468d                	li	a3,3
230025b8:	460d                	li	a2,3
230025ba:	458d                	li	a1,3
230025bc:	01d10513          	addi	a0,sp,29
230025c0:	448040ef          	jal	ra,23006a08 <Sec_Eng_PKA_LCMP>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:158
230025c4:	470d                	li	a4,3
230025c6:	468d                	li	a3,3
230025c8:	4651                	li	a2,20
230025ca:	458d                	li	a1,3
230025cc:	01e10513          	addi	a0,sp,30
230025d0:	438040ef          	jal	ra,23006a08 <Sec_Eng_PKA_LCMP>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:160
230025d4:	4721                	li	a4,8
230025d6:	468d                	li	a3,3
230025d8:	4611                	li	a2,4
230025da:	458d                	li	a1,3
230025dc:	01f10513          	addi	a0,sp,31
230025e0:	428040ef          	jal	ra,23006a08 <Sec_Eng_PKA_LCMP>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:161
230025e4:	01d14683          	lbu	a3,29(sp)
230025e8:	01c14403          	lbu	s0,28(sp)
230025ec:	01e14703          	lbu	a4,30(sp)
230025f0:	01f14783          	lbu	a5,31(sp)
230025f4:	8c75                	and	s0,s0,a3
230025f6:	8c79                	and	s0,s0,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:164
230025f8:	468d                	li	a3,3
230025fa:	4721                	li	a4,8
230025fc:	4615                	li	a2,5
230025fe:	458d                	li	a1,3
23002600:	0868                	addi	a0,sp,28
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:161
23002602:	8c7d                	and	s0,s0,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:164
23002604:	404040ef          	jal	ra,23006a08 <Sec_Eng_PKA_LCMP>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:166
23002608:	474d                	li	a4,19
2300260a:	468d                	li	a3,3
2300260c:	4619                	li	a2,6
2300260e:	458d                	li	a1,3
23002610:	01d10513          	addi	a0,sp,29
23002614:	3f4040ef          	jal	ra,23006a08 <Sec_Eng_PKA_LCMP>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:168
23002618:	4719                	li	a4,6
2300261a:	468d                	li	a3,3
2300261c:	4651                	li	a2,20
2300261e:	458d                	li	a1,3
23002620:	01e10513          	addi	a0,sp,30
23002624:	3e4040ef          	jal	ra,23006a08 <Sec_Eng_PKA_LCMP>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:170
23002628:	4721                	li	a4,8
2300262a:	468d                	li	a3,3
2300262c:	461d                	li	a2,7
2300262e:	458d                	li	a1,3
23002630:	01f10513          	addi	a0,sp,31
23002634:	3d4040ef          	jal	ra,23006a08 <Sec_Eng_PKA_LCMP>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:171
23002638:	01c14783          	lbu	a5,28(sp)
2300263c:	01d14603          	lbu	a2,29(sp)
23002640:	01e14683          	lbu	a3,30(sp)
23002644:	01f14703          	lbu	a4,31(sp)
23002648:	8ff1                	and	a5,a5,a2
2300264a:	8ff5                	and	a5,a5,a3
2300264c:	8ff9                	and	a5,a5,a4
bflb_ecdsa_verify_point_mul():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:440
2300264e:	d49419e3          	bne	s0,s1,230023a0 <bflb_ecdsa_verify_point_mul.isra.5+0x46>
23002652:	cb95                	beqz	a5,23002686 <bflb_ecdsa_verify_point_mul.isra.5+0x32c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:458
23002654:	23007537          	lui	a0,0x23007
23002658:	67050513          	addi	a0,a0,1648 # 23007670 <__clz_tab+0x784>
2300265c:	616040ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:459
23002660:	557d                	li	a0,-1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:475
23002662:	40b6                	lw	ra,76(sp)
23002664:	4426                	lw	s0,72(sp)
23002666:	4496                	lw	s1,68(sp)
23002668:	4906                	lw	s2,64(sp)
2300266a:	59f2                	lw	s3,60(sp)
2300266c:	5a62                	lw	s4,56(sp)
2300266e:	5ad2                	lw	s5,52(sp)
23002670:	5b42                	lw	s6,48(sp)
23002672:	5bb2                	lw	s7,44(sp)
23002674:	6161                	addi	sp,sp,80
23002676:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:468
23002678:	000a0563          	beqz	s4,23002682 <bflb_ecdsa_verify_point_mul.isra.5+0x328>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:433
2300267c:	1a7d                	addi	s4,s4,-1
2300267e:	d12a7ae3          	bgeu	s4,s2,23002392 <bflb_ecdsa_verify_point_mul.isra.5+0x38>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:474
23002682:	4501                	li	a0,0
23002684:	bff9                	j	23002662 <bflb_ecdsa_verify_point_mul.isra.5+0x308>
bflb_ecdsa_copy_x2_to_x1():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:177
23002686:	4701                	li	a4,0
23002688:	4695                	li	a3,5
2300268a:	460d                	li	a2,3
2300268c:	4589                	li	a1,2
2300268e:	450d                	li	a0,3
23002690:	0ec040ef          	jal	ra,2300677c <Sec_Eng_PKA_Move_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:179
23002694:	4701                	li	a4,0
23002696:	4699                	li	a3,6
23002698:	460d                	li	a2,3
2300269a:	458d                	li	a1,3
2300269c:	450d                	li	a0,3
2300269e:	0de040ef          	jal	ra,2300677c <Sec_Eng_PKA_Move_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:181
230026a2:	4705                	li	a4,1
230026a4:	469d                	li	a3,7
230026a6:	460d                	li	a2,3
230026a8:	4591                	li	a1,4
230026aa:	450d                	li	a0,3
230026ac:	0d0040ef          	jal	ra,2300677c <Sec_Eng_PKA_Move_Data>
230026b0:	b9fd                	j	230023ae <bflb_ecdsa_verify_point_mul.isra.5+0x54>
bflb_ecdsa_verify_point_mul():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:449
230026b2:	664b0513          	addi	a0,s6,1636 # 23007664 <__clz_tab+0x778>
230026b6:	5bc040ef          	jal	ra,23006c72 <bflb_platform_printf>
230026ba:	b9d5                	j	230023ae <bflb_ecdsa_verify_point_mul.isra.5+0x54>

230026bc <bflb_ecdsa_verify>:
bflb_ecdsa_verify():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:717
230026bc:	7129                	addi	sp,sp,-320
230026be:	12112e23          	sw	ra,316(sp)
230026c2:	12812c23          	sw	s0,312(sp)
230026c6:	12912a23          	sw	s1,308(sp)
230026ca:	13212823          	sw	s2,304(sp)
230026ce:	13312623          	sw	s3,300(sp)
230026d2:	13412423          	sw	s4,296(sp)
230026d6:	13512223          	sw	s5,292(sp)
230026da:	13612023          	sw	s6,288(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:724
230026de:	d182                	sw	zero,224(sp)
230026e0:	d382                	sw	zero,228(sp)
230026e2:	d582                	sw	zero,232(sp)
230026e4:	d782                	sw	zero,236(sp)
230026e6:	d982                	sw	zero,240(sp)
230026e8:	db82                	sw	zero,244(sp)
230026ea:	dd82                	sw	zero,248(sp)
230026ec:	df82                	sw	zero,252(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:725
230026ee:	10012023          	sw	zero,256(sp)
230026f2:	10012223          	sw	zero,260(sp)
230026f6:	10012423          	sw	zero,264(sp)
230026fa:	10012623          	sw	zero,268(sp)
230026fe:	10012823          	sw	zero,272(sp)
23002702:	10012a23          	sw	zero,276(sp)
23002706:	10012c23          	sw	zero,280(sp)
2300270a:	10012e23          	sw	zero,284(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:726
2300270e:	ce02                	sw	zero,28(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:729
23002710:	44058a63          	beqz	a1,23002b64 <bflb_ecdsa_verify+0x4a8>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:729 (discriminator 1)
23002714:	44068863          	beqz	a3,23002b64 <bflb_ecdsa_verify+0x4a8>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:729 (discriminator 2)
23002718:	44070663          	beqz	a4,23002b64 <bflb_ecdsa_verify+0x4a8>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:729 (discriminator 3)
2300271c:	44078463          	beqz	a5,23002b64 <bflb_ecdsa_verify+0x4a8>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:729 (discriminator 4)
23002720:	44080263          	beqz	a6,23002b64 <bflb_ecdsa_verify+0x4a8>
23002724:	843e                	mv	s0,a5
23002726:	84c2                	mv	s1,a6
23002728:	8aba                	mv	s5,a4
2300272a:	8a36                	mv	s4,a3
2300272c:	892e                	mv	s2,a1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:734
2300272e:	645030ef          	jal	ra,23006572 <Sec_Eng_PKA_Reset>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:735
23002732:	651030ef          	jal	ra,23006582 <Sec_Eng_PKA_BigEndian_Enable>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:740
23002736:	4701                	li	a4,0
23002738:	46a1                	li	a3,8
2300273a:	8622                	mv	a2,s0
2300273c:	4595                	li	a1,5
2300273e:	450d                	li	a0,3
23002740:	655030ef          	jal	ra,23006594 <Sec_Eng_PKA_Write_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:741
23002744:	23007637          	lui	a2,0x23007
23002748:	4701                	li	a4,0
2300274a:	46a1                	li	a3,8
2300274c:	75c60613          	addi	a2,a2,1884 # 2300775c <secp256r1_1>
23002750:	45a1                	li	a1,8
23002752:	450d                	li	a0,3
23002754:	641030ef          	jal	ra,23006594 <Sec_Eng_PKA_Write_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:743
23002758:	4721                	li	a4,8
2300275a:	468d                	li	a3,3
2300275c:	4615                	li	a2,5
2300275e:	458d                	li	a1,3
23002760:	0868                	addi	a0,sp,28
23002762:	2a6040ef          	jal	ra,23006a08 <Sec_Eng_PKA_LCMP>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:744
23002766:	47f2                	lw	a5,28(sp)
23002768:	4985                	li	s3,1
2300276a:	3f378d63          	beq	a5,s3,23002b64 <bflb_ecdsa_verify+0x4a8>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:747
2300276e:	4701                	li	a4,0
23002770:	46a1                	li	a3,8
23002772:	8626                	mv	a2,s1
23002774:	4595                	li	a1,5
23002776:	450d                	li	a0,3
23002778:	61d030ef          	jal	ra,23006594 <Sec_Eng_PKA_Write_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:749
2300277c:	4721                	li	a4,8
2300277e:	468d                	li	a3,3
23002780:	4615                	li	a2,5
23002782:	458d                	li	a1,3
23002784:	0868                	addi	a0,sp,28
23002786:	282040ef          	jal	ra,23006a08 <Sec_Eng_PKA_LCMP>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:750
2300278a:	47f2                	lw	a5,28(sp)
2300278c:	3d378c63          	beq	a5,s3,23002b64 <bflb_ecdsa_verify+0x4a8>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:754
23002790:	8d3ff0ef          	jal	ra,23002062 <bflb_ecc_basic_parameter_init.isra.0>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:757
23002794:	4701                	li	a4,0
23002796:	46a1                	li	a3,8
23002798:	8622                	mv	a2,s0
2300279a:	4595                	li	a1,5
2300279c:	450d                	li	a0,3
2300279e:	5f7030ef          	jal	ra,23006594 <Sec_Eng_PKA_Write_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:759
230027a2:	4701                	li	a4,0
230027a4:	468d                	li	a3,3
230027a6:	4615                	li	a2,5
230027a8:	458d                	li	a1,3
230027aa:	0868                	addi	a0,sp,28
230027ac:	25c040ef          	jal	ra,23006a08 <Sec_Eng_PKA_LCMP>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:760
230027b0:	4b72                	lw	s6,28(sp)
230027b2:	3b3b1963          	bne	s6,s3,23002b64 <bflb_ecdsa_verify+0x4a8>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:763
230027b6:	4701                	li	a4,0
230027b8:	46a1                	li	a3,8
230027ba:	8626                	mv	a2,s1
230027bc:	4595                	li	a1,5
230027be:	450d                	li	a0,3
230027c0:	5d5030ef          	jal	ra,23006594 <Sec_Eng_PKA_Write_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:765
230027c4:	4701                	li	a4,0
230027c6:	468d                	li	a3,3
230027c8:	4615                	li	a2,5
230027ca:	458d                	li	a1,3
230027cc:	0868                	addi	a0,sp,28
230027ce:	23a040ef          	jal	ra,23006a08 <Sec_Eng_PKA_LCMP>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:766
230027d2:	47f2                	lw	a5,28(sp)
230027d4:	39679863          	bne	a5,s6,23002b64 <bflb_ecdsa_verify+0x4a8>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:774
230027d8:	4701                	li	a4,0
230027da:	8626                	mv	a2,s1
230027dc:	46a1                	li	a3,8
230027de:	4595                	li	a1,5
230027e0:	450d                	li	a0,3
230027e2:	5b3030ef          	jal	ra,23006594 <Sec_Eng_PKA_Write_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:777
230027e6:	4685                	li	a3,1
230027e8:	4621                	li	a2,8
230027ea:	45b5                	li	a1,13
230027ec:	450d                	li	a0,3
230027ee:	72b030ef          	jal	ra,23006718 <Sec_Eng_PKA_CREG>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:778
230027f2:	4685                	li	a3,1
230027f4:	4621                	li	a2,8
230027f6:	45b9                	li	a1,14
230027f8:	450d                	li	a0,3
230027fa:	71f030ef          	jal	ra,23006718 <Sec_Eng_PKA_CREG>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:779
230027fe:	488d                	li	a7,3
23002800:	481d                	li	a6,7
23002802:	4791                	li	a5,4
23002804:	10000713          	li	a4,256
23002808:	4695                	li	a3,5
2300280a:	460d                	li	a2,3
2300280c:	4595                	li	a1,5
2300280e:	450d                	li	a0,3
23002810:	c002                	sw	zero,0(sp)
23002812:	2c4040ef          	jal	ra,23006ad6 <Sec_Eng_PKA_GF2Mont>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:788
23002816:	4805                	li	a6,1
23002818:	4781                	li	a5,0
2300281a:	470d                	li	a4,3
2300281c:	4695                	li	a3,5
2300281e:	460d                	li	a2,3
23002820:	4599                	li	a1,6
23002822:	450d                	li	a0,3
23002824:	164040ef          	jal	ra,23006988 <Sec_Eng_PKA_MINV>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:798
23002828:	448d                	li	s1,3
2300282a:	489d                	li	a7,7
2300282c:	4811                	li	a6,4
2300282e:	4789                	li	a5,2
23002830:	470d                	li	a4,3
23002832:	4699                	li	a3,6
23002834:	460d                	li	a2,3
23002836:	4595                	li	a1,5
23002838:	450d                	li	a0,3
2300283a:	c202                	sw	zero,4(sp)
2300283c:	c026                	sw	s1,0(sp)
2300283e:	2de040ef          	jal	ra,23006b1c <Sec_Eng_PKA_Mont2GF>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:808
23002842:	864a                	mv	a2,s2
23002844:	4701                	li	a4,0
23002846:	46a1                	li	a3,8
23002848:	4599                	li	a1,6
2300284a:	450d                	li	a0,3
2300284c:	549030ef          	jal	ra,23006594 <Sec_Eng_PKA_Write_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:809
23002850:	4801                	li	a6,0
23002852:	4795                	li	a5,5
23002854:	470d                	li	a4,3
23002856:	4699                	li	a3,6
23002858:	460d                	li	a2,3
2300285a:	459d                	li	a1,7
2300285c:	4511                	li	a0,4
2300285e:	214040ef          	jal	ra,23006a72 <Sec_Eng_PKA_LMUL>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:811
23002862:	4805                	li	a6,1
23002864:	4781                	li	a5,0
23002866:	470d                	li	a4,3
23002868:	469d                	li	a3,7
2300286a:	4611                	li	a2,4
2300286c:	459d                	li	a1,7
2300286e:	450d                	li	a0,3
23002870:	014040ef          	jal	ra,23006884 <Sec_Eng_PKA_MREM>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:813
23002874:	46a1                	li	a3,8
23002876:	1190                	addi	a2,sp,224
23002878:	459d                	li	a1,7
2300287a:	450d                	li	a0,3
2300287c:	5db030ef          	jal	ra,23006656 <Sec_Eng_PKA_Read_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:822
23002880:	4701                	li	a4,0
23002882:	46a1                	li	a3,8
23002884:	8622                	mv	a2,s0
23002886:	4599                	li	a1,6
23002888:	450d                	li	a0,3
2300288a:	50b030ef          	jal	ra,23006594 <Sec_Eng_PKA_Write_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:823
2300288e:	4801                	li	a6,0
23002890:	4795                	li	a5,5
23002892:	470d                	li	a4,3
23002894:	4699                	li	a3,6
23002896:	460d                	li	a2,3
23002898:	459d                	li	a1,7
2300289a:	4511                	li	a0,4
2300289c:	1d6040ef          	jal	ra,23006a72 <Sec_Eng_PKA_LMUL>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:825
230028a0:	4805                	li	a6,1
230028a2:	4781                	li	a5,0
230028a4:	470d                	li	a4,3
230028a6:	469d                	li	a3,7
230028a8:	4611                	li	a2,4
230028aa:	459d                	li	a1,7
230028ac:	450d                	li	a0,3
230028ae:	7d7030ef          	jal	ra,23006884 <Sec_Eng_PKA_MREM>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:827
230028b2:	46a1                	li	a3,8
230028b4:	0210                	addi	a2,sp,256
230028b6:	459d                	li	a1,7
230028b8:	450d                	li	a0,3
230028ba:	59d030ef          	jal	ra,23006656 <Sec_Eng_PKA_Read_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:837
230028be:	4685                	li	a3,1
230028c0:	4621                	li	a2,8
230028c2:	459d                	li	a1,7
230028c4:	4511                	li	a0,4
230028c6:	653030ef          	jal	ra,23006718 <Sec_Eng_PKA_CREG>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:839
230028ca:	fe0ff0ef          	jal	ra,230020aa <bflb_ecc_point_mul_init.isra.1>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:843
230028ce:	230089b7          	lui	s3,0x23008
230028d2:	4701                	li	a4,0
230028d4:	46a1                	li	a3,8
230028d6:	87c98613          	addi	a2,s3,-1924 # 2300787c <secp256r1_Zerox>
230028da:	4589                	li	a1,2
230028dc:	450d                	li	a0,3
230028de:	4b7030ef          	jal	ra,23006594 <Sec_Eng_PKA_Write_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:846
230028e2:	23008937          	lui	s2,0x23008
230028e6:	4701                	li	a4,0
230028e8:	46a1                	li	a3,8
230028ea:	89c90613          	addi	a2,s2,-1892 # 2300789c <secp256r1_Zeroy>
230028ee:	458d                	li	a1,3
230028f0:	450d                	li	a0,3
230028f2:	4a3030ef          	jal	ra,23006594 <Sec_Eng_PKA_Write_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:850
230028f6:	4705                	li	a4,1
230028f8:	4689                	li	a3,2
230028fa:	460d                	li	a2,3
230028fc:	4591                	li	a1,4
230028fe:	450d                	li	a0,3
23002900:	67d030ef          	jal	ra,2300677c <Sec_Eng_PKA_Move_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:854
23002904:	23008637          	lui	a2,0x23008
23002908:	4701                	li	a4,0
2300290a:	46a1                	li	a3,8
2300290c:	83c60613          	addi	a2,a2,-1988 # 2300783c <secp256r1_Gx>
23002910:	4595                	li	a1,5
23002912:	450d                	li	a0,3
23002914:	481030ef          	jal	ra,23006594 <Sec_Eng_PKA_Write_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:857
23002918:	23008637          	lui	a2,0x23008
2300291c:	4701                	li	a4,0
2300291e:	46a1                	li	a3,8
23002920:	85c60613          	addi	a2,a2,-1956 # 2300785c <secp256r1_Gy>
23002924:	4599                	li	a1,6
23002926:	450d                	li	a0,3
23002928:	46d030ef          	jal	ra,23006594 <Sec_Eng_PKA_Write_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:861
2300292c:	4705                	li	a4,1
2300292e:	468d                	li	a3,3
23002930:	460d                	li	a2,3
23002932:	459d                	li	a1,7
23002934:	450d                	li	a0,3
23002936:	647030ef          	jal	ra,2300677c <Sec_Eng_PKA_Move_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:863
2300293a:	1188                	addi	a0,sp,224
2300293c:	a1fff0ef          	jal	ra,2300235a <bflb_ecdsa_verify_point_mul.isra.5>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:865
23002940:	46a1                	li	a3,8
23002942:	1010                	addi	a2,sp,32
23002944:	4589                	li	a1,2
23002946:	450d                	li	a0,3
23002948:	50f030ef          	jal	ra,23006656 <Sec_Eng_PKA_Read_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:870
2300294c:	46a1                	li	a3,8
2300294e:	0090                	addi	a2,sp,64
23002950:	458d                	li	a1,3
23002952:	450d                	li	a0,3
23002954:	503030ef          	jal	ra,23006656 <Sec_Eng_PKA_Read_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:875
23002958:	46a1                	li	a3,8
2300295a:	1090                	addi	a2,sp,96
2300295c:	4591                	li	a1,4
2300295e:	450d                	li	a0,3
23002960:	4f7030ef          	jal	ra,23006656 <Sec_Eng_PKA_Read_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:884
23002964:	4701                	li	a4,0
23002966:	46a1                	li	a3,8
23002968:	87c98613          	addi	a2,s3,-1924
2300296c:	4589                	li	a1,2
2300296e:	450d                	li	a0,3
23002970:	425030ef          	jal	ra,23006594 <Sec_Eng_PKA_Write_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:887
23002974:	4701                	li	a4,0
23002976:	46a1                	li	a3,8
23002978:	89c90613          	addi	a2,s2,-1892
2300297c:	458d                	li	a1,3
2300297e:	450d                	li	a0,3
23002980:	415030ef          	jal	ra,23006594 <Sec_Eng_PKA_Write_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:891
23002984:	4705                	li	a4,1
23002986:	4689                	li	a3,2
23002988:	460d                	li	a2,3
2300298a:	4591                	li	a1,4
2300298c:	450d                	li	a0,3
2300298e:	5ef030ef          	jal	ra,2300677c <Sec_Eng_PKA_Move_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:895
23002992:	4701                	li	a4,0
23002994:	46a1                	li	a3,8
23002996:	8652                	mv	a2,s4
23002998:	4595                	li	a1,5
2300299a:	450d                	li	a0,3
2300299c:	3f9030ef          	jal	ra,23006594 <Sec_Eng_PKA_Write_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:900
230029a0:	4685                	li	a3,1
230029a2:	4621                	li	a2,8
230029a4:	45b5                	li	a1,13
230029a6:	450d                	li	a0,3
230029a8:	571030ef          	jal	ra,23006718 <Sec_Eng_PKA_CREG>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:901
230029ac:	4685                	li	a3,1
230029ae:	4621                	li	a2,8
230029b0:	45b9                	li	a1,14
230029b2:	450d                	li	a0,3
230029b4:	565030ef          	jal	ra,23006718 <Sec_Eng_PKA_CREG>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:902
230029b8:	488d                	li	a7,3
230029ba:	481d                	li	a6,7
230029bc:	4791                	li	a5,4
230029be:	10000713          	li	a4,256
230029c2:	4695                	li	a3,5
230029c4:	460d                	li	a2,3
230029c6:	4595                	li	a1,5
230029c8:	450d                	li	a0,3
230029ca:	c002                	sw	zero,0(sp)
230029cc:	10a040ef          	jal	ra,23006ad6 <Sec_Eng_PKA_GF2Mont>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:912
230029d0:	4701                	li	a4,0
230029d2:	46a1                	li	a3,8
230029d4:	8656                	mv	a2,s5
230029d6:	4599                	li	a1,6
230029d8:	450d                	li	a0,3
230029da:	3bb030ef          	jal	ra,23006594 <Sec_Eng_PKA_Write_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:915
230029de:	4685                	li	a3,1
230029e0:	4621                	li	a2,8
230029e2:	45b5                	li	a1,13
230029e4:	450d                	li	a0,3
230029e6:	533030ef          	jal	ra,23006718 <Sec_Eng_PKA_CREG>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:916
230029ea:	4685                	li	a3,1
230029ec:	4621                	li	a2,8
230029ee:	45b9                	li	a1,14
230029f0:	450d                	li	a0,3
230029f2:	527030ef          	jal	ra,23006718 <Sec_Eng_PKA_CREG>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:917
230029f6:	488d                	li	a7,3
230029f8:	481d                	li	a6,7
230029fa:	4791                	li	a5,4
230029fc:	10000713          	li	a4,256
23002a00:	4699                	li	a3,6
23002a02:	460d                	li	a2,3
23002a04:	4599                	li	a1,6
23002a06:	450d                	li	a0,3
23002a08:	c002                	sw	zero,0(sp)
23002a0a:	0cc040ef          	jal	ra,23006ad6 <Sec_Eng_PKA_GF2Mont>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:928
23002a0e:	4705                	li	a4,1
23002a10:	468d                	li	a3,3
23002a12:	460d                	li	a2,3
23002a14:	459d                	li	a1,7
23002a16:	450d                	li	a0,3
23002a18:	565030ef          	jal	ra,2300677c <Sec_Eng_PKA_Move_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:931
23002a1c:	4685                	li	a3,1
23002a1e:	4621                	li	a2,8
23002a20:	459d                	li	a1,7
23002a22:	4511                	li	a0,4
23002a24:	4f5030ef          	jal	ra,23006718 <Sec_Eng_PKA_CREG>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:933
23002a28:	0208                	addi	a0,sp,256
23002a2a:	931ff0ef          	jal	ra,2300235a <bflb_ecdsa_verify_point_mul.isra.5>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:935
23002a2e:	46a1                	li	a3,8
23002a30:	0110                	addi	a2,sp,128
23002a32:	4589                	li	a1,2
23002a34:	450d                	li	a0,3
23002a36:	421030ef          	jal	ra,23006656 <Sec_Eng_PKA_Read_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:940
23002a3a:	46a1                	li	a3,8
23002a3c:	1110                	addi	a2,sp,160
23002a3e:	458d                	li	a1,3
23002a40:	450d                	li	a0,3
23002a42:	415030ef          	jal	ra,23006656 <Sec_Eng_PKA_Read_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:945
23002a46:	46a1                	li	a3,8
23002a48:	0190                	addi	a2,sp,192
23002a4a:	4591                	li	a1,4
23002a4c:	450d                	li	a0,3
23002a4e:	409030ef          	jal	ra,23006656 <Sec_Eng_PKA_Read_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:954
23002a52:	4701                	li	a4,0
23002a54:	4689                	li	a3,2
23002a56:	460d                	li	a2,3
23002a58:	4595                	li	a1,5
23002a5a:	450d                	li	a0,3
23002a5c:	521030ef          	jal	ra,2300677c <Sec_Eng_PKA_Move_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:957
23002a60:	4701                	li	a4,0
23002a62:	468d                	li	a3,3
23002a64:	460d                	li	a2,3
23002a66:	4599                	li	a1,6
23002a68:	450d                	li	a0,3
23002a6a:	513030ef          	jal	ra,2300677c <Sec_Eng_PKA_Move_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:960
23002a6e:	4705                	li	a4,1
23002a70:	4691                	li	a3,4
23002a72:	460d                	li	a2,3
23002a74:	459d                	li	a1,7
23002a76:	450d                	li	a0,3
23002a78:	505030ef          	jal	ra,2300677c <Sec_Eng_PKA_Move_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:964
23002a7c:	4701                	li	a4,0
23002a7e:	46a1                	li	a3,8
23002a80:	1010                	addi	a2,sp,32
23002a82:	4589                	li	a1,2
23002a84:	450d                	li	a0,3
23002a86:	30f030ef          	jal	ra,23006594 <Sec_Eng_PKA_Write_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:967
23002a8a:	4701                	li	a4,0
23002a8c:	46a1                	li	a3,8
23002a8e:	0090                	addi	a2,sp,64
23002a90:	458d                	li	a1,3
23002a92:	450d                	li	a0,3
23002a94:	301030ef          	jal	ra,23006594 <Sec_Eng_PKA_Write_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:970
23002a98:	4701                	li	a4,0
23002a9a:	46a1                	li	a3,8
23002a9c:	1090                	addi	a2,sp,96
23002a9e:	4591                	li	a1,4
23002aa0:	450d                	li	a0,3
23002aa2:	2f3030ef          	jal	ra,23006594 <Sec_Eng_PKA_Write_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:974
23002aa6:	ec4ff0ef          	jal	ra,2300216a <bflb_ecdsa_point_add.isra.4>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:979
23002aaa:	4805                	li	a6,1
23002aac:	4781                	li	a5,0
23002aae:	470d                	li	a4,3
23002ab0:	4691                	li	a3,4
23002ab2:	460d                	li	a2,3
23002ab4:	4595                	li	a1,5
23002ab6:	450d                	li	a0,3
23002ab8:	6d1030ef          	jal	ra,23006988 <Sec_Eng_PKA_MINV>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:982
23002abc:	23007637          	lui	a2,0x23007
23002ac0:	4701                	li	a4,0
23002ac2:	46a1                	li	a3,8
23002ac4:	6bc60613          	addi	a2,a2,1724 # 230076bc <secp256r1InvR_P>
23002ac8:	4599                	li	a1,6
23002aca:	450d                	li	a0,3
23002acc:	2c9030ef          	jal	ra,23006594 <Sec_Eng_PKA_Write_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:984
23002ad0:	4685                	li	a3,1
23002ad2:	4621                	li	a2,8
23002ad4:	45b5                	li	a1,13
23002ad6:	450d                	li	a0,3
23002ad8:	441030ef          	jal	ra,23006718 <Sec_Eng_PKA_CREG>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:985
23002adc:	4685                	li	a3,1
23002ade:	4621                	li	a2,8
23002ae0:	45b9                	li	a1,14
23002ae2:	450d                	li	a0,3
23002ae4:	435030ef          	jal	ra,23006718 <Sec_Eng_PKA_CREG>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:987
23002ae8:	489d                	li	a7,7
23002aea:	4811                	li	a6,4
23002aec:	4799                	li	a5,6
23002aee:	470d                	li	a4,3
23002af0:	4695                	li	a3,5
23002af2:	460d                	li	a2,3
23002af4:	4595                	li	a1,5
23002af6:	450d                	li	a0,3
23002af8:	c202                	sw	zero,4(sp)
23002afa:	c026                	sw	s1,0(sp)
23002afc:	020040ef          	jal	ra,23006b1c <Sec_Eng_PKA_Mont2GF>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:992
23002b00:	489d                	li	a7,7
23002b02:	4811                	li	a6,4
23002b04:	4799                	li	a5,6
23002b06:	470d                	li	a4,3
23002b08:	4689                	li	a3,2
23002b0a:	460d                	li	a2,3
23002b0c:	4599                	li	a1,6
23002b0e:	450d                	li	a0,3
23002b10:	c202                	sw	zero,4(sp)
23002b12:	c026                	sw	s1,0(sp)
23002b14:	008040ef          	jal	ra,23006b1c <Sec_Eng_PKA_Mont2GF>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:997
23002b18:	4799                	li	a5,6
23002b1a:	470d                	li	a4,3
23002b1c:	489d                	li	a7,7
23002b1e:	4811                	li	a6,4
23002b20:	4695                	li	a3,5
23002b22:	460d                	li	a2,3
23002b24:	4589                	li	a1,2
23002b26:	450d                	li	a0,3
23002b28:	c202                	sw	zero,4(sp)
23002b2a:	c026                	sw	s1,0(sp)
23002b2c:	7f1030ef          	jal	ra,23006b1c <Sec_Eng_PKA_Mont2GF>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:999
23002b30:	46a1                	li	a3,8
23002b32:	0110                	addi	a2,sp,128
23002b34:	4589                	li	a1,2
23002b36:	450d                	li	a0,3
23002b38:	31f030ef          	jal	ra,23006656 <Sec_Eng_PKA_Read_Data>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:1008
23002b3c:	4018                	lw	a4,0(s0)
23002b3e:	478a                	lw	a5,128(sp)
23002b40:	02f71263          	bne	a4,a5,23002b64 <bflb_ecdsa_verify+0x4a8>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:1007
23002b44:	4785                	li	a5,1
23002b46:	ce3e                	sw	a5,28(sp)
23002b48:	0118                	addi	a4,sp,128
23002b4a:	00440793          	addi	a5,s0,4
23002b4e:	096c                	addi	a1,sp,156
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:1008
23002b50:	4350                	lw	a2,4(a4)
23002b52:	4394                	lw	a3,0(a5)
23002b54:	0711                	addi	a4,a4,4
23002b56:	0791                	addi	a5,a5,4
23002b58:	00d61663          	bne	a2,a3,23002b64 <bflb_ecdsa_verify+0x4a8>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:1007 (discriminator 2)
23002b5c:	fee59ae3          	bne	a1,a4,23002b50 <bflb_ecdsa_verify+0x494>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:1015
23002b60:	4501                	li	a0,0
23002b62:	a011                	j	23002b66 <bflb_ecdsa_verify+0x4aa>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:1009
23002b64:	557d                	li	a0,-1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/cipher_suite/src/bflb_ecdsa.c:1016
23002b66:	13c12083          	lw	ra,316(sp)
23002b6a:	13812403          	lw	s0,312(sp)
23002b6e:	13412483          	lw	s1,308(sp)
23002b72:	13012903          	lw	s2,304(sp)
23002b76:	12c12983          	lw	s3,300(sp)
23002b7a:	12812a03          	lw	s4,296(sp)
23002b7e:	12412a83          	lw	s5,292(sp)
23002b82:	12012b03          	lw	s6,288(sp)
23002b86:	6131                	addi	sp,sp,320
23002b88:	8082                	ret

23002b8a <memcpy>:
memcpy():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/memcpy.c:12
23002b8a:	ca19                	beqz	a2,23002ba0 <memcpy+0x16>
23002b8c:	962e                	add	a2,a2,a1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/memcpy.c:11
23002b8e:	87aa                	mv	a5,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/memcpy.c:13
23002b90:	0585                	addi	a1,a1,1
23002b92:	fff5c703          	lbu	a4,-1(a1)
23002b96:	0785                	addi	a5,a5,1
23002b98:	fee78fa3          	sb	a4,-1(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/memcpy.c:12
23002b9c:	fec59ae3          	bne	a1,a2,23002b90 <memcpy+0x6>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/memcpy.c:16
23002ba0:	8082                	ret

23002ba2 <memset>:
memset():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/memset.c:11
23002ba2:	0ff5f593          	andi	a1,a1,255
23002ba6:	00c50733          	add	a4,a0,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/memset.c:10
23002baa:	87aa                	mv	a5,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/memset.c:11
23002bac:	c611                	beqz	a2,23002bb8 <memset+0x16>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/memset.c:12
23002bae:	0785                	addi	a5,a5,1
23002bb0:	feb78fa3          	sb	a1,-1(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/memset.c:11
23002bb4:	fee79de3          	bne	a5,a4,23002bae <memset+0xc>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/memset.c:15
23002bb8:	8082                	ret

23002bba <memcmp>:
memcmp():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/memcmp.c:16
23002bba:	962e                	add	a2,a2,a1
23002bbc:	a801                	j	23002bcc <memcmp+0x12>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/memcmp.c:17
23002bbe:	0585                	addi	a1,a1,1
23002bc0:	fff54783          	lbu	a5,-1(a0)
23002bc4:	fff5c703          	lbu	a4,-1(a1)
23002bc8:	8f99                	sub	a5,a5,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/memcmp.c:18
23002bca:	e789                	bnez	a5,23002bd4 <memcmp+0x1a>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/memcmp.c:17
23002bcc:	0505                	addi	a0,a0,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/memcmp.c:16
23002bce:	fec598e3          	bne	a1,a2,23002bbe <memcmp+0x4>
23002bd2:	4781                	li	a5,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/memcmp.c:23
23002bd4:	853e                	mv	a0,a5
23002bd6:	8082                	ret

23002bd8 <vsnprintf>:
vsnprintf():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:724
23002bd8:	23008737          	lui	a4,0x23008
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:485
23002bdc:	7135                	addi	sp,sp,-160
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:724
23002bde:	8e470793          	addi	a5,a4,-1820 # 230078e4 <ucdigits.1537+0x14>
format_int():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:62
23002be2:	23008737          	lui	a4,0x23008
vsnprintf():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:724
23002be6:	d83e                	sw	a5,48(sp)
format_int():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:62
23002be8:	8d070793          	addi	a5,a4,-1840 # 230078d0 <ucdigits.1537>
23002bec:	23008737          	lui	a4,0x23008
23002bf0:	d43e                	sw	a5,40(sp)
23002bf2:	8bc70793          	addi	a5,a4,-1860 # 230078bc <lcdigits.1536>
vsnprintf():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:485
23002bf6:	c94a                	sw	s2,144(sp)
23002bf8:	c552                	sw	s4,136(sp)
23002bfa:	c356                	sw	s5,132(sp)
23002bfc:	c15a                	sw	s6,128(sp)
23002bfe:	d6ee                	sw	s11,108(sp)
23002c00:	cf06                	sw	ra,156(sp)
23002c02:	cd22                	sw	s0,152(sp)
23002c04:	cb26                	sw	s1,148(sp)
23002c06:	c74e                	sw	s3,140(sp)
23002c08:	dede                	sw	s7,124(sp)
23002c0a:	dce2                	sw	s8,120(sp)
23002c0c:	dae6                	sw	s9,116(sp)
23002c0e:	d8ea                	sw	s10,112(sp)
23002c10:	d22a                	sw	a0,36(sp)
23002c12:	892e                	mv	s2,a1
23002c14:	8a32                	mv	s4,a2
23002c16:	c236                	sw	a3,4(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:488
23002c18:	8aaa                	mv	s5,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:489
23002c1a:	4d81                	li	s11,0
23002c1c:	06c00b13          	li	s6,108
format_int():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:62
23002c20:	d63e                	sw	a5,44(sp)
vsnprintf():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
23002c22:	000a4703          	lbu	a4,0(s4) # 42020000 <__StackTop>
23002c26:	001a0d13          	addi	s10,s4,1
23002c2a:	c70d                	beqz	a4,23002c54 <vsnprintf+0x7c>
23002c2c:	03000c93          	li	s9,48
23002c30:	02b00c13          	li	s8,43
23002c34:	02000b93          	li	s7,32
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:511
23002c38:	02500793          	li	a5,37
23002c3c:	04f70763          	beq	a4,a5,23002c8a <vsnprintf+0xb2>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
23002c40:	0d05                	addi	s10,s10,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:518
23002c42:	012df563          	bgeu	s11,s2,23002c4c <vsnprintf+0x74>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:518 (discriminator 1)
23002c46:	00ea8023          	sb	a4,0(s5) # 42020000 <__StackTop>
23002c4a:	0a85                	addi	s5,s5,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508 (discriminator 3)
23002c4c:	fffd4703          	lbu	a4,-1(s10) # fff <StackSize+0xbff>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:518 (discriminator 3)
23002c50:	0d85                	addi	s11,s11,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508 (discriminator 3)
23002c52:	f76d                	bnez	a4,23002c3c <vsnprintf+0x64>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:815
23002c54:	032df463          	bgeu	s11,s2,23002c7c <vsnprintf+0xa4>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:816
23002c58:	000a8023          	sb	zero,0(s5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:821
23002c5c:	40fa                	lw	ra,156(sp)
23002c5e:	446a                	lw	s0,152(sp)
23002c60:	856e                	mv	a0,s11
23002c62:	44da                	lw	s1,148(sp)
23002c64:	494a                	lw	s2,144(sp)
23002c66:	49ba                	lw	s3,140(sp)
23002c68:	4a2a                	lw	s4,136(sp)
23002c6a:	4a9a                	lw	s5,132(sp)
23002c6c:	4b0a                	lw	s6,128(sp)
23002c6e:	5bf6                	lw	s7,124(sp)
23002c70:	5c66                	lw	s8,120(sp)
23002c72:	5cd6                	lw	s9,116(sp)
23002c74:	5d46                	lw	s10,112(sp)
23002c76:	5db6                	lw	s11,108(sp)
23002c78:	610d                	addi	sp,sp,160
23002c7a:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:817
23002c7c:	fe0900e3          	beqz	s2,23002c5c <vsnprintf+0x84>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:818
23002c80:	5792                	lw	a5,36(sp)
23002c82:	993e                	add	s2,s2,a5
23002c84:	fe090fa3          	sb	zero,-1(s2)
23002c88:	bfd1                	j	23002c5c <vsnprintf+0x84>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
23002c8a:	000d4783          	lbu	a5,0(s10)
23002c8e:	d3f9                	beqz	a5,23002c54 <vsnprintf+0x7c>
23002c90:	02700693          	li	a3,39
23002c94:	876a                	mv	a4,s10
23002c96:	4481                	li	s1,0
23002c98:	02300613          	li	a2,35
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:523
23002c9c:	0ed78663          	beq	a5,a3,23002d88 <vsnprintf+0x1b0>
23002ca0:	0cf6f763          	bgeu	a3,a5,23002d6e <vsnprintf+0x196>
23002ca4:	02d00593          	li	a1,45
23002ca8:	2ab78963          	beq	a5,a1,23002f5a <vsnprintf+0x382>
23002cac:	2b978f63          	beq	a5,s9,23002f6a <vsnprintf+0x392>
23002cb0:	2d878563          	beq	a5,s8,23002f7a <vsnprintf+0x3a2>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
23002cb4:	00074683          	lbu	a3,0(a4)
23002cb8:	00170793          	addi	a5,a4,1
23002cbc:	dec1                	beqz	a3,23002c54 <vsnprintf+0x7c>
23002cbe:	4401                	li	s0,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:551
23002cc0:	00241713          	slli	a4,s0,0x2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:550
23002cc4:	fd068613          	addi	a2,a3,-48 # 43fd0 <StackSize+0x43bd0>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:551
23002cc8:	9722                	add	a4,a4,s0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:550
23002cca:	48a5                	li	a7,9
23002ccc:	0ff67593          	andi	a1,a2,255
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:552
23002cd0:	02a00313          	li	t1,42
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:551
23002cd4:	0706                	slli	a4,a4,0x1
23002cd6:	fff78513          	addi	a0,a5,-1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:550
23002cda:	02b8e463          	bltu	a7,a1,23002d02 <vsnprintf+0x12a>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
23002cde:	0007c683          	lbu	a3,0(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:551
23002ce2:	00e60433          	add	s0,a2,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
23002ce6:	d6bd                	beqz	a3,23002c54 <vsnprintf+0x7c>
23002ce8:	0785                	addi	a5,a5,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:551
23002cea:	00241713          	slli	a4,s0,0x2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:550
23002cee:	fd068613          	addi	a2,a3,-48
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:551
23002cf2:	9722                	add	a4,a4,s0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:550
23002cf4:	0ff67593          	andi	a1,a2,255
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:551
23002cf8:	0706                	slli	a4,a4,0x1
23002cfa:	fff78513          	addi	a0,a5,-1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:550
23002cfe:	feb8f0e3          	bgeu	a7,a1,23002cde <vsnprintf+0x106>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:552
23002d02:	22668463          	beq	a3,t1,23002f2a <vsnprintf+0x352>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:558
23002d06:	02e00713          	li	a4,46
23002d0a:	36e68963          	beq	a3,a4,2300307c <vsnprintf+0x4a4>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
23002d0e:	00054703          	lbu	a4,0(a0)
23002d12:	8a3e                	mv	s4,a5
23002d14:	d321                	beqz	a4,23002c54 <vsnprintf+0x7c>
23002d16:	5e7d                	li	t3,-1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:590
23002d18:	4681                	li	a3,0
23002d1a:	07100313          	li	t1,113
23002d1e:	06800893          	li	a7,104
23002d22:	06a00513          	li	a0,106
23002d26:	04c00593          	li	a1,76
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:581
23002d2a:	03670f63          	beq	a4,s6,23002d68 <vsnprintf+0x190>
23002d2e:	06eb6563          	bltu	s6,a4,23002d98 <vsnprintf+0x1c0>
23002d32:	35170263          	beq	a4,a7,23003076 <vsnprintf+0x49e>
23002d36:	1ca71f63          	bne	a4,a0,23002f14 <vsnprintf+0x33c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
23002d3a:	000a4703          	lbu	a4,0(s4)
23002d3e:	db19                	beqz	a4,23002c54 <vsnprintf+0x7c>
23002d40:	001a0613          	addi	a2,s4,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:581
23002d44:	0f670063          	beq	a4,s6,23002e24 <vsnprintf+0x24c>
23002d48:	68eb6b63          	bltu	s6,a4,230033de <vsnprintf+0x806>
23002d4c:	01170ce3          	beq	a4,a7,23003564 <vsnprintf+0x98c>
23002d50:	6ca71e63          	bne	a4,a0,2300342c <vsnprintf+0x854>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
23002d54:	001a4703          	lbu	a4,1(s4)
23002d58:	002a0793          	addi	a5,s4,2
23002d5c:	ee070ce3          	beqz	a4,23002c54 <vsnprintf+0x7c>
23002d60:	8a3e                	mv	s4,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:590
23002d62:	4689                	li	a3,2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:581
23002d64:	fd6715e3          	bne	a4,s6,23002d2e <vsnprintf+0x156>
23002d68:	0685                	addi	a3,a3,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
23002d6a:	8652                	mv	a2,s4
23002d6c:	aa45                	j	23002f1c <vsnprintf+0x344>
23002d6e:	21778e63          	beq	a5,s7,23002f8a <vsnprintf+0x3b2>
23002d72:	f4c791e3          	bne	a5,a2,23002cb4 <vsnprintf+0xdc>
23002d76:	00174783          	lbu	a5,1(a4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:537
23002d7a:	0204e493          	ori	s1,s1,32
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
23002d7e:	ec078be3          	beqz	a5,23002c54 <vsnprintf+0x7c>
23002d82:	0705                	addi	a4,a4,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:523
23002d84:	f0d79ee3          	bne	a5,a3,23002ca0 <vsnprintf+0xc8>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
23002d88:	00174783          	lbu	a5,1(a4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:531
23002d8c:	0084e493          	ori	s1,s1,8
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
23002d90:	ec0782e3          	beqz	a5,23002c54 <vsnprintf+0x7c>
23002d94:	0705                	addi	a4,a4,1
23002d96:	b7fd                	j	23002d84 <vsnprintf+0x1ac>
23002d98:	07400793          	li	a5,116
23002d9c:	1af70563          	beq	a4,a5,23002f46 <vsnprintf+0x36e>
23002da0:	07a00793          	li	a5,122
23002da4:	08f71263          	bne	a4,a5,23002e28 <vsnprintf+0x250>
23002da8:	000a4703          	lbu	a4,0(s4)
23002dac:	ea0704e3          	beqz	a4,23002c54 <vsnprintf+0x7c>
23002db0:	001a0613          	addi	a2,s4,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:581
23002db4:	1b670163          	beq	a4,s6,23002f56 <vsnprintf+0x37e>
23002db8:	06eb7063          	bgeu	s6,a4,23002e18 <vsnprintf+0x240>
23002dbc:	07400793          	li	a5,116
23002dc0:	18f70263          	beq	a4,a5,23002f44 <vsnprintf+0x36c>
23002dc4:	07a00793          	li	a5,122
23002dc8:	50f70363          	beq	a4,a5,230032ce <vsnprintf+0x6f6>
23002dcc:	04670c63          	beq	a4,t1,23002e24 <vsnprintf+0x24c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:614
23002dd0:	06e00693          	li	a3,110
23002dd4:	002a0d13          	addi	s10,s4,2
23002dd8:	7ad70963          	beq	a4,a3,2300358a <vsnprintf+0x9b2>
23002ddc:	78e6f663          	bgeu	a3,a4,23003568 <vsnprintf+0x990>
23002de0:	07300793          	li	a5,115
23002de4:	6ef70163          	beq	a4,a5,230034c6 <vsnprintf+0x8ee>
23002de8:	50e7e363          	bltu	a5,a4,230032ee <vsnprintf+0x716>
23002dec:	06f00793          	li	a5,111
23002df0:	00f70de3          	beq	a4,a5,2300360a <vsnprintf+0xa32>
23002df4:	07000693          	li	a3,112
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
23002df8:	8a32                	mv	s4,a2
23002dfa:	06d70763          	beq	a4,a3,23002e68 <vsnprintf+0x290>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:805
23002dfe:	012df563          	bgeu	s11,s2,23002e08 <vsnprintf+0x230>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:805 (discriminator 1)
23002e02:	00ea8023          	sb	a4,0(s5)
23002e06:	0a85                	addi	s5,s5,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508 (discriminator 3)
23002e08:	000a4703          	lbu	a4,0(s4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:805 (discriminator 3)
23002e0c:	0d85                	addi	s11,s11,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508 (discriminator 3)
23002e0e:	e40703e3          	beqz	a4,23002c54 <vsnprintf+0x7c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:511
23002e12:	02500793          	li	a5,37
23002e16:	b51d                	j	23002c3c <vsnprintf+0x64>
23002e18:	55170f63          	beq	a4,a7,23003376 <vsnprintf+0x79e>
23002e1c:	4aa70b63          	beq	a4,a0,230032d2 <vsnprintf+0x6fa>
23002e20:	fab718e3          	bne	a4,a1,23002dd0 <vsnprintf+0x1f8>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
23002e24:	468d                	li	a3,3
23002e26:	a8dd                	j	23002f1c <vsnprintf+0x344>
23002e28:	0e670863          	beq	a4,t1,23002f18 <vsnprintf+0x340>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:609
23002e2c:	4609                	li	a2,2
23002e2e:	00d65363          	bge	a2,a3,23002e34 <vsnprintf+0x25c>
23002e32:	4689                	li	a3,2
23002e34:	5679                	li	a2,-2
23002e36:	00c6d363          	bge	a3,a2,23002e3c <vsnprintf+0x264>
23002e3a:	56f9                	li	a3,-2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:614
23002e3c:	06e00613          	li	a2,110
23002e40:	001a0d13          	addi	s10,s4,1
23002e44:	6ac70163          	beq	a4,a2,230034e6 <vsnprintf+0x90e>
23002e48:	1ae67863          	bgeu	a2,a4,23002ff8 <vsnprintf+0x420>
23002e4c:	07300613          	li	a2,115
23002e50:	66c70c63          	beq	a4,a2,230034c8 <vsnprintf+0x8f0>
23002e54:	14e66363          	bltu	a2,a4,23002f9a <vsnprintf+0x3c2>
23002e58:	06f00613          	li	a2,111
23002e5c:	6cc70763          	beq	a4,a2,2300352a <vsnprintf+0x952>
23002e60:	07000693          	li	a3,112
23002e64:	f8d71de3          	bne	a4,a3,23002dfe <vsnprintf+0x226>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:623
23002e68:	4792                	lw	a5,4(sp)
23002e6a:	0804f693          	andi	a3,s1,128
23002e6e:	0404f713          	andi	a4,s1,64
23002e72:	0007a883          	lw	a7,0(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:624
23002e76:	0791                	addi	a5,a5,4
23002e78:	c23e                	sw	a5,4(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:625
23002e7a:	02000793          	li	a5,32
23002e7e:	dc36                	sw	a3,56(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:623
23002e80:	4301                	li	t1,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:622
23002e82:	0204e493          	ori	s1,s1,32
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:625
23002e86:	da3e                	sw	a5,52(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:620
23002e88:	49c1                	li	s3,16
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:621
23002e8a:	4e21                	li	t3,8
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:710
23002e8c:	c002                	sw	zero,0(sp)
23002e8e:	012df563          	bgeu	s11,s2,23002e98 <vsnprintf+0x2c0>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:710 (discriminator 1)
23002e92:	41b907b3          	sub	a5,s2,s11
23002e96:	c03e                	sw	a5,0(sp)
format_int():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:62 (discriminator 4)
23002e98:	57a2                	lw	a5,40(sp)
23002e9a:	c2be                	sw	a5,68(sp)
23002e9c:	57e2                	lw	a5,56(sp)
23002e9e:	e399                	bnez	a5,23002ea4 <vsnprintf+0x2cc>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:62
23002ea0:	57b2                	lw	a5,44(sp)
23002ea2:	c2be                	sw	a5,68(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:65
23002ea4:	c319                	beqz	a4,23002eaa <vsnprintf+0x2d2>
23002ea6:	42034863          	bltz	t1,230032d6 <vsnprintf+0x6fe>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:72
23002eaa:	0068e733          	or	a4,a7,t1
23002eae:	de02                	sw	zero,60(sp)
23002eb0:	c682                	sw	zero,76(sp)
23002eb2:	6a070563          	beqz	a4,2300355c <vsnprintf+0x984>
23002eb6:	41f9df13          	srai	t5,s3,0x1f
23002eba:	82c6                	mv	t0,a7
23002ebc:	871a                	mv	a4,t1
23002ebe:	4f81                	li	t6,0
23002ec0:	a031                	j	23002ecc <vsnprintf+0x2f4>
23002ec2:	5282                	lw	t0,32(sp)
23002ec4:	22ef0763          	beq	t5,a4,230030f2 <vsnprintf+0x51a>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:73
23002ec8:	82aa                	mv	t0,a0
23002eca:	872e                	mv	a4,a1
23002ecc:	85ba                	mv	a1,a4
23002ece:	86fa                	mv	a3,t5
23002ed0:	8516                	mv	a0,t0
23002ed2:	864e                	mv	a2,s3
23002ed4:	ce1a                	sw	t1,28(sp)
23002ed6:	cc46                	sw	a7,24(sp)
23002ed8:	ca7e                	sw	t6,20(sp)
23002eda:	c872                	sw	t3,16(sp)
23002edc:	c63a                	sw	a4,12(sp)
23002ede:	c47a                	sw	t5,8(sp)
23002ee0:	d016                	sw	t0,32(sp)
23002ee2:	b6afd0ef          	jal	ra,2300024c <__udivdi3>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:74
23002ee6:	4fd2                	lw	t6,20(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:72
23002ee8:	4f22                	lw	t5,8(sp)
23002eea:	4732                	lw	a4,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:74
23002eec:	0f85                	addi	t6,t6,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:72
23002eee:	4e42                	lw	t3,16(sp)
23002ef0:	48e2                	lw	a7,24(sp)
23002ef2:	4372                	lw	t1,28(sp)
23002ef4:	fde777e3          	bgeu	a4,t5,23002ec2 <vsnprintf+0x2ea>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:79
23002ef8:	57d2                	lw	a5,52(sp)
23002efa:	c781                	beqz	a5,23002f02 <vsnprintf+0x32a>
23002efc:	4721                	li	a4,8
23002efe:	42e98863          	beq	s3,a4,2300332e <vsnprintf+0x756>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:84
23002f02:	21cfc363          	blt	t6,t3,23003108 <vsnprintf+0x530>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:86
23002f06:	0068e733          	or	a4,a7,t1
23002f0a:	38071f63          	bnez	a4,230032a8 <vsnprintf+0x6d0>
23002f0e:	4681                	li	a3,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:87
23002f10:	4e05                	li	t3,1
23002f12:	aaed                	j	2300310c <vsnprintf+0x534>
23002f14:	f0b71ce3          	bne	a4,a1,23002e2c <vsnprintf+0x254>
23002f18:	0689                	addi	a3,a3,2
vsnprintf():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
23002f1a:	8652                	mv	a2,s4
23002f1c:	00064703          	lbu	a4,0(a2)
23002f20:	00160a13          	addi	s4,a2,1
23002f24:	e00713e3          	bnez	a4,23002d2a <vsnprintf+0x152>
23002f28:	b335                	j	23002c54 <vsnprintf+0x7c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:553
23002f2a:	4712                	lw	a4,4(sp)
23002f2c:	0007c683          	lbu	a3,0(a5)
23002f30:	4300                	lw	s0,0(a4)
23002f32:	00470a13          	addi	s4,a4,4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:554
23002f36:	1c044163          	bltz	s0,230030f8 <vsnprintf+0x520>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
23002f3a:	d0068de3          	beqz	a3,23002c54 <vsnprintf+0x7c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:553
23002f3e:	c252                	sw	s4,4(sp)
23002f40:	0785                	addi	a5,a5,1
23002f42:	b365                	j	23002cea <vsnprintf+0x112>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
23002f44:	8a32                	mv	s4,a2
23002f46:	000a4703          	lbu	a4,0(s4)
23002f4a:	001a0613          	addi	a2,s4,1
23002f4e:	d00703e3          	beqz	a4,23002c54 <vsnprintf+0x7c>
23002f52:	e76713e3          	bne	a4,s6,23002db8 <vsnprintf+0x1e0>
23002f56:	4689                	li	a3,2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:588
23002f58:	b7d1                	j	23002f1c <vsnprintf+0x344>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
23002f5a:	00174783          	lbu	a5,1(a4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:525
23002f5e:	0024e493          	ori	s1,s1,2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
23002f62:	ce0789e3          	beqz	a5,23002c54 <vsnprintf+0x7c>
23002f66:	0705                	addi	a4,a4,1
23002f68:	bd31                	j	23002d84 <vsnprintf+0x1ac>
23002f6a:	00174783          	lbu	a5,1(a4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:540
23002f6e:	0014e493          	ori	s1,s1,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
23002f72:	ce0781e3          	beqz	a5,23002c54 <vsnprintf+0x7c>
23002f76:	0705                	addi	a4,a4,1
23002f78:	b531                	j	23002d84 <vsnprintf+0x1ac>
23002f7a:	00174783          	lbu	a5,1(a4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:528
23002f7e:	0044e493          	ori	s1,s1,4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
23002f82:	cc0789e3          	beqz	a5,23002c54 <vsnprintf+0x7c>
23002f86:	0705                	addi	a4,a4,1
23002f88:	bbf5                	j	23002d84 <vsnprintf+0x1ac>
23002f8a:	00174783          	lbu	a5,1(a4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:534
23002f8e:	0104e493          	ori	s1,s1,16
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
23002f92:	cc0781e3          	beqz	a5,23002c54 <vsnprintf+0x7c>
23002f96:	0705                	addi	a4,a4,1
23002f98:	b3f5                	j	23002d84 <vsnprintf+0x1ac>
23002f9a:	07500613          	li	a2,117
23002f9e:	56c70d63          	beq	a4,a2,23003518 <vsnprintf+0x940>
23002fa2:	0804f793          	andi	a5,s1,128
23002fa6:	07800613          	li	a2,120
23002faa:	dc3e                	sw	a5,56(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:672
23002fac:	49c1                	li	s3,16
23002fae:	e4c718e3          	bne	a4,a2,23002dfe <vsnprintf+0x226>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:676
23002fb2:	0204f793          	andi	a5,s1,32
23002fb6:	da3e                	sw	a5,52(sp)
23002fb8:	0404f713          	andi	a4,s1,64
23002fbc:	34068b63          	beqz	a3,23003312 <vsnprintf+0x73a>
23002fc0:	02d05263          	blez	a3,23002fe4 <vsnprintf+0x40c>
23002fc4:	4605                	li	a2,1
23002fc6:	34c68663          	beq	a3,a2,23003312 <vsnprintf+0x73a>
23002fca:	4609                	li	a2,2
23002fcc:	34c69a63          	bne	a3,a2,23003320 <vsnprintf+0x748>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:700
23002fd0:	4792                	lw	a5,4(sp)
23002fd2:	079d                	addi	a5,a5,7
23002fd4:	9be1                	andi	a5,a5,-8
23002fd6:	0007a883          	lw	a7,0(a5)
23002fda:	0047a303          	lw	t1,4(a5)
23002fde:	07a1                	addi	a5,a5,8
23002fe0:	c23e                	sw	a5,4(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:703
23002fe2:	b56d                	j	23002e8c <vsnprintf+0x2b4>
23002fe4:	567d                	li	a2,-1
23002fe6:	32c69d63          	bne	a3,a2,23003320 <vsnprintf+0x748>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:684
23002fea:	4792                	lw	a5,4(sp)
23002fec:	4301                	li	t1,0
23002fee:	0007d883          	lhu	a7,0(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:686
23002ff2:	0791                	addi	a5,a5,4
23002ff4:	c23e                	sw	a5,4(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:688
23002ff6:	bd59                	j	23002e8c <vsnprintf+0x2b4>
23002ff8:	06300613          	li	a2,99
23002ffc:	42c70d63          	beq	a4,a2,23003436 <vsnprintf+0x85e>
23003000:	02e66163          	bltu	a2,a4,23003022 <vsnprintf+0x44a>
23003004:	05000613          	li	a2,80
23003008:	50c70e63          	beq	a4,a2,23003524 <vsnprintf+0x94c>
2300300c:	05800613          	li	a2,88
23003010:	dec717e3          	bne	a4,a2,23002dfe <vsnprintf+0x226>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:668
23003014:	08000793          	li	a5,128
23003018:	0804e493          	ori	s1,s1,128
2300301c:	dc3e                	sw	a5,56(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:672
2300301e:	49c1                	li	s3,16
23003020:	bf49                	j	23002fb2 <vsnprintf+0x3da>
23003022:	06400613          	li	a2,100
23003026:	00c70663          	beq	a4,a2,23003032 <vsnprintf+0x45a>
2300302a:	06900613          	li	a2,105
2300302e:	dcc718e3          	bne	a4,a2,23002dfe <vsnprintf+0x226>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:630 (discriminator 3)
23003032:	0204f793          	andi	a5,s1,32
23003036:	da3e                	sw	a5,52(sp)
23003038:	0804f793          	andi	a5,s1,128
2300303c:	dc3e                	sw	a5,56(sp)
2300303e:	0404e713          	ori	a4,s1,64
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:631 (discriminator 3)
23003042:	34068d63          	beqz	a3,2300339c <vsnprintf+0x7c4>
23003046:	50d05463          	blez	a3,2300354e <vsnprintf+0x976>
2300304a:	4605                	li	a2,1
2300304c:	34c68863          	beq	a3,a2,2300339c <vsnprintf+0x7c4>
23003050:	4609                	li	a2,2
23003052:	58c69d63          	bne	a3,a2,230035ec <vsnprintf+0xa14>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:653
23003056:	4792                	lw	a5,4(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:656
23003058:	84ba                	mv	s1,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:629
2300305a:	49a9                	li	s3,10
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:653
2300305c:	00778693          	addi	a3,a5,7
23003060:	9ae1                	andi	a3,a3,-8
23003062:	00868793          	addi	a5,a3,8
23003066:	c23e                	sw	a5,4(sp)
23003068:	0006a883          	lw	a7,0(a3)
2300306c:	0046a303          	lw	t1,4(a3)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:656
23003070:	04000713          	li	a4,64
23003074:	bd21                	j	23002e8c <vsnprintf+0x2b4>
23003076:	16fd                	addi	a3,a3,-1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
23003078:	8652                	mv	a2,s4
2300307a:	b54d                	j	23002f1c <vsnprintf+0x344>
2300307c:	0007c683          	lbu	a3,0(a5)
23003080:	bc068ae3          	beqz	a3,23002c54 <vsnprintf+0x7c>
23003084:	4e01                	li	t3,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:569
23003086:	002e1713          	slli	a4,t3,0x2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:568
2300308a:	fd068613          	addi	a2,a3,-48
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:569
2300308e:	9772                	add	a4,a4,t3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:568
23003090:	4525                	li	a0,9
23003092:	0ff67593          	andi	a1,a2,255
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:570
23003096:	02a00893          	li	a7,42
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:569
2300309a:	0706                	slli	a4,a4,0x1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:568
2300309c:	02b56363          	bltu	a0,a1,230030c2 <vsnprintf+0x4ea>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
230030a0:	0017c683          	lbu	a3,1(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:569
230030a4:	00e60e33          	add	t3,a2,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
230030a8:	ba0686e3          	beqz	a3,23002c54 <vsnprintf+0x7c>
230030ac:	0785                	addi	a5,a5,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:569
230030ae:	002e1713          	slli	a4,t3,0x2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:568
230030b2:	fd068613          	addi	a2,a3,-48
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:569
230030b6:	9772                	add	a4,a4,t3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:568
230030b8:	0ff67593          	andi	a1,a2,255
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:569
230030bc:	0706                	slli	a4,a4,0x1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:568
230030be:	feb571e3          	bgeu	a0,a1,230030a0 <vsnprintf+0x4c8>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:570
230030c2:	01168963          	beq	a3,a7,230030d4 <vsnprintf+0x4fc>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
230030c6:	0007c703          	lbu	a4,0(a5)
230030ca:	00178a13          	addi	s4,a5,1
230030ce:	c40715e3          	bnez	a4,23002d18 <vsnprintf+0x140>
230030d2:	b649                	j	23002c54 <vsnprintf+0x7c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:571
230030d4:	4712                	lw	a4,4(sp)
230030d6:	00072e03          	lw	t3,0(a4)
230030da:	00470a13          	addi	s4,a4,4
230030de:	c252                	sw	s4,4(sp)
230030e0:	000e5363          	bgez	t3,230030e6 <vsnprintf+0x50e>
230030e4:	5e7d                	li	t3,-1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
230030e6:	0017c683          	lbu	a3,1(a5)
230030ea:	b60685e3          	beqz	a3,23002c54 <vsnprintf+0x7c>
230030ee:	0785                	addi	a5,a5,1
230030f0:	bf7d                	j	230030ae <vsnprintf+0x4d6>
format_int():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:72
230030f2:	dd32fbe3          	bgeu	t0,s3,23002ec8 <vsnprintf+0x2f0>
230030f6:	b509                	j	23002ef8 <vsnprintf+0x320>
vsnprintf():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:555
230030f8:	40800433          	neg	s0,s0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:556
230030fc:	0024e493          	ori	s1,s1,2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
23003100:	b4068ae3          	beqz	a3,23002c54 <vsnprintf+0x7c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:553
23003104:	c252                	sw	s4,4(sp)
23003106:	bd2d                	j	23002f40 <vsnprintf+0x368>
23003108:	fffe0693          	addi	a3,t3,-1
format_int():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:91
2300310c:	0084f713          	andi	a4,s1,8
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:94
23003110:	c0f2                	sw	t3,64(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:91
23003112:	cb01                	beqz	a4,23003122 <vsnprintf+0x54a>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:92
23003114:	ff098713          	addi	a4,s3,-16
23003118:	00173713          	seqz	a4,a4
2300311c:	00370793          	addi	a5,a4,3
23003120:	c0be                	sw	a5,64(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:98
23003122:	4786                	lw	a5,64(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:103
23003124:	0144f713          	andi	a4,s1,20
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:98
23003128:	02f6c6b3          	div	a3,a3,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:103
2300312c:	57f2                	lw	a5,60(sp)
2300312e:	8f5d                	or	a4,a4,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:104
23003130:	00e03733          	snez	a4,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:98
23003134:	9e36                	add	t3,t3,a3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:104
23003136:	00ee07b3          	add	a5,t3,a4
2300313a:	c4be                	sw	a5,72(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:105
2300313c:	57d2                	lw	a5,52(sp)
2300313e:	c781                	beqz	a5,23003146 <vsnprintf+0x56e>
23003140:	4741                	li	a4,16
23003142:	22e98663          	beq	s3,a4,2300336e <vsnprintf+0x796>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:110
23003146:	0034f593          	andi	a1,s1,3
2300314a:	e58d                	bnez	a1,23003174 <vsnprintf+0x59c>
2300314c:	47a6                	lw	a5,72(sp)
2300314e:	0287d363          	bge	a5,s0,23003174 <vsnprintf+0x59c>
23003152:	40f40733          	sub	a4,s0,a5
23003156:	86d6                	mv	a3,s5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:52
23003158:	4601                	li	a2,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:112
2300315a:	02000513          	li	a0,32
2300315e:	4782                	lw	a5,0(sp)
23003160:	00f67563          	bgeu	a2,a5,2300316a <vsnprintf+0x592>
23003164:	00a68023          	sb	a0,0(a3)
23003168:	0685                	addi	a3,a3,1
2300316a:	0605                	addi	a2,a2,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:111
2300316c:	fee619e3          	bne	a2,a4,2300315e <vsnprintf+0x586>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:113
23003170:	4426                	lw	s0,72(sp)
23003172:	a019                	j	23003178 <vsnprintf+0x5a0>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:110
23003174:	86d6                	mv	a3,s5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:52
23003176:	4701                	li	a4,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:118
23003178:	47b6                	lw	a5,76(sp)
2300317a:	10078763          	beqz	a5,23003288 <vsnprintf+0x6b0>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:119
2300317e:	4782                	lw	a5,0(sp)
23003180:	14f76163          	bltu	a4,a5,230032c2 <vsnprintf+0x6ea>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:123
23003184:	0705                	addi	a4,a4,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:126
23003186:	57d2                	lw	a5,52(sp)
23003188:	c781                	beqz	a5,23003190 <vsnprintf+0x5b8>
2300318a:	4641                	li	a2,16
2300318c:	1ac98663          	beq	s3,a2,23003338 <vsnprintf+0x760>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:132
23003190:	4605                	li	a2,1
23003192:	22c58163          	beq	a1,a2,230033b4 <vsnprintf+0x7dc>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:140
23003196:	01c687b3          	add	a5,a3,t3
2300319a:	d03e                	sw	a5,32(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:141
2300319c:	9772                	add	a4,a4,t3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:146
2300319e:	0bc05663          	blez	t3,2300324a <vsnprintf+0x672>
230031a2:	41f9d793          	srai	a5,s3,0x1f
230031a6:	c43e                	sw	a5,8(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:145
230031a8:	4786                	lw	a5,64(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:143
230031aa:	8f3a                	mv	t5,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:142
230031ac:	5f82                	lw	t6,32(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:145
230031ae:	c63e                	sw	a5,12(sp)
230031b0:	a0b5                	j	2300321c <vsnprintf+0x644>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:147
230031b2:	17fd                	addi	a5,a5,-1
230031b4:	82fe                	mv	t0,t6
230031b6:	8e2e                	mv	t3,a1
230031b8:	8f36                	mv	t5,a3
230031ba:	c63e                	sw	a5,12(sp)
230031bc:	8fb2                	mv	t6,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:158
230031be:	4782                	lw	a5,0(sp)
230031c0:	c816                	sw	t0,16(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:159
230031c2:	864e                	mv	a2,s3
230031c4:	46a2                	lw	a3,8(sp)
230031c6:	8546                	mv	a0,a7
230031c8:	859a                	mv	a1,t1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:158
230031ca:	02ff7763          	bgeu	t5,a5,230031f8 <vsnprintf+0x620>
230031ce:	de1a                	sw	t1,60(sp)
230031d0:	dc46                	sw	a7,56(sp)
230031d2:	da72                	sw	t3,52(sp)
230031d4:	ce7a                	sw	t5,28(sp)
230031d6:	cc3a                	sw	a4,24(sp)
230031d8:	ca7e                	sw	t6,20(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:159
230031da:	bd0fd0ef          	jal	ra,230005aa <__umoddi3>
230031de:	4796                	lw	a5,68(sp)
230031e0:	42c2                	lw	t0,16(sp)
230031e2:	5372                	lw	t1,60(sp)
230031e4:	953e                	add	a0,a0,a5
230031e6:	00054683          	lbu	a3,0(a0)
230031ea:	58e2                	lw	a7,56(sp)
230031ec:	5e52                	lw	t3,52(sp)
230031ee:	4f72                	lw	t5,28(sp)
230031f0:	4762                	lw	a4,24(sp)
230031f2:	4fd2                	lw	t6,20(sp)
230031f4:	fed28fa3          	sb	a3,-1(t0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:160
230031f8:	46a2                	lw	a3,8(sp)
230031fa:	8546                	mv	a0,a7
230031fc:	859a                	mv	a1,t1
230031fe:	864e                	mv	a2,s3
23003200:	ce72                	sw	t3,28(sp)
23003202:	cc7a                	sw	t5,24(sp)
23003204:	ca3a                	sw	a4,20(sp)
23003206:	c87e                	sw	t6,16(sp)
23003208:	844fd0ef          	jal	ra,2300024c <__udivdi3>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:146
2300320c:	4e72                	lw	t3,28(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:160
2300320e:	88aa                	mv	a7,a0
23003210:	832e                	mv	t1,a1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:146
23003212:	4fc2                	lw	t6,16(sp)
23003214:	4752                	lw	a4,20(sp)
23003216:	4f62                	lw	t5,24(sp)
23003218:	03c05963          	blez	t3,2300324a <vsnprintf+0x672>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:147
2300321c:	47b2                	lw	a5,12(sp)
2300321e:	ffff8293          	addi	t0,t6,-1
23003222:	8616                	mv	a2,t0
23003224:	ffff0693          	addi	a3,t5,-1
23003228:	fffe0593          	addi	a1,t3,-1
2300322c:	f3d9                	bnez	a5,230031b2 <vsnprintf+0x5da>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:151
2300322e:	4782                	lw	a5,0(sp)
23003230:	00f6f663          	bgeu	a3,a5,2300323c <vsnprintf+0x664>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:152
23003234:	05f00793          	li	a5,95
23003238:	feff8fa3          	sb	a5,-1(t6)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:153
2300323c:	4786                	lw	a5,64(sp)
2300323e:	1f79                	addi	t5,t5,-2
23003240:	1e79                	addi	t3,t3,-2
23003242:	17fd                	addi	a5,a5,-1
23003244:	c63e                	sw	a5,12(sp)
23003246:	1ff9                	addi	t6,t6,-2
23003248:	bf9d                	j	230031be <vsnprintf+0x5e6>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:164
2300324a:	8889                	andi	s1,s1,2
2300324c:	30048a63          	beqz	s1,23003560 <vsnprintf+0x988>
23003250:	47a6                	lw	a5,72(sp)
23003252:	3087d763          	bge	a5,s0,23003560 <vsnprintf+0x988>
23003256:	00e406b3          	add	a3,s0,a4
2300325a:	8e9d                	sub	a3,a3,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:165
2300325c:	02000613          	li	a2,32
23003260:	4782                	lw	a5,0(sp)
23003262:	00f77763          	bgeu	a4,a5,23003270 <vsnprintf+0x698>
23003266:	5782                	lw	a5,32(sp)
23003268:	00c78023          	sb	a2,0(a5)
2300326c:	0785                	addi	a5,a5,1
2300326e:	d03e                	sw	a5,32(sp)
23003270:	0705                	addi	a4,a4,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:164
23003272:	fed717e3          	bne	a4,a3,23003260 <vsnprintf+0x688>
vsnprintf():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
23003276:	000a4703          	lbu	a4,0(s4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:713
2300327a:	9ab6                	add	s5,s5,a3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:714
2300327c:	9db6                	add	s11,s11,a3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
2300327e:	9c070be3          	beqz	a4,23002c54 <vsnprintf+0x7c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:511
23003282:	02500793          	li	a5,37
23003286:	ba5d                	j	23002c3c <vsnprintf+0x64>
format_int():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:120
23003288:	0044f613          	andi	a2,s1,4
2300328c:	e215                	bnez	a2,230032b0 <vsnprintf+0x6d8>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:122
2300328e:	0104f613          	andi	a2,s1,16
23003292:	ee060ae3          	beqz	a2,23003186 <vsnprintf+0x5ae>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:123
23003296:	4782                	lw	a5,0(sp)
23003298:	eef776e3          	bgeu	a4,a5,23003184 <vsnprintf+0x5ac>
2300329c:	02000613          	li	a2,32
230032a0:	00c68023          	sb	a2,0(a3)
230032a4:	0685                	addi	a3,a3,1
230032a6:	bdf9                	j	23003184 <vsnprintf+0x5ac>
230032a8:	ffff8693          	addi	a3,t6,-1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:86
230032ac:	8e7e                	mv	t3,t6
230032ae:	bdb9                	j	2300310c <vsnprintf+0x534>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:121
230032b0:	4782                	lw	a5,0(sp)
230032b2:	ecf779e3          	bgeu	a4,a5,23003184 <vsnprintf+0x5ac>
230032b6:	02b00613          	li	a2,43
230032ba:	00c68023          	sb	a2,0(a3)
230032be:	0685                	addi	a3,a3,1
230032c0:	b5d1                	j	23003184 <vsnprintf+0x5ac>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:119
230032c2:	02d00613          	li	a2,45
230032c6:	00c68023          	sb	a2,0(a3)
230032ca:	0685                	addi	a3,a3,1
230032cc:	bd65                	j	23003184 <vsnprintf+0x5ac>
vsnprintf():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
230032ce:	8a32                	mv	s4,a2
230032d0:	bce1                	j	23002da8 <vsnprintf+0x1d0>
230032d2:	8a32                	mv	s4,a2
230032d4:	b49d                	j	23002d3a <vsnprintf+0x162>
format_int():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:67
230032d6:	411008b3          	neg	a7,a7
230032da:	4785                	li	a5,1
230032dc:	01103733          	snez	a4,a7
230032e0:	40600333          	neg	t1,t1
230032e4:	40e30333          	sub	t1,t1,a4
230032e8:	de3e                	sw	a5,60(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:66
230032ea:	c6be                	sw	a5,76(sp)
230032ec:	b6e9                	j	23002eb6 <vsnprintf+0x2de>
230032ee:	07500793          	li	a5,117
230032f2:	30f70163          	beq	a4,a5,230035f4 <vsnprintf+0xa1c>
230032f6:	07800793          	li	a5,120
230032fa:	2af71763          	bne	a4,a5,230035a8 <vsnprintf+0x9d0>
vsnprintf():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:676
230032fe:	0804f793          	andi	a5,s1,128
23003302:	dc3e                	sw	a5,56(sp)
23003304:	0204f793          	andi	a5,s1,32
23003308:	0404f713          	andi	a4,s1,64
2300330c:	da3e                	sw	a5,52(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
2300330e:	8a32                	mv	s4,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:672
23003310:	49c1                	li	s3,16
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:695
23003312:	4792                	lw	a5,4(sp)
23003314:	4301                	li	t1,0
23003316:	0007a883          	lw	a7,0(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:696
2300331a:	0791                	addi	a5,a5,4
2300331c:	c23e                	sw	a5,4(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:698
2300331e:	b6bd                	j	23002e8c <vsnprintf+0x2b4>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:678
23003320:	4792                	lw	a5,4(sp)
23003322:	4301                	li	t1,0
23003324:	0007c883          	lbu	a7,0(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:680
23003328:	0791                	addi	a5,a5,4
2300332a:	c23e                	sw	a5,4(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:682
2300332c:	b685                	j	23002e8c <vsnprintf+0x2b4>
format_int():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:80
2300332e:	ddcfcde3          	blt	t6,t3,23003108 <vsnprintf+0x530>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:81
23003332:	001f8e13          	addi	t3,t6,1
23003336:	b6f1                	j	23002f02 <vsnprintf+0x32a>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:127
23003338:	4782                	lw	a5,0(sp)
2300333a:	00f77763          	bgeu	a4,a5,23003348 <vsnprintf+0x770>
2300333e:	03000613          	li	a2,48
23003342:	00c68023          	sb	a2,0(a3)
23003346:	0685                	addi	a3,a3,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:128
23003348:	4782                	lw	a5,0(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:127
2300334a:	00170613          	addi	a2,a4,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:128
2300334e:	00f67e63          	bgeu	a2,a5,2300336a <vsnprintf+0x792>
23003352:	57e2                	lw	a5,56(sp)
23003354:	0685                	addi	a3,a3,1
23003356:	0017b613          	seqz	a2,a5
2300335a:	40c00633          	neg	a2,a2
2300335e:	02067613          	andi	a2,a2,32
23003362:	05860613          	addi	a2,a2,88
23003366:	fec68fa3          	sb	a2,-1(a3)
2300336a:	0709                	addi	a4,a4,2
2300336c:	b515                	j	23003190 <vsnprintf+0x5b8>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:106
2300336e:	47a6                	lw	a5,72(sp)
23003370:	0789                	addi	a5,a5,2
23003372:	c4be                	sw	a5,72(sp)
23003374:	bbc9                	j	23003146 <vsnprintf+0x56e>
vsnprintf():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
23003376:	4681                	li	a3,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:585
23003378:	b655                	j	23002f1c <vsnprintf+0x344>
2300337a:	06400793          	li	a5,100
2300337e:	00f70663          	beq	a4,a5,2300338a <vsnprintf+0x7b2>
23003382:	06900793          	li	a5,105
23003386:	22f71163          	bne	a4,a5,230035a8 <vsnprintf+0x9d0>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:630
2300338a:	0204f793          	andi	a5,s1,32
2300338e:	da3e                	sw	a5,52(sp)
23003390:	0804f793          	andi	a5,s1,128
23003394:	0404e713          	ori	a4,s1,64
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:631
23003398:	dc3e                	sw	a5,56(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
2300339a:	8a32                	mv	s4,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:649
2300339c:	4792                	lw	a5,4(sp)
2300339e:	0007a883          	lw	a7,0(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:650
230033a2:	0791                	addi	a5,a5,4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:651
230033a4:	84ba                	mv	s1,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:650
230033a6:	c23e                	sw	a5,4(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:649
230033a8:	41f8d313          	srai	t1,a7,0x1f
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:651
230033ac:	04000713          	li	a4,64
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:629
230033b0:	49a9                	li	s3,10
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:651
230033b2:	bce9                	j	23002e8c <vsnprintf+0x2b4>
format_int():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:132
230033b4:	de8e51e3          	bge	t3,s0,23003196 <vsnprintf+0x5be>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:133
230033b8:	47a6                	lw	a5,72(sp)
230033ba:	dc87dee3          	bge	a5,s0,23003196 <vsnprintf+0x5be>
230033be:	40f40633          	sub	a2,s0,a5
230033c2:	963a                	add	a2,a2,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:134
230033c4:	03000593          	li	a1,48
230033c8:	4782                	lw	a5,0(sp)
230033ca:	00f77563          	bgeu	a4,a5,230033d4 <vsnprintf+0x7fc>
230033ce:	00b68023          	sb	a1,0(a3)
230033d2:	0685                	addi	a3,a3,1
230033d4:	0705                	addi	a4,a4,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:133
230033d6:	fec719e3          	bne	a4,a2,230033c8 <vsnprintf+0x7f0>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:135
230033da:	4426                	lw	s0,72(sp)
230033dc:	bb6d                	j	23003196 <vsnprintf+0x5be>
230033de:	07400793          	li	a5,116
230033e2:	b6f701e3          	beq	a4,a5,23002f44 <vsnprintf+0x36c>
230033e6:	07a00793          	li	a5,122
230033ea:	eef702e3          	beq	a4,a5,230032ce <vsnprintf+0x6f6>
230033ee:	04670163          	beq	a4,t1,23003430 <vsnprintf+0x858>
vsnprintf():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:614
230033f2:	06e00693          	li	a3,110
230033f6:	002a0d13          	addi	s10,s4,2
230033fa:	28d70a63          	beq	a4,a3,2300368e <vsnprintf+0xab6>
230033fe:	24e6f463          	bgeu	a3,a4,23003646 <vsnprintf+0xa6e>
23003402:	07300793          	li	a5,115
23003406:	0cf70063          	beq	a4,a5,230034c6 <vsnprintf+0x8ee>
2300340a:	20e7eb63          	bltu	a5,a4,23003620 <vsnprintf+0xa48>
2300340e:	06f00793          	li	a5,111
23003412:	9ef711e3          	bne	a4,a5,23002df4 <vsnprintf+0x21c>
23003416:	0804f793          	andi	a5,s1,128
2300341a:	dc3e                	sw	a5,56(sp)
2300341c:	0204f793          	andi	a5,s1,32
23003420:	0404f713          	andi	a4,s1,64
23003424:	da3e                	sw	a5,52(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
23003426:	8a32                	mv	s4,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:662
23003428:	49a1                	li	s3,8
2300342a:	b65d                	j	23002fd0 <vsnprintf+0x3f8>
2300342c:	fcb713e3          	bne	a4,a1,230033f2 <vsnprintf+0x81a>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
23003430:	4691                	li	a3,4
23003432:	b4ed                	j	23002f1c <vsnprintf+0x344>
23003434:	8a32                	mv	s4,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:718
23003436:	4792                	lw	a5,4(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:721
23003438:	866e                	mv	a2,s11
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:720
2300343a:	4505                	li	a0,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:718
2300343c:	4398                	lw	a4,0(a5)
2300343e:	0791                	addi	a5,a5,4
23003440:	c23e                	sw	a5,4(sp)
23003442:	04e10fa3          	sb	a4,95(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:719
23003446:	05f10993          	addi	s3,sp,95
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:733
2300344a:	577d                	li	a4,-1
2300344c:	00ee0563          	beq	t3,a4,23003456 <vsnprintf+0x87e>
23003450:	00ae5363          	bge	t3,a0,23003456 <vsnprintf+0x87e>
23003454:	8572                	mv	a0,t3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:736
23003456:	00855563          	bge	a0,s0,23003460 <vsnprintf+0x888>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:737
2300345a:	0024f713          	andi	a4,s1,2
2300345e:	c321                	beqz	a4,2300349e <vsnprintf+0x8c6>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:746
23003460:	16050a63          	beqz	a0,230035d4 <vsnprintf+0x9fc>
23003464:	00c50db3          	add	s11,a0,a2
23003468:	8732                	mv	a4,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:747
2300346a:	40c706b3          	sub	a3,a4,a2
2300346e:	96ce                	add	a3,a3,s3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:748
23003470:	01277763          	bgeu	a4,s2,2300347e <vsnprintf+0x8a6>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:747 (discriminator 1)
23003474:	0006c683          	lbu	a3,0(a3)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:748 (discriminator 1)
23003478:	0a85                	addi	s5,s5,1
2300347a:	feda8fa3          	sb	a3,-1(s5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:748 (discriminator 3)
2300347e:	0705                	addi	a4,a4,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:746 (discriminator 3)
23003480:	ffb715e3          	bne	a4,s11,2300346a <vsnprintf+0x892>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:750
23003484:	00855563          	bge	a0,s0,2300348e <vsnprintf+0x8b6>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:751
23003488:	8889                	andi	s1,s1,2
2300348a:	12049463          	bnez	s1,230035b2 <vsnprintf+0x9da>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
2300348e:	000a4703          	lbu	a4,0(s4)
23003492:	fc070163          	beqz	a4,23002c54 <vsnprintf+0x7c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:511
23003496:	02500793          	li	a5,37
2300349a:	fa2ff06f          	j	23002c3c <vsnprintf+0x64>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:738
2300349e:	0014f713          	andi	a4,s1,1
230034a2:	40e00733          	neg	a4,a4
230034a6:	8b41                	andi	a4,a4,16
230034a8:	01b406b3          	add	a3,s0,s11
230034ac:	02070713          	addi	a4,a4,32
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:741
230034b0:	8e89                	sub	a3,a3,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:742
230034b2:	01267563          	bgeu	a2,s2,230034bc <vsnprintf+0x8e4>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:742 (discriminator 1)
230034b6:	00ea8023          	sb	a4,0(s5)
230034ba:	0a85                	addi	s5,s5,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:742 (discriminator 3)
230034bc:	0605                	addi	a2,a2,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:741 (discriminator 3)
230034be:	fed61ae3          	bne	a2,a3,230034b2 <vsnprintf+0x8da>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:743
230034c2:	842a                	mv	s0,a0
230034c4:	bf71                	j	23003460 <vsnprintf+0x888>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
230034c6:	8a32                	mv	s4,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:723
230034c8:	4792                	lw	a5,4(sp)
230034ca:	0007a983          	lw	s3,0(a5)
230034ce:	0791                	addi	a5,a5,4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:724
230034d0:	0c098e63          	beqz	s3,230035ac <vsnprintf+0x9d4>
230034d4:	854e                	mv	a0,s3
230034d6:	c23e                	sw	a5,4(sp)
230034d8:	c072                	sw	t3,0(sp)
230034da:	2ad9                	jal	230036b0 <strlen>
230034dc:	4e02                	lw	t3,0(sp)
230034de:	4792                	lw	a5,4(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:723 (discriminator 4)
230034e0:	c23e                	sw	a5,4(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:726 (discriminator 4)
230034e2:	866e                	mv	a2,s11
230034e4:	b79d                	j	2300344a <vsnprintf+0x872>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:765 (discriminator 4)
230034e6:	4792                	lw	a5,4(sp)
230034e8:	4398                	lw	a4,0(a5)
230034ea:	0791                	addi	a5,a5,4
230034ec:	c23e                	sw	a5,4(sp)
230034ee:	c2dd                	beqz	a3,23003594 <vsnprintf+0x9bc>
230034f0:	04d05263          	blez	a3,23003534 <vsnprintf+0x95c>
230034f4:	4605                	li	a2,1
230034f6:	08c68f63          	beq	a3,a2,23003594 <vsnprintf+0x9bc>
230034fa:	4609                	li	a2,2
230034fc:	0cc69e63          	bne	a3,a2,230035d8 <vsnprintf+0xa00>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:789
23003500:	01b72023          	sw	s11,0(a4)
23003504:	00072223          	sw	zero,4(a4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
23003508:	000a4703          	lbu	a4,0(s4)
2300350c:	f4070463          	beqz	a4,23002c54 <vsnprintf+0x7c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:511
23003510:	02500793          	li	a5,37
23003514:	f28ff06f          	j	23002c3c <vsnprintf+0x64>
23003518:	0804f793          	andi	a5,s1,128
2300351c:	dc3e                	sw	a5,56(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:665
2300351e:	49a9                	li	s3,10
23003520:	bc49                	j	23002fb2 <vsnprintf+0x3da>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
23003522:	8a32                	mv	s4,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:616
23003524:	0804e493          	ori	s1,s1,128
23003528:	b281                	j	23002e68 <vsnprintf+0x290>
2300352a:	0804f793          	andi	a5,s1,128
2300352e:	dc3e                	sw	a5,56(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:662
23003530:	49a1                	li	s3,8
23003532:	b441                	j	23002fb2 <vsnprintf+0x3da>
23003534:	567d                	li	a2,-1
23003536:	0ac69163          	bne	a3,a2,230035d8 <vsnprintf+0xa00>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:774
2300353a:	01b71023          	sh	s11,0(a4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
2300353e:	000a4703          	lbu	a4,0(s4)
23003542:	f0070963          	beqz	a4,23002c54 <vsnprintf+0x7c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:511
23003546:	02500793          	li	a5,37
2300354a:	ef2ff06f          	j	23002c3c <vsnprintf+0x64>
2300354e:	567d                	li	a2,-1
23003550:	08c69e63          	bne	a3,a2,230035ec <vsnprintf+0xa14>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:640
23003554:	4792                	lw	a5,4(sp)
23003556:	00079883          	lh	a7,0(a5)
2300355a:	b5a1                	j	230033a2 <vsnprintf+0x7ca>
format_int():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:58
2300355c:	4f81                	li	t6,0
2300355e:	ba69                	j	23002ef8 <vsnprintf+0x320>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:141
23003560:	86ba                	mv	a3,a4
23003562:	bb11                	j	23003276 <vsnprintf+0x69e>
vsnprintf():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
23003564:	4685                	li	a3,1
23003566:	ba5d                	j	23002f1c <vsnprintf+0x344>
23003568:	06300793          	li	a5,99
2300356c:	ecf704e3          	beq	a4,a5,23003434 <vsnprintf+0x85c>
23003570:	e0e7e5e3          	bltu	a5,a4,2300337a <vsnprintf+0x7a2>
23003574:	05000793          	li	a5,80
23003578:	faf705e3          	beq	a4,a5,23003522 <vsnprintf+0x94a>
2300357c:	05800593          	li	a1,88
23003580:	8a32                	mv	s4,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:596
23003582:	4685                	li	a3,1
23003584:	a8b708e3          	beq	a4,a1,23003014 <vsnprintf+0x43c>
23003588:	b89d                	j	23002dfe <vsnprintf+0x226>
2300358a:	4792                	lw	a5,4(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
2300358c:	8a32                	mv	s4,a2
2300358e:	4398                	lw	a4,0(a5)
23003590:	0791                	addi	a5,a5,4
23003592:	c23e                	sw	a5,4(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:784
23003594:	01b72023          	sw	s11,0(a4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
23003598:	000a4703          	lbu	a4,0(s4)
2300359c:	ea070c63          	beqz	a4,23002c54 <vsnprintf+0x7c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:511
230035a0:	02500793          	li	a5,37
230035a4:	e98ff06f          	j	23002c3c <vsnprintf+0x64>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
230035a8:	8a32                	mv	s4,a2
230035aa:	b891                	j	23002dfe <vsnprintf+0x226>
230035ac:	4519                	li	a0,6
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:724
230035ae:	59c2                	lw	s3,48(sp)
230035b0:	bf05                	j	230034e0 <vsnprintf+0x908>
230035b2:	886e                	mv	a6,s11
230035b4:	946e                	add	s0,s0,s11
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:753
230035b6:	02000693          	li	a3,32
230035ba:	01287563          	bgeu	a6,s2,230035c4 <vsnprintf+0x9ec>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:753 (discriminator 1)
230035be:	00da8023          	sb	a3,0(s5)
230035c2:	0a85                	addi	s5,s5,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:753 (discriminator 3)
230035c4:	0805                	addi	a6,a6,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:754 (discriminator 3)
230035c6:	41040733          	sub	a4,s0,a6
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:752 (discriminator 3)
230035ca:	fee548e3          	blt	a0,a4,230035ba <vsnprintf+0x9e2>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:753
230035ce:	8dc2                	mv	s11,a6
230035d0:	e52ff06f          	j	23002c22 <vsnprintf+0x4a>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:746
230035d4:	8db2                	mv	s11,a2
230035d6:	b57d                	j	23003484 <vsnprintf+0x8ac>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:769
230035d8:	01b70023          	sb	s11,0(a4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
230035dc:	000a4703          	lbu	a4,0(s4)
230035e0:	e6070a63          	beqz	a4,23002c54 <vsnprintf+0x7c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:511
230035e4:	02500793          	li	a5,37
230035e8:	e54ff06f          	j	23002c3c <vsnprintf+0x64>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:635
230035ec:	4792                	lw	a5,4(sp)
230035ee:	00078883          	lb	a7,0(a5)
230035f2:	bb45                	j	230033a2 <vsnprintf+0x7ca>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:676
230035f4:	0804f793          	andi	a5,s1,128
230035f8:	dc3e                	sw	a5,56(sp)
230035fa:	0204f793          	andi	a5,s1,32
230035fe:	0404f713          	andi	a4,s1,64
23003602:	da3e                	sw	a5,52(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
23003604:	8a32                	mv	s4,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:665
23003606:	49a9                	li	s3,10
23003608:	b329                	j	23003312 <vsnprintf+0x73a>
2300360a:	0804f793          	andi	a5,s1,128
2300360e:	dc3e                	sw	a5,56(sp)
23003610:	0204f793          	andi	a5,s1,32
23003614:	0404f713          	andi	a4,s1,64
23003618:	da3e                	sw	a5,52(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
2300361a:	8a32                	mv	s4,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:662
2300361c:	49a1                	li	s3,8
2300361e:	b9d5                	j	23003312 <vsnprintf+0x73a>
23003620:	07500793          	li	a5,117
23003624:	06f70b63          	beq	a4,a5,2300369a <vsnprintf+0xac2>
23003628:	07800793          	li	a5,120
2300362c:	f6f71ee3          	bne	a4,a5,230035a8 <vsnprintf+0x9d0>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:676
23003630:	0804f793          	andi	a5,s1,128
23003634:	dc3e                	sw	a5,56(sp)
23003636:	0204f793          	andi	a5,s1,32
2300363a:	0404f713          	andi	a4,s1,64
2300363e:	da3e                	sw	a5,52(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
23003640:	8a32                	mv	s4,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:672
23003642:	49c1                	li	s3,16
23003644:	b271                	j	23002fd0 <vsnprintf+0x3f8>
23003646:	06300793          	li	a5,99
2300364a:	def705e3          	beq	a4,a5,23003434 <vsnprintf+0x85c>
2300364e:	00e7ee63          	bltu	a5,a4,2300366a <vsnprintf+0xa92>
23003652:	05000793          	li	a5,80
23003656:	ecf706e3          	beq	a4,a5,23003522 <vsnprintf+0x94a>
2300365a:	05800593          	li	a1,88
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
2300365e:	8a32                	mv	s4,a2
23003660:	4689                	li	a3,2
23003662:	9ab709e3          	beq	a4,a1,23003014 <vsnprintf+0x43c>
23003666:	f98ff06f          	j	23002dfe <vsnprintf+0x226>
2300366a:	06400793          	li	a5,100
2300366e:	00f70663          	beq	a4,a5,2300367a <vsnprintf+0xaa2>
23003672:	06900793          	li	a5,105
23003676:	f2f719e3          	bne	a4,a5,230035a8 <vsnprintf+0x9d0>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:630
2300367a:	0204f793          	andi	a5,s1,32
2300367e:	da3e                	sw	a5,52(sp)
23003680:	0804f793          	andi	a5,s1,128
23003684:	0404e713          	ori	a4,s1,64
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:631
23003688:	dc3e                	sw	a5,56(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
2300368a:	8a32                	mv	s4,a2
2300368c:	b2e9                	j	23003056 <vsnprintf+0x47e>
2300368e:	4792                	lw	a5,4(sp)
23003690:	8a32                	mv	s4,a2
23003692:	4398                	lw	a4,0(a5)
23003694:	0791                	addi	a5,a5,4
23003696:	c23e                	sw	a5,4(sp)
23003698:	b5a5                	j	23003500 <vsnprintf+0x928>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:676
2300369a:	0804f793          	andi	a5,s1,128
2300369e:	dc3e                	sw	a5,56(sp)
230036a0:	0204f793          	andi	a5,s1,32
230036a4:	0404f713          	andi	a4,s1,64
230036a8:	da3e                	sw	a5,52(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:508
230036aa:	8a32                	mv	s4,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/vsnprintf.c:665
230036ac:	49a9                	li	s3,10
230036ae:	b20d                	j	23002fd0 <vsnprintf+0x3f8>

230036b0 <strlen>:
strlen():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/strlen.c:14
230036b0:	00054783          	lbu	a5,0(a0)
230036b4:	cb89                	beqz	a5,230036c6 <strlen+0x16>
230036b6:	87aa                	mv	a5,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/strlen.c:15
230036b8:	0785                	addi	a5,a5,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/strlen.c:14
230036ba:	0007c703          	lbu	a4,0(a5)
230036be:	ff6d                	bnez	a4,230036b8 <strlen+0x8>
230036c0:	40a78533          	sub	a0,a5,a0
230036c4:	8082                	ret
230036c6:	4501                	li	a0,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/libc/src/strlen.c:17
230036c8:	8082                	ret

230036ca <pPtTable_Flash_Read_Fast>:
pPtTable_Flash_Read_Fast():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:134
230036ca:	1141                	addi	sp,sp,-16
230036cc:	c422                	sw	s0,8(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:137
230036ce:	00001737          	lui	a4,0x1
230036d2:	81918413          	addi	s0,gp,-2023 # 42021099 <index.8374>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:134
230036d6:	c606                	sw	ra,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:137
230036d8:	b5270713          	addi	a4,a4,-1198 # b52 <StackSize+0x752>
230036dc:	010006b7          	lui	a3,0x1000
230036e0:	00044783          	lbu	a5,0(s0)
230036e4:	00d76a63          	bltu	a4,a3,230036f8 <pPtTable_Flash_Read_Fast+0x2e>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:140
230036e8:	0791                	addi	a5,a5,4
230036ea:	00f40023          	sb	a5,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:142
230036ee:	40b2                	lw	ra,12(sp)
230036f0:	4422                	lw	s0,8(sp)
230036f2:	4501                	li	a0,0
230036f4:	0141                	addi	sp,sp,16
230036f6:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:138
230036f8:	4731                	li	a4,12
230036fa:	02e7f7b3          	remu	a5,a5,a4
230036fe:	07d2                	slli	a5,a5,0x14
23003700:	97aa                	add	a5,a5,a0
23003702:	23000537          	lui	a0,0x23000
23003706:	953e                	add	a0,a0,a5
23003708:	ff00d097          	auipc	ra,0xff00d
2300370c:	112080e7          	jalr	274(ra) # 2201081a <XIP_SFlash_Read_Via_Cache_Need_Lock>
23003710:	00044783          	lbu	a5,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:142
23003714:	40b2                	lw	ra,12(sp)
23003716:	4501                	li	a0,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:140
23003718:	0791                	addi	a5,a5,4
2300371a:	00f40023          	sb	a5,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:142
2300371e:	4422                	lw	s0,8(sp)
23003720:	0141                	addi	sp,sp,16
23003722:	8082                	ret

23003724 <PtTable_Valid>:
PtTable_Valid():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:103
23003724:	4114                	lw	a3,0(a0)
23003726:	545047b7          	lui	a5,0x54504
2300372a:	64278793          	addi	a5,a5,1602 # 54504642 <__noinit_data_end__+0x124d1cf2>
2300372e:	00f68463          	beq	a3,a5,23003736 <PtTable_Valid+0x12>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:120
23003732:	4501                	li	a0,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:121
23003734:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:97
23003736:	1141                	addi	sp,sp,-16
23003738:	c226                	sw	s1,4(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:101
2300373a:	00655483          	lhu	s1,6(a0) # 23000006 <__text_code_start__+0x6>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:97
2300373e:	c422                	sw	s0,8(sp)
23003740:	c606                	sw	ra,12(sp)
23003742:	c04a                	sw	s2,0(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:104
23003744:	47c1                	li	a5,16
23003746:	842a                	mv	s0,a0
23003748:	0097f963          	bgeu	a5,s1,2300375a <PtTable_Valid+0x36>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:120
2300374c:	4501                	li	a0,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:121
2300374e:	40b2                	lw	ra,12(sp)
23003750:	4422                	lw	s0,8(sp)
23003752:	4492                	lw	s1,4(sp)
23003754:	4902                	lw	s2,0(sp)
23003756:	0141                	addi	sp,sp,16
23003758:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:108
2300375a:	00c52903          	lw	s2,12(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:109
2300375e:	45b1                	li	a1,12
23003760:	ff00d097          	auipc	ra,0xff00d
23003764:	0f6080e7          	jalr	246(ra) # 22010856 <BFLB_Soft_CRC32>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:108
23003768:	fea912e3          	bne	s2,a0,2300374c <PtTable_Valid+0x28>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:101
2300376c:	00349593          	slli	a1,s1,0x3
23003770:	95a6                	add	a1,a1,s1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:99
23003772:	01040513          	addi	a0,s0,16
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:101
23003776:	058a                	slli	a1,a1,0x2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:114
23003778:	00b507b3          	add	a5,a0,a1
2300377c:	4380                	lw	s0,0(a5)
2300377e:	ff00d097          	auipc	ra,0xff00d
23003782:	0d8080e7          	jalr	216(ra) # 22010856 <BFLB_Soft_CRC32>
23003786:	40a40533          	sub	a0,s0,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:106
2300378a:	00153513          	seqz	a0,a0
2300378e:	b7c1                	j	2300374e <PtTable_Valid+0x2a>

23003790 <PtTable_Set_Flash_Operation>:
PtTable_Set_Flash_Operation():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:162
23003790:	0aa1ac23          	sw	a0,184(gp) # 42021938 <PtTable_Flash_Erase>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:163
23003794:	0cb1a023          	sw	a1,192(gp) # 42021940 <PtTable_Flash_Write>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:164
23003798:	c601                	beqz	a2,230037a0 <PtTable_Set_Flash_Operation+0x10>
2300379a:	0ac1ae23          	sw	a2,188(gp) # 4202193c <PtTable_Flash_Read>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:169
2300379e:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:167
230037a0:	23003637          	lui	a2,0x23003
230037a4:	6ca60613          	addi	a2,a2,1738 # 230036ca <pPtTable_Flash_Read_Fast>
230037a8:	0ac1ae23          	sw	a2,188(gp) # 4202193c <PtTable_Flash_Read>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:169
230037ac:	8082                	ret

230037ae <PtTable_Get_Active_Partition_Need_Lock>:
PtTable_Get_Active_Partition_Need_Lock():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:184
230037ae:	cd35                	beqz	a0,2300382a <PtTable_Get_Active_Partition_Need_Lock+0x7c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:180
230037b0:	1141                	addi	sp,sp,-16
230037b2:	c226                	sw	s1,4(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:189
230037b4:	0bc18493          	addi	s1,gp,188 # 4202193c <PtTable_Flash_Read>
230037b8:	409c                	lw	a5,0(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:180
230037ba:	c606                	sw	ra,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:189
230037bc:	85aa                	mv	a1,a0
230037be:	25400613          	li	a2,596
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:180
230037c2:	c422                	sw	s0,8(sp)
230037c4:	c04a                	sw	s2,0(sp)
230037c6:	842a                	mv	s0,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:189
230037c8:	6539                	lui	a0,0xe
230037ca:	9782                	jalr	a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:190
230037cc:	8522                	mv	a0,s0
230037ce:	3f99                	jal	23003724 <PtTable_Valid>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:192
230037d0:	409c                	lw	a5,0(s1)
230037d2:	25440493          	addi	s1,s0,596
230037d6:	25400613          	li	a2,596
230037da:	85a6                	mv	a1,s1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:190
230037dc:	892a                	mv	s2,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:192
230037de:	653d                	lui	a0,0xf
230037e0:	9782                	jalr	a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:193
230037e2:	8526                	mv	a0,s1
230037e4:	3781                	jal	23003724 <PtTable_Valid>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:195
230037e6:	4785                	li	a5,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:193
230037e8:	872a                	mv	a4,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:195
230037ea:	02f90263          	beq	s2,a5,2300380e <PtTable_Get_Active_Partition_Need_Lock+0x60>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:185
230037ee:	4509                	li	a0,2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:203
230037f0:	00f70863          	beq	a4,a5,23003800 <PtTable_Get_Active_Partition_Need_Lock+0x52>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:207
230037f4:	40b2                	lw	ra,12(sp)
230037f6:	4422                	lw	s0,8(sp)
230037f8:	4492                	lw	s1,4(sp)
230037fa:	4902                	lw	s2,0(sp)
230037fc:	0141                	addi	sp,sp,16
230037fe:	8082                	ret
23003800:	40b2                	lw	ra,12(sp)
23003802:	4422                	lw	s0,8(sp)
23003804:	4492                	lw	s1,4(sp)
23003806:	4902                	lw	s2,0(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:204
23003808:	4505                	li	a0,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:207
2300380a:	0141                	addi	sp,sp,16
2300380c:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:202 (discriminator 1)
2300380e:	4501                	li	a0,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:195 (discriminator 1)
23003810:	ff2712e3          	bne	a4,s2,230037f4 <PtTable_Get_Active_Partition_Need_Lock+0x46>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:196
23003814:	4408                	lw	a0,8(s0)
23003816:	25c42783          	lw	a5,604(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:207
2300381a:	40b2                	lw	ra,12(sp)
2300381c:	4422                	lw	s0,8(sp)
2300381e:	4492                	lw	s1,4(sp)
23003820:	4902                	lw	s2,0(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:185
23003822:	00f53533          	sltu	a0,a0,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:207
23003826:	0141                	addi	sp,sp,16
23003828:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:185
2300382a:	4509                	li	a0,2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:207
2300382c:	8082                	ret

2300382e <PtTable_Get_Active_Entries_By_ID>:
PtTable_Get_Active_Entries_By_ID():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:225
2300382e:	cd31                	beqz	a0,2300388a <PtTable_Get_Active_Entries_By_ID+0x5c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:225 (discriminator 1)
23003830:	ce29                	beqz	a2,2300388a <PtTable_Get_Active_Entries_By_ID+0x5c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:228
23003832:	00655803          	lhu	a6,6(a0) # f006 <StackSize+0xec06>
23003836:	02080363          	beqz	a6,2300385c <PtTable_Get_Active_Entries_By_ID+0x2e>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:229
2300383a:	01054783          	lbu	a5,16(a0)
2300383e:	04b78863          	beq	a5,a1,2300388e <PtTable_Get_Active_Entries_By_ID+0x60>
23003842:	03450713          	addi	a4,a0,52
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:228
23003846:	4781                	li	a5,0
23003848:	a029                	j	23003852 <PtTable_Get_Active_Entries_By_ID+0x24>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:229
2300384a:	fdc74683          	lbu	a3,-36(a4)
2300384e:	00b68963          	beq	a3,a1,23003860 <PtTable_Get_Active_Entries_By_ID+0x32>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:228 (discriminator 2)
23003852:	0785                	addi	a5,a5,1
23003854:	02470713          	addi	a4,a4,36
23003858:	ff0799e3          	bne	a5,a6,2300384a <PtTable_Get_Active_Entries_By_ID+0x1c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:234
2300385c:	4509                	li	a0,2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:235
2300385e:	8082                	ret
23003860:	00379713          	slli	a4,a5,0x3
23003864:	973e                	add	a4,a4,a5
23003866:	070a                	slli	a4,a4,0x2
23003868:	0741                	addi	a4,a4,16
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:230
2300386a:	87b2                	mv	a5,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:222
2300386c:	1141                	addi	sp,sp,-16
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:230
2300386e:	00e505b3          	add	a1,a0,a4
23003872:	02400613          	li	a2,36
23003876:	853e                	mv	a0,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:222
23003878:	c606                	sw	ra,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:230
2300387a:	ff00d097          	auipc	ra,0xff00d
2300387e:	b2c080e7          	jalr	-1236(ra) # 220103a6 <BL602_MemCpy_Fast>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:235
23003882:	40b2                	lw	ra,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:231
23003884:	4501                	li	a0,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:235
23003886:	0141                	addi	sp,sp,16
23003888:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:226
2300388a:	4515                	li	a0,5
2300388c:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:229
2300388e:	4741                	li	a4,16
23003890:	bfe9                	j	2300386a <PtTable_Get_Active_Entries_By_ID+0x3c>

23003892 <PtTable_Get_Active_Entries_By_Name>:
PtTable_Get_Active_Entries_By_Name():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:254
23003892:	c941                	beqz	a0,23003922 <PtTable_Get_Active_Entries_By_Name+0x90>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:254 (discriminator 1)
23003894:	c659                	beqz	a2,23003922 <PtTable_Get_Active_Entries_By_Name+0x90>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:250
23003896:	7179                	addi	sp,sp,-48
23003898:	cc52                	sw	s4,24(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:257
2300389a:	00655a03          	lhu	s4,6(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:250
2300389e:	d606                	sw	ra,44(sp)
230038a0:	d422                	sw	s0,40(sp)
230038a2:	d226                	sw	s1,36(sp)
230038a4:	d04a                	sw	s2,32(sp)
230038a6:	ce4e                	sw	s3,28(sp)
230038a8:	ca56                	sw	s5,20(sp)
230038aa:	c85a                	sw	s6,16(sp)
230038ac:	c65e                	sw	s7,12(sp)
230038ae:	c462                	sw	s8,8(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:257
230038b0:	040a0c63          	beqz	s4,23003908 <PtTable_Get_Active_Entries_By_Name+0x76>
230038b4:	8baa                	mv	s7,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:252
230038b6:	852e                	mv	a0,a1
230038b8:	8c32                	mv	s8,a2
230038ba:	8b2e                	mv	s6,a1
230038bc:	df5ff0ef          	jal	ra,230036b0 <strlen>
230038c0:	89aa                	mv	s3,a0
230038c2:	4401                	li	s0,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:257
230038c4:	4481                	li	s1,0
230038c6:	013b8a93          	addi	s5,s7,19
230038ca:	a029                	j	230038d4 <PtTable_Get_Active_Entries_By_Name+0x42>
230038cc:	02440413          	addi	s0,s0,36
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:257 (discriminator 2)
230038d0:	03448c63          	beq	s1,s4,23003908 <PtTable_Get_Active_Entries_By_Name+0x76>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:258
230038d4:	008a8933          	add	s2,s5,s0
230038d8:	854a                	mv	a0,s2
230038da:	dd7ff0ef          	jal	ra,230036b0 <strlen>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:257
230038de:	0485                	addi	s1,s1,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:258
230038e0:	ff3516e3          	bne	a0,s3,230038cc <PtTable_Get_Active_Entries_By_Name+0x3a>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:259 (discriminator 1)
230038e4:	864e                	mv	a2,s3
230038e6:	85da                	mv	a1,s6
230038e8:	854a                	mv	a0,s2
230038ea:	ad0ff0ef          	jal	ra,23002bba <memcmp>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:258 (discriminator 1)
230038ee:	fd79                	bnez	a0,230038cc <PtTable_Get_Active_Entries_By_Name+0x3a>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:260
230038f0:	01040593          	addi	a1,s0,16
230038f4:	02400613          	li	a2,36
230038f8:	95de                	add	a1,a1,s7
230038fa:	8562                	mv	a0,s8
230038fc:	ff00d097          	auipc	ra,0xff00d
23003900:	aaa080e7          	jalr	-1366(ra) # 220103a6 <BL602_MemCpy_Fast>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:261
23003904:	4501                	li	a0,0
23003906:	a011                	j	2300390a <PtTable_Get_Active_Entries_By_Name+0x78>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:264
23003908:	4509                	li	a0,2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:265
2300390a:	50b2                	lw	ra,44(sp)
2300390c:	5422                	lw	s0,40(sp)
2300390e:	5492                	lw	s1,36(sp)
23003910:	5902                	lw	s2,32(sp)
23003912:	49f2                	lw	s3,28(sp)
23003914:	4a62                	lw	s4,24(sp)
23003916:	4ad2                	lw	s5,20(sp)
23003918:	4b42                	lw	s6,16(sp)
2300391a:	4bb2                	lw	s7,12(sp)
2300391c:	4c22                	lw	s8,8(sp)
2300391e:	6145                	addi	sp,sp,48
23003920:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:255
23003922:	4515                	li	a0,5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:265
23003924:	8082                	ret

23003926 <PtTable_Update_Entry>:
PtTable_Update_Entry():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:289
23003926:	10060463          	beqz	a2,23003a2e <PtTable_Update_Entry+0x108>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:289 (discriminator 1)
2300392a:	10058263          	beqz	a1,23003a2e <PtTable_Update_Entry+0x108>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:280
2300392e:	1101                	addi	sp,sp,-32
23003930:	c64e                	sw	s3,12(sp)
23003932:	ce06                	sw	ra,28(sp)
23003934:	cc22                	sw	s0,24(sp)
23003936:	ca26                	sw	s1,20(sp)
23003938:	c84a                	sw	s2,16(sp)
2300393a:	c452                	sw	s4,8(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:296
2300393c:	4709                	li	a4,2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:294
2300393e:	01058993          	addi	s3,a1,16
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:297
23003942:	4785                	li	a5,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:296
23003944:	0ae50c63          	beq	a0,a4,230039fc <PtTable_Update_Entry+0xd6>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:301
23003948:	6939                	lui	s2,0xe
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:300
2300394a:	e171                	bnez	a0,23003a0e <PtTable_Update_Entry+0xe8>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:305
2300394c:	0065d683          	lhu	a3,6(a1)
23003950:	84ae                	mv	s1,a1
23003952:	8a32                	mv	s4,a2
23003954:	c2f5                	beqz	a3,23003a38 <PtTable_Update_Entry+0x112>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:306
23003956:	00064583          	lbu	a1,0(a2)
2300395a:	0104c783          	lbu	a5,16(s1)
2300395e:	0ab78a63          	beq	a5,a1,23003a12 <PtTable_Update_Entry+0xec>
23003962:	03448793          	addi	a5,s1,52
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:305
23003966:	4401                	li	s0,0
23003968:	a029                	j	23003972 <PtTable_Update_Entry+0x4c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:306
2300396a:	fdc7c703          	lbu	a4,-36(a5)
2300396e:	0ab70463          	beq	a4,a1,23003a16 <PtTable_Update_Entry+0xf0>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:305 (discriminator 2)
23003972:	0405                	addi	s0,s0,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:306 (discriminator 2)
23003974:	853e                	mv	a0,a5
23003976:	02478793          	addi	a5,a5,36
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:305 (discriminator 2)
2300397a:	fe8698e3          	bne	a3,s0,2300396a <PtTable_Update_Entry+0x44>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:313
2300397e:	473d                	li	a4,15
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:317
23003980:	478d                	li	a5,3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:313
23003982:	06d76d63          	bltu	a4,a3,230039fc <PtTable_Update_Entry+0xd6>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:314
23003986:	00341513          	slli	a0,s0,0x3
2300398a:	9522                	add	a0,a0,s0
2300398c:	050a                	slli	a0,a0,0x2
2300398e:	02400613          	li	a2,36
23003992:	85d2                	mv	a1,s4
23003994:	954e                	add	a0,a0,s3
23003996:	ff00d097          	auipc	ra,0xff00d
2300399a:	a10080e7          	jalr	-1520(ra) # 220103a6 <BL602_MemCpy_Fast>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:315
2300399e:	0064d783          	lhu	a5,6(s1)
230039a2:	0785                	addi	a5,a5,1
230039a4:	00f49323          	sh	a5,6(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:323
230039a8:	449c                	lw	a5,8(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:324
230039aa:	45b1                	li	a1,12
230039ac:	8526                	mv	a0,s1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:323
230039ae:	0785                	addi	a5,a5,1
230039b0:	c49c                	sw	a5,8(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:324
230039b2:	ff00d097          	auipc	ra,0xff00d
230039b6:	ea4080e7          	jalr	-348(ra) # 22010856 <BFLB_Soft_CRC32>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:327
230039ba:	0064d583          	lhu	a1,6(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:324
230039be:	c4c8                	sw	a0,12(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:329
230039c0:	854e                	mv	a0,s3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:327
230039c2:	00359413          	slli	s0,a1,0x3
230039c6:	942e                	add	s0,s0,a1
230039c8:	040a                	slli	s0,s0,0x2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:329
230039ca:	85a2                	mv	a1,s0
230039cc:	ff00d097          	auipc	ra,0xff00d
230039d0:	e8a080e7          	jalr	-374(ra) # 22010856 <BFLB_Soft_CRC32>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:333
230039d4:	0b81a783          	lw	a5,184(gp) # 42021938 <PtTable_Flash_Erase>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:329
230039d8:	99a2                	add	s3,s3,s0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:333
230039da:	01340593          	addi	a1,s0,19
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:329
230039de:	00a9a023          	sw	a0,0(s3)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:333
230039e2:	95ca                	add	a1,a1,s2
230039e4:	854a                	mv	a0,s2
230039e6:	9782                	jalr	a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:334
230039e8:	e531                	bnez	a0,23003a34 <PtTable_Update_Entry+0x10e>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:339
230039ea:	0c01a783          	lw	a5,192(gp) # 42021940 <PtTable_Flash_Write>
230039ee:	25400613          	li	a2,596
230039f2:	85a6                	mv	a1,s1
230039f4:	854a                	mv	a0,s2
230039f6:	9782                	jalr	a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:345
230039f8:	4781                	li	a5,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:340
230039fa:	ed0d                	bnez	a0,23003a34 <PtTable_Update_Entry+0x10e>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:346
230039fc:	40f2                	lw	ra,28(sp)
230039fe:	4462                	lw	s0,24(sp)
23003a00:	44d2                	lw	s1,20(sp)
23003a02:	4942                	lw	s2,16(sp)
23003a04:	49b2                	lw	s3,12(sp)
23003a06:	4a22                	lw	s4,8(sp)
23003a08:	853e                	mv	a0,a5
23003a0a:	6105                	addi	sp,sp,32
23003a0c:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:303
23003a0e:	693d                	lui	s2,0xf
23003a10:	bf35                	j	2300394c <PtTable_Update_Entry+0x26>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:306
23003a12:	854e                	mv	a0,s3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:305
23003a14:	4401                	li	s0,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:307
23003a16:	02400613          	li	a2,36
23003a1a:	85d2                	mv	a1,s4
23003a1c:	ff00d097          	auipc	ra,0xff00d
23003a20:	98a080e7          	jalr	-1654(ra) # 220103a6 <BL602_MemCpy_Fast>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:308
23003a24:	0064d683          	lhu	a3,6(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:311
23003a28:	f8d410e3          	bne	s0,a3,230039a8 <PtTable_Update_Entry+0x82>
23003a2c:	bf89                	j	2300397e <PtTable_Update_Entry+0x58>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:290
23003a2e:	4795                	li	a5,5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:346
23003a30:	853e                	mv	a0,a5
23003a32:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:336
23003a34:	479d                	li	a5,7
23003a36:	b7d9                	j	230039fc <PtTable_Update_Entry+0xd6>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/partition/partition.c:311
23003a38:	4401                	li	s0,0
23003a3a:	b7b1                	j	23003986 <PtTable_Update_Entry+0x60>

23003a3c <Ring_Buffer_Init>:
Ring_Buffer_Init():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:102
23003a3c:	c10c                	sw	a1,0(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:105
23003a3e:	00050223          	sb	zero,4(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:106
23003a42:	00051323          	sh	zero,6(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:107
23003a46:	00050423          	sb	zero,8(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:108
23003a4a:	00051523          	sh	zero,10(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:111
23003a4e:	00c51623          	sh	a2,12(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:114
23003a52:	c914                	sw	a3,16(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:115
23003a54:	c958                	sw	a4,20(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:118
23003a56:	4501                	li	a0,0
23003a58:	8082                	ret

23003a5a <Ring_Buffer_Get_Length>:
Ring_Buffer_Get_Length():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:603
23003a5a:	491c                	lw	a5,16(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:602
23003a5c:	1141                	addi	sp,sp,-16
23003a5e:	c422                	sw	s0,8(sp)
23003a60:	c606                	sw	ra,12(sp)
23003a62:	842a                	mv	s0,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:603
23003a64:	c391                	beqz	a5,23003a68 <Ring_Buffer_Get_Length+0xe>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:604
23003a66:	9782                	jalr	a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:607
23003a68:	00444683          	lbu	a3,4(s0)
23003a6c:	00844703          	lbu	a4,8(s0)
23003a70:	485c                	lw	a5,20(s0)
23003a72:	02e68263          	beq	a3,a4,23003a96 <Ring_Buffer_Get_Length+0x3c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:613
23003a76:	c391                	beqz	a5,23003a7a <Ring_Buffer_Get_Length+0x20>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:614
23003a78:	9782                	jalr	a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:616
23003a7a:	00c45783          	lhu	a5,12(s0)
23003a7e:	00a45503          	lhu	a0,10(s0)
23003a82:	00645703          	lhu	a4,6(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:618
23003a86:	40b2                	lw	ra,12(sp)
23003a88:	4422                	lw	s0,8(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:616
23003a8a:	953e                	add	a0,a0,a5
23003a8c:	8d19                	sub	a0,a0,a4
23003a8e:	0542                	slli	a0,a0,0x10
23003a90:	8141                	srli	a0,a0,0x10
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:618
23003a92:	0141                	addi	sp,sp,16
23003a94:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:608
23003a96:	c391                	beqz	a5,23003a9a <Ring_Buffer_Get_Length+0x40>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:609
23003a98:	9782                	jalr	a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:611
23003a9a:	00a45503          	lhu	a0,10(s0)
23003a9e:	00645783          	lhu	a5,6(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:618
23003aa2:	40b2                	lw	ra,12(sp)
23003aa4:	4422                	lw	s0,8(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:611
23003aa6:	8d1d                	sub	a0,a0,a5
23003aa8:	0542                	slli	a0,a0,0x10
23003aaa:	8141                	srli	a0,a0,0x10
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:618
23003aac:	0141                	addi	sp,sp,16
23003aae:	8082                	ret

23003ab0 <Ring_Buffer_Write_Callback>:
Ring_Buffer_Write_Callback():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:153
23003ab0:	1101                	addi	sp,sp,-32
23003ab2:	cc22                	sw	s0,24(sp)
Ring_Buffer_Get_Empty_Length():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:631
23003ab4:	00c55403          	lhu	s0,12(a0)
Ring_Buffer_Write_Callback():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:153
23003ab8:	ca26                	sw	s1,20(sp)
23003aba:	c84a                	sw	s2,16(sp)
23003abc:	c64e                	sw	s3,12(sp)
23003abe:	c452                	sw	s4,8(sp)
23003ac0:	ce06                	sw	ra,28(sp)
23003ac2:	c256                	sw	s5,4(sp)
23003ac4:	84aa                	mv	s1,a0
23003ac6:	892e                	mv	s2,a1
23003ac8:	89b2                	mv	s3,a2
23003aca:	8a36                	mv	s4,a3
Ring_Buffer_Get_Empty_Length():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:631
23003acc:	3779                	jal	23003a5a <Ring_Buffer_Get_Length>
23003ace:	8c09                	sub	s0,s0,a0
Ring_Buffer_Write_Callback():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:156
23003ad0:	08098863          	beqz	s3,23003b60 <Ring_Buffer_Write_Callback+0xb0>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:160
23003ad4:	489c                	lw	a5,16(s1)
23003ad6:	0442                	slli	s0,s0,0x10
23003ad8:	8041                	srli	s0,s0,0x10
23003ada:	c391                	beqz	a5,23003ade <Ring_Buffer_Write_Callback+0x2e>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:161
23003adc:	9782                	jalr	a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:165
23003ade:	cc3d                	beqz	s0,23003b5c <Ring_Buffer_Write_Callback+0xac>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:173
23003ae0:	87ca                	mv	a5,s2
23003ae2:	07246b63          	bltu	s0,s2,23003b58 <Ring_Buffer_Write_Callback+0xa8>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:178
23003ae6:	00a4d903          	lhu	s2,10(s1)
23003aea:	00c4da83          	lhu	s5,12(s1)
23003aee:	408c                	lw	a1,0(s1)
23003af0:	01079413          	slli	s0,a5,0x10
23003af4:	412a8633          	sub	a2,s5,s2
23003af8:	0642                	slli	a2,a2,0x10
23003afa:	8041                	srli	s0,s0,0x10
23003afc:	8241                	srli	a2,a2,0x10
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:180
23003afe:	95ca                	add	a1,a1,s2
23003b00:	04c46363          	bltu	s0,a2,23003b46 <Ring_Buffer_Write_Callback+0x96>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:186
23003b04:	8552                	mv	a0,s4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:187
23003b06:	41590933          	sub	s2,s2,s5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:186
23003b0a:	9982                	jalr	s3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:187
23003b0c:	9922                	add	s2,s2,s0
23003b0e:	408c                	lw	a1,0(s1)
23003b10:	0942                	slli	s2,s2,0x10
23003b12:	01095913          	srli	s2,s2,0x10
23003b16:	864a                	mv	a2,s2
23003b18:	8552                	mv	a0,s4
23003b1a:	9982                	jalr	s3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:189
23003b1c:	0084c783          	lbu	a5,8(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:188
23003b20:	01249523          	sh	s2,10(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:189
23003b24:	fff7c793          	not	a5,a5
23003b28:	00f48423          	sb	a5,8(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:192
23003b2c:	48dc                	lw	a5,20(s1)
23003b2e:	c391                	beqz	a5,23003b32 <Ring_Buffer_Write_Callback+0x82>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:193
23003b30:	9782                	jalr	a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:196
23003b32:	8522                	mv	a0,s0
23003b34:	40f2                	lw	ra,28(sp)
23003b36:	4462                	lw	s0,24(sp)
23003b38:	44d2                	lw	s1,20(sp)
23003b3a:	4942                	lw	s2,16(sp)
23003b3c:	49b2                	lw	s3,12(sp)
23003b3e:	4a22                	lw	s4,8(sp)
23003b40:	4a92                	lw	s5,4(sp)
23003b42:	6105                	addi	sp,sp,32
23003b44:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:182
23003b46:	8622                	mv	a2,s0
23003b48:	8552                	mv	a0,s4
23003b4a:	9982                	jalr	s3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:183
23003b4c:	00a4d783          	lhu	a5,10(s1)
23003b50:	97a2                	add	a5,a5,s0
23003b52:	00f49523          	sh	a5,10(s1)
23003b56:	bfd9                	j	23003b2c <Ring_Buffer_Write_Callback+0x7c>
23003b58:	87a2                	mv	a5,s0
23003b5a:	b771                	j	23003ae6 <Ring_Buffer_Write_Callback+0x36>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:166
23003b5c:	48dc                	lw	a5,20(s1)
23003b5e:	fbe9                	bnez	a5,23003b30 <Ring_Buffer_Write_Callback+0x80>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:157
23003b60:	4401                	li	s0,0
23003b62:	bfc1                	j	23003b32 <Ring_Buffer_Write_Callback+0x82>

23003b64 <Ring_Buffer_Get_Empty_Length>:
Ring_Buffer_Get_Empty_Length():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:630
23003b64:	1141                	addi	sp,sp,-16
23003b66:	c422                	sw	s0,8(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:631
23003b68:	00c55403          	lhu	s0,12(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:630
23003b6c:	c606                	sw	ra,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:631
23003b6e:	35f5                	jal	23003a5a <Ring_Buffer_Get_Length>
23003b70:	40a40533          	sub	a0,s0,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/ring_buffer/ring_buffer.c:632
23003b74:	40b2                	lw	ra,12(sp)
23003b76:	4422                	lw	s0,8(sp)
23003b78:	0542                	slli	a0,a0,0x10
23003b7a:	8141                	srli	a0,a0,0x10
23003b7c:	0141                	addi	sp,sp,16
23003b7e:	8082                	ret

23003b80 <xz_crc32_init>:
xz_crc32_init():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_crc32.c:49
23003b80:	8082                	ret

23003b82 <xz_crc32>:
xz_crc32():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_crc32.c:53
23003b82:	fff64713          	not	a4,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_crc32.c:55
23003b86:	c595                	beqz	a1,23003bb2 <xz_crc32+0x30>
23003b88:	23008837          	lui	a6,0x23008
23003b8c:	95aa                	add	a1,a1,a0
23003b8e:	8ec80813          	addi	a6,a6,-1812 # 230078ec <crc32Tab>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_crc32.c:56
23003b92:	0505                	addi	a0,a0,1
23003b94:	fff54783          	lbu	a5,-1(a0)
23003b98:	0ff77693          	andi	a3,a4,255
23003b9c:	8321                	srli	a4,a4,0x8
23003b9e:	8fb5                	xor	a5,a5,a3
23003ba0:	078a                	slli	a5,a5,0x2
23003ba2:	97c2                	add	a5,a5,a6
23003ba4:	4390                	lw	a2,0(a5)
23003ba6:	8f31                	xor	a4,a4,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_crc32.c:55
23003ba8:	feb515e3          	bne	a0,a1,23003b92 <xz_crc32+0x10>
23003bac:	fff74513          	not	a0,a4
23003bb0:	8082                	ret
23003bb2:	8532                	mv	a0,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_crc32.c:61
23003bb4:	8082                	ret

23003bb6 <lzma_len>:
rc_normalize():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:480
23003bb6:	4118                	lw	a4,0(a0)
23003bb8:	010007b7          	lui	a5,0x1000
23003bbc:	00452803          	lw	a6,4(a0)
23003bc0:	02f77163          	bgeu	a4,a5,23003be2 <lzma_len+0x2c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
23003bc4:	4914                	lw	a3,16(a0)
23003bc6:	455c                	lw	a5,12(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:481
23003bc8:	0722                	slli	a4,a4,0x8
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
23003bca:	00168893          	addi	a7,a3,1 # 1000001 <StackSize+0xfffc01>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:481
23003bce:	c118                	sw	a4,0(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
23003bd0:	01152823          	sw	a7,16(a0)
23003bd4:	97b6                	add	a5,a5,a3
23003bd6:	0007c783          	lbu	a5,0(a5) # 1000000 <StackSize+0xfffc00>
23003bda:	0822                	slli	a6,a6,0x8
23003bdc:	983e                	add	a6,a6,a5
23003bde:	01052223          	sw	a6,4(a0)
rc_bit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:503
23003be2:	0005d683          	lhu	a3,0(a1)
23003be6:	00b75793          	srli	a5,a4,0xb
23003bea:	02d787b3          	mul	a5,a5,a3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:504
23003bee:	0af87863          	bgeu	a6,a5,23003c9e <lzma_len+0xe8>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:506
23003bf2:	6705                	lui	a4,0x1
23003bf4:	80070713          	addi	a4,a4,-2048 # 800 <StackSize+0x400>
23003bf8:	8f15                	sub	a4,a4,a3
23003bfa:	8715                	srai	a4,a4,0x5
23003bfc:	96ba                	add	a3,a3,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:505
23003bfe:	c11c                	sw	a5,0(a0)
lzma_len():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:626
23003c00:	0612                	slli	a2,a2,0x4
rc_bit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:506
23003c02:	00d59023          	sh	a3,0(a1)
lzma_len():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:626
23003c06:	0611                	addi	a2,a2,4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:628
23003c08:	4709                	li	a4,2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:626
23003c0a:	95b2                	add	a1,a1,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:628
23003c0c:	d178                	sw	a4,100(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:627
23003c0e:	4fa1                	li	t6,8
rc_bit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:506
23003c10:	6e85                	lui	t4,0x1
rc_bittree():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:522
23003c12:	4685                	li	a3,1
rc_normalize():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:480
23003c14:	01000f37          	lui	t5,0x1000
rc_bit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:506
23003c18:	800e8e93          	addi	t4,t4,-2048 # 800 <StackSize+0x400>
rc_bittree():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:525
23003c1c:	0686                	slli	a3,a3,0x1
rc_normalize():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
23003c1e:	00881613          	slli	a2,a6,0x8
rc_bittree():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:525
23003c22:	00d58333          	add	t1,a1,a3
rc_normalize():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:480
23003c26:	03e7f163          	bgeu	a5,t5,23003c48 <lzma_len+0x92>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
23003c2a:	01052803          	lw	a6,16(a0)
23003c2e:	4558                	lw	a4,12(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:481
23003c30:	07a2                	slli	a5,a5,0x8
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
23003c32:	00180893          	addi	a7,a6,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:481
23003c36:	c11c                	sw	a5,0(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
23003c38:	01152823          	sw	a7,16(a0)
23003c3c:	9742                	add	a4,a4,a6
23003c3e:	00074803          	lbu	a6,0(a4)
23003c42:	9832                	add	a6,a6,a2
23003c44:	01052223          	sw	a6,4(a0)
rc_bit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:503
23003c48:	00035703          	lhu	a4,0(t1)
23003c4c:	00b7d613          	srli	a2,a5,0xb
23003c50:	02e60633          	mul	a2,a2,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:506
23003c54:	40ee88b3          	sub	a7,t4,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:511
23003c58:	00575e13          	srli	t3,a4,0x5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:506
23003c5c:	4058d893          	srai	a7,a7,0x5
23003c60:	98ba                	add	a7,a7,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:511
23003c62:	41c70733          	sub	a4,a4,t3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:509
23003c66:	8f91                	sub	a5,a5,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:510
23003c68:	40c80e33          	sub	t3,a6,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:504
23003c6c:	00c87b63          	bgeu	a6,a2,23003c82 <lzma_len+0xcc>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:505
23003c70:	c110                	sw	a2,0(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:506
23003c72:	01131023          	sh	a7,0(t1)
rc_bittree():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:529
23003c76:	01f6fe63          	bgeu	a3,t6,23003c92 <lzma_len+0xdc>
23003c7a:	411c                	lw	a5,0(a0)
23003c7c:	00452803          	lw	a6,4(a0)
23003c80:	bf71                	j	23003c1c <lzma_len+0x66>
rc_bit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:509
23003c82:	c11c                	sw	a5,0(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:510
23003c84:	01c52223          	sw	t3,4(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:511
23003c88:	00e31023          	sh	a4,0(t1)
rc_bittree():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:526
23003c8c:	0685                	addi	a3,a3,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:529
23003c8e:	fff6e6e3          	bltu	a3,t6,23003c7a <lzma_len+0xc4>
lzma_len():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:642
23003c92:	517c                	lw	a5,100(a0)
23003c94:	41f78fb3          	sub	t6,a5,t6
23003c98:	96fe                	add	a3,a3,t6
23003c9a:	d174                	sw	a3,100(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:643
23003c9c:	8082                	ret
rc_bit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:509
23003c9e:	8f1d                	sub	a4,a4,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:510
23003ca0:	40f80833          	sub	a6,a6,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:511
23003ca4:	0056d793          	srli	a5,a3,0x5
23003ca8:	8e9d                	sub	a3,a3,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:509
23003caa:	c118                	sw	a4,0(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:510
23003cac:	01052223          	sw	a6,4(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:511
23003cb0:	00d59023          	sh	a3,0(a1)
rc_normalize():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:480
23003cb4:	010007b7          	lui	a5,0x1000
23003cb8:	02f77163          	bgeu	a4,a5,23003cda <lzma_len+0x124>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
23003cbc:	4914                	lw	a3,16(a0)
23003cbe:	455c                	lw	a5,12(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:481
23003cc0:	0722                	slli	a4,a4,0x8
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
23003cc2:	00168893          	addi	a7,a3,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:481
23003cc6:	c118                	sw	a4,0(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
23003cc8:	01152823          	sw	a7,16(a0)
23003ccc:	97b6                	add	a5,a5,a3
23003cce:	0007c783          	lbu	a5,0(a5) # 1000000 <StackSize+0xfffc00>
23003cd2:	0822                	slli	a6,a6,0x8
23003cd4:	983e                	add	a6,a6,a5
23003cd6:	01052223          	sw	a6,4(a0)
rc_bit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:503
23003cda:	0025d683          	lhu	a3,2(a1)
23003cde:	00b75793          	srli	a5,a4,0xb
23003ce2:	02d787b3          	mul	a5,a5,a3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:504
23003ce6:	02f87363          	bgeu	a6,a5,23003d0c <lzma_len+0x156>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:506
23003cea:	6705                	lui	a4,0x1
23003cec:	80070713          	addi	a4,a4,-2048 # 800 <StackSize+0x400>
23003cf0:	8f15                	sub	a4,a4,a3
23003cf2:	8715                	srai	a4,a4,0x5
23003cf4:	96ba                	add	a3,a3,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:505
23003cf6:	c11c                	sw	a5,0(a0)
lzma_len():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:631
23003cf8:	0612                	slli	a2,a2,0x4
rc_bit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:506
23003cfa:	00d59123          	sh	a3,2(a1)
lzma_len():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:631
23003cfe:	10460613          	addi	a2,a2,260
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:633
23003d02:	4729                	li	a4,10
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:631
23003d04:	95b2                	add	a1,a1,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:633
23003d06:	d178                	sw	a4,100(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:632
23003d08:	4fa1                	li	t6,8
23003d0a:	b719                	j	23003c10 <lzma_len+0x5a>
rc_bit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:509
23003d0c:	8f1d                	sub	a4,a4,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:510
23003d0e:	40f80833          	sub	a6,a6,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:511
23003d12:	0056d793          	srli	a5,a3,0x5
23003d16:	8e9d                	sub	a3,a3,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:509
23003d18:	c118                	sw	a4,0(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:510
23003d1a:	01052223          	sw	a6,4(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:511
23003d1e:	00d59123          	sh	a3,2(a1)
lzma_len():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:637
23003d22:	47c9                	li	a5,18
23003d24:	d17c                	sw	a5,100(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:635
23003d26:	20458593          	addi	a1,a1,516
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:637
23003d2a:	87ba                	mv	a5,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:636
23003d2c:	10000f93          	li	t6,256
23003d30:	b5c5                	j	23003c10 <lzma_len+0x5a>

23003d32 <dict_repeat.part.1>:
dict_repeat():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:354
23003d32:	01052803          	lw	a6,16(a0)
23003d36:	4518                	lw	a4,8(a0)
23003d38:	419c                	lw	a5,0(a1)
23003d3a:	40e80833          	sub	a6,a6,a4
23003d3e:	0107f363          	bgeu	a5,a6,23003d44 <dict_repeat.part.1+0x12>
23003d42:	883e                	mv	a6,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:355
23003d44:	410787b3          	sub	a5,a5,a6
23003d48:	c19c                	sw	a5,0(a1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:357
23003d4a:	4514                	lw	a3,8(a0)
23003d4c:	fff64793          	not	a5,a2
23003d50:	97b6                	add	a5,a5,a3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:358
23003d52:	00d66463          	bltu	a2,a3,23003d5a <dict_repeat.part.1+0x28>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:359
23003d56:	4958                	lw	a4,20(a0)
23003d58:	97ba                	add	a5,a5,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:362
23003d5a:	4118                	lw	a4,0(a0)
23003d5c:	00168613          	addi	a2,a3,1
23003d60:	c510                	sw	a2,8(a0)
23003d62:	00f70633          	add	a2,a4,a5
23003d66:	00064603          	lbu	a2,0(a2)
23003d6a:	96ba                	add	a3,a3,a4
23003d6c:	00178713          	addi	a4,a5,1
23003d70:	00c68023          	sb	a2,0(a3)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:363
23003d74:	495c                	lw	a5,20(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:365
23003d76:	187d                	addi	a6,a6,-1
23003d78:	4514                	lw	a3,8(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:364
23003d7a:	40f707b3          	sub	a5,a4,a5
23003d7e:	00f037b3          	snez	a5,a5
23003d82:	40f007b3          	neg	a5,a5
23003d86:	8ff9                	and	a5,a5,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:365
23003d88:	fc0819e3          	bnez	a6,23003d5a <dict_repeat.part.1+0x28>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:367
23003d8c:	455c                	lw	a5,12(a0)
23003d8e:	00d7f363          	bgeu	a5,a3,23003d94 <dict_repeat.part.1+0x62>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:368
23003d92:	c554                	sw	a3,12(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:371
23003d94:	4505                	li	a0,1
23003d96:	8082                	ret

23003d98 <lzma_main>:
lzma_main():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:723
23003d98:	1101                	addi	sp,sp,-32
23003d9a:	cc22                	sw	s0,24(sp)
23003d9c:	842a                	mv	s0,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:730
23003d9e:	541c                	lw	a5,40(s0)
23003da0:	5108                	lw	a0,32(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:723
23003da2:	ce06                	sw	ra,28(sp)
23003da4:	ca26                	sw	s1,20(sp)
23003da6:	c84a                	sw	s2,16(sp)
23003da8:	c64e                	sw	s3,12(sp)
23003daa:	c452                	sw	s4,8(sp)
23003dac:	c256                	sw	s5,4(sp)
23003dae:	c05a                	sw	s6,0(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:730
23003db0:	04f56363          	bltu	a0,a5,23003df6 <lzma_main+0x5e>
23003db4:	00042803          	lw	a6,0(s0)
rc_normalize():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:480
23003db8:	010007b7          	lui	a5,0x1000
lzma_main():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:760
23003dbc:	4505                	li	a0,1
rc_normalize():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:480
23003dbe:	02f87263          	bgeu	a6,a5,23003de2 <lzma_main+0x4a>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
23003dc2:	4810                	lw	a2,16(s0)
23003dc4:	4454                	lw	a3,12(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:481
23003dc6:	00881793          	slli	a5,a6,0x8
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
23003dca:	00160593          	addi	a1,a2,1
23003dce:	4058                	lw	a4,4(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:481
23003dd0:	c01c                	sw	a5,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
23003dd2:	c80c                	sw	a1,16(s0)
23003dd4:	00c687b3          	add	a5,a3,a2
23003dd8:	0007c783          	lbu	a5,0(a5) # 1000000 <StackSize+0xfffc00>
23003ddc:	0722                	slli	a4,a4,0x8
23003dde:	97ba                	add	a5,a5,a4
23003de0:	c05c                	sw	a5,4(s0)
lzma_main():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:761
23003de2:	40f2                	lw	ra,28(sp)
23003de4:	4462                	lw	s0,24(sp)
23003de6:	44d2                	lw	s1,20(sp)
23003de8:	4942                	lw	s2,16(sp)
23003dea:	49b2                	lw	s3,12(sp)
23003dec:	4a22                	lw	s4,8(sp)
23003dee:	4a92                	lw	s5,4(sp)
23003df0:	4b02                	lw	s6,0(sp)
23003df2:	6105                	addi	sp,sp,32
23003df4:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:730 (discriminator 1)
23003df6:	5078                	lw	a4,100(s0)
23003df8:	56071263          	bnez	a4,2300435c <lzma_main+0x5c4>
lzma_rep_match():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:718
23003dfc:	6485                	lui	s1,0x1
23003dfe:	adc48913          	addi	s2,s1,-1316 # adc <StackSize+0x6dc>
lzma_match():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:672
23003e02:	800009b7          	lui	s3,0x80000
lzma_main():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:749
23003e06:	06440a13          	addi	s4,s0,100
lzma_rep_match():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:718
23003e0a:	9922                	add	s2,s2,s0
rc_bit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:506
23003e0c:	80048a93          	addi	s5,s1,-2048
lzma_match():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:672
23003e10:	fff9c993          	not	s3,s3
lzma_main():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:311
23003e14:	00042803          	lw	a6,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:737
23003e18:	faf570e3          	bgeu	a0,a5,23003db8 <lzma_main+0x20>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:737 (discriminator 1)
23003e1c:	4818                	lw	a4,16(s0)
23003e1e:	485c                	lw	a5,20(s0)
23003e20:	f8e7ece3          	bltu	a5,a4,23003db8 <lzma_main+0x20>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:738
23003e24:	5830                	lw	a2,112(s0)
rc_normalize():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:480
23003e26:	010006b7          	lui	a3,0x1000
lzma_main():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:741
23003e2a:	06044583          	lbu	a1,96(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:738
23003e2e:	8e69                	and	a2,a2,a0
rc_normalize():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:480
23003e30:	405c                	lw	a5,4(s0)
23003e32:	02d87063          	bgeu	a6,a3,23003e52 <lzma_main+0xba>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
23003e36:	4454                	lw	a3,12(s0)
23003e38:	00170893          	addi	a7,a4,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:481
23003e3c:	0822                	slli	a6,a6,0x8
23003e3e:	01042023          	sw	a6,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
23003e42:	01142823          	sw	a7,16(s0)
23003e46:	9736                	add	a4,a4,a3
23003e48:	00074703          	lbu	a4,0(a4)
23003e4c:	07a2                	slli	a5,a5,0x8
23003e4e:	97ba                	add	a5,a5,a4
23003e50:	c05c                	sw	a5,4(s0)
rc_bit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:503
23003e52:	00459713          	slli	a4,a1,0x4
23003e56:	9732                	add	a4,a4,a2
23003e58:	0706                	slli	a4,a4,0x1
23003e5a:	00e408b3          	add	a7,s0,a4
23003e5e:	0748d683          	lhu	a3,116(a7)
23003e62:	00b85713          	srli	a4,a6,0xb
23003e66:	02d70733          	mul	a4,a4,a3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:504
23003e6a:	10e7f063          	bgeu	a5,a4,23003f6a <lzma_main+0x1d2>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:506
23003e6e:	40da8633          	sub	a2,s5,a3
23003e72:	8615                	srai	a2,a2,0x5
23003e74:	96b2                	add	a3,a3,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:505
23003e76:	c018                	sw	a4,0(s0)
dict_get():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:322
23003e78:	fff50613          	addi	a2,a0,-1
rc_bit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:506
23003e7c:	06d89a23          	sh	a3,116(a7)
dict_get():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:324
23003e80:	86b2                	mv	a3,a2
23003e82:	e119                	bnez	a0,23003e88 <lzma_main+0xf0>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:325
23003e84:	5454                	lw	a3,44(s0)
23003e86:	16fd                	addi	a3,a3,-1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:327
23003e88:	02442e03          	lw	t3,36(s0)
23003e8c:	01842883          	lw	a7,24(s0)
23003e90:	4801                	li	a6,0
23003e92:	000e0563          	beqz	t3,23003e9c <lzma_main+0x104>
23003e96:	96c6                	add	a3,a3,a7
23003e98:	0006c803          	lbu	a6,0(a3) # 1000000 <StackSize+0xfffc00>
lzma_literal_probs():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:575
23003e9c:	06842e83          	lw	t4,104(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:576
23003ea0:	5474                	lw	a3,108(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:575
23003ea2:	4321                	li	t1,8
23003ea4:	41d30333          	sub	t1,t1,t4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:576
23003ea8:	8ee9                	and	a3,a3,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:575
23003eaa:	00685833          	srl	a6,a6,t1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:576
23003eae:	01d696b3          	sll	a3,a3,t4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:577
23003eb2:	96c2                	add	a3,a3,a6
23003eb4:	00169813          	slli	a6,a3,0x1
23003eb8:	9836                	add	a6,a6,a3
23003eba:	0826                	slli	a6,a6,0x9
23003ebc:	ee048693          	addi	a3,s1,-288
23003ec0:	9836                	add	a6,a6,a3
lzma_literal():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:592
23003ec2:	4699                	li	a3,6
lzma_literal_probs():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:577
23003ec4:	9822                	add	a6,a6,s0
lzma_literal():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:592
23003ec6:	32b6e963          	bltu	a3,a1,230041f8 <lzma_main+0x460>
rc_bittree():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:522
23003eca:	4685                	li	a3,1
rc_normalize():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:480
23003ecc:	01000f37          	lui	t5,0x1000
rc_bittree():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:529
23003ed0:	0ff00e93          	li	t4,255
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:525
23003ed4:	0686                	slli	a3,a3,0x1
rc_normalize():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
23003ed6:	00879593          	slli	a1,a5,0x8
rc_bittree():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:525
23003eda:	00d80333          	add	t1,a6,a3
rc_normalize():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:480
23003ede:	01e77e63          	bgeu	a4,t5,23003efa <lzma_main+0x162>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
23003ee2:	4810                	lw	a2,16(s0)
23003ee4:	445c                	lw	a5,12(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:481
23003ee6:	0722                	slli	a4,a4,0x8
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
23003ee8:	00160513          	addi	a0,a2,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:481
23003eec:	c018                	sw	a4,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
23003eee:	c808                	sw	a0,16(s0)
23003ef0:	97b2                	add	a5,a5,a2
23003ef2:	0007c783          	lbu	a5,0(a5)
23003ef6:	97ae                	add	a5,a5,a1
23003ef8:	c05c                	sw	a5,4(s0)
rc_bit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:503
23003efa:	00035603          	lhu	a2,0(t1)
23003efe:	00b75593          	srli	a1,a4,0xb
23003f02:	02c585b3          	mul	a1,a1,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:506
23003f06:	40ca8533          	sub	a0,s5,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:511
23003f0a:	00565e13          	srli	t3,a2,0x5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:506
23003f0e:	8515                	srai	a0,a0,0x5
23003f10:	9532                	add	a0,a0,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:511
23003f12:	41c60633          	sub	a2,a2,t3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:509
23003f16:	8f0d                	sub	a4,a4,a1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:510
23003f18:	40b78e33          	sub	t3,a5,a1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:504
23003f1c:	00b7fa63          	bgeu	a5,a1,23003f30 <lzma_main+0x198>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:505
23003f20:	c00c                	sw	a1,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:506
23003f22:	00a31023          	sh	a0,0(t1)
rc_bittree():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:529
23003f26:	00deed63          	bltu	t4,a3,23003f40 <lzma_main+0x1a8>
23003f2a:	4018                	lw	a4,0(s0)
23003f2c:	405c                	lw	a5,4(s0)
23003f2e:	b75d                	j	23003ed4 <lzma_main+0x13c>
rc_bit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:509
23003f30:	c018                	sw	a4,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:510
23003f32:	01c42223          	sw	t3,4(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:511
23003f36:	00c31023          	sh	a2,0(t1)
rc_bittree():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:526
23003f3a:	0685                	addi	a3,a3,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:529
23003f3c:	fedef7e3          	bgeu	t4,a3,23003f2a <lzma_main+0x192>
dict_put():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:335
23003f40:	501c                	lw	a5,32(s0)
23003f42:	00178713          	addi	a4,a5,1
23003f46:	d018                	sw	a4,32(s0)
23003f48:	98be                	add	a7,a7,a5
lzma_literal():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:614
23003f4a:	00d88023          	sb	a3,0(a7)
dict_put():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:337
23003f4e:	5008                	lw	a0,32(s0)
23003f50:	505c                	lw	a5,36(s0)
23003f52:	00a7f363          	bgeu	a5,a0,23003f58 <lzma_main+0x1c0>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:338
23003f56:	d048                	sw	a0,36(s0)
lzma_state_literal():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_lzma2.h:66
23003f58:	06044783          	lbu	a5,96(s0)
23003f5c:	470d                	li	a4,3
23003f5e:	28f76563          	bltu	a4,a5,230041e8 <lzma_main+0x450>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_lzma2.h:67
23003f62:	06040023          	sb	zero,96(s0)
23003f66:	541c                	lw	a5,40(s0)
23003f68:	b575                	j	23003e14 <lzma_main+0x7c>
rc_bit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:509
23003f6a:	40e80833          	sub	a6,a6,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:510
23003f6e:	8f99                	sub	a5,a5,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:511
23003f70:	0056d713          	srli	a4,a3,0x5
23003f74:	8e99                	sub	a3,a3,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:509
23003f76:	01042023          	sw	a6,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:510
23003f7a:	c05c                	sw	a5,4(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:511
23003f7c:	06d89a23          	sh	a3,116(a7)
rc_normalize():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:480
23003f80:	01000737          	lui	a4,0x1000
23003f84:	02e87063          	bgeu	a6,a4,23003fa4 <lzma_main+0x20c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
23003f88:	4814                	lw	a3,16(s0)
23003f8a:	4458                	lw	a4,12(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:481
23003f8c:	0822                	slli	a6,a6,0x8
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
23003f8e:	00168513          	addi	a0,a3,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:481
23003f92:	01042023          	sw	a6,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
23003f96:	c808                	sw	a0,16(s0)
23003f98:	9736                	add	a4,a4,a3
23003f9a:	00074703          	lbu	a4,0(a4) # 1000000 <StackSize+0xfffc00>
23003f9e:	07a2                	slli	a5,a5,0x8
23003fa0:	97ba                	add	a5,a5,a4
23003fa2:	c05c                	sw	a5,4(s0)
rc_bit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:503
23003fa4:	00159713          	slli	a4,a1,0x1
23003fa8:	9722                	add	a4,a4,s0
23003faa:	1f475503          	lhu	a0,500(a4)
23003fae:	00b85313          	srli	t1,a6,0xb
23003fb2:	02a30333          	mul	t1,t1,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:504
23003fb6:	1667fa63          	bgeu	a5,t1,2300412a <lzma_main+0x392>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:506
23003fba:	40aa87b3          	sub	a5,s5,a0
23003fbe:	8795                	srai	a5,a5,0x5
23003fc0:	953e                	add	a0,a0,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:505
23003fc2:	00642023          	sw	t1,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:506
23003fc6:	1ea71a23          	sh	a0,500(a4)
lzma_state_match():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_lzma2.h:77
23003fca:	4719                	li	a4,6
23003fcc:	479d                	li	a5,7
23003fce:	36b76463          	bltu	a4,a1,23004336 <lzma_main+0x59e>
lzma_match():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:654
23003fd2:	4c2c                	lw	a1,88(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:655
23003fd4:	4874                	lw	a3,84(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:656
23003fd6:	4838                	lw	a4,80(s0)
lzma_state_match():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_lzma2.h:77
23003fd8:	06f40023          	sb	a5,96(s0)
lzma_match():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:654
23003fdc:	cc6c                	sw	a1,92(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:655
23003fde:	cc34                	sw	a3,88(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:656
23003fe0:	c878                	sw	a4,84(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:658
23003fe2:	6d840593          	addi	a1,s0,1752
23003fe6:	8522                	mv	a0,s0
23003fe8:	bcfff0ef          	jal	ra,23003bb6 <lzma_len>
lzma_get_dist_state():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_lzma2.h:150
23003fec:	06442883          	lw	a7,100(s0)
23003ff0:	4795                	li	a5,5
23003ff2:	3517e063          	bltu	a5,a7,23004332 <lzma_main+0x59a>
23003ff6:	089e                	slli	a7,a7,0x7
23003ff8:	2d488893          	addi	a7,a7,724
rc_bittree():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:522
23003ffc:	4605                	li	a2,1
rc_normalize():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:480
23003ffe:	01000eb7          	lui	t4,0x1000
rc_bittree():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:529
23004002:	03f00e13          	li	t3,63
rc_normalize():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:480
23004006:	401c                	lw	a5,0(s0)
rc_bittree():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:525
23004008:	0606                	slli	a2,a2,0x1
2300400a:	01160833          	add	a6,a2,a7
2300400e:	4048                	lw	a0,4(s0)
23004010:	9822                	add	a6,a6,s0
rc_normalize():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:480
23004012:	01d7ff63          	bgeu	a5,t4,23004030 <lzma_main+0x298>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
23004016:	4814                	lw	a3,16(s0)
23004018:	4458                	lw	a4,12(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:481
2300401a:	07a2                	slli	a5,a5,0x8
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
2300401c:	00168593          	addi	a1,a3,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:481
23004020:	c01c                	sw	a5,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
23004022:	c80c                	sw	a1,16(s0)
23004024:	9736                	add	a4,a4,a3
23004026:	00074703          	lbu	a4,0(a4)
2300402a:	0522                	slli	a0,a0,0x8
2300402c:	953a                	add	a0,a0,a4
2300402e:	c048                	sw	a0,4(s0)
rc_bit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:503
23004030:	00085703          	lhu	a4,0(a6)
23004034:	00b7d693          	srli	a3,a5,0xb
23004038:	02e686b3          	mul	a3,a3,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:506
2300403c:	40ea85b3          	sub	a1,s5,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:511
23004040:	00575313          	srli	t1,a4,0x5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:506
23004044:	8595                	srai	a1,a1,0x5
23004046:	95ba                	add	a1,a1,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:511
23004048:	40670733          	sub	a4,a4,t1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:509
2300404c:	8f95                	sub	a5,a5,a3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:510
2300404e:	40d50333          	sub	t1,a0,a3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:504
23004052:	0cd57363          	bgeu	a0,a3,23004118 <lzma_main+0x380>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:505
23004056:	c014                	sw	a3,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:506
23004058:	00b81023          	sh	a1,0(a6)
rc_bittree():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:529
2300405c:	face75e3          	bgeu	t3,a2,23004006 <lzma_main+0x26e>
lzma_match():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:661
23004060:	fc060613          	addi	a2,a2,-64
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:663
23004064:	478d                	li	a5,3
23004066:	2cc7fa63          	bgeu	a5,a2,2300433a <lzma_main+0x5a2>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:667
2300406a:	00167793          	andi	a5,a2,1
2300406e:	0789                	addi	a5,a5,2
23004070:	c83c                	sw	a5,80(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:669
23004072:	4735                	li	a4,13
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:666
23004074:	00165893          	srli	a7,a2,0x1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:669
23004078:	400c                	lw	a1,0(s0)
2300407a:	4048                	lw	a0,4(s0)
2300407c:	36c76c63          	bltu	a4,a2,230043f4 <lzma_main+0x65c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:666
23004080:	18fd                	addi	a7,a7,-1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:670
23004082:	011797b3          	sll	a5,a5,a7
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:672
23004086:	40c98633          	sub	a2,s3,a2
2300408a:	00f60f33          	add	t5,a2,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:670
2300408e:	c83c                	sw	a5,80(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:671
23004090:	5d440293          	addi	t0,s0,1492
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:672
23004094:	863e                	mv	a2,a5
rc_bittree_reverse():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:540
23004096:	4e01                	li	t3,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:539
23004098:	4305                	li	t1,1
rc_normalize():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:480
2300409a:	010003b7          	lui	t2,0x1000
rc_bittree_reverse():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:545
2300409e:	4f85                	li	t6,1
230040a0:	a809                	j	230040b2 <lzma_main+0x31a>
rc_bit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:505
230040a2:	c018                	sw	a4,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:506
230040a4:	00f81023          	sh	a5,0(a6)
rc_bittree_reverse():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:549
230040a8:	0e05                	addi	t3,t3,1
230040aa:	29c88963          	beq	a7,t3,2300433c <lzma_main+0x5a4>
230040ae:	400c                	lw	a1,0(s0)
230040b0:	4048                	lw	a0,4(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:543
230040b2:	006f07b3          	add	a5,t5,t1
230040b6:	0786                	slli	a5,a5,0x1
rc_normalize():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
230040b8:	00851713          	slli	a4,a0,0x8
rc_bittree_reverse():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:545
230040bc:	01cf9eb3          	sll	t4,t6,t3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:543
230040c0:	00f28833          	add	a6,t0,a5
rc_normalize():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:480
230040c4:	0075fe63          	bgeu	a1,t2,230040e0 <lzma_main+0x348>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
230040c8:	4814                	lw	a3,16(s0)
230040ca:	445c                	lw	a5,12(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:481
230040cc:	05a2                	slli	a1,a1,0x8
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
230040ce:	00168513          	addi	a0,a3,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:481
230040d2:	c00c                	sw	a1,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
230040d4:	c808                	sw	a0,16(s0)
230040d6:	97b6                	add	a5,a5,a3
230040d8:	0007c503          	lbu	a0,0(a5)
230040dc:	953a                	add	a0,a0,a4
230040de:	c048                	sw	a0,4(s0)
rc_bit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:503
230040e0:	00085783          	lhu	a5,0(a6)
230040e4:	00b5d713          	srli	a4,a1,0xb
230040e8:	0306                	slli	t1,t1,0x1
230040ea:	02f70733          	mul	a4,a4,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:506
230040ee:	40fa86b3          	sub	a3,s5,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:511
230040f2:	0057db13          	srli	s6,a5,0x5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:506
230040f6:	8695                	srai	a3,a3,0x5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:511
230040f8:	41678b33          	sub	s6,a5,s6
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:506
230040fc:	97b6                	add	a5,a5,a3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:509
230040fe:	8d99                	sub	a1,a1,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:510
23004100:	40e506b3          	sub	a3,a0,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:504
23004104:	f8e56fe3          	bltu	a0,a4,230040a2 <lzma_main+0x30a>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:509
23004108:	c00c                	sw	a1,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:510
2300410a:	c054                	sw	a3,4(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:511
2300410c:	01681023          	sh	s6,0(a6)
rc_bittree_reverse():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:545
23004110:	9676                	add	a2,a2,t4
23004112:	c830                	sw	a2,80(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:544
23004114:	0305                	addi	t1,t1,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:545
23004116:	bf49                	j	230040a8 <lzma_main+0x310>
rc_bit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:509
23004118:	c01c                	sw	a5,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:510
2300411a:	00642223          	sw	t1,4(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:511
2300411e:	00e81023          	sh	a4,0(a6)
rc_bittree():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:526
23004122:	0605                	addi	a2,a2,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:529
23004124:	eece71e3          	bgeu	t3,a2,23004006 <lzma_main+0x26e>
23004128:	bf25                	j	23004060 <lzma_main+0x2c8>
rc_bit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:509
2300412a:	406806b3          	sub	a3,a6,t1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:510
2300412e:	406787b3          	sub	a5,a5,t1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:511
23004132:	00555813          	srli	a6,a0,0x5
23004136:	41050533          	sub	a0,a0,a6
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:509
2300413a:	c014                	sw	a3,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:510
2300413c:	c05c                	sw	a5,4(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:511
2300413e:	1ea71a23          	sh	a0,500(a4)
rc_normalize():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:480
23004142:	01000537          	lui	a0,0x1000
23004146:	02a6f163          	bgeu	a3,a0,23004168 <lzma_main+0x3d0>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
2300414a:	01042803          	lw	a6,16(s0)
2300414e:	4448                	lw	a0,12(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:481
23004150:	06a2                	slli	a3,a3,0x8
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
23004152:	00180313          	addi	t1,a6,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:481
23004156:	c014                	sw	a3,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
23004158:	00642823          	sw	t1,16(s0)
2300415c:	9542                	add	a0,a0,a6
2300415e:	00054503          	lbu	a0,0(a0) # 1000000 <StackSize+0xfffc00>
23004162:	07a2                	slli	a5,a5,0x8
23004164:	97aa                	add	a5,a5,a0
23004166:	c05c                	sw	a5,4(s0)
rc_bit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:503
23004168:	20c75503          	lhu	a0,524(a4)
2300416c:	00b6d813          	srli	a6,a3,0xb
23004170:	02a80833          	mul	a6,a6,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:504
23004174:	1307fd63          	bgeu	a5,a6,230042ae <lzma_main+0x516>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:506
23004178:	40aa86b3          	sub	a3,s5,a0
2300417c:	8695                	srai	a3,a3,0x5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:505
2300417e:	01042023          	sw	a6,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:506
23004182:	9536                	add	a0,a0,a3
23004184:	20a71623          	sh	a0,524(a4)
rc_normalize():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:480
23004188:	01000737          	lui	a4,0x1000
2300418c:	02e87063          	bgeu	a6,a4,230041ac <lzma_main+0x414>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
23004190:	4814                	lw	a3,16(s0)
23004192:	4458                	lw	a4,12(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:481
23004194:	0822                	slli	a6,a6,0x8
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
23004196:	00168513          	addi	a0,a3,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:481
2300419a:	01042023          	sw	a6,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
2300419e:	c808                	sw	a0,16(s0)
230041a0:	9736                	add	a4,a4,a3
230041a2:	00074703          	lbu	a4,0(a4) # 1000000 <StackSize+0xfffc00>
230041a6:	07a2                	slli	a5,a5,0x8
230041a8:	97ba                	add	a5,a5,a4
230041aa:	c05c                	sw	a5,4(s0)
rc_bit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:503
230041ac:	2548d683          	lhu	a3,596(a7)
230041b0:	00b85513          	srli	a0,a6,0xb
230041b4:	02d50533          	mul	a0,a0,a3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:504
230041b8:	22a7f363          	bgeu	a5,a0,230043de <lzma_main+0x646>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:506
230041bc:	40da87b3          	sub	a5,s5,a3
230041c0:	8795                	srai	a5,a5,0x5
230041c2:	96be                	add	a3,a3,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:505
230041c4:	c008                	sw	a0,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:506
230041c6:	24d89a23          	sh	a3,596(a7)
lzma_state_short_rep():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_lzma2.h:89
230041ca:	4719                	li	a4,6
230041cc:	47a5                	li	a5,9
230041ce:	00b77363          	bgeu	a4,a1,230041d4 <lzma_main+0x43c>
230041d2:	47ad                	li	a5,11
230041d4:	06f40023          	sb	a5,96(s0)
lzma_rep_match():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:696
230041d8:	4785                	li	a5,1
230041da:	d07c                	sw	a5,100(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:697
230041dc:	4830                	lw	a2,80(s0)
dict_repeat():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:351
230041de:	505c                	lw	a5,36(s0)
230041e0:	16f66163          	bltu	a2,a5,23004342 <lzma_main+0x5aa>
lzma_main():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:750
230041e4:	4501                	li	a0,0
230041e6:	bef5                	j	23003de2 <lzma_main+0x4a>
lzma_state_literal():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_lzma2.h:68
230041e8:	4725                	li	a4,9
230041ea:	0af76d63          	bltu	a4,a5,230042a4 <lzma_main+0x50c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_lzma2.h:69
230041ee:	17f5                	addi	a5,a5,-3
230041f0:	06f40023          	sb	a5,96(s0)
230041f4:	541c                	lw	a5,40(s0)
230041f6:	b939                	j	23003e14 <lzma_main+0x7c>
lzma_literal():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:596
230041f8:	4834                	lw	a3,80(s0)
dict_get():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:322
230041fa:	8e15                	sub	a2,a2,a3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:324
230041fc:	00a6e463          	bltu	a3,a0,23004204 <lzma_main+0x46c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:325
23004200:	5454                	lw	a3,44(s0)
23004202:	9636                	add	a2,a2,a3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:327
23004204:	4f01                	li	t5,0
23004206:	080e1a63          	bnez	t3,2300429a <lzma_main+0x502>
lzma_literal():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:597
2300420a:	10000e13          	li	t3,256
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:595
2300420e:	4685                	li	a3,1
rc_normalize():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:480
23004210:	010002b7          	lui	t0,0x1000
lzma_literal():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:611
23004214:	0ff00f93          	li	t6,255
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:600
23004218:	01cf7eb3          	and	t4,t5,t3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:602
2300421c:	00de0633          	add	a2,t3,a3
23004220:	9676                	add	a2,a2,t4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:604
23004222:	0606                	slli	a2,a2,0x1
rc_normalize():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
23004224:	00879593          	slli	a1,a5,0x8
lzma_literal():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:609
23004228:	fffec393          	not	t2,t4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:604
2300422c:	00c80333          	add	t1,a6,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:601
23004230:	0f06                	slli	t5,t5,0x1
rc_normalize():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:480
23004232:	00577e63          	bgeu	a4,t0,2300424e <lzma_main+0x4b6>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
23004236:	4810                	lw	a2,16(s0)
23004238:	445c                	lw	a5,12(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:481
2300423a:	0722                	slli	a4,a4,0x8
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
2300423c:	00160513          	addi	a0,a2,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:481
23004240:	c018                	sw	a4,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
23004242:	c808                	sw	a0,16(s0)
23004244:	97b2                	add	a5,a5,a2
23004246:	0007c783          	lbu	a5,0(a5)
2300424a:	97ae                	add	a5,a5,a1
2300424c:	c05c                	sw	a5,4(s0)
rc_bit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:503
2300424e:	00035603          	lhu	a2,0(t1)
23004252:	00b75593          	srli	a1,a4,0xb
lzma_literal():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:609
23004256:	007e7e33          	and	t3,t3,t2
rc_bit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:503
2300425a:	02c585b3          	mul	a1,a1,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:506
2300425e:	40ca8533          	sub	a0,s5,a2
23004262:	8515                	srai	a0,a0,0x5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:511
23004264:	00565b13          	srli	s6,a2,0x5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:506
23004268:	9532                	add	a0,a0,a2
2300426a:	0686                	slli	a3,a3,0x1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:511
2300426c:	41660633          	sub	a2,a2,s6
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:509
23004270:	8f0d                	sub	a4,a4,a1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:510
23004272:	40b783b3          	sub	t2,a5,a1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:504
23004276:	00b7fa63          	bgeu	a5,a1,2300428a <lzma_main+0x4f2>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:505
2300427a:	c00c                	sw	a1,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:506
2300427c:	00a31023          	sh	a0,0(t1)
lzma_literal():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:611
23004280:	ccdfe0e3          	bltu	t6,a3,23003f40 <lzma_main+0x1a8>
23004284:	4018                	lw	a4,0(s0)
23004286:	405c                	lw	a5,4(s0)
23004288:	bf41                	j	23004218 <lzma_main+0x480>
rc_bit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:509
2300428a:	c018                	sw	a4,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:510
2300428c:	00742223          	sw	t2,4(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:511
23004290:	00c31023          	sh	a2,0(t1)
lzma_literal():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:605
23004294:	0685                	addi	a3,a3,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:606
23004296:	8e76                	mv	t3,t4
23004298:	b7e5                	j	23004280 <lzma_main+0x4e8>
dict_get():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:327
2300429a:	9646                	add	a2,a2,a7
2300429c:	00064f03          	lbu	t5,0(a2)
230042a0:	0f06                	slli	t5,t5,0x1
230042a2:	b7a5                	j	2300420a <lzma_main+0x472>
lzma_state_literal():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_lzma2.h:71
230042a4:	17e9                	addi	a5,a5,-6
230042a6:	06f40023          	sb	a5,96(s0)
230042aa:	541c                	lw	a5,40(s0)
230042ac:	b6a5                	j	23003e14 <lzma_main+0x7c>
rc_bit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:509
230042ae:	410686b3          	sub	a3,a3,a6
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:510
230042b2:	410787b3          	sub	a5,a5,a6
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:511
230042b6:	00555813          	srli	a6,a0,0x5
230042ba:	41050533          	sub	a0,a0,a6
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:509
230042be:	c014                	sw	a3,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:510
230042c0:	c05c                	sw	a5,4(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:511
230042c2:	20a71623          	sh	a0,524(a4)
rc_normalize():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:480
230042c6:	01000537          	lui	a0,0x1000
230042ca:	02a6f163          	bgeu	a3,a0,230042ec <lzma_main+0x554>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
230042ce:	01042803          	lw	a6,16(s0)
230042d2:	4448                	lw	a0,12(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:481
230042d4:	06a2                	slli	a3,a3,0x8
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
230042d6:	00180893          	addi	a7,a6,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:481
230042da:	c014                	sw	a3,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
230042dc:	01142823          	sw	a7,16(s0)
230042e0:	9542                	add	a0,a0,a6
230042e2:	00054503          	lbu	a0,0(a0) # 1000000 <StackSize+0xfffc00>
230042e6:	07a2                	slli	a5,a5,0x8
230042e8:	97aa                	add	a5,a5,a0
230042ea:	c05c                	sw	a5,4(s0)
rc_bit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:503
230042ec:	22475803          	lhu	a6,548(a4)
230042f0:	00b6d513          	srli	a0,a3,0xb
230042f4:	05442883          	lw	a7,84(s0)
230042f8:	03050533          	mul	a0,a0,a6
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:504
230042fc:	08a7f063          	bgeu	a5,a0,2300437c <lzma_main+0x5e4>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:506
23004300:	410a87b3          	sub	a5,s5,a6
23004304:	8795                	srai	a5,a5,0x5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:505
23004306:	c008                	sw	a0,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:506
23004308:	983e                	add	a6,a6,a5
2300430a:	23071223          	sh	a6,548(a4)
lzma_rep_match():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:701
2300430e:	8346                	mv	t1,a7
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:713
23004310:	483c                	lw	a5,80(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:714
23004312:	04642823          	sw	t1,80(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:713
23004316:	c87c                	sw	a5,84(s0)
lzma_state_long_rep():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_lzma2.h:83
23004318:	4719                	li	a4,6
2300431a:	47a1                	li	a5,8
2300431c:	00b77363          	bgeu	a4,a1,23004322 <lzma_main+0x58a>
23004320:	47ad                	li	a5,11
23004322:	06f40023          	sb	a5,96(s0)
lzma_rep_match():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:718
23004326:	85ca                	mv	a1,s2
23004328:	8522                	mv	a0,s0
2300432a:	88dff0ef          	jal	ra,23003bb6 <lzma_len>
2300432e:	4830                	lw	a2,80(s0)
23004330:	a031                	j	2300433c <lzma_main+0x5a4>
lzma_get_dist_state():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_lzma2.h:150
23004332:	4895                	li	a7,5
23004334:	b1c9                	j	23003ff6 <lzma_main+0x25e>
lzma_state_match():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_lzma2.h:77
23004336:	47a9                	li	a5,10
23004338:	b969                	j	23003fd2 <lzma_main+0x23a>
lzma_match():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:664
2300433a:	c830                	sw	a2,80(s0)
dict_repeat():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:351
2300433c:	505c                	lw	a5,36(s0)
2300433e:	eaf673e3          	bgeu	a2,a5,230041e4 <lzma_main+0x44c>
23004342:	581c                	lw	a5,48(s0)
23004344:	eaf670e3          	bgeu	a2,a5,230041e4 <lzma_main+0x44c>
23004348:	85d2                	mv	a1,s4
2300434a:	01840513          	addi	a0,s0,24
2300434e:	9e5ff0ef          	jal	ra,23003d32 <dict_repeat.part.1>
lzma_main():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:749
23004352:	e80509e3          	beqz	a0,230041e4 <lzma_main+0x44c>
23004356:	5008                	lw	a0,32(s0)
23004358:	541c                	lw	a5,40(s0)
2300435a:	bc6d                	j	23003e14 <lzma_main+0x7c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:731
2300435c:	4830                	lw	a2,80(s0)
dict_repeat():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:351
2300435e:	5058                	lw	a4,36(s0)
23004360:	a8e67ee3          	bgeu	a2,a4,23003dfc <lzma_main+0x64>
23004364:	5818                	lw	a4,48(s0)
23004366:	a8e67be3          	bgeu	a2,a4,23003dfc <lzma_main+0x64>
2300436a:	06440593          	addi	a1,s0,100
2300436e:	01840513          	addi	a0,s0,24
23004372:	9c1ff0ef          	jal	ra,23003d32 <dict_repeat.part.1>
23004376:	5008                	lw	a0,32(s0)
23004378:	541c                	lw	a5,40(s0)
2300437a:	b449                	j	23003dfc <lzma_main+0x64>
rc_bit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:509
2300437c:	8e89                	sub	a3,a3,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:510
2300437e:	8f89                	sub	a5,a5,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:511
23004380:	00585513          	srli	a0,a6,0x5
23004384:	40a80833          	sub	a6,a6,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:509
23004388:	c014                	sw	a3,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:510
2300438a:	c05c                	sw	a5,4(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:511
2300438c:	23071223          	sh	a6,548(a4)
rc_normalize():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:480
23004390:	01000537          	lui	a0,0x1000
23004394:	02a6f163          	bgeu	a3,a0,230043b6 <lzma_main+0x61e>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
23004398:	01042803          	lw	a6,16(s0)
2300439c:	4448                	lw	a0,12(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:481
2300439e:	06a2                	slli	a3,a3,0x8
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
230043a0:	00180313          	addi	t1,a6,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:481
230043a4:	c014                	sw	a3,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
230043a6:	00642823          	sw	t1,16(s0)
230043aa:	9542                	add	a0,a0,a6
230043ac:	00054503          	lbu	a0,0(a0) # 1000000 <StackSize+0xfffc00>
230043b0:	07a2                	slli	a5,a5,0x8
230043b2:	97aa                	add	a5,a5,a0
230043b4:	c05c                	sw	a5,4(s0)
rc_bit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:503
230043b6:	23c75803          	lhu	a6,572(a4)
230043ba:	00b6d513          	srli	a0,a3,0xb
230043be:	05842303          	lw	t1,88(s0)
230043c2:	03050533          	mul	a0,a0,a6
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:504
230043c6:	10a7f063          	bgeu	a5,a0,230044c6 <lzma_main+0x72e>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:506
230043ca:	410a87b3          	sub	a5,s5,a6
230043ce:	8795                	srai	a5,a5,0x5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:505
230043d0:	c008                	sw	a0,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:506
230043d2:	983e                	add	a6,a6,a5
230043d4:	23071e23          	sh	a6,572(a4)
lzma_rep_match():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:710
230043d8:	05142c23          	sw	a7,88(s0)
230043dc:	bf15                	j	23004310 <lzma_main+0x578>
rc_bit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:509
230043de:	40a80733          	sub	a4,a6,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:510
230043e2:	8f89                	sub	a5,a5,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:511
230043e4:	0056d513          	srli	a0,a3,0x5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:509
230043e8:	c018                	sw	a4,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:510
230043ea:	c05c                	sw	a5,4(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:511
230043ec:	8e89                	sub	a3,a3,a0
230043ee:	24d89a23          	sh	a3,596(a7)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:515
230043f2:	b71d                	j	23004318 <lzma_main+0x580>
lzma_match():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:676
230043f4:	ffb88713          	addi	a4,a7,-5
rc_normalize():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:480
230043f8:	01000837          	lui	a6,0x1000
rc_direct():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:563
230043fc:	0786                	slli	a5,a5,0x1
230043fe:	0785                	addi	a5,a5,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:564
23004400:	177d                	addi	a4,a4,-1
rc_normalize():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
23004402:	00851613          	slli	a2,a0,0x8
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:480
23004406:	0105fe63          	bgeu	a1,a6,23004422 <lzma_main+0x68a>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
2300440a:	4808                	lw	a0,16(s0)
2300440c:	4454                	lw	a3,12(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:481
2300440e:	05a2                	slli	a1,a1,0x8
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
23004410:	00150893          	addi	a7,a0,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:481
23004414:	c00c                	sw	a1,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
23004416:	01142823          	sw	a7,16(s0)
2300441a:	96aa                	add	a3,a3,a0
2300441c:	0006c503          	lbu	a0,0(a3)
23004420:	9532                	add	a0,a0,a2
rc_direct():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:559
23004422:	8185                	srli	a1,a1,0x1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:560
23004424:	8d0d                	sub	a0,a0,a1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:561
23004426:	41f55693          	srai	a3,a0,0x1f
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:562
2300442a:	00d5f633          	and	a2,a1,a3
2300442e:	9532                	add	a0,a0,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:563
23004430:	97b6                	add	a5,a5,a3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:559
23004432:	c00c                	sw	a1,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:562
23004434:	c048                	sw	a0,4(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:563
23004436:	c83c                	sw	a5,80(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:564
23004438:	f371                	bnez	a4,230043fc <lzma_main+0x664>
lzma_match():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:677
2300443a:	00479613          	slli	a2,a5,0x4
2300443e:	c830                	sw	a2,80(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:678
23004440:	6b840393          	addi	t2,s0,1720
rc_bittree_reverse():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:539
23004444:	4805                	li	a6,1
rc_normalize():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:480
23004446:	010002b7          	lui	t0,0x1000
rc_bittree_reverse():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:545
2300444a:	4f85                	li	t6,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:549
2300444c:	4f11                	li	t5,4
2300444e:	a809                	j	23004460 <lzma_main+0x6c8>
rc_bit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:505
23004450:	c014                	sw	a3,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:506
23004452:	00fe1023          	sh	a5,0(t3)
rc_bittree_reverse():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:549
23004456:	0705                	addi	a4,a4,1
23004458:	efe702e3          	beq	a4,t5,2300433c <lzma_main+0x5a4>
2300445c:	400c                	lw	a1,0(s0)
2300445e:	4048                	lw	a0,4(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:543
23004460:	0806                	slli	a6,a6,0x1
rc_normalize():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
23004462:	00851693          	slli	a3,a0,0x8
rc_bittree_reverse():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:545
23004466:	00ef9eb3          	sll	t4,t6,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:543
2300446a:	01038e33          	add	t3,t2,a6
rc_normalize():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:480
2300446e:	0055ff63          	bgeu	a1,t0,2300448c <lzma_main+0x6f4>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
23004472:	4808                	lw	a0,16(s0)
23004474:	445c                	lw	a5,12(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:481
23004476:	05a2                	slli	a1,a1,0x8
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
23004478:	00150893          	addi	a7,a0,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:481
2300447c:	c00c                	sw	a1,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:482
2300447e:	01142823          	sw	a7,16(s0)
23004482:	97aa                	add	a5,a5,a0
23004484:	0007c503          	lbu	a0,0(a5)
23004488:	9536                	add	a0,a0,a3
2300448a:	c048                	sw	a0,4(s0)
rc_bit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:503
2300448c:	000e5783          	lhu	a5,0(t3)
23004490:	00b5d693          	srli	a3,a1,0xb
23004494:	02f686b3          	mul	a3,a3,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:506
23004498:	40fa88b3          	sub	a7,s5,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:511
2300449c:	0057d313          	srli	t1,a5,0x5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:506
230044a0:	4058d893          	srai	a7,a7,0x5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:511
230044a4:	40678333          	sub	t1,a5,t1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:506
230044a8:	97c6                	add	a5,a5,a7
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:509
230044aa:	8d95                	sub	a1,a1,a3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:510
230044ac:	40d508b3          	sub	a7,a0,a3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:504
230044b0:	fad560e3          	bltu	a0,a3,23004450 <lzma_main+0x6b8>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:509
230044b4:	c00c                	sw	a1,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:510
230044b6:	01142223          	sw	a7,4(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:511
230044ba:	006e1023          	sh	t1,0(t3)
rc_bittree_reverse():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:545
230044be:	9676                	add	a2,a2,t4
230044c0:	c830                	sw	a2,80(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:544
230044c2:	0805                	addi	a6,a6,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:545
230044c4:	bf49                	j	23004456 <lzma_main+0x6be>
lzma_rep_match():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:706
230044c6:	05c42e03          	lw	t3,92(s0)
rc_bit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:509
230044ca:	8e89                	sub	a3,a3,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:510
230044cc:	8f89                	sub	a5,a5,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:511
230044ce:	00585513          	srli	a0,a6,0x5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:509
230044d2:	c014                	sw	a3,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:510
230044d4:	c05c                	sw	a5,4(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:511
230044d6:	40a80833          	sub	a6,a6,a0
230044da:	23071e23          	sh	a6,572(a4)
lzma_rep_match():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:707
230044de:	04642e23          	sw	t1,92(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:710
230044e2:	05142c23          	sw	a7,88(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:706
230044e6:	8372                	mv	t1,t3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:710
230044e8:	b525                	j	23004310 <lzma_main+0x578>

230044ea <xz_dec_lzma2_run>:
xz_dec_lzma2_run():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:933
230044ea:	7179                	addi	sp,sp,-48
230044ec:	cc52                	sw	s4,24(sp)
230044ee:	41dc                	lw	a5,4(a1)
230044f0:	6a1d                	lui	s4,0x7
230044f2:	0085a803          	lw	a6,8(a1)
230044f6:	04054703          	lbu	a4,64(a0)
230044fa:	ce4e                	sw	s3,28(sp)
230044fc:	ca56                	sw	s5,20(sp)
230044fe:	ee0a0993          	addi	s3,s4,-288 # 6ee0 <StackSize+0x6ae0>
lzma2_lzma():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:919
23004502:	ee4a0a93          	addi	s5,s4,-284
xz_dec_lzma2_run():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:933
23004506:	c85a                	sw	s6,16(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1010
23004508:	6b05                	lui	s6,0x1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:933
2300450a:	d422                	sw	s0,40(sp)
2300450c:	d226                	sw	s1,36(sp)
2300450e:	d606                	sw	ra,44(sp)
23004510:	d04a                	sw	s2,32(sp)
23004512:	c65e                	sw	s7,12(sp)
23004514:	c462                	sw	s8,8(sp)
23004516:	842a                	mv	s0,a0
23004518:	84ae                	mv	s1,a1
2300451a:	99aa                	add	s3,s3,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1010
2300451c:	803b0b13          	addi	s6,s6,-2045 # 803 <StackSize+0x403>
lzma2_lzma():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:852
23004520:	9a2a                	add	s4,s4,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:919
23004522:	9aaa                	add	s5,s5,a0
23004524:	01871313          	slli	t1,a4,0x18
23004528:	4691                	li	a3,4
2300452a:	4619                	li	a2,6
2300452c:	4e9d                	li	t4,7
2300452e:	4e21                	li	t3,8
23004530:	4585                	li	a1,1
23004532:	41835313          	srai	t1,t1,0x18
23004536:	4889                	li	a7,2
23004538:	450d                	li	a0,3
xz_dec_lzma2_run():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:936
2300453a:	0d07e963          	bltu	a5,a6,2300460c <xz_dec_lzma2_run+0x122>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:936 (discriminator 1)
2300453e:	469d                	li	a3,7
23004540:	1ad71863          	bne	a4,a3,230046f0 <xz_dec_lzma2_run+0x206>
23004544:	4438                	lw	a4,72(s0)
23004546:	408c                	lw	a1,0(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1072
23004548:	48d4                	lw	a3,20(s1)
2300454a:	4888                	lw	a0,16(s1)
2300454c:	4070                	lw	a2,68(s0)
2300454e:	8e89                	sub	a3,a3,a0
23004550:	00d67363          	bgeu	a2,a3,23004556 <xz_dec_lzma2_run+0x6c>
23004554:	86b2                	mv	a3,a2
dict_limit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:302
23004556:	5450                	lw	a2,44(s0)
23004558:	5008                	lw	a0,32(s0)
2300455a:	40a608b3          	sub	a7,a2,a0
2300455e:	0116f463          	bgeu	a3,a7,23004566 <xz_dec_lzma2_run+0x7c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:305
23004562:	00a68633          	add	a2,a3,a0
lzma2_lzma():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:852
23004566:	ee0a2503          	lw	a0,-288(s4)
2300456a:	d410                	sw	a2,40(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:851
2300456c:	40f80633          	sub	a2,a6,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:852
23004570:	18051d63          	bnez	a0,2300470a <xz_dec_lzma2_run+0x220>
23004574:	18070b63          	beqz	a4,2300470a <xz_dec_lzma2_run+0x220>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:894
23004578:	46d1                	li	a3,20
2300457a:	20c6e663          	bltu	a3,a2,23004786 <xz_dec_lzma2_run+0x29c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:916
2300457e:	8932                	mv	s2,a2
23004580:	00c77363          	bgeu	a4,a2,23004586 <xz_dec_lzma2_run+0x9c>
23004584:	893a                	mv	s2,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:919
23004586:	864a                	mv	a2,s2
23004588:	95be                	add	a1,a1,a5
2300458a:	8556                	mv	a0,s5
2300458c:	dfefe0ef          	jal	ra,23002b8a <memcpy>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:921
23004590:	40d0                	lw	a2,4(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:920
23004592:	ef2a2023          	sw	s2,-288(s4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:921
23004596:	964a                	add	a2,a2,s2
23004598:	c0d0                	sw	a2,4(s1)
dict_flush():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:418
2300459a:	02042c03          	lw	s8,32(s0)
2300459e:	01c42903          	lw	s2,28(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:420
230045a2:	03c44703          	lbu	a4,60(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:418
230045a6:	87e2                	mv	a5,s8
230045a8:	412c0bb3          	sub	s7,s8,s2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:420
230045ac:	cf19                	beqz	a4,230045ca <xz_dec_lzma2_run+0xe0>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:421
230045ae:	545c                	lw	a5,44(s0)
xz_dec_lzma2_run():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1078
230045b0:	44c8                	lw	a0,12(s1)
dict_flush():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:421
230045b2:	00fc1463          	bne	s8,a5,230045ba <xz_dec_lzma2_run+0xd0>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:422
230045b6:	02042023          	sw	zero,32(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:424
230045ba:	489c                	lw	a5,16(s1)
230045bc:	4c0c                	lw	a1,24(s0)
230045be:	865e                	mv	a2,s7
230045c0:	953e                	add	a0,a0,a5
230045c2:	95ca                	add	a1,a1,s2
230045c4:	dc6fe0ef          	jal	ra,23002b8a <memcpy>
230045c8:	501c                	lw	a5,32(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:428
230045ca:	cc5c                	sw	a5,28(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:429
230045cc:	489c                	lw	a5,16(s1)
230045ce:	9bbe                	add	s7,s7,a5
230045d0:	0174a823          	sw	s7,16(s1)
xz_dec_lzma2_run():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1078
230045d4:	407c                	lw	a5,68(s0)
230045d6:	993e                	add	s2,s2,a5
230045d8:	41890933          	sub	s2,s2,s8
230045dc:	05242223          	sw	s2,68(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1080
230045e0:	30091563          	bnez	s2,230048ea <xz_dec_lzma2_run+0x400>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1081
230045e4:	443c                	lw	a5,72(s0)
230045e6:	30079063          	bnez	a5,230048e6 <xz_dec_lzma2_run+0x3fc>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1081 (discriminator 1)
230045ea:	507c                	lw	a5,100(s0)
230045ec:	2e079d63          	bnez	a5,230048e6 <xz_dec_lzma2_run+0x3fc>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1082
230045f0:	405c                	lw	a5,4(s0)
230045f2:	2e079a63          	bnez	a5,230048e6 <xz_dec_lzma2_run+0x3fc>
rc_reset():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:440
230045f6:	57fd                	li	a5,-1
230045f8:	c01c                	sw	a5,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:442
230045fa:	4795                	li	a5,5
230045fc:	c41c                	sw	a5,8(s0)
xz_dec_lzma2_run():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1086
230045fe:	04040023          	sb	zero,64(s0)
23004602:	40dc                	lw	a5,4(s1)
23004604:	0084a803          	lw	a6,8(s1)
23004608:	4701                	li	a4,0
2300460a:	bf29                	j	23004524 <xz_dec_lzma2_run+0x3a>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:937
2300460c:	30d70263          	beq	a4,a3,23004910 <xz_dec_lzma2_run+0x426>
23004610:	02e6e863          	bltu	a3,a4,23004640 <xz_dec_lzma2_run+0x156>
23004614:	36b70a63          	beq	a4,a1,23004988 <xz_dec_lzma2_run+0x49e>
23004618:	30030d63          	beqz	t1,23004932 <xz_dec_lzma2_run+0x448>
2300461c:	39170763          	beq	a4,a7,230049aa <xz_dec_lzma2_run+0x4c0>
23004620:	f0a71de3          	bne	a4,a0,2300453a <xz_dec_lzma2_run+0x50>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1030
23004624:	4098                	lw	a4,0(s1)
23004626:	00178613          	addi	a2,a5,1
2300462a:	c0d0                	sw	a2,4(s1)
2300462c:	97ba                	add	a5,a5,a4
2300462e:	0007c703          	lbu	a4,0(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1032
23004632:	87b2                	mv	a5,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1031
23004634:	04d40023          	sb	a3,64(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1030
23004638:	0722                	slli	a4,a4,0x8
2300463a:	c438                	sw	a4,72(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1032
2300463c:	4711                	li	a4,4
2300463e:	b5dd                	j	23004524 <xz_dec_lzma2_run+0x3a>
23004640:	24c70c63          	beq	a4,a2,23004898 <xz_dec_lzma2_run+0x3ae>
23004644:	18c76363          	bltu	a4,a2,230047ca <xz_dec_lzma2_run+0x2e0>
23004648:	efd70ee3          	beq	a4,t4,23004544 <xz_dec_lzma2_run+0x5a>
2300464c:	efc717e3          	bne	a4,t3,2300453a <xz_dec_lzma2_run+0x50>
dict_uncompressed():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:379
23004650:	4434                	lw	a3,72(s0)
23004652:	36068d63          	beqz	a3,230049cc <xz_dec_lzma2_run+0x4e2>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:380
23004656:	4890                	lw	a2,16(s1)
23004658:	0144a903          	lw	s2,20(s1)
2300465c:	09267a63          	bgeu	a2,s2,230046f0 <xz_dec_lzma2_run+0x206>
23004660:	5018                	lw	a4,32(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:381
23004662:	40f805b3          	sub	a1,a6,a5
23004666:	40c907b3          	sub	a5,s2,a2
2300466a:	00f5f363          	bgeu	a1,a5,23004670 <xz_dec_lzma2_run+0x186>
2300466e:	87ae                	mv	a5,a1
23004670:	00f6f363          	bgeu	a3,a5,23004676 <xz_dec_lzma2_run+0x18c>
23004674:	87b6                	mv	a5,a3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:383
23004676:	5450                	lw	a2,44(s0)
23004678:	893e                	mv	s2,a5
2300467a:	40e607b3          	sub	a5,a2,a4
2300467e:	0127f363          	bgeu	a5,s2,23004684 <xz_dec_lzma2_run+0x19a>
23004682:	893e                	mv	s2,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:388
23004684:	412686b3          	sub	a3,a3,s2
23004688:	c434                	sw	a3,72(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:390
2300468a:	40dc                	lw	a5,4(s1)
2300468c:	4c08                	lw	a0,24(s0)
2300468e:	408c                	lw	a1,0(s1)
23004690:	864a                	mv	a2,s2
23004692:	953a                	add	a0,a0,a4
23004694:	95be                	add	a1,a1,a5
23004696:	cf4fe0ef          	jal	ra,23002b8a <memcpy>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:391
2300469a:	5018                	lw	a4,32(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:393
2300469c:	505c                	lw	a5,36(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:391
2300469e:	974a                	add	a4,a4,s2
230046a0:	d018                	sw	a4,32(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:393
230046a2:	00e7f363          	bgeu	a5,a4,230046a8 <xz_dec_lzma2_run+0x1be>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:394
230046a6:	d058                	sw	a4,36(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:396
230046a8:	03c44783          	lbu	a5,60(s0)
230046ac:	c385                	beqz	a5,230046cc <xz_dec_lzma2_run+0x1e2>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:397
230046ae:	545c                	lw	a5,44(s0)
230046b0:	00f71463          	bne	a4,a5,230046b8 <xz_dec_lzma2_run+0x1ce>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:398
230046b4:	02042023          	sw	zero,32(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:400
230046b8:	4898                	lw	a4,16(s1)
230046ba:	44c8                	lw	a0,12(s1)
230046bc:	408c                	lw	a1,0(s1)
230046be:	40dc                	lw	a5,4(s1)
230046c0:	953a                	add	a0,a0,a4
230046c2:	864a                	mv	a2,s2
230046c4:	95be                	add	a1,a1,a5
230046c6:	cc4fe0ef          	jal	ra,23002b8a <memcpy>
230046ca:	5018                	lw	a4,32(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:406
230046cc:	4890                	lw	a2,16(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:407
230046ce:	40dc                	lw	a5,4(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:404
230046d0:	cc58                	sw	a4,28(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:406
230046d2:	964a                	add	a2,a2,s2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:407
230046d4:	97ca                	add	a5,a5,s2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:406
230046d6:	c890                	sw	a2,16(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:407
230046d8:	c0dc                	sw	a5,4(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:379
230046da:	4434                	lw	a3,72(s0)
230046dc:	0084a803          	lw	a6,8(s1)
230046e0:	2e068663          	beqz	a3,230049cc <xz_dec_lzma2_run+0x4e2>
230046e4:	0107f663          	bgeu	a5,a6,230046f0 <xz_dec_lzma2_run+0x206>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:380
230046e8:	0144a903          	lw	s2,20(s1)
230046ec:	f7266be3          	bltu	a2,s2,23004662 <xz_dec_lzma2_run+0x178>
xz_dec_lzma2_run():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1100
230046f0:	4501                	li	a0,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1110
230046f2:	50b2                	lw	ra,44(sp)
230046f4:	5422                	lw	s0,40(sp)
230046f6:	5492                	lw	s1,36(sp)
230046f8:	5902                	lw	s2,32(sp)
230046fa:	49f2                	lw	s3,28(sp)
230046fc:	4a62                	lw	s4,24(sp)
230046fe:	4ad2                	lw	s5,20(sp)
23004700:	4b42                	lw	s6,16(sp)
23004702:	4bb2                	lw	s7,12(sp)
23004704:	4c22                	lw	s8,8(sp)
23004706:	6145                	addi	sp,sp,48
23004708:	8082                	ret
lzma2_lzma():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:854
2300470a:	40a70933          	sub	s2,a4,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:853
2300470e:	02a00713          	li	a4,42
23004712:	8f09                	sub	a4,a4,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:856
23004714:	01267363          	bgeu	a2,s2,2300471a <xz_dec_lzma2_run+0x230>
23004718:	8932                	mv	s2,a2
2300471a:	01277363          	bgeu	a4,s2,23004720 <xz_dec_lzma2_run+0x236>
2300471e:	893a                	mv	s2,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:859
23004720:	95be                	add	a1,a1,a5
23004722:	864a                	mv	a2,s2
23004724:	9556                	add	a0,a0,s5
23004726:	c64fe0ef          	jal	ra,23002b8a <memcpy>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:861
2300472a:	ee0a2503          	lw	a0,-288(s4)
2300472e:	443c                	lw	a5,72(s0)
23004730:	954a                	add	a0,a0,s2
23004732:	2ef50a63          	beq	a0,a5,23004a26 <xz_dec_lzma2_run+0x53c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:866
23004736:	47d1                	li	a5,20
23004738:	2ea7f063          	bgeu	a5,a0,23004a18 <xz_dec_lzma2_run+0x52e>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:871
2300473c:	152d                	addi	a0,a0,-21
2300473e:	c848                	sw	a0,20(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:874
23004740:	01542623          	sw	s5,12(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:875
23004744:	00042823          	sw	zero,16(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:877
23004748:	8522                	mv	a0,s0
2300474a:	e4eff0ef          	jal	ra,23003d98 <lzma_main>
2300474e:	18050c63          	beqz	a0,230048e6 <xz_dec_lzma2_run+0x3fc>
23004752:	ee0a2783          	lw	a5,-288(s4)
23004756:	4814                	lw	a3,16(s0)
23004758:	993e                	add	s2,s2,a5
2300475a:	18d96663          	bltu	s2,a3,230048e6 <xz_dec_lzma2_run+0x3fc>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:880
2300475e:	4438                	lw	a4,72(s0)
23004760:	8f15                	sub	a4,a4,a3
23004762:	c438                	sw	a4,72(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:882
23004764:	32f6e663          	bltu	a3,a5,23004a90 <xz_dec_lzma2_run+0x5a6>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:889
23004768:	40d0                	lw	a2,4(s1)
2300476a:	0084a803          	lw	a6,8(s1)
2300476e:	408c                	lw	a1,0(s1)
23004770:	40f607b3          	sub	a5,a2,a5
23004774:	97b6                	add	a5,a5,a3
23004776:	c0dc                	sw	a5,4(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:890
23004778:	ee0a2023          	sw	zero,-288(s4)
2300477c:	40f80633          	sub	a2,a6,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:894
23004780:	46d1                	li	a3,20
23004782:	dec6fee3          	bgeu	a3,a2,2300457e <xz_dec_lzma2_run+0x94>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:895
23004786:	c44c                	sw	a1,12(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:896
23004788:	c81c                	sw	a5,16(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:898
2300478a:	01570693          	addi	a3,a4,21
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:901
2300478e:	feb80593          	addi	a1,a6,-21 # ffffeb <StackSize+0xfffbeb>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:898
23004792:	00d66463          	bltu	a2,a3,2300479a <xz_dec_lzma2_run+0x2b0>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:899
23004796:	00f705b3          	add	a1,a4,a5
2300479a:	c84c                	sw	a1,20(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:903
2300479c:	8522                	mv	a0,s0
2300479e:	dfaff0ef          	jal	ra,23003d98 <lzma_main>
230047a2:	14050263          	beqz	a0,230048e6 <xz_dec_lzma2_run+0x3fc>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:906
230047a6:	481c                	lw	a5,16(s0)
230047a8:	40d8                	lw	a4,4(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:907
230047aa:	4434                	lw	a3,72(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:906
230047ac:	40e78633          	sub	a2,a5,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:907
230047b0:	12c6eb63          	bltu	a3,a2,230048e6 <xz_dec_lzma2_run+0x3fc>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:914
230047b4:	4490                	lw	a2,8(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:910
230047b6:	8f1d                	sub	a4,a4,a5
230047b8:	9736                	add	a4,a4,a3
230047ba:	c438                	sw	a4,72(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:911
230047bc:	c0dc                	sw	a5,4(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:914
230047be:	8e1d                	sub	a2,a2,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:915
230047c0:	46d1                	li	a3,20
230047c2:	dcc6ece3          	bltu	a3,a2,2300459a <xz_dec_lzma2_run+0xb0>
230047c6:	408c                	lw	a1,0(s1)
230047c8:	bb5d                	j	2300457e <xz_dec_lzma2_run+0x94>
xz_dec_lzma2_run():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1041
230047ca:	4098                	lw	a4,0(s1)
230047cc:	00178693          	addi	a3,a5,1
230047d0:	c0d4                	sw	a3,4(s1)
230047d2:	97ba                	add	a5,a5,a4
230047d4:	0007c703          	lbu	a4,0(a5)
lzma_props():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:801
230047d8:	0e000793          	li	a5,224
230047dc:	10e7e563          	bltu	a5,a4,230048e6 <xz_dec_lzma2_run+0x3fc>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:804
230047e0:	06042823          	sw	zero,112(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:805
230047e4:	02c00793          	li	a5,44
230047e8:	2ce7f063          	bgeu	a5,a4,23004aa8 <xz_dec_lzma2_run+0x5be>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:806
230047ec:	fd370713          	addi	a4,a4,-45
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:805
230047f0:	4785                	li	a5,1
230047f2:	02c00613          	li	a2,44
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:806
230047f6:	0ff77713          	andi	a4,a4,255
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:807
230047fa:	00178693          	addi	a3,a5,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:805
230047fe:	00e67b63          	bgeu	a2,a4,23004814 <xz_dec_lzma2_run+0x32a>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:806
23004802:	fd370713          	addi	a4,a4,-45
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:805
23004806:	87b6                	mv	a5,a3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:806
23004808:	0ff77713          	andi	a4,a4,255
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:807
2300480c:	00178693          	addi	a3,a5,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:805
23004810:	fee669e3          	bltu	a2,a4,23004802 <xz_dec_lzma2_run+0x318>
23004814:	4685                	li	a3,1
23004816:	00f697b3          	sll	a5,a3,a5
2300481a:	17fd                	addi	a5,a5,-1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:810
2300481c:	d83c                	sw	a5,112(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:812
2300481e:	06042623          	sw	zero,108(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:813
23004822:	47a1                	li	a5,8
23004824:	28e7f063          	bgeu	a5,a4,23004aa4 <xz_dec_lzma2_run+0x5ba>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:814
23004828:	175d                	addi	a4,a4,-9
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:813
2300482a:	4785                	li	a5,1
2300482c:	4621                	li	a2,8
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:814
2300482e:	0ff77713          	andi	a4,a4,255
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:815
23004832:	00178693          	addi	a3,a5,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:813
23004836:	00e67a63          	bgeu	a2,a4,2300484a <xz_dec_lzma2_run+0x360>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:814
2300483a:	175d                	addi	a4,a4,-9
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:813
2300483c:	87b6                	mv	a5,a3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:814
2300483e:	0ff77713          	andi	a4,a4,255
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:815
23004842:	00178693          	addi	a3,a5,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:813
23004846:	fee66ae3          	bltu	a2,a4,2300483a <xz_dec_lzma2_run+0x350>
2300484a:	d47c                	sw	a5,108(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:818
2300484c:	d438                	sw	a4,104(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:820
2300484e:	4691                	li	a3,4
23004850:	973e                	add	a4,a4,a5
23004852:	08e6ea63          	bltu	a3,a4,230048e6 <xz_dec_lzma2_run+0x3fc>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:823
23004856:	4705                	li	a4,1
23004858:	00f717b3          	sll	a5,a4,a5
2300485c:	17fd                	addi	a5,a5,-1
2300485e:	d47c                	sw	a5,108(s0)
lzma_reset():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:772
23004860:	06040023          	sb	zero,96(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:773
23004864:	04042823          	sw	zero,80(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:774
23004868:	04042a23          	sw	zero,84(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:775
2300486c:	04042c23          	sw	zero,88(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:776
23004870:	04042e23          	sw	zero,92(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:788
23004874:	07440713          	addi	a4,s0,116
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:789
23004878:	40000793          	li	a5,1024
2300487c:	00f71023          	sh	a5,0(a4)
23004880:	0709                	addi	a4,a4,2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:788
23004882:	fee99de3          	bne	s3,a4,2300487c <xz_dec_lzma2_run+0x392>
rc_reset():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:440
23004886:	57fd                	li	a5,-1
23004888:	c01c                	sw	a5,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:442
2300488a:	4795                	li	a5,5
2300488c:	c41c                	sw	a5,8(s0)
xz_dec_lzma2_run():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1044
2300488e:	4799                	li	a5,6
rc_reset():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:441
23004890:	00042223          	sw	zero,4(s0)
xz_dec_lzma2_run():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1044
23004894:	04f40023          	sb	a5,64(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1050
23004898:	4428                	lw	a0,72(s0)
2300489a:	4791                	li	a5,4
2300489c:	04a7f563          	bgeu	a5,a0,230048e6 <xz_dec_lzma2_run+0x3fc>
rc_read_init():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:451
230048a0:	4414                	lw	a3,8(s0)
230048a2:	40dc                	lw	a5,4(s1)
230048a4:	20068463          	beqz	a3,23004aac <xz_dec_lzma2_run+0x5c2>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:452
230048a8:	e4f804e3          	beq	a6,a5,230046f0 <xz_dec_lzma2_run+0x206>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:455
230048ac:	408c                	lw	a1,0(s1)
230048ae:	4058                	lw	a4,4(s0)
230048b0:	a029                	j	230048ba <xz_dec_lzma2_run+0x3d0>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:452
230048b2:	40dc                	lw	a5,4(s1)
230048b4:	4490                	lw	a2,8(s1)
230048b6:	e2c78de3          	beq	a5,a2,230046f0 <xz_dec_lzma2_run+0x206>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:455
230048ba:	00178613          	addi	a2,a5,1
230048be:	c0d0                	sw	a2,4(s1)
230048c0:	97ae                	add	a5,a5,a1
230048c2:	0007c783          	lbu	a5,0(a5)
230048c6:	0722                	slli	a4,a4,0x8
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:456
230048c8:	16fd                	addi	a3,a3,-1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:455
230048ca:	973e                	add	a4,a4,a5
230048cc:	c058                	sw	a4,4(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:456
230048ce:	c414                	sw	a3,8(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:451
230048d0:	f2ed                	bnez	a3,230048b2 <xz_dec_lzma2_run+0x3c8>
230048d2:	0084a803          	lw	a6,8(s1)
230048d6:	40dc                	lw	a5,4(s1)
xz_dec_lzma2_run():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1056
230048d8:	ffb50713          	addi	a4,a0,-5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1057
230048dc:	469d                	li	a3,7
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1056
230048de:	c438                	sw	a4,72(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1057
230048e0:	04d40023          	sb	a3,64(s0)
230048e4:	b195                	j	23004548 <xz_dec_lzma2_run+0x5e>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:980
230048e6:	451d                	li	a0,7
230048e8:	b529                	j	230046f2 <xz_dec_lzma2_run+0x208>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1088
230048ea:	48dc                	lw	a5,20(s1)
230048ec:	e17782e3          	beq	a5,s7,230046f0 <xz_dec_lzma2_run+0x206>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1089
230048f0:	40dc                	lw	a5,4(s1)
230048f2:	0084a803          	lw	a6,8(s1)
230048f6:	01078563          	beq	a5,a6,23004900 <xz_dec_lzma2_run+0x416>
230048fa:	04044703          	lbu	a4,64(s0)
230048fe:	b11d                	j	23004524 <xz_dec_lzma2_run+0x3a>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1090
23004900:	ee0a2683          	lw	a3,-288(s4)
23004904:	4438                	lw	a4,72(s0)
23004906:	dee6e5e3          	bltu	a3,a4,230046f0 <xz_dec_lzma2_run+0x206>
2300490a:	04044703          	lbu	a4,64(s0)
2300490e:	b919                	j	23004524 <xz_dec_lzma2_run+0x3a>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1036
23004910:	4098                	lw	a4,0(s1)
23004912:	00178613          	addi	a2,a5,1
23004916:	c0d0                	sw	a2,4(s1)
23004918:	97ba                	add	a5,a5,a4
2300491a:	4434                	lw	a3,72(s0)
2300491c:	0007c783          	lbu	a5,0(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1037
23004920:	04144703          	lbu	a4,65(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1036
23004924:	0685                	addi	a3,a3,1
23004926:	97b6                	add	a5,a5,a3
23004928:	c43c                	sw	a5,72(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1037
2300492a:	04e40023          	sb	a4,64(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1038
2300492e:	87b2                	mv	a5,a2
23004930:	bed5                	j	23004524 <xz_dec_lzma2_run+0x3a>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:970
23004932:	4098                	lw	a4,0(s1)
23004934:	00178613          	addi	a2,a5,1
23004938:	c0d0                	sw	a2,4(s1)
2300493a:	97ba                	add	a5,a5,a4
2300493c:	0007c683          	lbu	a3,0(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:972
23004940:	16068863          	beqz	a3,23004ab0 <xz_dec_lzma2_run+0x5c6>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:975
23004944:	0df00793          	li	a5,223
23004948:	08d7e663          	bltu	a5,a3,230049d4 <xz_dec_lzma2_run+0x4ea>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:975 (discriminator 1)
2300494c:	08b68463          	beq	a3,a1,230049d4 <xz_dec_lzma2_run+0x4ea>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:979
23004950:	04c44783          	lbu	a5,76(s0)
23004954:	fbc9                	bnez	a5,230048e6 <xz_dec_lzma2_run+0x3fc>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:983
23004956:	07f00793          	li	a5,127
2300495a:	0ad7f763          	bgeu	a5,a3,23004a08 <xz_dec_lzma2_run+0x51e>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:984
2300495e:	01069793          	slli	a5,a3,0x10
23004962:	001f0737          	lui	a4,0x1f0
23004966:	8ff9                	and	a5,a5,a4
23004968:	c07c                	sw	a5,68(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:985
2300496a:	4785                	li	a5,1
2300496c:	04f40023          	sb	a5,64(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:987
23004970:	0bf00793          	li	a5,191
23004974:	0cd7f563          	bgeu	a5,a3,23004a3e <xz_dec_lzma2_run+0x554>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:995
23004978:	4795                	li	a5,5
2300497a:	04f400a3          	sb	a5,65(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:993
2300497e:	040406a3          	sb	zero,77(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:994
23004982:	87b2                	mv	a5,a2
23004984:	4705                	li	a4,1
23004986:	be79                	j	23004524 <xz_dec_lzma2_run+0x3a>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1018
23004988:	4098                	lw	a4,0(s1)
2300498a:	00178693          	addi	a3,a5,1
2300498e:	c0d4                	sw	a3,4(s1)
23004990:	97ba                	add	a5,a5,a4
23004992:	0007c703          	lbu	a4,0(a5)
23004996:	407c                	lw	a5,68(s0)
23004998:	0722                	slli	a4,a4,0x8
2300499a:	97ba                	add	a5,a5,a4
2300499c:	c07c                	sw	a5,68(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1019
2300499e:	4789                	li	a5,2
230049a0:	04f40023          	sb	a5,64(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1020
230049a4:	4709                	li	a4,2
230049a6:	87b6                	mv	a5,a3
230049a8:	beb5                	j	23004524 <xz_dec_lzma2_run+0x3a>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1024
230049aa:	4098                	lw	a4,0(s1)
230049ac:	00178693          	addi	a3,a5,1
230049b0:	c0d4                	sw	a3,4(s1)
230049b2:	97ba                	add	a5,a5,a4
230049b4:	4078                	lw	a4,68(s0)
230049b6:	0007c783          	lbu	a5,0(a5)
230049ba:	0705                	addi	a4,a4,1
230049bc:	97ba                	add	a5,a5,a4
230049be:	c07c                	sw	a5,68(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1025
230049c0:	478d                	li	a5,3
230049c2:	04f40023          	sb	a5,64(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1026
230049c6:	470d                	li	a4,3
230049c8:	87b6                	mv	a5,a3
230049ca:	bea9                	j	23004524 <xz_dec_lzma2_run+0x3a>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1102
230049cc:	04040023          	sb	zero,64(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1103
230049d0:	4701                	li	a4,0
230049d2:	be89                	j	23004524 <xz_dec_lzma2_run+0x3a>
dict_reset():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:288
230049d4:	03c44783          	lbu	a5,60(s0)
xz_dec_lzma2_run():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:977
230049d8:	10000713          	li	a4,256
230049dc:	04e41623          	sh	a4,76(s0)
dict_reset():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:288
230049e0:	eb81                	bnez	a5,230049f0 <xz_dec_lzma2_run+0x506>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:289
230049e2:	488c                	lw	a1,16(s1)
230049e4:	44d8                	lw	a4,12(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:290
230049e6:	48dc                	lw	a5,20(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:289
230049e8:	972e                	add	a4,a4,a1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:290
230049ea:	8f8d                	sub	a5,a5,a1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:289
230049ec:	cc18                	sw	a4,24(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:290
230049ee:	d45c                	sw	a5,44(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:293
230049f0:	00042e23          	sw	zero,28(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:294
230049f4:	02042023          	sw	zero,32(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:295
230049f8:	02042423          	sw	zero,40(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:296
230049fc:	02042223          	sw	zero,36(s0)
xz_dec_lzma2_run():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:983
23004a00:	07f00793          	li	a5,127
23004a04:	f4d7ede3          	bltu	a5,a3,2300495e <xz_dec_lzma2_run+0x474>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1007
23004a08:	4789                	li	a5,2
23004a0a:	ecd7eee3          	bltu	a5,a3,230048e6 <xz_dec_lzma2_run+0x3fc>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1010
23004a0e:	05641023          	sh	s6,64(s0)
23004a12:	87b2                	mv	a5,a2
23004a14:	470d                	li	a4,3
23004a16:	b639                	j	23004524 <xz_dec_lzma2_run+0x3a>
lzma2_lzma():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:868
23004a18:	40dc                	lw	a5,4(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:867
23004a1a:	eeaa2023          	sw	a0,-288(s4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:868
23004a1e:	993e                	add	s2,s2,a5
23004a20:	0124a223          	sw	s2,4(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:869
23004a24:	be9d                	j	2300459a <xz_dec_lzma2_run+0xb0>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:862
23004a26:	03f00613          	li	a2,63
23004a2a:	8e09                	sub	a2,a2,a0
23004a2c:	4581                	li	a1,0
23004a2e:	9556                	add	a0,a0,s5
23004a30:	972fe0ef          	jal	ra,23002ba2 <memset>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:865
23004a34:	ee0a2783          	lw	a5,-288(s4)
23004a38:	97ca                	add	a5,a5,s2
23004a3a:	c85c                	sw	a5,20(s0)
23004a3c:	b311                	j	23004740 <xz_dec_lzma2_run+0x256>
xz_dec_lzma2_run():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:997
23004a3e:	04d44783          	lbu	a5,77(s0)
23004a42:	ea0792e3          	bnez	a5,230048e6 <xz_dec_lzma2_run+0x3fc>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1002
23004a46:	4799                	li	a5,6
23004a48:	04f400a3          	sb	a5,65(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1003
23004a4c:	09f00593          	li	a1,159
23004a50:	87b2                	mv	a5,a2
23004a52:	4705                	li	a4,1
23004a54:	acd5f8e3          	bgeu	a1,a3,23004524 <xz_dec_lzma2_run+0x3a>
lzma_reset():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:772
23004a58:	06040023          	sb	zero,96(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:773
23004a5c:	04042823          	sw	zero,80(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:774
23004a60:	04042a23          	sw	zero,84(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:775
23004a64:	04042c23          	sw	zero,88(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:776
23004a68:	04042e23          	sw	zero,92(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:788
23004a6c:	07440713          	addi	a4,s0,116
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:789
23004a70:	40000793          	li	a5,1024
23004a74:	00f71023          	sh	a5,0(a4) # 1f0000 <StackSize+0x1efc00>
23004a78:	0709                	addi	a4,a4,2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:788
23004a7a:	fee99de3          	bne	s3,a4,23004a74 <xz_dec_lzma2_run+0x58a>
rc_reset():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:440
23004a7e:	57fd                	li	a5,-1
23004a80:	c01c                	sw	a5,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:442
23004a82:	4795                	li	a5,5
23004a84:	c41c                	sw	a5,8(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:441
23004a86:	00042223          	sw	zero,4(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:442
23004a8a:	87b2                	mv	a5,a2
23004a8c:	4705                	li	a4,1
23004a8e:	bc59                	j	23004524 <xz_dec_lzma2_run+0x3a>
lzma2_lzma():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:883
23004a90:	40d78633          	sub	a2,a5,a3
23004a94:	eeca2023          	sw	a2,-288(s4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:884
23004a98:	00da85b3          	add	a1,s5,a3
23004a9c:	8556                	mv	a0,s5
23004a9e:	f64fb0ef          	jal	ra,23000202 <memmove>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:886
23004aa2:	bce5                	j	2300459a <xz_dec_lzma2_run+0xb0>
lzma_props():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:813
23004aa4:	4781                	li	a5,0
23004aa6:	b35d                	j	2300484c <xz_dec_lzma2_run+0x362>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:805
23004aa8:	4781                	li	a5,0
23004aaa:	bb8d                	j	2300481c <xz_dec_lzma2_run+0x332>
23004aac:	408c                	lw	a1,0(s1)
23004aae:	b52d                	j	230048d8 <xz_dec_lzma2_run+0x3ee>
xz_dec_lzma2_run():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:973
23004ab0:	4505                	li	a0,1
23004ab2:	b181                	j	230046f2 <xz_dec_lzma2_run+0x208>

23004ab4 <xz_dec_lzma2_create>:
xz_dec_lzma2_create():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1114
23004ab4:	1141                	addi	sp,sp,-16
23004ab6:	c226                	sw	s1,4(sp)
23004ab8:	84aa                	mv	s1,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1115
23004aba:	651d                	lui	a0,0x7
23004abc:	f2450513          	addi	a0,a0,-220 # 6f24 <StackSize+0x6b24>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1114
23004ac0:	c422                	sw	s0,8(sp)
23004ac2:	c04a                	sw	s2,0(sp)
23004ac4:	c606                	sw	ra,12(sp)
23004ac6:	892e                	mv	s2,a1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1115
23004ac8:	283000ef          	jal	ra,2300554a <simple_malloc>
23004acc:	842a                	mv	s0,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1116
23004ace:	c919                	beqz	a0,23004ae4 <xz_dec_lzma2_create+0x30>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1119
23004ad0:	02950e23          	sb	s1,60(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1120
23004ad4:	03252a23          	sw	s2,52(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1122
23004ad8:	4785                	li	a5,1
23004ada:	02f48763          	beq	s1,a5,23004b08 <xz_dec_lzma2_create+0x54>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1128
23004ade:	4789                	li	a5,2
23004ae0:	00f48963          	beq	s1,a5,23004af2 <xz_dec_lzma2_create+0x3e>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1134
23004ae4:	8522                	mv	a0,s0
23004ae6:	40b2                	lw	ra,12(sp)
23004ae8:	4422                	lw	s0,8(sp)
23004aea:	4492                	lw	s1,4(sp)
23004aec:	4902                	lw	s2,0(sp)
23004aee:	0141                	addi	sp,sp,16
23004af0:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1129
23004af2:	00052c23          	sw	zero,24(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1130
23004af6:	02052c23          	sw	zero,56(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1134
23004afa:	40b2                	lw	ra,12(sp)
23004afc:	8522                	mv	a0,s0
23004afe:	4422                	lw	s0,8(sp)
23004b00:	4492                	lw	s1,4(sp)
23004b02:	4902                	lw	s2,0(sp)
23004b04:	0141                	addi	sp,sp,16
23004b06:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1123
23004b08:	854a                	mv	a0,s2
23004b0a:	241000ef          	jal	ra,2300554a <simple_malloc>
23004b0e:	cc08                	sw	a0,24(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1124
23004b10:	f971                	bnez	a0,23004ae4 <xz_dec_lzma2_create+0x30>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1125
23004b12:	8522                	mv	a0,s0
23004b14:	279000ef          	jal	ra,2300558c <simple_free>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1126
23004b18:	4401                	li	s0,0
23004b1a:	b7e9                	j	23004ae4 <xz_dec_lzma2_create+0x30>

23004b1c <xz_dec_lzma2_reset>:
xz_dec_lzma2_reset():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1139
23004b1c:	02700793          	li	a5,39
23004b20:	04b7e963          	bltu	a5,a1,23004b72 <xz_dec_lzma2_reset+0x56>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1142
23004b24:	0015f793          	andi	a5,a1,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1143
23004b28:	8185                	srli	a1,a1,0x1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1137
23004b2a:	1141                	addi	sp,sp,-16
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1142
23004b2c:	0789                	addi	a5,a5,2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1143
23004b2e:	05ad                	addi	a1,a1,11
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1145
23004b30:	03c54703          	lbu	a4,60(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1137
23004b34:	c422                	sw	s0,8(sp)
23004b36:	c606                	sw	ra,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1143
23004b38:	00b795b3          	sll	a1,a5,a1
23004b3c:	d90c                	sw	a1,48(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1145
23004b3e:	842a                	mv	s0,a0
23004b40:	cb09                	beqz	a4,23004b52 <xz_dec_lzma2_reset+0x36>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1146
23004b42:	595c                	lw	a5,52(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1147
23004b44:	4511                	li	a0,4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1146
23004b46:	02b7e263          	bltu	a5,a1,23004b6a <xz_dec_lzma2_reset+0x4e>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1149
23004b4a:	d44c                	sw	a1,44(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1151
23004b4c:	4789                	li	a5,2
23004b4e:	02f70463          	beq	a4,a5,23004b76 <xz_dec_lzma2_reset+0x5a>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1168
23004b52:	651d                	lui	a0,0x7
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1166
23004b54:	4785                	li	a5,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1163
23004b56:	06042223          	sw	zero,100(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1165
23004b5a:	04040023          	sb	zero,64(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1166
23004b5e:	04f40623          	sb	a5,76(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1168
23004b62:	942a                	add	s0,s0,a0
23004b64:	ee042023          	sw	zero,-288(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1170
23004b68:	4501                	li	a0,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1171
23004b6a:	40b2                	lw	ra,12(sp)
23004b6c:	4422                	lw	s0,8(sp)
23004b6e:	0141                	addi	sp,sp,16
23004b70:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1140
23004b72:	4519                	li	a0,6
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1171
23004b74:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1152
23004b76:	5c1c                	lw	a5,56(s0)
23004b78:	fcb7fde3          	bgeu	a5,a1,23004b52 <xz_dec_lzma2_reset+0x36>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1153
23004b7c:	4c08                	lw	a0,24(s0)
23004b7e:	20f000ef          	jal	ra,2300558c <simple_free>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1154
23004b82:	5808                	lw	a0,48(s0)
23004b84:	1c7000ef          	jal	ra,2300554a <simple_malloc>
23004b88:	cc08                	sw	a0,24(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1155
23004b8a:	f561                	bnez	a0,23004b52 <xz_dec_lzma2_reset+0x36>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1156
23004b8c:	02042c23          	sw	zero,56(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1157
23004b90:	450d                	li	a0,3
23004b92:	bfe1                	j	23004b6a <xz_dec_lzma2_reset+0x4e>

23004b94 <xz_dec_lzma2_end>:
xz_dec_lzma2_end():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1175
23004b94:	03c54783          	lbu	a5,60(a0) # 703c <StackSize+0x6c3c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1174
23004b98:	1141                	addi	sp,sp,-16
23004b9a:	c422                	sw	s0,8(sp)
23004b9c:	c606                	sw	ra,12(sp)
23004b9e:	842a                	mv	s0,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1175
23004ba0:	e799                	bnez	a5,23004bae <xz_dec_lzma2_end+0x1a>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1178
23004ba2:	8522                	mv	a0,s0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1179
23004ba4:	4422                	lw	s0,8(sp)
23004ba6:	40b2                	lw	ra,12(sp)
23004ba8:	0141                	addi	sp,sp,16
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1178
23004baa:	1e30006f          	j	2300558c <simple_free>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1176
23004bae:	4d08                	lw	a0,24(a0)
23004bb0:	1dd000ef          	jal	ra,2300558c <simple_free>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1178
23004bb4:	8522                	mv	a0,s0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1179
23004bb6:	4422                	lw	s0,8(sp)
23004bb8:	40b2                	lw	ra,12(sp)
23004bba:	0141                	addi	sp,sp,16
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_lzma2.c:1178
23004bbc:	1d10006f          	j	2300558c <simple_free>

23004bc0 <fill_temp>:
fill_temp():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:169
23004bc0:	1141                	addi	sp,sp,-16
23004bc2:	c422                	sw	s0,8(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:170
23004bc4:	09852703          	lw	a4,152(a0)
23004bc8:	41d4                	lw	a3,4(a1)
23004bca:	09c52403          	lw	s0,156(a0)
23004bce:	459c                	lw	a5,8(a1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:169
23004bd0:	c226                	sw	s1,4(sp)
23004bd2:	c04a                	sw	s2,0(sp)
23004bd4:	c606                	sw	ra,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:170
23004bd6:	8c19                	sub	s0,s0,a4
23004bd8:	8f95                	sub	a5,a5,a3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:169
23004bda:	84aa                	mv	s1,a0
23004bdc:	892e                	mv	s2,a1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:170
23004bde:	0087f363          	bgeu	a5,s0,23004be4 <fill_temp+0x24>
23004be2:	843e                	mv	s0,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:173
23004be4:	00092583          	lw	a1,0(s2) # f000 <StackSize+0xec00>
23004be8:	0a048513          	addi	a0,s1,160
23004bec:	8622                	mv	a2,s0
23004bee:	95b6                	add	a1,a1,a3
23004bf0:	953a                	add	a0,a0,a4
23004bf2:	f99fd0ef          	jal	ra,23002b8a <memcpy>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:174
23004bf6:	00492783          	lw	a5,4(s2)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:175
23004bfa:	0984a683          	lw	a3,152(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:177
23004bfe:	09c4a703          	lw	a4,156(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:174
23004c02:	97a2                	add	a5,a5,s0
23004c04:	00f92223          	sw	a5,4(s2)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:175
23004c08:	9436                	add	s0,s0,a3
23004c0a:	0884ac23          	sw	s0,152(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:182
23004c0e:	4501                	li	a0,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:177
23004c10:	00e40863          	beq	s0,a4,23004c20 <fill_temp+0x60>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:183
23004c14:	40b2                	lw	ra,12(sp)
23004c16:	4422                	lw	s0,8(sp)
23004c18:	4492                	lw	s1,4(sp)
23004c1a:	4902                	lw	s2,0(sp)
23004c1c:	0141                	addi	sp,sp,16
23004c1e:	8082                	ret
23004c20:	40b2                	lw	ra,12(sp)
23004c22:	4422                	lw	s0,8(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:178
23004c24:	0804ac23          	sw	zero,152(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:183
23004c28:	4902                	lw	s2,0(sp)
23004c2a:	4492                	lw	s1,4(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:179
23004c2c:	4505                	li	a0,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:183
23004c2e:	0141                	addi	sp,sp,16
23004c30:	8082                	ret

23004c32 <dec_vli.isra.0>:
dec_vli():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:191
23004c32:	411c                	lw	a5,0(a0)
23004c34:	e791                	bnez	a5,23004c40 <dec_vli.isra.0+0xe>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:192
23004c36:	4781                	li	a5,0
23004c38:	4801                	li	a6,0
23004c3a:	c19c                	sw	a5,0(a1)
23004c3c:	0105a223          	sw	a6,4(a1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:198
23004c40:	4ffd                	li	t6,31
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:210
23004c42:	03f00293          	li	t0,63
23004c46:	a80d                	j	23004c78 <dec_vli.isra.0+0x46>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:198
23004c48:	00f897b3          	sll	a5,a7,a5
23004c4c:	0045a883          	lw	a7,4(a1)
23004c50:	0005a303          	lw	t1,0(a1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:209
23004c54:	00780e93          	addi	t4,a6,7
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:198
23004c58:	00f8e7b3          	or	a5,a7,a5
23004c5c:	01e36333          	or	t1,t1,t5
23004c60:	c1dc                	sw	a5,4(a1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:200
23004c62:	018e1793          	slli	a5,t3,0x18
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:198
23004c66:	0065a023          	sw	t1,0(a1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:200
23004c6a:	87e1                	srai	a5,a5,0x18
23004c6c:	0407d363          	bgez	a5,23004cb2 <dec_vli.isra.0+0x80>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:209
23004c70:	01d52023          	sw	t4,0(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:210
23004c74:	045e8363          	beq	t4,t0,23004cba <dec_vli.isra.0+0x88>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:194
23004c78:	429c                	lw	a5,0(a3)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:198
23004c7a:	4f01                	li	t5,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:195
23004c7c:	00f608b3          	add	a7,a2,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:196
23004c80:	00178813          	addi	a6,a5,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:194
23004c84:	02e7fd63          	bgeu	a5,a4,23004cbe <dec_vli.isra.0+0x8c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:195
23004c88:	0008ce03          	lbu	t3,0(a7)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:196
23004c8c:	0106a023          	sw	a6,0(a3)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:198
23004c90:	00052803          	lw	a6,0(a0)
23004c94:	07fe7893          	andi	a7,t3,127
23004c98:	0018de93          	srli	t4,a7,0x1
23004c9c:	fe080793          	addi	a5,a6,-32
23004ca0:	410f8333          	sub	t1,t6,a6
23004ca4:	fa07d2e3          	bgez	a5,23004c48 <dec_vli.isra.0+0x16>
23004ca8:	006ed7b3          	srl	a5,t4,t1
23004cac:	01089f33          	sll	t5,a7,a6
23004cb0:	bf71                	j	23004c4c <dec_vli.isra.0+0x1a>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:202
23004cb2:	000e1863          	bnez	t3,23004cc2 <dec_vli.isra.0+0x90>
23004cb6:	00080663          	beqz	a6,23004cc2 <dec_vli.isra.0+0x90>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:203
23004cba:	451d                	li	a0,7
23004cbc:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:214
23004cbe:	4501                	li	a0,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:215
23004cc0:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:205
23004cc2:	00052023          	sw	zero,0(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:206
23004cc6:	4505                	li	a0,1
23004cc8:	8082                	ret

23004cca <index_update.isra.2>:
index_update():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:299
23004cca:	1141                	addi	sp,sp,-16
23004ccc:	c422                	sw	s0,8(sp)
23004cce:	842a                	mv	s0,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:301
23004cd0:	4908                	lw	a0,16(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:302
23004cd2:	583c                	lw	a5,112(s0)
23004cd4:	07442803          	lw	a6,116(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:301
23004cd8:	40a60733          	sub	a4,a2,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:302
23004cdc:	00e786b3          	add	a3,a5,a4
23004ce0:	00f6b7b3          	sltu	a5,a3,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:303
23004ce4:	4c10                	lw	a2,24(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:299
23004ce6:	c606                	sw	ra,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:302
23004ce8:	97c2                	add	a5,a5,a6
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:303
23004cea:	952e                	add	a0,a0,a1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:302
23004cec:	d834                	sw	a3,112(s0)
23004cee:	d87c                	sw	a5,116(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:303
23004cf0:	85ba                	mv	a1,a4
23004cf2:	e91fe0ef          	jal	ra,23003b82 <xz_crc32>
23004cf6:	cc08                	sw	a0,24(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:304
23004cf8:	40b2                	lw	ra,12(sp)
23004cfa:	4422                	lw	s0,8(sp)
23004cfc:	0141                	addi	sp,sp,16
23004cfe:	8082                	ret

23004d00 <xz_dec_reset>:
xz_dec_reset():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:855
23004d00:	1141                	addi	sp,sp,-16
23004d02:	c606                	sw	ra,12(sp)
23004d04:	c422                	sw	s0,8(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:860
23004d06:	03000613          	li	a2,48
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:855
23004d0a:	842a                	mv	s0,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:860
23004d0c:	4581                	li	a1,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:856
23004d0e:	00050023          	sb	zero,0(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:857
23004d12:	00050f23          	sb	zero,30(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:858
23004d16:	00052223          	sw	zero,4(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:859
23004d1a:	00052c23          	sw	zero,24(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:860
23004d1e:	03850513          	addi	a0,a0,56
23004d22:	e81fd0ef          	jal	ra,23002ba2 <memset>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:861
23004d26:	06840513          	addi	a0,s0,104
23004d2a:	03000613          	li	a2,48
23004d2e:	4581                	li	a1,0
23004d30:	e73fd0ef          	jal	ra,23002ba2 <memset>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:863
23004d34:	47b1                	li	a5,12
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:862
23004d36:	08042c23          	sw	zero,152(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:863
23004d3a:	08f42e23          	sw	a5,156(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:864
23004d3e:	40b2                	lw	ra,12(sp)
23004d40:	4422                	lw	s0,8(sp)
23004d42:	0141                	addi	sp,sp,16
23004d44:	8082                	ret

23004d46 <xz_dec_run>:
xz_dec_run():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:794
23004d46:	01d54783          	lbu	a5,29(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:789
23004d4a:	7139                	addi	sp,sp,-64
23004d4c:	dc22                	sw	s0,56(sp)
23004d4e:	da26                	sw	s1,52(sp)
23004d50:	de06                	sw	ra,60(sp)
23004d52:	d84a                	sw	s2,48(sp)
23004d54:	d64e                	sw	s3,44(sp)
23004d56:	d452                	sw	s4,40(sp)
23004d58:	d256                	sw	s5,36(sp)
23004d5a:	d05a                	sw	s6,32(sp)
23004d5c:	ce5e                	sw	s7,28(sp)
23004d5e:	cc62                	sw	s8,24(sp)
23004d60:	ca66                	sw	s9,20(sp)
23004d62:	c86a                	sw	s10,16(sp)
23004d64:	c66e                	sw	s11,12(sp)
23004d66:	842a                	mv	s0,a0
23004d68:	84ae                	mv	s1,a1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:794
23004d6a:	3e078563          	beqz	a5,23005154 <xz_dec_run+0x40e>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:797
23004d6e:	0044a903          	lw	s2,4(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:798
23004d72:	00044783          	lbu	a5,0(s0)
23004d76:	0104a983          	lw	s3,16(s1)
dec_main():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:580
23004d7a:	4a1d                	li	s4,7
23004d7c:	01242823          	sw	s2,16(s0)
23004d80:	4b21                	li	s6,8
23004d82:	4aa5                	li	s5,9
dec_block():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:289
23004d84:	05040b93          	addi	s7,s0,80
dec_stream_header():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:411
23004d88:	23008c37          	lui	s8,0x23008
23004d8c:	01879593          	slli	a1,a5,0x18
23004d90:	4711                	li	a4,4
23004d92:	4815                	li	a6,5
23004d94:	4519                	li	a0,6
23004d96:	4c85                	li	s9,1
23004d98:	85e1                	srai	a1,a1,0x18
23004d9a:	4609                	li	a2,2
23004d9c:	468d                	li	a3,3
dec_main():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:583
23004d9e:	26e78e63          	beq	a5,a4,2300501a <xz_dec_run+0x2d4>
23004da2:	16f77163          	bgeu	a4,a5,23004f04 <xz_dec_run+0x1be>
23004da6:	09478e63          	beq	a5,s4,23004e42 <xz_dec_run+0xfc>
23004daa:	12fa6963          	bltu	s4,a5,23004edc <xz_dec_run+0x196>
23004dae:	2d078163          	beq	a5,a6,23005070 <xz_dec_run+0x32a>
23004db2:	fea796e3          	bne	a5,a0,23004d9e <xz_dec_run+0x58>
23004db6:	00440b93          	addi	s7,s0,4
23004dba:	00840b13          	addi	s6,s0,8
23004dbe:	00448a93          	addi	s5,s1,4
dec_index():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:320
23004dc2:	4d85                	li	s11,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:342
23004dc4:	4c89                	li	s9,2
23004dc6:	4a09                	li	s4,2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:348
23004dc8:	08040c13          	addi	s8,s0,128
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:319
23004dcc:	4498                	lw	a4,8(s1)
23004dce:	4090                	lw	a2,0(s1)
23004dd0:	86d6                	mv	a3,s5
23004dd2:	85da                	mv	a1,s6
23004dd4:	855e                	mv	a0,s7
23004dd6:	e5dff0ef          	jal	ra,23004c32 <dec_vli.isra.0>
23004dda:	8d2a                	mv	s10,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:320
23004ddc:	51b51a63          	bne	a0,s11,230052f0 <xz_dec_run+0x5aa>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:325
23004de0:	06844783          	lbu	a5,104(s0)
23004de4:	2bb78063          	beq	a5,s11,23005084 <xz_dec_run+0x33e>
23004de8:	34078b63          	beqz	a5,2300513e <xz_dec_run+0x3f8>
23004dec:	2b479d63          	bne	a5,s4,230050a6 <xz_dec_run+0x360>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:346
23004df0:	08842783          	lw	a5,136(s0)
23004df4:	4418                	lw	a4,8(s0)
23004df6:	08c42683          	lw	a3,140(s0)
23004dfa:	4450                	lw	a2,12(s0)
23004dfc:	973e                	add	a4,a4,a5
23004dfe:	00f737b3          	sltu	a5,a4,a5
23004e02:	96b2                	add	a3,a3,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:347
23004e04:	09042603          	lw	a2,144(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:346
23004e08:	97b6                	add	a5,a5,a3
23004e0a:	08e42423          	sw	a4,136(s0)
23004e0e:	08f42623          	sw	a5,140(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:347
23004e12:	45e1                	li	a1,24
23004e14:	8562                	mv	a0,s8
23004e16:	d6dfe0ef          	jal	ra,23003b82 <xz_crc32>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:351
23004e1a:	5c38                	lw	a4,120(s0)
23004e1c:	5c74                	lw	a3,124(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:347
23004e1e:	08a42823          	sw	a0,144(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:351
23004e22:	41b707b3          	sub	a5,a4,s11
23004e26:	00e7b733          	sltu	a4,a5,a4
23004e2a:	41b686b3          	sub	a3,a3,s11
23004e2e:	9736                	add	a4,a4,a3
23004e30:	dc3c                	sw	a5,120(s0)
23004e32:	dc78                	sw	a4,124(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:352
23004e34:	07b40423          	sb	s11,104(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:357
23004e38:	8fd9                	or	a5,a5,a4
23004e3a:	fbc9                	bnez	a5,23004dcc <xz_dec_run+0x86>
dec_main():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:709
23004e3c:	479d                	li	a5,7
23004e3e:	00f40023          	sb	a5,0(s0)
23004e42:	408c                	lw	a1,0(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:715
23004e44:	4814                	lw	a3,16(s0)
23004e46:	40d0                	lw	a2,4(s1)
23004e48:	5828                	lw	a0,112(s0)
23004e4a:	96ae                	add	a3,a3,a1
23004e4c:	00c58733          	add	a4,a1,a2
23004e50:	a811                	j	23004e64 <xz_dec_run+0x11e>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:717
23004e52:	449c                	lw	a5,8(s1)
23004e54:	48c78563          	beq	a5,a2,230052de <xz_dec_run+0x598>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:722
23004e58:	0605                	addi	a2,a2,1
23004e5a:	c0d0                	sw	a2,4(s1)
23004e5c:	fff74783          	lbu	a5,-1(a4)
23004e60:	46079763          	bnez	a5,230052ce <xz_dec_run+0x588>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:715
23004e64:	40d707b3          	sub	a5,a4,a3
23004e68:	97aa                	add	a5,a5,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:716
23004e6a:	8b8d                	andi	a5,a5,3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:715
23004e6c:	0705                	addi	a4,a4,1
23004e6e:	f3f5                	bnez	a5,23004e52 <xz_dec_run+0x10c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:727
23004e70:	8522                	mv	a0,s0
23004e72:	e59ff0ef          	jal	ra,23004cca <index_update.isra.2>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:730
23004e76:	4661                	li	a2,24
23004e78:	08040593          	addi	a1,s0,128
23004e7c:	05040513          	addi	a0,s0,80
23004e80:	d3bfd0ef          	jal	ra,23002bba <memcmp>
23004e84:	40051e63          	bnez	a0,230052a0 <xz_dec_run+0x55a>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:734
23004e88:	47a1                	li	a5,8
23004e8a:	00f40023          	sb	a5,0(s0)
crc_validate():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:379
23004e8e:	457d                	li	a0,31
23004e90:	a01d                	j	23004eb6 <xz_dec_run+0x170>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:374
23004e92:	4090                	lw	a2,0(s1)
23004e94:	4058                	lw	a4,4(s0)
23004e96:	4c14                	lw	a3,24(s0)
23004e98:	97b2                	add	a5,a5,a2
23004e9a:	c0cc                	sw	a1,4(s1)
23004e9c:	0007c603          	lbu	a2,0(a5)
23004ea0:	00e6d6b3          	srl	a3,a3,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:377
23004ea4:	00870793          	addi	a5,a4,8
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:374
23004ea8:	0ff6f713          	andi	a4,a3,255
23004eac:	3ec71a63          	bne	a4,a2,230052a0 <xz_dec_run+0x55a>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:377
23004eb0:	c05c                	sw	a5,4(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:379
23004eb2:	40f56363          	bltu	a0,a5,230052b8 <xz_dec_run+0x572>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:371
23004eb6:	40dc                	lw	a5,4(s1)
23004eb8:	4498                	lw	a4,8(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:374
23004eba:	00178593          	addi	a1,a5,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:371
23004ebe:	fce79ae3          	bne	a5,a4,23004e92 <xz_dec_run+0x14c>
xz_dec_run():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:801
23004ec2:	01d44703          	lbu	a4,29(s0)
23004ec6:	cf0d                	beqz	a4,23004f00 <xz_dec_run+0x1ba>
23004ec8:	873e                	mv	a4,a5
23004eca:	4d01                	li	s10,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:811 (discriminator 1)
23004ecc:	00e91563          	bne	s2,a4,23004ed6 <xz_dec_run+0x190>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:812
23004ed0:	489c                	lw	a5,16(s1)
23004ed2:	49378d63          	beq	a5,s3,2300536c <xz_dec_run+0x626>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:818
23004ed6:	00040f23          	sb	zero,30(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:821
23004eda:	a491                	j	2300511e <xz_dec_run+0x3d8>
23004edc:	fb6789e3          	beq	a5,s6,23004e8e <xz_dec_run+0x148>
23004ee0:	eb579fe3          	bne	a5,s5,23004d9e <xz_dec_run+0x58>
dec_main():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:751
23004ee4:	85a6                	mv	a1,s1
23004ee6:	8522                	mv	a0,s0
23004ee8:	cd9ff0ef          	jal	ra,23004bc0 <fill_temp>
23004eec:	3a051463          	bnez	a0,23005294 <xz_dec_run+0x54e>
xz_dec_run():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:801
23004ef0:	01d44783          	lbu	a5,29(s0)
23004ef4:	40d8                	lw	a4,4(s1)
23004ef6:	fbf1                	bnez	a5,23004eca <xz_dec_run+0x184>
23004ef8:	4494                	lw	a3,8(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:804
23004efa:	4d21                	li	s10,8
23004efc:	20e69d63          	bne	a3,a4,23005116 <xz_dec_run+0x3d0>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:801
23004f00:	4d1d                	li	s10,7
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:806
23004f02:	ac11                	j	23005116 <xz_dec_run+0x3d0>
23004f04:	2b978b63          	beq	a5,s9,230051ba <xz_dec_run+0x474>
23004f08:	24058963          	beqz	a1,2300515a <xz_dec_run+0x414>
23004f0c:	1ac78a63          	beq	a5,a2,230050c0 <xz_dec_run+0x37a>
23004f10:	e8d797e3          	bne	a5,a3,23004d9e <xz_dec_run+0x58>
dec_block():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:233
23004f14:	40d8                	lw	a4,4(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:234
23004f16:	489c                	lw	a5,16(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:241
23004f18:	4a042503          	lw	a0,1184(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:233
23004f1c:	c818                	sw	a4,16(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:234
23004f1e:	c85c                	sw	a5,20(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:241
23004f20:	85a6                	mv	a1,s1
23004f22:	dc8ff0ef          	jal	ra,230044ea <xz_dec_lzma2_run>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:243
23004f26:	40dc                	lw	a5,4(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:244
23004f28:	488c                	lw	a1,16(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:243
23004f2a:	4818                	lw	a4,16(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:241
23004f2c:	8d2a                	mv	s10,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:244
23004f2e:	4848                	lw	a0,20(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:243
23004f30:	5c14                	lw	a3,56(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:244
23004f32:	4030                	lw	a2,64(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:243
23004f34:	8f99                	sub	a5,a5,a4
23004f36:	03c42303          	lw	t1,60(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:244
23004f3a:	8d89                	sub	a1,a1,a0
23004f3c:	04442883          	lw	a7,68(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:243
23004f40:	96be                	add	a3,a3,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:244
23004f42:	962e                	add	a2,a2,a1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:243
23004f44:	00f6b7b3          	sltu	a5,a3,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:244
23004f48:	00b63733          	sltu	a4,a2,a1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:250
23004f4c:	02442803          	lw	a6,36(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:243
23004f50:	979a                	add	a5,a5,t1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:244
23004f52:	9746                	add	a4,a4,a7
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:243
23004f54:	dc14                	sw	a3,56(s0)
23004f56:	dc5c                	sw	a5,60(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:244
23004f58:	c030                	sw	a2,64(s0)
23004f5a:	c078                	sw	a4,68(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:250
23004f5c:	1af86863          	bltu	a6,a5,2300510c <xz_dec_run+0x3c6>
23004f60:	3af80b63          	beq	a6,a5,23005316 <xz_dec_run+0x5d0>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:251
23004f64:	545c                	lw	a5,44(s0)
23004f66:	1ae7e363          	bltu	a5,a4,2300510c <xz_dec_run+0x3c6>
23004f6a:	34e78363          	beq	a5,a4,230052b0 <xz_dec_run+0x56a>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:255
23004f6e:	01c44703          	lbu	a4,28(s0)
23004f72:	4785                	li	a5,1
23004f74:	3ef70563          	beq	a4,a5,2300535e <xz_dec_run+0x618>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:264
23004f78:	4785                	li	a5,1
23004f7a:	38fd1063          	bne	s10,a5,230052fa <xz_dec_run+0x5b4>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:265
23004f7e:	501c                	lw	a5,32(s0)
23004f80:	577d                	li	a4,-1
23004f82:	5054                	lw	a3,36(s0)
23004f84:	50e78963          	beq	a5,a4,23005496 <xz_dec_run+0x750>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:266
23004f88:	5c18                	lw	a4,56(s0)
23004f8a:	18f71163          	bne	a4,a5,2300510c <xz_dec_run+0x3c6>
23004f8e:	5c5c                	lw	a5,60(s0)
23004f90:	16d79e63          	bne	a5,a3,2300510c <xz_dec_run+0x3c6>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:270
23004f94:	541c                	lw	a5,40(s0)
23004f96:	56fd                	li	a3,-1
23004f98:	5450                	lw	a2,44(s0)
23004f9a:	4038                	lw	a4,64(s0)
23004f9c:	406c                	lw	a1,68(s0)
23004f9e:	3ed78063          	beq	a5,a3,2300537e <xz_dec_run+0x638>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:271
23004fa2:	16e79563          	bne	a5,a4,2300510c <xz_dec_run+0x3c6>
23004fa6:	16b61363          	bne	a2,a1,2300510c <xz_dec_run+0x3c6>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:275
23004faa:	4834                	lw	a3,80(s0)
23004fac:	5c10                	lw	a2,56(s0)
23004fae:	4868                	lw	a0,84(s0)
23004fb0:	03c42803          	lw	a6,60(s0)
23004fb4:	581c                	lw	a5,48(s0)
23004fb6:	9636                	add	a2,a2,a3
23004fb8:	00d636b3          	sltu	a3,a2,a3
23004fbc:	97b2                	add	a5,a5,a2
23004fbe:	9542                	add	a0,a0,a6
23004fc0:	96aa                	add	a3,a3,a0
23004fc2:	00c7b633          	sltu	a2,a5,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:281
23004fc6:	01c44503          	lbu	a0,28(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:275
23004fca:	9636                	add	a2,a2,a3
23004fcc:	c83c                	sw	a5,80(s0)
23004fce:	c870                	sw	a2,84(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:281
23004fd0:	4685                	li	a3,1
23004fd2:	00d51963          	bne	a0,a3,23004fe4 <xz_dec_run+0x29e>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:282
23004fd6:	00478693          	addi	a3,a5,4
23004fda:	00f6b7b3          	sltu	a5,a3,a5
23004fde:	963e                	add	a2,a2,a5
23004fe0:	c834                	sw	a3,80(s0)
23004fe2:	c870                	sw	a2,84(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:287
23004fe4:	4c3c                	lw	a5,88(s0)
23004fe6:	4c74                	lw	a3,92(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:288
23004fe8:	5030                	lw	a2,96(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:287
23004fea:	973e                	add	a4,a4,a5
23004fec:	96ae                	add	a3,a3,a1
23004fee:	00f737b3          	sltu	a5,a4,a5
23004ff2:	97b6                	add	a5,a5,a3
23004ff4:	cc38                	sw	a4,88(s0)
23004ff6:	cc7c                	sw	a5,92(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:288
23004ff8:	45e1                	li	a1,24
23004ffa:	855e                	mv	a0,s7
23004ffc:	b87fe0ef          	jal	ra,23003b82 <xz_crc32>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:292
23005000:	443c                	lw	a5,72(s0)
23005002:	4474                	lw	a3,76(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:288
23005004:	d028                	sw	a0,96(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:292
23005006:	00178713          	addi	a4,a5,1
2300500a:	00f737b3          	sltu	a5,a4,a5
2300500e:	97b6                	add	a5,a5,a3
23005010:	c47c                	sw	a5,76(s0)
dec_main():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:656
23005012:	4791                	li	a5,4
dec_block():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:292
23005014:	c438                	sw	a4,72(s0)
dec_main():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:656
23005016:	00f40023          	sb	a5,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:669
2300501a:	5c1c                	lw	a5,56(s0)
2300501c:	5c50                	lw	a2,60(s0)
2300501e:	0037f713          	andi	a4,a5,3
23005022:	c721                	beqz	a4,2300506a <xz_dec_run+0x324>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:670
23005024:	40d4                	lw	a3,4(s1)
23005026:	4498                	lw	a4,8(s1)
23005028:	34d70e63          	beq	a4,a3,23005384 <xz_dec_run+0x63e>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:673
2300502c:	0004a803          	lw	a6,0(s1)
23005030:	00168593          	addi	a1,a3,1
23005034:	c0cc                	sw	a1,4(s1)
23005036:	96c2                	add	a3,a3,a6
23005038:	0006c683          	lbu	a3,0(a3)
2300503c:	ce89                	beqz	a3,23005056 <xz_dec_run+0x310>
2300503e:	a0f9                	j	2300510c <xz_dec_run+0x3c6>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:670
23005040:	40d4                	lw	a3,4(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:673
23005042:	00168513          	addi	a0,a3,1
23005046:	00d805b3          	add	a1,a6,a3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:670
2300504a:	32e68d63          	beq	a3,a4,23005384 <xz_dec_run+0x63e>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:673
2300504e:	c0c8                	sw	a0,4(s1)
23005050:	0005c683          	lbu	a3,0(a1)
23005054:	eec5                	bnez	a3,2300510c <xz_dec_run+0x3c6>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:676
23005056:	00178693          	addi	a3,a5,1
2300505a:	00f6b7b3          	sltu	a5,a3,a5
2300505e:	963e                	add	a2,a2,a5
23005060:	dc14                	sw	a3,56(s0)
23005062:	87b6                	mv	a5,a3
23005064:	dc50                	sw	a2,60(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:669
23005066:	8a8d                	andi	a3,a3,3
23005068:	fee1                	bnez	a3,23005040 <xz_dec_run+0x2fa>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:679
2300506a:	4795                	li	a5,5
2300506c:	00f40023          	sb	a5,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:685
23005070:	01c44703          	lbu	a4,28(s0)
23005074:	4785                	li	a5,1
23005076:	2af70463          	beq	a4,a5,2300531e <xz_dec_run+0x5d8>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:701
2300507a:	4785                	li	a5,1
2300507c:	00f40023          	sb	a5,0(s0)
23005080:	4785                	li	a5,1
23005082:	b329                	j	23004d8c <xz_dec_run+0x46>
dec_index():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:341
23005084:	08042783          	lw	a5,128(s0)
23005088:	4418                	lw	a4,8(s0)
2300508a:	08442683          	lw	a3,132(s0)
2300508e:	4450                	lw	a2,12(s0)
23005090:	973e                	add	a4,a4,a5
23005092:	00f737b3          	sltu	a5,a4,a5
23005096:	96b2                	add	a3,a3,a2
23005098:	97b6                	add	a5,a5,a3
2300509a:	08e42023          	sw	a4,128(s0)
2300509e:	08f42223          	sw	a5,132(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:342
230050a2:	07940423          	sb	s9,104(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:343
230050a6:	5c3c                	lw	a5,120(s0)
230050a8:	5c78                	lw	a4,124(s0)
230050aa:	b379                	j	23004e38 <xz_dec_run+0xf2>
dec_main():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:629
230050ac:	0705                	addi	a4,a4,1
230050ae:	070a                	slli	a4,a4,0x2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:633
230050b0:	4789                	li	a5,2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:629
230050b2:	d818                	sw	a4,48(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:631
230050b4:	08e42e23          	sw	a4,156(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:632
230050b8:	08042c23          	sw	zero,152(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:633
230050bc:	00f40023          	sb	a5,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:639
230050c0:	85a6                	mv	a1,s1
230050c2:	8522                	mv	a0,s0
230050c4:	afdff0ef          	jal	ra,23004bc0 <fill_temp>
230050c8:	e20504e3          	beqz	a0,23004ef0 <xz_dec_run+0x1aa>
dec_block_header():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:480
230050cc:	09c42583          	lw	a1,156(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:481
230050d0:	0a040c93          	addi	s9,s0,160
230050d4:	4601                	li	a2,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:480
230050d6:	15f1                	addi	a1,a1,-4
230050d8:	08b42e23          	sw	a1,156(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:481
230050dc:	8566                	mv	a0,s9
230050de:	aa5fe0ef          	jal	ra,23003b82 <xz_crc32>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:482
230050e2:	09c42703          	lw	a4,156(s0)
get_unaligned_le32():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_config.h:77
230050e6:	00ec85b3          	add	a1,s9,a4
230050ea:	0015c603          	lbu	a2,1(a1)
230050ee:	0005c803          	lbu	a6,0(a1)
230050f2:	0025c683          	lbu	a3,2(a1)
230050f6:	0035c783          	lbu	a5,3(a1)
230050fa:	0622                	slli	a2,a2,0x8
230050fc:	01066633          	or	a2,a2,a6
23005100:	06c2                	slli	a3,a3,0x10
23005102:	8ed1                	or	a3,a3,a2
23005104:	07e2                	slli	a5,a5,0x18
23005106:	8fd5                	or	a5,a5,a3
dec_block_header():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:481
23005108:	0cf50c63          	beq	a0,a5,230051e0 <xz_dec_run+0x49a>
xz_dec_run():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:801
2300510c:	01d44783          	lbu	a5,29(s0)
dec_block_header():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:483
23005110:	4d1d                	li	s10,7
xz_dec_run():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:801
23005112:	dc0792e3          	bnez	a5,23004ed6 <xz_dec_run+0x190>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:807
23005116:	0124a223          	sw	s2,4(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:808
2300511a:	0134a823          	sw	s3,16(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:822
2300511e:	50f2                	lw	ra,60(sp)
23005120:	5462                	lw	s0,56(sp)
23005122:	856a                	mv	a0,s10
23005124:	54d2                	lw	s1,52(sp)
23005126:	5942                	lw	s2,48(sp)
23005128:	59b2                	lw	s3,44(sp)
2300512a:	5a22                	lw	s4,40(sp)
2300512c:	5a92                	lw	s5,36(sp)
2300512e:	5b02                	lw	s6,32(sp)
23005130:	4bf2                	lw	s7,28(sp)
23005132:	4c62                	lw	s8,24(sp)
23005134:	4cd2                	lw	s9,20(sp)
23005136:	4d42                	lw	s10,16(sp)
23005138:	4db2                	lw	s11,12(sp)
2300513a:	6121                	addi	sp,sp,64
2300513c:	8082                	ret
dec_index():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:327
2300513e:	441c                	lw	a5,8(s0)
23005140:	4458                	lw	a4,12(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:334
23005142:	4434                	lw	a3,72(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:327
23005144:	dc3c                	sw	a5,120(s0)
23005146:	dc78                	sw	a4,124(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:334
23005148:	14f69c63          	bne	a3,a5,230052a0 <xz_dec_run+0x55a>
2300514c:	4474                	lw	a3,76(s0)
2300514e:	cee683e3          	beq	a3,a4,23004e34 <xz_dec_run+0xee>
23005152:	a2b9                	j	230052a0 <xz_dec_run+0x55a>
xz_dec_run():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:795
23005154:	badff0ef          	jal	ra,23004d00 <xz_dec_reset>
23005158:	b919                	j	23004d6e <xz_dec_run+0x28>
dec_main():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:593
2300515a:	85a6                	mv	a1,s1
2300515c:	8522                	mv	a0,s0
2300515e:	a63ff0ef          	jal	ra,23004bc0 <fill_temp>
23005162:	d80507e3          	beqz	a0,23004ef0 <xz_dec_run+0x1aa>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:603
23005166:	01940023          	sb	s9,0(s0)
dec_stream_header():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:411
2300516a:	4619                	li	a2,6
2300516c:	cecc0593          	addi	a1,s8,-788 # 23007cec <crc32Tab+0x400>
23005170:	0a040513          	addi	a0,s0,160
23005174:	a47fd0ef          	jal	ra,23002bba <memcmp>
23005178:	34051c63          	bnez	a0,230054d0 <xz_dec_run+0x78a>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:414
2300517c:	4601                	li	a2,0
2300517e:	4589                	li	a1,2
23005180:	0a640513          	addi	a0,s0,166
23005184:	9fffe0ef          	jal	ra,23003b82 <xz_crc32>
get_unaligned_le32():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_config.h:77
23005188:	0a944683          	lbu	a3,169(s0)
2300518c:	0a844603          	lbu	a2,168(s0)
23005190:	0aa44703          	lbu	a4,170(s0)
23005194:	0ab44783          	lbu	a5,171(s0)
23005198:	06a2                	slli	a3,a3,0x8
2300519a:	8ed1                	or	a3,a3,a2
2300519c:	0742                	slli	a4,a4,0x10
2300519e:	8f55                	or	a4,a4,a3
230051a0:	07e2                	slli	a5,a5,0x18
230051a2:	8fd9                	or	a5,a5,a4
dec_stream_header():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:414
230051a4:	12f51563          	bne	a0,a5,230052ce <xz_dec_run+0x588>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:418
230051a8:	0a644783          	lbu	a5,166(s0)
230051ac:	efe1                	bnez	a5,23005284 <xz_dec_run+0x53e>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:428
230051ae:	0a744783          	lbu	a5,167(s0)
230051b2:	00f40e23          	sb	a5,28(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:437
230051b6:	0cfce763          	bltu	s9,a5,23005284 <xz_dec_run+0x53e>
dec_main():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:614
230051ba:	40dc                	lw	a5,4(s1)
230051bc:	4498                	lw	a4,8(s1)
230051be:	1ce78363          	beq	a5,a4,23005384 <xz_dec_run+0x63e>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:618
230051c2:	4098                	lw	a4,0(s1)
230051c4:	973e                	add	a4,a4,a5
230051c6:	00074703          	lbu	a4,0(a4)
230051ca:	ee0711e3          	bnez	a4,230050ac <xz_dec_run+0x366>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:619
230051ce:	00178713          	addi	a4,a5,1
230051d2:	c0d8                	sw	a4,4(s1)
230051d4:	c81c                	sw	a5,16(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:620
230051d6:	4799                	li	a5,6
230051d8:	00f40023          	sb	a5,0(s0)
230051dc:	4799                	li	a5,6
230051de:	b67d                	j	23004d8c <xz_dec_run+0x46>
dec_block_header():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:494
230051e0:	0a144783          	lbu	a5,161(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:485
230051e4:	4689                	li	a3,2
230051e6:	08d42c23          	sw	a3,152(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:494
230051ea:	03f7f693          	andi	a3,a5,63
230051ee:	28069463          	bnez	a3,23005476 <xz_dec_run+0x730>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:499
230051f2:	0407f693          	andi	a3,a5,64
230051f6:	24069b63          	bnez	a3,2300544c <xz_dec_run+0x706>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:506
230051fa:	567d                	li	a2,-1
230051fc:	56fd                	li	a3,-1
230051fe:	d010                	sw	a2,32(s0)
23005200:	d054                	sw	a3,36(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:510
23005202:	07e2                	slli	a5,a5,0x18
23005204:	87e1                	srai	a5,a5,0x18
23005206:	2807cb63          	bltz	a5,2300549c <xz_dec_run+0x756>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:517
2300520a:	567d                	li	a2,-1
2300520c:	56fd                	li	a3,-1
2300520e:	d410                	sw	a2,40(s0)
23005210:	d454                	sw	a3,44(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:541
23005212:	09842783          	lw	a5,152(s0)
23005216:	4605                	li	a2,1
23005218:	40f706b3          	sub	a3,a4,a5
2300521c:	2ad67863          	bgeu	a2,a3,230054cc <xz_dec_run+0x786>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:545
23005220:	00178693          	addi	a3,a5,1
23005224:	00f405b3          	add	a1,s0,a5
23005228:	08d42c23          	sw	a3,152(s0)
2300522c:	0a05c503          	lbu	a0,160(a1)
23005230:	02100593          	li	a1,33
23005234:	24b51963          	bne	a0,a1,23005486 <xz_dec_run+0x740>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:549
23005238:	00278593          	addi	a1,a5,2
2300523c:	08b42c23          	sw	a1,152(s0)
23005240:	96a2                	add	a3,a3,s0
23005242:	0a06cc83          	lbu	s9,160(a3)
23005246:	02cc9f63          	bne	s9,a2,23005284 <xz_dec_run+0x53e>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:553
2300524a:	08e58263          	beq	a1,a4,230052ce <xz_dec_run+0x588>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:556
2300524e:	078d                	addi	a5,a5,3
23005250:	08f42c23          	sw	a5,152(s0)
23005254:	95a2                	add	a1,a1,s0
23005256:	0a05c583          	lbu	a1,160(a1)
2300525a:	4a042503          	lw	a0,1184(s0)
2300525e:	8bfff0ef          	jal	ra,23004b1c <xz_dec_lzma2_reset>
23005262:	8d2a                	mv	s10,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:557
23005264:	1c051863          	bnez	a0,23005434 <xz_dec_run+0x6ee>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:561
23005268:	09c42683          	lw	a3,156(s0)
2300526c:	09842783          	lw	a5,152(s0)
23005270:	12d7f063          	bgeu	a5,a3,23005390 <xz_dec_run+0x64a>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:562
23005274:	0785                	addi	a5,a5,1
23005276:	08f42c23          	sw	a5,152(s0)
2300527a:	00f40733          	add	a4,s0,a5
2300527e:	09f74703          	lbu	a4,159(a4)
23005282:	d77d                	beqz	a4,23005270 <xz_dec_run+0x52a>
xz_dec_run():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:801
23005284:	01d44783          	lbu	a5,29(s0)
dec_stream_header():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:419
23005288:	4d19                	li	s10,6
xz_dec_run():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:801
2300528a:	e80786e3          	beqz	a5,23005116 <xz_dec_run+0x3d0>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:818
2300528e:	00040f23          	sb	zero,30(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:821
23005292:	b571                	j	2300511e <xz_dec_run+0x3d8>
dec_stream_footer():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:447
23005294:	0aa44703          	lbu	a4,170(s0)
23005298:	05900793          	li	a5,89
2300529c:	10f70863          	beq	a4,a5,230053ac <xz_dec_run+0x666>
xz_dec_run():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:801
230052a0:	01d44783          	lbu	a5,29(s0)
230052a4:	c4078ee3          	beqz	a5,23004f00 <xz_dec_run+0x1ba>
230052a8:	4d1d                	li	s10,7
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:818
230052aa:	00040f23          	sb	zero,30(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:821
230052ae:	bd85                	j	2300511e <xz_dec_run+0x3d8>
dec_block():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:251
230052b0:	541c                	lw	a5,40(s0)
230052b2:	cac7fee3          	bgeu	a5,a2,23004f6e <xz_dec_run+0x228>
230052b6:	bd99                	j	2300510c <xz_dec_run+0x3c6>
dec_main():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:744
230052b8:	47b1                	li	a5,12
230052ba:	08f42e23          	sw	a5,156(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:745
230052be:	47a5                	li	a5,9
crc_validate():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:381
230052c0:	00042c23          	sw	zero,24(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:382
230052c4:	00042223          	sw	zero,4(s0)
dec_main():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:745
230052c8:	00f40023          	sb	a5,0(s0)
230052cc:	b921                	j	23004ee4 <xz_dec_run+0x19e>
xz_dec_run():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:801
230052ce:	01d44783          	lbu	a5,29(s0)
dec_stream_header():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:416
230052d2:	4d1d                	li	s10,7
xz_dec_run():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:801
230052d4:	e40781e3          	beqz	a5,23005116 <xz_dec_run+0x3d0>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:818
230052d8:	00040f23          	sb	zero,30(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:821
230052dc:	b589                	j	2300511e <xz_dec_run+0x3d8>
dec_main():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:718
230052de:	8522                	mv	a0,s0
230052e0:	9ebff0ef          	jal	ra,23004cca <index_update.isra.2>
xz_dec_run():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:801
230052e4:	01d44783          	lbu	a5,29(s0)
230052e8:	40d8                	lw	a4,4(s1)
230052ea:	c00787e3          	beqz	a5,23004ef8 <xz_dec_run+0x1b2>
230052ee:	bef1                	j	23004eca <xz_dec_run+0x184>
dec_index():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:321
230052f0:	40d0                	lw	a2,4(s1)
230052f2:	408c                	lw	a1,0(s1)
230052f4:	8522                	mv	a0,s0
230052f6:	9d5ff0ef          	jal	ra,23004cca <index_update.isra.2>
xz_dec_run():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:801
230052fa:	01d44783          	lbu	a5,29(s0)
230052fe:	c791                	beqz	a5,2300530a <xz_dec_run+0x5c4>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:811
23005300:	bc0d1be3          	bnez	s10,23004ed6 <xz_dec_run+0x190>
23005304:	40dc                	lw	a5,4(s1)
23005306:	873e                	mv	a4,a5
23005308:	b6c9                	j	23004eca <xz_dec_run+0x184>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:802
2300530a:	e00d16e3          	bnez	s10,23005116 <xz_dec_run+0x3d0>
2300530e:	40dc                	lw	a5,4(s1)
23005310:	4494                	lw	a3,8(s1)
23005312:	873e                	mv	a4,a5
23005314:	b6dd                	j	23004efa <xz_dec_run+0x1b4>
dec_block():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:250
23005316:	501c                	lw	a5,32(s0)
23005318:	c4d7f6e3          	bgeu	a5,a3,23004f64 <xz_dec_run+0x21e>
2300531c:	bbc5                	j	2300510c <xz_dec_run+0x3c6>
crc_validate():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:379
2300531e:	457d                	li	a0,31
23005320:	a015                	j	23005344 <xz_dec_run+0x5fe>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:374
23005322:	4090                	lw	a2,0(s1)
23005324:	4054                	lw	a3,4(s0)
23005326:	4c18                	lw	a4,24(s0)
23005328:	97b2                	add	a5,a5,a2
2300532a:	c0cc                	sw	a1,4(s1)
2300532c:	0007c603          	lbu	a2,0(a5)
23005330:	00d757b3          	srl	a5,a4,a3
23005334:	0ff7f793          	andi	a5,a5,255
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:377
23005338:	06a1                	addi	a3,a3,8
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:374
2300533a:	f6c793e3          	bne	a5,a2,230052a0 <xz_dec_run+0x55a>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:377
2300533e:	c054                	sw	a3,4(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:379
23005340:	18d56163          	bltu	a0,a3,230054c2 <xz_dec_run+0x77c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:371
23005344:	40dc                	lw	a5,4(s1)
23005346:	4494                	lw	a3,8(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:374
23005348:	00178593          	addi	a1,a5,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:371
2300534c:	8736                	mv	a4,a3
2300534e:	fcd79ae3          	bne	a5,a3,23005322 <xz_dec_run+0x5dc>
xz_dec_run():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:801
23005352:	01d44603          	lbu	a2,29(s0)
23005356:	b6061ae3          	bnez	a2,23004eca <xz_dec_run+0x184>
2300535a:	873e                	mv	a4,a5
2300535c:	be79                	j	23004efa <xz_dec_run+0x1b4>
dec_block():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:256
2300535e:	44dc                	lw	a5,12(s1)
23005360:	4c10                	lw	a2,24(s0)
23005362:	953e                	add	a0,a0,a5
23005364:	81ffe0ef          	jal	ra,23003b82 <xz_crc32>
23005368:	cc08                	sw	a0,24(s0)
2300536a:	b139                	j	23004f78 <xz_dec_run+0x232>
xz_dec_run():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:813
2300536c:	01e44d03          	lbu	s10,30(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:816
23005370:	4785                	li	a5,1
23005372:	00f40f23          	sb	a5,30(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:814
23005376:	01a03d33          	snez	s10,s10
2300537a:	0d0e                	slli	s10,s10,0x3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:816
2300537c:	b34d                	j	2300511e <xz_dec_run+0x3d8>
dec_block():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:270
2300537e:	c2f612e3          	bne	a2,a5,23004fa2 <xz_dec_run+0x25c>
23005382:	b125                	j	23004faa <xz_dec_run+0x264>
xz_dec_run():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:801
23005384:	01d44783          	lbu	a5,29(s0)
23005388:	b40791e3          	bnez	a5,23004eca <xz_dec_run+0x184>
2300538c:	4d1d                	li	s10,7
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:806
2300538e:	b361                	j	23005116 <xz_dec_run+0x3d0>
dec_block_header():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:566
23005390:	4781                	li	a5,0
23005392:	4801                	li	a6,0
23005394:	dc1c                	sw	a5,56(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:567
23005396:	c03c                	sw	a5,64(s0)
dec_main():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:646
23005398:	478d                	li	a5,3
dec_block_header():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:565
2300539a:	08042c23          	sw	zero,152(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:566
2300539e:	03042e23          	sw	a6,60(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:567
230053a2:	05042223          	sw	a6,68(s0)
dec_main():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:646
230053a6:	00f40023          	sb	a5,0(s0)
230053aa:	b6ad                	j	23004f14 <xz_dec_run+0x1ce>
dec_stream_footer():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:447
230053ac:	0ab44703          	lbu	a4,171(s0)
230053b0:	05a00793          	li	a5,90
230053b4:	eef716e3          	bne	a4,a5,230052a0 <xz_dec_run+0x55a>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:450
230053b8:	4601                	li	a2,0
230053ba:	4599                	li	a1,6
230053bc:	0a440513          	addi	a0,s0,164
230053c0:	fc2fe0ef          	jal	ra,23003b82 <xz_crc32>
get_unaligned_le32():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_config.h:77
230053c4:	0a144683          	lbu	a3,161(s0)
230053c8:	0a044603          	lbu	a2,160(s0)
230053cc:	0a244703          	lbu	a4,162(s0)
230053d0:	0a344783          	lbu	a5,163(s0)
230053d4:	06a2                	slli	a3,a3,0x8
230053d6:	8ed1                	or	a3,a3,a2
230053d8:	0742                	slli	a4,a4,0x10
230053da:	8f55                	or	a4,a4,a3
230053dc:	07e2                	slli	a5,a5,0x18
230053de:	8fd9                	or	a5,a5,a4
dec_stream_footer():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:450
230053e0:	ecf510e3          	bne	a0,a5,230052a0 <xz_dec_run+0x55a>
get_unaligned_le32():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_config.h:77
230053e4:	0a544603          	lbu	a2,165(s0)
230053e8:	0a444503          	lbu	a0,164(s0)
230053ec:	0a644683          	lbu	a3,166(s0)
dec_stream_footer():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:458
230053f0:	586c                	lw	a1,116(s0)
230053f2:	5838                	lw	a4,112(s0)
get_unaligned_le32():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_config.h:77
230053f4:	0a744783          	lbu	a5,167(s0)
230053f8:	0622                	slli	a2,a2,0x8
230053fa:	8e49                	or	a2,a2,a0
230053fc:	06c2                	slli	a3,a3,0x10
dec_stream_footer():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:458
230053fe:	01e59513          	slli	a0,a1,0x1e
get_unaligned_le32():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_config.h:77
23005402:	8ed1                	or	a3,a3,a2
dec_stream_footer():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:458
23005404:	8309                	srli	a4,a4,0x2
get_unaligned_le32():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_config.h:77
23005406:	07e2                	slli	a5,a5,0x18
23005408:	8fd5                	or	a5,a5,a3
dec_stream_footer():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:458
2300540a:	8f49                	or	a4,a4,a0
2300540c:	01d44683          	lbu	a3,29(s0)
23005410:	8189                	srli	a1,a1,0x2
23005412:	02f71963          	bne	a4,a5,23005444 <xz_dec_run+0x6fe>
23005416:	e59d                	bnez	a1,23005444 <xz_dec_run+0x6fe>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:461
23005418:	0a844783          	lbu	a5,168(s0)
2300541c:	e785                	bnez	a5,23005444 <xz_dec_run+0x6fe>
2300541e:	0a944703          	lbu	a4,169(s0)
23005422:	01c44783          	lbu	a5,28(s0)
23005426:	00f71f63          	bne	a4,a5,23005444 <xz_dec_run+0x6fe>
xz_dec_run():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:801
2300542a:	ca99                	beqz	a3,23005440 <xz_dec_run+0x6fa>
dec_stream_footer():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:468
2300542c:	4d05                	li	s10,1
xz_dec_run():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:818
2300542e:	00040f23          	sb	zero,30(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:821
23005432:	b1f5                	j	2300511e <xz_dec_run+0x3d8>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:801
23005434:	01d44783          	lbu	a5,29(s0)
23005438:	a8079fe3          	bnez	a5,23004ed6 <xz_dec_run+0x190>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:806
2300543c:	cd951de3          	bne	a0,s9,23005116 <xz_dec_run+0x3d0>
dec_block_header():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:496
23005440:	4d05                	li	s10,1
23005442:	b9f1                	j	2300511e <xz_dec_run+0x3d8>
xz_dec_run():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:801
23005444:	e60692e3          	bnez	a3,230052a8 <xz_dec_run+0x562>
23005448:	4d1d                	li	s10,7
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:806
2300544a:	b1f1                	j	23005116 <xz_dec_run+0x3d0>
dec_block_header():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:500
2300544c:	09840693          	addi	a3,s0,152
23005450:	8666                	mv	a2,s9
23005452:	00840593          	addi	a1,s0,8
23005456:	00440513          	addi	a0,s0,4
2300545a:	fd8ff0ef          	jal	ra,23004c32 <dec_vli.isra.0>
2300545e:	4785                	li	a5,1
23005460:	e6f517e3          	bne	a0,a5,230052ce <xz_dec_run+0x588>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:504
23005464:	4410                	lw	a2,8(s0)
23005466:	4454                	lw	a3,12(s0)
23005468:	0a144783          	lbu	a5,161(s0)
2300546c:	09c42703          	lw	a4,156(s0)
23005470:	d010                	sw	a2,32(s0)
23005472:	d054                	sw	a3,36(s0)
23005474:	b379                	j	23005202 <xz_dec_run+0x4bc>
xz_dec_run():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:801
23005476:	01d44783          	lbu	a5,29(s0)
dec_block_header():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:496
2300547a:	4d19                	li	s10,6
xz_dec_run():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:801
2300547c:	c8078de3          	beqz	a5,23005116 <xz_dec_run+0x3d0>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:818
23005480:	00040f23          	sb	zero,30(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:821
23005484:	b969                	j	2300511e <xz_dec_run+0x3d8>
dec_block_header():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:546
23005486:	4d19                	li	s10,6
xz_dec_run():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:801
23005488:	01d44783          	lbu	a5,29(s0)
2300548c:	c80785e3          	beqz	a5,23005116 <xz_dec_run+0x3d0>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:818
23005490:	00040f23          	sb	zero,30(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:821
23005494:	b169                	j	2300511e <xz_dec_run+0x3d8>
dec_block():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:265
23005496:	aef699e3          	bne	a3,a5,23004f88 <xz_dec_run+0x242>
2300549a:	bced                	j	23004f94 <xz_dec_run+0x24e>
dec_block_header():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:511
2300549c:	09840693          	addi	a3,s0,152
230054a0:	8666                	mv	a2,s9
230054a2:	00840593          	addi	a1,s0,8
230054a6:	00440513          	addi	a0,s0,4
230054aa:	f88ff0ef          	jal	ra,23004c32 <dec_vli.isra.0>
230054ae:	4785                	li	a5,1
230054b0:	e0f51fe3          	bne	a0,a5,230052ce <xz_dec_run+0x588>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:515
230054b4:	4410                	lw	a2,8(s0)
230054b6:	4454                	lw	a3,12(s0)
230054b8:	09c42703          	lw	a4,156(s0)
230054bc:	d410                	sw	a2,40(s0)
230054be:	d454                	sw	a3,44(s0)
230054c0:	bb89                	j	23005212 <xz_dec_run+0x4cc>
crc_validate():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:381
230054c2:	00042c23          	sw	zero,24(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:382
230054c6:	00042223          	sw	zero,4(s0)
dec_main():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:687
230054ca:	be45                	j	2300507a <xz_dec_run+0x334>
dec_block_header():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:542
230054cc:	4d1d                	li	s10,7
230054ce:	bf6d                	j	23005488 <xz_dec_run+0x742>
xz_dec_run():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:801
230054d0:	01d44783          	lbu	a5,29(s0)
dec_stream_header():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:412
230054d4:	4d15                	li	s10,5
xz_dec_run():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:801
230054d6:	c40780e3          	beqz	a5,23005116 <xz_dec_run+0x3d0>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:818
230054da:	00040f23          	sb	zero,30(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:821
230054de:	b181                	j	2300511e <xz_dec_run+0x3d8>

230054e0 <xz_dec_init>:
xz_dec_init():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:825
230054e0:	1141                	addi	sp,sp,-16
230054e2:	c226                	sw	s1,4(sp)
230054e4:	84aa                	mv	s1,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:826
230054e6:	4a800513          	li	a0,1192
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:825
230054ea:	c422                	sw	s0,8(sp)
230054ec:	c04a                	sw	s2,0(sp)
230054ee:	c606                	sw	ra,12(sp)
230054f0:	892e                	mv	s2,a1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:826
230054f2:	28a1                	jal	2300554a <simple_malloc>
230054f4:	842a                	mv	s0,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:827
230054f6:	cd09                	beqz	a0,23005510 <xz_dec_init+0x30>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:830
230054f8:	00950ea3          	sb	s1,29(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:838
230054fc:	85ca                	mv	a1,s2
230054fe:	8526                	mv	a0,s1
23005500:	db4ff0ef          	jal	ra,23004ab4 <xz_dec_lzma2_create>
23005504:	4aa42023          	sw	a0,1184(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:839
23005508:	c919                	beqz	a0,2300551e <xz_dec_init+0x3e>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:842
2300550a:	8522                	mv	a0,s0
2300550c:	ff4ff0ef          	jal	ra,23004d00 <xz_dec_reset>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:852
23005510:	8522                	mv	a0,s0
23005512:	40b2                	lw	ra,12(sp)
23005514:	4422                	lw	s0,8(sp)
23005516:	4492                	lw	s1,4(sp)
23005518:	4902                	lw	s2,0(sp)
2300551a:	0141                	addi	sp,sp,16
2300551c:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:850
2300551e:	8522                	mv	a0,s0
23005520:	20b5                	jal	2300558c <simple_free>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:851
23005522:	4401                	li	s0,0
23005524:	b7f5                	j	23005510 <xz_dec_init+0x30>

23005526 <xz_dec_end>:
xz_dec_end():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:868
23005526:	cd11                	beqz	a0,23005542 <xz_dec_end+0x1c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:867
23005528:	1141                	addi	sp,sp,-16
2300552a:	c422                	sw	s0,8(sp)
2300552c:	842a                	mv	s0,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:869
2300552e:	4a052503          	lw	a0,1184(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:867
23005532:	c606                	sw	ra,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:869
23005534:	e60ff0ef          	jal	ra,23004b94 <xz_dec_lzma2_end>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:873
23005538:	8522                	mv	a0,s0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:875
2300553a:	4422                	lw	s0,8(sp)
2300553c:	40b2                	lw	ra,12(sp)
2300553e:	0141                	addi	sp,sp,16
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_dec_stream.c:873
23005540:	a0b1                	j	2300558c <simple_free>
23005542:	8082                	ret

23005544 <simple_malloc_init>:
simple_malloc_init():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_port.c:7
23005544:	0c01a223          	sw	zero,196(gp) # 42021944 <malloced>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_port.c:8
23005548:	8082                	ret

2300554a <simple_malloc>:
simple_malloc():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_port.c:10
2300554a:	1141                	addi	sp,sp,-16
2300554c:	c422                	sw	s0,8(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_port.c:12
2300554e:	85aa                	mv	a1,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_port.c:10
23005550:	842a                	mv	s0,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_port.c:12
23005552:	23008537          	lui	a0,0x23008
23005556:	d0c50513          	addi	a0,a0,-756 # 23007d0c <crc32Tab+0x420>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_port.c:10
2300555a:	c606                	sw	ra,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_port.c:12
2300555c:	716010ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_port.c:13
23005560:	0c418793          	addi	a5,gp,196 # 42021944 <malloced>
23005564:	4388                	lw	a0,0(a5)
23005566:	6741                	lui	a4,0x10
23005568:	942a                	add	s0,s0,a0
2300556a:	00e47c63          	bgeu	s0,a4,23005582 <simple_malloc+0x38>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_port.c:15
2300556e:	c380                	sw	s0,0(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_port.c:19
23005570:	40b2                	lw	ra,12(sp)
23005572:	4422                	lw	s0,8(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_port.c:14
23005574:	42023737          	lui	a4,0x42023
23005578:	95070713          	addi	a4,a4,-1712 # 42022950 <mallocBuf>
2300557c:	953a                	add	a0,a0,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_port.c:19
2300557e:	0141                	addi	sp,sp,16
23005580:	8082                	ret
23005582:	40b2                	lw	ra,12(sp)
23005584:	4422                	lw	s0,8(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_port.c:18
23005586:	4501                	li	a0,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_port.c:19
23005588:	0141                	addi	sp,sp,16
2300558a:	8082                	ret

2300558c <simple_free>:
simple_free():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Common/xz/xz_port.c:23
2300558c:	85aa                	mv	a1,a0
2300558e:	23008537          	lui	a0,0x23008
23005592:	cf850513          	addi	a0,a0,-776 # 23007cf8 <crc32Tab+0x40c>
23005596:	6dc0106f          	j	23006c72 <bflb_platform_printf>

2300559a <SystemInit>:
SystemInit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/system_bl602.c:80
2300559a:	4000f6b7          	lui	a3,0x4000f
2300559e:	4adc                	lw	a5,20(a3)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/system_bl602.c:81
230055a0:	7741                	lui	a4,0xffff0
230055a2:	177d                	addi	a4,a4,-1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/system_bl602.c:31
230055a4:	1101                	addi	sp,sp,-32
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/system_bl602.c:81
230055a6:	8ff9                	and	a5,a5,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/system_bl602.c:31
230055a8:	ce06                	sw	ra,28(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/system_bl602.c:82
230055aa:	cadc                	sw	a5,20(a3)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/system_bl602.c:84
230055ac:	4501                	li	a0,0
230055ae:	071000ef          	jal	ra,23005e1e <GLB_Set_EM_Sel>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/system_bl602.c:87
230055b2:	4000e637          	lui	a2,0x4000e
230055b6:	41862683          	lw	a3,1048(a2) # 4000e418 <__ram_load_addr+0x1d004ab0>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/system_bl602.c:88
230055ba:	0049d7b7          	lui	a5,0x49d
230055be:	39d78793          	addi	a5,a5,925 # 49d39d <StackSize+0x49cf9d>
230055c2:	00869713          	slli	a4,a3,0x8
230055c6:	8321                	srli	a4,a4,0x8
230055c8:	00f71c63          	bne	a4,a5,230055e0 <SystemInit+0x46>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/system_bl602.c:89
230055cc:	ff0007b7          	lui	a5,0xff000
230055d0:	8efd                	and	a3,a3,a5
230055d2:	0049e7b7          	lui	a5,0x49e
230055d6:	89e78793          	addi	a5,a5,-1890 # 49d89e <StackSize+0x49d49e>
230055da:	8edd                	or	a3,a3,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/system_bl602.c:90
230055dc:	40d62c23          	sw	a3,1048(a2)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/system_bl602.c:94
230055e0:	4501                	li	a0,0
230055e2:	04d000ef          	jal	ra,23005e2e <GLB_UART_Sig_Swap_Set>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/system_bl602.c:95
230055e6:	4501                	li	a0,0
230055e8:	063000ef          	jal	ra,23005e4a <GLB_JTAG_Sig_Swap_Set>
230055ec:	02800737          	lui	a4,0x2800
230055f0:	40070793          	addi	a5,a4,1024 # 2800400 <StackSize+0x2800000>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/system_bl602.c:99
230055f4:	45070713          	addi	a4,a4,1104
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/system_bl602.c:100 (discriminator 3)
230055f8:	0007a023          	sw	zero,0(a5)
230055fc:	0791                	addi	a5,a5,4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/system_bl602.c:99 (discriminator 3)
230055fe:	fee79de3          	bne	a5,a4,230055f8 <SystemInit+0x5e>
23005602:	028007b7          	lui	a5,0x2800
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/system_bl602.c:103
23005606:	05078713          	addi	a4,a5,80 # 2800050 <StackSize+0x27ffc50>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/system_bl602.c:104 (discriminator 3)
2300560a:	0007a023          	sw	zero,0(a5)
2300560e:	0791                	addi	a5,a5,4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/system_bl602.c:103 (discriminator 3)
23005610:	fee79de3          	bne	a5,a4,2300560a <SystemInit+0x70>
__enable_irq():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Core/Include/cmsis_compatible_gcc.h:89
23005614:	30046073          	csrsi	mstatus,8
system_bor_init():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/system_bl602.c:26
23005618:	230087b7          	lui	a5,0x23008
2300561c:	f2c7a783          	lw	a5,-212(a5) # 23007f2c <CSWTCH.116+0x3c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/system_bl602.c:27
23005620:	0068                	addi	a0,sp,12
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/system_bl602.c:26
23005622:	c63e                	sw	a5,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/system_bl602.c:27
23005624:	243000ef          	jal	ra,23006066 <HBN_Set_BOR_Cfg>
SystemInit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/system_bl602.c:122
23005628:	40f2                	lw	ra,28(sp)
2300562a:	6105                	addi	sp,sp,32
2300562c:	8082                	ret

2300562e <start_load>:
start_load():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/start_load.c:47
2300562e:	22010737          	lui	a4,0x22010
23005632:	220117b7          	lui	a5,0x22011
23005636:	00070613          	mv	a2,a4
2300563a:	9b478793          	addi	a5,a5,-1612 # 220109b4 <__tcm_code_end__>
2300563e:	02f67863          	bgeu	a2,a5,2300566e <start_load+0x40>
23005642:	fff78693          	addi	a3,a5,-1
23005646:	8e91                	sub	a3,a3,a2
23005648:	230087b7          	lui	a5,0x23008
2300564c:	9af1                	andi	a3,a3,-4
2300564e:	f3478613          	addi	a2,a5,-204 # 23007f34 <__text_code_end__>
23005652:	0691                	addi	a3,a3,4
23005654:	96b2                	add	a3,a3,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/start_load.c:46
23005656:	00070713          	mv	a4,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/start_load.c:45
2300565a:	f3478793          	addi	a5,a5,-204
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/start_load.c:48
2300565e:	0791                	addi	a5,a5,4
23005660:	ffc7a603          	lw	a2,-4(a5)
23005664:	0711                	addi	a4,a4,4
23005666:	fec72e23          	sw	a2,-4(a4) # 2200fffc <StackSize+0x2200fbfc>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/start_load.c:47
2300566a:	fed79ae3          	bne	a5,a3,2300565e <start_load+0x30>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/start_load.c:54
2300566e:	42014737          	lui	a4,0x42014
23005672:	420147b7          	lui	a5,0x42014
23005676:	00070613          	mv	a2,a4
2300567a:	00078793          	mv	a5,a5
2300567e:	02f67863          	bgeu	a2,a5,230056ae <start_load+0x80>
23005682:	fff78693          	addi	a3,a5,-1 # 42013fff <__ram_load_addr+0x1f00a697>
23005686:	8e91                	sub	a3,a3,a2
23005688:	230097b7          	lui	a5,0x23009
2300568c:	9af1                	andi	a3,a3,-4
2300568e:	8e878613          	addi	a2,a5,-1816 # 230088e8 <__dtcm_load_addr>
23005692:	0691                	addi	a3,a3,4
23005694:	96b2                	add	a3,a3,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/start_load.c:53
23005696:	00070713          	mv	a4,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/start_load.c:52
2300569a:	8e878793          	addi	a5,a5,-1816
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/start_load.c:55
2300569e:	0791                	addi	a5,a5,4
230056a0:	ffc7a603          	lw	a2,-4(a5)
230056a4:	0711                	addi	a4,a4,4
230056a6:	fec72e23          	sw	a2,-4(a4) # 42013ffc <__ram_load_addr+0x1f00a694>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/start_load.c:54
230056aa:	fed79ae3          	bne	a5,a3,2300569e <start_load+0x70>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/start_load.c:61
230056ae:	42020737          	lui	a4,0x42020
230056b2:	420217b7          	lui	a5,0x42021
230056b6:	00070613          	mv	a2,a4
230056ba:	08078793          	addi	a5,a5,128 # 42021080 <__system_ram_data_end__>
230056be:	02f67863          	bgeu	a2,a5,230056ee <start_load+0xc0>
230056c2:	fff78693          	addi	a3,a5,-1
230056c6:	8e91                	sub	a3,a3,a2
230056c8:	230097b7          	lui	a5,0x23009
230056cc:	9af1                	andi	a3,a3,-4
230056ce:	8e878613          	addi	a2,a5,-1816 # 230088e8 <__dtcm_load_addr>
230056d2:	0691                	addi	a3,a3,4
230056d4:	96b2                	add	a3,a3,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/start_load.c:60
230056d6:	00070713          	mv	a4,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/start_load.c:59
230056da:	8e878793          	addi	a5,a5,-1816
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/start_load.c:62
230056de:	0791                	addi	a5,a5,4
230056e0:	ffc7a603          	lw	a2,-4(a5)
230056e4:	0711                	addi	a4,a4,4
230056e6:	fec72e23          	sw	a2,-4(a4) # 4201fffc <__StackLimit+0x3fc>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/start_load.c:61
230056ea:	fef69ae3          	bne	a3,a5,230056de <start_load+0xb0>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/start_load.c:68
230056ee:	42021737          	lui	a4,0x42021
230056f2:	08070613          	addi	a2,a4,128 # 42021080 <__system_ram_data_end__>
230056f6:	81c18793          	addi	a5,gp,-2020 # 4202109c <__ram_data_end__>
230056fa:	02f67863          	bgeu	a2,a5,2300572a <start_load+0xfc>
230056fe:	fff78693          	addi	a3,a5,-1
23005702:	8e91                	sub	a3,a3,a2
23005704:	2300a7b7          	lui	a5,0x2300a
23005708:	9af1                	andi	a3,a3,-4
2300570a:	96878613          	addi	a2,a5,-1688 # 23009968 <__ram_load_addr>
2300570e:	0691                	addi	a3,a3,4
23005710:	96b2                	add	a3,a3,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/start_load.c:67
23005712:	08070713          	addi	a4,a4,128
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/start_load.c:66
23005716:	96878793          	addi	a5,a5,-1688
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/start_load.c:69
2300571a:	0791                	addi	a5,a5,4
2300571c:	ffc7a603          	lw	a2,-4(a5)
23005720:	0711                	addi	a4,a4,4
23005722:	fec72e23          	sw	a2,-4(a4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/start_load.c:68
23005726:	fef69ae3          	bne	a3,a5,2300571a <start_load+0xec>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/start_load.c:82
2300572a:	420217b7          	lui	a5,0x42021
2300572e:	09c78713          	addi	a4,a5,156 # 4202109c <__ram_data_end__>
23005732:	0d018693          	addi	a3,gp,208 # 42021950 <__bss_end__>
23005736:	00d77e63          	bgeu	a4,a3,23005752 <start_load+0x124>
2300573a:	16fd                	addi	a3,a3,-1
2300573c:	8e99                	sub	a3,a3,a4
2300573e:	9af1                	andi	a3,a3,-4
23005740:	0691                	addi	a3,a3,4
23005742:	9736                	add	a4,a4,a3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/start_load.c:81
23005744:	09c78793          	addi	a5,a5,156
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/start_load.c:83
23005748:	0791                	addi	a5,a5,4
2300574a:	fe07ae23          	sw	zero,-4(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/start_load.c:82
2300574e:	fee79de3          	bne	a5,a4,23005748 <start_load+0x11a>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/GCC/start_load.c:86
23005752:	8082                	ret

23005754 <Interrupt_Handler_Stub>:
Interrupt_Handler_Stub():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/interrupt.c:146
23005754:	7175                	addi	sp,sp,-144
23005756:	c706                	sw	ra,140(sp)
23005758:	c516                	sw	t0,136(sp)
2300575a:	c31a                	sw	t1,132(sp)
2300575c:	c11e                	sw	t2,128(sp)
2300575e:	deaa                	sw	a0,124(sp)
23005760:	dcae                	sw	a1,120(sp)
23005762:	dab2                	sw	a2,116(sp)
23005764:	d8b6                	sw	a3,112(sp)
23005766:	d6ba                	sw	a4,108(sp)
23005768:	d4be                	sw	a5,104(sp)
2300576a:	d2c2                	sw	a6,100(sp)
2300576c:	d0c6                	sw	a7,96(sp)
2300576e:	cef2                	sw	t3,92(sp)
23005770:	ccf6                	sw	t4,88(sp)
23005772:	cafa                	sw	t5,84(sp)
23005774:	c8fe                	sw	t6,80(sp)
23005776:	e682                	fsw	ft0,76(sp)
23005778:	e486                	fsw	ft1,72(sp)
2300577a:	e28a                	fsw	ft2,68(sp)
2300577c:	e08e                	fsw	ft3,64(sp)
2300577e:	fe12                	fsw	ft4,60(sp)
23005780:	fc16                	fsw	ft5,56(sp)
23005782:	fa1a                	fsw	ft6,52(sp)
23005784:	f81e                	fsw	ft7,48(sp)
23005786:	f62a                	fsw	fa0,44(sp)
23005788:	f42e                	fsw	fa1,40(sp)
2300578a:	f232                	fsw	fa2,36(sp)
2300578c:	f036                	fsw	fa3,32(sp)
2300578e:	ee3a                	fsw	fa4,28(sp)
23005790:	ec3e                	fsw	fa5,24(sp)
23005792:	ea42                	fsw	fa6,20(sp)
23005794:	e846                	fsw	fa7,16(sp)
23005796:	e672                	fsw	ft8,12(sp)
23005798:	e476                	fsw	ft9,8(sp)
2300579a:	e27a                	fsw	ft10,4(sp)
2300579c:	e07e                	fsw	ft11,0(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/interrupt.c:147
2300579e:	249d                	jal	23005a04 <Interrupt_Handler>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/interrupt.c:148
230057a0:	40ba                	lw	ra,140(sp)
230057a2:	42aa                	lw	t0,136(sp)
230057a4:	431a                	lw	t1,132(sp)
230057a6:	438a                	lw	t2,128(sp)
230057a8:	5576                	lw	a0,124(sp)
230057aa:	55e6                	lw	a1,120(sp)
230057ac:	5656                	lw	a2,116(sp)
230057ae:	56c6                	lw	a3,112(sp)
230057b0:	5736                	lw	a4,108(sp)
230057b2:	57a6                	lw	a5,104(sp)
230057b4:	5816                	lw	a6,100(sp)
230057b6:	5886                	lw	a7,96(sp)
230057b8:	4e76                	lw	t3,92(sp)
230057ba:	4ee6                	lw	t4,88(sp)
230057bc:	4f56                	lw	t5,84(sp)
230057be:	4fc6                	lw	t6,80(sp)
230057c0:	6036                	flw	ft0,76(sp)
230057c2:	60a6                	flw	ft1,72(sp)
230057c4:	6116                	flw	ft2,68(sp)
230057c6:	6186                	flw	ft3,64(sp)
230057c8:	7272                	flw	ft4,60(sp)
230057ca:	72e2                	flw	ft5,56(sp)
230057cc:	7352                	flw	ft6,52(sp)
230057ce:	73c2                	flw	ft7,48(sp)
230057d0:	7532                	flw	fa0,44(sp)
230057d2:	75a2                	flw	fa1,40(sp)
230057d4:	7612                	flw	fa2,36(sp)
230057d6:	7682                	flw	fa3,32(sp)
230057d8:	6772                	flw	fa4,28(sp)
230057da:	67e2                	flw	fa5,24(sp)
230057dc:	6852                	flw	fa6,20(sp)
230057de:	68c2                	flw	fa7,16(sp)
230057e0:	6e32                	flw	ft8,12(sp)
230057e2:	6ea2                	flw	ft9,8(sp)
230057e4:	6f12                	flw	ft10,4(sp)
230057e6:	6f82                	flw	ft11,0(sp)
230057e8:	6149                	addi	sp,sp,144
230057ea:	30200073          	mret
	...

23005800 <Trap_Handler_Stub>:
Trap_Handler_Stub():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/interrupt.c:142
23005800:	7175                	addi	sp,sp,-144
23005802:	c706                	sw	ra,140(sp)
23005804:	c516                	sw	t0,136(sp)
23005806:	c31a                	sw	t1,132(sp)
23005808:	c11e                	sw	t2,128(sp)
2300580a:	deaa                	sw	a0,124(sp)
2300580c:	dcae                	sw	a1,120(sp)
2300580e:	dab2                	sw	a2,116(sp)
23005810:	d8b6                	sw	a3,112(sp)
23005812:	d6ba                	sw	a4,108(sp)
23005814:	d4be                	sw	a5,104(sp)
23005816:	d2c2                	sw	a6,100(sp)
23005818:	d0c6                	sw	a7,96(sp)
2300581a:	cef2                	sw	t3,92(sp)
2300581c:	ccf6                	sw	t4,88(sp)
2300581e:	cafa                	sw	t5,84(sp)
23005820:	c8fe                	sw	t6,80(sp)
23005822:	e682                	fsw	ft0,76(sp)
23005824:	e486                	fsw	ft1,72(sp)
23005826:	e28a                	fsw	ft2,68(sp)
23005828:	e08e                	fsw	ft3,64(sp)
2300582a:	fe12                	fsw	ft4,60(sp)
2300582c:	fc16                	fsw	ft5,56(sp)
2300582e:	fa1a                	fsw	ft6,52(sp)
23005830:	f81e                	fsw	ft7,48(sp)
23005832:	f62a                	fsw	fa0,44(sp)
23005834:	f42e                	fsw	fa1,40(sp)
23005836:	f232                	fsw	fa2,36(sp)
23005838:	f036                	fsw	fa3,32(sp)
2300583a:	ee3a                	fsw	fa4,28(sp)
2300583c:	ec3e                	fsw	fa5,24(sp)
2300583e:	ea42                	fsw	fa6,20(sp)
23005840:	e846                	fsw	fa7,16(sp)
23005842:	e672                	fsw	ft8,12(sp)
23005844:	e476                	fsw	ft9,8(sp)
23005846:	e27a                	fsw	ft10,4(sp)
23005848:	e07e                	fsw	ft11,0(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/interrupt.c:143
2300584a:	2851                	jal	230058de <Trap_Handler>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/interrupt.c:144
2300584c:	40ba                	lw	ra,140(sp)
2300584e:	42aa                	lw	t0,136(sp)
23005850:	431a                	lw	t1,132(sp)
23005852:	438a                	lw	t2,128(sp)
23005854:	5576                	lw	a0,124(sp)
23005856:	55e6                	lw	a1,120(sp)
23005858:	5656                	lw	a2,116(sp)
2300585a:	56c6                	lw	a3,112(sp)
2300585c:	5736                	lw	a4,108(sp)
2300585e:	57a6                	lw	a5,104(sp)
23005860:	5816                	lw	a6,100(sp)
23005862:	5886                	lw	a7,96(sp)
23005864:	4e76                	lw	t3,92(sp)
23005866:	4ee6                	lw	t4,88(sp)
23005868:	4f56                	lw	t5,84(sp)
2300586a:	4fc6                	lw	t6,80(sp)
2300586c:	6036                	flw	ft0,76(sp)
2300586e:	60a6                	flw	ft1,72(sp)
23005870:	6116                	flw	ft2,68(sp)
23005872:	6186                	flw	ft3,64(sp)
23005874:	7272                	flw	ft4,60(sp)
23005876:	72e2                	flw	ft5,56(sp)
23005878:	7352                	flw	ft6,52(sp)
2300587a:	73c2                	flw	ft7,48(sp)
2300587c:	7532                	flw	fa0,44(sp)
2300587e:	75a2                	flw	fa1,40(sp)
23005880:	7612                	flw	fa2,36(sp)
23005882:	7682                	flw	fa3,32(sp)
23005884:	6772                	flw	fa4,28(sp)
23005886:	67e2                	flw	fa5,24(sp)
23005888:	6852                	flw	fa6,20(sp)
2300588a:	68c2                	flw	fa7,16(sp)
2300588c:	6e32                	flw	ft8,12(sp)
2300588e:	6ea2                	flw	ft9,8(sp)
23005890:	6f12                	flw	ft10,4(sp)
23005892:	6f82                	flw	ft11,0(sp)
23005894:	6149                	addi	sp,sp,144
23005896:	30200073          	mret
	...

230058bc <clic_enable_interrupt>:
clic_enable_interrupt():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/interrupt.c:151
230058bc:	028007b7          	lui	a5,0x2800
230058c0:	40078793          	addi	a5,a5,1024 # 2800400 <StackSize+0x2800000>
230058c4:	953e                	add	a0,a0,a5
230058c6:	4785                	li	a5,1
230058c8:	00f50023          	sb	a5,0(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/interrupt.c:152
230058cc:	8082                	ret

230058ce <clic_disable_interrupt>:
clic_disable_interrupt():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/interrupt.c:155
230058ce:	028007b7          	lui	a5,0x2800
230058d2:	40078793          	addi	a5,a5,1024 # 2800400 <StackSize+0x2800000>
230058d6:	953e                	add	a0,a0,a5
230058d8:	00050023          	sb	zero,0(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/RISCV/Device/Bouffalo/BL602/Startup/interrupt.c:156
230058dc:	8082                	ret

230058de <Trap_Handler>:
Trap_Handler():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:62
230058de:	23008537          	lui	a0,0x23008
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:57
230058e2:	1141                	addi	sp,sp,-16
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:62
230058e4:	dac50513          	addi	a0,a0,-596 # 23007dac <crc32Tab+0x4c0>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:57
230058e8:	c606                	sw	ra,12(sp)
230058ea:	c422                	sw	s0,8(sp)
230058ec:	c226                	sw	s1,4(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:62
230058ee:	384010ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:64
230058f2:	34202473          	csrr	s0,mcause
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:65
230058f6:	23008537          	lui	a0,0x23008
230058fa:	85a2                	mv	a1,s0
230058fc:	dbc50513          	addi	a0,a0,-580 # 23007dbc <crc32Tab+0x4d0>
23005900:	372010ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:66
23005904:	341024f3          	csrr	s1,mepc
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:67
23005908:	23008537          	lui	a0,0x23008
2300590c:	85a6                	mv	a1,s1
2300590e:	dcc50513          	addi	a0,a0,-564 # 23007dcc <crc32Tab+0x4e0>
23005912:	360010ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:68
23005916:	343025f3          	csrr	a1,mtval
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:69
2300591a:	23008537          	lui	a0,0x23008
2300591e:	dd850513          	addi	a0,a0,-552 # 23007dd8 <crc32Tab+0x4ec>
23005922:	350010ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:71
23005926:	3ff47593          	andi	a1,s0,1023
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:72
2300592a:	4795                	li	a5,5
2300592c:	06f58563          	beq	a1,a5,23005996 <Trap_Handler+0xb8>
23005930:	02b7e463          	bltu	a5,a1,23005958 <Trap_Handler+0x7a>
23005934:	4789                	li	a5,2
23005936:	06f58763          	beq	a1,a5,230059a4 <Trap_Handler+0xc6>
2300593a:	04b7f463          	bgeu	a5,a1,23005982 <Trap_Handler+0xa4>
2300593e:	478d                	li	a5,3
23005940:	06f58963          	beq	a1,a5,230059b2 <Trap_Handler+0xd4>
23005944:	4791                	li	a5,4
23005946:	06f59d63          	bne	a1,a5,230059c0 <Trap_Handler+0xe2>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:83
2300594a:	23008537          	lui	a0,0x23008
2300594e:	e2c50513          	addi	a0,a0,-468 # 23007e2c <crc32Tab+0x540>
23005952:	320010ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:110 (discriminator 1)
23005956:	a001                	j	23005956 <Trap_Handler+0x78>
23005958:	479d                	li	a5,7
2300595a:	06f58d63          	beq	a1,a5,230059d4 <Trap_Handler+0xf6>
2300595e:	08f5e263          	bltu	a1,a5,230059e2 <Trap_Handler+0x104>
23005962:	47a1                	li	a5,8
23005964:	08f58663          	beq	a1,a5,230059f0 <Trap_Handler+0x112>
23005968:	47a5                	li	a5,9
2300596a:	04f59b63          	bne	a1,a5,230059c0 <Trap_Handler+0xe2>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:100
2300596e:	23008537          	lui	a0,0x23008
23005972:	eb850513          	addi	a0,a0,-328 # 23007eb8 <crc32Tab+0x5cc>
23005976:	2fc010ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:101
2300597a:	0491                	addi	s1,s1,4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:102
2300597c:	34149073          	csrw	mepc,s1
23005980:	bfd9                	j	23005956 <Trap_Handler+0x78>
23005982:	4785                	li	a5,1
23005984:	02f59e63          	bne	a1,a5,230059c0 <Trap_Handler+0xe2>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:74
23005988:	23008537          	lui	a0,0x23008
2300598c:	de850513          	addi	a0,a0,-536 # 23007de8 <crc32Tab+0x4fc>
23005990:	2e2010ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:75
23005994:	b7c9                	j	23005956 <Trap_Handler+0x78>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:86
23005996:	23008537          	lui	a0,0x23008
2300599a:	e4850513          	addi	a0,a0,-440 # 23007e48 <crc32Tab+0x55c>
2300599e:	2d4010ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:87
230059a2:	bf55                	j	23005956 <Trap_Handler+0x78>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:77
230059a4:	23008537          	lui	a0,0x23008
230059a8:	e0450513          	addi	a0,a0,-508 # 23007e04 <crc32Tab+0x518>
230059ac:	2c6010ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:78
230059b0:	b75d                	j	23005956 <Trap_Handler+0x78>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:80
230059b2:	23008537          	lui	a0,0x23008
230059b6:	e1c50513          	addi	a0,a0,-484 # 23007e1c <crc32Tab+0x530>
230059ba:	2b8010ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:81
230059be:	bf61                	j	23005956 <Trap_Handler+0x78>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:105
230059c0:	23008537          	lui	a0,0x23008
230059c4:	ed850513          	addi	a0,a0,-296 # 23007ed8 <crc32Tab+0x5ec>
230059c8:	2aa010ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:106
230059cc:	0491                	addi	s1,s1,4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:107
230059ce:	34149073          	csrw	mepc,s1
230059d2:	b751                	j	23005956 <Trap_Handler+0x78>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:92
230059d4:	23008537          	lui	a0,0x23008
230059d8:	e7c50513          	addi	a0,a0,-388 # 23007e7c <crc32Tab+0x590>
230059dc:	296010ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:93
230059e0:	bf9d                	j	23005956 <Trap_Handler+0x78>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:89
230059e2:	23008537          	lui	a0,0x23008
230059e6:	e5c50513          	addi	a0,a0,-420 # 23007e5c <crc32Tab+0x570>
230059ea:	288010ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:90
230059ee:	b7a5                	j	23005956 <Trap_Handler+0x78>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:95
230059f0:	23008537          	lui	a0,0x23008
230059f4:	e9850513          	addi	a0,a0,-360 # 23007e98 <crc32Tab+0x5ac>
230059f8:	27a010ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:96
230059fc:	0491                	addi	s1,s1,4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:97
230059fe:	34149073          	csrw	mepc,s1
23005a02:	bf91                	j	23005956 <Trap_Handler+0x78>

23005a04 <Interrupt_Handler>:
Interrupt_Handler():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:121
23005a04:	1101                	addi	sp,sp,-32
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:124
23005a06:	c402                	sw	zero,8(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:121
23005a08:	ce06                	sw	ra,28(sp)
23005a0a:	cc22                	sw	s0,24(sp)
23005a0c:	ca26                	sw	s1,20(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:124
23005a0e:	c602                	sw	zero,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:128
23005a10:	341027f3          	csrr	a5,mepc
23005a14:	c43e                	sw	a5,8(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:129
23005a16:	342027f3          	csrr	a5,mcause
23005a1a:	c63e                	sw	a5,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:131
23005a1c:	47b2                	lw	a5,12(sp)
23005a1e:	0207d763          	bgez	a5,23005a4c <Interrupt_Handler+0x48>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:135
23005a22:	44b2                	lw	s1,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:136
23005a24:	04f00793          	li	a5,79
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:135
23005a28:	3ff4f413          	andi	s0,s1,1023
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:136
23005a2c:	0287ea63          	bltu	a5,s0,23005a60 <Interrupt_Handler+0x5c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:137
23005a30:	00241713          	slli	a4,s0,0x2
23005a34:	e9418793          	addi	a5,gp,-364 # 42021714 <__Interrupt_Handlers>
23005a38:	97ba                	add	a5,a5,a4
23005a3a:	0007a303          	lw	t1,0(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:138
23005a3e:	02030c63          	beqz	t1,23005a76 <Interrupt_Handler+0x72>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:151
23005a42:	4462                	lw	s0,24(sp)
23005a44:	40f2                	lw	ra,28(sp)
23005a46:	44d2                	lw	s1,20(sp)
23005a48:	6105                	addi	sp,sp,32
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:139
23005a4a:	8302                	jr	t1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:151
23005a4c:	4462                	lw	s0,24(sp)
23005a4e:	40f2                	lw	ra,28(sp)
23005a50:	44d2                	lw	s1,20(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:133
23005a52:	23008537          	lui	a0,0x23008
23005a56:	d2050513          	addi	a0,a0,-736 # 23007d20 <crc32Tab+0x434>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:151
23005a5a:	6105                	addi	sp,sp,32
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:133
23005a5c:	2160106f          	j	23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:148
23005a60:	85a2                	mv	a1,s0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:151
23005a62:	4462                	lw	s0,24(sp)
23005a64:	40f2                	lw	ra,28(sp)
23005a66:	44d2                	lw	s1,20(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:148
23005a68:	23008537          	lui	a0,0x23008
23005a6c:	d8c50513          	addi	a0,a0,-628 # 23007d8c <crc32Tab+0x4a0>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:151
23005a70:	6105                	addi	sp,sp,32
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:148
23005a72:	2000106f          	j	23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:141
23005a76:	23008537          	lui	a0,0x23008
23005a7a:	85a2                	mv	a1,s0
23005a7c:	d4050513          	addi	a0,a0,-704 # 23007d40 <crc32Tab+0x454>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:142
23005a80:	3f04f493          	andi	s1,s1,1008
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:141
23005a84:	1ee010ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:142
23005a88:	e091                	bnez	s1,23005a8c <Interrupt_Handler+0x88>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:145 (discriminator 1)
23005a8a:	a001                	j	23005a8a <Interrupt_Handler+0x86>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_common.c:143
23005a8c:	23008537          	lui	a0,0x23008
23005a90:	ff040593          	addi	a1,s0,-16
23005a94:	d6c50513          	addi	a0,a0,-660 # 23007d6c <crc32Tab+0x480>
23005a98:	1da010ef          	jal	ra,23006c72 <bflb_platform_printf>
23005a9c:	b7fd                	j	23005a8a <Interrupt_Handler+0x86>

23005a9e <UART_Init>:
UART_Init():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:203
23005a9e:	4198                	lw	a4,0(a1)
23005aa0:	0045a803          	lw	a6,4(a1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:193
23005aa4:	230086b7          	lui	a3,0x23008
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:203
23005aa8:	00271793          	slli	a5,a4,0x2
23005aac:	97ba                	add	a5,a5,a4
23005aae:	0786                	slli	a5,a5,0x1
23005ab0:	0307d7b3          	divu	a5,a5,a6
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:193
23005ab4:	050a                	slli	a0,a0,0x2
23005ab6:	ee868693          	addi	a3,a3,-280 # 23007ee8 <uartAddr>
23005aba:	96aa                	add	a3,a3,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:203
23005abc:	4529                	li	a0,10
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:193
23005abe:	4290                	lw	a2,0(a3)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:215
23005ac0:	00a5c683          	lbu	a3,10(a1)
23005ac4:	4885                	li	a7,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:203
23005ac6:	02a7f7b3          	remu	a5,a5,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:204
23005aca:	03075733          	divu	a4,a4,a6
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:205
23005ace:	0057b793          	sltiu	a5,a5,5
23005ad2:	8f1d                	sub	a4,a4,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:210
23005ad4:	01071793          	slli	a5,a4,0x10
23005ad8:	0742                	slli	a4,a4,0x10
23005ada:	8341                	srli	a4,a4,0x10
23005adc:	8f5d                	or	a4,a4,a5
23005ade:	c618                	sw	a4,8(a2)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:213
23005ae0:	4218                	lw	a4,0(a2)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:214
23005ae2:	4248                	lw	a0,4(a2)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:215
23005ae4:	0b168363          	beq	a3,a7,23005b8a <UART_Init+0xec>
23005ae8:	ced1                	beqz	a3,23005b84 <UART_Init+0xe6>
23005aea:	4789                	li	a5,2
23005aec:	00f69a63          	bne	a3,a5,23005b00 <UART_Init+0x62>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:229
23005af0:	fdf77713          	andi	a4,a4,-33
23005af4:	fdf57513          	andi	a0,a0,-33
23005af8:	01076713          	ori	a4,a4,16
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:231
23005afc:	01056513          	ori	a0,a0,16
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:238
23005b00:	0085c783          	lbu	a5,8(a1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:242
23005b04:	0095c683          	lbu	a3,9(a1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:238
23005b08:	8ff77713          	andi	a4,a4,-1793
23005b0c:	0791                	addi	a5,a5,4
23005b0e:	07a2                	slli	a5,a5,0x8
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:242
23005b10:	7875                	lui	a6,0xffffd
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:238
23005b12:	8f5d                	or	a4,a4,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:242
23005b14:	187d                	addi	a6,a6,-1
23005b16:	0685                	addi	a3,a3,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:245
23005b18:	00b5c883          	lbu	a7,11(a1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:242
23005b1c:	01077733          	and	a4,a4,a6
23005b20:	06b2                	slli	a3,a3,0xc
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:239
23005b22:	8ff57513          	andi	a0,a0,-1793
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:242
23005b26:	8f55                	or	a4,a4,a3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:245
23005b28:	4805                	li	a6,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:239
23005b2a:	8fc9                	or	a5,a5,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:248
23005b2c:	ffd77693          	andi	a3,a4,-3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:245
23005b30:	01089463          	bne	a7,a6,23005b38 <UART_Init+0x9a>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:246
23005b34:	00276693          	ori	a3,a4,2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:252
23005b38:	00c5c503          	lbu	a0,12(a1)
23005b3c:	4705                	li	a4,1
23005b3e:	02e50e63          	beq	a0,a4,23005b7a <UART_Init+0xdc>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:255
23005b42:	777d                	lui	a4,0xfffff
23005b44:	7ff70713          	addi	a4,a4,2047 # fffff7ff <__noinit_data_end__+0xbdfcceaf>
23005b48:	8ff9                	and	a5,a5,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:259
23005b4a:	00d5c803          	lbu	a6,13(a1)
23005b4e:	4505                	li	a0,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:262
23005b50:	ffd7f713          	andi	a4,a5,-3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:259
23005b54:	00a81463          	bne	a6,a0,23005b5c <UART_Init+0xbe>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:260
23005b58:	0027e713          	ori	a4,a5,2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:266
23005b5c:	c214                	sw	a3,0(a2)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:267
23005b5e:	c258                	sw	a4,4(a2)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:270
23005b60:	4658                	lw	a4,12(a2)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:271
23005b62:	00e5c583          	lbu	a1,14(a1)
23005b66:	4685                	li	a3,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:274
23005b68:	ffe77793          	andi	a5,a4,-2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:271
23005b6c:	00d59463          	bne	a1,a3,23005b74 <UART_Init+0xd6>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:272
23005b70:	00176793          	ori	a5,a4,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:276
23005b74:	c65c                	sw	a5,12(a2)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:283
23005b76:	4501                	li	a0,0
23005b78:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:253
23005b7a:	6705                	lui	a4,0x1
23005b7c:	80070713          	addi	a4,a4,-2048 # 800 <StackSize+0x400>
23005b80:	8fd9                	or	a5,a5,a4
23005b82:	b7e1                	j	23005b4a <UART_Init+0xac>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:218
23005b84:	9b3d                	andi	a4,a4,-17
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:219
23005b86:	993d                	andi	a0,a0,-17
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:220
23005b88:	bfa5                	j	23005b00 <UART_Init+0x62>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:223
23005b8a:	03076713          	ori	a4,a4,48
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:225
23005b8e:	03056513          	ori	a0,a0,48
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:226
23005b92:	b7bd                	j	23005b00 <UART_Init+0x62>

23005b94 <UART_FifoConfig>:
UART_FifoConfig():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:316
23005b94:	230087b7          	lui	a5,0x23008
23005b98:	050a                	slli	a0,a0,0x2
23005b9a:	ee878793          	addi	a5,a5,-280 # 23007ee8 <uartAddr>
23005b9e:	97aa                	add	a5,a5,a0
23005ba0:	4394                	lw	a3,0(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:324
23005ba2:	0005c783          	lbu	a5,0(a1)
23005ba6:	ffe10537          	lui	a0,0xffe10
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:322
23005baa:	0846a603          	lw	a2,132(a3)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:326
23005bae:	0015c703          	lbu	a4,1(a1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:324
23005bb2:	157d                	addi	a0,a0,-1
23005bb4:	17fd                	addi	a5,a5,-1
23005bb6:	8e69                	and	a2,a2,a0
23005bb8:	07c2                	slli	a5,a5,0x10
23005bba:	8fd1                	or	a5,a5,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:326
23005bbc:	e1000637          	lui	a2,0xe1000
23005bc0:	167d                	addi	a2,a2,-1
23005bc2:	177d                	addi	a4,a4,-1
23005bc4:	8ff1                	and	a5,a5,a2
23005bc6:	0762                	slli	a4,a4,0x18
23005bc8:	8fd9                	or	a5,a5,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:328
23005bca:	08f6a223          	sw	a5,132(a3)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:331
23005bce:	0806a703          	lw	a4,128(a3)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:332
23005bd2:	0025c503          	lbu	a0,2(a1)
23005bd6:	4605                	li	a2,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:335
23005bd8:	ffe77793          	andi	a5,a4,-2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:332
23005bdc:	00c51463          	bne	a0,a2,23005be4 <UART_FifoConfig+0x50>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:333
23005be0:	00176793          	ori	a5,a4,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:337
23005be4:	0035c583          	lbu	a1,3(a1)
23005be8:	4605                	li	a2,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:340
23005bea:	ffd7f713          	andi	a4,a5,-3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:337
23005bee:	00c59463          	bne	a1,a2,23005bf6 <UART_FifoConfig+0x62>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:338
23005bf2:	0027e713          	ori	a4,a5,2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:342
23005bf6:	08e6a023          	sw	a4,128(a3)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:345
23005bfa:	4501                	li	a0,0
23005bfc:	8082                	ret

23005bfe <UART_Enable>:
UART_Enable():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:413
23005bfe:	230087b7          	lui	a5,0x23008
23005c02:	050a                	slli	a0,a0,0x2
23005c04:	ee878793          	addi	a5,a5,-280 # 23007ee8 <uartAddr>
23005c08:	97aa                	add	a5,a5,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:419
23005c0a:	0fd5f713          	andi	a4,a1,253
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:413
23005c0e:	439c                	lw	a5,0(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:419
23005c10:	e709                	bnez	a4,23005c1a <UART_Enable+0x1c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:421
23005c12:	4398                	lw	a4,0(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:422
23005c14:	00176713          	ori	a4,a4,1
23005c18:	c398                	sw	a4,0(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:425
23005c1a:	15fd                	addi	a1,a1,-1
23005c1c:	0ff5f593          	andi	a1,a1,255
23005c20:	4705                	li	a4,1
23005c22:	00b76663          	bltu	a4,a1,23005c2e <UART_Enable+0x30>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:427
23005c26:	43d8                	lw	a4,4(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:428
23005c28:	00176713          	ori	a4,a4,1
23005c2c:	c3d8                	sw	a4,4(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:432
23005c2e:	4501                	li	a0,0
23005c30:	8082                	ret

23005c32 <UART_Disable>:
UART_Disable():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:446
23005c32:	230087b7          	lui	a5,0x23008
23005c36:	050a                	slli	a0,a0,0x2
23005c38:	ee878793          	addi	a5,a5,-280 # 23007ee8 <uartAddr>
23005c3c:	97aa                	add	a5,a5,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:452
23005c3e:	0fd5f713          	andi	a4,a1,253
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:446
23005c42:	439c                	lw	a5,0(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:452
23005c44:	e701                	bnez	a4,23005c4c <UART_Disable+0x1a>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:454
23005c46:	4398                	lw	a4,0(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:455
23005c48:	9b79                	andi	a4,a4,-2
23005c4a:	c398                	sw	a4,0(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:458
23005c4c:	15fd                	addi	a1,a1,-1
23005c4e:	0ff5f593          	andi	a1,a1,255
23005c52:	4705                	li	a4,1
23005c54:	00b76563          	bltu	a4,a1,23005c5e <UART_Disable+0x2c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:460
23005c58:	43d8                	lw	a4,4(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:461
23005c5a:	9b79                	andi	a4,a4,-2
23005c5c:	c3d8                	sw	a4,4(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:465
23005c5e:	4501                	li	a0,0
23005c60:	8082                	ret

23005c62 <UART_SetRxTimeoutValue>:
UART_SetRxTimeoutValue():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:528
23005c62:	230087b7          	lui	a5,0x23008
23005c66:	050a                	slli	a0,a0,0x2
23005c68:	ee878793          	addi	a5,a5,-280 # 23007ee8 <uartAddr>
23005c6c:	97aa                	add	a5,a5,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:535
23005c6e:	4398                	lw	a4,0(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:536
23005c70:	15fd                	addi	a1,a1,-1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:540
23005c72:	4501                	li	a0,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:535
23005c74:	4f1c                	lw	a5,24(a4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:536
23005c76:	f007f793          	andi	a5,a5,-256
23005c7a:	8ddd                	or	a1,a1,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:537
23005c7c:	cf0c                	sw	a1,24(a4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:540
23005c7e:	8082                	ret

23005c80 <UART_TxFreeRun>:
UART_TxFreeRun():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:651
23005c80:	230087b7          	lui	a5,0x23008
23005c84:	050a                	slli	a0,a0,0x2
23005c86:	ee878793          	addi	a5,a5,-280 # 23007ee8 <uartAddr>
23005c8a:	97aa                	add	a5,a5,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:657
23005c8c:	4398                	lw	a4,0(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:658
23005c8e:	4685                	li	a3,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:657
23005c90:	431c                	lw	a5,0(a4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:658
23005c92:	00d58663          	beq	a1,a3,23005c9e <UART_TxFreeRun+0x1e>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:661
23005c96:	9bed                	andi	a5,a5,-5
23005c98:	c31c                	sw	a5,0(a4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:665
23005c9a:	4501                	li	a0,0
23005c9c:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:659
23005c9e:	0047e793          	ori	a5,a5,4
23005ca2:	c31c                	sw	a5,0(a4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:665
23005ca4:	4501                	li	a0,0
23005ca6:	8082                	ret

23005ca8 <UART_IntMask>:
UART_IntMask():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:754
23005ca8:	230087b7          	lui	a5,0x23008
23005cac:	050a                	slli	a0,a0,0x2
23005cae:	ee878793          	addi	a5,a5,-280 # 23007ee8 <uartAddr>
23005cb2:	97aa                	add	a5,a5,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:761
23005cb4:	4398                	lw	a4,0(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:764
23005cb6:	47a1                	li	a5,8
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:761
23005cb8:	5354                	lw	a3,36(a4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:764
23005cba:	02f58263          	beq	a1,a5,23005cde <UART_IntMask+0x36>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:771
23005cbe:	4505                	li	a0,1
23005cc0:	00b515b3          	sll	a1,a0,a1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:774
23005cc4:	fff5c793          	not	a5,a1
23005cc8:	8ff5                	and	a5,a5,a3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:771
23005cca:	00a60563          	beq	a2,a0,23005cd4 <UART_IntMask+0x2c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:779
23005cce:	d35c                	sw	a5,36(a4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:782
23005cd0:	4501                	li	a0,0
23005cd2:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:772
23005cd4:	00d5e7b3          	or	a5,a1,a3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:779
23005cd8:	d35c                	sw	a5,36(a4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:782
23005cda:	4501                	li	a0,0
23005cdc:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:765
23005cde:	4585                	li	a1,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:768
23005ce0:	4781                	li	a5,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:765
23005ce2:	feb616e3          	bne	a2,a1,23005cce <UART_IntMask+0x26>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:766
23005ce6:	0ff6e793          	ori	a5,a3,255
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:779
23005cea:	d35c                	sw	a5,36(a4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:782
23005cec:	4501                	li	a0,0
23005cee:	8082                	ret

23005cf0 <UART_Int_Callback_Install>:
UART_Int_Callback_Install():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:836
23005cf0:	4501                	li	a0,0
23005cf2:	8082                	ret

23005cf4 <UART_SendData>:
UART_SendData():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:851
23005cf4:	230087b7          	lui	a5,0x23008
23005cf8:	050a                	slli	a0,a0,0x2
23005cfa:	ee878793          	addi	a5,a5,-280 # 23007ee8 <uartAddr>
23005cfe:	953e                	add	a0,a0,a5
23005d00:	00052883          	lw	a7,0(a0) # ffe10000 <__noinit_data_end__+0xbdddd6b0>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:858
23005d04:	ca1d                	beqz	a2,23005d3a <UART_SendData+0x46>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:852
23005d06:	00027737          	lui	a4,0x27
23005d0a:	08488813          	addi	a6,a7,132
23005d0e:	10070713          	addi	a4,a4,256 # 27100 <StackSize+0x26d00>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:850
23005d12:	4681                	li	a3,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:861
23005d14:	00027337          	lui	t1,0x27
UART_GetTxFifoCount():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:976
23005d18:	00082783          	lw	a5,0(a6) # ffffd000 <__noinit_data_end__+0xbdfca6b0>
UART_SendData():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:860
23005d1c:	00d58533          	add	a0,a1,a3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:863
23005d20:	177d                	addi	a4,a4,-1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:859
23005d22:	03f7f793          	andi	a5,a5,63
23005d26:	cf81                	beqz	a5,23005d3e <UART_SendData+0x4a>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:860
23005d28:	00054783          	lbu	a5,0(a0)
23005d2c:	0685                	addi	a3,a3,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:861
23005d2e:	10030713          	addi	a4,t1,256 # 27100 <StackSize+0x26d00>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:860
23005d32:	08f88423          	sb	a5,136(a7)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:858
23005d36:	fec6e1e3          	bltu	a3,a2,23005d18 <UART_SendData+0x24>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:870
23005d3a:	4501                	li	a0,0
23005d3c:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:864
23005d3e:	ff65                	bnez	a4,23005d36 <UART_SendData+0x42>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:865
23005d40:	4509                	li	a0,2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:871
23005d42:	8082                	ret

23005d44 <UART_ReceiveData>:
UART_ReceiveData():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:923
23005d44:	230087b7          	lui	a5,0x23008
23005d48:	050a                	slli	a0,a0,0x2
23005d4a:	ee878793          	addi	a5,a5,-280 # 23007ee8 <uartAddr>
23005d4e:	953e                	add	a0,a0,a5
23005d50:	4114                	lw	a3,0(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:929
23005d52:	ce15                	beqz	a2,23005d8e <UART_ReceiveData+0x4a>
UART_GetRxFifoCount():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:994
23005d54:	0846a783          	lw	a5,132(a3)
23005d58:	08468813          	addi	a6,a3,132
23005d5c:	83a1                	srli	a5,a5,0x8
UART_ReceiveData():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:929
23005d5e:	03f7f793          	andi	a5,a5,63
23005d62:	c795                	beqz	a5,23005d8e <UART_ReceiveData+0x4a>
23005d64:	08c68693          	addi	a3,a3,140
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:922
23005d68:	4501                	li	a0,0
23005d6a:	a039                	j	23005d78 <UART_ReceiveData+0x34>
UART_GetRxFifoCount():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:994
23005d6c:	00082783          	lw	a5,0(a6)
23005d70:	83a1                	srli	a5,a5,0x8
UART_ReceiveData():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:929
23005d72:	03f7f793          	andi	a5,a5,63
23005d76:	cb99                	beqz	a5,23005d8c <UART_ReceiveData+0x48>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:930
23005d78:	0006c703          	lbu	a4,0(a3)
23005d7c:	0505                	addi	a0,a0,1
23005d7e:	00a587b3          	add	a5,a1,a0
23005d82:	fee78fa3          	sb	a4,-1(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:929
23005d86:	fea613e3          	bne	a2,a0,23005d6c <UART_ReceiveData+0x28>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:934
23005d8a:	8082                	ret
23005d8c:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:922
23005d8e:	4501                	li	a0,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:934
23005d90:	8082                	ret

23005d92 <UART_GetRxFifoCount>:
UART_GetRxFifoCount():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:989
23005d92:	230087b7          	lui	a5,0x23008
23005d96:	050a                	slli	a0,a0,0x2
23005d98:	ee878793          	addi	a5,a5,-280 # 23007ee8 <uartAddr>
23005d9c:	97aa                	add	a5,a5,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:994
23005d9e:	439c                	lw	a5,0(a5)
23005da0:	0847a503          	lw	a0,132(a5)
23005da4:	8121                	srli	a0,a0,0x8
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_uart.c:995
23005da6:	03f57513          	andi	a0,a0,63
23005daa:	8082                	ret

23005dac <GLB_Set_UART_CLK>:
GLB_Set_UART_CLK():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:593
23005dac:	1141                	addi	sp,sp,-16
23005dae:	c422                	sw	s0,8(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:600
23005db0:	40000437          	lui	s0,0x40000
23005db4:	441c                	lw	a5,8(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:593
23005db6:	c226                	sw	s1,4(sp)
23005db8:	c606                	sw	ra,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:601
23005dba:	9bbd                	andi	a5,a5,-17
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:602
23005dbc:	c41c                	sw	a5,8(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:605
23005dbe:	441c                	lw	a5,8(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:593
23005dc0:	84aa                	mv	s1,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:610
23005dc2:	852e                	mv	a0,a1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:606
23005dc4:	9be1                	andi	a5,a5,-8
23005dc6:	8e5d                	or	a2,a2,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:607
23005dc8:	c410                	sw	a2,8(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:610
23005dca:	2cbd                	jal	23006048 <HBN_Set_UART_CLK_Sel>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:613
23005dcc:	4418                	lw	a4,8(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:615
23005dce:	01076793          	ori	a5,a4,16
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:614
23005dd2:	e099                	bnez	s1,23005dd8 <GLB_Set_UART_CLK+0x2c>
23005dd4:	fef77793          	andi	a5,a4,-17
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:622
23005dd8:	40b2                	lw	ra,12(sp)
23005dda:	4422                	lw	s0,8(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:619
23005ddc:	40000737          	lui	a4,0x40000
23005de0:	c71c                	sw	a5,8(a4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:622
23005de2:	4492                	lw	s1,4(sp)
23005de4:	4501                	li	a0,0
23005de6:	0141                	addi	sp,sp,16
23005de8:	8082                	ret

23005dea <GLB_AHB_Slave1_Reset>:
GLB_AHB_Slave1_Reset():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:871
23005dea:	400007b7          	lui	a5,0x40000
23005dee:	4bd4                	lw	a3,20(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:872
23005df0:	4705                	li	a4,1
23005df2:	00a71533          	sll	a0,a4,a0
23005df6:	fff54713          	not	a4,a0
23005dfa:	8ef9                	and	a3,a3,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:873
23005dfc:	cbd4                	sw	a3,20(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:874
23005dfe:	0001                	nop
23005e00:	0001                	nop
23005e02:	0001                	nop
23005e04:	0001                	nop
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:875
23005e06:	4bd4                	lw	a3,20(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:876
23005e08:	8d55                	or	a0,a0,a3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:877
23005e0a:	cbc8                	sw	a0,20(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:878
23005e0c:	0001                	nop
23005e0e:	0001                	nop
23005e10:	0001                	nop
23005e12:	0001                	nop
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:879
23005e14:	4bd4                	lw	a3,20(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:884
23005e16:	4501                	li	a0,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:880
23005e18:	8f75                	and	a4,a4,a3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:881
23005e1a:	cbd8                	sw	a4,20(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:884
23005e1c:	8082                	ret

23005e1e <GLB_Set_EM_Sel>:
GLB_Set_EM_Sel():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:1245
23005e1e:	40000737          	lui	a4,0x40000
23005e22:	5f7c                	lw	a5,124(a4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:1246
23005e24:	9bc1                	andi	a5,a5,-16
23005e26:	8d5d                	or	a0,a0,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:1247
23005e28:	df68                	sw	a0,124(a4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:1250
23005e2a:	4501                	li	a0,0
23005e2c:	8082                	ret

23005e2e <GLB_UART_Sig_Swap_Set>:
GLB_UART_Sig_Swap_Set():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:1266
23005e2e:	400006b7          	lui	a3,0x40000
23005e32:	0806a783          	lw	a5,128(a3) # 40000080 <__ram_load_addr+0x1cff6718>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:1267
23005e36:	f9000737          	lui	a4,0xf9000
23005e3a:	177d                	addi	a4,a4,-1
23005e3c:	8ff9                	and	a5,a5,a4
23005e3e:	0562                	slli	a0,a0,0x18
23005e40:	8d5d                	or	a0,a0,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:1268
23005e42:	08a6a023          	sw	a0,128(a3)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:1271
23005e46:	4501                	li	a0,0
23005e48:	8082                	ret

23005e4a <GLB_JTAG_Sig_Swap_Set>:
GLB_JTAG_Sig_Swap_Set():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:1287
23005e4a:	400006b7          	lui	a3,0x40000
23005e4e:	0806a703          	lw	a4,128(a3) # 40000080 <__ram_load_addr+0x1cff6718>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:1288
23005e52:	00251793          	slli	a5,a0,0x2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:1292
23005e56:	4501                	li	a0,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:1288
23005e58:	f0377713          	andi	a4,a4,-253
23005e5c:	8fd9                	or	a5,a5,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:1289
23005e5e:	08f6a023          	sw	a5,128(a3)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:1292
23005e62:	8082                	ret

23005e64 <GLB_Set_MTimer_CLK>:
GLB_Set_MTimer_CLK():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:1440
23005e64:	40000737          	lui	a4,0x40000
23005e68:	09072683          	lw	a3,144(a4) # 40000090 <__ram_load_addr+0x1cff6728>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:1441
23005e6c:	fffc07b7          	lui	a5,0xfffc0
23005e70:	17fd                	addi	a5,a5,-1
23005e72:	8efd                	and	a3,a3,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:1442
23005e74:	08d72823          	sw	a3,144(a4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:1444
23005e78:	09072683          	lw	a3,144(a4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:1445
23005e7c:	fff80837          	lui	a6,0xfff80
23005e80:	187d                	addi	a6,a6,-1
23005e82:	0106f6b3          	and	a3,a3,a6
23005e86:	05ce                	slli	a1,a1,0x13
23005e88:	8dd5                	or	a1,a1,a3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:1446
23005e8a:	7681                	lui	a3,0xfffe0
23005e8c:	8df5                	and	a1,a1,a3
23005e8e:	8e4d                	or	a2,a2,a1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:1447
23005e90:	08c72823          	sw	a2,144(a4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:1449
23005e94:	09072703          	lw	a4,144(a4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:1453
23005e98:	8ff9                	and	a5,a5,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:1450
23005e9a:	c501                	beqz	a0,23005ea2 <GLB_Set_MTimer_CLK+0x3e>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:1451
23005e9c:	000407b7          	lui	a5,0x40
23005ea0:	8fd9                	or	a5,a5,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:1455
23005ea2:	40000737          	lui	a4,0x40000
23005ea6:	08f72823          	sw	a5,144(a4) # 40000090 <__ram_load_addr+0x1cff6728>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:1458
23005eaa:	4501                	li	a0,0
23005eac:	8082                	ret

23005eae <GLB_UART_Fun_Sel>:
GLB_UART_Fun_Sel():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:1732
23005eae:	40000737          	lui	a4,0x40000
23005eb2:	0c072683          	lw	a3,192(a4) # 400000c0 <__ram_load_addr+0x1cff6758>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:1733
23005eb6:	050a                	slli	a0,a0,0x2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:1735
23005eb8:	47bd                	li	a5,15
23005eba:	00a797b3          	sll	a5,a5,a0
23005ebe:	fff7c793          	not	a5,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:1737
23005ec2:	00a59533          	sll	a0,a1,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:1735
23005ec6:	8ff5                	and	a5,a5,a3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:1737
23005ec8:	8fc9                	or	a5,a5,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:1738
23005eca:	0cf72023          	sw	a5,192(a4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_glb.c:1741
23005ece:	4501                	li	a0,0
23005ed0:	8082                	ret

23005ed2 <EF_Ctrl_Read_Secure_Boot>:
EF_Ctrl_Read_Secure_Boot():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:481
23005ed2:	1141                	addi	sp,sp,-16
23005ed4:	c422                	sw	s0,8(sp)
23005ed6:	c226                	sw	s1,4(sp)
23005ed8:	c606                	sw	ra,12(sp)
23005eda:	84aa                	mv	s1,a0
23005edc:	842e                	mv	s0,a1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:486
23005ede:	ff00a097          	auipc	ra,0xff00a
23005ee2:	504080e7          	jalr	1284(ra) # 220103e2 <EF_Ctrl_Load_Efuse_R0>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:488
23005ee6:	400077b7          	lui	a5,0x40007
23005eea:	4394                	lw	a3,0(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:490
23005eec:	0026d713          	srli	a4,a3,0x2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:491
23005ef0:	8b05                	andi	a4,a4,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:493
23005ef2:	0076d793          	srli	a5,a3,0x7
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:491
23005ef6:	00e48023          	sb	a4,0(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:493
23005efa:	8b85                	andi	a5,a5,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:495
23005efc:	0036f613          	andi	a2,a3,3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:494
23005f00:	e391                	bnez	a5,23005f04 <EF_Ctrl_Read_Secure_Boot+0x32>
23005f02:	4601                	li	a2,0
23005f04:	00c40023          	sb	a2,0(s0) # 40000000 <__ram_load_addr+0x1cff6698>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:499
23005f08:	40b2                	lw	ra,12(sp)
23005f0a:	4422                	lw	s0,8(sp)
23005f0c:	4492                	lw	s1,4(sp)
23005f0e:	0141                	addi	sp,sp,16
23005f10:	8082                	ret

23005f12 <EF_Ctrl_Read_Sw_Usage>:
EF_Ctrl_Read_Sw_Usage():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:702
23005f12:	1141                	addi	sp,sp,-16
23005f14:	c422                	sw	s0,8(sp)
23005f16:	842a                	mv	s0,a0
23005f18:	c606                	sw	ra,12(sp)
23005f1a:	c226                	sw	s1,4(sp)
23005f1c:	84ae                	mv	s1,a1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:704
23005f1e:	ff00a097          	auipc	ra,0xff00a
23005f22:	4b0080e7          	jalr	1200(ra) # 220103ce <EF_Ctrl_Sw_AHB_Clk_0>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:706
23005f26:	ff00a097          	auipc	ra,0xff00a
23005f2a:	4bc080e7          	jalr	1212(ra) # 220103e2 <EF_Ctrl_Load_Efuse_R0>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:708
23005f2e:	e409                	bnez	s0,23005f38 <EF_Ctrl_Read_Sw_Usage+0x26>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:709
23005f30:	400077b7          	lui	a5,0x40007
23005f34:	4b9c                	lw	a5,16(a5)
23005f36:	c09c                	sw	a5,0(s1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:711
23005f38:	40b2                	lw	ra,12(sp)
23005f3a:	4422                	lw	s0,8(sp)
23005f3c:	4492                	lw	s1,4(sp)
23005f3e:	0141                	addi	sp,sp,16
23005f40:	8082                	ret

23005f42 <EF_Ctrl_Read_MAC_Address>:
EF_Ctrl_Read_MAC_Address():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:799
23005f42:	1141                	addi	sp,sp,-16
23005f44:	c422                	sw	s0,8(sp)
23005f46:	c606                	sw	ra,12(sp)
23005f48:	842a                	mv	s0,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:807
23005f4a:	ff00a097          	auipc	ra,0xff00a
23005f4e:	498080e7          	jalr	1176(ra) # 220103e2 <EF_Ctrl_Load_Efuse_R0>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:809
23005f52:	40007737          	lui	a4,0x40007
23005f56:	4b5c                	lw	a5,20(a4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:810
23005f58:	00140813          	addi	a6,s0,1
23005f5c:	00640313          	addi	t1,s0,6
23005f60:	0ff7fe13          	andi	t3,a5,255
23005f64:	0087d613          	srli	a2,a5,0x8
23005f68:	0107d693          	srli	a3,a5,0x10
23005f6c:	83e1                	srli	a5,a5,0x18
23005f6e:	00c400a3          	sb	a2,1(s0)
23005f72:	00f401a3          	sb	a5,3(s0)
23005f76:	01c40023          	sb	t3,0(s0)
23005f7a:	00d40123          	sb	a3,2(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:812
23005f7e:	01872883          	lw	a7,24(a4) # 40007018 <__ram_load_addr+0x1cffd6b0>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:814
23005f82:	8672                	mv	a2,t3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:804
23005f84:	4501                	li	a0,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:814
23005f86:	0088d793          	srli	a5,a7,0x8
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:813
23005f8a:	01140223          	sb	a7,4(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:814
23005f8e:	00f402a3          	sb	a5,5(s0)
EF_Ctrl_Get_Byte_Zero_Cnt():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:782
23005f92:	45a1                	li	a1,8
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:780 (discriminator 3)
23005f94:	4681                	li	a3,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:782 (discriminator 3)
23005f96:	4701                	li	a4,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:783
23005f98:	40e657b3          	sra	a5,a2,a4
23005f9c:	8b85                	andi	a5,a5,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:784
23005f9e:	0017b793          	seqz	a5,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:782
23005fa2:	0705                	addi	a4,a4,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:784
23005fa4:	96be                	add	a3,a3,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:782
23005fa6:	feb719e3          	bne	a4,a1,23005f98 <EF_Ctrl_Read_MAC_Address+0x56>
EF_Ctrl_Read_MAC_Address():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:818
23005faa:	9536                	add	a0,a0,a3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:817
23005fac:	00680663          	beq	a6,t1,23005fb8 <EF_Ctrl_Read_MAC_Address+0x76>
23005fb0:	00084603          	lbu	a2,0(a6) # fff80000 <__noinit_data_end__+0xbdf4d6b0>
23005fb4:	0805                	addi	a6,a6,1
23005fb6:	bff9                	j	23005f94 <EF_Ctrl_Read_MAC_Address+0x52>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:820
23005fb8:	0108d793          	srli	a5,a7,0x10
23005fbc:	8d3d                	xor	a0,a0,a5
23005fbe:	03f57793          	andi	a5,a0,63
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:829
23005fc2:	4505                	li	a0,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:820
23005fc4:	eb85                	bnez	a5,23005ff4 <EF_Ctrl_Read_MAC_Address+0xb2>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:824
23005fc6:	00544583          	lbu	a1,5(s0)
23005fca:	00144683          	lbu	a3,1(s0)
23005fce:	00444603          	lbu	a2,4(s0)
23005fd2:	00244783          	lbu	a5,2(s0)
23005fd6:	00344703          	lbu	a4,3(s0)
23005fda:	00b40023          	sb	a1,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:825
23005fde:	01c402a3          	sb	t3,5(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:824
23005fe2:	00c400a3          	sb	a2,1(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:825
23005fe6:	00d40223          	sb	a3,4(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:824
23005fea:	00e40123          	sb	a4,2(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:825
23005fee:	00f401a3          	sb	a5,3(s0)
23005ff2:	4501                	li	a0,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:831
23005ff4:	40b2                	lw	ra,12(sp)
23005ff6:	4422                	lw	s0,8(sp)
23005ff8:	0141                	addi	sp,sp,16
23005ffa:	8082                	ret

23005ffc <EF_Ctrl_Read_Chip_ID>:
EF_Ctrl_Read_Chip_ID():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:1108
23005ffc:	00050323          	sb	zero,6(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:1109
23006000:	000503a3          	sb	zero,7(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:1110
23006004:	f3fff06f          	j	23005f42 <EF_Ctrl_Read_MAC_Address>

23006008 <EF_Ctrl_Read_AES_Key>:
EF_Ctrl_Read_AES_Key():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:1476
23006008:	4795                	li	a5,5
2300600a:	00a7f363          	bgeu	a5,a0,23006010 <EF_Ctrl_Read_AES_Key+0x8>
2300600e:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:1473
23006010:	1141                	addi	sp,sp,-16
23006012:	c422                	sw	s0,8(sp)
23006014:	c226                	sw	s1,4(sp)
23006016:	c04a                	sw	s2,0(sp)
23006018:	c606                	sw	ra,12(sp)
2300601a:	84ae                	mv	s1,a1
2300601c:	8932                	mv	s2,a2
2300601e:	842a                	mv	s0,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:1480
23006020:	ff00a097          	auipc	ra,0xff00a
23006024:	3c2080e7          	jalr	962(ra) # 220103e2 <EF_Ctrl_Load_Efuse_R0>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:1483
23006028:	400075b7          	lui	a1,0x40007
2300602c:	0412                	slli	s0,s0,0x4
2300602e:	05f1                	addi	a1,a1,28
23006030:	95a2                	add	a1,a1,s0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:1484
23006032:	4422                	lw	s0,8(sp)
23006034:	40b2                	lw	ra,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:1483
23006036:	864a                	mv	a2,s2
23006038:	8526                	mv	a0,s1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:1484
2300603a:	4902                	lw	s2,0(sp)
2300603c:	4492                	lw	s1,4(sp)
2300603e:	0141                	addi	sp,sp,16
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_ef_ctrl.c:1483
23006040:	ff00a317          	auipc	t1,0xff00a
23006044:	35c30067          	jr	860(t1) # 2201039c <BL602_MemCpy4>

23006048 <HBN_Set_UART_CLK_Sel>:
HBN_Set_UART_CLK_Sel():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_hbn.c:749
23006048:	4000f6b7          	lui	a3,0x4000f
2300604c:	5a98                	lw	a4,48(a3)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_hbn.c:750
2300604e:	00251793          	slli	a5,a0,0x2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_hbn.c:754
23006052:	4501                	li	a0,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_hbn.c:750
23006054:	9b6d                	andi	a4,a4,-5
23006056:	8fd9                	or	a5,a5,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_hbn.c:751
23006058:	da9c                	sw	a5,48(a3)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_hbn.c:754
2300605a:	8082                	ret

2300605c <HBN_Get_Status_Flag>:
HBN_Get_Status_Flag():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_hbn.c:1007
2300605c:	4000f7b7          	lui	a5,0x4000f
23006060:	1007a503          	lw	a0,256(a5) # 4000f100 <__ram_load_addr+0x1d005798>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_hbn.c:1008
23006064:	8082                	ret

23006066 <HBN_Set_BOR_Cfg>:
HBN_Set_BOR_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_hbn.c:1559
23006066:	00154783          	lbu	a5,1(a0)
2300606a:	c3b9                	beqz	a5,230060b0 <HBN_Set_BOR_Cfg+0x4a>
HBN_Enable_BOR_IRQ():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_hbn.c:1428
2300606c:	4000f737          	lui	a4,0x4000f
23006070:	4b5c                	lw	a5,20(a4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_hbn.c:1429
23006072:	000406b7          	lui	a3,0x40
23006076:	8fd5                	or	a5,a5,a3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_hbn.c:1430
23006078:	cb5c                	sw	a5,20(a4)
HBN_Set_BOR_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_hbn.c:1565
2300607a:	4000f7b7          	lui	a5,0x4000f
2300607e:	57d8                	lw	a4,44(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_hbn.c:1567
23006080:	00254783          	lbu	a5,2(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_hbn.c:1568
23006084:	00354683          	lbu	a3,3(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_hbn.c:1567
23006088:	9b75                	andi	a4,a4,-3
2300608a:	0786                	slli	a5,a5,0x1
2300608c:	8fd9                	or	a5,a5,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_hbn.c:1571
2300608e:	ffe7f713          	andi	a4,a5,-2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_hbn.c:1568
23006092:	c299                	beqz	a3,23006098 <HBN_Set_BOR_Cfg+0x32>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_hbn.c:1569
23006094:	0017e713          	ori	a4,a5,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_hbn.c:1574
23006098:	00054683          	lbu	a3,0(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_hbn.c:1577
2300609c:	ffb77793          	andi	a5,a4,-5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_hbn.c:1574
230060a0:	c299                	beqz	a3,230060a6 <HBN_Set_BOR_Cfg+0x40>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_hbn.c:1575
230060a2:	00476793          	ori	a5,a4,4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_hbn.c:1580
230060a6:	4000f737          	lui	a4,0x4000f
230060aa:	d75c                	sw	a5,44(a4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_hbn.c:1583
230060ac:	4501                	li	a0,0
230060ae:	8082                	ret
HBN_Disable_BOR_IRQ():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_hbn.c:1447
230060b0:	4000f6b7          	lui	a3,0x4000f
230060b4:	4adc                	lw	a5,20(a3)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_hbn.c:1448
230060b6:	fffc0737          	lui	a4,0xfffc0
230060ba:	177d                	addi	a4,a4,-1
230060bc:	8ff9                	and	a5,a5,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_hbn.c:1449
230060be:	cadc                	sw	a5,20(a3)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_hbn.c:1451
230060c0:	bf6d                	j	2300607a <HBN_Set_BOR_Cfg+0x14>

230060c2 <Sec_Eng_SHA256_Update.part.0>:
Sec_Eng_SHA256_Update():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:265
230060c2:	1101                	addi	sp,sp,-32
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:278
230060c4:	400047b7          	lui	a5,0x40004
230060c8:	00f42737          	lui	a4,0xf42
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:265
230060cc:	cc22                	sw	s0,24(sp)
230060ce:	ca26                	sw	s1,20(sp)
230060d0:	c84a                	sw	s2,16(sp)
230060d2:	c452                	sw	s4,8(sp)
230060d4:	ce06                	sw	ra,28(sp)
230060d6:	c64e                	sw	s3,12(sp)
230060d8:	c256                	sw	s5,4(sp)
230060da:	c05a                	sw	s6,0(sp)
230060dc:	892a                	mv	s2,a0
230060de:	8a2e                	mv	s4,a1
230060e0:	84b2                	mv	s1,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:278
230060e2:	4380                	lw	s0,0(a5)
230060e4:	3ff70713          	addi	a4,a4,1023 # f423ff <StackSize+0xf41fff>
230060e8:	400046b7          	lui	a3,0x40004
230060ec:	a021                	j	230060f4 <Sec_Eng_SHA256_Update.part.0+0x32>
230060ee:	4280                	lw	s0,0(a3)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:280
230060f0:	14070863          	beqz	a4,23006240 <Sec_Eng_SHA256_Update.part.0+0x17e>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:283
230060f4:	00147793          	andi	a5,s0,1
230060f8:	177d                	addi	a4,a4,-1
230060fa:	fbf5                	bnez	a5,230060ee <Sec_Eng_SHA256_Update.part.0+0x2c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:288
230060fc:	00092983          	lw	s3,0(s2)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:286
23006100:	01094a83          	lbu	s5,16(s2)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:291
23006104:	009987b3          	add	a5,s3,s1
23006108:	00f92023          	sw	a5,0(s2)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:288
2300610c:	03f9f993          	andi	s3,s3,63
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:294
23006110:	0097f763          	bgeu	a5,s1,2300611e <Sec_Eng_SHA256_Update.part.0+0x5c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:295
23006114:	00492783          	lw	a5,4(s2)
23006118:	0785                	addi	a5,a5,1
2300611a:	00f92223          	sw	a5,4(s2)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:298
2300611e:	0a098f63          	beqz	s3,230061dc <Sec_Eng_SHA256_Update.part.0+0x11a>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:289
23006122:	04000b13          	li	s6,64
23006126:	413b0b33          	sub	s6,s6,s3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:317
2300612a:	8626                	mv	a2,s1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:298
2300612c:	0764f463          	bgeu	s1,s6,23006194 <Sec_Eng_SHA256_Update.part.0+0xd2>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:345
23006130:	ca05                	beqz	a2,23006160 <Sec_Eng_SHA256_Update.part.0+0x9e>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:349
23006132:	400047b7          	lui	a5,0x40004
23006136:	00f42737          	lui	a4,0xf42
2300613a:	439c                	lw	a5,0(a5)
2300613c:	3ff70713          	addi	a4,a4,1023 # f423ff <StackSize+0xf41fff>
23006140:	400046b7          	lui	a3,0x40004
23006144:	a019                	j	2300614a <Sec_Eng_SHA256_Update.part.0+0x88>
23006146:	429c                	lw	a5,0(a3)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:351
23006148:	cf65                	beqz	a4,23006240 <Sec_Eng_SHA256_Update.part.0+0x17e>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:354
2300614a:	8b85                	andi	a5,a5,1
2300614c:	177d                	addi	a4,a4,-1
2300614e:	ffe5                	bnez	a5,23006146 <Sec_Eng_SHA256_Update.part.0+0x84>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:357
23006150:	00892503          	lw	a0,8(s2)
23006154:	85d2                	mv	a1,s4
23006156:	954e                	add	a0,a0,s3
23006158:	ff00a097          	auipc	ra,0xff00a
2300615c:	24e080e7          	jalr	590(ra) # 220103a6 <BL602_MemCpy_Fast>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:363
23006160:	400047b7          	lui	a5,0x40004
23006164:	00f42737          	lui	a4,0xf42
23006168:	439c                	lw	a5,0(a5)
2300616a:	3ff70713          	addi	a4,a4,1023 # f423ff <StackSize+0xf41fff>
2300616e:	400046b7          	lui	a3,0x40004
23006172:	a019                	j	23006178 <Sec_Eng_SHA256_Update.part.0+0xb6>
23006174:	429c                	lw	a5,0(a3)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:365
23006176:	c769                	beqz	a4,23006240 <Sec_Eng_SHA256_Update.part.0+0x17e>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:368
23006178:	8b85                	andi	a5,a5,1
2300617a:	177d                	addi	a4,a4,-1
2300617c:	ffe5                	bnez	a5,23006174 <Sec_Eng_SHA256_Update.part.0+0xb2>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:370
2300617e:	4501                	li	a0,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:371
23006180:	40f2                	lw	ra,28(sp)
23006182:	4462                	lw	s0,24(sp)
23006184:	44d2                	lw	s1,20(sp)
23006186:	4942                	lw	s2,16(sp)
23006188:	49b2                	lw	s3,12(sp)
2300618a:	4a22                	lw	s4,8(sp)
2300618c:	4a92                	lw	s5,4(sp)
2300618e:	4b02                	lw	s6,0(sp)
23006190:	6105                	addi	sp,sp,32
23006192:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:299
23006194:	00892503          	lw	a0,8(s2)
23006198:	85d2                	mv	a1,s4
2300619a:	865a                	mv	a2,s6
2300619c:	954e                	add	a0,a0,s3
2300619e:	ff00a097          	auipc	ra,0xff00a
230061a2:	208080e7          	jalr	520(ra) # 220103a6 <BL602_MemCpy_Fast>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:286
230061a6:	006a9793          	slli	a5,s5,0x6
230061aa:	fbf47413          	andi	s0,s0,-65
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:301
230061ae:	00892603          	lw	a2,8(s2)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:286
230061b2:	8c5d                	or	s0,s0,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:304
230061b4:	01041793          	slli	a5,s0,0x10
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:301
230061b8:	400046b7          	lui	a3,0x40004
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:304
230061bc:	6741                	lui	a4,0x10
230061be:	83c1                	srli	a5,a5,0x10
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:301
230061c0:	c2d0                	sw	a2,4(a3)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:304
230061c2:	00e7e633          	or	a2,a5,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:307
230061c6:	0709                	addi	a4,a4,2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:305
230061c8:	c290                	sw	a2,0(a3)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:307
230061ca:	8fd9                	or	a5,a5,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:308
230061cc:	c29c                	sw	a5,0(a3)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:310
230061ce:	fc048493          	addi	s1,s1,-64
230061d2:	4785                	li	a5,1
230061d4:	00f90823          	sb	a5,16(s2)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:311
230061d8:	9a5a                	add	s4,s4,s6
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:312
230061da:	94ce                	add	s1,s1,s3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:318
230061dc:	03f00793          	li	a5,63
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:317
230061e0:	03f4f613          	andi	a2,s1,63
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:318
230061e4:	0497fc63          	bgeu	a5,s1,2300623c <Sec_Eng_SHA256_Update.part.0+0x17a>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:322
230061e8:	400047b7          	lui	a5,0x40004
230061ec:	00f42737          	lui	a4,0xf42
230061f0:	4394                	lw	a3,0(a5)
230061f2:	3ff70713          	addi	a4,a4,1023 # f423ff <StackSize+0xf41fff>
230061f6:	400045b7          	lui	a1,0x40004
230061fa:	a019                	j	23006200 <Sec_Eng_SHA256_Update.part.0+0x13e>
230061fc:	4194                	lw	a3,0(a1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:324
230061fe:	c329                	beqz	a4,23006240 <Sec_Eng_SHA256_Update.part.0+0x17e>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:327
23006200:	0016f793          	andi	a5,a3,1
23006204:	177d                	addi	a4,a4,-1
23006206:	fbfd                	bnez	a5,230061fc <Sec_Eng_SHA256_Update.part.0+0x13a>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:330
23006208:	01094703          	lbu	a4,16(s2)
2300620c:	fbf6f693          	andi	a3,a3,-65
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:316
23006210:	0064d793          	srli	a5,s1,0x6
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:330
23006214:	071a                	slli	a4,a4,0x6
23006216:	8ed9                	or	a3,a3,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:335
23006218:	06c2                	slli	a3,a3,0x10
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:333
2300621a:	40004737          	lui	a4,0x40004
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:335
2300621e:	82c1                	srli	a3,a3,0x10
23006220:	07c2                	slli	a5,a5,0x10
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:333
23006222:	01472223          	sw	s4,4(a4) # 40004004 <__ram_load_addr+0x1cffa69c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:335
23006226:	8fd5                	or	a5,a5,a3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:336
23006228:	c31c                	sw	a5,0(a4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:338
2300622a:	0027e793          	ori	a5,a5,2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:339
2300622e:	c31c                	sw	a5,0(a4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:341
23006230:	fc04f493          	andi	s1,s1,-64
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:342
23006234:	4785                	li	a5,1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:341
23006236:	9a26                	add	s4,s4,s1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:342
23006238:	00f90823          	sb	a5,16(s2)
2300623c:	4981                	li	s3,0
2300623e:	bdcd                	j	23006130 <Sec_Eng_SHA256_Update.part.0+0x6e>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:281
23006240:	4509                	li	a0,2
23006242:	bf3d                	j	23006180 <Sec_Eng_SHA256_Update.part.0+0xbe>

23006244 <Sec_Eng_PKA_LMUL.part.4>:
Sec_Eng_PKA_Clear_Int():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1581
23006244:	400047b7          	lui	a5,0x40004
23006248:	3007a703          	lw	a4,768(a5) # 40004300 <__ram_load_addr+0x1cffa998>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1582
2300624c:	20076713          	ori	a4,a4,512
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1584
23006250:	30e7a023          	sw	a4,768(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1586
23006254:	3007a703          	lw	a4,768(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1587
23006258:	dff77713          	andi	a4,a4,-513
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1588
2300625c:	30e7a023          	sw	a4,768(a5)
Sec_Eng_PKA_MREM():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:2184
23006260:	8082                	ret

23006262 <Sec_Eng_SHA256_Init>:
Sec_Eng_SHA256_Init():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:214
23006262:	40004837          	lui	a6,0x40004
23006266:	00082783          	lw	a5,0(a6) # 40004000 <__ram_load_addr+0x1cffa698>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:205
2300626a:	1141                	addi	sp,sp,-16
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:215
2300626c:	060a                	slli	a2,a2,0x2
2300626e:	9b8d                	andi	a5,a5,-29
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:205
23006270:	c606                	sw	ra,12(sp)
23006272:	c422                	sw	s0,8(sp)
23006274:	c226                	sw	s1,4(sp)
23006276:	c04a                	sw	s2,0(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:215
23006278:	8fd1                	or	a5,a5,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:219
2300627a:	4581                	li	a1,0
2300627c:	4651                	li	a2,20
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:216
2300627e:	00f82023          	sw	a5,0(a6)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:205
23006282:	842a                	mv	s0,a0
23006284:	84ba                	mv	s1,a4
23006286:	8936                	mv	s2,a3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:219
23006288:	91bfc0ef          	jal	ra,23002ba2 <memset>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:224
2300628c:	04000613          	li	a2,64
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:222
23006290:	01242423          	sw	s2,8(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:223
23006294:	c444                	sw	s1,12(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:224
23006296:	4581                	li	a1,0
23006298:	8526                	mv	a0,s1
2300629a:	ff00a097          	auipc	ra,0xff00a
2300629e:	116080e7          	jalr	278(ra) # 220103b0 <BL602_MemSet>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:225
230062a2:	4448                	lw	a0,12(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:226
230062a4:	4422                	lw	s0,8(sp)
230062a6:	40b2                	lw	ra,12(sp)
230062a8:	4492                	lw	s1,4(sp)
230062aa:	4902                	lw	s2,0(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:225
230062ac:	4605                	li	a2,1
230062ae:	08000593          	li	a1,128
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:226
230062b2:	0141                	addi	sp,sp,16
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:225
230062b4:	ff00a317          	auipc	t1,0xff00a
230062b8:	0fc30067          	jr	252(t1) # 220103b0 <BL602_MemSet>

230062bc <Sec_Eng_SHA_Start>:
Sec_Eng_SHA_Start():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:245
230062bc:	40004737          	lui	a4,0x40004
230062c0:	431c                	lw	a5,0(a4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:249
230062c2:	fbf7f793          	andi	a5,a5,-65
230062c6:	0207e793          	ori	a5,a5,32
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:251
230062ca:	c31c                	sw	a5,0(a4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:252
230062cc:	8082                	ret

230062ce <Sec_Eng_SHA256_Update>:
Sec_Eng_SHA256_Update():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:266
230062ce:	85b2                	mv	a1,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:273
230062d0:	c681                	beqz	a3,230062d8 <Sec_Eng_SHA256_Update+0xa>
230062d2:	8636                	mv	a2,a3
230062d4:	defff06f          	j	230060c2 <Sec_Eng_SHA256_Update.part.0>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:371
230062d8:	4501                	li	a0,0
230062da:	8082                	ret

230062dc <Sec_Eng_SHA256_Finish>:
Sec_Eng_SHA256_Finish():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:399
230062dc:	400047b7          	lui	a5,0x40004
230062e0:	00f42737          	lui	a4,0xf42
230062e4:	439c                	lw	a5,0(a5)
230062e6:	3ff70713          	addi	a4,a4,1023 # f423ff <StackSize+0xf41fff>
230062ea:	400046b7          	lui	a3,0x40004
230062ee:	a021                	j	230062f6 <Sec_Eng_SHA256_Finish+0x1a>
230062f0:	429c                	lw	a5,0(a3)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:401
230062f2:	1e070863          	beqz	a4,230064e2 <Sec_Eng_SHA256_Finish+0x206>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:404
230062f6:	8b85                	andi	a5,a5,1
230062f8:	177d                	addi	a4,a4,-1
230062fa:	fbfd                	bnez	a5,230062f0 <Sec_Eng_SHA256_Finish+0x14>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:406
230062fc:	4118                	lw	a4,0(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:407
230062fe:	415c                	lw	a5,4(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:384
23006300:	1101                	addi	sp,sp,-32
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:406
23006302:	01d75693          	srli	a3,a4,0x1d
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:407
23006306:	078e                	slli	a5,a5,0x3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:406
23006308:	8fd5                	or	a5,a5,a3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:408
2300630a:	00371693          	slli	a3,a4,0x3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:410
2300630e:	01079313          	slli	t1,a5,0x10
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:411
23006312:	01069893          	slli	a7,a3,0x10
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:410
23006316:	01035313          	srli	t1,t1,0x10
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:411
2300631a:	0108d893          	srli	a7,a7,0x10
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:410
2300631e:	00879813          	slli	a6,a5,0x8
23006322:	00835313          	srli	t1,t1,0x8
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:411
23006326:	00b71593          	slli	a1,a4,0xb
2300632a:	0088d893          	srli	a7,a7,0x8
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:410
2300632e:	0187de93          	srli	t4,a5,0x18
23006332:	00686833          	or	a6,a6,t1
23006336:	83c1                	srli	a5,a5,0x10
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:411
23006338:	0186d313          	srli	t1,a3,0x18
2300633c:	0115e5b3          	or	a1,a1,a7
23006340:	82c1                	srli	a3,a3,0x10
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:384
23006342:	ce06                	sw	ra,28(sp)
23006344:	cc22                	sw	s0,24(sp)
23006346:	ca26                	sw	s1,20(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:414
23006348:	03700e13          	li	t3,55
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:410
2300634c:	01d10423          	sb	t4,8(sp)
23006350:	00f104a3          	sb	a5,9(sp)
23006354:	01011523          	sh	a6,10(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:411
23006358:	00610623          	sb	t1,12(sp)
2300635c:	00d106a3          	sb	a3,13(sp)
23006360:	00b11723          	sh	a1,14(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:413
23006364:	03f77713          	andi	a4,a4,63
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:414
23006368:	16ee7863          	bgeu	t3,a4,230064d8 <Sec_Eng_SHA256_Finish+0x1fc>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:414 (discriminator 2)
2300636c:	07800793          	li	a5,120
23006370:	40e78733          	sub	a4,a5,a4
Sec_Eng_SHA256_Update():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:273 (discriminator 4)
23006374:	454c                	lw	a1,12(a0)
23006376:	8432                	mv	s0,a2
23006378:	863a                	mv	a2,a4
2300637a:	84aa                	mv	s1,a0
2300637c:	d47ff0ef          	jal	ra,230060c2 <Sec_Eng_SHA256_Update.part.0>
Sec_Eng_SHA256_Finish():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:421 (discriminator 4)
23006380:	400047b7          	lui	a5,0x40004
23006384:	00f42737          	lui	a4,0xf42
23006388:	439c                	lw	a5,0(a5)
2300638a:	3ff70713          	addi	a4,a4,1023 # f423ff <StackSize+0xf41fff>
2300638e:	400046b7          	lui	a3,0x40004
23006392:	a021                	j	2300639a <Sec_Eng_SHA256_Finish+0xbe>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:421
23006394:	429c                	lw	a5,0(a3)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:423
23006396:	16070863          	beqz	a4,23006506 <Sec_Eng_SHA256_Finish+0x22a>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:426
2300639a:	8b85                	andi	a5,a5,1
2300639c:	177d                	addi	a4,a4,-1
2300639e:	fbfd                	bnez	a5,23006394 <Sec_Eng_SHA256_Finish+0xb8>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:428
230063a0:	44c8                	lw	a0,12(s1)
230063a2:	4621                	li	a2,8
230063a4:	002c                	addi	a1,sp,8
230063a6:	ff00a097          	auipc	ra,0xff00a
230063aa:	000080e7          	jalr	ra # 220103a6 <BL602_MemCpy_Fast>
Sec_Eng_SHA256_Update():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:273
230063ae:	44cc                	lw	a1,12(s1)
230063b0:	4621                	li	a2,8
230063b2:	8526                	mv	a0,s1
230063b4:	d0fff0ef          	jal	ra,230060c2 <Sec_Eng_SHA256_Update.part.0>
Sec_Eng_SHA256_Finish():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:434
230063b8:	400047b7          	lui	a5,0x40004
230063bc:	00f42737          	lui	a4,0xf42
230063c0:	439c                	lw	a5,0(a5)
230063c2:	3ff70713          	addi	a4,a4,1023 # f423ff <StackSize+0xf41fff>
230063c6:	400046b7          	lui	a3,0x40004
230063ca:	a021                	j	230063d2 <Sec_Eng_SHA256_Finish+0xf6>
230063cc:	429c                	lw	a5,0(a3)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:436
230063ce:	12070c63          	beqz	a4,23006506 <Sec_Eng_SHA256_Finish+0x22a>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:439
230063d2:	8b85                	andi	a5,a5,1
230063d4:	177d                	addi	a4,a4,-1
230063d6:	fbfd                	bnez	a5,230063cc <Sec_Eng_SHA256_Finish+0xf0>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:441
230063d8:	400047b7          	lui	a5,0x40004
230063dc:	4398                	lw	a4,0(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:444
230063de:	4b94                	lw	a3,16(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:442
230063e0:	8309                	srli	a4,a4,0x2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:445
230063e2:	0086d513          	srli	a0,a3,0x8
230063e6:	0106d593          	srli	a1,a3,0x10
230063ea:	0186d613          	srli	a2,a3,0x18
230063ee:	00a400a3          	sb	a0,1(s0)
230063f2:	00b40123          	sb	a1,2(s0)
230063f6:	00c401a3          	sb	a2,3(s0)
230063fa:	00d40023          	sb	a3,0(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:446
230063fe:	4bd4                	lw	a3,20(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:442
23006400:	0ff77713          	andi	a4,a4,255
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:454
23006404:	00677613          	andi	a2,a4,6
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:447
23006408:	0086d813          	srli	a6,a3,0x8
2300640c:	0106d513          	srli	a0,a3,0x10
23006410:	0186d593          	srli	a1,a3,0x18
23006414:	010402a3          	sb	a6,5(s0)
23006418:	00a40323          	sb	a0,6(s0)
2300641c:	00b403a3          	sb	a1,7(s0)
23006420:	00d40223          	sb	a3,4(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:448
23006424:	4f94                	lw	a3,24(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:449
23006426:	0086d813          	srli	a6,a3,0x8
2300642a:	0106d513          	srli	a0,a3,0x10
2300642e:	0186d593          	srli	a1,a3,0x18
23006432:	010404a3          	sb	a6,9(s0)
23006436:	00a40523          	sb	a0,10(s0)
2300643a:	00b405a3          	sb	a1,11(s0)
2300643e:	00d40423          	sb	a3,8(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:450
23006442:	4fd4                	lw	a3,28(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:451
23006444:	0086d813          	srli	a6,a3,0x8
23006448:	0106d513          	srli	a0,a3,0x10
2300644c:	0186d593          	srli	a1,a3,0x18
23006450:	010406a3          	sb	a6,13(s0)
23006454:	00a40723          	sb	a0,14(s0)
23006458:	00b407a3          	sb	a1,15(s0)
2300645c:	00d40623          	sb	a3,12(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:452
23006460:	5394                	lw	a3,32(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:453
23006462:	0086d813          	srli	a6,a3,0x8
23006466:	0106d513          	srli	a0,a3,0x10
2300646a:	0186d593          	srli	a1,a3,0x18
2300646e:	00d40823          	sb	a3,16(s0)
23006472:	010408a3          	sb	a6,17(s0)
23006476:	00a40923          	sb	a0,18(s0)
2300647a:	00b409a3          	sb	a1,19(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:454
2300647e:	e229                	bnez	a2,230064c0 <Sec_Eng_SHA256_Finish+0x1e4>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:455
23006480:	53d4                	lw	a3,36(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:459
23006482:	8b1d                	andi	a4,a4,7
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:456
23006484:	0086d513          	srli	a0,a3,0x8
23006488:	0106d593          	srli	a1,a3,0x10
2300648c:	0186d613          	srli	a2,a3,0x18
23006490:	00a40aa3          	sb	a0,21(s0)
23006494:	00b40b23          	sb	a1,22(s0)
23006498:	00c40ba3          	sb	a2,23(s0)
2300649c:	00d40a23          	sb	a3,20(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:457
230064a0:	5794                	lw	a3,40(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:458
230064a2:	0086d513          	srli	a0,a3,0x8
230064a6:	0106d593          	srli	a1,a3,0x10
230064aa:	0186d613          	srli	a2,a3,0x18
230064ae:	00d40c23          	sb	a3,24(s0)
230064b2:	00a40ca3          	sb	a0,25(s0)
230064b6:	00b40d23          	sb	a1,26(s0)
230064ba:	00c40da3          	sb	a2,27(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:459
230064be:	c705                	beqz	a4,230064e6 <Sec_Eng_SHA256_Finish+0x20a>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:466
230064c0:	40004737          	lui	a4,0x40004
230064c4:	431c                	lw	a5,0(a4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:471
230064c6:	4501                	li	a0,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:468
230064c8:	f9f7f793          	andi	a5,a5,-97
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:469
230064cc:	c31c                	sw	a5,0(a4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:472
230064ce:	40f2                	lw	ra,28(sp)
230064d0:	4462                	lw	s0,24(sp)
230064d2:	44d2                	lw	s1,20(sp)
230064d4:	6105                	addi	sp,sp,32
230064d6:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:414 (discriminator 1)
230064d8:	03800793          	li	a5,56
230064dc:	40e78733          	sub	a4,a5,a4
230064e0:	bd51                	j	23006374 <Sec_Eng_SHA256_Finish+0x98>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:402
230064e2:	4509                	li	a0,2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:472
230064e4:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:460
230064e6:	57dc                	lw	a5,44(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:461
230064e8:	0087d613          	srli	a2,a5,0x8
230064ec:	0107d693          	srli	a3,a5,0x10
230064f0:	0187d713          	srli	a4,a5,0x18
230064f4:	00f40e23          	sb	a5,28(s0)
230064f8:	00c40ea3          	sb	a2,29(s0)
230064fc:	00d40f23          	sb	a3,30(s0)
23006500:	00e40fa3          	sb	a4,31(s0)
23006504:	bf75                	j	230064c0 <Sec_Eng_SHA256_Finish+0x1e4>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:402
23006506:	4509                	li	a0,2
23006508:	b7d9                	j	230064ce <Sec_Eng_SHA256_Finish+0x1f2>

2300650a <Sec_Eng_Trng_Enable>:
Sec_Eng_Trng_Enable():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1293
2300650a:	400047b7          	lui	a5,0x40004
2300650e:	2007a703          	lw	a4,512(a5) # 40004200 <__ram_load_addr+0x1cffa898>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1299
23006512:	00476693          	ori	a3,a4,4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1300
23006516:	20d7a023          	sw	a3,512(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1301
2300651a:	20476713          	ori	a4,a4,516
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1302
2300651e:	20e7a023          	sw	a4,512(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1304
23006522:	0001                	nop
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1305
23006524:	0001                	nop
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1306
23006526:	0001                	nop
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1307
23006528:	0001                	nop
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1309
2300652a:	00f42737          	lui	a4,0xf42
2300652e:	2007a683          	lw	a3,512(a5)
23006532:	3ff70713          	addi	a4,a4,1023 # f423ff <StackSize+0xf41fff>
23006536:	40004637          	lui	a2,0x40004
2300653a:	a021                	j	23006542 <Sec_Eng_Trng_Enable+0x38>
2300653c:	20062683          	lw	a3,512(a2) # 40004200 <__ram_load_addr+0x1cffa898>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1311
23006540:	cf09                	beqz	a4,2300655a <Sec_Eng_Trng_Enable+0x50>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1314
23006542:	0016f793          	andi	a5,a3,1
23006546:	177d                	addi	a4,a4,-1
23006548:	fbf5                	bnez	a5,2300653c <Sec_Eng_Trng_Enable+0x32>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1316
2300654a:	2006e693          	ori	a3,a3,512
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1317
2300654e:	400047b7          	lui	a5,0x40004
23006552:	20d7a023          	sw	a3,512(a5) # 40004200 <__ram_load_addr+0x1cffa898>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1319
23006556:	4501                	li	a0,0
23006558:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1312
2300655a:	4509                	li	a0,2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1320
2300655c:	8082                	ret

2300655e <Sec_Eng_Trng_Disable>:
Sec_Eng_Trng_Disable():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1506
2300655e:	40004737          	lui	a4,0x40004
23006562:	20072783          	lw	a5,512(a4) # 40004200 <__ram_load_addr+0x1cffa898>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1508
23006566:	9bed                	andi	a5,a5,-5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1510
23006568:	2007e793          	ori	a5,a5,512
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1512
2300656c:	20f72023          	sw	a5,512(a4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1513
23006570:	8082                	ret

23006572 <Sec_Eng_PKA_Reset>:
Sec_Eng_PKA_Reset():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1528
23006572:	400047b7          	lui	a5,0x40004
23006576:	3007a023          	sw	zero,768(a5) # 40004300 <__ram_load_addr+0x1cffa998>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1532
2300657a:	4721                	li	a4,8
2300657c:	30e7a023          	sw	a4,768(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1533
23006580:	8082                	ret

23006582 <Sec_Eng_PKA_BigEndian_Enable>:
Sec_Eng_PKA_BigEndian_Enable():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1547
23006582:	40004737          	lui	a4,0x40004
23006586:	30072783          	lw	a5,768(a4) # 40004300 <__ram_load_addr+0x1cffa998>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1548
2300658a:	6685                	lui	a3,0x1
2300658c:	8fd5                	or	a5,a5,a3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1549
2300658e:	30f72023          	sw	a5,768(a4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1550
23006592:	8082                	ret

23006594 <Sec_Eng_PKA_Write_Data>:
Sec_Eng_PKA_Write_Data():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1929
23006594:	fff50813          	addi	a6,a0,-1
23006598:	6785                	lui	a5,0x1
2300659a:	fff78893          	addi	a7,a5,-1 # fff <StackSize+0xbff>
2300659e:	0ff87813          	andi	a6,a6,255
230065a2:	4325                	li	t1,9
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1601
230065a4:	0116f7b3          	and	a5,a3,a7
230065a8:	893d                	andi	a0,a0,15
230065aa:	8b05                	andi	a4,a4,1
230065ac:	03037463          	bgeu	t1,a6,230065d4 <Sec_Eng_PKA_Write_Data+0x40>
Sec_Eng_PKA_Write_Pld_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1644
230065b0:	0117f6b3          	and	a3,a5,a7
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1645
230065b4:	06d2                	slli	a3,a3,0x14
230065b6:	05b2                	slli	a1,a1,0xc
230065b8:	82d1                	srli	a3,a3,0x14
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1646
230065ba:	0552                	slli	a0,a0,0x14
230065bc:	8ecd                	or	a3,a3,a1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1647
230065be:	8ec9                	or	a3,a3,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1648
230065c0:	390007b7          	lui	a5,0x39000
230065c4:	077e                	slli	a4,a4,0x1f
230065c6:	8fd5                	or	a5,a5,a3
230065c8:	8fd9                	or	a5,a5,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1650
230065ca:	40004737          	lui	a4,0x40004
230065ce:	34f72023          	sw	a5,832(a4) # 40004340 <__ram_load_addr+0x1cffa9d8>
Sec_Eng_PKA_Write_Data():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1945
230065d2:	8082                	ret
Sec_Eng_PKA_Write_Pld_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1644
230065d4:	0117f7b3          	and	a5,a5,a7
230065d8:	230088b7          	lui	a7,0x23008
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1645
230065dc:	07d2                	slli	a5,a5,0x14
230065de:	0806                	slli	a6,a6,0x1
230065e0:	ef088893          	addi	a7,a7,-272 # 23007ef0 <CSWTCH.116>
230065e4:	05b2                	slli	a1,a1,0xc
230065e6:	9846                	add	a6,a6,a7
230065e8:	83d1                	srli	a5,a5,0x14
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1646
230065ea:	0552                	slli	a0,a0,0x14
230065ec:	8fcd                	or	a5,a5,a1
230065ee:	00085583          	lhu	a1,0(a6)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1647
230065f2:	8fc9                	or	a5,a5,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1648
230065f4:	39000537          	lui	a0,0x39000
230065f8:	077e                	slli	a4,a4,0x1f
230065fa:	8fc9                	or	a5,a5,a0
230065fc:	8fd9                	or	a5,a5,a4
Sec_Eng_PKA_Write_Data():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1935
230065fe:	0025d713          	srli	a4,a1,0x2
Sec_Eng_PKA_Write_Pld_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1650
23006602:	400045b7          	lui	a1,0x40004
23006606:	34f5a023          	sw	a5,832(a1) # 40004340 <__ram_load_addr+0x1cffa9d8>
Sec_Eng_PKA_Write_Data():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1935
2300660a:	883a                	mv	a6,a4
2300660c:	04e6e363          	bltu	a3,a4,23006652 <Sec_Eng_PKA_Write_Data+0xbe>
23006610:	0842                	slli	a6,a6,0x10
23006612:	01085813          	srli	a6,a6,0x10
Sec_Eng_PKA_Write_Block():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1880
23006616:	ffc87793          	andi	a5,a6,-4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1882
2300661a:	cf89                	beqz	a5,23006634 <Sec_Eng_PKA_Write_Data+0xa0>
2300661c:	00279593          	slli	a1,a5,0x2
23006620:	8732                	mv	a4,a2
23006622:	95b2                	add	a1,a1,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1883
23006624:	40004537          	lui	a0,0x40004
23006628:	4314                	lw	a3,0(a4)
2300662a:	0711                	addi	a4,a4,4
2300662c:	34d52023          	sw	a3,832(a0) # 40004340 <__ram_load_addr+0x1cffa9d8>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1882
23006630:	fee59ce3          	bne	a1,a4,23006628 <Sec_Eng_PKA_Write_Data+0x94>
Sec_Eng_PKA_Write_Data():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1940
23006634:	f907dfe3          	bge	a5,a6,230065d2 <Sec_Eng_PKA_Write_Data+0x3e>
23006638:	078a                	slli	a5,a5,0x2
2300663a:	080a                	slli	a6,a6,0x2
2300663c:	97b2                	add	a5,a5,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1942
2300663e:	400046b7          	lui	a3,0x40004
23006642:	9642                	add	a2,a2,a6
23006644:	4398                	lw	a4,0(a5)
23006646:	0791                	addi	a5,a5,4
23006648:	34e6a023          	sw	a4,832(a3) # 40004340 <__ram_load_addr+0x1cffa9d8>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1940
2300664c:	fef61ce3          	bne	a2,a5,23006644 <Sec_Eng_PKA_Write_Data+0xb0>
23006650:	8082                	ret
23006652:	8836                	mv	a6,a3
23006654:	bf75                	j	23006610 <Sec_Eng_PKA_Write_Data+0x7c>

23006656 <Sec_Eng_PKA_Read_Data>:
Sec_Eng_PKA_Read_Data():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1601
23006656:	fff50793          	addi	a5,a0,-1
2300665a:	0ff7f793          	andi	a5,a5,255
2300665e:	4825                	li	a6,9
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1959
23006660:	4701                	li	a4,0
23006662:	00f86b63          	bltu	a6,a5,23006678 <Sec_Eng_PKA_Read_Data+0x22>
23006666:	23008737          	lui	a4,0x23008
2300666a:	ef070713          	addi	a4,a4,-272 # 23007ef0 <CSWTCH.116>
2300666e:	0786                	slli	a5,a5,0x1
23006670:	97ba                	add	a5,a5,a4
23006672:	0007d703          	lhu	a4,0(a5) # 39000000 <__ram_load_addr+0x15ff6698>
23006676:	8309                	srli	a4,a4,0x2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1964
23006678:	00d77363          	bgeu	a4,a3,2300667e <Sec_Eng_PKA_Read_Data+0x28>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1974
2300667c:	8082                	ret
Sec_Eng_PKA_Write_Pld_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1645
2300667e:	05b2                	slli	a1,a1,0xc
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1646
23006680:	893d                	andi	a0,a0,15
23006682:	0552                	slli	a0,a0,0x14
23006684:	8dd5                	or	a1,a1,a3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1647
23006686:	b8000737          	lui	a4,0xb8000
2300668a:	8dc9                	or	a1,a1,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1650
2300668c:	400047b7          	lui	a5,0x40004
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1647
23006690:	8dd9                	or	a1,a1,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1650
23006692:	34b7a023          	sw	a1,832(a5) # 40004340 <__ram_load_addr+0x1cffa9d8>
Sec_Eng_PKA_Read_Data():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1971
23006696:	3407a023          	sw	zero,832(a5)
Sec_Eng_PKA_Wait_ISR():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1759
2300669a:	00f42737          	lui	a4,0xf42
2300669e:	3007a783          	lw	a5,768(a5)
230066a2:	3ff70713          	addi	a4,a4,1023 # f423ff <StackSize+0xf41fff>
230066a6:	400045b7          	lui	a1,0x40004
230066aa:	a021                	j	230066b2 <Sec_Eng_PKA_Read_Data+0x5c>
230066ac:	3005a783          	lw	a5,768(a1) # 40004300 <__ram_load_addr+0x1cffa998>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1761
230066b0:	c709                	beqz	a4,230066ba <Sec_Eng_PKA_Read_Data+0x64>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1764
230066b2:	1007f793          	andi	a5,a5,256
230066b6:	177d                	addi	a4,a4,-1
230066b8:	dbf5                	beqz	a5,230066ac <Sec_Eng_PKA_Read_Data+0x56>
Sec_Eng_PKA_Clear_Int():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1581
230066ba:	40004537          	lui	a0,0x40004
230066be:	30052703          	lw	a4,768(a0) # 40004300 <__ram_load_addr+0x1cffa998>
Sec_Eng_PKA_Read_Block():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1820
230066c2:	ffc6f793          	andi	a5,a3,-4
230066c6:	00279593          	slli	a1,a5,0x2
Sec_Eng_PKA_Clear_Int():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1582
230066ca:	20076713          	ori	a4,a4,512
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1584
230066ce:	30e52023          	sw	a4,768(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1586
230066d2:	30052803          	lw	a6,768(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1587
230066d6:	8732                	mv	a4,a2
230066d8:	95b2                	add	a1,a1,a2
230066da:	dff87813          	andi	a6,a6,-513
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1588
230066de:	31052023          	sw	a6,768(a0)
Sec_Eng_PKA_Read_Block():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1824
230066e2:	40004837          	lui	a6,0x40004
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1823
230066e6:	cb81                	beqz	a5,230066f6 <Sec_Eng_PKA_Read_Data+0xa0>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1824
230066e8:	34082503          	lw	a0,832(a6) # 40004340 <__ram_load_addr+0x1cffa9d8>
230066ec:	0711                	addi	a4,a4,4
230066ee:	fea72e23          	sw	a0,-4(a4)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1823
230066f2:	feb71be3          	bne	a4,a1,230066e8 <Sec_Eng_PKA_Read_Data+0x92>
Sec_Eng_PKA_Get_Result():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1908
230066f6:	02d7d063          	bge	a5,a3,23006716 <Sec_Eng_PKA_Read_Data+0xc0>
230066fa:	078a                	slli	a5,a5,0x2
230066fc:	068a                	slli	a3,a3,0x2
230066fe:	97b2                	add	a5,a5,a2
23006700:	96b2                	add	a3,a3,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1910
23006702:	40004637          	lui	a2,0x40004
23006706:	34062703          	lw	a4,832(a2) # 40004340 <__ram_load_addr+0x1cffa9d8>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1911
2300670a:	0791                	addi	a5,a5,4
2300670c:	fee7ae23          	sw	a4,-4(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1908
23006710:	fed79be3          	bne	a5,a3,23006706 <Sec_Eng_PKA_Read_Data+0xb0>
Sec_Eng_PKA_Read_Data():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1974
23006714:	8082                	ret
23006716:	8082                	ret

23006718 <Sec_Eng_PKA_CREG>:
Sec_Eng_PKA_Write_Pld_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1645
23006718:	05b2                	slli	a1,a1,0xc
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1646
2300671a:	893d                	andi	a0,a0,15
2300671c:	8e4d                	or	a2,a2,a1
2300671e:	0552                	slli	a0,a0,0x14
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1647
23006720:	8e49                	or	a2,a2,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1648
23006722:	350005b7          	lui	a1,0x35000
23006726:	01f69713          	slli	a4,a3,0x1f
2300672a:	8e4d                	or	a2,a2,a1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1650
2300672c:	400047b7          	lui	a5,0x40004
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1648
23006730:	8e59                	or	a2,a2,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1650
23006732:	34c7a023          	sw	a2,832(a5) # 40004340 <__ram_load_addr+0x1cffa9d8>
Sec_Eng_PKA_CREG():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1992
23006736:	3407a023          	sw	zero,832(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1994
2300673a:	e291                	bnez	a3,2300673e <Sec_Eng_PKA_CREG+0x26>
2300673c:	8082                	ret
Sec_Eng_PKA_Wait_ISR():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1759
2300673e:	00f42737          	lui	a4,0xf42
23006742:	3007a783          	lw	a5,768(a5)
23006746:	3ff70713          	addi	a4,a4,1023 # f423ff <StackSize+0xf41fff>
2300674a:	400046b7          	lui	a3,0x40004
2300674e:	a021                	j	23006756 <Sec_Eng_PKA_CREG+0x3e>
23006750:	3006a783          	lw	a5,768(a3) # 40004300 <__ram_load_addr+0x1cffa998>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1761
23006754:	c709                	beqz	a4,2300675e <Sec_Eng_PKA_CREG+0x46>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1764
23006756:	1007f793          	andi	a5,a5,256
2300675a:	177d                	addi	a4,a4,-1
2300675c:	dbf5                	beqz	a5,23006750 <Sec_Eng_PKA_CREG+0x38>
Sec_Eng_PKA_Clear_Int():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1581
2300675e:	400047b7          	lui	a5,0x40004
23006762:	3007a703          	lw	a4,768(a5) # 40004300 <__ram_load_addr+0x1cffa998>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1582
23006766:	20076713          	ori	a4,a4,512
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1584
2300676a:	30e7a023          	sw	a4,768(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1586
2300676e:	3007a703          	lw	a4,768(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1587
23006772:	dff77713          	andi	a4,a4,-513
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1588
23006776:	30e7a023          	sw	a4,768(a5)
Sec_Eng_PKA_CREG():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1998
2300677a:	8082                	ret

2300677c <Sec_Eng_PKA_Move_Data>:
Sec_Eng_PKA_Write_Common_OP_First_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1672
2300677c:	8a3d                	andi	a2,a2,15
2300677e:	0622                	slli	a2,a2,0x8
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1675
23006780:	8e55                	or	a2,a2,a3
23006782:	05b2                	slli	a1,a1,0xc
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1676
23006784:	893d                	andi	a0,a0,15
23006786:	0552                	slli	a0,a0,0x14
23006788:	8e4d                	or	a2,a2,a1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1679
2300678a:	320007b7          	lui	a5,0x32000
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1678
2300678e:	8e49                	or	a2,a2,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1679
23006790:	8e5d                	or	a2,a2,a5
23006792:	01f71693          	slli	a3,a4,0x1f
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1681
23006796:	400047b7          	lui	a5,0x40004
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1679
2300679a:	8e55                	or	a2,a2,a3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1681
2300679c:	34c7a023          	sw	a2,832(a5) # 40004340 <__ram_load_addr+0x1cffa9d8>
Sec_Eng_PKA_Move_Data():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:2072
230067a0:	3407a023          	sw	zero,832(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:2074
230067a4:	e311                	bnez	a4,230067a8 <Sec_Eng_PKA_Move_Data+0x2c>
230067a6:	8082                	ret
Sec_Eng_PKA_Wait_ISR():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1759
230067a8:	00f42737          	lui	a4,0xf42
230067ac:	3007a783          	lw	a5,768(a5)
230067b0:	3ff70713          	addi	a4,a4,1023 # f423ff <StackSize+0xf41fff>
230067b4:	400046b7          	lui	a3,0x40004
230067b8:	a021                	j	230067c0 <Sec_Eng_PKA_Move_Data+0x44>
230067ba:	3006a783          	lw	a5,768(a3) # 40004300 <__ram_load_addr+0x1cffa998>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1761
230067be:	c709                	beqz	a4,230067c8 <Sec_Eng_PKA_Move_Data+0x4c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1764
230067c0:	1007f793          	andi	a5,a5,256
230067c4:	177d                	addi	a4,a4,-1
230067c6:	dbf5                	beqz	a5,230067ba <Sec_Eng_PKA_Move_Data+0x3e>
Sec_Eng_PKA_Clear_Int():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1581
230067c8:	400047b7          	lui	a5,0x40004
230067cc:	3007a703          	lw	a4,768(a5) # 40004300 <__ram_load_addr+0x1cffa998>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1582
230067d0:	20076713          	ori	a4,a4,512
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1584
230067d4:	30e7a023          	sw	a4,768(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1586
230067d8:	3007a703          	lw	a4,768(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1587
230067dc:	dff77713          	andi	a4,a4,-513
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1588
230067e0:	30e7a023          	sw	a4,768(a5)
Sec_Eng_PKA_Move_Data():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:2078
230067e4:	8082                	ret

230067e6 <Sec_Eng_PKA_MSUB>:
Sec_Eng_PKA_Write_Common_OP_First_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1672
230067e6:	737d                	lui	t1,0xfffff
230067e8:	0ff30313          	addi	t1,t1,255 # fffff0ff <__noinit_data_end__+0xbdfcc7af>
230067ec:	8a3d                	andi	a2,a2,15
230067ee:	0622                	slli	a2,a2,0x8
230067f0:	0066f6b3          	and	a3,a3,t1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1675
230067f4:	8ed1                	or	a3,a3,a2
230067f6:	05b2                	slli	a1,a1,0xc
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1676
230067f8:	ff100637          	lui	a2,0xff100
Sec_Eng_PKA_MSUB():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:2150
230067fc:	00014e03          	lbu	t3,0(sp)
Sec_Eng_PKA_Write_Common_OP_First_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1676
23006800:	167d                	addi	a2,a2,-1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1675
23006802:	8ecd                	or	a3,a3,a1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1676
23006804:	893d                	andi	a0,a0,15
Sec_Eng_PKA_Write_Common_OP_Snd_Cfg_S1_S2():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1737
23006806:	07b2                	slli	a5,a5,0xc
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1738
23006808:	8b3d                	andi	a4,a4,15
Sec_Eng_PKA_Write_Common_OP_First_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1676
2300680a:	8ef1                	and	a3,a3,a2
Sec_Eng_PKA_Write_Common_OP_Snd_Cfg_S1_S2():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1738
2300680c:	0752                	slli	a4,a4,0x14
2300680e:	8ff1                	and	a5,a5,a2
Sec_Eng_PKA_Write_Common_OP_First_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1676
23006810:	0552                	slli	a0,a0,0x14
Sec_Eng_PKA_Write_Common_OP_Snd_Cfg_S1_S2():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1739
23006812:	8fd9                	or	a5,a5,a4
Sec_Eng_PKA_Write_Common_OP_First_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1678
23006814:	8ec9                	or	a3,a3,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1679
23006816:	27000737          	lui	a4,0x27000
2300681a:	8ed9                	or	a3,a3,a4
2300681c:	01fe1613          	slli	a2,t3,0x1f
Sec_Eng_PKA_Write_Common_OP_Snd_Cfg_S1_S2():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1739
23006820:	0117e7b3          	or	a5,a5,a7
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1740
23006824:	00f87813          	andi	a6,a6,15
Sec_Eng_PKA_Write_Common_OP_First_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1681
23006828:	40004737          	lui	a4,0x40004
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1679
2300682c:	8ed1                	or	a3,a3,a2
Sec_Eng_PKA_Write_Common_OP_Snd_Cfg_S1_S2():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1740
2300682e:	0822                	slli	a6,a6,0x8
23006830:	0067f7b3          	and	a5,a5,t1
Sec_Eng_PKA_Write_Common_OP_First_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1681
23006834:	34d72023          	sw	a3,832(a4) # 40004340 <__ram_load_addr+0x1cffa9d8>
Sec_Eng_PKA_Write_Common_OP_Snd_Cfg_S1_S2():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1740
23006838:	0107e7b3          	or	a5,a5,a6
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1742
2300683c:	34f72023          	sw	a5,832(a4)
Sec_Eng_PKA_MSUB():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:2154
23006840:	000e1363          	bnez	t3,23006846 <Sec_Eng_PKA_MSUB+0x60>
23006844:	8082                	ret
Sec_Eng_PKA_Wait_ISR():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1759
23006846:	30072783          	lw	a5,768(a4)
2300684a:	00f42737          	lui	a4,0xf42
2300684e:	3ff70713          	addi	a4,a4,1023 # f423ff <StackSize+0xf41fff>
23006852:	400046b7          	lui	a3,0x40004
23006856:	a021                	j	2300685e <Sec_Eng_PKA_MSUB+0x78>
23006858:	3006a783          	lw	a5,768(a3) # 40004300 <__ram_load_addr+0x1cffa998>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1761
2300685c:	c709                	beqz	a4,23006866 <Sec_Eng_PKA_MSUB+0x80>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1764
2300685e:	1007f793          	andi	a5,a5,256
23006862:	177d                	addi	a4,a4,-1
23006864:	dbf5                	beqz	a5,23006858 <Sec_Eng_PKA_MSUB+0x72>
Sec_Eng_PKA_Clear_Int():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1581
23006866:	400047b7          	lui	a5,0x40004
2300686a:	3007a703          	lw	a4,768(a5) # 40004300 <__ram_load_addr+0x1cffa998>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1582
2300686e:	20076713          	ori	a4,a4,512
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1584
23006872:	30e7a023          	sw	a4,768(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1586
23006876:	3007a703          	lw	a4,768(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1587
2300687a:	dff77713          	andi	a4,a4,-513
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1588
2300687e:	30e7a023          	sw	a4,768(a5)
Sec_Eng_PKA_MSUB():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:2158
23006882:	8082                	ret

23006884 <Sec_Eng_PKA_MREM>:
Sec_Eng_PKA_Write_Common_OP_First_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1672
23006884:	78fd                	lui	a7,0xfffff
23006886:	0ff88893          	addi	a7,a7,255 # fffff0ff <__noinit_data_end__+0xbdfcc7af>
2300688a:	8a3d                	andi	a2,a2,15
2300688c:	0622                	slli	a2,a2,0x8
2300688e:	0116f6b3          	and	a3,a3,a7
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1675
23006892:	05b2                	slli	a1,a1,0xc
23006894:	8ed1                	or	a3,a3,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1676
23006896:	893d                	andi	a0,a0,15
23006898:	8ecd                	or	a3,a3,a1
2300689a:	0552                	slli	a0,a0,0x14
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1679
2300689c:	26000637          	lui	a2,0x26000
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1678
230068a0:	8ec9                	or	a3,a3,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1679
230068a2:	8ed1                	or	a3,a3,a2
230068a4:	01f81593          	slli	a1,a6,0x1f
Sec_Eng_PKA_Write_Common_OP_Snd_Cfg_S2():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1717
230068a8:	8b3d                	andi	a4,a4,15
Sec_Eng_PKA_Write_Common_OP_First_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1681
230068aa:	40004637          	lui	a2,0x40004
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1679
230068ae:	8ecd                	or	a3,a3,a1
Sec_Eng_PKA_Write_Common_OP_Snd_Cfg_S2():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1717
230068b0:	0722                	slli	a4,a4,0x8
230068b2:	0117f7b3          	and	a5,a5,a7
Sec_Eng_PKA_Write_Common_OP_First_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1681
230068b6:	34d62023          	sw	a3,832(a2) # 40004340 <__ram_load_addr+0x1cffa9d8>
Sec_Eng_PKA_Write_Common_OP_Snd_Cfg_S2():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1717
230068ba:	8fd9                	or	a5,a5,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1719
230068bc:	34f62023          	sw	a5,832(a2)
Sec_Eng_PKA_MREM():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:2180
230068c0:	00081363          	bnez	a6,230068c6 <Sec_Eng_PKA_MREM+0x42>
230068c4:	8082                	ret
Sec_Eng_PKA_Wait_ISR():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1759
230068c6:	00f42737          	lui	a4,0xf42
230068ca:	30062783          	lw	a5,768(a2)
230068ce:	3ff70713          	addi	a4,a4,1023 # f423ff <StackSize+0xf41fff>
230068d2:	400046b7          	lui	a3,0x40004
230068d6:	a021                	j	230068de <Sec_Eng_PKA_MREM+0x5a>
230068d8:	3006a783          	lw	a5,768(a3) # 40004300 <__ram_load_addr+0x1cffa998>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1761
230068dc:	c709                	beqz	a4,230068e6 <Sec_Eng_PKA_MREM+0x62>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1764
230068de:	1007f793          	andi	a5,a5,256
230068e2:	177d                	addi	a4,a4,-1
230068e4:	dbf5                	beqz	a5,230068d8 <Sec_Eng_PKA_MREM+0x54>
Sec_Eng_PKA_MREM():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1764
230068e6:	95fff06f          	j	23006244 <Sec_Eng_PKA_LMUL.part.4>

230068ea <Sec_Eng_PKA_MMUL>:
Sec_Eng_PKA_Write_Common_OP_First_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1672
230068ea:	737d                	lui	t1,0xfffff
230068ec:	0ff30313          	addi	t1,t1,255 # fffff0ff <__noinit_data_end__+0xbdfcc7af>
230068f0:	8a3d                	andi	a2,a2,15
230068f2:	0622                	slli	a2,a2,0x8
230068f4:	0066f6b3          	and	a3,a3,t1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1675
230068f8:	8ed1                	or	a3,a3,a2
230068fa:	05b2                	slli	a1,a1,0xc
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1676
230068fc:	ff100637          	lui	a2,0xff100
Sec_Eng_PKA_MMUL():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:2204
23006900:	00014e03          	lbu	t3,0(sp)
Sec_Eng_PKA_Write_Common_OP_First_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1676
23006904:	167d                	addi	a2,a2,-1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1675
23006906:	8ecd                	or	a3,a3,a1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1676
23006908:	893d                	andi	a0,a0,15
Sec_Eng_PKA_Write_Common_OP_Snd_Cfg_S1_S2():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1737
2300690a:	07b2                	slli	a5,a5,0xc
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1738
2300690c:	8b3d                	andi	a4,a4,15
Sec_Eng_PKA_Write_Common_OP_First_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1676
2300690e:	8ef1                	and	a3,a3,a2
Sec_Eng_PKA_Write_Common_OP_Snd_Cfg_S1_S2():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1738
23006910:	0752                	slli	a4,a4,0x14
23006912:	8ff1                	and	a5,a5,a2
Sec_Eng_PKA_Write_Common_OP_First_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1676
23006914:	0552                	slli	a0,a0,0x14
Sec_Eng_PKA_Write_Common_OP_Snd_Cfg_S1_S2():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1739
23006916:	8fd9                	or	a5,a5,a4
Sec_Eng_PKA_Write_Common_OP_First_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1678
23006918:	8ec9                	or	a3,a3,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1679
2300691a:	25000737          	lui	a4,0x25000
2300691e:	8ed9                	or	a3,a3,a4
23006920:	01fe1613          	slli	a2,t3,0x1f
Sec_Eng_PKA_Write_Common_OP_Snd_Cfg_S1_S2():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1739
23006924:	0117e7b3          	or	a5,a5,a7
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1740
23006928:	00f87813          	andi	a6,a6,15
Sec_Eng_PKA_Write_Common_OP_First_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1681
2300692c:	40004737          	lui	a4,0x40004
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1679
23006930:	8ed1                	or	a3,a3,a2
Sec_Eng_PKA_Write_Common_OP_Snd_Cfg_S1_S2():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1740
23006932:	0822                	slli	a6,a6,0x8
23006934:	0067f7b3          	and	a5,a5,t1
Sec_Eng_PKA_Write_Common_OP_First_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1681
23006938:	34d72023          	sw	a3,832(a4) # 40004340 <__ram_load_addr+0x1cffa9d8>
Sec_Eng_PKA_Write_Common_OP_Snd_Cfg_S1_S2():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1740
2300693c:	0107e7b3          	or	a5,a5,a6
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1742
23006940:	34f72023          	sw	a5,832(a4)
Sec_Eng_PKA_MMUL():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:2208
23006944:	000e1363          	bnez	t3,2300694a <Sec_Eng_PKA_MMUL+0x60>
23006948:	8082                	ret
Sec_Eng_PKA_Wait_ISR():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1759
2300694a:	30072783          	lw	a5,768(a4)
2300694e:	00f42737          	lui	a4,0xf42
23006952:	3ff70713          	addi	a4,a4,1023 # f423ff <StackSize+0xf41fff>
23006956:	400046b7          	lui	a3,0x40004
2300695a:	a021                	j	23006962 <Sec_Eng_PKA_MMUL+0x78>
2300695c:	3006a783          	lw	a5,768(a3) # 40004300 <__ram_load_addr+0x1cffa998>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1761
23006960:	c709                	beqz	a4,2300696a <Sec_Eng_PKA_MMUL+0x80>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1764
23006962:	1007f793          	andi	a5,a5,256
23006966:	177d                	addi	a4,a4,-1
23006968:	dbf5                	beqz	a5,2300695c <Sec_Eng_PKA_MMUL+0x72>
Sec_Eng_PKA_Clear_Int():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1581
2300696a:	400047b7          	lui	a5,0x40004
2300696e:	3007a703          	lw	a4,768(a5) # 40004300 <__ram_load_addr+0x1cffa998>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1582
23006972:	20076713          	ori	a4,a4,512
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1584
23006976:	30e7a023          	sw	a4,768(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1586
2300697a:	3007a703          	lw	a4,768(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1587
2300697e:	dff77713          	andi	a4,a4,-513
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1588
23006982:	30e7a023          	sw	a4,768(a5)
Sec_Eng_PKA_MMUL():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:2212
23006986:	8082                	ret

23006988 <Sec_Eng_PKA_MINV>:
Sec_Eng_PKA_Write_Common_OP_First_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1672
23006988:	78fd                	lui	a7,0xfffff
2300698a:	0ff88893          	addi	a7,a7,255 # fffff0ff <__noinit_data_end__+0xbdfcc7af>
2300698e:	8a3d                	andi	a2,a2,15
23006990:	0622                	slli	a2,a2,0x8
23006992:	0116f6b3          	and	a3,a3,a7
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1675
23006996:	05b2                	slli	a1,a1,0xc
23006998:	8ed1                	or	a3,a3,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1676
2300699a:	893d                	andi	a0,a0,15
2300699c:	8ecd                	or	a3,a3,a1
2300699e:	0552                	slli	a0,a0,0x14
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1679
230069a0:	22000637          	lui	a2,0x22000
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1678
230069a4:	8ec9                	or	a3,a3,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1679
230069a6:	8ed1                	or	a3,a3,a2
230069a8:	01f81593          	slli	a1,a6,0x1f
Sec_Eng_PKA_Write_Common_OP_Snd_Cfg_S2():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1717
230069ac:	8b3d                	andi	a4,a4,15
Sec_Eng_PKA_Write_Common_OP_First_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1681
230069ae:	40004637          	lui	a2,0x40004
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1679
230069b2:	8ecd                	or	a3,a3,a1
Sec_Eng_PKA_Write_Common_OP_Snd_Cfg_S2():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1717
230069b4:	0722                	slli	a4,a4,0x8
230069b6:	0117f7b3          	and	a5,a5,a7
Sec_Eng_PKA_Write_Common_OP_First_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1681
230069ba:	34d62023          	sw	a3,832(a2) # 40004340 <__ram_load_addr+0x1cffa9d8>
Sec_Eng_PKA_Write_Common_OP_Snd_Cfg_S2():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1717
230069be:	8fd9                	or	a5,a5,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1719
230069c0:	34f62023          	sw	a5,832(a2)
Sec_Eng_PKA_MINV():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:2288
230069c4:	00081363          	bnez	a6,230069ca <Sec_Eng_PKA_MINV+0x42>
230069c8:	8082                	ret
Sec_Eng_PKA_Wait_ISR():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1759
230069ca:	00f42737          	lui	a4,0xf42
230069ce:	30062783          	lw	a5,768(a2)
230069d2:	3ff70713          	addi	a4,a4,1023 # f423ff <StackSize+0xf41fff>
230069d6:	400046b7          	lui	a3,0x40004
230069da:	a021                	j	230069e2 <Sec_Eng_PKA_MINV+0x5a>
230069dc:	3006a783          	lw	a5,768(a3) # 40004300 <__ram_load_addr+0x1cffa998>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1761
230069e0:	c709                	beqz	a4,230069ea <Sec_Eng_PKA_MINV+0x62>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1764
230069e2:	1007f793          	andi	a5,a5,256
230069e6:	177d                	addi	a4,a4,-1
230069e8:	dbf5                	beqz	a5,230069dc <Sec_Eng_PKA_MINV+0x54>
Sec_Eng_PKA_Clear_Int():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1581
230069ea:	400047b7          	lui	a5,0x40004
230069ee:	3007a703          	lw	a4,768(a5) # 40004300 <__ram_load_addr+0x1cffa998>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1582
230069f2:	20076713          	ori	a4,a4,512
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1584
230069f6:	30e7a023          	sw	a4,768(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1586
230069fa:	3007a703          	lw	a4,768(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1587
230069fe:	dff77713          	andi	a4,a4,-513
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1588
23006a02:	30e7a023          	sw	a4,768(a5)
Sec_Eng_PKA_MINV():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:2292
23006a06:	8082                	ret

23006a08 <Sec_Eng_PKA_LCMP>:
Sec_Eng_PKA_Write_Common_OP_First_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1672
23006a08:	89bd                	andi	a1,a1,15
23006a0a:	05a2                	slli	a1,a1,0x8
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1678
23006a0c:	8dd1                	or	a1,a1,a2
Sec_Eng_PKA_Write_Common_OP_Snd_Cfg_S1():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1698
23006a0e:	8abd                	andi	a3,a3,15
Sec_Eng_PKA_Write_Common_OP_First_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1678
23006a10:	99000637          	lui	a2,0x99000
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1681
23006a14:	400047b7          	lui	a5,0x40004
Sec_Eng_PKA_Write_Common_OP_Snd_Cfg_S1():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1698
23006a18:	06d2                	slli	a3,a3,0x14
Sec_Eng_PKA_Write_Common_OP_First_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1678
23006a1a:	8dd1                	or	a1,a1,a2
Sec_Eng_PKA_Write_Common_OP_Snd_Cfg_S1():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1698
23006a1c:	0732                	slli	a4,a4,0xc
23006a1e:	8f55                	or	a4,a4,a3
Sec_Eng_PKA_Write_Common_OP_First_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1681
23006a20:	34b7a023          	sw	a1,832(a5) # 40004340 <__ram_load_addr+0x1cffa9d8>
Sec_Eng_PKA_Write_Common_OP_Snd_Cfg_S1():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1700
23006a24:	34e7a023          	sw	a4,832(a5)
Sec_Eng_PKA_Wait_ISR():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1759
23006a28:	00f42737          	lui	a4,0xf42
23006a2c:	3007a783          	lw	a5,768(a5)
23006a30:	3ff70713          	addi	a4,a4,1023 # f423ff <StackSize+0xf41fff>
23006a34:	400046b7          	lui	a3,0x40004
23006a38:	a021                	j	23006a40 <Sec_Eng_PKA_LCMP+0x38>
23006a3a:	3006a783          	lw	a5,768(a3) # 40004300 <__ram_load_addr+0x1cffa998>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1761
23006a3e:	c709                	beqz	a4,23006a48 <Sec_Eng_PKA_LCMP+0x40>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1764
23006a40:	1007f793          	andi	a5,a5,256
23006a44:	177d                	addi	a4,a4,-1
23006a46:	dbf5                	beqz	a5,23006a3a <Sec_Eng_PKA_LCMP+0x32>
Sec_Eng_PKA_Clear_Int():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1581
23006a48:	400047b7          	lui	a5,0x40004
23006a4c:	3007a703          	lw	a4,768(a5) # 40004300 <__ram_load_addr+0x1cffa998>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1582
23006a50:	20076713          	ori	a4,a4,512
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1584
23006a54:	30e7a023          	sw	a4,768(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1586
23006a58:	3007a703          	lw	a4,768(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1587
23006a5c:	dff77713          	andi	a4,a4,-513
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1588
23006a60:	30e7a023          	sw	a4,768(a5)
Sec_Eng_PKA_LCMP():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:2315
23006a64:	3007a783          	lw	a5,768(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:2317
23006a68:	83e1                	srli	a5,a5,0x18
23006a6a:	8b85                	andi	a5,a5,1
23006a6c:	00f50023          	sb	a5,0(a0)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:2318
23006a70:	8082                	ret

23006a72 <Sec_Eng_PKA_LMUL>:
Sec_Eng_PKA_Write_Common_OP_First_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1672
23006a72:	8a3d                	andi	a2,a2,15
23006a74:	0622                	slli	a2,a2,0x8
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1675
23006a76:	05b2                	slli	a1,a1,0xc
23006a78:	8e55                	or	a2,a2,a3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1676
23006a7a:	ff1006b7          	lui	a3,0xff100
23006a7e:	16fd                	addi	a3,a3,-1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1675
23006a80:	8e4d                	or	a2,a2,a1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1676
23006a82:	893d                	andi	a0,a0,15
23006a84:	0552                	slli	a0,a0,0x14
23006a86:	8e75                	and	a2,a2,a3
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1678
23006a88:	8e49                	or	a2,a2,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1679
23006a8a:	160005b7          	lui	a1,0x16000
23006a8e:	8e4d                	or	a2,a2,a1
23006a90:	01f81513          	slli	a0,a6,0x1f
Sec_Eng_PKA_Write_Common_OP_Snd_Cfg_S1():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1697
23006a94:	07b2                	slli	a5,a5,0xc
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1698
23006a96:	8b3d                	andi	a4,a4,15
Sec_Eng_PKA_Write_Common_OP_First_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1681
23006a98:	400045b7          	lui	a1,0x40004
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1679
23006a9c:	8e49                	or	a2,a2,a0
Sec_Eng_PKA_Write_Common_OP_Snd_Cfg_S1():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1698
23006a9e:	0752                	slli	a4,a4,0x14
23006aa0:	8ff5                	and	a5,a5,a3
Sec_Eng_PKA_Write_Common_OP_First_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1681
23006aa2:	34c5a023          	sw	a2,832(a1) # 40004340 <__ram_load_addr+0x1cffa9d8>
Sec_Eng_PKA_Write_Common_OP_Snd_Cfg_S1():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1698
23006aa6:	8fd9                	or	a5,a5,a4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1700
23006aa8:	34f5a023          	sw	a5,832(a1)
Sec_Eng_PKA_LMUL():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:2393
23006aac:	00081363          	bnez	a6,23006ab2 <Sec_Eng_PKA_LMUL+0x40>
23006ab0:	8082                	ret
Sec_Eng_PKA_Wait_ISR():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1759
23006ab2:	00f42737          	lui	a4,0xf42
23006ab6:	3005a783          	lw	a5,768(a1)
23006aba:	3ff70713          	addi	a4,a4,1023 # f423ff <StackSize+0xf41fff>
23006abe:	400046b7          	lui	a3,0x40004
23006ac2:	a021                	j	23006aca <Sec_Eng_PKA_LMUL+0x58>
23006ac4:	3006a783          	lw	a5,768(a3) # 40004300 <__ram_load_addr+0x1cffa998>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1761
23006ac8:	c709                	beqz	a4,23006ad2 <Sec_Eng_PKA_LMUL+0x60>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1764
23006aca:	1007f793          	andi	a5,a5,256
23006ace:	177d                	addi	a4,a4,-1
23006ad0:	dbf5                	beqz	a5,23006ac4 <Sec_Eng_PKA_LMUL+0x52>
Sec_Eng_PKA_LMUL():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1764
23006ad2:	f72ff06f          	j	23006244 <Sec_Eng_PKA_LMUL.part.4>

23006ad6 <Sec_Eng_PKA_GF2Mont>:
Sec_Eng_PKA_Write_Common_OP_First_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1672
23006ad6:	00f67313          	andi	t1,a2,15
23006ada:	0322                	slli	t1,t1,0x8
Sec_Eng_PKA_GF2Mont():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:2556
23006adc:	863e                	mv	a2,a5
Sec_Eng_PKA_Write_Common_OP_First_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1675
23006ade:	0066e333          	or	t1,a3,t1
23006ae2:	00c81793          	slli	a5,a6,0xc
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1676
23006ae6:	00f67693          	andi	a3,a2,15
23006aea:	06d2                	slli	a3,a3,0x14
23006aec:	00f36333          	or	t1,t1,a5
Sec_Eng_PKA_GF2Mont():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:2556
23006af0:	8e42                	mv	t3,a6
Sec_Eng_PKA_Write_Common_OP_First_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1678
23006af2:	00d36333          	or	t1,t1,a3
23006af6:	13000837          	lui	a6,0x13000
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1681
23006afa:	400046b7          	lui	a3,0x40004
Sec_Eng_PKA_GF2Mont():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:2556
23006afe:	00014783          	lbu	a5,0(sp)
Sec_Eng_PKA_Write_Common_OP_First_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1678
23006b02:	01036333          	or	t1,t1,a6
Sec_Eng_PKA_LMUL2N():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:2470
23006b06:	0746                	slli	a4,a4,0x11
Sec_Eng_PKA_Write_Common_OP_First_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1681
23006b08:	3466a023          	sw	t1,832(a3) # 40004340 <__ram_load_addr+0x1cffa9d8>
Sec_Eng_PKA_LMUL2N():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:2470
23006b0c:	8345                	srli	a4,a4,0x11
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:2471
23006b0e:	34e6a023          	sw	a4,832(a3)
Sec_Eng_PKA_GF2Mont():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:2558
23006b12:	4805                	li	a6,1
23006b14:	8746                	mv	a4,a7
23006b16:	86f2                	mv	a3,t3
23006b18:	d6dff06f          	j	23006884 <Sec_Eng_PKA_MREM>

23006b1c <Sec_Eng_PKA_Mont2GF>:
Sec_Eng_PKA_Write_Common_OP_First_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1672
23006b1c:	8a3d                	andi	a2,a2,15
23006b1e:	00861313          	slli	t1,a2,0x8
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1675
23006b22:	0066e6b3          	or	a3,a3,t1
Sec_Eng_PKA_Mont2GF():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:2581
23006b26:	8642                	mv	a2,a6
Sec_Eng_PKA_Write_Common_OP_First_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1675
23006b28:	00c89313          	slli	t1,a7,0xc
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1676
23006b2c:	ff100837          	lui	a6,0xff100
23006b30:	187d                	addi	a6,a6,-1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1675
23006b32:	0066e6b3          	or	a3,a3,t1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1676
23006b36:	00f67313          	andi	t1,a2,15
23006b3a:	0352                	slli	t1,t1,0x14
23006b3c:	0106f6b3          	and	a3,a3,a6
Sec_Eng_PKA_Mont2GF():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:2581
23006b40:	00014e03          	lbu	t3,0(sp)
23006b44:	00414e83          	lbu	t4,4(sp)
Sec_Eng_PKA_Write_Common_OP_First_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1678
23006b48:	0066e6b3          	or	a3,a3,t1
Sec_Eng_PKA_Write_Common_OP_Snd_Cfg_S1():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1697
23006b4c:	07b2                	slli	a5,a5,0xc
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1698
23006b4e:	8b3d                	andi	a4,a4,15
Sec_Eng_PKA_Write_Common_OP_First_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1678
23006b50:	16000f37          	lui	t5,0x16000
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1681
23006b54:	40004337          	lui	t1,0x40004
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1678
23006b58:	01e6e6b3          	or	a3,a3,t5
Sec_Eng_PKA_Write_Common_OP_Snd_Cfg_S1():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1698
23006b5c:	0752                	slli	a4,a4,0x14
23006b5e:	0107f7b3          	and	a5,a5,a6
23006b62:	8fd9                	or	a5,a5,a4
Sec_Eng_PKA_Write_Common_OP_First_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1681
23006b64:	34d32023          	sw	a3,832(t1) # 40004340 <__ram_load_addr+0x1cffa9d8>
Sec_Eng_PKA_Write_Common_OP_Snd_Cfg_S1():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:1700
23006b68:	34f32023          	sw	a5,832(t1)
Sec_Eng_PKA_Mont2GF():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_sec_eng.c:2583
23006b6c:	4805                	li	a6,1
23006b6e:	87f6                	mv	a5,t4
23006b70:	8772                	mv	a4,t3
23006b72:	86c6                	mv	a3,a7
23006b74:	d11ff06f          	j	23006884 <Sec_Eng_PKA_MREM>

23006b78 <bflb_platform_uart_dbg_init>:
bflb_platform_uart_dbg_init():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:92
23006b78:	230077b7          	lui	a5,0x23007
23006b7c:	edc78793          	addi	a5,a5,-292 # 23006edc <bflb_platform_print_set+0x10>
23006b80:	438c                	lw	a1,0(a5)
23006b82:	43d0                	lw	a2,4(a5)
23006b84:	4794                	lw	a3,8(a5)
23006b86:	47d8                	lw	a4,12(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:103
23006b88:	230087b7          	lui	a5,0x23008
23006b8c:	f307a783          	lw	a5,-208(a5) # 23007f30 <CSWTCH.116+0x40>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:91
23006b90:	7179                	addi	sp,sp,-48
23006b92:	d606                	sw	ra,44(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:103
23006b94:	c63e                	sw	a5,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:91
23006b96:	d422                	sw	s0,40(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:92
23006b98:	c82e                	sw	a1,16(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:91
23006b9a:	842a                	mv	s0,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:92
23006b9c:	ca32                	sw	a2,20(sp)
23006b9e:	cc36                	sw	a3,24(sp)
23006ba0:	ce3a                	sw	a4,28(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:111
23006ba2:	c36fb0ef          	jal	ra,23001fd8 <bflb_platform_init_uart_debug_gpio>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:113
23006ba6:	4701                	li	a4,0
23006ba8:	4681                	li	a3,0
23006baa:	04000613          	li	a2,64
23006bae:	05418593          	addi	a1,gp,84 # 420218d4 <uartBuf>
23006bb2:	09418513          	addi	a0,gp,148 # 42021914 <uartRB>
23006bb6:	e87fc0ef          	jal	ra,23003a3c <Ring_Buffer_Init>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:117
23006bba:	4601                	li	a2,0
23006bbc:	4585                	li	a1,1
23006bbe:	4505                	li	a0,1
23006bc0:	9ecff0ef          	jal	ra,23005dac <GLB_Set_UART_CLK>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:118
23006bc4:	098977b7          	lui	a5,0x9897
23006bc8:	80078793          	addi	a5,a5,-2048 # 9896800 <StackSize+0x9896400>
23006bcc:	c83e                	sw	a5,16(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:120
23006bce:	c011                	beqz	s0,23006bd2 <bflb_platform_uart_dbg_init+0x5a>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:121
23006bd0:	ca22                	sw	s0,20(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:125
23006bd2:	4541                	li	a0,16
23006bd4:	a16ff0ef          	jal	ra,23005dea <GLB_AHB_Slave1_Reset>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:133
23006bd8:	4605                	li	a2,1
23006bda:	45a1                	li	a1,8
23006bdc:	4501                	li	a0,0
23006bde:	8caff0ef          	jal	ra,23005ca8 <UART_IntMask>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:136
23006be2:	4589                	li	a1,2
23006be4:	4501                	li	a0,0
23006be6:	84cff0ef          	jal	ra,23005c32 <UART_Disable>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:139
23006bea:	080c                	addi	a1,sp,16
23006bec:	4501                	li	a0,0
23006bee:	eb1fe0ef          	jal	ra,23005a9e <UART_Init>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:142
23006bf2:	006c                	addi	a1,sp,12
23006bf4:	4501                	li	a0,0
23006bf6:	f9ffe0ef          	jal	ra,23005b94 <UART_FifoConfig>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:146
23006bfa:	4585                	li	a1,1
23006bfc:	4501                	li	a0,0
23006bfe:	882ff0ef          	jal	ra,23005c80 <UART_TxFreeRun>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:149
23006c02:	05000593          	li	a1,80
23006c06:	4501                	li	a0,0
23006c08:	85aff0ef          	jal	ra,23005c62 <UART_SetRxTimeoutValue>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:153
23006c0c:	4601                	li	a2,0
23006c0e:	458d                	li	a1,3
23006c10:	4501                	li	a0,0
23006c12:	896ff0ef          	jal	ra,23005ca8 <UART_IntMask>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:154
23006c16:	4601                	li	a2,0
23006c18:	4591                	li	a1,4
23006c1a:	4501                	li	a0,0
23006c1c:	88cff0ef          	jal	ra,23005ca8 <UART_IntMask>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:157
23006c20:	23007637          	lui	a2,0x23007
23006c24:	cee60613          	addi	a2,a2,-786 # 23006cee <UART_RFR_Cbf>
23006c28:	458d                	li	a1,3
23006c2a:	4501                	li	a0,0
23006c2c:	8c4ff0ef          	jal	ra,23005cf0 <UART_Int_Callback_Install>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:158
23006c30:	23007637          	lui	a2,0x23007
23006c34:	4591                	li	a1,4
23006c36:	d3660613          	addi	a2,a2,-714 # 23006d36 <UART_RTO_Cbf>
23006c3a:	4501                	li	a0,0
23006c3c:	8b4ff0ef          	jal	ra,23005cf0 <UART_Int_Callback_Install>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:161
23006c40:	02d00513          	li	a0,45
23006c44:	c79fe0ef          	jal	ra,230058bc <clic_enable_interrupt>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:164
23006c48:	4589                	li	a1,2
23006c4a:	4501                	li	a0,0
23006c4c:	fb3fe0ef          	jal	ra,23005bfe <UART_Enable>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:165
23006c50:	50b2                	lw	ra,44(sp)
23006c52:	5422                	lw	s0,40(sp)
23006c54:	6145                	addi	sp,sp,48
23006c56:	8082                	ret

23006c58 <bflb_platform_uart_dbg_deinit>:
bflb_platform_uart_dbg_deinit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:193
23006c58:	1141                	addi	sp,sp,-16
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:194
23006c5a:	4589                	li	a1,2
23006c5c:	4501                	li	a0,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:193
23006c5e:	c606                	sw	ra,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:194
23006c60:	fd3fe0ef          	jal	ra,23005c32 <UART_Disable>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:196
23006c64:	4541                	li	a0,16
23006c66:	984ff0ef          	jal	ra,23005dea <GLB_AHB_Slave1_Reset>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:203
23006c6a:	40b2                	lw	ra,12(sp)
23006c6c:	0141                	addi	sp,sp,16
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:202
23006c6e:	bacfb06f          	j	2300201a <bflb_platform_deinit_uart_debug_gpio>

23006c72 <bflb_platform_printf>:
bflb_platform_printf():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:209
23006c72:	0cc1c303          	lbu	t1,204(gp) # 4202194c <uart_dbg_disable>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:206
23006c76:	7139                	addi	sp,sp,-64
23006c78:	ce06                	sw	ra,28(sp)
23006c7a:	cc22                	sw	s0,24(sp)
23006c7c:	d22e                	sw	a1,36(sp)
23006c7e:	d432                	sw	a2,40(sp)
23006c80:	d636                	sw	a3,44(sp)
23006c82:	d83a                	sw	a4,48(sp)
23006c84:	da3e                	sw	a5,52(sp)
23006c86:	dc42                	sw	a6,56(sp)
23006c88:	de46                	sw	a7,60(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:209
23006c8a:	00030663          	beqz	t1,23006c96 <bflb_platform_printf+0x24>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:215
23006c8e:	40f2                	lw	ra,28(sp)
23006c90:	4462                	lw	s0,24(sp)
23006c92:	6121                	addi	sp,sp,64
23006c94:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:210
23006c96:	105c                	addi	a5,sp,36
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:211
23006c98:	862a                	mv	a2,a0
23006c9a:	07f00593          	li	a1,127
23006c9e:	86be                	mv	a3,a5
23006ca0:	fd418513          	addi	a0,gp,-44 # 42021854 <print_buf.8760>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:210
23006ca4:	c63e                	sw	a5,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:211
23006ca6:	f33fb0ef          	jal	ra,23002bd8 <vsnprintf>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:213
23006caa:	fd418513          	addi	a0,gp,-44 # 42021854 <print_buf.8760>
23006cae:	a03fc0ef          	jal	ra,230036b0 <strlen>
bflb_platform_usart_dbg_send():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:189
23006cb2:	862a                	mv	a2,a0
23006cb4:	fd418593          	addi	a1,gp,-44 # 42021854 <print_buf.8760>
23006cb8:	4501                	li	a0,0
23006cba:	83aff0ef          	jal	ra,23005cf4 <UART_SendData>
bflb_platform_printf():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:215
23006cbe:	40f2                	lw	ra,28(sp)
23006cc0:	4462                	lw	s0,24(sp)
23006cc2:	6121                	addi	sp,sp,64
23006cc4:	8082                	ret

23006cc6 <UART_RFR_Cbf.part.1>:
UART_RTO_Cbf():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:82
23006cc6:	23008537          	lui	a0,0x23008
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:72
23006cca:	1101                	addi	sp,sp,-32
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:82
23006ccc:	f0450513          	addi	a0,a0,-252 # 23007f04 <CSWTCH.116+0x14>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:72
23006cd0:	ce06                	sw	ra,28(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:82
23006cd2:	fa1ff0ef          	jal	ra,23006c72 <bflb_platform_printf>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:84
23006cd6:	4641                	li	a2,16
23006cd8:	858a                	mv	a1,sp
23006cda:	4501                	li	a0,0
23006cdc:	868ff0ef          	jal	ra,23005d44 <UART_ReceiveData>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:85
23006ce0:	4501                	li	a0,0
23006ce2:	8b0ff0ef          	jal	ra,23005d92 <UART_GetRxFifoCount>
23006ce6:	f965                	bnez	a0,23006cd6 <UART_RFR_Cbf.part.1+0x10>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:87
23006ce8:	40f2                	lw	ra,28(sp)
23006cea:	6105                	addi	sp,sp,32
23006cec:	8082                	ret

23006cee <UART_RFR_Cbf>:
UART_RFR_Cbf():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:46
23006cee:	1141                	addi	sp,sp,-16
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:48
23006cf0:	4501                	li	a0,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:46
23006cf2:	c606                	sw	ra,12(sp)
23006cf4:	c422                	sw	s0,8(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:48
23006cf6:	89cff0ef          	jal	ra,23005d92 <UART_GetRxFifoCount>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:49
23006cfa:	01051593          	slli	a1,a0,0x10
23006cfe:	23006637          	lui	a2,0x23006
23006d02:	81c1                	srli	a1,a1,0x10
23006d04:	4681                	li	a3,0
23006d06:	d4460613          	addi	a2,a2,-700 # 23005d44 <UART_ReceiveData>
23006d0a:	09418513          	addi	a0,gp,148 # 42021914 <uartRB>
23006d0e:	da3fc0ef          	jal	ra,23003ab0 <Ring_Buffer_Write_Callback>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:53
23006d12:	4501                	li	a0,0
23006d14:	87eff0ef          	jal	ra,23005d92 <UART_GetRxFifoCount>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:54
23006d18:	e509                	bnez	a0,23006d22 <UART_RFR_Cbf+0x34>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:60
23006d1a:	40b2                	lw	ra,12(sp)
23006d1c:	4422                	lw	s0,8(sp)
23006d1e:	0141                	addi	sp,sp,16
23006d20:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:54 (discriminator 1)
23006d22:	09418513          	addi	a0,gp,148 # 42021914 <uartRB>
23006d26:	e3ffc0ef          	jal	ra,23003b64 <Ring_Buffer_Get_Empty_Length>
23006d2a:	f965                	bnez	a0,23006d1a <UART_RFR_Cbf+0x2c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:60
23006d2c:	4422                	lw	s0,8(sp)
23006d2e:	40b2                	lw	ra,12(sp)
23006d30:	0141                	addi	sp,sp,16
23006d32:	f95ff06f          	j	23006cc6 <UART_RFR_Cbf.part.1>

23006d36 <UART_RTO_Cbf>:
UART_RTO_Cbf():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:73
23006d36:	1141                	addi	sp,sp,-16
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:75
23006d38:	4501                	li	a0,0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:73
23006d3a:	c606                	sw	ra,12(sp)
23006d3c:	c422                	sw	s0,8(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:75
23006d3e:	854ff0ef          	jal	ra,23005d92 <UART_GetRxFifoCount>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:76
23006d42:	01051593          	slli	a1,a0,0x10
23006d46:	23006637          	lui	a2,0x23006
23006d4a:	81c1                	srli	a1,a1,0x10
23006d4c:	4681                	li	a3,0
23006d4e:	d4460613          	addi	a2,a2,-700 # 23005d44 <UART_ReceiveData>
23006d52:	09418513          	addi	a0,gp,148 # 42021914 <uartRB>
23006d56:	d5bfc0ef          	jal	ra,23003ab0 <Ring_Buffer_Write_Callback>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:80
23006d5a:	4501                	li	a0,0
23006d5c:	836ff0ef          	jal	ra,23005d92 <UART_GetRxFifoCount>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:81
23006d60:	e509                	bnez	a0,23006d6a <UART_RTO_Cbf+0x34>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:87
23006d62:	40b2                	lw	ra,12(sp)
23006d64:	4422                	lw	s0,8(sp)
23006d66:	0141                	addi	sp,sp,16
23006d68:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:81 (discriminator 1)
23006d6a:	09418513          	addi	a0,gp,148 # 42021914 <uartRB>
23006d6e:	df7fc0ef          	jal	ra,23003b64 <Ring_Buffer_Get_Empty_Length>
23006d72:	f965                	bnez	a0,23006d62 <UART_RTO_Cbf+0x2c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:87
23006d74:	4422                	lw	s0,8(sp)
23006d76:	40b2                	lw	ra,12(sp)
23006d78:	0141                	addi	sp,sp,16
23006d7a:	f4dff06f          	j	23006cc6 <UART_RFR_Cbf.part.1>

23006d7e <bflb_platform_get_time_ms>:
bflb_platform_get_time_ms():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:258
23006d7e:	1141                	addi	sp,sp,-16
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:264
23006d80:	0200c5b7          	lui	a1,0x200c
23006d84:	ff85a683          	lw	a3,-8(a1) # 200bff8 <StackSize+0x200bbf8>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:258
23006d88:	c422                	sw	s0,8(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:265
23006d8a:	ffc5a603          	lw	a2,-4(a1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:258
23006d8e:	c04a                	sw	s2,0(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:266
23006d90:	ff85a403          	lw	s0,-8(a1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:267
23006d94:	ffc5a903          	lw	s2,-4(a1)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:258
23006d98:	c606                	sw	ra,12(sp)
23006d9a:	c226                	sw	s1,4(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:267
23006d9c:	4711                	li	a4,4
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:264
23006d9e:	0200c7b7          	lui	a5,0x200c
23006da2:	177d                	addi	a4,a4,-1
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:272
23006da4:	00d46463          	bltu	s0,a3,23006dac <bflb_platform_get_time_ms+0x2e>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:272 (discriminator 1)
23006da8:	00c97b63          	bgeu	s2,a2,23006dbe <bflb_platform_get_time_ms+0x40>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:264
23006dac:	ff87a683          	lw	a3,-8(a5) # 200bff8 <StackSize+0x200bbf8>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:265
23006db0:	ffc7a603          	lw	a2,-4(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:266
23006db4:	ff87a403          	lw	s0,-8(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:267
23006db8:	ffc7a903          	lw	s2,-4(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:269
23006dbc:	f37d                	bnez	a4,23006da2 <bflb_platform_get_time_ms+0x24>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:274
23006dbe:	4000f7b7          	lui	a5,0x4000f
23006dc2:	1087a483          	lw	s1,264(a5) # 4000f108 <__ram_load_addr+0x1d0057a0>
23006dc6:	ff00a097          	auipc	ra,0xff00a
23006dca:	b08080e7          	jalr	-1272(ra) # 220108ce <GLB_Get_BCLK_Div>
23006dce:	0505                	addi	a0,a0,1
23006dd0:	02a4d533          	divu	a0,s1,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:275
23006dd4:	3e800613          	li	a2,1000
23006dd8:	810d                	srli	a0,a0,0x3
23006dda:	02c55633          	divu	a2,a0,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:277
23006dde:	00091b63          	bnez	s2,23006df4 <bflb_platform_get_time_ms+0x76>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:282
23006de2:	40b2                	lw	ra,12(sp)
23006de4:	4492                	lw	s1,4(sp)
23006de6:	4902                	lw	s2,0(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:278
23006de8:	4581                	li	a1,0
23006dea:	02c45533          	divu	a0,s0,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:282
23006dee:	4422                	lw	s0,8(sp)
23006df0:	0141                	addi	sp,sp,16
23006df2:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:280
23006df4:	8522                	mv	a0,s0
23006df6:	85ca                	mv	a1,s2
23006df8:	4681                	li	a3,0
23006dfa:	c52f90ef          	jal	ra,2300024c <__udivdi3>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:282
23006dfe:	40b2                	lw	ra,12(sp)
23006e00:	4422                	lw	s0,8(sp)
23006e02:	4492                	lw	s1,4(sp)
23006e04:	4902                	lw	s2,0(sp)
23006e06:	0141                	addi	sp,sp,16
23006e08:	8082                	ret

23006e0a <bflb_platform_init_time>:
bflb_platform_init_time():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:308
23006e0a:	1141                	addi	sp,sp,-16
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:309
23006e0c:	451d                	li	a0,7
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:308
23006e0e:	c606                	sw	ra,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:309
23006e10:	abffe0ef          	jal	ra,230058ce <clic_disable_interrupt>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:312
23006e14:	461d                	li	a2,7
23006e16:	4581                	li	a1,0
23006e18:	4505                	li	a0,1
23006e1a:	84aff0ef          	jal	ra,23005e64 <GLB_Set_MTimer_CLK>
bflb_platform_clear_time():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:254
23006e1e:	0200c7b7          	lui	a5,0x200c
bflb_platform_init_time():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:315
23006e22:	40b2                	lw	ra,12(sp)
bflb_platform_clear_time():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:254
23006e24:	4681                	li	a3,0
23006e26:	fed7ac23          	sw	a3,-8(a5) # 200bff8 <StackSize+0x200bbf8>
23006e2a:	4701                	li	a4,0
23006e2c:	fee7ae23          	sw	a4,-4(a5)
bflb_platform_init_time():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:315
23006e30:	0141                	addi	sp,sp,16
23006e32:	8082                	ret

23006e34 <bflb_platform_deinit_time>:
bflb_platform_deinit_time():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:319
23006e34:	451d                	li	a0,7
23006e36:	a99fe06f          	j	230058ce <clic_disable_interrupt>

23006e3a <bflb_platform_init>:
bflb_platform_init():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:341
23006e3a:	0c818793          	addi	a5,gp,200 # 42021948 <init_flag>
23006e3e:	4398                	lw	a4,0(a5)
23006e40:	c311                	beqz	a4,23006e44 <bflb_platform_init+0xa>
23006e42:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:340
23006e44:	1141                	addi	sp,sp,-16
23006e46:	c606                	sw	ra,12(sp)
23006e48:	c422                	sw	s0,8(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:344
23006e4a:	4705                	li	a4,1
23006e4c:	c398                	sw	a4,0(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:346
23006e4e:	842a                	mv	s0,a0
23006e50:	fbbff0ef          	jal	ra,23006e0a <bflb_platform_init_time>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:348
23006e54:	eb6ff0ef          	jal	ra,2300650a <Sec_Eng_Trng_Enable>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:350
23006e58:	0cc1c783          	lbu	a5,204(gp) # 4202194c <uart_dbg_disable>
23006e5c:	c789                	beqz	a5,23006e66 <bflb_platform_init+0x2c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:354
23006e5e:	40b2                	lw	ra,12(sp)
23006e60:	4422                	lw	s0,8(sp)
23006e62:	0141                	addi	sp,sp,16
23006e64:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:351
23006e66:	8522                	mv	a0,s0
23006e68:	d11ff0ef          	jal	ra,23006b78 <bflb_platform_uart_dbg_init>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:352
23006e6c:	4000f7b7          	lui	a5,0x4000f
23006e70:	1087a583          	lw	a1,264(a5) # 4000f108 <__ram_load_addr+0x1d0057a0>
23006e74:	000f47b7          	lui	a5,0xf4
23006e78:	24078793          	addi	a5,a5,576 # f4240 <StackSize+0xf3e40>
23006e7c:	02f5d5b3          	divu	a1,a1,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:354
23006e80:	4422                	lw	s0,8(sp)
23006e82:	40b2                	lw	ra,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:352
23006e84:	23008537          	lui	a0,0x23008
23006e88:	f1850513          	addi	a0,a0,-232 # 23007f18 <CSWTCH.116+0x28>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:354
23006e8c:	0141                	addi	sp,sp,16
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:352
23006e8e:	de5ff06f          	j	23006c72 <bflb_platform_printf>

23006e92 <bflb_platform_deinit>:
bflb_platform_deinit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:359
23006e92:	0c818793          	addi	a5,gp,200 # 42021948 <init_flag>
23006e96:	4398                	lw	a4,0(a5)
23006e98:	e311                	bnez	a4,23006e9c <bflb_platform_deinit+0xa>
23006e9a:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:358
23006e9c:	1141                	addi	sp,sp,-16
23006e9e:	c606                	sw	ra,12(sp)
bflb_platform_deinit_time():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:319
23006ea0:	451d                	li	a0,7
bflb_platform_deinit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:362
23006ea2:	0007a023          	sw	zero,0(a5)
bflb_platform_deinit_time():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:319
23006ea6:	a29fe0ef          	jal	ra,230058ce <clic_disable_interrupt>
bflb_platform_deinit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:366
23006eaa:	eb4ff0ef          	jal	ra,2300655e <Sec_Eng_Trng_Disable>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:368
23006eae:	0cc1c783          	lbu	a5,204(gp) # 4202194c <uart_dbg_disable>
23006eb2:	c791                	beqz	a5,23006ebe <bflb_platform_deinit+0x2c>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:372
23006eb4:	40b2                	lw	ra,12(sp)
bflb_platform_deinit_time():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:319
23006eb6:	451d                	li	a0,7
bflb_platform_deinit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:372
23006eb8:	0141                	addi	sp,sp,16
bflb_platform_deinit_time():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:319
23006eba:	a15fe06f          	j	230058ce <clic_disable_interrupt>
bflb_platform_deinit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:369
23006ebe:	d9bff0ef          	jal	ra,23006c58 <bflb_platform_uart_dbg_deinit>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:372
23006ec2:	40b2                	lw	ra,12(sp)
bflb_platform_deinit_time():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:319
23006ec4:	451d                	li	a0,7
bflb_platform_deinit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:372
23006ec6:	0141                	addi	sp,sp,16
bflb_platform_deinit_time():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:319
23006ec8:	a07fe06f          	j	230058ce <clic_disable_interrupt>

23006ecc <bflb_platform_print_set>:
bflb_platform_print_set():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:376
23006ecc:	0ca18623          	sb	a0,204(gp) # 4202194c <uart_dbg_disable>
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/platform_print//platform_device.c:377
23006ed0:	8082                	ret
23006ed2:	0000                	unimp
23006ed4:	37fd                	jal	23006ec2 <bflb_platform_deinit+0x30>
23006ed6:	587a                	lw	a6,188(sp)
23006ed8:	005a                	c.slli	zero,0x16
23006eda:	0000                	unimp
23006edc:	4800                	lw	s0,16(s0)
23006ede:	01e8                	addi	a0,sp,204
23006ee0:	8480                	0x8480
23006ee2:	001e                	c.slli	zero,0x7
23006ee4:	00000003          	lb	zero,0(zero) # 0 <__metal_chicken_bit>
23006ee8:	0000                	unimp
	...

23006eec <__clz_tab>:
23006eec:	0100 0202 0303 0303 0404 0404 0404 0404     ................
23006efc:	0505 0505 0505 0505 0505 0505 0505 0505     ................
23006f0c:	0606 0606 0606 0606 0606 0606 0606 0606     ................
23006f1c:	0606 0606 0606 0606 0606 0606 0606 0606     ................
23006f2c:	0707 0707 0707 0707 0707 0707 0707 0707     ................
23006f3c:	0707 0707 0707 0707 0707 0707 0707 0707     ................
23006f4c:	0707 0707 0707 0707 0707 0707 0707 0707     ................
23006f5c:	0707 0707 0707 0707 0707 0707 0707 0707     ................
23006f6c:	0808 0808 0808 0808 0808 0808 0808 0808     ................
23006f7c:	0808 0808 0808 0808 0808 0808 0808 0808     ................
23006f8c:	0808 0808 0808 0808 0808 0808 0808 0808     ................
23006f9c:	0808 0808 0808 0808 0808 0808 0808 0808     ................
23006fac:	0808 0808 0808 0808 0808 0808 0808 0808     ................
23006fbc:	0808 0808 0808 0808 0808 0808 0808 0808     ................
23006fcc:	0808 0808 0808 0808 0808 0808 0808 0808     ................
23006fdc:	0808 0808 0808 0808 0808 0808 0808 0808     ................
23006fec:	6547 2074 5746 253a 0d73 000a 6547 2074     Get FW:%s...Get 
23006ffc:	5746 4920 3a44 6425 0a0d 0000 6e45 7274     FW ID:%d....Entr
2300700c:	2079 6f6e 2074 6f66 6e75 0d64 000a 0000     y not found.....
2300701c:	614e 656d 253d 0d73 000a 0000 6741 3d65     Name=%s.....Age=
2300702c:	6425 0a0d 0000 0000 6361 6974 6576 4920     %d......active I
2300703c:	646e 7865 253d 0d64 000a 0000 6361 6974     ndex=%d.....acti
2300704c:	6576 4120 6464 6572 7373 253d 3830 0d78     ve Address=%08x.
2300705c:	000a 0000 6843 6365 206b 6d49 0d67 000a     ....Check Img...
2300706c:	6552 6461 6620 2077 6166 6c69 0a0d 0000     Read fw fail....
2300707c:	5a58 6920 616d 6567 0a0d 0000 6d49 2067     XZ image....Img 
2300708c:	6564 6f63 706d 6572 7373 6620 6961 0d6c     decompress fail.
2300709c:	000a 0000 7245 7361 2065 6c66 7361 2068     ....Erase flash 
230070ac:	6166 6c69 0000 0000 6552 6461 4620 2057     fail....Read FW 
230070bc:	6166 6c69 7720 6568 206e 6f63 7970 0a0d     fail when copy..
230070cc:	0000 0000 7257 7469 2065 6c66 7361 2068     ....Write flash 
230070dc:	6166 6c69 0000 0000 3731 313a 3a32 3134     fail....17:12:41
230070ec:	0000 0000 7541 2067 3031 3220 3230 0030     ....Aug 10 2020.
230070fc:	4c42 5053 425f 6f6f 3274 435f 3a50 7325     BLSP_Boot2_CP:%s
2300710c:	252c 0d73 000a 0000 4c42 5053 425f 6f6f     ,%s.....BLSP_Boo
2300711c:	3274 4d5f 3a43 7325 252c 0d73 000a 0000     t2_MC:%s,%s.....
2300712c:	4c42 5053 425f 6f6f 3274 535f 3a50 7325     BLSP_Boot2_SP:%s
2300713c:	252c 0d73 000a 0000 3437 3130 3337 3438     ,%s.....74017384
2300714c:	3530 6564 6530 3132 6332 6463 3264 3338     05de0e212ccdd283
2300715c:	6665 6666 6465 3132 3932 3735 6632 3434     efffed2129572f44
2300716c:	0000 0000 434d 2055 4453 3a4b 7325 0a0d     ....MCU SDK:%s..
2300717c:	0000 0000 3836 6439 6564 6239 6239 3165     ....689dde9b9be1
2300718c:	6138 3665 3339 3763 6332 3861 6337 3433     8ae693c72ca87c34
2300719c:	3638 3537 3132 3336 3839 3961 0000 0000     8675216398a9....
230071ac:	5342 2050 7244 7669 7265 253a 0d73 000a     BSP Driver:%s...
230071bc:	6532 6631 3135 3765 3065 3237 6262 3565     2e1f51e7e072bbe5
230071cc:	6365 6438 3164 3033 6261 6438 6232 3235     ec8dd130ab8d2b52
230071dc:	6365 3264 3762 6165 0000 0000 5342 2050     ecd2b7ea....BSP 
230071ec:	6f43 6d6d 6e6f 253a 0d73 000a 6547 2074     Common:%s...Get 
230071fc:	6665 7375 2065 6f63 666e 6769 0a0d 0000     efuse config....
2300720c:	6f4e 7620 6c61 6469 5020 0d54 000a 0000     No valid PT.....
2300721c:	6341 6974 6576 5020 3a54 6425 252c 0d64     Active PT:%d,%d.
2300722c:	000a 0000 666d 0067 4958 5f50 4653 616c     ....mfg.XIP_SFla
2300723c:	6873 525f 6165 5f64 654e 6465 4c5f 636f     sh_Read_Need_Loc
2300724c:	3a6b 3025 7838 002c 7325 0000 464d 2047     k:%08x,.%s..MFG 
2300725c:	6f6e 2074 6f66 6e75 0064 0000 6f42 746f     not found...Boot
2300726c:	7320 6174 7472 0a0d 0000 0000 6f42 746f      start......Boot
2300727c:	7220 7465 7275 206e 6425 0a0d 0000 0000      return %d......
2300728c:	6843 6365 206b 6f52 6c6c 6162 6b63 0a0d     Check Rollback..
2300729c:	0000 0000 6f52 6c6c 6162 6b63 2520 0d64     ....Rollback %d.
230072ac:	000a 0000 7055 6164 6574 5020 2054 6e65     ....Update PT en
230072bc:	7274 2079 6166 6c69 0a0d 0000 654d 6964     try fail....Medi
230072cc:	2061 6f62 746f 7220 7465 7275 206e 6425     a boot return %d
230072dc:	0a0d 0000 4c42 5053 6220 6f6f 3274 6620     ....BLSP boot2 f
230072ec:	6961 0d6c 000a 0000 3025 7832 0020 0000     ail.....%02x ...
230072fc:	654d 6964 2061 6f62 746f 6d20 6961 0d6e     Media boot main.
2300730c:	000a 0000 5043 2055 6425 6e20 746f 6220     ....CPU %d not b
2300731c:	6f6f 0d74 000a 0000 2052 6568 6461 7265     oot.....R header
2300732c:	6620 6f72 206d 3025 7838 0a0d 0000 0000      from %08x......
2300733c:	2052 4b50 0a0d 0000 2052 4b50 0d32 000a     R PK....R PK2...
2300734c:	2052 4953 3147 0a0d 0000 0000 2052 4953     R SIG1......R SI
2300735c:	3247 0a0d 0000 0000 2052 5649 0a0d 0000     G2......R IV....
2300736c:	6143 206c 6168 6873 0a0d 0000 6f46 6e75     Cal hash....Foun
2300737c:	2064 6e4f 2065 6d69 2067 6e4f 796c 0a0d     d One img Only..
2300738c:	0000 0000 6d49 6761 2065 6f72 6c6c 6220     ....Image roll b
2300739c:	6361 0d6b 000a 0000 6f6e 7620 6c61 6469     ack.....no valid
230073ac:	6920 676d 6620 756f 646e 0a0d 0000 0000      img found......
230073bc:	3025 7838 252c 3830 0d78 000a 5043 2055     %08x,%08x...CPU 
230073cc:	6f43 6e75 2074 6425 252c 0d64 000a 0000     Count %d,%d.....
230073dc:	5043 2055 6425 6220 6f6f 2074 6166 6c69     CPU %d boot fail
230073ec:	0a0d 0000 4541 2053 5649 6320 6372 6520     ....AES IV crc e
230073fc:	7272 726f 0a0d 0000 7243 2063 6769 6f6e     rror....Crc igno
2300740c:	6572 0d64 000a 0000 6f62 746f 6568 6461     red.....boothead
2300741c:	7265 6320 6372 6520 7272 726f 0a0d 0000     er crc error....
2300742c:	4642 504e 0000 0000 4642 5041 0000 0000     BFNP....BFAP....
2300743c:	614d 6967 2063 6f63 6564 6520 7272 726f     Magic code error
2300744c:	0a0d 0000 6e45 7263 7079 2074 6f6e 2074     ....Encrypt not 
2300745c:	6966 0d74 000a 0000 6973 6e67 6e20 746f     fit.....sign not
2300746c:	6620 7469 0a0d 0000 6973 6e67 2520 2c64      fit....sign %d,
2300747c:	6e65 7263 7079 3a74 6425 0a0d 0000 0000     encrypt:%d......
2300748c:	4b50 7320 6168 6520 7272 726f 0a0d 0000     PK sha error....
2300749c:	4b50 6320 6372 6520 7272 726f 0a0d 0000     PK crc error....
230074ac:	4953 2047 7263 2063 7265 6f72 0d72 000a     SIG crc error...
230074bc:	6148 6873 6520 7272 726f 0a0d 0000 0000     Hash error......
230074cc:	6425 252c 0d64 000a 6843 6365 206b 6973     %d,%d...Check si
230074dc:	3167 0a0d 0000 0000 6576 6972 7966 6620     g1......verify f
230074ec:	6961 656c 0a64 0000 6954 656d 253d 2064     ailed...Time=%d 
230074fc:	736d 0a0d 0000 0000 7553 6363 7365 0d73     ms......Success.
2300750c:	000a 0000 654d 6f6d 7972 6120 6c6c 636f     ....Memory alloc
2300751c:	7461 6f69 206e 6166 6c69 6465 000a 0000     ation failed....
2300752c:	5a58 4620 6565 6964 676e 0a0d 0000 0000     XZ Feeding......
2300753c:	6552 6461 5820 465a 2057 6166 6c69 0a0d     Read XZFW fail..
2300754c:	0000 0000 5a58 6f20 7475 7570 6974 676e     ....XZ outputing
2300755c:	0a0d 0000 654d 6f6d 7972 7520 6173 6567     ....Memory usage
2300756c:	6c20 6d69 7469 7220 6165 6863 6465 000a      limit reached..
2300757c:	6f4e 2074 2061 782e 207a 6966 656c 000a     Not a .xz file..
2300758c:	6e55 7573 7070 726f 6574 2064 706f 6974     Unsupported opti
2300759c:	6e6f 2073 6e69 7420 6568 2e20 7a78 6820     ons in the .xz h
230075ac:	6165 6564 7372 000a 6946 656c 6920 2073     eaders..File is 
230075bc:	6f63 7272 7075 0a74 0000 0000 5a58 4220     corrupt.....XZ B
230075cc:	6775 0a21 0000 0000 6f52 6c6c 6162 6b63     ug!.....Rollback
230075dc:	5520 6470 7461 2065 6150 7472 7469 6f69      Update Partitio
230075ec:	206e 6174 6c62 2065 6e65 7274 2079 6166     n table entry fa
230075fc:	6c69 0a0d 0000 0000 6f44 4420 6365 6d6f     il......Do Decom
2300760c:	7270 7365 2073 7055 6164 6574 5020 7261     press Update Par
2300761c:	6974 6974 6e6f 7420 6261 656c 6520 746e     tition table ent
2300762c:	7972 6620 6961 0d6c 000a 0000 5a58 4420     ry fail.....XZ D
2300763c:	6365 6d6f 7270 7365 2073 6166 6c69 0a0d     ecompress fail..
2300764c:	0000 0000 6f43 6e75 6574 2072 6176 756c     ....Counter valu
2300765c:	3d65 6425 000a 0000 7573 206d 203d 3158     e=%d....sum = X1
2300766c:	0a0d 0000 7245 6f72 2172 6920 666e 6e69     ....Error! infin
2300767c:	7469 2065 6f70 6e69 2074 202b 6e69 6966     ite point + infi
2300768c:	696e 6574 7020 696f 746e 0a0d 0000 0000     nite point......

2300769c <secp256r1InvR_N>:
2300769c:	d060 3366 0549 e9c1 f807 04b6 601e 2577     `.f3I........`w%
230076ac:	deba e2f3 5643 af6f 1bce f7c8 199c 797c     ....CVo.......|y

230076bc <secp256r1InvR_P>:
230076bc:	ffff feff 0000 0300 ffff fdff 0000 0200     ................
230076cc:	0000 0100 ffff feff 0000 0300 0000 0000     ................

230076dc <secp256r1N>:
230076dc:	ffff ffff 0000 0000 ffff ffff ffff ffff     ................
230076ec:	e6bc adfa 17a7 849e b9f3 c2ca 63fc 5125     .............c%Q

230076fc <secp256r1P>:
230076fc:	ffff ffff 0000 0100 0000 0000 0000 0000     ................
2300770c:	0000 0000 ffff ffff ffff ffff ffff ffff     ................

2300771c <secp256r1PrimeN_N>:
2300771c:	d060 3366 d6a9 1c28 fe50 ec77 88c5 f6c6     `.f3..(.P.w.....
2300772c:	c948 0844 747d e4d2 d1cc aac8 00ee 4fbc     H.D.}t.........O

2300773c <secp256r1PrimeN_P>:
2300773c:	ffff ffff 0000 0200 0000 0000 0000 0000     ................
2300774c:	0000 0100 0000 0000 0000 0000 0000 0100     ................

2300775c <secp256r1_1>:
	...
23007778:	0000 0100                                   ....

2300777c <secp256r1_1M1>:
2300777c:	0000 0000 ffff feff ffff ffff ffff ffff     ................
2300778c:	ffff ffff 0000 0000 0000 0000 0000 0000     ................

2300779c <secp256r1_1P1>:
2300779c:	0000 0000 ffff feff ffff ffff ffff ffff     ................
230077ac:	ffff ffff 0000 0000 0000 0000 0000 0200     ................

230077bc <secp256r1_BAR2>:
230077bc:	0000 0100 ffff fdff ffff ffff ffff ffff     ................
230077cc:	ffff feff 0000 0000 0000 0000 0000 0200     ................

230077dc <secp256r1_BAR3>:
230077dc:	0000 0200 ffff fcff ffff ffff ffff ffff     ................
230077ec:	ffff fdff 0000 0000 0000 0000 0000 0300     ................

230077fc <secp256r1_BAR4>:
230077fc:	0000 0300 ffff fbff ffff ffff ffff ffff     ................
2300780c:	ffff fcff 0000 0000 0000 0000 0000 0400     ................

2300781c <secp256r1_BAR8>:
2300781c:	0000 0700 ffff f7ff ffff ffff ffff ffff     ................
2300782c:	ffff f8ff 0000 0000 0000 0000 0000 0800     ................

2300783c <secp256r1_Gx>:
2300783c:	9018 765f 37a5 c655 fb79 2b73 6277 1025     .._v.7U.y.s+wb%.
2300784c:	ba75 fc95 ed5f 01b6 e779 d430 a918 3c14     u..._...y.0....<

2300785c <secp256r1_Gy>:
2300785c:	7185 18ff 8825 855d e8d2 8886 21dd 25f3     .q..%.]......!.%
2300786c:	4a8b e4b8 19ba 5ce4 f2dd 5753 95ce 0a56     .J.....\..SW..V.

2300787c <secp256r1_Zerox>:
	...

2300789c <secp256r1_Zeroy>:
2300789c:	0000 0000 ffff feff ffff ffff ffff ffff     ................
230078ac:	ffff ffff 0000 0000 0000 0000 0000 0100     ................

230078bc <lcdigits.1536>:
230078bc:	3130 3332 3534 3736 3938 6261 6463 6665     0123456789abcdef
230078cc:	0000 0000                                   ....

230078d0 <ucdigits.1537>:
230078d0:	3130 3332 3534 3736 3938 4241 4443 4645     0123456789ABCDEF
230078e0:	0000 0000 6e28 6c75 296c 0000               ....(null)..

230078ec <crc32Tab>:
230078ec:	0000 0000 3096 7707 612c ee0e 51ba 9909     .....0.w,a...Q..
230078fc:	c419 076d f48f 706a a535 e963 95a3 9e64     ..m...jp5.c...d.
2300790c:	8832 0edb b8a4 79dc e91e e0d5 d988 97d2     2......y........
2300791c:	4c2b 09b6 7cbd 7eb1 2d07 e7b8 1d91 90bf     +L...|.~.-......
2300792c:	1064 1db7 20f2 6ab0 7148 f3b9 41de 84be     d.... .jHq...A..
2300793c:	d47d 1ada e4eb 6ddd b551 f4d4 85c7 83d3     }......mQ.......
2300794c:	9856 136c a8c0 646b f97a fd62 c9ec 8a65     V.l...kdz.b...e.
2300795c:	5c4f 1401 6cd9 6306 3d63 fa0f 0df5 8d08     O\...l.cc=......
2300796c:	20c8 3b6e 105e 4c69 41e4 d560 7172 a267     . n;^.iL.A`.rqg.
2300797c:	e4d1 3c03 d447 4b04 85fd d20d b56b a50a     ...<G..K....k...
2300798c:	a8fa 35b5 986c 42b2 c9d6 dbbb f940 acbc     ...5l..B....@...
2300799c:	6ce3 32d8 5c75 45df 0dcf dcd6 3d59 abd1     .l.2u\.E....Y=..
230079ac:	30ac 26d9 003a 51de 5180 c8d7 6116 bfd0     .0.&:..Q.Q...a..
230079bc:	f4b5 21b4 c423 56b3 9599 cfba a50f b8bd     ...!#..V........
230079cc:	b89e 2802 8808 5f05 d9b2 c60c e924 b10b     ...(..._....$...
230079dc:	7c87 2f6f 4c11 5868 1dab c161 2d3d b666     .|o/.LhX..a.=-f.
230079ec:	4190 76dc 7106 01db 20bc 98d2 102a efd5     .A.v.q... ..*...
230079fc:	8589 71b1 b51f 06b6 e4a5 9fbf d433 e8b8     ...q........3...
23007a0c:	c9a2 7807 f934 0f00 a88e 9609 9818 e10e     ...x4...........
23007a1c:	0dbb 7f6a 3d2d 086d 6c97 9164 5c01 e663     ..j.-=m..ld..\c.
23007a2c:	51f4 6b6b 6162 1c6c 30d8 8565 004e f262     .Qkkbal..0e.N.b.
23007a3c:	95ed 6c06 a57b 1b01 f4c1 8208 c457 f50f     ...l{.......W...
23007a4c:	d9c6 65b0 e950 12b7 b8ea 8bbe 887c fcb9     ...eP.......|...
23007a5c:	1ddf 62dd 2d49 15da 7cf3 8cd3 4c65 fbd4     ...bI-...|..eL..
23007a6c:	6158 4db2 51ce 3ab5 0074 a3bc 30e2 d4bb     Xa.M.Q.:t....0..
23007a7c:	a541 4adf 95d7 3dd8 c46d a4d1 f4fb d3d6     A..J...=m.......
23007a8c:	e96a 4369 d9fc 346e 8846 ad67 b8d0 da60     j.iC..n4F.g...`.
23007a9c:	2d73 4404 1de5 3303 4c5f aa0a 7cc9 dd0d     s-.D...3_L...|..
23007aac:	713c 5005 41aa 2702 1010 be0b 2086 c90c     <q.P.A.'..... ..
23007abc:	b525 5768 85b3 206f d409 b966 e49f ce61     %.hW..o ..f...a.
23007acc:	f90e 5ede c998 29d9 9822 b0d0 a8b4 c7d7     ...^...)".......
23007adc:	3d17 59b3 0d81 2eb4 5c3b b7bd 6cad c0ba     .=.Y....;\...l..
23007aec:	8320 edb8 b3b6 9abf e20c 03b6 d29a 74b1      ..............t
23007afc:	4739 ead5 77af 9dd2 2615 04db 1683 73dc     9G...w...&.....s
23007b0c:	0b12 e363 3b84 9464 6a3e 0d6d 5aa8 7a6a     ..c..;d.>jm..Zjz
23007b1c:	cf0b e40e ff9d 9309 ae27 0a00 9eb1 7d07     ........'......}
23007b2c:	9344 f00f a3d2 8708 f268 1e01 c2fe 6906     D.......h......i
23007b3c:	575d f762 67cb 8065 3671 196c 06e7 6e6b     ]Wb..ge.q6l...kn
23007b4c:	1b76 fed4 2be0 89d3 7a5a 10da 4acc 67dd     v....+..Zz...J.g
23007b5c:	df6f f9b9 eff9 8ebe be43 17b7 8ed5 60b0     o.......C......`
23007b6c:	a3e8 d6d6 937e a1d1 c2c4 38d8 f252 4fdf     ....~......8R..O
23007b7c:	67f1 d1bb 5767 a6bc 06dd 3fb5 364b 48b2     .g..gW.....?K6.H
23007b8c:	2bda d80d 1b4c af0a 4af6 3603 7a60 4104     .+..L....J.6`z.A
23007b9c:	efc3 df60 df55 a867 8eef 316e be79 4669     ..`.U.g...n1y.iF
23007bac:	b38c cb61 831a bc66 d2a0 256f e236 5268     ..a...f...o%6.hR
23007bbc:	7795 cc0c 4703 bb0b 16b9 2202 262f 5505     .w...G....."/&.U
23007bcc:	3bbe c5ba 0b28 b2bd 5a92 2bb4 6a04 5cb3     .;..(....Z.+.j.\
23007bdc:	ffa7 c2d7 cf31 b5d0 9e8b 2cd9 ae1d 5bde     ....1......,...[
23007bec:	c2b0 9b64 f226 ec63 a39c 756a 930a 026d     ..d.&.c...ju..m.
23007bfc:	06a9 9c09 363f eb0e 6785 7207 5713 0500     ....?6...g.r.W..
23007c0c:	4a82 95bf 7a14 e2b8 2bae 7bb1 1b38 0cb6     .J...z...+.{8...
23007c1c:	8e9b 92d2 be0d e5d5 efb7 7cdc df21 0bdb     ...........|!...
23007c2c:	d2d4 86d3 e242 f1d4 b3f8 68dd 836e 1fda     ....B......hn...
23007c3c:	16cd 81be 265b f6b9 77e1 6fb0 4777 18b7     ....[&...w.owG..
23007c4c:	5ae6 8808 6a70 ff0f 3bca 6606 0b5c 1101     .Z..pj...;.f\...
23007c5c:	9eff 8f65 ae69 f862 ffd3 616b cf45 166c     ..e.i.b...kaE.l.
23007c6c:	e278 a00a d2ee d70d 8354 4e04 b3c2 3903     x.......T..N...9
23007c7c:	2661 a767 16f7 d060 474d 4969 77db 3e6e     a&g...`.MGiI.wn>
23007c8c:	6a4a aed1 5adc d9d6 0b66 40df 3bf0 37d8     Jj...Z..f..@.;.7
23007c9c:	ae53 a9bc 9ec5 debb cf7f 47b2 ffe9 30b5     S..........G...0
23007cac:	f21c bdbd c28a caba 9330 53b3 a3a6 24b4     ........0..S...$
23007cbc:	3605 bad0 0693 cdd7 5729 54de 67bf 23d9     .6......)W.T.g.#
23007ccc:	7a2e b366 4ab8 c461 1b02 5d68 2b94 2a6f     .zf..Ja...h].+o*
23007cdc:	be37 b40b 8ea1 c30c df1b 5a05 ef8d 2d02     7..........Z...-
23007cec:	37fd 587a 005a 0000 5a59 0000 6953 706d     .7zXZ...YZ..Simp
23007cfc:	656c 4620 6572 2065 3025 7838 0a0d 0000     le Free %08x....
23007d0c:	6953 706d 656c 4d20 6c61 6f6c 2063 6425     Simple Malloc %d
23007d1c:	0a0d 0000 7845 6563 7470 6f69 206e 6873     ....Exception sh
23007d2c:	756f 646c 6e20 746f 6220 2065 6568 6572     ould not be here
23007d3c:	0a0d 0000 6e49 6574 7272 7075 2074 756e     ....Interrupt nu
23007d4c:	3a6d 6425 4920 5152 6148 646e 656c 2072     m:%d IRQHandler 
23007d5c:	6f6e 2074 6e69 7473 6c61 656c 0d64 000a     not installed...
23007d6c:	6550 6972 6870 7265 6c61 4920 746e 7265     Peripheral Inter
23007d7c:	7572 7470 6e20 6d75 253a 2064 0a0d 0000     rupt num:%d ....
23007d8c:	6e55 7865 6570 7463 6465 6920 746e 7265     Unexpected inter
23007d9c:	7572 7470 6e20 6d75 253a 0d64 000a 0000     rupt num:%d.....
23007dac:	7254 7061 485f 6e61 6c64 7265 0a0d 0000     Trap_Handler....
23007dbc:	636d 7561 6573 253d 3830 0d78 000a 0000     mcause=%08x.....
23007dcc:	656d 6370 253a 3830 0d78 000a 746d 6176     mepc:%08x...mtva
23007ddc:	3a6c 3025 7838 0a0d 0000 0000 6e49 7473     l:%08x......Inst
23007dec:	7572 7463 6f69 206e 6361 6563 7373 6620     ruction access f
23007dfc:	7561 746c 0a0d 0000 6c49 656c 6167 206c     ault....Illegal 
23007e0c:	6e69 7473 7572 7463 6f69 0d6e 000a 0000     instruction.....
23007e1c:	7242 6165 706b 696f 746e 0a0d 0000 0000     Breakpoint......
23007e2c:	6f4c 6461 6120 6464 6572 7373 6d20 7369     Load address mis
23007e3c:	6c61 6769 656e 0d64 000a 0000 6f4c 6461     aligned.....Load
23007e4c:	6120 6363 7365 2073 6166 6c75 0d74 000a      access fault...
23007e5c:	7453 726f 2f65 4d41 204f 6461 7264 7365     Store/AMO addres
23007e6c:	2073 696d 6173 696c 6e67 6465 0a0d 0000     s misaligned....
23007e7c:	7453 726f 2f65 4d41 204f 6361 6563 7373     Store/AMO access
23007e8c:	6620 7561 746c 0a0d 0000 0000 6e45 6976      fault......Envi
23007e9c:	6f72 6d6e 6e65 2074 6163 6c6c 6620 6f72     ronment call fro
23007eac:	206d 2d55 6f6d 6564 0a0d 0000 6e45 6976     m U-mode....Envi
23007ebc:	6f72 6d6e 6e65 2074 6163 6c6c 6620 6f72     ronment call fro
23007ecc:	206d 2d4d 6f6d 6564 0a0d 0000 6143 7375     m M-mode....Caus
23007edc:	2065 756e 3d6d 6425 0a0d 0000               e num=%d....

23007ee8 <uartAddr>:
23007ee8:	a000 4000 a100 4000                         ...@...@

23007ef0 <CSWTCH.116>:
23007ef0:	0008 0010 0020 0040 0060 0080 00c0 0100     .... .@.`.......
23007f00:	0180 0200 4155 5452 5220 6365 2076 7546     ....UART Recv Fu
23007f10:	6c6c 0a0d 0000 0000 7973 7473 6d65 6320     ll......system c
23007f20:	6f6c 6b63 253d 4d64 0a0d 0000 0001 0101     lock=%dM........
23007f30:	1010 0000                                   ....

Disassembly of section .itcm_region:

22010000 <BLSP_Boot2_Jump_Entry>:
BLSP_Boot2_Jump_Entry():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:180
22010000:	1141                	addi	sp,sp,-16
22010002:	c422                	sw	s0,8(sp)
22010004:	c226                	sw	s1,4(sp)
22010006:	c606                	sw	ra,12(sp)
22010008:	c04a                	sw	s2,0(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:185
2201000a:	223d                	jal	22010138 <BLSP_Sboot_Finish>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:189
2201000c:	ddc1c783          	lbu	a5,-548(gp) # 4202165c <efuseCfg>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:191
22010010:	42021437          	lui	s0,0x42021
22010014:	09c40613          	addi	a2,s0,156 # 4202109c <__ram_data_end__>
22010018:	e2c18593          	addi	a1,gp,-468 # 420216ac <flashCfg>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:189
2201001c:	cf9d                	beqz	a5,2201005a <BLSP_Boot2_Jump_Entry+0x5a>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:191
2201001e:	4501                	li	a0,0
22010020:	2439                	jal	2201022e <BLSP_Boot2_Set_Cache>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:196
22010022:	ed1d                	bnez	a0,22010060 <BLSP_Boot2_Jump_Entry+0x60>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:201
22010024:	ddc1c783          	lbu	a5,-548(gp) # 4202165c <efuseCfg>
22010028:	e3d1                	bnez	a5,220100ac <BLSP_Boot2_Jump_Entry+0xac>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:230
2201002a:	0ac1c703          	lbu	a4,172(gp) # 4202192c <cpuCount>
2201002e:	4785                	li	a5,1
22010030:	02e7ee63          	bltu	a5,a4,2201006c <BLSP_Boot2_Jump_Entry+0x6c>
22010034:	42021437          	lui	s0,0x42021
22010038:	09c40413          	addi	s0,s0,156 # 4202109c <__ram_data_end__>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:241
2201003c:	00344783          	lbu	a5,3(s0)
22010040:	eba1                	bnez	a5,22010090 <BLSP_Boot2_Jump_Entry+0x90>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:255
22010042:	0ac1c703          	lbu	a4,172(gp) # 4202192c <cpuCount>
22010046:	4785                	li	a5,1
22010048:	00f70563          	beq	a4,a5,22010052 <BLSP_Boot2_Jump_Entry+0x52>
2201004c:	00944783          	lbu	a5,9(s0)
22010050:	c7f1                	beqz	a5,2201011c <BLSP_Boot2_Jump_Entry+0x11c>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:261
22010052:	06400513          	li	a0,100
22010056:	2e0d                	jal	22010388 <BL602_Delay_MS>
22010058:	bfed                	j	22010052 <BLSP_Boot2_Jump_Entry+0x52>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:194
2201005a:	4505                	li	a0,1
2201005c:	2ac9                	jal	2201022e <BLSP_Boot2_Set_Cache>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:196
2201005e:	d179                	beqz	a0,22010024 <BLSP_Boot2_Jump_Entry+0x24>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:263
22010060:	40b2                	lw	ra,12(sp)
22010062:	4422                	lw	s0,8(sp)
22010064:	4492                	lw	s1,4(sp)
22010066:	4902                	lw	s2,0(sp)
22010068:	0141                	addi	sp,sp,16
2201006a:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:231
2201006c:	09c40413          	addi	s0,s0,156
22010070:	2e344603          	lbu	a2,739(s0)
22010074:	420217b7          	lui	a5,0x42021
22010078:	08078793          	addi	a5,a5,128 # 42021080 <__system_ram_data_end__>
2201007c:	47d4                	lw	a3,12(a5)
2201007e:	e641                	bnez	a2,22010106 <BLSP_Boot2_Jump_Entry+0x106>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:235
22010080:	0006a023          	sw	zero,0(a3)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:236
22010084:	4b9c                	lw	a5,16(a5)
22010086:	0007a023          	sw	zero,0(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:241
2201008a:	00344783          	lbu	a5,3(s0)
2201008e:	dbd5                	beqz	a5,22010042 <BLSP_Boot2_Jump_Entry+0x42>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:243
22010090:	481c                	lw	a5,16(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:242
22010092:	01442903          	lw	s2,20(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:243
22010096:	e3c1                	bnez	a5,22010116 <BLSP_Boot2_Jump_Entry+0x116>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:247
22010098:	4785                	li	a5,1
2201009a:	00f70563          	beq	a4,a5,220100a4 <BLSP_Boot2_Jump_Entry+0xa4>
2201009e:	00944783          	lbu	a5,9(s0)
220100a2:	cfbd                	beqz	a5,22010120 <BLSP_Boot2_Jump_Entry+0x120>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:250
220100a4:	f8090fe3          	beqz	s2,22010042 <BLSP_Boot2_Jump_Entry+0x42>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:251
220100a8:	9902                	jalr	s2
220100aa:	bf61                	j	22010042 <BLSP_Boot2_Jump_Entry+0x42>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:202
220100ac:	09c40593          	addi	a1,s0,156
220100b0:	4501                	li	a0,0
220100b2:	2a11                	jal	220101c6 <BLSP_Boot2_Set_Encrypt>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:203
220100b4:	420215b7          	lui	a1,0x42021
220100b8:	37c58593          	addi	a1,a1,892 # 4202137c <__ram_data_end__+0x2e0>
220100bc:	4505                	li	a0,1
220100be:	2221                	jal	220101c6 <BLSP_Boot2_Set_Encrypt>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:217
220100c0:	2421                	jal	220102c8 <BLSP_Boot2_Get_Feature_Flag>
220100c2:	4789                	li	a5,2
220100c4:	f6f513e3          	bne	a0,a5,2201002a <BLSP_Boot2_Jump_Entry+0x2a>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:219
220100c8:	09c40413          	addi	s0,s0,156
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:222
220100cc:	00544783          	lbu	a5,5(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:219
220100d0:	4c0c                	lw	a1,24(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:220
220100d2:	4810                	lw	a2,16(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:221
220100d4:	4854                	lw	a3,20(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:222
220100d6:	2ef402a3          	sb	a5,741(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:230
220100da:	0ac1c703          	lbu	a4,172(gp) # 4202192c <cpuCount>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:223
220100de:	4785                	li	a5,1
220100e0:	2ef401a3          	sb	a5,739(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:224
220100e4:	47bd                	li	a5,15
220100e6:	2ef40323          	sb	a5,742(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:219
220100ea:	2eb42c23          	sw	a1,760(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:220
220100ee:	2ec42823          	sw	a2,752(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:221
220100f2:	2ed42a23          	sw	a3,756(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:230
220100f6:	4785                	li	a5,1
220100f8:	f8e7f9e3          	bgeu	a5,a4,2201008a <BLSP_Boot2_Jump_Entry+0x8a>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:231
220100fc:	420217b7          	lui	a5,0x42021
22010100:	08078793          	addi	a5,a5,128 # 42021080 <__system_ram_data_end__>
22010104:	47d4                	lw	a3,12(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:232
22010106:	2f042603          	lw	a2,752(s0)
2201010a:	c290                	sw	a2,0(a3)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:233
2201010c:	4b9c                	lw	a5,16(a5)
2201010e:	2f442683          	lw	a3,756(s0)
22010112:	c394                	sw	a3,0(a5)
22010114:	bf9d                	j	2201008a <BLSP_Boot2_Jump_Entry+0x8a>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:244
22010116:	00f00133          	add	sp,zero,a5
2201011a:	bfbd                	j	22010098 <BLSP_Boot2_Jump_Entry+0x98>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:256
2201011c:	205d                	jal	220101c2 <BLSP_Boot2_Releae_Other_CPU>
2201011e:	bf15                	j	22010052 <BLSP_Boot2_Jump_Entry+0x52>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_common.c:248
22010120:	204d                	jal	220101c2 <BLSP_Boot2_Releae_Other_CPU>
22010122:	b749                	j	220100a4 <BLSP_Boot2_Jump_Entry+0xa4>

22010124 <BLSP_MediaBoot_Read>:
BLSP_MediaBoot_Read():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:338
22010124:	230007b7          	lui	a5,0x23000
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:337
22010128:	1141                	addi	sp,sp,-16
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:338
2201012a:	953e                	add	a0,a0,a5
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:337
2201012c:	c606                	sw	ra,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:338
2201012e:	25f5                	jal	2201081a <XIP_SFlash_Read_Via_Cache_Need_Lock>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_media_boot.c:341
22010130:	40b2                	lw	ra,12(sp)
22010132:	4501                	li	a0,0
22010134:	0141                	addi	sp,sp,16
22010136:	8082                	ret

22010138 <BLSP_Sboot_Finish>:
BLSP_Sboot_Finish():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:579
22010138:	40005737          	lui	a4,0x40005
2201013c:	433c                	lw	a5,64(a4)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:581
2201013e:	f00006b7          	lui	a3,0xf0000
22010142:	8fd5                	or	a5,a5,a3
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:583
22010144:	c33c                	sw	a5,64(a4)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:584
22010146:	8082                	ret

22010148 <BLSP_Boot2_Get_Clk_Cfg>:
BLSP_Boot2_Get_Clk_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:171
22010148:	85aa                	mv	a1,a0
2201014a:	23000537          	lui	a0,0x23000
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:169
2201014e:	1141                	addi	sp,sp,-16
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:171
22010150:	4641                	li	a2,16
22010152:	06450513          	addi	a0,a0,100 # 23000064 <__text_code_start__+0x64>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:169
22010156:	c606                	sw	ra,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:171
22010158:	25c9                	jal	2201081a <XIP_SFlash_Read_Via_Cache_Need_Lock>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:175
2201015a:	40b2                	lw	ra,12(sp)
2201015c:	4501                	li	a0,0
2201015e:	0141                	addi	sp,sp,16
22010160:	8082                	ret

22010162 <BLSP_Boot2_Get_Efuse_Cfg>:
BLSP_Boot2_Get_Efuse_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:199
22010162:	1101                	addi	sp,sp,-32
22010164:	cc22                	sw	s0,24(sp)
22010166:	842a                	mv	s0,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:202
22010168:	4505                	li	a0,1
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:199
2201016a:	ce06                	sw	ra,28(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:202
2201016c:	7b2000ef          	jal	ra,2201091e <HBN_Set_ROOT_CLK_Sel>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:205
22010170:	85a2                	mv	a1,s0
22010172:	00240513          	addi	a0,s0,2
22010176:	00ff6097          	auipc	ra,0xff6
2201017a:	d5c080e7          	jalr	-676(ra) # 23005ed2 <EF_Ctrl_Read_Secure_Boot>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:207
2201017e:	4621                	li	a2,8
22010180:	01040593          	addi	a1,s0,16
22010184:	4501                	li	a0,0
22010186:	00ff6097          	auipc	ra,0xff6
2201018a:	e82080e7          	jalr	-382(ra) # 23006008 <EF_Ctrl_Read_AES_Key>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:208
2201018e:	00840513          	addi	a0,s0,8
22010192:	00ff6097          	auipc	ra,0xff6
22010196:	e6a080e7          	jalr	-406(ra) # 23005ffc <EF_Ctrl_Read_Chip_ID>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:210
2201019a:	006c                	addi	a1,sp,12
2201019c:	4501                	li	a0,0
2201019e:	00ff6097          	auipc	ra,0xff6
220101a2:	d74080e7          	jalr	-652(ra) # 23005f12 <EF_Ctrl_Read_Sw_Usage>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:211
220101a6:	47b2                	lw	a5,12(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:213
220101a8:	4585                	li	a1,1
220101aa:	4501                	li	a0,0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:211
220101ac:	83d9                	srli	a5,a5,0x16
220101ae:	8b85                	andi	a5,a5,1
220101b0:	00f40223          	sb	a5,4(s0)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:213
220101b4:	2f01                	jal	220108c4 <GLB_Set_System_CLK_Div>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:214
220101b6:	4509                	li	a0,2
220101b8:	279d                	jal	2201091e <HBN_Set_ROOT_CLK_Sel>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:215
220101ba:	40f2                	lw	ra,28(sp)
220101bc:	4462                	lw	s0,24(sp)
220101be:	6105                	addi	sp,sp,32
220101c0:	8082                	ret

220101c2 <BLSP_Boot2_Releae_Other_CPU>:
BLSP_Boot2_Releae_Other_CPU():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:348
220101c2:	8082                	ret

220101c4 <BLSP_Boot2_Update_System_Flash_Clk>:
BLSP_Boot2_Update_System_Flash_Clk():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:390
220101c4:	8082                	ret

220101c6 <BLSP_Boot2_Set_Encrypt>:
BLSP_Boot2_Set_Encrypt():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:407
220101c6:	0005c603          	lbu	a2,0(a1)
220101ca:	c20d                	beqz	a2,220101ec <BLSP_Boot2_Set_Encrypt+0x26>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:402
220101cc:	1141                	addi	sp,sp,-16
220101ce:	c04a                	sw	s2,0(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:408
220101d0:	00c5a903          	lw	s2,12(a1)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:402
220101d4:	c606                	sw	ra,12(sp)
220101d6:	c422                	sw	s0,8(sp)
220101d8:	c226                	sw	s1,4(sp)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:409
220101da:	00091b63          	bnez	s2,220101f0 <BLSP_Boot2_Set_Encrypt+0x2a>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:427
220101de:	40b2                	lw	ra,12(sp)
220101e0:	4422                	lw	s0,8(sp)
220101e2:	4492                	lw	s1,4(sp)
220101e4:	4902                	lw	s2,0(sp)
220101e6:	4501                	li	a0,0
220101e8:	0141                	addi	sp,sp,16
220101ea:	8082                	ret
220101ec:	4501                	li	a0,0
220101ee:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:410
220101f0:	167d                	addi	a2,a2,-1
220101f2:	842e                	mv	s0,a1
220101f4:	0ff67613          	andi	a2,a2,255
220101f8:	4581                	li	a1,0
220101fa:	84aa                	mv	s1,a0
220101fc:	2b25                	jal	22010734 <SF_Ctrl_AES_Set_Key_BE>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:411
220101fe:	4c10                	lw	a2,24(s0)
22010200:	04c40593          	addi	a1,s0,76
22010204:	8526                	mv	a0,s1
22010206:	2389                	jal	22010748 <SF_Ctrl_AES_Set_IV_BE>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:413
22010208:	4c14                	lw	a3,24(s0)
2201020a:	00844783          	lbu	a5,8(s0)
2201020e:	8526                	mv	a0,s1
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:415
22010210:	01268733          	add	a4,a3,s2
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:413
22010214:	4605                	li	a2,1
22010216:	177d                	addi	a4,a4,-1
22010218:	4585                	li	a1,1
2201021a:	2319                	jal	22010720 <SF_Ctrl_AES_Set_Region>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:422
2201021c:	29c5                	jal	2201070c <SF_Ctrl_AES_Enable_BE>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:423
2201021e:	2b15                	jal	22010752 <SF_Ctrl_AES_Enable>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:427
22010220:	40b2                	lw	ra,12(sp)
22010222:	4422                	lw	s0,8(sp)
22010224:	4492                	lw	s1,4(sp)
22010226:	4902                	lw	s2,0(sp)
22010228:	4501                	li	a0,0
2201022a:	0141                	addi	sp,sp,16
2201022c:	8082                	ret

2201022e <BLSP_Boot2_Set_Cache>:
BLSP_Boot2_Set_Cache():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:438
2201022e:	1101                	addi	sp,sp,-32
22010230:	c84a                	sw	s2,16(sp)
22010232:	892a                	mv	s2,a0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:443
22010234:	4501                	li	a0,0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:438
22010236:	ce06                	sw	ra,28(sp)
22010238:	cc22                	sw	s0,24(sp)
2201023a:	ca26                	sw	s1,20(sp)
2201023c:	842e                	mv	s0,a1
2201023e:	84b2                	mv	s1,a2
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:443
22010240:	2965                	jal	220106f8 <SF_Ctrl_Set_Owner>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:444
22010242:	8522                	mv	a0,s0
22010244:	26cd                	jal	22010626 <SFlash_Reset_Continue_Read>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:445
22010246:	4785                	li	a5,1
22010248:	04f90563          	beq	s2,a5,22010292 <BLSP_Boot2_Set_Cache+0x64>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:452
2201024c:	453d                	li	a0,15
2201024e:	2edd                	jal	22010644 <SFlash_Cache_Enable_Set>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:456
22010250:	0054c783          	lbu	a5,5(s1)
22010254:	cb89                	beqz	a5,22010266 <BLSP_Boot2_Set_Cache+0x38>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:457
22010256:	48d4                	lw	a3,20(s1)
22010258:	ff0007b7          	lui	a5,0xff000
2201025c:	23000737          	lui	a4,0x23000
22010260:	8ff5                	and	a5,a5,a3
22010262:	04e78463          	beq	a5,a4,220102aa <BLSP_Boot2_Set_Cache+0x7c>
BLSP_Boot2_Get_Feature_Flag():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:638
22010266:	81818793          	addi	a5,gp,-2024 # 42021098 <boot2Flag.9249>
2201026a:	0007c683          	lbu	a3,0(a5) # ff000000 <__noinit_data_end__+0xbcfcd6b0>
2201026e:	0ff00713          	li	a4,255
22010272:	00e68963          	beq	a3,a4,22010284 <BLSP_Boot2_Set_Cache+0x56>
BLSP_Boot2_Set_Cache():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:490
22010276:	4501                	li	a0,0
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:491
22010278:	40f2                	lw	ra,28(sp)
2201027a:	4462                	lw	s0,24(sp)
2201027c:	44d2                	lw	s1,20(sp)
2201027e:	4942                	lw	s2,16(sp)
22010280:	6105                	addi	sp,sp,32
22010282:	8082                	ret
BLSP_Boot2_Get_Feature_Flag():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:639
22010284:	23000737          	lui	a4,0x23000
22010288:	0e874703          	lbu	a4,232(a4) # 230000e8 <__Vectors+0x28>
2201028c:	00e78023          	sb	a4,0(a5)
22010290:	b7dd                	j	22010276 <BLSP_Boot2_Set_Cache+0x48>
BLSP_Boot2_Set_Cache():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:446
22010292:	00044583          	lbu	a1,0(s0)
22010296:	4791                	li	a5,4
22010298:	0078                	addi	a4,sp,12
2201029a:	4681                	li	a3,0
2201029c:	4605                	li	a2,1
2201029e:	8522                	mv	a0,s0
220102a0:	26c5                	jal	22010680 <SFlash_Read>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:447
220102a2:	d54d                	beqz	a0,2201024c <BLSP_Boot2_Set_Cache+0x1e>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:448
220102a4:	6541                	lui	a0,0x10
220102a6:	157d                	addi	a0,a0,-1
220102a8:	bfc1                	j	22010278 <BLSP_Boot2_Set_Cache+0x4a>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:458
220102aa:	4c88                	lw	a0,24(s1)
220102ac:	296d                	jal	22010766 <SF_Ctrl_Set_Flash_Image_Offset>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:459
220102ae:	0064c683          	lbu	a3,6(s1)
220102b2:	00044583          	lbu	a1,0(s0)
220102b6:	864a                	mv	a2,s2
220102b8:	8522                	mv	a0,s0
220102ba:	2e79                	jal	22010658 <SFlash_Cache_Read_Enable>
220102bc:	b76d                	j	22010266 <BLSP_Boot2_Set_Cache+0x38>

220102be <BLSP_Boot2_Get_TX_GPIO>:
BLSP_Boot2_Get_TX_GPIO():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:622
220102be:	230007b7          	lui	a5,0x23000
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:623
220102c2:	0e57c503          	lbu	a0,229(a5) # 230000e5 <__Vectors+0x25>
220102c6:	8082                	ret

220102c8 <BLSP_Boot2_Get_Feature_Flag>:
BLSP_Boot2_Get_Feature_Flag():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:638
220102c8:	81818793          	addi	a5,gp,-2024 # 42021098 <boot2Flag.9249>
220102cc:	0007c503          	lbu	a0,0(a5)
220102d0:	0ff00713          	li	a4,255
220102d4:	00e50363          	beq	a0,a4,220102da <BLSP_Boot2_Get_Feature_Flag+0x12>
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:642
220102d8:	8082                	ret
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:639
220102da:	23000737          	lui	a4,0x23000
220102de:	0e874503          	lbu	a0,232(a4) # 230000e8 <__Vectors+0x28>
220102e2:	00a78023          	sb	a0,0(a5)
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:642
220102e6:	8082                	ret

220102e8 <BLSP_Boot2_Get_Log_Disable_Flag>:
BLSP_Boot2_Get_Log_Disable_Flag():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:656
220102e8:	230007b7          	lui	a5,0x23000
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:657
220102ec:	0e97c503          	lbu	a0,233(a5) # 230000e9 <__Vectors+0x29>
220102f0:	8082                	ret

220102f2 <BLSP_Boot2_8M_Support_Flag>:
BLSP_Boot2_8M_Support_Flag():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:671
220102f2:	230007b7          	lui	a5,0x23000
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:672
220102f6:	0ea7c503          	lbu	a0,234(a5) # 230000ea <__Vectors+0x2a>
220102fa:	8082                	ret

220102fc <BLSP_Boot2_Dump_Critical_Flag>:
BLSP_Boot2_Dump_Critical_Flag():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:686
220102fc:	230007b7          	lui	a5,0x23000
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:687
22010300:	0eb7c503          	lbu	a0,235(a5) # 230000eb <__Vectors+0x2b>
22010304:	8082                	ret

22010306 <BLSP_Boot2_Get_Baudrate>:
BLSP_Boot2_Get_Baudrate():
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:701
22010306:	230007b7          	lui	a5,0x23000
/d/workspace/BL602_WS/bl602_mcu_sdk/Examples/BLSP_Boot2/blsp_port.c:702
2201030a:	0f47a503          	lw	a0,244(a5) # 230000f4 <__Vectors+0x34>
2201030e:	8082                	ret

22010310 <AON_Power_On_BG>:
AON_Power_On_BG():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:36
22010310:	210117b7          	lui	a5,0x21011
22010314:	8287a303          	lw	t1,-2008(a5) # 21010828 <StackSize+0x21010428>
22010318:	8302                	jr	t1

2201031a <AON_Power_Off_BG>:
AON_Power_Off_BG():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:41
2201031a:	210117b7          	lui	a5,0x21011
2201031e:	82c7a303          	lw	t1,-2004(a5) # 2101082c <StackSize+0x2101042c>
22010322:	8302                	jr	t1

22010324 <AON_Power_On_LDO11_SOC>:
AON_Power_On_LDO11_SOC():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:46
22010324:	210117b7          	lui	a5,0x21011
22010328:	8307a303          	lw	t1,-2000(a5) # 21010830 <StackSize+0x21010430>
2201032c:	8302                	jr	t1

2201032e <AON_Power_Off_LDO11_SOC>:
AON_Power_Off_LDO11_SOC():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:51
2201032e:	210117b7          	lui	a5,0x21011
22010332:	8347a303          	lw	t1,-1996(a5) # 21010834 <StackSize+0x21010434>
22010336:	8302                	jr	t1

22010338 <AON_Power_On_LDO15_RF>:
AON_Power_On_LDO15_RF():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:56
22010338:	210117b7          	lui	a5,0x21011
2201033c:	8387a303          	lw	t1,-1992(a5) # 21010838 <StackSize+0x21010438>
22010340:	8302                	jr	t1

22010342 <AON_Power_Off_LDO15_RF>:
AON_Power_Off_LDO15_RF():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:61
22010342:	210117b7          	lui	a5,0x21011
22010346:	83c7a303          	lw	t1,-1988(a5) # 2101083c <StackSize+0x2101043c>
2201034a:	8302                	jr	t1

2201034c <AON_Power_On_SFReg>:
AON_Power_On_SFReg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:66
2201034c:	210117b7          	lui	a5,0x21011
22010350:	8407a303          	lw	t1,-1984(a5) # 21010840 <StackSize+0x21010440>
22010354:	8302                	jr	t1

22010356 <AON_Power_Off_SFReg>:
AON_Power_Off_SFReg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:71
22010356:	210117b7          	lui	a5,0x21011
2201035a:	8447a303          	lw	t1,-1980(a5) # 21010844 <StackSize+0x21010444>
2201035e:	8302                	jr	t1

22010360 <AON_LowPower_Enter_PDS0>:
AON_LowPower_Enter_PDS0():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:76
22010360:	210117b7          	lui	a5,0x21011
22010364:	8487a303          	lw	t1,-1976(a5) # 21010848 <StackSize+0x21010448>
22010368:	8302                	jr	t1

2201036a <AON_LowPower_Exit_PDS0>:
AON_LowPower_Exit_PDS0():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:81
2201036a:	210117b7          	lui	a5,0x21011
2201036e:	84c7a303          	lw	t1,-1972(a5) # 2101084c <StackSize+0x2101044c>
22010372:	8302                	jr	t1

22010374 <ASM_Delay_Us>:
ASM_Delay_Us():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:86
22010374:	210117b7          	lui	a5,0x21011
22010378:	8507a303          	lw	t1,-1968(a5) # 21010850 <StackSize+0x21010450>
2201037c:	8302                	jr	t1

2201037e <BL602_Delay_US>:
BL602_Delay_US():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:91
2201037e:	210117b7          	lui	a5,0x21011
22010382:	8547a303          	lw	t1,-1964(a5) # 21010854 <StackSize+0x21010454>
22010386:	8302                	jr	t1

22010388 <BL602_Delay_MS>:
BL602_Delay_MS():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:96
22010388:	210117b7          	lui	a5,0x21011
2201038c:	8587a303          	lw	t1,-1960(a5) # 21010858 <StackSize+0x21010458>
22010390:	8302                	jr	t1

22010392 <BL602_MemCpy>:
BL602_MemCpy():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:101
22010392:	210117b7          	lui	a5,0x21011
22010396:	85c7a303          	lw	t1,-1956(a5) # 2101085c <StackSize+0x2101045c>
2201039a:	8302                	jr	t1

2201039c <BL602_MemCpy4>:
BL602_MemCpy4():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:106
2201039c:	210117b7          	lui	a5,0x21011
220103a0:	8607a303          	lw	t1,-1952(a5) # 21010860 <StackSize+0x21010460>
220103a4:	8302                	jr	t1

220103a6 <BL602_MemCpy_Fast>:
BL602_MemCpy_Fast():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:111
220103a6:	210117b7          	lui	a5,0x21011
220103aa:	8647a303          	lw	t1,-1948(a5) # 21010864 <StackSize+0x21010464>
220103ae:	8302                	jr	t1

220103b0 <BL602_MemSet>:
BL602_MemSet():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:116
220103b0:	210117b7          	lui	a5,0x21011
220103b4:	8687a303          	lw	t1,-1944(a5) # 21010868 <StackSize+0x21010468>
220103b8:	8302                	jr	t1

220103ba <BL602_MemSet4>:
BL602_MemSet4():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:121
220103ba:	210117b7          	lui	a5,0x21011
220103be:	86c7a303          	lw	t1,-1940(a5) # 2101086c <StackSize+0x2101046c>
220103c2:	8302                	jr	t1

220103c4 <BL602_MemCmp>:
BL602_MemCmp():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:126
220103c4:	210117b7          	lui	a5,0x21011
220103c8:	8707a303          	lw	t1,-1936(a5) # 21010870 <StackSize+0x21010470>
220103cc:	8302                	jr	t1

220103ce <EF_Ctrl_Sw_AHB_Clk_0>:
EF_Ctrl_Sw_AHB_Clk_0():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:131
220103ce:	210117b7          	lui	a5,0x21011
220103d2:	8747a303          	lw	t1,-1932(a5) # 21010874 <StackSize+0x21010474>
220103d6:	8302                	jr	t1

220103d8 <EF_Ctrl_Program_Efuse_0>:
EF_Ctrl_Program_Efuse_0():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:136
220103d8:	210117b7          	lui	a5,0x21011
220103dc:	8787a303          	lw	t1,-1928(a5) # 21010878 <StackSize+0x21010478>
220103e0:	8302                	jr	t1

220103e2 <EF_Ctrl_Load_Efuse_R0>:
EF_Ctrl_Load_Efuse_R0():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:141
220103e2:	210117b7          	lui	a5,0x21011
220103e6:	87c7a303          	lw	t1,-1924(a5) # 2101087c <StackSize+0x2101047c>
220103ea:	8302                	jr	t1

220103ec <EF_Ctrl_Busy>:
EF_Ctrl_Busy():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:146
220103ec:	210117b7          	lui	a5,0x21011
220103f0:	8807a303          	lw	t1,-1920(a5) # 21010880 <StackSize+0x21010480>
220103f4:	8302                	jr	t1

220103f6 <EF_Ctrl_AutoLoad_Done>:
EF_Ctrl_AutoLoad_Done():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:151
220103f6:	210117b7          	lui	a5,0x21011
220103fa:	8847a303          	lw	t1,-1916(a5) # 21010884 <StackSize+0x21010484>
220103fe:	8302                	jr	t1

22010400 <EF_Ctrl_Clear>:
EF_Ctrl_Clear():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:171
22010400:	210117b7          	lui	a5,0x21011
22010404:	8947a303          	lw	t1,-1900(a5) # 21010894 <StackSize+0x21010494>
22010408:	8302                	jr	t1

2201040a <GLB_SW_System_Reset>:
GLB_SW_System_Reset():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:221
2201040a:	210117b7          	lui	a5,0x21011
2201040e:	8bc7a303          	lw	t1,-1860(a5) # 210108bc <StackSize+0x210104bc>
22010412:	8302                	jr	t1

22010414 <GLB_SW_CPU_Reset>:
GLB_SW_CPU_Reset():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:226
22010414:	210117b7          	lui	a5,0x21011
22010418:	8c07a303          	lw	t1,-1856(a5) # 210108c0 <StackSize+0x210104c0>
2201041c:	8302                	jr	t1

2201041e <GLB_SW_POR_Reset>:
GLB_SW_POR_Reset():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:231
2201041e:	210117b7          	lui	a5,0x21011
22010422:	8c47a303          	lw	t1,-1852(a5) # 210108c4 <StackSize+0x210104c4>
22010426:	8302                	jr	t1

22010428 <GLB_Select_Internal_Flash>:
GLB_Select_Internal_Flash():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:236
22010428:	210117b7          	lui	a5,0x21011
2201042c:	8c87a303          	lw	t1,-1848(a5) # 210108c8 <StackSize+0x210104c8>
22010430:	8302                	jr	t1

22010432 <GLB_Select_External_Flash>:
GLB_Select_External_Flash():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:241
22010432:	210117b7          	lui	a5,0x21011
22010436:	8cc7a303          	lw	t1,-1844(a5) # 210108cc <StackSize+0x210104cc>
2201043a:	8302                	jr	t1

2201043c <GLB_Deswap_Flash_Pin>:
GLB_Deswap_Flash_Pin():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:246
2201043c:	210117b7          	lui	a5,0x21011
22010440:	8d07a303          	lw	t1,-1840(a5) # 210108d0 <StackSize+0x210104d0>
22010444:	8302                	jr	t1

22010446 <GLB_Swap_Flash_Pin>:
GLB_Swap_Flash_Pin():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:251
22010446:	210117b7          	lui	a5,0x21011
2201044a:	8d47a303          	lw	t1,-1836(a5) # 210108d4 <StackSize+0x210104d4>
2201044e:	8302                	jr	t1

22010450 <GLB_GPIO_Init>:
GLB_GPIO_Init():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:256
22010450:	210117b7          	lui	a5,0x21011
22010454:	8d87a303          	lw	t1,-1832(a5) # 210108d8 <StackSize+0x210104d8>
22010458:	8302                	jr	t1

2201045a <GLB_GPIO_OUTPUT_Enable>:
GLB_GPIO_OUTPUT_Enable():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:261
2201045a:	210117b7          	lui	a5,0x21011
2201045e:	8dc7a303          	lw	t1,-1828(a5) # 210108dc <StackSize+0x210104dc>
22010462:	8302                	jr	t1

22010464 <GLB_GPIO_OUTPUT_Disable>:
GLB_GPIO_OUTPUT_Disable():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:266
22010464:	210117b7          	lui	a5,0x21011
22010468:	8e07a303          	lw	t1,-1824(a5) # 210108e0 <StackSize+0x210104e0>
2201046c:	8302                	jr	t1

2201046e <GLB_GPIO_Set_HZ>:
GLB_GPIO_Set_HZ():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:271
2201046e:	210117b7          	lui	a5,0x21011
22010472:	8e47a303          	lw	t1,-1820(a5) # 210108e4 <StackSize+0x210104e4>
22010476:	8302                	jr	t1

22010478 <GLB_GPIO_Get_Fun>:
GLB_GPIO_Get_Fun():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:276
22010478:	210117b7          	lui	a5,0x21011
2201047c:	8e87a303          	lw	t1,-1816(a5) # 210108e8 <StackSize+0x210104e8>
22010480:	8302                	jr	t1

22010482 <HBN_Mode_Enter>:
HBN_Mode_Enter():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:281
22010482:	210117b7          	lui	a5,0x21011
22010486:	8ec7a303          	lw	t1,-1812(a5) # 210108ec <StackSize+0x210104ec>
2201048a:	8302                	jr	t1

2201048c <HBN_Power_Down_Flash>:
HBN_Power_Down_Flash():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:286
2201048c:	210117b7          	lui	a5,0x21011
22010490:	8f07a303          	lw	t1,-1808(a5) # 210108f0 <StackSize+0x210104f0>
22010494:	8302                	jr	t1

22010496 <HBN_Enable>:
HBN_Enable():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:291
22010496:	210117b7          	lui	a5,0x21011
2201049a:	8f47a303          	lw	t1,-1804(a5) # 210108f4 <StackSize+0x210104f4>
2201049e:	8302                	jr	t1

220104a0 <HBN_Reset>:
HBN_Reset():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:296
220104a0:	210117b7          	lui	a5,0x21011
220104a4:	8f87a303          	lw	t1,-1800(a5) # 210108f8 <StackSize+0x210104f8>
220104a8:	8302                	jr	t1

220104aa <HBN_Set_Ldo11_Aon_Vout>:
HBN_Set_Ldo11_Aon_Vout():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:301
220104aa:	210117b7          	lui	a5,0x21011
220104ae:	8fc7a303          	lw	t1,-1796(a5) # 210108fc <StackSize+0x210104fc>
220104b2:	8302                	jr	t1

220104b4 <HBN_Set_Ldo11_Rt_Vout>:
HBN_Set_Ldo11_Rt_Vout():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:306
220104b4:	210117b7          	lui	a5,0x21011
220104b8:	9007a303          	lw	t1,-1792(a5) # 21010900 <StackSize+0x21010500>
220104bc:	8302                	jr	t1

220104be <HBN_Set_Ldo11_Soc_Vout>:
HBN_Set_Ldo11_Soc_Vout():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:311
220104be:	210117b7          	lui	a5,0x21011
220104c2:	9047a303          	lw	t1,-1788(a5) # 21010904 <StackSize+0x21010504>
220104c6:	8302                	jr	t1

220104c8 <HBN_Hw_Pu_Pd_Cfg>:
HBN_Hw_Pu_Pd_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:351
220104c8:	210117b7          	lui	a5,0x21011
220104cc:	9247a303          	lw	t1,-1756(a5) # 21010924 <StackSize+0x21010524>
220104d0:	8302                	jr	t1

220104d2 <HBN_Pin_WakeUp_Mask>:
HBN_Pin_WakeUp_Mask():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:356
220104d2:	210117b7          	lui	a5,0x21011
220104d6:	9287a303          	lw	t1,-1752(a5) # 21010928 <StackSize+0x21010528>
220104da:	8302                	jr	t1

220104dc <HBN_GPIO7_Dbg_Pull_Cfg>:
HBN_GPIO7_Dbg_Pull_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:361
220104dc:	210117b7          	lui	a5,0x21011
220104e0:	92c7a303          	lw	t1,-1748(a5) # 2101092c <StackSize+0x2101052c>
220104e4:	8302                	jr	t1

220104e6 <HBN_Set_Embedded_Flash_Pullup>:
HBN_Set_Embedded_Flash_Pullup():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:366
220104e6:	210117b7          	lui	a5,0x21011
220104ea:	9307a303          	lw	t1,-1744(a5) # 21010930 <StackSize+0x21010530>
220104ee:	8302                	jr	t1

220104f0 <L1C_Set_Wrap>:
L1C_Set_Wrap():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:371
220104f0:	210117b7          	lui	a5,0x21011
220104f4:	9347a303          	lw	t1,-1740(a5) # 21010934 <StackSize+0x21010534>
220104f8:	8302                	jr	t1

220104fa <L1C_Set_Way_Disable>:
L1C_Set_Way_Disable():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:376
220104fa:	210117b7          	lui	a5,0x21011
220104fe:	9387a303          	lw	t1,-1736(a5) # 21010938 <StackSize+0x21010538>
22010502:	8302                	jr	t1

22010504 <L1C_IROM_2T_Access_Set>:
L1C_IROM_2T_Access_Set():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:381
22010504:	210117b7          	lui	a5,0x21011
22010508:	93c7a303          	lw	t1,-1732(a5) # 2101093c <StackSize+0x2101053c>
2201050c:	8302                	jr	t1

2201050e <PDS_Reset>:
PDS_Reset():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:386
2201050e:	210117b7          	lui	a5,0x21011
22010512:	9407a303          	lw	t1,-1728(a5) # 21010940 <StackSize+0x21010540>
22010516:	8302                	jr	t1

22010518 <PDS_Force_Config>:
PDS_Force_Config():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:398
22010518:	210117b7          	lui	a5,0x21011
2201051c:	9487a303          	lw	t1,-1720(a5) # 21010948 <StackSize+0x21010548>
22010520:	8302                	jr	t1

22010522 <PDS_RAM_Config>:
PDS_RAM_Config():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:403
22010522:	210117b7          	lui	a5,0x21011
22010526:	94c7a303          	lw	t1,-1716(a5) # 2101094c <StackSize+0x2101054c>
2201052a:	8302                	jr	t1

2201052c <PDS_Default_Level_Config>:
PDS_Default_Level_Config():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:408
2201052c:	210117b7          	lui	a5,0x21011
22010530:	9507a303          	lw	t1,-1712(a5) # 21010950 <StackSize+0x21010550>
22010534:	8302                	jr	t1

22010536 <SEC_Eng_Turn_On_Sec_Ring>:
SEC_Eng_Turn_On_Sec_Ring():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:458
22010536:	210117b7          	lui	a5,0x21011
2201053a:	9787a303          	lw	t1,-1672(a5) # 21010978 <StackSize+0x21010578>
2201053e:	8302                	jr	t1

22010540 <SEC_Eng_Turn_Off_Sec_Ring>:
SEC_Eng_Turn_Off_Sec_Ring():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:463
22010540:	210117b7          	lui	a5,0x21011
22010544:	97c7a303          	lw	t1,-1668(a5) # 2101097c <StackSize+0x2101057c>
22010548:	8302                	jr	t1

2201054a <SFlash_Init>:
SFlash_Init():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:468
2201054a:	210117b7          	lui	a5,0x21011
2201054e:	9807a303          	lw	t1,-1664(a5) # 21010980 <StackSize+0x21010580>
22010552:	8302                	jr	t1

22010554 <SFlash_SetSPIMode>:
SFlash_SetSPIMode():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:473
22010554:	210117b7          	lui	a5,0x21011
22010558:	9847a303          	lw	t1,-1660(a5) # 21010984 <StackSize+0x21010584>
2201055c:	8302                	jr	t1

2201055e <SFlash_Read_Reg>:
SFlash_Read_Reg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:478
2201055e:	210117b7          	lui	a5,0x21011
22010562:	9887a303          	lw	t1,-1656(a5) # 21010988 <StackSize+0x21010588>
22010566:	8302                	jr	t1

22010568 <SFlash_Write_Reg>:
SFlash_Write_Reg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:483
22010568:	210117b7          	lui	a5,0x21011
2201056c:	98c7a303          	lw	t1,-1652(a5) # 2101098c <StackSize+0x2101058c>
22010570:	8302                	jr	t1

22010572 <SFlash_Busy>:
SFlash_Busy():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:488
22010572:	210117b7          	lui	a5,0x21011
22010576:	9907a303          	lw	t1,-1648(a5) # 21010990 <StackSize+0x21010590>
2201057a:	8302                	jr	t1

2201057c <SFlash_Write_Enable>:
SFlash_Write_Enable():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:493
2201057c:	210117b7          	lui	a5,0x21011
22010580:	9947a303          	lw	t1,-1644(a5) # 21010994 <StackSize+0x21010594>
22010584:	8302                	jr	t1

22010586 <SFlash_Qspi_Enable>:
SFlash_Qspi_Enable():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:498
22010586:	210117b7          	lui	a5,0x21011
2201058a:	9987a303          	lw	t1,-1640(a5) # 21010998 <StackSize+0x21010598>
2201058e:	8302                	jr	t1

22010590 <SFlash_Volatile_Reg_Write_Enable>:
SFlash_Volatile_Reg_Write_Enable():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:503
22010590:	210117b7          	lui	a5,0x21011
22010594:	99c7a303          	lw	t1,-1636(a5) # 2101099c <StackSize+0x2101059c>
22010598:	8302                	jr	t1

2201059a <SFlash_Chip_Erase>:
SFlash_Chip_Erase():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:508
2201059a:	210117b7          	lui	a5,0x21011
2201059e:	9a07a303          	lw	t1,-1632(a5) # 210109a0 <StackSize+0x210105a0>
220105a2:	8302                	jr	t1

220105a4 <SFlash_Sector_Erase>:
SFlash_Sector_Erase():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:513
220105a4:	210117b7          	lui	a5,0x21011
220105a8:	9a47a303          	lw	t1,-1628(a5) # 210109a4 <StackSize+0x210105a4>
220105ac:	8302                	jr	t1

220105ae <SFlash_Blk32_Erase>:
SFlash_Blk32_Erase():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:518
220105ae:	210117b7          	lui	a5,0x21011
220105b2:	9a87a303          	lw	t1,-1624(a5) # 210109a8 <StackSize+0x210105a8>
220105b6:	8302                	jr	t1

220105b8 <SFlash_Blk64_Erase>:
SFlash_Blk64_Erase():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:523
220105b8:	210117b7          	lui	a5,0x21011
220105bc:	9ac7a303          	lw	t1,-1620(a5) # 210109ac <StackSize+0x210105ac>
220105c0:	8302                	jr	t1

220105c2 <SFlash_Erase>:
SFlash_Erase():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:528
220105c2:	210117b7          	lui	a5,0x21011
220105c6:	9b07a303          	lw	t1,-1616(a5) # 210109b0 <StackSize+0x210105b0>
220105ca:	8302                	jr	t1

220105cc <SFlash_Program>:
SFlash_Program():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:533
220105cc:	210117b7          	lui	a5,0x21011
220105d0:	9b47a303          	lw	t1,-1612(a5) # 210109b4 <StackSize+0x210105b4>
220105d4:	8302                	jr	t1

220105d6 <SFlash_GetUniqueId>:
SFlash_GetUniqueId():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:538
220105d6:	210117b7          	lui	a5,0x21011
220105da:	9b87a303          	lw	t1,-1608(a5) # 210109b8 <StackSize+0x210105b8>
220105de:	8302                	jr	t1

220105e0 <SFlash_GetJedecId>:
SFlash_GetJedecId():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:543
220105e0:	210117b7          	lui	a5,0x21011
220105e4:	9bc7a303          	lw	t1,-1604(a5) # 210109bc <StackSize+0x210105bc>
220105e8:	8302                	jr	t1

220105ea <SFlash_GetDeviceId>:
SFlash_GetDeviceId():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:548
220105ea:	210117b7          	lui	a5,0x21011
220105ee:	9c07a303          	lw	t1,-1600(a5) # 210109c0 <StackSize+0x210105c0>
220105f2:	8302                	jr	t1

220105f4 <SFlash_Powerdown>:
SFlash_Powerdown():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:553
220105f4:	210117b7          	lui	a5,0x21011
220105f8:	9c47a303          	lw	t1,-1596(a5) # 210109c4 <StackSize+0x210105c4>
220105fc:	8302                	jr	t1

220105fe <SFlash_Releae_Powerdown>:
SFlash_Releae_Powerdown():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:558
220105fe:	210117b7          	lui	a5,0x21011
22010602:	9c87a303          	lw	t1,-1592(a5) # 210109c8 <StackSize+0x210105c8>
22010606:	8302                	jr	t1

22010608 <SFlash_SetBurstWrap>:
SFlash_SetBurstWrap():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:563
22010608:	210117b7          	lui	a5,0x21011
2201060c:	9cc7a303          	lw	t1,-1588(a5) # 210109cc <StackSize+0x210105cc>
22010610:	8302                	jr	t1

22010612 <SFlash_DisableBurstWrap>:
SFlash_DisableBurstWrap():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:568
22010612:	210117b7          	lui	a5,0x21011
22010616:	9d07a303          	lw	t1,-1584(a5) # 210109d0 <StackSize+0x210105d0>
2201061a:	8302                	jr	t1

2201061c <SFlash_Software_Reset>:
SFlash_Software_Reset():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:573
2201061c:	210117b7          	lui	a5,0x21011
22010620:	9d47a303          	lw	t1,-1580(a5) # 210109d4 <StackSize+0x210105d4>
22010624:	8302                	jr	t1

22010626 <SFlash_Reset_Continue_Read>:
SFlash_Reset_Continue_Read():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:578
22010626:	210117b7          	lui	a5,0x21011
2201062a:	9d87a303          	lw	t1,-1576(a5) # 210109d8 <StackSize+0x210105d8>
2201062e:	8302                	jr	t1

22010630 <SFlash_Set_IDbus_Cfg>:
SFlash_Set_IDbus_Cfg():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:583
22010630:	210117b7          	lui	a5,0x21011
22010634:	9dc7a303          	lw	t1,-1572(a5) # 210109dc <StackSize+0x210105dc>
22010638:	8302                	jr	t1

2201063a <SFlash_IDbus_Read_Enable>:
SFlash_IDbus_Read_Enable():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:588
2201063a:	210117b7          	lui	a5,0x21011
2201063e:	9e07a303          	lw	t1,-1568(a5) # 210109e0 <StackSize+0x210105e0>
22010642:	8302                	jr	t1

22010644 <SFlash_Cache_Enable_Set>:
SFlash_Cache_Enable_Set():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:593
22010644:	210117b7          	lui	a5,0x21011
22010648:	9e47a303          	lw	t1,-1564(a5) # 210109e4 <StackSize+0x210105e4>
2201064c:	8302                	jr	t1

2201064e <SFlash_Cache_Flush>:
SFlash_Cache_Flush():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:598
2201064e:	210117b7          	lui	a5,0x21011
22010652:	9e87a303          	lw	t1,-1560(a5) # 210109e8 <StackSize+0x210105e8>
22010656:	8302                	jr	t1

22010658 <SFlash_Cache_Read_Enable>:
SFlash_Cache_Read_Enable():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:603
22010658:	210117b7          	lui	a5,0x21011
2201065c:	9ec7a303          	lw	t1,-1556(a5) # 210109ec <StackSize+0x210105ec>
22010660:	8302                	jr	t1

22010662 <SFlash_Cache_Hit_Count_Get>:
SFlash_Cache_Hit_Count_Get():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:608
22010662:	210117b7          	lui	a5,0x21011
22010666:	9f07a303          	lw	t1,-1552(a5) # 210109f0 <StackSize+0x210105f0>
2201066a:	8302                	jr	t1

2201066c <SFlash_Cache_Miss_Count_Get>:
SFlash_Cache_Miss_Count_Get():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:613
2201066c:	210117b7          	lui	a5,0x21011
22010670:	9f47a303          	lw	t1,-1548(a5) # 210109f4 <StackSize+0x210105f4>
22010674:	8302                	jr	t1

22010676 <SFlash_Cache_Read_Disable>:
SFlash_Cache_Read_Disable():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:618
22010676:	210117b7          	lui	a5,0x21011
2201067a:	9f87a303          	lw	t1,-1544(a5) # 210109f8 <StackSize+0x210105f8>
2201067e:	8302                	jr	t1

22010680 <SFlash_Read>:
SFlash_Read():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:623
22010680:	21011837          	lui	a6,0x21011
22010684:	9fc82303          	lw	t1,-1540(a6) # 210109fc <StackSize+0x210105fc>
22010688:	8302                	jr	t1

2201068a <SFlash_Read_Reg_With_Cmd>:
SFlash_Read_Reg_With_Cmd():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:628
2201068a:	210117b7          	lui	a5,0x21011
2201068e:	a007a303          	lw	t1,-1536(a5) # 21010a00 <StackSize+0x21010600>
22010692:	8302                	jr	t1

22010694 <SFlash_Write_Reg_With_Cmd>:
SFlash_Write_Reg_With_Cmd():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:633
22010694:	210117b7          	lui	a5,0x21011
22010698:	a047a303          	lw	t1,-1532(a5) # 21010a04 <StackSize+0x21010604>
2201069c:	8302                	jr	t1

2201069e <SF_Cfg_Init_Ext_Flash_Gpio>:
SF_Cfg_Init_Ext_Flash_Gpio():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:645
2201069e:	210117b7          	lui	a5,0x21011
220106a2:	a0c7a303          	lw	t1,-1524(a5) # 21010a0c <StackSize+0x2101060c>
220106a6:	8302                	jr	t1

220106a8 <SF_Cfg_Init_Internal_Flash_Gpio>:
SF_Cfg_Init_Internal_Flash_Gpio():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:650
220106a8:	210117b7          	lui	a5,0x21011
220106ac:	a107a303          	lw	t1,-1520(a5) # 21010a10 <StackSize+0x21010610>
220106b0:	8302                	jr	t1

220106b2 <SF_Cfg_Deinit_Ext_Flash_Gpio>:
SF_Cfg_Deinit_Ext_Flash_Gpio():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:655
220106b2:	210117b7          	lui	a5,0x21011
220106b6:	a147a303          	lw	t1,-1516(a5) # 21010a14 <StackSize+0x21010614>
220106ba:	8302                	jr	t1

220106bc <SF_Cfg_Restore_GPIO17_Fun>:
SF_Cfg_Restore_GPIO17_Fun():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:660
220106bc:	210117b7          	lui	a5,0x21011
220106c0:	a187a303          	lw	t1,-1512(a5) # 21010a18 <StackSize+0x21010618>
220106c4:	8302                	jr	t1

220106c6 <SF_Cfg_Get_Flash_Cfg_Need_Lock>:
SF_Cfg_Get_Flash_Cfg_Need_Lock():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:665
220106c6:	210117b7          	lui	a5,0x21011
220106ca:	a1c7a303          	lw	t1,-1508(a5) # 21010a1c <StackSize+0x2101061c>
220106ce:	8302                	jr	t1

220106d0 <SF_Cfg_Init_Flash_Gpio>:
SF_Cfg_Init_Flash_Gpio():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:670
220106d0:	210117b7          	lui	a5,0x21011
220106d4:	a207a303          	lw	t1,-1504(a5) # 21010a20 <StackSize+0x21010620>
220106d8:	8302                	jr	t1

220106da <SF_Cfg_Flash_Identify>:
SF_Cfg_Flash_Identify():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:675
220106da:	210117b7          	lui	a5,0x21011
220106de:	a247a303          	lw	t1,-1500(a5) # 21010a24 <StackSize+0x21010624>
220106e2:	8302                	jr	t1

220106e4 <SF_Ctrl_Enable>:
SF_Ctrl_Enable():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:680
220106e4:	210117b7          	lui	a5,0x21011
220106e8:	a287a303          	lw	t1,-1496(a5) # 21010a28 <StackSize+0x21010628>
220106ec:	8302                	jr	t1

220106ee <SF_Ctrl_Select_Pad>:
SF_Ctrl_Select_Pad():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:685
220106ee:	210117b7          	lui	a5,0x21011
220106f2:	a2c7a303          	lw	t1,-1492(a5) # 21010a2c <StackSize+0x2101062c>
220106f6:	8302                	jr	t1

220106f8 <SF_Ctrl_Set_Owner>:
SF_Ctrl_Set_Owner():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:690
220106f8:	210117b7          	lui	a5,0x21011
220106fc:	a307a303          	lw	t1,-1488(a5) # 21010a30 <StackSize+0x21010630>
22010700:	8302                	jr	t1

22010702 <SF_Ctrl_Disable>:
SF_Ctrl_Disable():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:695
22010702:	210117b7          	lui	a5,0x21011
22010706:	a347a303          	lw	t1,-1484(a5) # 21010a34 <StackSize+0x21010634>
2201070a:	8302                	jr	t1

2201070c <SF_Ctrl_AES_Enable_BE>:
SF_Ctrl_AES_Enable_BE():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:700
2201070c:	210117b7          	lui	a5,0x21011
22010710:	a387a303          	lw	t1,-1480(a5) # 21010a38 <StackSize+0x21010638>
22010714:	8302                	jr	t1

22010716 <SF_Ctrl_AES_Enable_LE>:
SF_Ctrl_AES_Enable_LE():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:705
22010716:	210117b7          	lui	a5,0x21011
2201071a:	a3c7a303          	lw	t1,-1476(a5) # 21010a3c <StackSize+0x2101063c>
2201071e:	8302                	jr	t1

22010720 <SF_Ctrl_AES_Set_Region>:
SF_Ctrl_AES_Set_Region():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:710
22010720:	21011837          	lui	a6,0x21011
22010724:	a4082303          	lw	t1,-1472(a6) # 21010a40 <StackSize+0x21010640>
22010728:	8302                	jr	t1

2201072a <SF_Ctrl_AES_Set_Key>:
SF_Ctrl_AES_Set_Key():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:715
2201072a:	210117b7          	lui	a5,0x21011
2201072e:	a447a303          	lw	t1,-1468(a5) # 21010a44 <StackSize+0x21010644>
22010732:	8302                	jr	t1

22010734 <SF_Ctrl_AES_Set_Key_BE>:
SF_Ctrl_AES_Set_Key_BE():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:720
22010734:	210117b7          	lui	a5,0x21011
22010738:	a487a303          	lw	t1,-1464(a5) # 21010a48 <StackSize+0x21010648>
2201073c:	8302                	jr	t1

2201073e <SF_Ctrl_AES_Set_IV>:
SF_Ctrl_AES_Set_IV():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:725
2201073e:	210117b7          	lui	a5,0x21011
22010742:	a4c7a303          	lw	t1,-1460(a5) # 21010a4c <StackSize+0x2101064c>
22010746:	8302                	jr	t1

22010748 <SF_Ctrl_AES_Set_IV_BE>:
SF_Ctrl_AES_Set_IV_BE():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:730
22010748:	210117b7          	lui	a5,0x21011
2201074c:	a507a303          	lw	t1,-1456(a5) # 21010a50 <StackSize+0x21010650>
22010750:	8302                	jr	t1

22010752 <SF_Ctrl_AES_Enable>:
SF_Ctrl_AES_Enable():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:735
22010752:	210117b7          	lui	a5,0x21011
22010756:	a547a303          	lw	t1,-1452(a5) # 21010a54 <StackSize+0x21010654>
2201075a:	8302                	jr	t1

2201075c <SF_Ctrl_AES_Disable>:
SF_Ctrl_AES_Disable():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:740
2201075c:	210117b7          	lui	a5,0x21011
22010760:	a587a303          	lw	t1,-1448(a5) # 21010a58 <StackSize+0x21010658>
22010764:	8302                	jr	t1

22010766 <SF_Ctrl_Set_Flash_Image_Offset>:
SF_Ctrl_Set_Flash_Image_Offset():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:745
22010766:	210117b7          	lui	a5,0x21011
2201076a:	a5c7a303          	lw	t1,-1444(a5) # 21010a5c <StackSize+0x2101065c>
2201076e:	8302                	jr	t1

22010770 <SF_Ctrl_Get_Flash_Image_Offset>:
SF_Ctrl_Get_Flash_Image_Offset():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:750
22010770:	210117b7          	lui	a5,0x21011
22010774:	a607a303          	lw	t1,-1440(a5) # 21010a60 <StackSize+0x21010660>
22010778:	8302                	jr	t1

2201077a <SF_Ctrl_Select_Clock>:
SF_Ctrl_Select_Clock():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:755
2201077a:	210117b7          	lui	a5,0x21011
2201077e:	a647a303          	lw	t1,-1436(a5) # 21010a64 <StackSize+0x21010664>
22010782:	8302                	jr	t1

22010784 <SF_Ctrl_SendCmd>:
SF_Ctrl_SendCmd():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:760
22010784:	210117b7          	lui	a5,0x21011
22010788:	a687a303          	lw	t1,-1432(a5) # 21010a68 <StackSize+0x21010668>
2201078c:	8302                	jr	t1

2201078e <SF_Ctrl_Icache_Set>:
SF_Ctrl_Icache_Set():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:765
2201078e:	210117b7          	lui	a5,0x21011
22010792:	a6c7a303          	lw	t1,-1428(a5) # 21010a6c <StackSize+0x2101066c>
22010796:	8302                	jr	t1

22010798 <SF_Ctrl_Icache2_Set>:
SF_Ctrl_Icache2_Set():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:770
22010798:	210117b7          	lui	a5,0x21011
2201079c:	a707a303          	lw	t1,-1424(a5) # 21010a70 <StackSize+0x21010670>
220107a0:	8302                	jr	t1

220107a2 <SF_Ctrl_GetBusyState>:
SF_Ctrl_GetBusyState():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:775
220107a2:	210117b7          	lui	a5,0x21011
220107a6:	a747a303          	lw	t1,-1420(a5) # 21010a74 <StackSize+0x21010674>
220107aa:	8302                	jr	t1

220107ac <SF_Ctrl_Is_AES_Enable>:
SF_Ctrl_Is_AES_Enable():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:780
220107ac:	210117b7          	lui	a5,0x21011
220107b0:	a787a303          	lw	t1,-1416(a5) # 21010a78 <StackSize+0x21010678>
220107b4:	8302                	jr	t1

220107b6 <SF_Ctrl_Get_Clock_Delay>:
SF_Ctrl_Get_Clock_Delay():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:785
220107b6:	210117b7          	lui	a5,0x21011
220107ba:	a7c7a303          	lw	t1,-1412(a5) # 21010a7c <StackSize+0x2101067c>
220107be:	8302                	jr	t1

220107c0 <SF_Ctrl_Set_Clock_Delay>:
SF_Ctrl_Set_Clock_Delay():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:790
220107c0:	210117b7          	lui	a5,0x21011
220107c4:	a807a303          	lw	t1,-1408(a5) # 21010a80 <StackSize+0x21010680>
220107c8:	8302                	jr	t1

220107ca <XIP_SFlash_State_Save>:
XIP_SFlash_State_Save():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:795
220107ca:	210117b7          	lui	a5,0x21011
220107ce:	a847a303          	lw	t1,-1404(a5) # 21010a84 <StackSize+0x21010684>
220107d2:	8302                	jr	t1

220107d4 <XIP_SFlash_State_Restore>:
XIP_SFlash_State_Restore():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:800
220107d4:	210117b7          	lui	a5,0x21011
220107d8:	a887a303          	lw	t1,-1400(a5) # 21010a88 <StackSize+0x21010688>
220107dc:	8302                	jr	t1

220107de <XIP_SFlash_Erase_Need_Lock>:
XIP_SFlash_Erase_Need_Lock():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:805
220107de:	210117b7          	lui	a5,0x21011
220107e2:	a8c7a303          	lw	t1,-1396(a5) # 21010a8c <StackSize+0x2101068c>
220107e6:	8302                	jr	t1

220107e8 <XIP_SFlash_Write_Need_Lock>:
XIP_SFlash_Write_Need_Lock():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:810
220107e8:	210117b7          	lui	a5,0x21011
220107ec:	a907a303          	lw	t1,-1392(a5) # 21010a90 <StackSize+0x21010690>
220107f0:	8302                	jr	t1

220107f2 <XIP_SFlash_Read_Need_Lock>:
XIP_SFlash_Read_Need_Lock():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:815
220107f2:	210117b7          	lui	a5,0x21011
220107f6:	a947a303          	lw	t1,-1388(a5) # 21010a94 <StackSize+0x21010694>
220107fa:	8302                	jr	t1

220107fc <XIP_SFlash_GetJedecId_Need_Lock>:
XIP_SFlash_GetJedecId_Need_Lock():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:820
220107fc:	210117b7          	lui	a5,0x21011
22010800:	a987a303          	lw	t1,-1384(a5) # 21010a98 <StackSize+0x21010698>
22010804:	8302                	jr	t1

22010806 <XIP_SFlash_GetDeviceId_Need_Lock>:
XIP_SFlash_GetDeviceId_Need_Lock():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:825
22010806:	210117b7          	lui	a5,0x21011
2201080a:	a9c7a303          	lw	t1,-1380(a5) # 21010a9c <StackSize+0x2101069c>
2201080e:	8302                	jr	t1

22010810 <XIP_SFlash_GetUniqueId_Need_Lock>:
XIP_SFlash_GetUniqueId_Need_Lock():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:830
22010810:	210117b7          	lui	a5,0x21011
22010814:	aa07a303          	lw	t1,-1376(a5) # 21010aa0 <StackSize+0x210106a0>
22010818:	8302                	jr	t1

2201081a <XIP_SFlash_Read_Via_Cache_Need_Lock>:
XIP_SFlash_Read_Via_Cache_Need_Lock():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:835
2201081a:	210117b7          	lui	a5,0x21011
2201081e:	aa47a303          	lw	t1,-1372(a5) # 21010aa4 <StackSize+0x210106a4>
22010822:	8302                	jr	t1

22010824 <XIP_SFlash_Read_With_Lock>:
XIP_SFlash_Read_With_Lock():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:840
22010824:	210117b7          	lui	a5,0x21011
22010828:	aa87a303          	lw	t1,-1368(a5) # 21010aa8 <StackSize+0x210106a8>
2201082c:	8302                	jr	t1

2201082e <XIP_SFlash_Write_With_Lock>:
XIP_SFlash_Write_With_Lock():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:845
2201082e:	210117b7          	lui	a5,0x21011
22010832:	aac7a303          	lw	t1,-1364(a5) # 21010aac <StackSize+0x210106ac>
22010836:	8302                	jr	t1

22010838 <XIP_SFlash_Erase_With_Lock>:
XIP_SFlash_Erase_With_Lock():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:850
22010838:	210117b7          	lui	a5,0x21011
2201083c:	ab07a303          	lw	t1,-1360(a5) # 21010ab0 <StackSize+0x210106b0>
22010840:	8302                	jr	t1

22010842 <XIP_SFlash_Opt_Enter>:
XIP_SFlash_Opt_Enter():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:855
22010842:	210117b7          	lui	a5,0x21011
22010846:	ab47a303          	lw	t1,-1356(a5) # 21010ab4 <StackSize+0x210106b4>
2201084a:	8302                	jr	t1

2201084c <XIP_SFlash_Opt_Exit>:
XIP_SFlash_Opt_Exit():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:860
2201084c:	210117b7          	lui	a5,0x21011
22010850:	ab87a303          	lw	t1,-1352(a5) # 21010ab8 <StackSize+0x210106b8>
22010854:	8302                	jr	t1

22010856 <BFLB_Soft_CRC32>:
BFLB_Soft_CRC32():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:865
22010856:	210117b7          	lui	a5,0x21011
2201085a:	abc7a303          	lw	t1,-1348(a5) # 21010abc <StackSize+0x210106bc>
2201085e:	8302                	jr	t1

22010860 <AON_Power_On_MBG>:
AON_Power_On_MBG():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:6
22010860:	210117b7          	lui	a5,0x21011
22010864:	8107a303          	lw	t1,-2032(a5) # 21010810 <StackSize+0x21010410>
22010868:	8302                	jr	t1

2201086a <AON_Power_Off_MBG>:
AON_Power_Off_MBG():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:11
2201086a:	210117b7          	lui	a5,0x21011
2201086e:	8147a303          	lw	t1,-2028(a5) # 21010814 <StackSize+0x21010414>
22010872:	8302                	jr	t1

22010874 <AON_Power_On_XTAL>:
AON_Power_On_XTAL():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:16
22010874:	210117b7          	lui	a5,0x21011
22010878:	8187a303          	lw	t1,-2024(a5) # 21010818 <StackSize+0x21010418>
2201087c:	8302                	jr	t1

2201087e <AON_Set_Xtal_CapCode>:
AON_Set_Xtal_CapCode():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:21
2201087e:	210117b7          	lui	a5,0x21011
22010882:	81c7a303          	lw	t1,-2020(a5) # 2101081c <StackSize+0x2101041c>
22010886:	8302                	jr	t1

22010888 <AON_Get_Xtal_CapCode>:
AON_Get_Xtal_CapCode():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:26
22010888:	210117b7          	lui	a5,0x21011
2201088c:	8207a303          	lw	t1,-2016(a5) # 21010820 <StackSize+0x21010420>
22010890:	8302                	jr	t1

22010892 <AON_Power_Off_XTAL>:
AON_Power_Off_XTAL():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:31
22010892:	210117b7          	lui	a5,0x21011
22010896:	8247a303          	lw	t1,-2012(a5) # 21010824 <StackSize+0x21010424>
2201089a:	8302                	jr	t1

2201089c <EF_Ctrl_Get_Trim_Parity>:
EF_Ctrl_Get_Trim_Parity():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:156
2201089c:	210117b7          	lui	a5,0x21011
220108a0:	8887a303          	lw	t1,-1912(a5) # 21010888 <StackSize+0x21010488>
220108a4:	8302                	jr	t1

220108a6 <EF_Ctrl_Read_RC32M_Trim>:
EF_Ctrl_Read_RC32M_Trim():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:161
220108a6:	210117b7          	lui	a5,0x21011
220108aa:	88c7a303          	lw	t1,-1908(a5) # 2101088c <StackSize+0x2101048c>
220108ae:	8302                	jr	t1

220108b0 <EF_Ctrl_Read_RC32K_Trim>:
EF_Ctrl_Read_RC32K_Trim():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:166
220108b0:	210117b7          	lui	a5,0x21011
220108b4:	8907a303          	lw	t1,-1904(a5) # 21010890 <StackSize+0x21010490>
220108b8:	8302                	jr	t1

220108ba <GLB_Get_Root_CLK_Sel>:
GLB_Get_Root_CLK_Sel():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:176
220108ba:	210117b7          	lui	a5,0x21011
220108be:	8987a303          	lw	t1,-1896(a5) # 21010898 <StackSize+0x21010498>
220108c2:	8302                	jr	t1

220108c4 <GLB_Set_System_CLK_Div>:
GLB_Set_System_CLK_Div():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:181
220108c4:	210117b7          	lui	a5,0x21011
220108c8:	89c7a303          	lw	t1,-1892(a5) # 2101089c <StackSize+0x2101049c>
220108cc:	8302                	jr	t1

220108ce <GLB_Get_BCLK_Div>:
GLB_Get_BCLK_Div():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:186
220108ce:	210117b7          	lui	a5,0x21011
220108d2:	8a07a303          	lw	t1,-1888(a5) # 210108a0 <StackSize+0x210104a0>
220108d6:	8302                	jr	t1

220108d8 <GLB_Get_HCLK_Div>:
GLB_Get_HCLK_Div():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:191
220108d8:	210117b7          	lui	a5,0x21011
220108dc:	8a47a303          	lw	t1,-1884(a5) # 210108a4 <StackSize+0x210104a4>
220108e0:	8302                	jr	t1

220108e2 <Update_SystemCoreClockWith_XTAL>:
Update_SystemCoreClockWith_XTAL():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:196
220108e2:	210117b7          	lui	a5,0x21011
220108e6:	8a87a303          	lw	t1,-1880(a5) # 210108a8 <StackSize+0x210104a8>
220108ea:	8302                	jr	t1

220108ec <GLB_Set_System_CLK>:
GLB_Set_System_CLK():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:201
220108ec:	210117b7          	lui	a5,0x21011
220108f0:	8ac7a303          	lw	t1,-1876(a5) # 210108ac <StackSize+0x210104ac>
220108f4:	8302                	jr	t1

220108f6 <System_Core_Clock_Update_From_RC32M>:
System_Core_Clock_Update_From_RC32M():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:206
220108f6:	210117b7          	lui	a5,0x21011
220108fa:	8b07a303          	lw	t1,-1872(a5) # 210108b0 <StackSize+0x210104b0>
220108fe:	8302                	jr	t1

22010900 <GLB_Set_SF_CLK>:
GLB_Set_SF_CLK():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:211
22010900:	210117b7          	lui	a5,0x21011
22010904:	8b47a303          	lw	t1,-1868(a5) # 210108b4 <StackSize+0x210104b4>
22010908:	8302                	jr	t1

2201090a <GLB_Set_PKA_CLK_Sel>:
GLB_Set_PKA_CLK_Sel():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:216
2201090a:	210117b7          	lui	a5,0x21011
2201090e:	8b87a303          	lw	t1,-1864(a5) # 210108b8 <StackSize+0x210104b8>
22010912:	8302                	jr	t1

22010914 <HBN_32K_Sel>:
HBN_32K_Sel():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:316
22010914:	210117b7          	lui	a5,0x21011
22010918:	9087a303          	lw	t1,-1784(a5) # 21010908 <StackSize+0x21010508>
2201091c:	8302                	jr	t1

2201091e <HBN_Set_ROOT_CLK_Sel>:
HBN_Set_ROOT_CLK_Sel():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:321
2201091e:	210117b7          	lui	a5,0x21011
22010922:	90c7a303          	lw	t1,-1780(a5) # 2101090c <StackSize+0x2101050c>
22010926:	8302                	jr	t1

22010928 <HBN_Power_On_Xtal_32K>:
HBN_Power_On_Xtal_32K():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:326
22010928:	210117b7          	lui	a5,0x21011
2201092c:	9107a303          	lw	t1,-1776(a5) # 21010910 <StackSize+0x21010510>
22010930:	8302                	jr	t1

22010932 <HBN_Power_Off_Xtal_32K>:
HBN_Power_Off_Xtal_32K():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:331
22010932:	210117b7          	lui	a5,0x21011
22010936:	9147a303          	lw	t1,-1772(a5) # 21010914 <StackSize+0x21010514>
2201093a:	8302                	jr	t1

2201093c <HBN_Power_On_RC32K>:
HBN_Power_On_RC32K():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:336
2201093c:	210117b7          	lui	a5,0x21011
22010940:	9187a303          	lw	t1,-1768(a5) # 21010918 <StackSize+0x21010518>
22010944:	8302                	jr	t1

22010946 <HBN_Power_Off_RC32K>:
HBN_Power_Off_RC32K():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:341
22010946:	210117b7          	lui	a5,0x21011
2201094a:	91c7a303          	lw	t1,-1764(a5) # 2101091c <StackSize+0x2101051c>
2201094e:	8302                	jr	t1

22010950 <HBN_Trim_RC32K>:
HBN_Trim_RC32K():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:346
22010950:	210117b7          	lui	a5,0x21011
22010954:	9207a303          	lw	t1,-1760(a5) # 21010920 <StackSize+0x21010520>
22010958:	8302                	jr	t1

2201095a <PDS_Trim_RC32M>:
PDS_Trim_RC32M():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:413
2201095a:	210117b7          	lui	a5,0x21011
2201095e:	9547a303          	lw	t1,-1708(a5) # 21010954 <StackSize+0x21010554>
22010962:	8302                	jr	t1

22010964 <PDS_Select_RC32M_As_PLL_Ref>:
PDS_Select_RC32M_As_PLL_Ref():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:418
22010964:	210117b7          	lui	a5,0x21011
22010968:	9587a303          	lw	t1,-1704(a5) # 21010958 <StackSize+0x21010558>
2201096c:	8302                	jr	t1

2201096e <PDS_Select_XTAL_As_PLL_Ref>:
PDS_Select_XTAL_As_PLL_Ref():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:423
2201096e:	210117b7          	lui	a5,0x21011
22010972:	95c7a303          	lw	t1,-1700(a5) # 2101095c <StackSize+0x2101055c>
22010976:	8302                	jr	t1

22010978 <PDS_Power_On_PLL>:
PDS_Power_On_PLL():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:428
22010978:	210117b7          	lui	a5,0x21011
2201097c:	9607a303          	lw	t1,-1696(a5) # 21010960 <StackSize+0x21010560>
22010980:	8302                	jr	t1

22010982 <PDS_Enable_PLL_All_Clks>:
PDS_Enable_PLL_All_Clks():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:433
22010982:	210117b7          	lui	a5,0x21011
22010986:	9647a303          	lw	t1,-1692(a5) # 21010964 <StackSize+0x21010564>
2201098a:	8302                	jr	t1

2201098c <PDS_Disable_PLL_All_Clks>:
PDS_Disable_PLL_All_Clks():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:438
2201098c:	210117b7          	lui	a5,0x21011
22010990:	9687a303          	lw	t1,-1688(a5) # 21010968 <StackSize+0x21010568>
22010994:	8302                	jr	t1

22010996 <PDS_Enable_PLL_Clk>:
PDS_Enable_PLL_Clk():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:443
22010996:	210117b7          	lui	a5,0x21011
2201099a:	96c7a303          	lw	t1,-1684(a5) # 2101096c <StackSize+0x2101056c>
2201099e:	8302                	jr	t1

220109a0 <PDS_Disable_PLL_Clk>:
PDS_Disable_PLL_Clk():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:448
220109a0:	210117b7          	lui	a5,0x21011
220109a4:	9707a303          	lw	t1,-1680(a5) # 21010970 <StackSize+0x21010570>
220109a8:	8302                	jr	t1

220109aa <PDS_Power_Off_PLL>:
PDS_Power_Off_PLL():
/d/workspace/BL602_WS/bl602_mcu_sdk/BSP_Driver/BL602_BSP_Driver/StdDriver/Src/bl602_romapi.c:453
220109aa:	210117b7          	lui	a5,0x21011
220109ae:	9747a303          	lw	t1,-1676(a5) # 21010974 <StackSize+0x21010574>
220109b2:	8302                	jr	t1
