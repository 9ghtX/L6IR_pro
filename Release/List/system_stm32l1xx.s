///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.70.1.11437/W32 for ARM      19/Apr/2019  12:09:19
// Copyright 1999-2016 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        E:\projects\L6IR\programm\L6_pro\CMSIS\Device\ST\STM32L1xx\Source\Templates\system_stm32l1xx.c
//    Command line =  
//        E:\projects\L6IR\programm\L6_pro\CMSIS\Device\ST\STM32L1xx\Source\Templates\system_stm32l1xx.c
//        -D USE_STDPERIPH_DRIVER -D STM32L1XX_MD -D FR14745600 -D nFR11059200
//        -D L6IR_CU -D nPT2_MODE -D PT7_MODE -D nTABLE_BAL -D nTNM_MODE -D
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
//        E:\projects\L6IR\programm\L6_pro\Release\List\system_stm32l1xx.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC AHBPrescTable
        PUBLIC PLLMulTable
        PUBLIC SystemCoreClock
        PUBLIC SystemCoreClockUpdate
        PUBLIC SystemInit


        SECTION `.data`:DATA:REORDER:NOROOT(2)
        DATA
SystemCoreClock:
        DC32 14745600

        SECTION `.data`:DATA:REORDER:NOROOT(2)
        DATA
PLLMulTable:
        DC8 3, 4, 6, 8, 12, 16, 24, 32, 48, 0, 0, 0

        SECTION `.data`:DATA:REORDER:NOROOT(2)
        DATA
AHBPrescTable:
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 6, 7, 8, 9

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SystemInit:
        PUSH     {R7,LR}
        LDR.N    R0,??DataTable2  ;; 0x40023800
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x100
        LDR.N    R1,??DataTable2  ;; 0x40023800
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable2_1  ;; 0x40023808
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable2_2  ;; 0x88ffc00c
        ANDS     R0,R1,R0
        LDR.N    R1,??DataTable2_1  ;; 0x40023808
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable2  ;; 0x40023800
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable2_3  ;; 0xeefefffe
        ANDS     R0,R1,R0
        LDR.N    R1,??DataTable2  ;; 0x40023800
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable2  ;; 0x40023800
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x40000
        LDR.N    R1,??DataTable2  ;; 0x40023800
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable2_1  ;; 0x40023808
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0xFD0000
        LDR.N    R1,??DataTable2_1  ;; 0x40023808
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_4  ;; 0x4002380c
        STR      R0,[R1, #+0]
        BL       SetSysClock
        MOVS     R0,#+134217728
        LDR.N    R1,??DataTable2_5  ;; 0xe000ed08
        STR      R0,[R1, #+0]
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SystemCoreClockUpdate:
        MOVS     R0,#+0
        MOVS     R0,#+0
        MOVS     R1,#+0
        MOVS     R2,#+0
        MOVS     R0,#+0
        LDR.N    R0,??DataTable2_1  ;; 0x40023808
        LDR      R0,[R0, #+0]
        ANDS     R0,R0,#0xC
        CMP      R0,#+0
        BEQ.N    ??SystemCoreClockUpdate_0
        CMP      R0,#+4
        BEQ.N    ??SystemCoreClockUpdate_1
        CMP      R0,#+8
        BEQ.N    ??SystemCoreClockUpdate_2
        CMP      R0,#+12
        BEQ.N    ??SystemCoreClockUpdate_3
        B.N      ??SystemCoreClockUpdate_4
??SystemCoreClockUpdate_0:
        LDR.N    R0,??DataTable2_6  ;; 0x40023804
        LDR      R0,[R0, #+0]
        UBFX     R0,R0,#+13,#+3
        MOVS     R1,#+1
        ADDS     R0,R0,#+1
        LSLS     R0,R1,R0
        MOV      R1,#+32768
        MULS     R0,R1,R0
        LDR.N    R1,??DataTable2_7
        STR      R0,[R1, #+0]
        B.N      ??SystemCoreClockUpdate_5
??SystemCoreClockUpdate_1:
        LDR.N    R0,??DataTable2_8  ;; 0xf42400
        LDR.N    R1,??DataTable2_7
        STR      R0,[R1, #+0]
        B.N      ??SystemCoreClockUpdate_5
??SystemCoreClockUpdate_2:
        MOVS     R0,#+14745600
        LDR.N    R1,??DataTable2_7
        STR      R0,[R1, #+0]
        B.N      ??SystemCoreClockUpdate_5
??SystemCoreClockUpdate_3:
        LDR.N    R0,??DataTable2_1  ;; 0x40023808
        LDR      R0,[R0, #+0]
        ANDS     R0,R0,#0x3C0000
        LDR.N    R1,??DataTable2_1  ;; 0x40023808
        LDR      R1,[R1, #+0]
        ANDS     R1,R1,#0xC00000
        LDR.N    R2,??DataTable2_9
        LSRS     R0,R0,#+18
        LDRB     R0,[R2, R0]
        LSRS     R1,R1,#+22
        ADDS     R1,R1,#+1
        LDR.N    R2,??DataTable2_1  ;; 0x40023808
        LDR      R2,[R2, #+0]
        ANDS     R2,R2,#0x10000
        CMP      R2,#+0
        BNE.N    ??SystemCoreClockUpdate_6
        LDR.N    R2,??DataTable2_8  ;; 0xf42400
        MULS     R0,R2,R0
        UDIV     R0,R0,R1
        LDR.N    R1,??DataTable2_7
        STR      R0,[R1, #+0]
        B.N      ??SystemCoreClockUpdate_7
??SystemCoreClockUpdate_6:
        MOVS     R2,#+14745600
        MULS     R0,R2,R0
        UDIV     R0,R0,R1
        LDR.N    R1,??DataTable2_7
        STR      R0,[R1, #+0]
??SystemCoreClockUpdate_7:
        B.N      ??SystemCoreClockUpdate_5
??SystemCoreClockUpdate_4:
        LDR.N    R0,??DataTable2_6  ;; 0x40023804
        LDR      R0,[R0, #+0]
        UBFX     R0,R0,#+13,#+3
        MOVS     R1,#+1
        ADDS     R0,R0,#+1
        LSLS     R0,R1,R0
        MOV      R1,#+32768
        MULS     R0,R1,R0
        LDR.N    R1,??DataTable2_7
        STR      R0,[R1, #+0]
??SystemCoreClockUpdate_5:
        LDR.N    R0,??DataTable2_1  ;; 0x40023808
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable2_10
        UBFX     R0,R0,#+4,#+4
        LDRB     R0,[R1, R0]
        LDR.N    R1,??DataTable2_7
        LDR      R1,[R1, #+0]
        LSRS     R1,R1,R0
        LDR.N    R0,??DataTable2_7
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SetSysClock:
        SUB      SP,SP,#+8
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        LDR.N    R0,??DataTable2  ;; 0x40023800
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000
        LDR.N    R1,??DataTable2  ;; 0x40023800
        STR      R0,[R1, #+0]
??SetSysClock_0:
        LDR.N    R0,??DataTable2  ;; 0x40023800
        LDR      R0,[R0, #+0]
        ANDS     R0,R0,#0x20000
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+4]
        ADDS     R0,R0,#+1
        STR      R0,[SP, #+4]
        LDR      R0,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??SetSysClock_1
        LDR      R0,[SP, #+4]
        CMP      R0,#+1280
        BNE.N    ??SetSysClock_0
??SetSysClock_1:
        LDR.N    R0,??DataTable2  ;; 0x40023800
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+14
        BPL.N    ??SetSysClock_2
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
        B.N      ??SetSysClock_3
??SetSysClock_2:
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
??SetSysClock_3:
        LDR      R0,[SP, #+0]
        CMP      R0,#+1
        BNE.N    ??SetSysClock_4
        LDR.N    R0,??DataTable2_11  ;; 0x40023c00
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable2_11  ;; 0x40023c00
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable2_11  ;; 0x40023c00
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable2_11  ;; 0x40023c00
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable2_11  ;; 0x40023c00
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable2_11  ;; 0x40023c00
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable2_12  ;; 0x40023824
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000000
        LDR.N    R1,??DataTable2_12  ;; 0x40023824
        STR      R0,[R1, #+0]
        MOV      R0,#+2048
        LDR.N    R1,??DataTable2_13  ;; 0x40007000
        STR      R0,[R1, #+0]
??SetSysClock_5:
        LDR.N    R0,??DataTable2_14  ;; 0x40007004
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+27
        BMI.N    ??SetSysClock_5
        LDR.N    R0,??DataTable2_1  ;; 0x40023808
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable2_1  ;; 0x40023808
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable2_1  ;; 0x40023808
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable2_1  ;; 0x40023808
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable2_1  ;; 0x40023808
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable2_1  ;; 0x40023808
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable2_1  ;; 0x40023808
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+2
        LSLS     R0,R0,#+2
        LDR.N    R1,??DataTable2_1  ;; 0x40023808
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable2_1  ;; 0x40023808
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable2_1  ;; 0x40023808
        STR      R0,[R1, #+0]
??SetSysClock_6:
        LDR.N    R0,??DataTable2_1  ;; 0x40023808
        LDR      R0,[R0, #+0]
        ANDS     R0,R0,#0xC
        CMP      R0,#+8
        BNE.N    ??SetSysClock_6
??SetSysClock_4:
        ADD      SP,SP,#+8
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     0x40023800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     0x40023808

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     0x88ffc00c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     0xeefefffe

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     0x4002380c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     0xe000ed08

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     0x40023804

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     SystemCoreClock

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_8:
        DC32     0xf42400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_9:
        DC32     PLLMulTable

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_10:
        DC32     AHBPrescTable

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_11:
        DC32     0x40023c00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_12:
        DC32     0x40023824

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_13:
        DC32     0x40007000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_14:
        DC32     0x40007004

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
//  32 bytes in section .data
// 546 bytes in section .text
// 
// 546 bytes of CODE memory
//  32 bytes of DATA memory
//
//Errors: none
//Warnings: none
