///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.70.1.11437/W32 for ARM      18/Apr/2019  18:40:48
// Copyright 1999-2016 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        E:\projects\L6IR\programm\L6_pro\STM32L1xx_StdPeriph_Driver\src\stm32l1xx_rcc.c
//    Command line =  
//        E:\projects\L6IR\programm\L6_pro\STM32L1xx_StdPeriph_Driver\src\stm32l1xx_rcc.c
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
//        E:\projects\L6IR\programm\L6_pro\Release\List\stm32l1xx_rcc.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC RCC_AHBPeriphClockCmd
        PUBLIC RCC_AHBPeriphClockLPModeCmd
        PUBLIC RCC_AHBPeriphResetCmd
        PUBLIC RCC_APB1PeriphClockCmd
        PUBLIC RCC_APB1PeriphClockLPModeCmd
        PUBLIC RCC_APB1PeriphResetCmd
        PUBLIC RCC_APB2PeriphClockCmd
        PUBLIC RCC_APB2PeriphClockLPModeCmd
        PUBLIC RCC_APB2PeriphResetCmd
        PUBLIC RCC_AdjustHSICalibrationValue
        PUBLIC RCC_AdjustMSICalibrationValue
        PUBLIC RCC_ClearFlag
        PUBLIC RCC_ClearITPendingBit
        PUBLIC RCC_ClockSecuritySystemCmd
        PUBLIC RCC_DeInit
        PUBLIC RCC_GetClocksFreq
        PUBLIC RCC_GetFlagStatus
        PUBLIC RCC_GetITStatus
        PUBLIC RCC_GetSYSCLKSource
        PUBLIC RCC_HCLKConfig
        PUBLIC RCC_HSEConfig
        PUBLIC RCC_HSICmd
        PUBLIC RCC_ITConfig
        PUBLIC RCC_LSEClockSecuritySystemCmd
        PUBLIC RCC_LSEConfig
        PUBLIC RCC_LSICmd
        PUBLIC RCC_MCOConfig
        PUBLIC RCC_MSICmd
        PUBLIC RCC_MSIRangeConfig
        PUBLIC RCC_PCLK1Config
        PUBLIC RCC_PCLK2Config
        PUBLIC RCC_PLLCmd
        PUBLIC RCC_PLLConfig
        PUBLIC RCC_RTCCLKCmd
        PUBLIC RCC_RTCCLKConfig
        PUBLIC RCC_RTCResetCmd
        PUBLIC RCC_SYSCLKConfig
        PUBLIC RCC_WaitForHSEStartUp


        SECTION `.data`:DATA:REORDER:NOROOT(2)
        DATA
PLLMulTable:
        DC8 3, 4, 6, 8, 12, 16, 24, 32, 48, 0, 0, 0

        SECTION `.data`:DATA:REORDER:NOROOT(2)
        DATA
APBAHBPrescTable:
        DC8 0, 0, 0, 0, 1, 2, 3, 4, 1, 2, 3, 4, 6, 7, 8, 9

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_DeInit:
        LDR.W    R0,??DataTable36  ;; 0x40023800
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x100
        LDR.W    R1,??DataTable36  ;; 0x40023800
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable36_1  ;; 0x40023808
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable36_2  ;; 0x88ffc00c
        ANDS     R0,R1,R0
        LDR.W    R1,??DataTable36_1  ;; 0x40023808
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable36  ;; 0x40023800
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable36_3  ;; 0xeefefffe
        ANDS     R0,R1,R0
        LDR.W    R1,??DataTable36  ;; 0x40023800
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable36  ;; 0x40023800
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x40000
        LDR.W    R1,??DataTable36  ;; 0x40023800
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable36_1  ;; 0x40023808
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0xFD0000
        LDR.W    R1,??DataTable36_1  ;; 0x40023808
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable36_4  ;; 0x4002380c
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_HSEConfig:
        MOVS     R1,#+0
        LDR.W    R2,??DataTable36_5  ;; 0x40023802
        STRB     R1,[R2, #+0]
        LDR.W    R1,??DataTable36_5  ;; 0x40023802
        STRB     R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_WaitForHSEStartUp:
        PUSH     {R7,LR}
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R0,#+0
        MOVS     R0,#+0
??RCC_WaitForHSEStartUp_0:
        MOVS     R0,#+49
        BL       RCC_GetFlagStatus
        LDR      R1,[SP, #+0]
        ADDS     R1,R1,#+1
        STR      R1,[SP, #+0]
        LDR      R1,[SP, #+0]
        CMP      R1,#+1280
        BEQ.N    ??RCC_WaitForHSEStartUp_1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??RCC_WaitForHSEStartUp_0
??RCC_WaitForHSEStartUp_1:
        MOVS     R0,#+49
        BL       RCC_GetFlagStatus
        CMP      R0,#+0
        BEQ.N    ??RCC_WaitForHSEStartUp_2
        MOVS     R0,#+1
        B.N      ??RCC_WaitForHSEStartUp_3
??RCC_WaitForHSEStartUp_2:
        MOVS     R0,#+0
??RCC_WaitForHSEStartUp_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_AdjustMSICalibrationValue:
        LDR.W    R1,??DataTable36_6  ;; 0x40023807
        STRB     R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_MSIRangeConfig:
        MOVS     R1,#+0
        LDR.W    R1,??DataTable36_7  ;; 0x40023804
        LDR      R1,[R1, #+0]
        BICS     R1,R1,#0xE000
        ORRS     R1,R0,R1
        LDR.W    R0,??DataTable36_7  ;; 0x40023804
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_MSICmd:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R1,??DataTable36_8  ;; 0x42470020
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_AdjustHSICalibrationValue:
        MOVS     R1,#+0
        LDR.W    R1,??DataTable36_7  ;; 0x40023804
        LDR      R1,[R1, #+0]
        BICS     R1,R1,#0x1F00
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ORRS     R1,R1,R0, LSL #+8
        LDR.W    R0,??DataTable36_7  ;; 0x40023804
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_HSICmd:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R1,??DataTable36_9  ;; 0x42470000
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_LSEConfig:
        MOVS     R1,#+0
        LDR.W    R2,??DataTable36_10  ;; 0x40023835
        STRB     R1,[R2, #+0]
        LDR.W    R1,??DataTable36_10  ;; 0x40023835
        STRB     R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_LSICmd:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R1,??DataTable36_11  ;; 0x42470680
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_PLLConfig:
        ORRS     R1,R2,R1
        ORRS     R0,R1,R0
        LDR.W    R1,??DataTable36_12  ;; 0x4002380a
        STRB     R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_PLLCmd:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R1,??DataTable36_13  ;; 0x42470060
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_ClockSecuritySystemCmd:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R1,??DataTable36_14  ;; 0x42470070
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_LSEClockSecuritySystemCmd:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R1,??DataTable36_15  ;; 0x424706ac
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_MCOConfig:
        ORRS     R0,R1,R0
        LDR.W    R1,??DataTable36_16  ;; 0x4002380b
        STRB     R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_SYSCLKConfig:
        MOVS     R1,#+0
        LDR.W    R1,??DataTable36_1  ;; 0x40023808
        LDR      R1,[R1, #+0]
        LSRS     R1,R1,#+2
        LSLS     R1,R1,#+2
        ORRS     R1,R0,R1
        LDR.W    R0,??DataTable36_1  ;; 0x40023808
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_GetSYSCLKSource:
        LDR.W    R0,??DataTable36_1  ;; 0x40023808
        LDR      R0,[R0, #+0]
        ANDS     R0,R0,#0xC
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_HCLKConfig:
        MOVS     R1,#+0
        LDR.W    R1,??DataTable36_1  ;; 0x40023808
        LDR      R1,[R1, #+0]
        BICS     R1,R1,#0xF0
        ORRS     R1,R0,R1
        LDR.N    R0,??DataTable36_1  ;; 0x40023808
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_PCLK1Config:
        MOVS     R1,#+0
        LDR.N    R1,??DataTable36_1  ;; 0x40023808
        LDR      R1,[R1, #+0]
        BICS     R1,R1,#0x700
        ORRS     R1,R0,R1
        LDR.N    R0,??DataTable36_1  ;; 0x40023808
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_PCLK2Config:
        MOVS     R1,#+0
        LDR.N    R1,??DataTable36_1  ;; 0x40023808
        LDR      R1,[R1, #+0]
        BICS     R1,R1,#0x3800
        ORRS     R1,R1,R0, LSL #+3
        LDR.N    R0,??DataTable36_1  ;; 0x40023808
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_GetClocksFreq:
        MOVS     R1,#+0
        MOVS     R1,#+0
        MOVS     R2,#+0
        MOVS     R3,#+0
        MOVS     R1,#+0
        MOVS     R1,#+0
        LDR.N    R1,??DataTable36_1  ;; 0x40023808
        LDR      R1,[R1, #+0]
        ANDS     R1,R1,#0xC
        CMP      R1,#+0
        BEQ.N    ??RCC_GetClocksFreq_0
        CMP      R1,#+4
        BEQ.N    ??RCC_GetClocksFreq_1
        CMP      R1,#+8
        BEQ.N    ??RCC_GetClocksFreq_2
        CMP      R1,#+12
        BEQ.N    ??RCC_GetClocksFreq_3
        B.N      ??RCC_GetClocksFreq_4
??RCC_GetClocksFreq_0:
        LDR.N    R1,??DataTable36_7  ;; 0x40023804
        LDR      R1,[R1, #+0]
        UBFX     R1,R1,#+13,#+3
        MOVS     R2,#+1
        ADDS     R1,R1,#+1
        LSLS     R1,R2,R1
        MOV      R2,#+32768
        MULS     R1,R2,R1
        STR      R1,[R0, #+0]
        B.N      ??RCC_GetClocksFreq_5
??RCC_GetClocksFreq_1:
        LDR.N    R1,??DataTable36_17  ;; 0xf42400
        STR      R1,[R0, #+0]
        B.N      ??RCC_GetClocksFreq_5
??RCC_GetClocksFreq_2:
        MOVS     R1,#+14745600
        STR      R1,[R0, #+0]
        B.N      ??RCC_GetClocksFreq_5
??RCC_GetClocksFreq_3:
        LDR.N    R1,??DataTable36_1  ;; 0x40023808
        LDR      R1,[R1, #+0]
        ANDS     R1,R1,#0x3C0000
        LDR.N    R2,??DataTable36_1  ;; 0x40023808
        LDR      R2,[R2, #+0]
        ANDS     R2,R2,#0xC00000
        LDR.N    R3,??DataTable36_18
        LSRS     R1,R1,#+18
        LDRB     R1,[R3, R1]
        LSRS     R2,R2,#+22
        ADDS     R2,R2,#+1
        LDR.N    R3,??DataTable36_1  ;; 0x40023808
        LDR      R3,[R3, #+0]
        ANDS     R3,R3,#0x10000
        CMP      R3,#+0
        BNE.N    ??RCC_GetClocksFreq_6
        LDR.N    R3,??DataTable36_17  ;; 0xf42400
        MULS     R1,R3,R1
        UDIV     R1,R1,R2
        STR      R1,[R0, #+0]
        B.N      ??RCC_GetClocksFreq_7
??RCC_GetClocksFreq_6:
        MOVS     R3,#+14745600
        MULS     R1,R3,R1
        UDIV     R1,R1,R2
        STR      R1,[R0, #+0]
??RCC_GetClocksFreq_7:
        B.N      ??RCC_GetClocksFreq_5
??RCC_GetClocksFreq_4:
        LDR.N    R1,??DataTable36_7  ;; 0x40023804
        LDR      R1,[R1, #+0]
        UBFX     R1,R1,#+13,#+3
        MOVS     R2,#+1
        ADDS     R1,R1,#+1
        LSLS     R1,R2,R1
        MOV      R2,#+32768
        MULS     R1,R2,R1
        STR      R1,[R0, #+0]
??RCC_GetClocksFreq_5:
        LDR.N    R1,??DataTable36_1  ;; 0x40023808
        LDR      R1,[R1, #+0]
        ANDS     R1,R1,#0xF0
        LSRS     R1,R1,#+4
        LDR.N    R2,??DataTable36_19
        LDRB     R1,[R2, R1]
        LDR      R2,[R0, #+0]
        LSRS     R2,R2,R1
        STR      R2,[R0, #+4]
        LDR.N    R1,??DataTable36_1  ;; 0x40023808
        LDR      R1,[R1, #+0]
        ANDS     R1,R1,#0x700
        LSRS     R1,R1,#+8
        LDR.N    R2,??DataTable36_19
        LDRB     R1,[R2, R1]
        LDR      R2,[R0, #+4]
        LSRS     R2,R2,R1
        STR      R2,[R0, #+8]
        LDR.N    R1,??DataTable36_1  ;; 0x40023808
        LDR      R1,[R1, #+0]
        ANDS     R1,R1,#0x3800
        LSRS     R1,R1,#+11
        LDR.N    R2,??DataTable36_19
        LDRB     R1,[R2, R1]
        LDR      R2,[R0, #+4]
        LSRS     R2,R2,R1
        STR      R2,[R0, #+12]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_RTCCLKConfig:
        MOVS     R1,#+0
        ANDS     R1,R0,#0x30000
        CMP      R1,#+196608
        BNE.N    ??RCC_RTCCLKConfig_0
        LDR.N    R1,??DataTable36  ;; 0x40023800
        LDR      R1,[R1, #+0]
        BICS     R1,R1,#0x60000000
        ANDS     R2,R0,#0x60000000
        ORRS     R1,R2,R1
        LDR.N    R2,??DataTable36  ;; 0x40023800
        STR      R1,[R2, #+0]
??RCC_RTCCLKConfig_0:
        LDR.N    R1,??DataTable36_20  ;; 0x40023834
        LDR      R1,[R1, #+0]
        BICS     R1,R1,#0x30000
        LDR.N    R2,??DataTable36_20  ;; 0x40023834
        STR      R1,[R2, #+0]
        LDR.N    R1,??DataTable36_20  ;; 0x40023834
        LDR      R1,[R1, #+0]
        ANDS     R0,R0,#0x30000
        ORRS     R0,R0,R1
        LDR.N    R1,??DataTable36_20  ;; 0x40023834
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_RTCCLKCmd:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable36_21  ;; 0x424706d8
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_RTCResetCmd:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable36_22  ;; 0x424706dc
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_AHBPeriphClockCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??RCC_AHBPeriphClockCmd_0
        LDR.N    R1,??DataTable36_23  ;; 0x4002381c
        LDR      R1,[R1, #+0]
        ORRS     R0,R0,R1
        LDR.N    R1,??DataTable36_23  ;; 0x4002381c
        STR      R0,[R1, #+0]
        B.N      ??RCC_AHBPeriphClockCmd_1
??RCC_AHBPeriphClockCmd_0:
        LDR.N    R1,??DataTable36_23  ;; 0x4002381c
        LDR      R1,[R1, #+0]
        BICS     R0,R1,R0
        LDR.N    R1,??DataTable36_23  ;; 0x4002381c
        STR      R0,[R1, #+0]
??RCC_AHBPeriphClockCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_APB2PeriphClockCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??RCC_APB2PeriphClockCmd_0
        LDR.N    R1,??DataTable36_24  ;; 0x40023820
        LDR      R1,[R1, #+0]
        ORRS     R0,R0,R1
        LDR.N    R1,??DataTable36_24  ;; 0x40023820
        STR      R0,[R1, #+0]
        B.N      ??RCC_APB2PeriphClockCmd_1
??RCC_APB2PeriphClockCmd_0:
        LDR.N    R1,??DataTable36_24  ;; 0x40023820
        LDR      R1,[R1, #+0]
        BICS     R0,R1,R0
        LDR.N    R1,??DataTable36_24  ;; 0x40023820
        STR      R0,[R1, #+0]
??RCC_APB2PeriphClockCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_APB1PeriphClockCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??RCC_APB1PeriphClockCmd_0
        LDR.N    R1,??DataTable36_25  ;; 0x40023824
        LDR      R1,[R1, #+0]
        ORRS     R0,R0,R1
        LDR.N    R1,??DataTable36_25  ;; 0x40023824
        STR      R0,[R1, #+0]
        B.N      ??RCC_APB1PeriphClockCmd_1
??RCC_APB1PeriphClockCmd_0:
        LDR.N    R1,??DataTable36_25  ;; 0x40023824
        LDR      R1,[R1, #+0]
        BICS     R0,R1,R0
        LDR.N    R1,??DataTable36_25  ;; 0x40023824
        STR      R0,[R1, #+0]
??RCC_APB1PeriphClockCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_AHBPeriphResetCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??RCC_AHBPeriphResetCmd_0
        LDR.N    R1,??DataTable36_26  ;; 0x40023810
        LDR      R1,[R1, #+0]
        ORRS     R0,R0,R1
        LDR.N    R1,??DataTable36_26  ;; 0x40023810
        STR      R0,[R1, #+0]
        B.N      ??RCC_AHBPeriphResetCmd_1
??RCC_AHBPeriphResetCmd_0:
        LDR.N    R1,??DataTable36_26  ;; 0x40023810
        LDR      R1,[R1, #+0]
        BICS     R0,R1,R0
        LDR.N    R1,??DataTable36_26  ;; 0x40023810
        STR      R0,[R1, #+0]
??RCC_AHBPeriphResetCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_APB2PeriphResetCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??RCC_APB2PeriphResetCmd_0
        LDR.N    R1,??DataTable36_27  ;; 0x40023814
        LDR      R1,[R1, #+0]
        ORRS     R0,R0,R1
        LDR.N    R1,??DataTable36_27  ;; 0x40023814
        STR      R0,[R1, #+0]
        B.N      ??RCC_APB2PeriphResetCmd_1
??RCC_APB2PeriphResetCmd_0:
        LDR.N    R1,??DataTable36_27  ;; 0x40023814
        LDR      R1,[R1, #+0]
        BICS     R0,R1,R0
        LDR.N    R1,??DataTable36_27  ;; 0x40023814
        STR      R0,[R1, #+0]
??RCC_APB2PeriphResetCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_APB1PeriphResetCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??RCC_APB1PeriphResetCmd_0
        LDR.N    R1,??DataTable36_28  ;; 0x40023818
        LDR      R1,[R1, #+0]
        ORRS     R0,R0,R1
        LDR.N    R1,??DataTable36_28  ;; 0x40023818
        STR      R0,[R1, #+0]
        B.N      ??RCC_APB1PeriphResetCmd_1
??RCC_APB1PeriphResetCmd_0:
        LDR.N    R1,??DataTable36_28  ;; 0x40023818
        LDR      R1,[R1, #+0]
        BICS     R0,R1,R0
        LDR.N    R1,??DataTable36_28  ;; 0x40023818
        STR      R0,[R1, #+0]
??RCC_APB1PeriphResetCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_AHBPeriphClockLPModeCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??RCC_AHBPeriphClockLPModeCmd_0
        LDR.N    R1,??DataTable36_29  ;; 0x40023828
        LDR      R1,[R1, #+0]
        ORRS     R0,R0,R1
        LDR.N    R1,??DataTable36_29  ;; 0x40023828
        STR      R0,[R1, #+0]
        B.N      ??RCC_AHBPeriphClockLPModeCmd_1
??RCC_AHBPeriphClockLPModeCmd_0:
        LDR.N    R1,??DataTable36_29  ;; 0x40023828
        LDR      R1,[R1, #+0]
        BICS     R0,R1,R0
        LDR.N    R1,??DataTable36_29  ;; 0x40023828
        STR      R0,[R1, #+0]
??RCC_AHBPeriphClockLPModeCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_APB2PeriphClockLPModeCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??RCC_APB2PeriphClockLPModeCmd_0
        LDR.N    R1,??DataTable36_30  ;; 0x4002382c
        LDR      R1,[R1, #+0]
        ORRS     R0,R0,R1
        LDR.N    R1,??DataTable36_30  ;; 0x4002382c
        STR      R0,[R1, #+0]
        B.N      ??RCC_APB2PeriphClockLPModeCmd_1
??RCC_APB2PeriphClockLPModeCmd_0:
        LDR.N    R1,??DataTable36_30  ;; 0x4002382c
        LDR      R1,[R1, #+0]
        BICS     R0,R1,R0
        LDR.N    R1,??DataTable36_30  ;; 0x4002382c
        STR      R0,[R1, #+0]
??RCC_APB2PeriphClockLPModeCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_APB1PeriphClockLPModeCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??RCC_APB1PeriphClockLPModeCmd_0
        LDR.N    R1,??DataTable36_31  ;; 0x40023830
        LDR      R1,[R1, #+0]
        ORRS     R0,R0,R1
        LDR.N    R1,??DataTable36_31  ;; 0x40023830
        STR      R0,[R1, #+0]
        B.N      ??RCC_APB1PeriphClockLPModeCmd_1
??RCC_APB1PeriphClockLPModeCmd_0:
        LDR.N    R1,??DataTable36_31  ;; 0x40023830
        LDR      R1,[R1, #+0]
        BICS     R0,R1,R0
        LDR.N    R1,??DataTable36_31  ;; 0x40023830
        STR      R0,[R1, #+0]
??RCC_APB1PeriphClockLPModeCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_ITConfig:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??RCC_ITConfig_0
        LDR.N    R1,??DataTable36_32  ;; 0x4002380d
        LDRB     R1,[R1, #+0]
        ORRS     R0,R0,R1
        LDR.N    R1,??DataTable36_32  ;; 0x4002380d
        STRB     R0,[R1, #+0]
        B.N      ??RCC_ITConfig_1
??RCC_ITConfig_0:
        LDR.N    R1,??DataTable36_32  ;; 0x4002380d
        LDRB     R1,[R1, #+0]
        BICS     R0,R1,R0
        LDR.N    R1,??DataTable36_32  ;; 0x4002380d
        STRB     R0,[R1, #+0]
??RCC_ITConfig_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_GetFlagStatus:
        MOVS     R1,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R1,R0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSRS     R1,R1,#+5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+1
        BNE.N    ??RCC_GetFlagStatus_0
        LDR.N    R1,??DataTable36  ;; 0x40023800
        LDR      R2,[R1, #+0]
        B.N      ??RCC_GetFlagStatus_1
??RCC_GetFlagStatus_0:
        LDR.N    R1,??DataTable36_20  ;; 0x40023834
        LDR      R2,[R1, #+0]
??RCC_GetFlagStatus_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ANDS     R1,R0,#0x1F
        LSRS     R2,R2,R1
        LSLS     R0,R2,#+31
        BPL.N    ??RCC_GetFlagStatus_2
        MOVS     R1,#+1
        B.N      ??RCC_GetFlagStatus_3
??RCC_GetFlagStatus_2:
        MOVS     R1,#+0
??RCC_GetFlagStatus_3:
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_ClearFlag:
        LDR.N    R0,??DataTable36_20  ;; 0x40023834
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000000
        LDR.N    R1,??DataTable36_20  ;; 0x40023834
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_GetITStatus:
        MOVS     R1,#+0
        LDR.N    R1,??DataTable36_4  ;; 0x4002380c
        LDR      R1,[R1, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        TST      R1,R0
        BEQ.N    ??RCC_GetITStatus_0
        MOVS     R1,#+1
        B.N      ??RCC_GetITStatus_1
??RCC_GetITStatus_0:
        MOVS     R1,#+0
??RCC_GetITStatus_1:
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_ClearITPendingBit:
        LDR.N    R1,??DataTable36_33  ;; 0x4002380e
        STRB     R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36:
        DC32     0x40023800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_1:
        DC32     0x40023808

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_2:
        DC32     0x88ffc00c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_3:
        DC32     0xeefefffe

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_4:
        DC32     0x4002380c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_5:
        DC32     0x40023802

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_6:
        DC32     0x40023807

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_7:
        DC32     0x40023804

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_8:
        DC32     0x42470020

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_9:
        DC32     0x42470000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_10:
        DC32     0x40023835

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_11:
        DC32     0x42470680

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_12:
        DC32     0x4002380a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_13:
        DC32     0x42470060

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_14:
        DC32     0x42470070

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_15:
        DC32     0x424706ac

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_16:
        DC32     0x4002380b

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_17:
        DC32     0xf42400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_18:
        DC32     PLLMulTable

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_19:
        DC32     APBAHBPrescTable

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_20:
        DC32     0x40023834

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_21:
        DC32     0x424706d8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_22:
        DC32     0x424706dc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_23:
        DC32     0x4002381c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_24:
        DC32     0x40023820

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_25:
        DC32     0x40023824

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_26:
        DC32     0x40023810

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_27:
        DC32     0x40023814

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_28:
        DC32     0x40023818

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_29:
        DC32     0x40023828

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_30:
        DC32     0x4002382c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_31:
        DC32     0x40023830

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_32:
        DC32     0x4002380d

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_33:
        DC32     0x4002380e

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
//    28 bytes in section .data
// 1 266 bytes in section .text
// 
// 1 266 bytes of CODE memory
//    28 bytes of DATA memory
//
//Errors: none
//Warnings: none
