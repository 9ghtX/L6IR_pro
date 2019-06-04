///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.70.1.11437/W32 for ARM      18/Apr/2019  18:40:42
// Copyright 1999-2016 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        E:\projects\L6IR\programm\L6_pro\STM32L1xx_StdPeriph_Driver\src\stm32l1xx_exti.c
//    Command line =  
//        E:\projects\L6IR\programm\L6_pro\STM32L1xx_StdPeriph_Driver\src\stm32l1xx_exti.c
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
//        E:\projects\L6IR\programm\L6_pro\Release\List\stm32l1xx_exti.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC EXTI_ClearFlag
        PUBLIC EXTI_ClearITPendingBit
        PUBLIC EXTI_DeInit
        PUBLIC EXTI_GenerateSWInterrupt
        PUBLIC EXTI_GetFlagStatus
        PUBLIC EXTI_GetITStatus
        PUBLIC EXTI_Init
        PUBLIC EXTI_StructInit


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
EXTI_DeInit:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6  ;; 0x40010400
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_1  ;; 0x40010404
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_2  ;; 0x40010408
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_3  ;; 0x4001040c
        STR      R0,[R1, #+0]
        MVNS     R0,#-16777216
        LDR.N    R1,??DataTable6_4  ;; 0x40010414
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
EXTI_Init:
        MOVS     R1,#+0
        LDR.N    R1,??DataTable6  ;; 0x40010400
        LDRB     R2,[R0, #+6]
        CMP      R2,#+0
        BEQ.N    ??EXTI_Init_0
        LDR.N    R2,??DataTable6  ;; 0x40010400
        LDR      R2,[R2, #+0]
        LDR      R3,[R0, #+0]
        BICS     R2,R2,R3
        LDR.N    R3,??DataTable6  ;; 0x40010400
        STR      R2,[R3, #+0]
        LDR.N    R2,??DataTable6_1  ;; 0x40010404
        LDR      R2,[R2, #+0]
        LDR      R3,[R0, #+0]
        BICS     R2,R2,R3
        LDR.N    R3,??DataTable6_1  ;; 0x40010404
        STR      R2,[R3, #+0]
        LDRB     R2,[R0, #+4]
        ADDS     R1,R2,R1
        LDR      R2,[R1, #+0]
        LDR      R3,[R0, #+0]
        ORRS     R2,R3,R2
        STR      R2,[R1, #+0]
        LDR.N    R1,??DataTable6_2  ;; 0x40010408
        LDR      R1,[R1, #+0]
        LDR      R2,[R0, #+0]
        BICS     R1,R1,R2
        LDR.N    R2,??DataTable6_2  ;; 0x40010408
        STR      R1,[R2, #+0]
        LDR.N    R1,??DataTable6_3  ;; 0x4001040c
        LDR      R1,[R1, #+0]
        LDR      R2,[R0, #+0]
        BICS     R1,R1,R2
        LDR.N    R2,??DataTable6_3  ;; 0x4001040c
        STR      R1,[R2, #+0]
        LDRB     R1,[R0, #+5]
        CMP      R1,#+16
        BNE.N    ??EXTI_Init_1
        LDR.N    R1,??DataTable6_2  ;; 0x40010408
        LDR      R1,[R1, #+0]
        LDR      R2,[R0, #+0]
        ORRS     R1,R2,R1
        LDR.N    R2,??DataTable6_2  ;; 0x40010408
        STR      R1,[R2, #+0]
        LDR.N    R1,??DataTable6_3  ;; 0x4001040c
        LDR      R1,[R1, #+0]
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,R1
        LDR.N    R1,??DataTable6_3  ;; 0x4001040c
        STR      R0,[R1, #+0]
        B.N      ??EXTI_Init_2
??EXTI_Init_1:
        LDR.N    R1,??DataTable6  ;; 0x40010400
        LDRB     R2,[R0, #+5]
        ADDS     R1,R2,R1
        LDR      R2,[R1, #+0]
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,R2
        STR      R0,[R1, #+0]
        B.N      ??EXTI_Init_2
??EXTI_Init_0:
        LDRB     R2,[R0, #+4]
        ADDS     R1,R2,R1
        LDR      R2,[R1, #+0]
        LDR      R0,[R0, #+0]
        BICS     R0,R2,R0
        STR      R0,[R1, #+0]
??EXTI_Init_2:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
EXTI_StructInit:
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        MOVS     R1,#+0
        STRB     R1,[R0, #+4]
        MOVS     R1,#+12
        STRB     R1,[R0, #+5]
        MOVS     R1,#+0
        STRB     R1,[R0, #+6]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
EXTI_GenerateSWInterrupt:
        LDR.N    R1,??DataTable6_5  ;; 0x40010410
        LDR      R1,[R1, #+0]
        ORRS     R0,R0,R1
        LDR.N    R1,??DataTable6_5  ;; 0x40010410
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
EXTI_GetFlagStatus:
        MOVS     R1,#+0
        LDR.N    R1,??DataTable6_4  ;; 0x40010414
        LDR      R1,[R1, #+0]
        TST      R1,R0
        BEQ.N    ??EXTI_GetFlagStatus_0
        MOVS     R1,#+1
        B.N      ??EXTI_GetFlagStatus_1
??EXTI_GetFlagStatus_0:
        MOVS     R1,#+0
??EXTI_GetFlagStatus_1:
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
EXTI_ClearFlag:
        LDR.N    R1,??DataTable6_4  ;; 0x40010414
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
EXTI_GetITStatus:
        MOVS     R1,#+0
        MOVS     R1,#+0
        LDR.N    R1,??DataTable6  ;; 0x40010400
        LDR      R1,[R1, #+0]
        ANDS     R1,R0,R1
        LDR.N    R2,??DataTable6_4  ;; 0x40010414
        LDR      R2,[R2, #+0]
        TST      R2,R0
        BEQ.N    ??EXTI_GetITStatus_0
        CMP      R1,#+0
        BEQ.N    ??EXTI_GetITStatus_0
        MOVS     R1,#+1
        B.N      ??EXTI_GetITStatus_1
??EXTI_GetITStatus_0:
        MOVS     R1,#+0
??EXTI_GetITStatus_1:
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
EXTI_ClearITPendingBit:
        LDR.N    R1,??DataTable6_4  ;; 0x40010414
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     0x40010400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     0x40010404

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     0x40010408

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     0x4001040c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_4:
        DC32     0x40010414

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_5:
        DC32     0x40010410

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
// 290 bytes in section .text
// 
// 290 bytes of CODE memory
//
//Errors: none
//Warnings: none
