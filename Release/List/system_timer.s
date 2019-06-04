///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.70.1.11437/W32 for ARM      18/Apr/2019  18:40:54
// Copyright 1999-2016 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\projects\L6IR\programm\L6_pro\mcu\system_timer.c
//    Command line =  
//        E:\projects\L6IR\programm\L6_pro\mcu\system_timer.c -D
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
//        E:\projects\L6IR\programm\L6_pro\Release\List\system_timer.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN SystemCoreClock
        EXTERN SystemCoreClockUpdate

        PUBLIC system_delay
        PUBLIC system_ticks
        PUBLIC system_timer_init


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void NVIC_SetPriority(IRQn_Type, uint32_t)
NVIC_SetPriority:
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BPL.N    ??NVIC_SetPriority_0
        LSLS     R1,R1,#+4
        LDR.N    R2,??DataTable3  ;; 0xe000ed18
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        ANDS     R0,R0,#0xF
        ADD      R0,R2,R0
        STRB     R1,[R0, #-4]
        B.N      ??NVIC_SetPriority_1
??NVIC_SetPriority_0:
        LSLS     R1,R1,#+4
        LDR.N    R2,??DataTable3_1  ;; 0xe000e400
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        STRB     R1,[R2, R0]
??NVIC_SetPriority_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp uint32_t SysTick_Config(uint32_t)
SysTick_Config:
        PUSH     {R7,LR}
        CMP      R0,#+16777216
        BCC.N    ??SysTick_Config_0
        MOVS     R0,#+1
        B.N      ??SysTick_Config_1
??SysTick_Config_0:
        BIC      R0,R0,#0xFF000000
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable3_2  ;; 0xe000e014
        STR      R0,[R1, #+0]
        MOVS     R1,#+15
        MOVS     R0,#-1
        BL       NVIC_SetPriority
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_3  ;; 0xe000e018
        STR      R0,[R1, #+0]
        MOVS     R0,#+7
        LDR.N    R1,??DataTable3_4  ;; 0xe000e010
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
??SysTick_Config_1:
        POP      {R1,PC}          ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
system_ticks:
        DS8 4

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
system_timer_init:
        PUSH     {R7,LR}
        BL       SystemCoreClockUpdate
        LDR.N    R0,??DataTable3_5
        LDR      R0,[R0, #+0]
        MOV      R1,#+500
        UDIV     R0,R0,R1
        BL       SysTick_Config
        CMP      R0,#+0
        BEQ.N    ??system_timer_init_0
??system_timer_init_1:
        B.N      ??system_timer_init_1
??system_timer_init_0:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_6
        STR      R0,[R1, #+0]
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
system_delay:
        LDR.N    R1,??DataTable3_6
        LDR      R1,[R1, #+0]
??system_delay_0:
        LDR.N    R2,??DataTable3_6
        LDR      R2,[R2, #+0]
        SUBS     R2,R2,R1
        CMP      R2,R0
        BCC.N    ??system_delay_0
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     0xe000ed18

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     0xe000e400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     0xe000e014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     0xe000e018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     0xe000e010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     SystemCoreClock

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     system_ticks

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
//   4 bytes in section .bss
// 162 bytes in section .text
// 
// 162 bytes of CODE memory
//   4 bytes of DATA memory
//
//Errors: none
//Warnings: none
