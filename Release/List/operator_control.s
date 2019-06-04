///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.70.1.11437/W32 for ARM      18/Apr/2019  18:40:28
// Copyright 1999-2016 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\projects\L6IR\programm\L6_pro\operator_control.c
//    Command line =  
//        E:\projects\L6IR\programm\L6_pro\operator_control.c -D
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
//        E:\projects\L6IR\programm\L6_pro\Release\List\operator_control.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN ADC_data
        EXTERN GPIO_ResetBits
        EXTERN GPIO_SetBits

        PUBLIC Operator_present_control
        PUBLIC display_st
        PUBLIC operator_ctrl_consist
        PUBLIC photo_data_dark
        PUBLIC photo_data_light
        PUBLIC waiting_control_time


        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        DATA
display_st:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        DATA
operator_ctrl_consist:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
        DATA
waiting_control_time:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
photo_data_light:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
photo_data_dark:
        DS8 4

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
Operator_present_control:
        PUSH     {R7,LR}
        LDR.N    R0,??Operator_present_control_0
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??Operator_present_control_1
        CMP      R0,#+1
        BEQ.N    ??Operator_present_control_2
        CMP      R0,#+2
        BEQ.N    ??Operator_present_control_3
        CMP      R0,#+3
        BEQ.N    ??Operator_present_control_4
        CMP      R0,#+5
        BEQ.N    ??Operator_present_control_5
        B.N      ??Operator_present_control_6
??Operator_present_control_1:
        LDR.N    R0,??Operator_present_control_0+0x4
        LDRSH    R0,[R0, #+0]
        CMP      R0,#+1
        BLT.N    ??Operator_present_control_7
        LDR.N    R0,??Operator_present_control_0+0x4
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??Operator_present_control_0+0x4
        STRH     R0,[R1, #+0]
        B.N      ??Operator_present_control_8
??Operator_present_control_7:
        MOVS     R1,#+128
        LDR.N    R0,??Operator_present_control_0+0x8  ;; 0x40020000
        BL       GPIO_SetBits
        MOVS     R0,#+1
        LDR.N    R1,??Operator_present_control_0
        STRB     R0,[R1, #+0]
        MOVS     R0,#+50
        LDR.N    R1,??Operator_present_control_0+0x4
        STRH     R0,[R1, #+0]
??Operator_present_control_8:
        B.N      ??Operator_present_control_6
??Operator_present_control_2:
        LDR.N    R0,??Operator_present_control_0+0xC
        LDRH     R0,[R0, #+4]
        LDR.N    R1,??Operator_present_control_0+0x10
        STR      R0,[R1, #+0]
        MOVS     R0,#+2
        LDR.N    R1,??Operator_present_control_0
        STRB     R0,[R1, #+0]
        B.N      ??Operator_present_control_6
??Operator_present_control_3:
        LDR.N    R0,??Operator_present_control_0+0x10
        LDR      R0,[R0, #+0]
        LDR.N    R1,??Operator_present_control_0+0xC
        LDRH     R1,[R1, #+4]
        ADDS     R0,R1,R0
        LDR.N    R1,??Operator_present_control_0+0x10
        STR      R0,[R1, #+0]
        LDR.N    R0,??Operator_present_control_0+0x4
        LDRSH    R0,[R0, #+0]
        CMP      R0,#+1
        BLT.N    ??Operator_present_control_9
        LDR.N    R0,??Operator_present_control_0+0x4
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??Operator_present_control_0+0x4
        STRH     R0,[R1, #+0]
        B.N      ??Operator_present_control_10
??Operator_present_control_9:
        MOVS     R0,#+3
        LDR.N    R1,??Operator_present_control_0
        STRB     R0,[R1, #+0]
??Operator_present_control_10:
        B.N      ??Operator_present_control_6
??Operator_present_control_4:
        LDR.N    R0,??Operator_present_control_0+0x10
        LDR      R0,[R0, #+0]
        LDR.N    R1,??Operator_present_control_0+0xC
        LDRH     R1,[R1, #+4]
        ADDS     R0,R1,R0
        LDR.N    R1,??Operator_present_control_0+0x10
        STR      R0,[R1, #+0]
        LDR.N    R0,??Operator_present_control_0+0x14
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??Operator_present_control_11
        LDR.N    R0,??Operator_present_control_0+0x10
        LDR      R0,[R0, #+0]
        CMP      R0,#+600
        BLS.N    ??Operator_present_control_11
        MOVS     R0,#+3
        LDR.N    R1,??Operator_present_control_0+0x14
        STRB     R0,[R1, #+0]
??Operator_present_control_11:
        LDR.N    R0,??Operator_present_control_0+0x14
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??Operator_present_control_12
        LDR.N    R0,??Operator_present_control_0+0x10
        LDR      R0,[R0, #+0]
        CMP      R0,#+284
        BHI.N    ??Operator_present_control_12
        MOVS     R0,#+2
        LDR.N    R1,??Operator_present_control_0+0x14
        STRB     R0,[R1, #+0]
??Operator_present_control_12:
        MOVS     R1,#+128
        LDR.N    R0,??Operator_present_control_0+0x8  ;; 0x40020000
        BL       GPIO_ResetBits
        MOVS     R0,#+50
        LDR.N    R1,??Operator_present_control_0+0x4
        STRH     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??Operator_present_control_0
        STRB     R0,[R1, #+0]
        B.N      ??Operator_present_control_6
??Operator_present_control_5:
        MOVS     R0,#+0
        LDR.N    R1,??Operator_present_control_0
        STRB     R0,[R1, #+0]
??Operator_present_control_6:
        POP      {R0,PC}          ;; return
        DATA
??Operator_present_control_0:
        DC32     operator_ctrl_consist
        DC32     waiting_control_time
        DC32     0x40020000
        DC32     ADC_data
        DC32     photo_data_light
        DC32     display_st

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
//  12 bytes in section .bss
// 248 bytes in section .text
// 
// 248 bytes of CODE memory
//  12 bytes of DATA memory
//
//Errors: none
//Warnings: 1
