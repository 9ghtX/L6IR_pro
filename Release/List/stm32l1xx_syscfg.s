///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.70.1.11437/W32 for ARM      18/Apr/2019  18:40:50
// Copyright 1999-2016 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        E:\projects\L6IR\programm\L6_pro\STM32L1xx_StdPeriph_Driver\src\stm32l1xx_syscfg.c
//    Command line =  
//        E:\projects\L6IR\programm\L6_pro\STM32L1xx_StdPeriph_Driver\src\stm32l1xx_syscfg.c
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
//        E:\projects\L6IR\programm\L6_pro\Release\List\stm32l1xx_syscfg.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN RCC_APB2PeriphResetCmd

        PUBLIC SYSCFG_DeInit
        PUBLIC SYSCFG_EXTILineConfig
        PUBLIC SYSCFG_GetBootMode
        PUBLIC SYSCFG_MemoryRemapConfig
        PUBLIC SYSCFG_RIChannelSpeedConfig
        PUBLIC SYSCFG_RIDeInit
        PUBLIC SYSCFG_RIHysteresisConfig
        PUBLIC SYSCFG_RIIOSwitchConfig
        PUBLIC SYSCFG_RIResistorConfig
        PUBLIC SYSCFG_RISwitchControlModeCmd
        PUBLIC SYSCFG_RITIMInputCaptureConfig
        PUBLIC SYSCFG_RITIMSelect
        PUBLIC SYSCFG_USBPuCmd


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SYSCFG_DeInit:
        PUSH     {R7,LR}
        MOVS     R1,#+1
        MOVS     R0,#+1
        BL       RCC_APB2PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+1
        BL       RCC_APB2PeriphResetCmd
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SYSCFG_RIDeInit:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable11  ;; 0x40007c04
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable11_1  ;; 0x40007c08
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable11_2  ;; 0x40007c0c
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable11_3  ;; 0x40007c10
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable11_4  ;; 0x40007c14
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable11_5  ;; 0x40007c18
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable11_6  ;; 0x40007c1c
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SYSCFG_MemoryRemapConfig:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable11_7  ;; 0x40010000
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SYSCFG_GetBootMode:
        LDR.N    R0,??DataTable11_7  ;; 0x40010000
        LDR      R0,[R0, #+0]
        ANDS     R0,R0,#0x300
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SYSCFG_USBPuCmd:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??SYSCFG_USBPuCmd_0
        LDR.N    R0,??DataTable11_8  ;; 0x40010004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable11_8  ;; 0x40010004
        STR      R0,[R1, #+0]
        B.N      ??SYSCFG_USBPuCmd_1
??SYSCFG_USBPuCmd_0:
        LDR.N    R0,??DataTable11_8  ;; 0x40010004
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable11_8  ;; 0x40010004
        STR      R0,[R1, #+0]
??SYSCFG_USBPuCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SYSCFG_EXTILineConfig:
        PUSH     {R4}
        MOVS     R2,#+0
        MOVS     R2,#+15
        ANDS     R3,R1,#0x3
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        LSLS     R3,R3,#+2
        LSLS     R2,R2,R3
        LDR.N    R3,??DataTable11_9  ;; 0x40010008
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ASRS     R4,R1,#+2
        LDR      R3,[R3, R4, LSL #+2]
        BICS     R2,R3,R2
        LDR.N    R3,??DataTable11_9  ;; 0x40010008
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ASRS     R4,R1,#+2
        STR      R2,[R3, R4, LSL #+2]
        LDR.N    R2,??DataTable11_9  ;; 0x40010008
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ASRS     R3,R1,#+2
        LDR      R2,[R2, R3, LSL #+2]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ANDS     R3,R1,#0x3
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        LSLS     R3,R3,#+2
        LSLS     R0,R0,R3
        ORRS     R0,R0,R2
        LDR.N    R2,??DataTable11_9  ;; 0x40010008
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ASRS     R1,R1,#+2
        STR      R0,[R2, R1, LSL #+2]
        POP      {R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SYSCFG_RITIMSelect:
        MOVS     R1,#+0
        LDR.N    R1,??DataTable11  ;; 0x40007c04
        LDR      R1,[R1, #+0]
        BICS     R1,R1,#0x30000
        ORRS     R1,R0,R1
        LDR.N    R0,??DataTable11  ;; 0x40007c04
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SYSCFG_RITIMInputCaptureConfig:
        MOVS     R2,#+0
        LDR.N    R2,??DataTable11  ;; 0x40007c04
        LDR      R2,[R2, #+0]
        ORRS     R2,R0,R2
        LSLS     R3,R0,#+13
        BPL.N    ??SYSCFG_RITIMInputCaptureConfig_0
        LSRS     R2,R2,#+4
        LSLS     R2,R2,#+4
        ORRS     R2,R1,R2
??SYSCFG_RITIMInputCaptureConfig_0:
        LSLS     R3,R0,#+12
        BPL.N    ??SYSCFG_RITIMInputCaptureConfig_1
        BICS     R2,R2,#0xF0
        ORRS     R2,R2,R1, LSL #+4
??SYSCFG_RITIMInputCaptureConfig_1:
        LSLS     R3,R0,#+11
        BPL.N    ??SYSCFG_RITIMInputCaptureConfig_2
        BICS     R2,R2,#0xF00
        ORRS     R2,R2,R1, LSL #+8
??SYSCFG_RITIMInputCaptureConfig_2:
        LSLS     R0,R0,#+10
        BPL.N    ??SYSCFG_RITIMInputCaptureConfig_3
        BICS     R2,R2,#0xF000
        ORRS     R2,R2,R1, LSL #+12
??SYSCFG_RITIMInputCaptureConfig_3:
        LDR.N    R0,??DataTable11  ;; 0x40007c04
        STR      R2,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SYSCFG_RIResistorConfig:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??SYSCFG_RIResistorConfig_0
        LDR.N    R1,??DataTable11_10  ;; 0x40007c00
        LDR      R1,[R1, #+0]
        ORRS     R0,R0,R1
        LDR.N    R1,??DataTable11_10  ;; 0x40007c00
        STR      R0,[R1, #+0]
        B.N      ??SYSCFG_RIResistorConfig_1
??SYSCFG_RIResistorConfig_0:
        LDR.N    R1,??DataTable11_10  ;; 0x40007c00
        LDR      R1,[R1, #+0]
        BICS     R0,R1,R0
        LDR.N    R1,??DataTable11_10  ;; 0x40007c00
        STR      R0,[R1, #+0]
??SYSCFG_RIResistorConfig_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SYSCFG_RIChannelSpeedConfig:
        CMP      R1,#+0
        BEQ.N    ??SYSCFG_RIChannelSpeedConfig_0
        LDR.N    R1,??DataTable11_10  ;; 0x40007c00
        LDR      R1,[R1, #+0]
        BICS     R0,R1,R0
        LDR.N    R1,??DataTable11_10  ;; 0x40007c00
        STR      R0,[R1, #+0]
        B.N      ??SYSCFG_RIChannelSpeedConfig_1
??SYSCFG_RIChannelSpeedConfig_0:
        LDR.N    R1,??DataTable11_10  ;; 0x40007c00
        LDR      R1,[R1, #+0]
        ORRS     R0,R0,R1
        LDR.N    R1,??DataTable11_10  ;; 0x40007c00
        STR      R0,[R1, #+0]
??SYSCFG_RIChannelSpeedConfig_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SYSCFG_RIIOSwitchConfig:
        MOVS     R2,#+0
        LSRS     R2,R0,#+31
        BIC      R0,R0,#0x80000000
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??SYSCFG_RIIOSwitchConfig_0
        CMP      R2,#+0
        BEQ.N    ??SYSCFG_RIIOSwitchConfig_1
        LDR.N    R1,??DataTable11_1  ;; 0x40007c08
        LDR      R1,[R1, #+0]
        ORRS     R0,R0,R1
        LDR.N    R1,??DataTable11_1  ;; 0x40007c08
        STR      R0,[R1, #+0]
        B.N      ??SYSCFG_RIIOSwitchConfig_2
??SYSCFG_RIIOSwitchConfig_1:
        LDR.N    R1,??DataTable11_2  ;; 0x40007c0c
        LDR      R1,[R1, #+0]
        ORRS     R0,R0,R1
        LDR.N    R1,??DataTable11_2  ;; 0x40007c0c
        STR      R0,[R1, #+0]
        B.N      ??SYSCFG_RIIOSwitchConfig_2
??SYSCFG_RIIOSwitchConfig_0:
        CMP      R2,#+0
        BEQ.N    ??SYSCFG_RIIOSwitchConfig_3
        LDR.N    R1,??DataTable11_1  ;; 0x40007c08
        LDR      R1,[R1, #+0]
        BICS     R0,R1,R0
        LDR.N    R1,??DataTable11_1  ;; 0x40007c08
        STR      R0,[R1, #+0]
        B.N      ??SYSCFG_RIIOSwitchConfig_2
??SYSCFG_RIIOSwitchConfig_3:
        LDR.N    R1,??DataTable11_2  ;; 0x40007c0c
        LDR      R1,[R1, #+0]
        BICS     R0,R1,R0
        LDR.N    R1,??DataTable11_2  ;; 0x40007c0c
        STR      R0,[R1, #+0]
??SYSCFG_RIIOSwitchConfig_2:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SYSCFG_RISwitchControlModeCmd:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??SYSCFG_RISwitchControlModeCmd_0
        LDR.N    R0,??DataTable11_1  ;; 0x40007c08
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80000000
        LDR.N    R1,??DataTable11_1  ;; 0x40007c08
        STR      R0,[R1, #+0]
        B.N      ??SYSCFG_RISwitchControlModeCmd_1
??SYSCFG_RISwitchControlModeCmd_0:
        LDR.N    R0,??DataTable11_1  ;; 0x40007c08
        LDR      R0,[R0, #+0]
        BIC      R0,R0,#0x80000000
        LDR.N    R1,??DataTable11_1  ;; 0x40007c08
        STR      R0,[R1, #+0]
??SYSCFG_RISwitchControlModeCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SYSCFG_RIHysteresisConfig:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??SYSCFG_RIHysteresisConfig_0
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??SYSCFG_RIHysteresisConfig_1
        LDR.N    R0,??DataTable11_3  ;; 0x40007c10
        LDR      R0,[R0, #+0]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        BICS     R0,R0,R1
        LDR.N    R1,??DataTable11_3  ;; 0x40007c10
        STR      R0,[R1, #+0]
        B.N      ??SYSCFG_RIHysteresisConfig_2
??SYSCFG_RIHysteresisConfig_1:
        LDR.N    R0,??DataTable11_3  ;; 0x40007c10
        LDR      R0,[R0, #+0]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable11_3  ;; 0x40007c10
        STR      R0,[R1, #+0]
        B.N      ??SYSCFG_RIHysteresisConfig_2
??SYSCFG_RIHysteresisConfig_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BNE.N    ??SYSCFG_RIHysteresisConfig_3
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??SYSCFG_RIHysteresisConfig_4
        LDR.N    R0,??DataTable11_3  ;; 0x40007c10
        LDR      R0,[R0, #+0]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MVNS     R1,R1
        ANDS     R0,R0,R1, LSL #+16
        LDR.N    R1,??DataTable11_3  ;; 0x40007c10
        STR      R0,[R1, #+0]
        B.N      ??SYSCFG_RIHysteresisConfig_2
??SYSCFG_RIHysteresisConfig_4:
        LDR.N    R0,??DataTable11_3  ;; 0x40007c10
        LDR      R0,[R0, #+0]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ORRS     R0,R0,R1, LSL #+16
        LDR.N    R1,??DataTable11_3  ;; 0x40007c10
        STR      R0,[R1, #+0]
        B.N      ??SYSCFG_RIHysteresisConfig_2
??SYSCFG_RIHysteresisConfig_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+3
        BNE.N    ??SYSCFG_RIHysteresisConfig_5
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??SYSCFG_RIHysteresisConfig_6
        LDR.N    R0,??DataTable11_4  ;; 0x40007c14
        LDR      R0,[R0, #+0]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        BICS     R0,R0,R1
        LDR.N    R1,??DataTable11_4  ;; 0x40007c14
        STR      R0,[R1, #+0]
        B.N      ??SYSCFG_RIHysteresisConfig_2
??SYSCFG_RIHysteresisConfig_6:
        LDR.N    R0,??DataTable11_4  ;; 0x40007c14
        LDR      R0,[R0, #+0]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable11_4  ;; 0x40007c14
        STR      R0,[R1, #+0]
        B.N      ??SYSCFG_RIHysteresisConfig_2
??SYSCFG_RIHysteresisConfig_5:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??SYSCFG_RIHysteresisConfig_7
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??SYSCFG_RIHysteresisConfig_8
        LDR.N    R0,??DataTable11_4  ;; 0x40007c14
        LDR      R0,[R0, #+0]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MVNS     R1,R1
        ANDS     R0,R0,R1, LSL #+16
        LDR.N    R1,??DataTable11_4  ;; 0x40007c14
        STR      R0,[R1, #+0]
        B.N      ??SYSCFG_RIHysteresisConfig_2
??SYSCFG_RIHysteresisConfig_8:
        LDR.N    R0,??DataTable11_4  ;; 0x40007c14
        LDR      R0,[R0, #+0]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ORRS     R0,R0,R1, LSL #+16
        LDR.N    R1,??DataTable11_4  ;; 0x40007c14
        STR      R0,[R1, #+0]
        B.N      ??SYSCFG_RIHysteresisConfig_2
??SYSCFG_RIHysteresisConfig_7:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+5
        BNE.N    ??SYSCFG_RIHysteresisConfig_9
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??SYSCFG_RIHysteresisConfig_10
        LDR.N    R0,??DataTable11_5  ;; 0x40007c18
        LDR      R0,[R0, #+0]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        BICS     R0,R0,R1
        LDR.N    R1,??DataTable11_5  ;; 0x40007c18
        STR      R0,[R1, #+0]
        B.N      ??SYSCFG_RIHysteresisConfig_2
??SYSCFG_RIHysteresisConfig_10:
        LDR.N    R0,??DataTable11_5  ;; 0x40007c18
        LDR      R0,[R0, #+0]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable11_5  ;; 0x40007c18
        STR      R0,[R1, #+0]
        B.N      ??SYSCFG_RIHysteresisConfig_2
??SYSCFG_RIHysteresisConfig_9:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+6
        BNE.N    ??SYSCFG_RIHysteresisConfig_11
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??SYSCFG_RIHysteresisConfig_12
        LDR.N    R0,??DataTable11_5  ;; 0x40007c18
        LDR      R0,[R0, #+0]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MVNS     R1,R1
        ANDS     R0,R0,R1, LSL #+16
        LDR.N    R1,??DataTable11_5  ;; 0x40007c18
        STR      R0,[R1, #+0]
        B.N      ??SYSCFG_RIHysteresisConfig_2
??SYSCFG_RIHysteresisConfig_12:
        LDR.N    R0,??DataTable11_5  ;; 0x40007c18
        LDR      R0,[R0, #+0]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ORRS     R0,R0,R1, LSL #+16
        LDR.N    R1,??DataTable11_5  ;; 0x40007c18
        STR      R0,[R1, #+0]
        B.N      ??SYSCFG_RIHysteresisConfig_2
??SYSCFG_RIHysteresisConfig_11:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??SYSCFG_RIHysteresisConfig_13
        LDR.N    R0,??DataTable11_6  ;; 0x40007c1c
        LDR      R0,[R0, #+0]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        BICS     R0,R0,R1
        LDR.N    R1,??DataTable11_6  ;; 0x40007c1c
        STR      R0,[R1, #+0]
        B.N      ??SYSCFG_RIHysteresisConfig_2
??SYSCFG_RIHysteresisConfig_13:
        LDR.N    R0,??DataTable11_6  ;; 0x40007c1c
        LDR      R0,[R0, #+0]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable11_6  ;; 0x40007c1c
        STR      R0,[R1, #+0]
??SYSCFG_RIHysteresisConfig_2:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11:
        DC32     0x40007c04

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_1:
        DC32     0x40007c08

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_2:
        DC32     0x40007c0c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_3:
        DC32     0x40007c10

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_4:
        DC32     0x40007c14

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_5:
        DC32     0x40007c18

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_6:
        DC32     0x40007c1c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_7:
        DC32     0x40010000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_8:
        DC32     0x40010004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_9:
        DC32     0x40010008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_10:
        DC32     0x40007c00

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
// 778 bytes in section .text
// 
// 778 bytes of CODE memory
//
//Errors: none
//Warnings: none
