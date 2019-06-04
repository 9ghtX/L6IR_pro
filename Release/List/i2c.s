///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.70.1.11437/W32 for ARM      18/Apr/2019  18:40:20
// Copyright 1999-2016 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\projects\L6IR\programm\L6_pro\i2c.c
//    Command line =  
//        E:\projects\L6IR\programm\L6_pro\i2c.c -D USE_STDPERIPH_DRIVER -D
//        STM32L1XX_MD -D FR14745600 -D nFR11059200 -D L6IR_CU -D nPT2_MODE -D
//        PT7_MODE -D nTABLE_BAL -D nTNM_MODE -D nSWIR_MODE -D nA3G4250D -D
//        nLPS331AP -D METEO -D nTEST_MODE -D nFLASH_ENABLE -lcN
//        E:\projects\L6IR\programm\L6_pro\Release\List -lb
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
//    List file    =  E:\projects\L6IR\programm\L6_pro\Release\List\i2c.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN Address
        EXTERN I2C_GenerateSTOP
        EXTERN I2C_LowLevel_Init
        EXTERN NVIC_PriorityGroupConfig
        EXTERN critcal_section_level

        PUBLIC Buffer_Rx1
        PUBLIC Buffer_Rx2
        PUBLIC Buffer_Tx1
        PUBLIC Buffer_Tx2
        PUBLIC i2c_ReadReg
        PUBLIC i2c_WriteReg
        PUBLIC i2c_close
        PUBLIC i2c_init
        PUBLIC i2c_open


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void NVIC_EnableIRQ(IRQn_Type)
NVIC_EnableIRQ:
        MOVS     R1,#+1
        ANDS     R2,R0,#0x1F
        LSLS     R1,R1,R2
        LDR.W    R2,??DataTable8  ;; 0xe000e100
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LSRS     R0,R0,#+5
        STR      R1,[R2, R0, LSL #+2]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void NVIC_SetPriority(IRQn_Type, uint32_t)
NVIC_SetPriority:
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BPL.N    ??NVIC_SetPriority_0
        LSLS     R1,R1,#+4
        LDR.W    R2,??DataTable8_1  ;; 0xe000ed18
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        ANDS     R0,R0,#0xF
        ADD      R0,R2,R0
        STRB     R1,[R0, #-4]
        B.N      ??NVIC_SetPriority_1
??NVIC_SetPriority_0:
        LSLS     R1,R1,#+4
        LDR.W    R2,??DataTable8_2  ;; 0xe000e400
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        STRB     R1,[R2, R0]
??NVIC_SetPriority_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void enter_critical_section(void)
enter_critical_section:
        LDR.W    R0,??DataTable8_3
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??enter_critical_section_0
        CPSID    I
??enter_critical_section_0:
        LDR.W    R0,??DataTable8_3
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable8_3
        STRH     R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void exit_critical_section(void)
exit_critical_section:
        LDR.W    R0,??DataTable8_3
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable8_3
        STRH     R0,[R1, #+0]
        LDR.W    R0,??DataTable8_3
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??exit_critical_section_0
        CPSIE    I
??exit_critical_section_0:
        BX       LR               ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
Buffer_Rx1:
        DS8 16

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
Buffer_Tx1:
        DS8 16

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
Buffer_Rx2:
        DS8 16

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
Buffer_Tx2:
        DS8 16

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
        DATA
is_opened:
        DS8 2

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
i2c_init:
        PUSH     {R7,LR}
        LDR.W    R0,??DataTable8_4  ;; 0x40005400
        BL       I2C_LowLevel_Init
        MOVS     R1,#+0
        MOVS     R0,#+31
        BL       NVIC_SetPriority
        MOVS     R0,#+31
        BL       NVIC_EnableIRQ
        MOVS     R1,#+1
        MOVS     R0,#+32
        BL       NVIC_SetPriority
        MOVS     R0,#+32
        BL       NVIC_EnableIRQ
        LDR.W    R0,??DataTable8_5  ;; 0x40005800
        BL       I2C_LowLevel_Init
        MOV      R0,#+768
        BL       NVIC_PriorityGroupConfig
        MOVS     R1,#+0
        MOVS     R0,#+33
        BL       NVIC_SetPriority
        MOVS     R0,#+33
        BL       NVIC_EnableIRQ
        MOVS     R1,#+1
        MOVS     R0,#+34
        BL       NVIC_SetPriority
        MOVS     R0,#+34
        BL       NVIC_EnableIRQ
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_6
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_6
        STRB     R0,[R1, #+1]
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
i2c_open:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,#+0
        SUBS     R4,R4,#+1
        BL       enter_critical_section
        LDR.N    R0,??DataTable8_6
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDRB     R0,[R0, R4]
        CMP      R0,#+0
        BNE.N    ??i2c_open_0
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_6
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        STRB     R0,[R1, R4]
        MOVS     R5,#+1
??i2c_open_0:
        BL       exit_critical_section
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
i2c_close:
        PUSH     {R4,LR}
        MOVS     R4,R0
        SUBS     R4,R4,#+1
        BL       enter_critical_section
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_6
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        STRB     R0,[R1, R4]
        BL       exit_critical_section
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
i2c_ReadReg:
        PUSH     {R4,R5,LR}
        SUB      SP,SP,#+12
        MOVS     R4,R0
        MOVS     R5,R3
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVW     R0,#+65535
        STR      R0,[SP, #+0]
        LDRH     R0,[R4, #+0]
        ORRS     R0,R0,#0x100
        STRH     R0,[R4, #+0]
??i2c_ReadReg_0:
        LDRH     R0,[R4, #+20]
        LSLS     R0,R0,#+31
        BMI.N    ??i2c_ReadReg_1
        LDR      R0,[SP, #+0]
        SUBS     R3,R0,#+1
        STR      R3,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??i2c_ReadReg_0
        MOVS     R0,#+0
        B.N      ??i2c_ReadReg_2
??i2c_ReadReg_1:
        ANDS     R1,R1,#0xFE
        LDR.N    R0,??DataTable8_7
        STRB     R1,[R0, #+0]
        LDR.N    R0,??DataTable8_7
        LDRB     R0,[R0, #+0]
        STRH     R0,[R4, #+16]
        MOVW     R0,#+65535
        STR      R0,[SP, #+0]
??i2c_ReadReg_3:
        LDRH     R0,[R4, #+20]
        LSLS     R0,R0,#+30
        BMI.N    ??i2c_ReadReg_4
        LDR      R0,[SP, #+0]
        SUBS     R3,R0,#+1
        STR      R3,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??i2c_ReadReg_3
        MOVS     R0,#+0
        B.N      ??i2c_ReadReg_2
??i2c_ReadReg_4:
        LDRH     R0,[R4, #+24]
        STR      R0,[SP, #+4]
        LDR      R0,[SP, #+24]
        CMP      R0,#+2
        BCC.N    ??i2c_ReadReg_5
        ORRS     R2,R2,#0x80
??i2c_ReadReg_5:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        STRH     R2,[R4, #+16]
??i2c_ReadReg_6:
        LDRH     R2,[R4, #+20]
        LSLS     R2,R2,#+29
        BPL.N    ??i2c_ReadReg_6
        CMP      R0,#+1
        BNE.N    ??i2c_ReadReg_7
        MOVW     R0,#+65535
        STR      R0,[SP, #+0]
        LDRH     R0,[R4, #+0]
        ORRS     R0,R0,#0x100
        STRH     R0,[R4, #+0]
??i2c_ReadReg_8:
        LDRH     R0,[R4, #+20]
        LSLS     R0,R0,#+31
        BMI.N    ??i2c_ReadReg_9
        LDR      R0,[SP, #+0]
        SUBS     R2,R0,#+1
        STR      R2,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??i2c_ReadReg_8
        MOVS     R0,#+0
        B.N      ??i2c_ReadReg_2
??i2c_ReadReg_9:
        ORRS     R1,R1,#0x1
        LDR.N    R0,??DataTable8_7
        STRB     R1,[R0, #+0]
        LDR.N    R0,??DataTable8_7
        LDRB     R0,[R0, #+0]
        STRH     R0,[R4, #+16]
        MOVW     R0,#+65535
        STR      R0,[SP, #+0]
??i2c_ReadReg_10:
        LDRH     R0,[R4, #+20]
        LSLS     R0,R0,#+30
        BMI.N    ??i2c_ReadReg_11
        LDR      R0,[SP, #+0]
        SUBS     R1,R0,#+1
        STR      R1,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??i2c_ReadReg_10
        MOVS     R0,#+0
        B.N      ??i2c_ReadReg_2
??i2c_ReadReg_11:
        LDRH     R0,[R4, #+0]
        MOVW     R1,#+64511
        ANDS     R0,R1,R0
        STRH     R0,[R4, #+0]
        CPSID    I
        LDRH     R0,[R4, #+24]
        STR      R0,[SP, #+4]
        LDRH     R0,[R4, #+0]
        ORRS     R0,R0,#0x200
        STRH     R0,[R4, #+0]
        CPSIE    I
??i2c_ReadReg_12:
        LDRH     R0,[R4, #+20]
        LSLS     R0,R0,#+25
        BPL.N    ??i2c_ReadReg_12
        LDRH     R0,[R4, #+16]
        STRB     R0,[R5, #+0]
??i2c_ReadReg_13:
        LDRH     R0,[R4, #+0]
        LSLS     R0,R0,#+22
        BMI.N    ??i2c_ReadReg_13
        LDRH     R0,[R4, #+0]
        ORRS     R0,R0,#0x400
        STRH     R0,[R4, #+0]
        B.N      ??i2c_ReadReg_14
??i2c_ReadReg_7:
        CMP      R0,#+2
        BNE.N    ??i2c_ReadReg_15
        LDRH     R0,[R4, #+0]
        ORRS     R0,R0,#0x800
        STRH     R0,[R4, #+0]
        MOVW     R0,#+65535
        STR      R0,[SP, #+0]
        LDRH     R0,[R4, #+0]
        ORRS     R0,R0,#0x100
        STRH     R0,[R4, #+0]
??i2c_ReadReg_16:
        LDRH     R0,[R4, #+20]
        LSLS     R0,R0,#+31
        BMI.N    ??i2c_ReadReg_17
        LDR      R0,[SP, #+0]
        SUBS     R2,R0,#+1
        STR      R2,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??i2c_ReadReg_16
        MOVS     R0,#+0
        B.N      ??i2c_ReadReg_2
??i2c_ReadReg_17:
        MOVW     R0,#+65535
        STR      R0,[SP, #+0]
        ORRS     R1,R1,#0x1
        LDR.N    R0,??DataTable8_7
        STRB     R1,[R0, #+0]
        LDR.N    R0,??DataTable8_7
        LDRB     R0,[R0, #+0]
        STRH     R0,[R4, #+16]
??i2c_ReadReg_18:
        LDRH     R0,[R4, #+20]
        LSLS     R0,R0,#+30
        BMI.N    ??i2c_ReadReg_19
        LDR      R0,[SP, #+0]
        SUBS     R1,R0,#+1
        STR      R1,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??i2c_ReadReg_18
        MOVS     R0,#+0
        B.N      ??i2c_ReadReg_2
??i2c_ReadReg_19:
        CPSID    I
        LDRH     R0,[R4, #+24]
        STR      R0,[SP, #+4]
        LDRH     R0,[R4, #+0]
        MOVW     R1,#+64511
        ANDS     R0,R1,R0
        STRH     R0,[R4, #+0]
        CPSIE    I
??i2c_ReadReg_20:
        LDRH     R0,[R4, #+20]
        LSLS     R0,R0,#+29
        BPL.N    ??i2c_ReadReg_20
        CPSID    I
        MOVS     R1,#+1
        MOVS     R0,R4
        BL       I2C_GenerateSTOP
        LDRH     R0,[R4, #+16]
        STRB     R0,[R5, #+0]
        CPSIE    I
        ADDS     R5,R5,#+1
        LDRH     R0,[R4, #+16]
        STRB     R0,[R5, #+0]
??i2c_ReadReg_21:
        LDRH     R0,[R4, #+0]
        LSLS     R0,R0,#+22
        BMI.N    ??i2c_ReadReg_21
        LDRH     R0,[R4, #+0]
        ORRS     R0,R0,#0x400
        STRH     R0,[R4, #+0]
        LDRH     R0,[R4, #+0]
        MOVW     R1,#+63487
        ANDS     R0,R1,R0
        STRH     R0,[R4, #+0]
        B.N      ??i2c_ReadReg_14
??i2c_ReadReg_15:
        MOVW     R2,#+65535
        STR      R2,[SP, #+0]
        LDRH     R2,[R4, #+0]
        ORRS     R2,R2,#0x100
        STRH     R2,[R4, #+0]
??i2c_ReadReg_22:
        LDRH     R2,[R4, #+20]
        LSLS     R2,R2,#+31
        BMI.N    ??i2c_ReadReg_23
        LDR      R2,[SP, #+0]
        SUBS     R3,R2,#+1
        STR      R3,[SP, #+0]
        CMP      R2,#+0
        BNE.N    ??i2c_ReadReg_22
        MOVS     R0,#+0
        B.N      ??i2c_ReadReg_2
??i2c_ReadReg_23:
        MOVW     R2,#+65535
        STR      R2,[SP, #+0]
        ORRS     R1,R1,#0x1
        LDR.N    R2,??DataTable8_7
        STRB     R1,[R2, #+0]
        LDR.N    R1,??DataTable8_7
        LDRB     R1,[R1, #+0]
        STRH     R1,[R4, #+16]
??i2c_ReadReg_24:
        LDRH     R1,[R4, #+20]
        LSLS     R1,R1,#+30
        BMI.N    ??i2c_ReadReg_25
        LDR      R1,[SP, #+0]
        SUBS     R2,R1,#+1
        STR      R2,[SP, #+0]
        CMP      R1,#+0
        BNE.N    ??i2c_ReadReg_24
        MOVS     R0,#+0
        B.N      ??i2c_ReadReg_2
??i2c_ReadReg_25:
        LDRH     R1,[R4, #+24]
        STR      R1,[SP, #+4]
        B.N      ??i2c_ReadReg_26
??i2c_ReadReg_27:
        CMP      R0,#+3
        BEQ.N    ??i2c_ReadReg_28
??i2c_ReadReg_29:
        LDRH     R1,[R4, #+20]
        LSLS     R1,R1,#+29
        BPL.N    ??i2c_ReadReg_29
        LDRH     R1,[R4, #+16]
        STRB     R1,[R5, #+0]
        ADDS     R5,R5,#+1
        SUBS     R0,R0,#+1
??i2c_ReadReg_28:
        CMP      R0,#+3
        BNE.N    ??i2c_ReadReg_26
??i2c_ReadReg_30:
        LDRH     R0,[R4, #+20]
        LSLS     R0,R0,#+29
        BPL.N    ??i2c_ReadReg_30
        LDRH     R0,[R4, #+0]
        MOVW     R1,#+64511
        ANDS     R0,R1,R0
        STRH     R0,[R4, #+0]
        CPSID    I
        LDRH     R0,[R4, #+16]
        STRB     R0,[R5, #+0]
        ADDS     R5,R5,#+1
        LDRH     R0,[R4, #+0]
        ORRS     R0,R0,#0x200
        STRH     R0,[R4, #+0]
        LDRH     R0,[R4, #+16]
        STRB     R0,[R5, #+0]
        CPSIE    I
        ADDS     R5,R5,#+1
??i2c_ReadReg_31:
        LDRH     R0,[R4, #+20]
        LSLS     R0,R0,#+25
        BPL.N    ??i2c_ReadReg_31
        LDRH     R0,[R4, #+16]
        STRB     R0,[R5, #+0]
        MOVS     R0,#+0
??i2c_ReadReg_26:
        CMP      R0,#+0
        BNE.N    ??i2c_ReadReg_27
??i2c_ReadReg_32:
        LDRH     R0,[R4, #+0]
        LSLS     R0,R0,#+22
        BMI.N    ??i2c_ReadReg_32
        LDRH     R0,[R4, #+0]
        ORRS     R0,R0,#0x400
        STRH     R0,[R4, #+0]
??i2c_ReadReg_14:
        MOVS     R0,#+1
??i2c_ReadReg_2:
        POP      {R1-R5,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
i2c_WriteReg:
        PUSH     {R2-R5}
        MOVS     R4,#+0
        STR      R4,[SP, #+4]
        MOVW     R4,#+65535
        STR      R4,[SP, #+0]
        LDRH     R4,[R0, #+4]
        ORRS     R4,R4,#0x100
        STRH     R4,[R0, #+4]
        LDRH     R4,[R0, #+0]
        ORRS     R4,R4,#0x100
        STRH     R4,[R0, #+0]
??i2c_WriteReg_0:
        LDRH     R4,[R0, #+20]
        LSLS     R4,R4,#+31
        BMI.N    ??i2c_WriteReg_1
        LDR      R4,[SP, #+0]
        SUBS     R5,R4,#+1
        STR      R5,[SP, #+0]
        CMP      R4,#+0
        BNE.N    ??i2c_WriteReg_0
        MOVS     R0,#+0
        B.N      ??i2c_WriteReg_2
??i2c_WriteReg_1:
        ANDS     R1,R1,#0xFE
        LDR.N    R4,??DataTable8_7
        STRB     R1,[R4, #+0]
        LDR.N    R1,??DataTable8_7
        LDRB     R1,[R1, #+0]
        STRH     R1,[R0, #+16]
        MOVW     R1,#+65535
        STR      R1,[SP, #+0]
??i2c_WriteReg_3:
        LDRH     R1,[R0, #+20]
        LSLS     R1,R1,#+30
        BMI.N    ??i2c_WriteReg_4
        LDR      R1,[SP, #+0]
        SUBS     R4,R1,#+1
        STR      R4,[SP, #+0]
        CMP      R1,#+0
        BNE.N    ??i2c_WriteReg_3
        MOVS     R0,#+0
        B.N      ??i2c_WriteReg_2
??i2c_WriteReg_4:
        LDRH     R1,[R0, #+24]
        STR      R1,[SP, #+4]
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        STRH     R2,[R0, #+16]
        LDR      R1,[SP, #+16]
        B.N      ??i2c_WriteReg_5
??i2c_WriteReg_6:
        LDRH     R2,[R0, #+20]
        LSLS     R2,R2,#+29
        BPL.N    ??i2c_WriteReg_6
        LDRB     R2,[R3, #+0]
        STRH     R2,[R0, #+16]
        ADDS     R3,R3,#+1
??i2c_WriteReg_5:
        MOVS     R2,R1
        SUBS     R1,R2,#+1
        CMP      R2,#+0
        BNE.N    ??i2c_WriteReg_6
??i2c_WriteReg_7:
        LDRH     R1,[R0, #+20]
        LSLS     R1,R1,#+29
        BPL.N    ??i2c_WriteReg_7
        LDRH     R1,[R0, #+0]
        ORRS     R1,R1,#0x200
        STRH     R1,[R0, #+0]
??i2c_WriteReg_8:
        LDRH     R1,[R0, #+0]
        LSLS     R1,R1,#+22
        BMI.N    ??i2c_WriteReg_8
        MOVS     R0,#+1
??i2c_WriteReg_2:
        POP      {R1,R2,R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8:
        DC32     0xe000e100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_1:
        DC32     0xe000ed18

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_2:
        DC32     0xe000e400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_3:
        DC32     critcal_section_level

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_4:
        DC32     0x40005400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_5:
        DC32     0x40005800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_6:
        DC32     is_opened

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_7:
        DC32     Address

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
//    66 bytes in section .bss
// 1 034 bytes in section .text
// 
// 1 034 bytes of CODE memory
//    66 bytes of DATA memory
//
//Errors: none
//Warnings: none
