///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.70.1.11437/W32 for ARM      18/Apr/2019  18:40:22
// Copyright 1999-2016 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\projects\L6IR\programm\L6_pro\I2CRoutines.c
//    Command line =  
//        E:\projects\L6IR\programm\L6_pro\I2CRoutines.c -D
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
//        E:\projects\L6IR\programm\L6_pro\Release\List\I2CRoutines.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN DMA_ClearFlag
        EXTERN DMA_Cmd
        EXTERN DMA_GetFlagStatus
        EXTERN DMA_Init
        EXTERN I2C_GenerateSTOP

        PUBLIC Address
        PUBLIC I2CDMA_InitStructure
        PUBLIC I2CDirection
        PUBLIC I2C_DMAConfig
        PUBLIC I2C_Master_BufferRead
        PUBLIC I2C_Master_BufferWrite
        PUBLIC I2C_Slave_BufferReadWrite
        PUBLIC NumbOfBytes1
        PUBLIC NumbOfBytes2


        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
I2CDMA_InitStructure:
        DS8 44

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
I2CDirection:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
NumbOfBytes1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
NumbOfBytes2:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        DATA
Address:
        DS8 1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_Master_BufferRead:
        PUSH     {R2-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        LDRH     R0,[R4, #+4]
        ORRS     R0,R0,#0x100
        STRH     R0,[R4, #+4]
        LDR      R6,[SP, #+24]
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+2
        BNE.N    ??I2C_Master_BufferRead_0
        MOVS     R3,#+1
        MOVS     R1,R5
        MOVS     R0,R4
        BL       I2C_DMAConfig
        LDRH     R0,[R4, #+4]
        ORRS     R0,R0,#0x1000
        STRH     R0,[R4, #+4]
        LDRH     R0,[R4, #+4]
        ORRS     R0,R0,#0x800
        STRH     R0,[R4, #+4]
        MOVW     R0,#+65535
        STR      R0,[SP, #+0]
        LDRH     R0,[R4, #+0]
        ORRS     R0,R0,#0x100
        STRH     R0,[R4, #+0]
??I2C_Master_BufferRead_1:
        LDRH     R0,[R4, #+20]
        LSLS     R0,R0,#+31
        BMI.N    ??I2C_Master_BufferRead_2
        LDR      R0,[SP, #+0]
        SUBS     R1,R0,#+1
        STR      R1,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??I2C_Master_BufferRead_1
        MOVS     R0,#+0
        B.N      ??I2C_Master_BufferRead_3
??I2C_Master_BufferRead_2:
        MOVW     R0,#+65535
        STR      R0,[SP, #+0]
        ORRS     R6,R6,#0x1
        LDR.W    R0,??DataTable2
        STRB     R6,[R0, #+0]
        LDR.W    R0,??DataTable2
        LDRB     R0,[R0, #+0]
        STRH     R0,[R4, #+16]
??I2C_Master_BufferRead_4:
        LDRH     R0,[R4, #+20]
        LSLS     R0,R0,#+30
        BMI.N    ??I2C_Master_BufferRead_5
        LDR      R0,[SP, #+0]
        SUBS     R1,R0,#+1
        STR      R1,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??I2C_Master_BufferRead_4
        MOVS     R0,#+0
        B.N      ??I2C_Master_BufferRead_3
??I2C_Master_BufferRead_5:
        LDRH     R0,[R4, #+24]
        STR      R0,[SP, #+4]
        LDR.W    R0,??DataTable2_1  ;; 0x40005400
        CMP      R4,R0
        BNE.N    ??I2C_Master_BufferRead_6
??I2C_Master_BufferRead_7:
        MOVS     R0,#+33554432
        BL       DMA_GetFlagStatus
        CMP      R0,#+0
        BEQ.N    ??I2C_Master_BufferRead_7
        MOVS     R1,#+0
        LDR.W    R0,??DataTable2_2  ;; 0x40026080
        BL       DMA_Cmd
        MOVS     R0,#+33554432
        BL       DMA_ClearFlag
        B.N      ??I2C_Master_BufferRead_8
??I2C_Master_BufferRead_6:
        MOVS     R0,#+131072
        BL       DMA_GetFlagStatus
        CMP      R0,#+0
        BEQ.N    ??I2C_Master_BufferRead_6
        MOVS     R1,#+0
        LDR.W    R0,??DataTable2_3  ;; 0x40026058
        BL       DMA_Cmd
        MOVS     R0,#+131072
        BL       DMA_ClearFlag
??I2C_Master_BufferRead_8:
        LDRH     R0,[R4, #+0]
        ORRS     R0,R0,#0x200
        STRH     R0,[R4, #+0]
??I2C_Master_BufferRead_9:
        LDRH     R0,[R4, #+0]
        LSLS     R0,R0,#+22
        BMI.N    ??I2C_Master_BufferRead_9
        B.N      ??I2C_Master_BufferRead_10
??I2C_Master_BufferRead_0:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+0
        BNE.W    ??I2C_Master_BufferRead_11
        CMP      R2,#+1
        BNE.N    ??I2C_Master_BufferRead_12
        MOVW     R0,#+65535
        STR      R0,[SP, #+0]
        LDRH     R0,[R4, #+0]
        ORRS     R0,R0,#0x100
        STRH     R0,[R4, #+0]
??I2C_Master_BufferRead_13:
        LDRH     R0,[R4, #+20]
        LSLS     R0,R0,#+31
        BMI.N    ??I2C_Master_BufferRead_14
        LDR      R0,[SP, #+0]
        SUBS     R1,R0,#+1
        STR      R1,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??I2C_Master_BufferRead_13
        MOVS     R0,#+0
        B.N      ??I2C_Master_BufferRead_3
??I2C_Master_BufferRead_14:
        ORRS     R6,R6,#0x1
        LDR.W    R0,??DataTable2
        STRB     R6,[R0, #+0]
        LDR.W    R0,??DataTable2
        LDRB     R0,[R0, #+0]
        STRH     R0,[R4, #+16]
        MOVW     R0,#+65535
        STR      R0,[SP, #+0]
??I2C_Master_BufferRead_15:
        LDRH     R0,[R4, #+20]
        LSLS     R0,R0,#+30
        BMI.N    ??I2C_Master_BufferRead_16
        LDR      R0,[SP, #+0]
        SUBS     R1,R0,#+1
        STR      R1,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??I2C_Master_BufferRead_15
        MOVS     R0,#+0
        B.N      ??I2C_Master_BufferRead_3
??I2C_Master_BufferRead_16:
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
??I2C_Master_BufferRead_17:
        LDRH     R0,[R4, #+20]
        LSLS     R0,R0,#+25
        BPL.N    ??I2C_Master_BufferRead_17
        LDRH     R0,[R4, #+16]
        STRB     R0,[R5, #+0]
??I2C_Master_BufferRead_18:
        LDRH     R0,[R4, #+0]
        LSLS     R0,R0,#+22
        BMI.N    ??I2C_Master_BufferRead_18
        LDRH     R0,[R4, #+0]
        ORRS     R0,R0,#0x400
        STRH     R0,[R4, #+0]
        B.N      ??I2C_Master_BufferRead_10
??I2C_Master_BufferRead_12:
        CMP      R2,#+2
        BNE.N    ??I2C_Master_BufferRead_19
        LDRH     R0,[R4, #+0]
        ORRS     R0,R0,#0x800
        STRH     R0,[R4, #+0]
        MOVW     R0,#+65535
        STR      R0,[SP, #+0]
        LDRH     R0,[R4, #+0]
        ORRS     R0,R0,#0x100
        STRH     R0,[R4, #+0]
??I2C_Master_BufferRead_20:
        LDRH     R0,[R4, #+20]
        LSLS     R0,R0,#+31
        BMI.N    ??I2C_Master_BufferRead_21
        LDR      R0,[SP, #+0]
        SUBS     R1,R0,#+1
        STR      R1,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??I2C_Master_BufferRead_20
        MOVS     R0,#+0
        B.N      ??I2C_Master_BufferRead_3
??I2C_Master_BufferRead_21:
        MOVW     R0,#+65535
        STR      R0,[SP, #+0]
        ORRS     R6,R6,#0x1
        LDR.W    R0,??DataTable2
        STRB     R6,[R0, #+0]
        LDR.W    R0,??DataTable2
        LDRB     R0,[R0, #+0]
        STRH     R0,[R4, #+16]
??I2C_Master_BufferRead_22:
        LDRH     R0,[R4, #+20]
        LSLS     R0,R0,#+30
        BMI.N    ??I2C_Master_BufferRead_23
        LDR      R0,[SP, #+0]
        SUBS     R1,R0,#+1
        STR      R1,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??I2C_Master_BufferRead_22
        MOVS     R0,#+0
        B.N      ??I2C_Master_BufferRead_3
??I2C_Master_BufferRead_23:
        CPSID    I
        LDRH     R0,[R4, #+24]
        STR      R0,[SP, #+4]
        LDRH     R0,[R4, #+0]
        MOVW     R1,#+64511
        ANDS     R0,R1,R0
        STRH     R0,[R4, #+0]
        CPSIE    I
??I2C_Master_BufferRead_24:
        LDRH     R0,[R4, #+20]
        LSLS     R0,R0,#+29
        BPL.N    ??I2C_Master_BufferRead_24
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
??I2C_Master_BufferRead_25:
        LDRH     R0,[R4, #+0]
        LSLS     R0,R0,#+22
        BMI.N    ??I2C_Master_BufferRead_25
        LDRH     R0,[R4, #+0]
        ORRS     R0,R0,#0x400
        STRH     R0,[R4, #+0]
        LDRH     R0,[R4, #+0]
        MOVW     R1,#+63487
        ANDS     R0,R1,R0
        STRH     R0,[R4, #+0]
        B.N      ??I2C_Master_BufferRead_10
??I2C_Master_BufferRead_19:
        MOVW     R0,#+65535
        STR      R0,[SP, #+0]
        LDRH     R0,[R4, #+0]
        ORRS     R0,R0,#0x100
        STRH     R0,[R4, #+0]
??I2C_Master_BufferRead_26:
        LDRH     R0,[R4, #+20]
        LSLS     R0,R0,#+31
        BMI.N    ??I2C_Master_BufferRead_27
        LDR      R0,[SP, #+0]
        SUBS     R1,R0,#+1
        STR      R1,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??I2C_Master_BufferRead_26
        MOVS     R0,#+0
        B.N      ??I2C_Master_BufferRead_3
??I2C_Master_BufferRead_27:
        MOVW     R0,#+65535
        STR      R0,[SP, #+0]
        ORRS     R6,R6,#0x1
        LDR.W    R0,??DataTable2
        STRB     R6,[R0, #+0]
        LDR.W    R0,??DataTable2
        LDRB     R0,[R0, #+0]
        STRH     R0,[R4, #+16]
??I2C_Master_BufferRead_28:
        LDRH     R0,[R4, #+20]
        LSLS     R0,R0,#+30
        BMI.N    ??I2C_Master_BufferRead_29
        LDR      R0,[SP, #+0]
        SUBS     R1,R0,#+1
        STR      R1,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??I2C_Master_BufferRead_28
        MOVS     R0,#+0
        B.N      ??I2C_Master_BufferRead_3
??I2C_Master_BufferRead_29:
        LDRH     R0,[R4, #+24]
        STR      R0,[SP, #+4]
        B.N      ??I2C_Master_BufferRead_30
??I2C_Master_BufferRead_31:
        CMP      R2,#+3
        BEQ.N    ??I2C_Master_BufferRead_32
??I2C_Master_BufferRead_33:
        LDRH     R0,[R4, #+20]
        LSLS     R0,R0,#+29
        BPL.N    ??I2C_Master_BufferRead_33
        LDRH     R0,[R4, #+16]
        STRB     R0,[R5, #+0]
        ADDS     R5,R5,#+1
        SUBS     R2,R2,#+1
??I2C_Master_BufferRead_32:
        CMP      R2,#+3
        BNE.N    ??I2C_Master_BufferRead_30
??I2C_Master_BufferRead_34:
        LDRH     R0,[R4, #+20]
        LSLS     R0,R0,#+29
        BPL.N    ??I2C_Master_BufferRead_34
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
??I2C_Master_BufferRead_35:
        LDRH     R0,[R4, #+20]
        LSLS     R0,R0,#+25
        BPL.N    ??I2C_Master_BufferRead_35
        LDRH     R0,[R4, #+16]
        STRB     R0,[R5, #+0]
        MOVS     R2,#+0
??I2C_Master_BufferRead_30:
        CMP      R2,#+0
        BNE.N    ??I2C_Master_BufferRead_31
??I2C_Master_BufferRead_36:
        LDRH     R0,[R4, #+0]
        LSLS     R0,R0,#+22
        BMI.N    ??I2C_Master_BufferRead_36
        LDRH     R0,[R4, #+0]
        ORRS     R0,R0,#0x400
        STRH     R0,[R4, #+0]
        B.N      ??I2C_Master_BufferRead_10
??I2C_Master_BufferRead_11:
        LDRH     R0,[R4, #+4]
        ORRS     R0,R0,#0x200
        STRH     R0,[R4, #+4]
        LDRH     R0,[R4, #+4]
        ORRS     R0,R0,#0x400
        STRH     R0,[R4, #+4]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_4
        STR      R0,[R1, #+0]
        ORRS     R6,R6,#0x1
        LDR.N    R0,??DataTable2
        STRB     R6,[R0, #+0]
        LDR.N    R0,??DataTable2_1  ;; 0x40005400
        CMP      R4,R0
        BNE.N    ??I2C_Master_BufferRead_37
        LDR.N    R0,??DataTable2_5
        STR      R2,[R0, #+0]
        B.N      ??I2C_Master_BufferRead_38
??I2C_Master_BufferRead_37:
        LDR.N    R0,??DataTable2_6
        STR      R2,[R0, #+0]
??I2C_Master_BufferRead_38:
        LDRH     R0,[R4, #+0]
        ORRS     R0,R0,#0x100
        STRH     R0,[R4, #+0]
??I2C_Master_BufferRead_39:
        LDRH     R0,[R4, #+0]
        LSLS     R0,R0,#+23
        BMI.N    ??I2C_Master_BufferRead_39
??I2C_Master_BufferRead_40:
        LDRH     R0,[R4, #+24]
        LSLS     R0,R0,#+30
        BMI.N    ??I2C_Master_BufferRead_40
        LDRH     R0,[R4, #+0]
        ORRS     R0,R0,#0x400
        STRH     R0,[R4, #+0]
??I2C_Master_BufferRead_10:
        MOVS     R0,#+1
??I2C_Master_BufferRead_3:
        POP      {R1,R2,R4-R6,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_Master_BufferWrite:
        PUSH     {R4,R5,LR}
        SUB      SP,SP,#+12
        MOVS     R5,R0
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        LDRH     R0,[R5, #+4]
        ORRS     R0,R0,#0x100
        STRH     R0,[R5, #+4]
        LDR      R4,[SP, #+24]
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+2
        BNE.N    ??I2C_Master_BufferWrite_0
        MOVW     R0,#+65535
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R0,R5
        BL       I2C_DMAConfig
        LDRH     R0,[R5, #+4]
        ORRS     R0,R0,#0x800
        STRH     R0,[R5, #+4]
        LDRH     R0,[R5, #+0]
        ORRS     R0,R0,#0x100
        STRH     R0,[R5, #+0]
??I2C_Master_BufferWrite_1:
        LDRH     R0,[R5, #+20]
        LSLS     R0,R0,#+31
        BMI.N    ??I2C_Master_BufferWrite_2
        LDR      R0,[SP, #+0]
        SUBS     R1,R0,#+1
        STR      R1,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??I2C_Master_BufferWrite_1
        MOVS     R0,#+0
        B.N      ??I2C_Master_BufferWrite_3
??I2C_Master_BufferWrite_2:
        MOVW     R0,#+65535
        STR      R0,[SP, #+0]
        ANDS     R4,R4,#0xFE
        LDR.N    R0,??DataTable2
        STRB     R4,[R0, #+0]
        LDR.N    R0,??DataTable2
        LDRB     R0,[R0, #+0]
        STRH     R0,[R5, #+16]
??I2C_Master_BufferWrite_4:
        LDRH     R0,[R5, #+20]
        LSLS     R0,R0,#+30
        BMI.N    ??I2C_Master_BufferWrite_5
        LDR      R0,[SP, #+0]
        SUBS     R1,R0,#+1
        STR      R1,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??I2C_Master_BufferWrite_4
        MOVS     R0,#+0
        B.N      ??I2C_Master_BufferWrite_3
??I2C_Master_BufferWrite_5:
        LDRH     R0,[R5, #+24]
        STR      R0,[SP, #+4]
        LDR.N    R0,??DataTable2_1  ;; 0x40005400
        CMP      R5,R0
        BNE.N    ??I2C_Master_BufferWrite_6
??I2C_Master_BufferWrite_7:
        MOVS     R0,#+2097152
        BL       DMA_GetFlagStatus
        CMP      R0,#+0
        BEQ.N    ??I2C_Master_BufferWrite_7
        MOVS     R1,#+0
        LDR.N    R0,??DataTable2_7  ;; 0x4002606c
        BL       DMA_Cmd
        MOVS     R0,#+2097152
        BL       DMA_ClearFlag
        B.N      ??I2C_Master_BufferWrite_8
??I2C_Master_BufferWrite_6:
        MOV      R0,#+8192
        BL       DMA_GetFlagStatus
        CMP      R0,#+0
        BEQ.N    ??I2C_Master_BufferWrite_6
        MOVS     R1,#+0
        LDR.N    R0,??DataTable2_8  ;; 0x40026044
        BL       DMA_Cmd
        MOV      R0,#+8192
        BL       DMA_ClearFlag
??I2C_Master_BufferWrite_8:
        LDRH     R0,[R5, #+20]
        LSLS     R0,R0,#+29
        BPL.N    ??I2C_Master_BufferWrite_8
        LDRH     R0,[R5, #+0]
        ORRS     R0,R0,#0x200
        STRH     R0,[R5, #+0]
??I2C_Master_BufferWrite_9:
        LDRH     R0,[R5, #+0]
        LSLS     R0,R0,#+22
        BMI.N    ??I2C_Master_BufferWrite_9
        B.N      ??I2C_Master_BufferWrite_10
??I2C_Master_BufferWrite_0:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+0
        BNE.N    ??I2C_Master_BufferWrite_11
        MOVW     R0,#+65535
        STR      R0,[SP, #+0]
        LDRH     R0,[R5, #+0]
        ORRS     R0,R0,#0x100
        STRH     R0,[R5, #+0]
??I2C_Master_BufferWrite_12:
        LDRH     R0,[R5, #+20]
        LSLS     R0,R0,#+31
        BMI.N    ??I2C_Master_BufferWrite_13
        LDR      R0,[SP, #+0]
        SUBS     R3,R0,#+1
        STR      R3,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??I2C_Master_BufferWrite_12
        MOVS     R0,#+0
        B.N      ??I2C_Master_BufferWrite_3
??I2C_Master_BufferWrite_13:
        ANDS     R4,R4,#0xFE
        LDR.N    R0,??DataTable2
        STRB     R4,[R0, #+0]
        LDR.N    R0,??DataTable2
        LDRB     R0,[R0, #+0]
        STRH     R0,[R5, #+16]
        MOVW     R0,#+65535
        STR      R0,[SP, #+0]
??I2C_Master_BufferWrite_14:
        LDRH     R0,[R5, #+20]
        LSLS     R0,R0,#+30
        BMI.N    ??I2C_Master_BufferWrite_15
        LDR      R0,[SP, #+0]
        SUBS     R3,R0,#+1
        STR      R3,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??I2C_Master_BufferWrite_14
        MOVS     R0,#+0
        B.N      ??I2C_Master_BufferWrite_3
??I2C_Master_BufferWrite_15:
        LDRH     R0,[R5, #+24]
        STR      R0,[SP, #+4]
        LDRB     R0,[R1, #+0]
        STRH     R0,[R5, #+16]
        ADDS     R1,R1,#+1
        SUBS     R2,R2,#+1
        B.N      ??I2C_Master_BufferWrite_16
??I2C_Master_BufferWrite_17:
        LDRH     R0,[R5, #+20]
        LSLS     R0,R0,#+29
        BPL.N    ??I2C_Master_BufferWrite_17
        LDRB     R0,[R1, #+0]
        STRH     R0,[R5, #+16]
        ADDS     R1,R1,#+1
??I2C_Master_BufferWrite_16:
        MOVS     R0,R2
        SUBS     R2,R0,#+1
        CMP      R0,#+0
        BNE.N    ??I2C_Master_BufferWrite_17
??I2C_Master_BufferWrite_18:
        LDRH     R0,[R5, #+20]
        LSLS     R0,R0,#+29
        BPL.N    ??I2C_Master_BufferWrite_18
        LDRH     R0,[R5, #+0]
        ORRS     R0,R0,#0x200
        STRH     R0,[R5, #+0]
??I2C_Master_BufferWrite_19:
        LDRH     R0,[R5, #+0]
        LSLS     R0,R0,#+22
        BMI.N    ??I2C_Master_BufferWrite_19
        B.N      ??I2C_Master_BufferWrite_10
??I2C_Master_BufferWrite_11:
        LDRH     R0,[R5, #+4]
        ORRS     R0,R0,#0x200
        STRH     R0,[R5, #+4]
        LDRH     R0,[R5, #+4]
        ORRS     R0,R0,#0x400
        STRH     R0,[R5, #+4]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_4
        STR      R0,[R1, #+0]
        ANDS     R4,R4,#0xFE
        LDR.N    R0,??DataTable2
        STRB     R4,[R0, #+0]
        LDR.N    R0,??DataTable2_1  ;; 0x40005400
        CMP      R5,R0
        BNE.N    ??I2C_Master_BufferWrite_20
        LDR.N    R0,??DataTable2_5
        STR      R2,[R0, #+0]
        B.N      ??I2C_Master_BufferWrite_21
??I2C_Master_BufferWrite_20:
        LDR.N    R0,??DataTable2_6
        STR      R2,[R0, #+0]
??I2C_Master_BufferWrite_21:
        LDRH     R0,[R5, #+0]
        ORRS     R0,R0,#0x100
        STRH     R0,[R5, #+0]
??I2C_Master_BufferWrite_22:
        LDRH     R0,[R5, #+0]
        LSLS     R0,R0,#+23
        BMI.N    ??I2C_Master_BufferWrite_22
??I2C_Master_BufferWrite_23:
        LDRH     R0,[R5, #+24]
        LSLS     R0,R0,#+30
        BMI.N    ??I2C_Master_BufferWrite_23
??I2C_Master_BufferWrite_10:
        MOVS     R0,#+1
??I2C_Master_BufferWrite_3:
        POP      {R1-R5,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_Slave_BufferReadWrite:
        LDRH     R2,[R0, #+4]
        ORRS     R2,R2,#0x200
        STRH     R2,[R0, #+4]
        LDRH     R2,[R0, #+4]
        ORRS     R2,R2,#0x100
        STRH     R2,[R0, #+4]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+2
        BNE.N    ??I2C_Slave_BufferReadWrite_0
        LDRH     R1,[R0, #+4]
        ORRS     R1,R1,#0x800
        STRH     R1,[R0, #+4]
        B.N      ??I2C_Slave_BufferReadWrite_1
??I2C_Slave_BufferReadWrite_0:
        LDRH     R1,[R0, #+4]
        ORRS     R1,R1,#0x400
        STRH     R1,[R0, #+4]
??I2C_Slave_BufferReadWrite_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_DMAConfig:
        PUSH     {R7,LR}
        CMP      R3,#+0
        BNE.N    ??I2C_DMAConfig_0
        LDR.N    R3,??DataTable2_9
        STR      R1,[R3, #+4]
        MOVS     R1,#+16
        LDR.N    R3,??DataTable2_9
        STR      R1,[R3, #+8]
        LDR.N    R1,??DataTable2_9
        STR      R2,[R1, #+12]
        LDR.N    R1,??DataTable2_1  ;; 0x40005400
        CMP      R0,R1
        BNE.N    ??I2C_DMAConfig_1
        LDR.N    R0,??DataTable2_10  ;; 0x40005410
        LDR.N    R1,??DataTable2_9
        STR      R0,[R1, #+0]
        MOVS     R1,#+0
        LDR.N    R0,??DataTable2_7  ;; 0x4002606c
        BL       DMA_Cmd
        LDR.N    R1,??DataTable2_9
        LDR.N    R0,??DataTable2_7  ;; 0x4002606c
        BL       DMA_Init
        MOVS     R1,#+1
        LDR.N    R0,??DataTable2_7  ;; 0x4002606c
        BL       DMA_Cmd
        B.N      ??I2C_DMAConfig_2
??I2C_DMAConfig_1:
        LDR.N    R0,??DataTable2_11  ;; 0x40005810
        LDR.N    R1,??DataTable2_9
        STR      R0,[R1, #+0]
        MOVS     R1,#+0
        LDR.N    R0,??DataTable2_8  ;; 0x40026044
        BL       DMA_Cmd
        LDR.N    R1,??DataTable2_9
        LDR.N    R0,??DataTable2_8  ;; 0x40026044
        BL       DMA_Init
        MOVS     R1,#+1
        LDR.N    R0,??DataTable2_8  ;; 0x40026044
        BL       DMA_Cmd
        B.N      ??I2C_DMAConfig_2
??I2C_DMAConfig_0:
        LDR.N    R3,??DataTable2_9
        STR      R1,[R3, #+4]
        MOVS     R1,#+0
        LDR.N    R3,??DataTable2_9
        STR      R1,[R3, #+8]
        LDR.N    R1,??DataTable2_9
        STR      R2,[R1, #+12]
        LDR.N    R1,??DataTable2_1  ;; 0x40005400
        CMP      R0,R1
        BNE.N    ??I2C_DMAConfig_3
        LDR.N    R0,??DataTable2_10  ;; 0x40005410
        LDR.N    R1,??DataTable2_9
        STR      R0,[R1, #+0]
        MOVS     R1,#+0
        LDR.N    R0,??DataTable2_2  ;; 0x40026080
        BL       DMA_Cmd
        LDR.N    R1,??DataTable2_9
        LDR.N    R0,??DataTable2_2  ;; 0x40026080
        BL       DMA_Init
        MOVS     R1,#+1
        LDR.N    R0,??DataTable2_2  ;; 0x40026080
        BL       DMA_Cmd
        B.N      ??I2C_DMAConfig_2
??I2C_DMAConfig_3:
        LDR.N    R0,??DataTable2_11  ;; 0x40005810
        LDR.N    R1,??DataTable2_9
        STR      R0,[R1, #+0]
        MOVS     R1,#+0
        LDR.N    R0,??DataTable2_3  ;; 0x40026058
        BL       DMA_Cmd
        LDR.N    R1,??DataTable2_9
        LDR.N    R0,??DataTable2_3  ;; 0x40026058
        BL       DMA_Init
        MOVS     R1,#+1
        LDR.N    R0,??DataTable2_3  ;; 0x40026058
        BL       DMA_Cmd
??I2C_DMAConfig_2:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     Address

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     0x40005400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     0x40026080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     0x40026058

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     I2CDirection

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     NumbOfBytes1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     NumbOfBytes2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     0x4002606c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_8:
        DC32     0x40026044

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_9:
        DC32     I2CDMA_InitStructure

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_10:
        DC32     0x40005410

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_11:
        DC32     0x40005810

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
//    57 bytes in section .bss
// 1 464 bytes in section .text
// 
// 1 464 bytes of CODE memory
//    57 bytes of DATA memory
//
//Errors: none
//Warnings: none
