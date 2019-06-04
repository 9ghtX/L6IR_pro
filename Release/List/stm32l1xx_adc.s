///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.70.1.11437/W32 for ARM      18/Apr/2019  18:40:39
// Copyright 1999-2016 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        E:\projects\L6IR\programm\L6_pro\STM32L1xx_StdPeriph_Driver\src\stm32l1xx_adc.c
//    Command line =  
//        E:\projects\L6IR\programm\L6_pro\STM32L1xx_StdPeriph_Driver\src\stm32l1xx_adc.c
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
//        E:\projects\L6IR\programm\L6_pro\Release\List\stm32l1xx_adc.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN RCC_APB2PeriphResetCmd

        PUBLIC ADC_AnalogWatchdogCmd
        PUBLIC ADC_AnalogWatchdogSingleChannelConfig
        PUBLIC ADC_AnalogWatchdogThresholdsConfig
        PUBLIC ADC_AutoInjectedConvCmd
        PUBLIC ADC_BankSelection
        PUBLIC ADC_ClearFlag
        PUBLIC ADC_ClearITPendingBit
        PUBLIC ADC_Cmd
        PUBLIC ADC_CommonInit
        PUBLIC ADC_CommonStructInit
        PUBLIC ADC_ContinuousModeCmd
        PUBLIC ADC_DMACmd
        PUBLIC ADC_DMARequestAfterLastTransferCmd
        PUBLIC ADC_DeInit
        PUBLIC ADC_DelaySelectionConfig
        PUBLIC ADC_DiscModeChannelCountConfig
        PUBLIC ADC_DiscModeCmd
        PUBLIC ADC_EOCOnEachRegularChannelCmd
        PUBLIC ADC_ExternalTrigInjectedConvConfig
        PUBLIC ADC_ExternalTrigInjectedConvEdgeConfig
        PUBLIC ADC_GetConversionValue
        PUBLIC ADC_GetFlagStatus
        PUBLIC ADC_GetITStatus
        PUBLIC ADC_GetInjectedConversionValue
        PUBLIC ADC_GetSoftwareStartConvStatus
        PUBLIC ADC_GetSoftwareStartInjectedConvCmdStatus
        PUBLIC ADC_ITConfig
        PUBLIC ADC_Init
        PUBLIC ADC_InjectedChannelConfig
        PUBLIC ADC_InjectedDiscModeCmd
        PUBLIC ADC_InjectedSequencerLengthConfig
        PUBLIC ADC_PowerDownCmd
        PUBLIC ADC_RegularChannelConfig
        PUBLIC ADC_SetInjectedOffset
        PUBLIC ADC_SoftwareStartConv
        PUBLIC ADC_SoftwareStartInjectedConv
        PUBLIC ADC_StructInit
        PUBLIC ADC_TempSensorVrefintCmd


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_DeInit:
        PUSH     {R7,LR}
        LDR.N    R1,??DataTable4  ;; 0x40012400
        CMP      R0,R1
        BNE.N    ??ADC_DeInit_0
        MOVS     R1,#+1
        MOV      R0,#+512
        BL       RCC_APB2PeriphResetCmd
        MOVS     R1,#+0
        MOV      R0,#+512
        BL       RCC_APB2PeriphResetCmd
??ADC_DeInit_0:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_Init:
        PUSH     {R4,R5}
        MOVS     R3,#+0
        MOVS     R2,#+0
        LDR      R3,[R0, #+4]
        LDR.N    R4,??DataTable4_1  ;; 0xfcfffeff
        ANDS     R3,R4,R3
        LDRB     R4,[R1, #+4]
        LDR      R5,[R1, #+0]
        ORRS     R4,R5,R4, LSL #+8
        ORRS     R3,R4,R3
        STR      R3,[R0, #+4]
        LDR      R3,[R0, #+8]
        LDR.N    R4,??DataTable4_2  ;; 0xc0fff7fd
        ANDS     R3,R4,R3
        LDR      R4,[R1, #+16]
        LDR      R5,[R1, #+12]
        ORRS     R4,R5,R4
        LDR      R5,[R1, #+8]
        ORRS     R4,R5,R4
        LDRB     R5,[R1, #+5]
        ORRS     R4,R4,R5, LSL #+1
        ORRS     R3,R4,R3
        STR      R3,[R0, #+8]
        LDR      R3,[R0, #+48]
        BICS     R3,R3,#0x1F00000
        LDRB     R1,[R1, #+20]
        SUBS     R1,R1,#+1
        ORRS     R2,R1,R2
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ORRS     R3,R3,R2, LSL #+20
        STR      R3,[R0, #+48]
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_StructInit:
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        MOVS     R1,#+0
        STRB     R1,[R0, #+4]
        MOVS     R1,#+0
        STRB     R1,[R0, #+5]
        MOVS     R1,#+0
        STR      R1,[R0, #+8]
        MOVS     R1,#+50331648
        STR      R1,[R0, #+12]
        MOVS     R1,#+0
        STR      R1,[R0, #+16]
        MOVS     R1,#+1
        STRB     R1,[R0, #+20]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_CommonInit:
        MOVS     R1,#+0
        LDR.N    R1,??DataTable4_3  ;; 0x40012704
        LDR      R1,[R1, #+0]
        BICS     R1,R1,#0x30000
        LDR      R0,[R0, #+0]
        ORRS     R1,R0,R1
        LDR.N    R0,??DataTable4_3  ;; 0x40012704
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_CommonStructInit:
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_Cmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??ADC_Cmd_0
        LDR      R1,[R0, #+8]
        ORRS     R1,R1,#0x1
        STR      R1,[R0, #+8]
        B.N      ??ADC_Cmd_1
??ADC_Cmd_0:
        LDR      R1,[R0, #+8]
        LSRS     R1,R1,#+1
        LSLS     R1,R1,#+1
        STR      R1,[R0, #+8]
??ADC_Cmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_BankSelection:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??ADC_BankSelection_0
        LDR      R1,[R0, #+8]
        ORRS     R1,R1,#0x4
        STR      R1,[R0, #+8]
        B.N      ??ADC_BankSelection_1
??ADC_BankSelection_0:
        LDR      R1,[R0, #+8]
        BICS     R1,R1,#0x4
        STR      R1,[R0, #+8]
??ADC_BankSelection_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_PowerDownCmd:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??ADC_PowerDownCmd_0
        LDR      R2,[R0, #+4]
        ORRS     R1,R1,R2
        STR      R1,[R0, #+4]
        B.N      ??ADC_PowerDownCmd_1
??ADC_PowerDownCmd_0:
        LDR      R2,[R0, #+4]
        BICS     R1,R2,R1
        STR      R1,[R0, #+4]
??ADC_PowerDownCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_DelaySelectionConfig:
        MOVS     R2,#+0
        LDR      R2,[R0, #+8]
        BICS     R2,R2,#0xF0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ORRS     R2,R1,R2
        STR      R2,[R0, #+8]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_AnalogWatchdogCmd:
        MOVS     R2,#+0
        LDR      R2,[R0, #+4]
        LDR.N    R3,??DataTable4_4  ;; 0xff3ffdff
        ANDS     R2,R3,R2
        ORRS     R2,R1,R2
        STR      R2,[R0, #+4]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_AnalogWatchdogThresholdsConfig:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        STR      R1,[R0, #+40]
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        STR      R2,[R0, #+44]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_AnalogWatchdogSingleChannelConfig:
        MOVS     R2,#+0
        LDR      R2,[R0, #+4]
        LSRS     R2,R2,#+5
        LSLS     R2,R2,#+5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ORRS     R2,R1,R2
        STR      R2,[R0, #+4]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_TempSensorVrefintCmd:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??ADC_TempSensorVrefintCmd_0
        LDR.N    R0,??DataTable4_3  ;; 0x40012704
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800000
        LDR.N    R1,??DataTable4_3  ;; 0x40012704
        STR      R0,[R1, #+0]
        B.N      ??ADC_TempSensorVrefintCmd_1
??ADC_TempSensorVrefintCmd_0:
        LDR.N    R0,??DataTable4_3  ;; 0x40012704
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x800000
        LDR.N    R1,??DataTable4_3  ;; 0x40012704
        STR      R0,[R1, #+0]
??ADC_TempSensorVrefintCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     0x40012400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     0xfcfffeff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     0xc0fff7fd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     0x40012704

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     0xff3ffdff

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_RegularChannelConfig:
        PUSH     {R4-R7}
        MOVS     R4,#+0
        MOVS     R5,#+0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+30
        BLT.N    ??ADC_RegularChannelConfig_0
        LDR      R4,[R0, #+92]
        MOVS     R5,#+7
        SUBS     R6,R1,#+30
        MOVS     R7,#+3
        MULS     R6,R7,R6
        LSLS     R5,R5,R6
        BICS     R4,R4,R5
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        SUBS     R5,R1,#+30
        MOVS     R6,#+3
        MULS     R5,R6,R5
        LSLS     R5,R3,R5
        ORRS     R4,R5,R4
        STR      R4,[R0, #+92]
        B.N      ??ADC_RegularChannelConfig_1
??ADC_RegularChannelConfig_0:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+20
        BLT.N    ??ADC_RegularChannelConfig_2
        LDR      R4,[R0, #+12]
        MOVS     R5,#+7
        SUBS     R6,R1,#+20
        MOVS     R7,#+3
        MULS     R6,R7,R6
        LSLS     R5,R5,R6
        BICS     R4,R4,R5
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        SUBS     R5,R1,#+20
        MOVS     R6,#+3
        MULS     R5,R6,R5
        LSLS     R5,R3,R5
        ORRS     R4,R5,R4
        STR      R4,[R0, #+12]
        B.N      ??ADC_RegularChannelConfig_1
??ADC_RegularChannelConfig_2:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+10
        BLT.N    ??ADC_RegularChannelConfig_3
        LDR      R4,[R0, #+16]
        MOVS     R5,#+7
        SUBS     R6,R1,#+10
        MOVS     R7,#+3
        MULS     R6,R7,R6
        LSLS     R5,R5,R6
        BICS     R4,R4,R5
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        SUBS     R5,R1,#+10
        MOVS     R6,#+3
        MULS     R5,R6,R5
        LSLS     R5,R3,R5
        ORRS     R4,R5,R4
        STR      R4,[R0, #+16]
        B.N      ??ADC_RegularChannelConfig_1
??ADC_RegularChannelConfig_3:
        LDR      R4,[R0, #+20]
        MOVS     R5,#+7
        MOVS     R6,#+3
        MUL      R6,R6,R1
        LSLS     R5,R5,R6
        BICS     R4,R4,R5
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        MOVS     R5,#+3
        MUL      R5,R5,R1
        LSLS     R5,R3,R5
        ORRS     R4,R5,R4
        STR      R4,[R0, #+20]
??ADC_RegularChannelConfig_1:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+7
        BGE.N    ??ADC_RegularChannelConfig_4
        LDR      R4,[R0, #+64]
        MOVS     R3,#+31
        SUBS     R5,R2,#+1
        MOVS     R6,#+5
        MULS     R5,R6,R5
        LSLS     R5,R3,R5
        BICS     R4,R4,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        SUBS     R2,R2,#+1
        MOVS     R3,#+5
        MULS     R2,R3,R2
        LSLS     R5,R1,R2
        ORRS     R4,R5,R4
        STR      R4,[R0, #+64]
        B.N      ??ADC_RegularChannelConfig_5
??ADC_RegularChannelConfig_4:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+13
        BGE.N    ??ADC_RegularChannelConfig_6
        LDR      R4,[R0, #+60]
        MOVS     R3,#+31
        SUBS     R5,R2,#+7
        MOVS     R6,#+5
        MULS     R5,R6,R5
        LSLS     R5,R3,R5
        BICS     R4,R4,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        SUBS     R2,R2,#+7
        MOVS     R3,#+5
        MULS     R2,R3,R2
        LSLS     R5,R1,R2
        ORRS     R4,R5,R4
        STR      R4,[R0, #+60]
        B.N      ??ADC_RegularChannelConfig_5
??ADC_RegularChannelConfig_6:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+19
        BGE.N    ??ADC_RegularChannelConfig_7
        LDR      R4,[R0, #+56]
        MOVS     R3,#+31
        SUBS     R5,R2,#+13
        MOVS     R6,#+5
        MULS     R5,R6,R5
        LSLS     R5,R3,R5
        BICS     R4,R4,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        SUBS     R2,R2,#+13
        MOVS     R3,#+5
        MULS     R2,R3,R2
        LSLS     R5,R1,R2
        ORRS     R4,R5,R4
        STR      R4,[R0, #+56]
        B.N      ??ADC_RegularChannelConfig_5
??ADC_RegularChannelConfig_7:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+25
        BGE.N    ??ADC_RegularChannelConfig_8
        LDR      R4,[R0, #+52]
        MOVS     R3,#+31
        SUBS     R5,R2,#+19
        MOVS     R6,#+5
        MULS     R5,R6,R5
        LSLS     R5,R3,R5
        BICS     R4,R4,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        SUBS     R2,R2,#+19
        MOVS     R3,#+5
        MULS     R2,R3,R2
        LSLS     R5,R1,R2
        ORRS     R4,R5,R4
        STR      R4,[R0, #+52]
        B.N      ??ADC_RegularChannelConfig_5
??ADC_RegularChannelConfig_8:
        LDR      R4,[R0, #+48]
        MOVS     R3,#+31
        SUBS     R5,R2,#+25
        MOVS     R6,#+5
        MULS     R5,R6,R5
        LSLS     R5,R3,R5
        BICS     R4,R4,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        SUBS     R2,R2,#+25
        MOVS     R3,#+5
        MULS     R2,R3,R2
        LSLS     R5,R1,R2
        ORRS     R4,R5,R4
        STR      R4,[R0, #+48]
??ADC_RegularChannelConfig_5:
        POP      {R4-R7}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_SoftwareStartConv:
        LDR      R1,[R0, #+8]
        ORRS     R1,R1,#0x40000000
        STR      R1,[R0, #+8]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_GetSoftwareStartConvStatus:
        MOVS     R1,#+0
        LDR      R0,[R0, #+8]
        LSLS     R0,R0,#+1
        BPL.N    ??ADC_GetSoftwareStartConvStatus_0
        MOVS     R1,#+1
        B.N      ??ADC_GetSoftwareStartConvStatus_1
??ADC_GetSoftwareStartConvStatus_0:
        MOVS     R1,#+0
??ADC_GetSoftwareStartConvStatus_1:
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_EOCOnEachRegularChannelCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??ADC_EOCOnEachRegularChannelCmd_0
        LDR      R1,[R0, #+8]
        ORRS     R1,R1,#0x400
        STR      R1,[R0, #+8]
        B.N      ??ADC_EOCOnEachRegularChannelCmd_1
??ADC_EOCOnEachRegularChannelCmd_0:
        LDR      R1,[R0, #+8]
        BICS     R1,R1,#0x400
        STR      R1,[R0, #+8]
??ADC_EOCOnEachRegularChannelCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_ContinuousModeCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??ADC_ContinuousModeCmd_0
        LDR      R1,[R0, #+8]
        ORRS     R1,R1,#0x2
        STR      R1,[R0, #+8]
        B.N      ??ADC_ContinuousModeCmd_1
??ADC_ContinuousModeCmd_0:
        LDR      R1,[R0, #+8]
        BICS     R1,R1,#0x2
        STR      R1,[R0, #+8]
??ADC_ContinuousModeCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_DiscModeChannelCountConfig:
        MOVS     R2,#+0
        MOVS     R3,#+0
        LDR      R2,[R0, #+4]
        BICS     R2,R2,#0xE000
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        SUBS     R3,R1,#+1
        ORRS     R2,R2,R3, LSL #+13
        STR      R2,[R0, #+4]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_DiscModeCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??ADC_DiscModeCmd_0
        LDR      R1,[R0, #+4]
        ORRS     R1,R1,#0x800
        STR      R1,[R0, #+4]
        B.N      ??ADC_DiscModeCmd_1
??ADC_DiscModeCmd_0:
        LDR      R1,[R0, #+4]
        BICS     R1,R1,#0x800
        STR      R1,[R0, #+4]
??ADC_DiscModeCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_GetConversionValue:
        LDR      R0,[R0, #+88]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_DMACmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??ADC_DMACmd_0
        LDR      R1,[R0, #+8]
        ORRS     R1,R1,#0x100
        STR      R1,[R0, #+8]
        B.N      ??ADC_DMACmd_1
??ADC_DMACmd_0:
        LDR      R1,[R0, #+8]
        BICS     R1,R1,#0x100
        STR      R1,[R0, #+8]
??ADC_DMACmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_DMARequestAfterLastTransferCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??ADC_DMARequestAfterLastTransferCmd_0
        LDR      R1,[R0, #+8]
        ORRS     R1,R1,#0x200
        STR      R1,[R0, #+8]
        B.N      ??ADC_DMARequestAfterLastTransferCmd_1
??ADC_DMARequestAfterLastTransferCmd_0:
        LDR      R1,[R0, #+8]
        BICS     R1,R1,#0x200
        STR      R1,[R0, #+8]
??ADC_DMARequestAfterLastTransferCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_InjectedChannelConfig:
        PUSH     {R4-R7}
        MOVS     R4,#+0
        MOVS     R5,#+0
        MOVS     R6,#+0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+30
        BLT.N    ??ADC_InjectedChannelConfig_0
        LDR      R4,[R0, #+92]
        MOVS     R5,#+7
        SUBS     R6,R1,#+30
        MOVS     R7,#+3
        MULS     R6,R7,R6
        LSLS     R5,R5,R6
        BICS     R4,R4,R5
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        SUBS     R5,R1,#+30
        MOVS     R6,#+3
        MULS     R5,R6,R5
        LSLS     R5,R3,R5
        ORRS     R4,R5,R4
        STR      R4,[R0, #+92]
        B.N      ??ADC_InjectedChannelConfig_1
??ADC_InjectedChannelConfig_0:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+20
        BLT.N    ??ADC_InjectedChannelConfig_2
        LDR      R4,[R0, #+12]
        MOVS     R5,#+7
        SUBS     R6,R1,#+20
        MOVS     R7,#+3
        MULS     R6,R7,R6
        LSLS     R5,R5,R6
        BICS     R4,R4,R5
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        SUBS     R5,R1,#+20
        MOVS     R6,#+3
        MULS     R5,R6,R5
        LSLS     R5,R3,R5
        ORRS     R4,R5,R4
        STR      R4,[R0, #+12]
        B.N      ??ADC_InjectedChannelConfig_1
??ADC_InjectedChannelConfig_2:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+10
        BLT.N    ??ADC_InjectedChannelConfig_3
        LDR      R4,[R0, #+16]
        MOVS     R5,#+7
        SUBS     R6,R1,#+10
        MOVS     R7,#+3
        MULS     R6,R7,R6
        LSLS     R5,R5,R6
        BICS     R4,R4,R5
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        SUBS     R5,R1,#+10
        MOVS     R6,#+3
        MULS     R5,R6,R5
        LSLS     R5,R3,R5
        ORRS     R4,R5,R4
        STR      R4,[R0, #+16]
        B.N      ??ADC_InjectedChannelConfig_1
??ADC_InjectedChannelConfig_3:
        LDR      R4,[R0, #+20]
        MOVS     R5,#+7
        MOVS     R6,#+3
        MUL      R6,R6,R1
        LSLS     R5,R5,R6
        BICS     R4,R4,R5
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        MOVS     R5,#+3
        MUL      R5,R5,R1
        LSLS     R5,R3,R5
        ORRS     R4,R5,R4
        STR      R4,[R0, #+20]
??ADC_InjectedChannelConfig_1:
        LDR      R4,[R0, #+68]
        UBFX     R6,R4,#+20,#+2
        MOVS     R3,#+31
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ADDS     R5,R2,#+3
        SUBS     R5,R5,R6
        SUBS     R5,R5,#+1
        MOVS     R7,#+5
        MULS     R5,R7,R5
        LSLS     R5,R3,R5
        BICS     R4,R4,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ADDS     R2,R2,#+3
        SUBS     R2,R2,R6
        SUBS     R2,R2,#+1
        MOVS     R3,#+5
        MULS     R2,R3,R2
        LSLS     R5,R1,R2
        ORRS     R4,R5,R4
        STR      R4,[R0, #+68]
        POP      {R4-R7}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_InjectedSequencerLengthConfig:
        MOVS     R2,#+0
        MOVS     R3,#+0
        LDR      R2,[R0, #+68]
        BICS     R2,R2,#0x300000
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        SUBS     R3,R1,#+1
        ORRS     R2,R2,R3, LSL #+20
        STR      R2,[R0, #+68]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_SetInjectedOffset:
        SUB      SP,SP,#+4
        MOVS     R3,#+0
        STR      R3,[SP, #+0]
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R0,R1,R0
        STR      R0,[SP, #+0]
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        LDR      R0,[SP, #+0]
        STR      R2,[R0, #+0]
        ADD      SP,SP,#+4
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_ExternalTrigInjectedConvConfig:
        MOVS     R2,#+0
        LDR      R2,[R0, #+8]
        BICS     R2,R2,#0xF0000
        ORRS     R2,R1,R2
        STR      R2,[R0, #+8]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_ExternalTrigInjectedConvEdgeConfig:
        MOVS     R2,#+0
        LDR      R2,[R0, #+8]
        BICS     R2,R2,#0x300000
        ORRS     R2,R1,R2
        STR      R2,[R0, #+8]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_SoftwareStartInjectedConv:
        LDR      R1,[R0, #+8]
        ORRS     R1,R1,#0x400000
        STR      R1,[R0, #+8]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_GetSoftwareStartInjectedConvCmdStatus:
        MOVS     R1,#+0
        LDR      R0,[R0, #+8]
        LSLS     R0,R0,#+9
        BPL.N    ??ADC_GetSoftwareStartInjectedConvCmdStatus_0
        MOVS     R1,#+1
        B.N      ??ADC_GetSoftwareStartInjectedConvCmdStatus_1
??ADC_GetSoftwareStartInjectedConvCmdStatus_0:
        MOVS     R1,#+0
??ADC_GetSoftwareStartInjectedConvCmdStatus_1:
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_AutoInjectedConvCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??ADC_AutoInjectedConvCmd_0
        LDR      R1,[R0, #+4]
        ORRS     R1,R1,#0x400
        STR      R1,[R0, #+4]
        B.N      ??ADC_AutoInjectedConvCmd_1
??ADC_AutoInjectedConvCmd_0:
        LDR      R1,[R0, #+4]
        BICS     R1,R1,#0x400
        STR      R1,[R0, #+4]
??ADC_AutoInjectedConvCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_InjectedDiscModeCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??ADC_InjectedDiscModeCmd_0
        LDR      R1,[R0, #+4]
        ORRS     R1,R1,#0x1000
        STR      R1,[R0, #+4]
        B.N      ??ADC_InjectedDiscModeCmd_1
??ADC_InjectedDiscModeCmd_0:
        LDR      R1,[R0, #+4]
        BICS     R1,R1,#0x1000
        STR      R1,[R0, #+4]
??ADC_InjectedDiscModeCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_GetInjectedConversionValue:
        SUB      SP,SP,#+4
        MOVS     R2,#+0
        STR      R2,[SP, #+0]
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R1,R1,#+48
        ADDS     R0,R1,R0
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        ADD      SP,SP,#+4
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_ITConfig:
        MOVS     R3,#+0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R3,R1
        MOVS     R1,#+1
        LSLS     R3,R1,R3
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??ADC_ITConfig_0
        LDR      R1,[R0, #+4]
        ORRS     R1,R3,R1
        STR      R1,[R0, #+4]
        B.N      ??ADC_ITConfig_1
??ADC_ITConfig_0:
        LDR      R1,[R0, #+4]
        BICS     R1,R1,R3
        STR      R1,[R0, #+4]
??ADC_ITConfig_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_GetFlagStatus:
        MOVS     R2,#+0
        LDR      R0,[R0, #+0]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        TST      R0,R1
        BEQ.N    ??ADC_GetFlagStatus_0
        MOVS     R2,#+1
        B.N      ??ADC_GetFlagStatus_1
??ADC_GetFlagStatus_0:
        MOVS     R2,#+0
??ADC_GetFlagStatus_1:
        MOVS     R0,R2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_ClearFlag:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MVNS     R1,R1
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_GetITStatus:
        PUSH     {R4}
        MOVS     R2,#+0
        MOVS     R2,#+0
        MOVS     R3,#+0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LSRS     R2,R1,#+8
        LDR      R3,[R0, #+4]
        MOVS     R4,#+1
        LSLS     R1,R4,R1
        ANDS     R3,R1,R3
        LDR      R0,[R0, #+0]
        TST      R0,R2
        BEQ.N    ??ADC_GetITStatus_0
        CMP      R3,#+0
        BEQ.N    ??ADC_GetITStatus_0
        MOVS     R2,#+1
        B.N      ??ADC_GetITStatus_1
??ADC_GetITStatus_0:
        MOVS     R2,#+0
??ADC_GetITStatus_1:
        MOVS     R0,R2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_ClearITPendingBit:
        MOVS     R2,#+0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LSRS     R2,R1,#+8
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MVNS     R1,R2
        STR      R1,[R0, #+0]
        BX       LR               ;; return

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
// 1 426 bytes in section .text
// 
// 1 426 bytes of CODE memory
//
//Errors: none
//Warnings: none
