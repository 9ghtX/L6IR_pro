///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.70.1.11437/W32 for ARM      18/Apr/2019  18:40:32
// Copyright 1999-2016 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        E:\projects\L6IR\programm\L6_pro\protocol_L6IR_encoder_new.c
//    Command line =  
//        E:\projects\L6IR\programm\L6_pro\protocol_L6IR_encoder_new.c -D
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
//        E:\projects\L6IR\programm\L6_pro\Release\List\protocol_L6IR_encoder_new.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN RXbuf
        EXTERN encoder0_masks_buf
        EXTERN encoder_func_buf
        EXTERN encoder_func_count
        EXTERN encoder_minus_buf
        EXTERN encoder_plus_buf
        EXTERN error_counter
        EXTERN fuck_next_command
        EXTERN fuck_power_off_command
        EXTERN keys
        EXTERN `pop`
        EXTERN `push`
        EXTERN senspar
        EXTERN spi_sets

        PUBLIC device_mode
        PUBLIC encoder0_eoc_func
        PUBLIC encoder0_func
        PUBLIC encoder1_func
        PUBLIC encoder1_t_func


        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        DATA
device_mode:
        DS8 1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
encoder1_func:
        PUSH     {R3-R5,LR}
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??encoder1_func_0
        LDR.N    R0,??DataTable3
        BL       `pop`
        MOVS     R4,R0
        MOVS     R5,#+0
        B.N      ??encoder1_func_1
??encoder1_func_2:
??encoder1_func_3:
        ADDS     R5,R5,#+1
??encoder1_func_1:
        MOVS     R0,R5
        MOVS     R1,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R0,R1
        BCS.N    ??encoder1_func_4
        LDR.N    R0,??DataTable3
        BL       `pop`
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+6
        BEQ.N    ??encoder1_func_5
        CMP      R0,#+7
        BEQ.N    ??encoder1_func_6
        CMP      R0,#+66
        BEQ.N    ??encoder1_func_7
        CMP      R0,#+67
        BEQ.N    ??encoder1_func_8
        CMP      R0,#+68
        BEQ.N    ??encoder1_func_9
        B.N      ??encoder1_func_2
??encoder1_func_7:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_1
        STRB     R0,[R1, #+36]
        MOVS     R1,#+27
        LDR.N    R0,??DataTable3_2
        BL       `push`
        B.N      ??encoder1_func_3
??encoder1_func_8:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_1
        STRB     R0,[R1, #+36]
        MOVS     R1,#+28
        LDR.N    R0,??DataTable3_2
        BL       `push`
        B.N      ??encoder1_func_3
??encoder1_func_5:
        MOVS     R1,#+1
        LDR.N    R0,??DataTable3_2
        BL       `push`
        B.N      ??encoder1_func_3
??encoder1_func_9:
        LDR.N    R0,??DataTable3_3
        LDR.N    R1,??DataTable3_3
        LDRB     R1,[R1, #+112]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R1,R5,R1
        MOVS     R2,#+16
        STRB     R2,[R0, R1]
        B.N      ??encoder1_func_3
??encoder1_func_6:
        LDR.N    R0,??DataTable3_3
        LDR.N    R1,??DataTable3_3
        LDRB     R1,[R1, #+112]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R1,R5,R1
        MOVS     R2,#+240
        STRB     R2,[R0, R1]
        B.N      ??encoder1_func_3
??encoder1_func_4:
??encoder1_func_0:
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
encoder1_t_func:
        PUSH     {R3-R5,LR}
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??encoder1_t_func_0
        LDR.N    R0,??DataTable3
        BL       `pop`
        MOVS     R4,R0
        MOVS     R5,#+0
        B.N      ??encoder1_t_func_1
??encoder1_t_func_2:
??encoder1_t_func_3:
        ADDS     R5,R5,#+1
??encoder1_t_func_1:
        MOVS     R0,R5
        MOVS     R1,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R0,R1
        BCS.N    ??encoder1_t_func_4
        LDR.N    R0,??DataTable3
        BL       `pop`
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+6
        BEQ.N    ??encoder1_t_func_5
        CMP      R0,#+7
        BEQ.N    ??encoder1_t_func_6
        CMP      R0,#+66
        BEQ.N    ??encoder1_t_func_7
        CMP      R0,#+67
        BEQ.N    ??encoder1_t_func_8
        CMP      R0,#+68
        BEQ.N    ??encoder1_t_func_9
        B.N      ??encoder1_t_func_2
??encoder1_t_func_7:
        MOVS     R1,#+9
        LDR.N    R0,??DataTable3_2
        BL       `push`
        B.N      ??encoder1_t_func_3
??encoder1_t_func_8:
        MOVS     R1,#+10
        LDR.N    R0,??DataTable3_2
        BL       `push`
        B.N      ??encoder1_t_func_3
??encoder1_t_func_5:
        MOVS     R1,#+1
        LDR.N    R0,??DataTable3_2
        BL       `push`
        B.N      ??encoder1_t_func_3
??encoder1_t_func_9:
        LDR.N    R0,??DataTable3_3
        LDR.N    R1,??DataTable3_3
        LDRB     R1,[R1, #+112]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R1,R5,R1
        MOVS     R2,#+16
        STRB     R2,[R0, R1]
        B.N      ??encoder1_t_func_3
??encoder1_t_func_6:
        MOVS     R1,#+240
        LDR.N    R0,??DataTable3_2
        BL       `push`
        B.N      ??encoder1_t_func_3
??encoder1_t_func_4:
??encoder1_t_func_0:
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
encoder0_eoc_func:
        PUSH     {R3-R5,LR}
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??encoder0_eoc_func_0
        LDR.N    R0,??DataTable3
        BL       `pop`
        MOVS     R4,R0
        MOVS     R5,#+0
        B.N      ??encoder0_eoc_func_1
??encoder0_eoc_func_2:
        MOVS     R1,#+56
        LDR.N    R0,??DataTable3_2
        BL       `push`
??encoder0_eoc_func_3:
        ADDS     R5,R5,#+1
??encoder0_eoc_func_1:
        MOVS     R0,R5
        MOVS     R1,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R0,R1
        BCS.N    ??encoder0_eoc_func_4
        LDR.N    R0,??DataTable3
        BL       `pop`
        MOV      R1,#+300
        LDR.N    R2,??DataTable3_4
        STRH     R1,[R2, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+66
        BEQ.N    ??encoder0_eoc_func_5
        CMP      R0,#+67
        BEQ.N    ??encoder0_eoc_func_2
        B.N      ??encoder0_eoc_func_3
??encoder0_eoc_func_5:
        MOVS     R1,#+55
        LDR.N    R0,??DataTable3_2
        BL       `push`
        B.N      ??encoder0_eoc_func_3
??encoder0_eoc_func_4:
??encoder0_eoc_func_0:
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
encoder0_func:
        PUSH     {R3-R5,LR}
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.W    ??encoder0_func_0
        LDR.N    R0,??DataTable3
        BL       `pop`
        MOVS     R4,R0
        MOVS     R5,#+0
        B.N      ??encoder0_func_1
??encoder0_func_2:
        LDR.N    R0,??DataTable3_5
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??encoder0_func_3
        MOVS     R1,#+240
        LDR.N    R0,??DataTable3_2
        BL       `push`
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_6
        STRB     R0,[R1, #+0]
??encoder0_func_3:
??encoder0_func_4:
        ADDS     R5,R5,#+1
??encoder0_func_1:
        MOVS     R0,R5
        MOVS     R1,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R0,R1
        BCS.W    ??encoder0_func_5
        LDR.N    R0,??DataTable3
        BL       `pop`
        MOV      R1,#+300
        LDR.N    R2,??DataTable3_4
        STRH     R1,[R2, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+6
        BEQ.N    ??encoder0_func_6
        CMP      R0,#+7
        BEQ.N    ??encoder0_func_2
        CMP      R0,#+66
        BEQ.N    ??encoder0_func_7
        CMP      R0,#+67
        BEQ.N    ??encoder0_func_8
        CMP      R0,#+68
        BEQ.N    ??encoder0_func_9
        CMP      R0,#+69
        BEQ.N    ??encoder0_func_10
        B.N      ??encoder0_func_4
??encoder0_func_7:
        LDR.N    R0,??DataTable3_7
        LDR.N    R1,??DataTable3_8
        LDRB     R1,[R1, #+0]
        ADD      R0,R0,R1
        LDRB     R1,[R0, #-1]
        LDR.N    R0,??DataTable3_2
        BL       `push`
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_6
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_5
        STRB     R0,[R1, #+0]
        B.N      ??encoder0_func_4
??encoder0_func_8:
        LDR.N    R0,??DataTable3_9
        LDR.N    R1,??DataTable3_8
        LDRB     R1,[R1, #+0]
        ADD      R0,R0,R1
        LDRB     R1,[R0, #-1]
        LDR.N    R0,??DataTable3_2
        BL       `push`
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_6
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_5
        STRB     R0,[R1, #+0]
        B.N      ??encoder0_func_4
??encoder0_func_6:
        LDR.N    R0,??DataTable3_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??encoder0_func_11
        LDR.N    R0,??DataTable3_10
        LDRB     R0,[R0, #+8]
        LSLS     R0,R0,#+28
        BMI.N    ??encoder0_func_12
        LDR.N    R0,??DataTable3_8
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable3_8
        STRB     R0,[R1, #+0]
        LDR.N    R0,??DataTable3_8
        LDRB     R0,[R0, #+0]
        CMP      R0,#+12
        BLT.N    ??encoder0_func_13
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_8
        STRB     R0,[R1, #+0]
        B.N      ??encoder0_func_13
??encoder0_func_14:
        LDR.N    R0,??DataTable3_8
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable3_8
        STRB     R0,[R1, #+0]
        LDR.N    R0,??DataTable3_8
        LDRB     R0,[R0, #+0]
        CMP      R0,#+12
        BLT.N    ??encoder0_func_13
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_8
        STRB     R0,[R1, #+0]
??encoder0_func_13:
        LDR.N    R0,??DataTable3_11
        LDR.N    R1,??DataTable3_8
        LDRB     R1,[R1, #+0]
        LDRB     R0,[R0, R1]
        LDR.N    R1,??DataTable3_12
        LDR.N    R2,??DataTable3_8
        LDRB     R2,[R2, #+0]
        LDRB     R1,[R1, R2]
        TST      R0,R1
        BEQ.N    ??encoder0_func_14
??encoder0_func_12:
        MOVS     R1,#+32
        LDR.N    R0,??DataTable3_2
        BL       `push`
        LDR.N    R0,??DataTable3_11
        LDR.N    R1,??DataTable3_8
        LDRB     R1,[R1, #+0]
        LDRB     R1,[R0, R1]
        LDR.N    R0,??DataTable3_2
        BL       `push`
        B.N      ??encoder0_func_15
??encoder0_func_11:
        MOVS     R1,#+99
        LDR.N    R0,??DataTable3_2
        BL       `push`
??encoder0_func_15:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_6
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_5
        STRB     R0,[R1, #+0]
        B.N      ??encoder0_func_4
??encoder0_func_9:
        MOVS     R1,#+16
        LDR.N    R0,??DataTable3_2
        BL       `push`
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_6
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_5
        STRB     R0,[R1, #+0]
        B.N      ??encoder0_func_4
??encoder0_func_10:
        LDR.N    R0,??DataTable3_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??encoder0_func_16
        MOVS     R1,#+7
        LDR.N    R0,??DataTable3_2
        BL       `push`
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_6
        STRB     R0,[R1, #+0]
??encoder0_func_16:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_5
        STRB     R0,[R1, #+0]
        B.N      ??encoder0_func_4
??encoder0_func_5:
??encoder0_func_0:
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     RXbuf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     senspar

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     keys+0x64

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     keys

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     error_counter

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     fuck_power_off_command

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     fuck_next_command

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_7:
        DC32     encoder_plus_buf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_8:
        DC32     encoder_func_count

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_9:
        DC32     encoder_minus_buf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_10:
        DC32     spi_sets

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_11:
        DC32     encoder_func_buf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_12:
        DC32     encoder0_masks_buf

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
//   1 byte  in section .bss
// 756 bytes in section .text
// 
// 756 bytes of CODE memory
//   1 byte  of DATA memory
//
//Errors: none
//Warnings: 8
