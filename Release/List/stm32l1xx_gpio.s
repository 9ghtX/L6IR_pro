///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.70.1.11437/W32 for ARM      18/Apr/2019  18:40:43
// Copyright 1999-2016 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        E:\projects\L6IR\programm\L6_pro\STM32L1xx_StdPeriph_Driver\src\stm32l1xx_gpio.c
//    Command line =  
//        E:\projects\L6IR\programm\L6_pro\STM32L1xx_StdPeriph_Driver\src\stm32l1xx_gpio.c
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
//        E:\projects\L6IR\programm\L6_pro\Release\List\stm32l1xx_gpio.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN RCC_AHBPeriphResetCmd

        PUBLIC GPIO_DeInit
        PUBLIC GPIO_Init
        PUBLIC GPIO_PinAFConfig
        PUBLIC GPIO_PinLockConfig
        PUBLIC GPIO_ReadInputData
        PUBLIC GPIO_ReadInputDataBit
        PUBLIC GPIO_ReadOutputData
        PUBLIC GPIO_ReadOutputDataBit
        PUBLIC GPIO_ResetBits
        PUBLIC GPIO_SetBits
        PUBLIC GPIO_StructInit
        PUBLIC GPIO_ToggleBits
        PUBLIC GPIO_Write
        PUBLIC GPIO_WriteBit


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_DeInit:
        PUSH     {R7,LR}
        LDR.N    R1,??DataTable0  ;; 0x40020000
        CMP      R0,R1
        BNE.N    ??GPIO_DeInit_0
        MOVS     R1,#+1
        MOVS     R0,#+1
        BL       RCC_AHBPeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+1
        BL       RCC_AHBPeriphResetCmd
        B.N      ??GPIO_DeInit_1
??GPIO_DeInit_0:
        LDR.N    R1,??DataTable0_1  ;; 0x40020400
        CMP      R0,R1
        BNE.N    ??GPIO_DeInit_2
        MOVS     R1,#+1
        MOVS     R0,#+2
        BL       RCC_AHBPeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+2
        BL       RCC_AHBPeriphResetCmd
        B.N      ??GPIO_DeInit_1
??GPIO_DeInit_2:
        LDR.N    R1,??DataTable0_2  ;; 0x40020800
        CMP      R0,R1
        BNE.N    ??GPIO_DeInit_3
        MOVS     R1,#+1
        MOVS     R0,#+4
        BL       RCC_AHBPeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+4
        BL       RCC_AHBPeriphResetCmd
        B.N      ??GPIO_DeInit_1
??GPIO_DeInit_3:
        LDR.N    R1,??DataTable0_3  ;; 0x40020c00
        CMP      R0,R1
        BNE.N    ??GPIO_DeInit_4
        MOVS     R1,#+1
        MOVS     R0,#+8
        BL       RCC_AHBPeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+8
        BL       RCC_AHBPeriphResetCmd
        B.N      ??GPIO_DeInit_1
??GPIO_DeInit_4:
        LDR.N    R1,??DataTable0_4  ;; 0x40021000
        CMP      R0,R1
        BNE.N    ??GPIO_DeInit_5
        MOVS     R1,#+1
        MOVS     R0,#+16
        BL       RCC_AHBPeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+16
        BL       RCC_AHBPeriphResetCmd
        B.N      ??GPIO_DeInit_1
??GPIO_DeInit_5:
        LDR.N    R1,??DataTable0_5  ;; 0x40021800
        CMP      R0,R1
        BNE.N    ??GPIO_DeInit_6
        MOVS     R1,#+1
        MOVS     R0,#+64
        BL       RCC_AHBPeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+64
        BL       RCC_AHBPeriphResetCmd
        B.N      ??GPIO_DeInit_1
??GPIO_DeInit_6:
        LDR.N    R1,??DataTable0_6  ;; 0x40021c00
        CMP      R0,R1
        BNE.N    ??GPIO_DeInit_7
        MOVS     R1,#+1
        MOVS     R0,#+128
        BL       RCC_AHBPeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+128
        BL       RCC_AHBPeriphResetCmd
        B.N      ??GPIO_DeInit_1
??GPIO_DeInit_7:
        LDR.N    R1,??DataTable0_7  ;; 0x40021400
        CMP      R0,R1
        BNE.N    ??GPIO_DeInit_1
        MOVS     R1,#+1
        MOVS     R0,#+32
        BL       RCC_AHBPeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+32
        BL       RCC_AHBPeriphResetCmd
??GPIO_DeInit_1:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     0x40020000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_1:
        DC32     0x40020400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_2:
        DC32     0x40020800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_3:
        DC32     0x40020c00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_4:
        DC32     0x40021000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_5:
        DC32     0x40021800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_6:
        DC32     0x40021c00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_7:
        DC32     0x40021400

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_Init:
        PUSH     {R4,R5}
        MOVS     R2,#+0
        MOVS     R3,#+0
        MOVS     R4,#+0
        MOVS     R2,#+0
        B.N      ??GPIO_Init_0
??GPIO_Init_1:
        MOVS     R3,#+1
        LSLS     R3,R3,R2
        LDR      R4,[R1, #+0]
        ANDS     R4,R3,R4
        CMP      R4,R3
        BNE.N    ??GPIO_Init_2
        LDR      R3,[R0, #+0]
        MOVS     R4,#+3
        MOVS     R5,R2
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LSLS     R5,R5,#+1
        LSLS     R4,R4,R5
        BICS     R3,R3,R4
        STR      R3,[R0, #+0]
        LDR      R3,[R0, #+0]
        LDRB     R4,[R1, #+4]
        MOVS     R5,R2
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LSLS     R5,R5,#+1
        LSLS     R4,R4,R5
        ORRS     R3,R4,R3
        STR      R3,[R0, #+0]
        LDRB     R3,[R1, #+4]
        CMP      R3,#+1
        BEQ.N    ??GPIO_Init_3
        LDRB     R3,[R1, #+4]
        CMP      R3,#+2
        BNE.N    ??GPIO_Init_4
??GPIO_Init_3:
        LDR      R3,[R0, #+8]
        MOVS     R4,#+3
        MOVS     R5,R2
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LSLS     R5,R5,#+1
        LSLS     R4,R4,R5
        BICS     R3,R3,R4
        STR      R3,[R0, #+8]
        LDR      R3,[R0, #+8]
        LDRB     R4,[R1, #+5]
        MOVS     R5,R2
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LSLS     R5,R5,#+1
        LSLS     R4,R4,R5
        ORRS     R3,R4,R3
        STR      R3,[R0, #+8]
        LDRH     R3,[R0, #+4]
        MOVS     R4,#+1
        LSLS     R4,R4,R2
        BICS     R3,R3,R4
        STRH     R3,[R0, #+4]
        LDRH     R3,[R0, #+4]
        LDRB     R4,[R1, #+6]
        LSLS     R4,R4,R2
        ORRS     R3,R4,R3
        STRH     R3,[R0, #+4]
??GPIO_Init_4:
        LDR      R3,[R0, #+12]
        MOVS     R4,#+3
        MOVS     R5,R2
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LSLS     R5,R5,#+1
        LSLS     R4,R4,R5
        BICS     R3,R3,R4
        STR      R3,[R0, #+12]
        LDR      R3,[R0, #+12]
        LDRB     R4,[R1, #+7]
        MOVS     R5,R2
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LSLS     R5,R5,#+1
        LSLS     R4,R4,R5
        ORRS     R3,R4,R3
        STR      R3,[R0, #+12]
??GPIO_Init_2:
        ADDS     R2,R2,#+1
??GPIO_Init_0:
        CMP      R2,#+16
        BCC.N    ??GPIO_Init_1
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_StructInit:
        MOVW     R1,#+65535
        STR      R1,[R0, #+0]
        MOVS     R1,#+0
        STRB     R1,[R0, #+4]
        MOVS     R1,#+0
        STRB     R1,[R0, #+5]
        MOVS     R1,#+0
        STRB     R1,[R0, #+6]
        MOVS     R1,#+0
        STRB     R1,[R0, #+7]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_PinLockConfig:
        SUB      SP,SP,#+4
        MOVS     R2,#+65536
        STR      R2,[SP, #+0]
        LDR      R2,[SP, #+0]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ORRS     R2,R1,R2
        STR      R2,[SP, #+0]
        LDR      R2,[SP, #+0]
        STR      R2,[R0, #+28]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        STR      R1,[R0, #+28]
        LDR      R1,[SP, #+0]
        STR      R1,[R0, #+28]
        LDR      R1,[R0, #+28]
        STR      R1,[SP, #+0]
        LDR      R0,[R0, #+28]
        STR      R0,[SP, #+0]
        ADD      SP,SP,#+4
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_ReadInputDataBit:
        MOVS     R2,#+0
        LDRH     R0,[R0, #+16]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        TST      R0,R1
        BEQ.N    ??GPIO_ReadInputDataBit_0
        MOVS     R2,#+1
        B.N      ??GPIO_ReadInputDataBit_1
??GPIO_ReadInputDataBit_0:
        MOVS     R2,#+0
??GPIO_ReadInputDataBit_1:
        MOVS     R0,R2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_ReadInputData:
        LDRH     R0,[R0, #+16]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_ReadOutputDataBit:
        MOVS     R2,#+0
        LDRH     R0,[R0, #+20]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        TST      R0,R1
        BEQ.N    ??GPIO_ReadOutputDataBit_0
        MOVS     R2,#+1
        B.N      ??GPIO_ReadOutputDataBit_1
??GPIO_ReadOutputDataBit_0:
        MOVS     R2,#+0
??GPIO_ReadOutputDataBit_1:
        MOVS     R0,R2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_ReadOutputData:
        LDRH     R0,[R0, #+20]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_SetBits:
        STRH     R1,[R0, #+24]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_ResetBits:
        STRH     R1,[R0, #+26]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_WriteBit:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??GPIO_WriteBit_0
        STRH     R1,[R0, #+24]
        B.N      ??GPIO_WriteBit_1
??GPIO_WriteBit_0:
        STRH     R1,[R0, #+26]
??GPIO_WriteBit_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_Write:
        STRH     R1,[R0, #+20]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_ToggleBits:
        LDRH     R2,[R0, #+20]
        EORS     R1,R1,R2
        STRH     R1,[R0, #+20]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_PinAFConfig:
        PUSH     {R4-R6}
        MOVS     R3,#+0
        MOVS     R3,#+0
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ANDS     R3,R1,#0x7
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        LSLS     R3,R3,#+2
        LSLS     R3,R2,R3
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ASRS     R2,R1,#+3
        ADD      R2,R0,R2, LSL #+2
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ASRS     R4,R1,#+3
        ADD      R4,R0,R4, LSL #+2
        LDR      R4,[R4, #+32]
        MOVS     R5,#+15
        ANDS     R6,R1,#0x7
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LSLS     R6,R6,#+2
        LSLS     R5,R5,R6
        BICS     R4,R4,R5
        STR      R4,[R2, #+32]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ASRS     R2,R1,#+3
        ADD      R2,R0,R2, LSL #+2
        LDR      R2,[R2, #+32]
        ORRS     R3,R3,R2
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ASRS     R1,R1,#+3
        ADD      R0,R0,R1, LSL #+2
        STR      R3,[R0, #+32]
        POP      {R4-R6}
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
// 618 bytes in section .text
// 
// 618 bytes of CODE memory
//
//Errors: none
//Warnings: none
