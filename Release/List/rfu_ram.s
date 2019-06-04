///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.70.1.11437/W32 for ARM      18/Apr/2019  18:40:35
// Copyright 1999-2016 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        E:\projects\L6IR\programm\L6_pro\rfu_stm32\source\rfu_ram.c
//    Command line =  
//        E:\projects\L6IR\programm\L6_pro\rfu_stm32\source\rfu_ram.c -D
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
//    List file    =  E:\projects\L6IR\programm\L6_pro\Release\List\rfu_ram.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1
        #define SHF_EXECINSTR 0x4

        EXTERN RFU_FLASH_EraseAllPages
        EXTERN RFU_FLASH_FastProgramWord
        EXTERN RFU_FLASH_Lock
        EXTERN RFU_FLASH_Unlock
        EXTERN __aeabi_memclr4

        PUBLIC rfu_main
        PUBLIC send
        PUBLIC send_char
        PUBLIC send_ec
        PUBLIC send_u32


        SECTION RFU_CODE:CODE:NOROOT(1)
        THUMB
send_char:
??send_char_0:
        LDR.W    R1,??DataTable2  ;; 0x40013800
        LDRH     R1,[R1, #+0]
        LSLS     R1,R1,#+24
        BPL.N    ??send_char_0
        LSLS     R0,R0,#+23       ;; ZeroExtS R0,R0,#+23,#+23
        LSRS     R0,R0,#+23
        LDR.W    R1,??DataTable2_1  ;; 0x40013804
        STRH     R0,[R1, #+0]
        BX       LR               ;; return

        SECTION RFU_CODE:CODE:NOROOT(1)
        THUMB
send:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,#+0
        MOVS     R0,#+1
        LDR.W    R1,??DataTable2_2  ;; 0x40020418
        STRH     R0,[R1, #+0]
        MOVS     R0,#+36
        BL       send_char
        B.N      ??send_0
??send_1:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+36
        BEQ.N    ??send_2
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+59
        BEQ.N    ??send_2
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+47
        BNE.N    ??send_3
??send_2:
        MOVS     R0,#+47
        BL       send_char
        EORS     R7,R7,#0xFF
??send_3:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        MOVS     R0,R7
        BL       send_char
        ADDS     R4,R4,#+1
??send_0:
        MOVS     R0,R5
        SUBS     R5,R0,#+1
        CMP      R0,#+0
        BEQ.N    ??send_4
        LDRB     R7,[R4, #+0]
        EORS     R6,R7,R6
        MOVS     R0,#+0
        B.N      ??send_5
??send_6:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LSRS     R6,R6,#+1
??send_7:
        ADDS     R0,R0,#+1
??send_5:
        CMP      R0,#+8
        BGE.N    ??send_1
        LSLS     R1,R6,#+31
        BPL.N    ??send_6
        EORS     R6,R6,#0x18
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LSRS     R1,R6,#+1
        ORRS     R6,R1,#0x80
        B.N      ??send_7
??send_4:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+36
        BEQ.N    ??send_8
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+59
        BEQ.N    ??send_8
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+47
        BNE.N    ??send_9
??send_8:
        MOVS     R0,#+47
        BL       send_char
        EORS     R6,R6,#0xFF
??send_9:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        MOVS     R0,R6
        BL       send_char
        MOVS     R0,#+59
        BL       send_char
??send_10:
        LDR.W    R0,??DataTable2  ;; 0x40013800
        LDRH     R0,[R0, #+0]
        LSLS     R0,R0,#+25
        BPL.N    ??send_10
        MOVS     R0,#+1
        LDR.W    R1,??DataTable2_3  ;; 0x4002041a
        STRH     R0,[R1, #+0]
        POP      {R0,R4-R7,PC}    ;; return

        SECTION RFU_CODE:CODE:NOROOT(1)
        THUMB
send_ec:
        PUSH     {R7,LR}
        STRB     R0,[SP, #+0]
        STRB     R1,[SP, #+1]
        STRB     R2,[SP, #+2]
        MOVS     R1,#+3
        MOV      R0,SP
        BL       send
        POP      {R0,PC}          ;; return

        SECTION RFU_CODE:CODE:NOROOT(1)
        THUMB
send_u32:
        PUSH     {R4,R5,LR}
        SUB      SP,SP,#+12
        MOV      R3,SP
        MOVS     R4,#+0
        MOVS     R5,#+0
        STRD     R4,R5,[R3, #+0]
        STRB     R0,[SP, #+0]
        STRB     R1,[SP, #+1]
        MOVS     R0,R2
        STRB     R0,[SP, #+2]
        LSRS     R0,R2,#+8
        STRB     R0,[SP, #+3]
        LSRS     R0,R2,#+16
        STRB     R0,[SP, #+4]
        LSRS     R0,R2,#+24
        STRB     R0,[SP, #+5]
        MOVS     R1,#+6
        MOV      R0,SP
        BL       send
        POP      {R0-R2,R4,R5,PC}  ;; return

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0

        SECTION RFU_CODE:CODE:NOROOT(1)
        THUMB
rfu_main:
        PUSH     {R0,R4-R11,LR}
        SUB      SP,SP,#+520
        ADD      R0,SP,#+4
        MOV      R1,#+512
        BL       __aeabi_memclr4
        MOVS     R6,#+0
        MOVS     R0,#+0
        STRB     R0,[SP, #+0]
        MOVS     R5,#+0
        MOVS     R7,#+0
        MOVS     R4,#+0
        MOVS     R8,#+0
        B.N      ??rfu_main_0
??rfu_main_1:
??rfu_main_0:
        LDR.W    R0,??DataTable2  ;; 0x40013800
        LDRH     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??rfu_main_1
        LDR.W    R0,??DataTable2_1  ;; 0x40013804
        LDRH     R0,[R0, #+0]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??rfu_main_2
        EORS     R0,R0,#0xFF
        MOVS     R5,#+0
        B.N      ??rfu_main_3
??rfu_main_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+47
        BNE.N    ??rfu_main_4
        MOVS     R5,#+1
        B.N      ??rfu_main_0
??rfu_main_4:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+59
        BNE.N    ??rfu_main_3
        MOVS     R8,#+4
??rfu_main_3:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+0
        BEQ.N    ??rfu_main_5
        CMP      R8,#+2
        BEQ.N    ??rfu_main_6
        BCC.N    ??rfu_main_7
        CMP      R8,#+4
        BEQ.W    ??rfu_main_8
        BCC.N    ??rfu_main_9
        B.N      ??rfu_main_10
??rfu_main_5:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+36
        BNE.N    ??rfu_main_11
        MOVS     R0,#+0
        STRB     R0,[SP, #+0]
        MOVS     R5,#+0
        MOVS     R6,#+0
        MOVS     R8,#+1
??rfu_main_11:
        B.N      ??rfu_main_0
??rfu_main_7:
        LDRB     R1,[SP, #+520]
        MOVS     R2,R0
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R1,R2
        BNE.N    ??rfu_main_12
        MOVS     R8,#+2
        B.N      ??rfu_main_13
??rfu_main_12:
        MOVS     R8,#+0
??rfu_main_13:
        LDRB     R1,[SP, #+0]
        EORS     R0,R0,R1
        STRB     R0,[SP, #+0]
        MOVS     R0,#+0
        B.N      ??rfu_main_14
??rfu_main_15:
        LDRB     R1,[SP, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSRS     R1,R1,#+1
        STRB     R1,[SP, #+0]
??rfu_main_16:
        ADDS     R0,R0,#+1
??rfu_main_14:
        CMP      R0,#+8
        BGE.N    ??rfu_main_17
        LDRB     R1,[SP, #+0]
        LSLS     R1,R1,#+31
        BPL.N    ??rfu_main_15
        LDRB     R1,[SP, #+0]
        EORS     R1,R1,#0x18
        STRB     R1,[SP, #+0]
        LDRB     R1,[SP, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSRS     R1,R1,#+1
        ORRS     R1,R1,#0x80
        STRB     R1,[SP, #+0]
        B.N      ??rfu_main_16
??rfu_main_17:
        B.N      ??rfu_main_0
??rfu_main_6:
        MOVS     R7,R0
        MOVS     R8,#+3
        LDRB     R1,[SP, #+0]
        EORS     R0,R0,R1
        STRB     R0,[SP, #+0]
        MOVS     R0,#+0
        B.N      ??rfu_main_18
??rfu_main_19:
        LDRB     R1,[SP, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSRS     R1,R1,#+1
        STRB     R1,[SP, #+0]
??rfu_main_20:
        ADDS     R0,R0,#+1
??rfu_main_18:
        CMP      R0,#+8
        BGE.N    ??rfu_main_21
        LDRB     R1,[SP, #+0]
        LSLS     R1,R1,#+31
        BPL.N    ??rfu_main_19
        LDRB     R1,[SP, #+0]
        EORS     R1,R1,#0x18
        STRB     R1,[SP, #+0]
        LDRB     R1,[SP, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSRS     R1,R1,#+1
        ORRS     R1,R1,#0x80
        STRB     R1,[SP, #+0]
        B.N      ??rfu_main_20
??rfu_main_21:
        B.N      ??rfu_main_0
??rfu_main_9:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+512
        BCS.N    ??rfu_main_22
        ADD      R1,SP,#+4
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        STRB     R0,[R1, R6]
        LDRB     R1,[SP, #+0]
        EORS     R0,R0,R1
        STRB     R0,[SP, #+0]
        MOVS     R0,#+0
        B.N      ??rfu_main_23
??rfu_main_24:
        LDRB     R1,[SP, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSRS     R1,R1,#+1
        STRB     R1,[SP, #+0]
??rfu_main_25:
        ADDS     R0,R0,#+1
??rfu_main_23:
        CMP      R0,#+8
        BGE.N    ??rfu_main_26
        LDRB     R1,[SP, #+0]
        LSLS     R1,R1,#+31
        BPL.N    ??rfu_main_24
        LDRB     R1,[SP, #+0]
        EORS     R1,R1,#0x18
        STRB     R1,[SP, #+0]
        LDRB     R1,[SP, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSRS     R1,R1,#+1
        ORRS     R1,R1,#0x80
        STRB     R1,[SP, #+0]
        B.N      ??rfu_main_25
??rfu_main_26:
        ADDS     R6,R6,#+1
        B.N      ??rfu_main_27
??rfu_main_22:
        MOVS     R8,#+0
??rfu_main_27:
        B.N      ??rfu_main_0
??rfu_main_8:
        LDRB     R0,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??rfu_main_28
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+0
        BNE.N    ??rfu_main_29
??rfu_main_28:
        MOVS     R8,#+0
        B.N      ??rfu_main_0
??rfu_main_29:
        SUBS     R6,R6,#+1
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+63
        BNE.N    ??rfu_main_30
        MOVS     R2,#+0
        MOVS     R1,#+63
        LDRB     R0,[SP, #+520]
        BL       send_u32
        B.N      ??rfu_main_31
??rfu_main_30:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+255
        BNE.N    ??rfu_main_32
        MOVS     R2,#+0
        MOVS     R1,#+255
        LDRB     R0,[SP, #+520]
        BL       send_u32
        B.N      ??rfu_main_31
??rfu_main_32:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+105
        BNE.N    ??rfu_main_33
        BL       RFU_FLASH_Unlock
        MOVS     R2,#+0
        MOVS     R1,#+105
        LDRB     R0,[SP, #+520]
        BL       send_u32
        MOVS     R4,#+1
        B.N      ??rfu_main_31
??rfu_main_33:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??rfu_main_34
        MOVS     R8,#+0
        B.N      ??rfu_main_0
??rfu_main_34:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+99
        BNE.N    ??rfu_main_35
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+12
        BEQ.N    ??rfu_main_36
        MOVS     R8,#+0
        B.N      ??rfu_main_0
??rfu_main_36:
        LDRB     R0,[SP, #+4]
        LDRB     R1,[SP, #+5]
        ORRS     R0,R0,R1, LSL #+8
        LDRB     R1,[SP, #+6]
        ORRS     R0,R0,R1, LSL #+16
        LDRB     R1,[SP, #+7]
        ORRS     R0,R0,R1, LSL #+24
        LDRB     R1,[SP, #+8]
        LDRB     R2,[SP, #+9]
        ORRS     R1,R1,R2, LSL #+8
        LDRB     R2,[SP, #+10]
        ORRS     R1,R1,R2, LSL #+16
        LDRB     R2,[SP, #+11]
        ORRS     R1,R1,R2, LSL #+24
        LDRB     R2,[SP, #+12]
        LDRB     R3,[SP, #+13]
        ORRS     R2,R2,R3, LSL #+8
        LDRB     R3,[SP, #+14]
        ORRS     R2,R2,R3, LSL #+16
        LDRB     R3,[SP, #+15]
        ORRS     R3,R2,R3, LSL #+24
        MOVS     R2,#+0
        MOVS     R12,#+0
        B.N      ??rfu_main_37
??rfu_main_38:
        ADDS     R0,R0,#+1
        ADDS     R12,R12,#+1
??rfu_main_37:
        CMP      R12,R1
        BCS.N    ??rfu_main_39
        LDRB     LR,[R0, #+0]
        EORS     R2,LR,R2
        MOVS     LR,#+0
        B.N      ??rfu_main_40
??rfu_main_41:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LSRS     R2,R2,#+1
??rfu_main_42:
        ADDS     LR,LR,#+1
??rfu_main_40:
        CMP      LR,#+8
        BGE.N    ??rfu_main_38
        LSLS     R8,R2,#+31
        BPL.N    ??rfu_main_41
        EORS     R2,R2,#0x18
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LSRS     R2,R2,#+1
        ORRS     R2,R2,#0x80
        B.N      ??rfu_main_42
??rfu_main_39:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R3,R2
        BNE.N    ??rfu_main_43
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,#+99
        LDRB     R0,[SP, #+520]
        BL       send_u32
        MOVS     R8,#+0
        B.N      ??rfu_main_0
??rfu_main_43:
        MOVS     R8,#+0
        B.N      ??rfu_main_0
??rfu_main_35:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+101
        BNE.N    ??rfu_main_44
        BL       RFU_FLASH_EraseAllPages
        CMP      R0,#+4
        BNE.N    ??rfu_main_45
        MOVS     R2,#+0
        B.N      ??rfu_main_46
??rfu_main_45:
        MOVS     R2,#+4
??rfu_main_46:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,#+101
        LDRB     R0,[SP, #+520]
        BL       send_ec
??rfu_main_47:
        MOVS     R8,#+0
??rfu_main_31:
        B.N      ??rfu_main_0
??rfu_main_44:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+119
        BNE.N    ??rfu_main_48
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+12
        BGE.N    ??rfu_main_49
        MOVS     R8,#+0
        B.N      ??rfu_main_0
??rfu_main_49:
        LDRB     R0,[SP, #+4]
        LDRB     R1,[SP, #+5]
        ORRS     R0,R0,R1, LSL #+8
        LDRB     R1,[SP, #+6]
        ORRS     R0,R0,R1, LSL #+16
        LDRB     R1,[SP, #+7]
        ORRS     R8,R0,R1, LSL #+24
        LDRB     R0,[SP, #+8]
        LDRB     R1,[SP, #+9]
        ORRS     R0,R0,R1, LSL #+8
        LDRB     R1,[SP, #+10]
        ORRS     R0,R0,R1, LSL #+16
        LDRB     R1,[SP, #+11]
        ORRS     R9,R0,R1, LSL #+24
        ADD      R10,SP,#+12
        LSLS     R0,R9,#+31
        BPL.N    ??rfu_main_50
        MOVS     R8,#+0
        B.N      ??rfu_main_0
??rfu_main_50:
        SUBS     R0,R8,#+134217728
        CMP      R0,#+393216
        BCC.N    ??rfu_main_51
        ADDS     R0,R9,R8
        SUBS     R0,R0,#+134217728
        CMP      R0,#+393216
        BCC.N    ??rfu_main_51
        MOVS     R8,#+0
        B.N      ??rfu_main_0
??rfu_main_51:
        MOV      R11,R8
        B.N      ??rfu_main_52
??rfu_main_53:
        LDRB     R0,[R10, #+0]
        LDRB     R1,[R10, #+1]
        ORRS     R0,R0,R1, LSL #+8
        LDRB     R1,[R10, #+2]
        ORRS     R0,R0,R1, LSL #+16
        LDRB     R1,[R10, #+3]
        ORRS     R1,R0,R1, LSL #+24
        MOV      R0,R11
        BL       RFU_FLASH_FastProgramWord
        ADDS     R10,R10,#+4
        ADDS     R11,R11,#+4
??rfu_main_52:
        ADDS     R0,R9,R8
        CMP      R11,R0
        BCC.N    ??rfu_main_53
        MOVS     R2,#+0
        MOVS     R1,#+119
        LDRB     R0,[SP, #+520]
        BL       send_ec
        B.N      ??rfu_main_47
??rfu_main_48:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+120
        BNE.N    ??rfu_main_47
        BL       RFU_FLASH_Lock
        DSB      
        LDR.N    R0,??DataTable2_4  ;; 0xe000ed0c
        LDR      R0,[R0, #+0]
        ANDS     R0,R0,#0x700
        LDR.N    R1,??DataTable2_5  ;; 0x5fa0004
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable2_4  ;; 0xe000ed0c
        STR      R0,[R1, #+0]
        DSB      
??rfu_main_54:
        B.N      ??rfu_main_54
??rfu_main_10:
        MOVS     R8,#+0
        B.N      ??rfu_main_0

        SECTION RFU_CODE:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     0x40013800

        SECTION RFU_CODE:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     0x40013804

        SECTION RFU_CODE:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     0x40020418

        SECTION RFU_CODE:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     0x4002041a

        SECTION RFU_CODE:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     0xe000ed0c

        SECTION RFU_CODE:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     0x5fa0004

        SECTION RFU_CODE:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, SHF_EXECINSTR

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION RFU_CODE_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION RfuOverlay:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// 
//   520 bytes in section .rodata
// 1 266 bytes in section RFU_CODE
// 
// 1 266 bytes of CODE  memory
//   520 bytes of CONST memory
//
//Errors: none
//Warnings: none
