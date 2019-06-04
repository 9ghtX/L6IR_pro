///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.70.1.11437/W32 for ARM      18/Apr/2019  18:40:18
// Copyright 1999-2016 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\projects\L6IR\programm\L6_pro\default_flash_content.c
//    Command line =  
//        E:\projects\L6IR\programm\L6_pro\default_flash_content.c -D
//        USE_STDPERIPH_DRIVER -D STM32L1XX_MD -D FR14745600 -D nFR11059200 -D
//        L6IR_CU -D nPT2_MODE -D PT7_MODE -D nTABLE_BAL -D nTNM_MODE -D
//        nSWIR_MODE -D nA3G4250D -D nLPS331AP -D METEO -D nTEST_MODE -D
//        nFLASH_ENABLE -lcN E:\projects\L6IR\programm\L6_pro\Release\List -lb
//        E:\projects\L6IR\programm\L6_pro\Release\List -o
//        E:\projects\L6IR\programm\L6_pro\Release\Obj --no_cse --no_unroll
//        --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M3 -e --fpu=None
//        --dlib_config "C:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.5\arm\INC\c\DLib_Config_Normal.h" -I
//        E:\projects\L6IR\programm\L6_pro\STM32L1xx_StdPeriph_Driver\src\ -I
//        E:\projects\L6IR\programm\L6_pro\STM32L1xx_StdPeriph_Driver\inc\ -I
//        E:\projects\L6IR\programm\L6_pro\mcu\ -I
//        E:\projects\L6IR\programm\L6_pro\mcu\inc\ -I
//        nE:\projects\L6IR\programm\L6_pro\CMSIS\CM3\CoreSupport\ -I
//        E:\projects\L6IR\programm\L6_pro\CMSIS\Device\ST\STM32L1xx\Include\
//        -I E:\projects\L6IR\programm\L6_pro\mcu\startup\iar\ -I
//        E:\projects\L6IR\programm\L6_pro\rfu_stm32\include\ -I
//        E:\projects\L6IR\programm\L6_pro\rfu_stm32\source\ -I
//        E:\projects\L6IR\programm\L6_pro\CMSIS\Include\ -I
//        E:\projects\L6IR\programm\L6_pro\ -Ol
//    Locale       =  Russian_Russia.1251
//    List file    =  
//        E:\projects\L6IR\programm\L6_pro\Release\List\default_flash_content.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN flash

        PUBLIC default_flash_content


        SECTION `.text`:CODE:NOROOT(2)
        THUMB
default_flash_content:
        LDR.N    R0,??default_flash_content_0  ;; 0x429a0000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+8]
        LDR.N    R0,??default_flash_content_0+0x8  ;; 0x3c75c28f
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+12]
        MOVS     R0,#+0
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+20]
        LDR.N    R0,??default_flash_content_0+0xC  ;; 0x444bc000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+24]
        LDR.N    R0,??default_flash_content_0+0x10  ;; 0x41166666
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+28]
        LDR.N    R0,??default_flash_content_0+0x14  ;; 0x3ed0e560
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+32]
        LDR.N    R0,??default_flash_content_0+0x18  ;; 0x43700000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+48]
        LDR.N    R0,??default_flash_content_0+0x1C  ;; 0x42bc0000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+52]
        LDR.N    R0,??default_flash_content_0+0x20  ;; 0x42c80000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+36]
        LDR.N    R0,??default_flash_content_0+0x24  ;; 0x443b8000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+44]
        LDR.N    R0,??default_flash_content_0+0x28  ;; 0x41700000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+40]
        MOVS     R0,#+1
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+56]
        LDR.N    R0,??default_flash_content_0+0xC  ;; 0x444bc000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+60]
        LDR.N    R0,??default_flash_content_0+0x10  ;; 0x41166666
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+64]
        LDR.N    R0,??default_flash_content_0+0x14  ;; 0x3ed0e560
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+68]
        LDR.N    R0,??default_flash_content_0+0x18  ;; 0x43700000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+84]
        LDR.N    R0,??default_flash_content_0+0x1C  ;; 0x42bc0000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+88]
        LDR.N    R0,??default_flash_content_0+0x20  ;; 0x42c80000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+72]
        LDR.N    R0,??default_flash_content_0+0x24  ;; 0x443b8000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+80]
        LDR.N    R0,??default_flash_content_0+0x28  ;; 0x41700000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+76]
        MOVS     R0,#+2
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+92]
        LDR.N    R0,??default_flash_content_0+0x2C  ;; 0x444e4000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+96]
        LDR.N    R0,??default_flash_content_0+0x30  ;; 0x4119999a
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+100]
        LDR.N    R0,??default_flash_content_0+0x34  ;; 0x3ed2f1aa
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+104]
        LDR.N    R0,??default_flash_content_0+0x18  ;; 0x43700000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+120]
        LDR.N    R0,??default_flash_content_0+0x1C  ;; 0x42bc0000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+124]
        LDR.N    R0,??default_flash_content_0+0x20  ;; 0x42c80000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+108]
        LDR.N    R0,??default_flash_content_0+0x24  ;; 0x443b8000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+116]
        LDR.N    R0,??default_flash_content_0+0x28  ;; 0x41700000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+112]
        MOVS     R0,#+3
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+128]
        LDR.N    R0,??default_flash_content_0+0xC  ;; 0x444bc000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+132]
        LDR.N    R0,??default_flash_content_0+0x10  ;; 0x41166666
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+136]
        LDR.N    R0,??default_flash_content_0+0x14  ;; 0x3ed0e560
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+140]
        LDR.N    R0,??default_flash_content_0+0x18  ;; 0x43700000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+156]
        LDR.N    R0,??default_flash_content_0+0x38  ;; 0x42b20000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+160]
        LDR.N    R0,??default_flash_content_0+0x20  ;; 0x42c80000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+144]
        LDR.N    R0,??default_flash_content_0+0x24  ;; 0x443b8000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+152]
        LDR.N    R0,??default_flash_content_0+0x28  ;; 0x41700000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+148]
        MOVS     R0,#+4
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+164]
        LDR.N    R0,??default_flash_content_0+0x2C  ;; 0x444e4000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+168]
        LDR.N    R0,??default_flash_content_0+0x10  ;; 0x41166666
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+172]
        LDR.N    R0,??default_flash_content_0+0x14  ;; 0x3ed0e560
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+176]
        LDR.N    R0,??default_flash_content_0+0x18  ;; 0x43700000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+192]
        LDR.N    R0,??default_flash_content_0+0x38  ;; 0x42b20000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+196]
        LDR.N    R0,??default_flash_content_0+0x20  ;; 0x42c80000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+180]
        LDR.N    R0,??default_flash_content_0+0x24  ;; 0x443b8000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+188]
        LDR.N    R0,??default_flash_content_0+0x28  ;; 0x41700000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+184]
        MOVS     R0,#+5
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+200]
        LDR.N    R0,??default_flash_content_0+0x3C  ;; 0x44430000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+204]
        LDR.N    R0,??default_flash_content_0+0x10  ;; 0x41166666
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+208]
        LDR.N    R0,??default_flash_content_0+0x14  ;; 0x3ed0e560
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+212]
        LDR.N    R0,??default_flash_content_0+0x18  ;; 0x43700000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+228]
        LDR.N    R0,??default_flash_content_0+0x38  ;; 0x42b20000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+232]
        LDR.N    R0,??default_flash_content_0+0x20  ;; 0x42c80000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+216]
        LDR.N    R0,??default_flash_content_0+0x24  ;; 0x443b8000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+224]
        LDR.N    R0,??default_flash_content_0+0x28  ;; 0x41700000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+220]
        MOVS     R0,#+6
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+236]
        LDR.N    R0,??default_flash_content_0+0x2C  ;; 0x444e4000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+240]
        LDR.N    R0,??default_flash_content_0+0x10  ;; 0x41166666
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+244]
        LDR.N    R0,??default_flash_content_0+0x14  ;; 0x3ed0e560
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+248]
        LDR.N    R0,??default_flash_content_0+0x18  ;; 0x43700000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+264]
        LDR.N    R0,??default_flash_content_0+0x38  ;; 0x42b20000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+268]
        LDR.N    R0,??default_flash_content_0+0x20  ;; 0x42c80000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+252]
        LDR.N    R0,??default_flash_content_0+0x24  ;; 0x443b8000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+260]
        LDR.N    R0,??default_flash_content_0+0x28  ;; 0x41700000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+256]
        LDR.N    R0,??default_flash_content_0+0x3C  ;; 0x44430000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+276]
        LDR.N    R0,??default_flash_content_0+0x10  ;; 0x41166666
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+280]
        LDR.N    R0,??default_flash_content_0+0x14  ;; 0x3ed0e560
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+284]
        LDR.N    R0,??default_flash_content_0+0x18  ;; 0x43700000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+300]
        LDR.N    R0,??default_flash_content_0+0x38  ;; 0x42b20000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+304]
        LDR.N    R0,??default_flash_content_0+0x20  ;; 0x42c80000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+288]
        LDR.N    R0,??default_flash_content_0+0x24  ;; 0x443b8000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+296]
        LDR.N    R0,??default_flash_content_0+0x28  ;; 0x41700000
        LDR.N    R1,??default_flash_content_0+0x4
        STR      R0,[R1, #+292]
        BX       LR               ;; return
        DATA
??default_flash_content_0:
        DC32     0x429a0000
        DC32     flash
        DC32     0x3c75c28f
        DC32     0x444bc000
        DC32     0x41166666
        DC32     0x3ed0e560
        DC32     0x43700000
        DC32     0x42bc0000
        DC32     0x42c80000
        DC32     0x443b8000
        DC32     0x41700000
        DC32     0x444e4000
        DC32     0x4119999a
        DC32     0x3ed2f1aa
        DC32     0x42b20000
        DC32     0x44430000

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// 
// 592 bytes in section .text
// 
// 592 bytes of CODE memory
//
//Errors: none
//Warnings: none
