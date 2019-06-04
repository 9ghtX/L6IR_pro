///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.70.1.11437/W32 for ARM      18/Apr/2019  18:40:30
// Copyright 1999-2016 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\projects\L6IR\programm\L6_pro\protocol_L6IR.c
//    Command line =  
//        E:\projects\L6IR\programm\L6_pro\protocol_L6IR.c -D
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
//        E:\projects\L6IR\programm\L6_pro\Release\List\protocol_L6IR.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_cfcmple
        EXTERN __aeabi_cfrcmple
        EXTERN __aeabi_fadd
        EXTERN check_crc
        EXTERN clean
        EXTERN counter_sys
        EXTERN del_stsp
        EXTERN flash
        EXTERN keys
        EXTERN lpd_requests
        EXTERN net_init
        EXTERN net_set_default
        EXTERN `pop`
        EXTERN `push`
        EXTERN rfu_start
        EXTERN senspar
        EXTERN spi_sets
        EXTERN task_flag
        EXTERN wright_data_to_cam

        PUBLIC RXbuf
        PUBLIC TXbuf
        PUBLIC ctrl_unit_masks_buf
        PUBLIC encoder0
        PUBLIC encoder0_masks_buf
        PUBLIC encoder1
        PUBLIC encoder1_masks_buf
        PUBLIC encoder_func_buf
        PUBLIC encoder_func_count
        PUBLIC encoder_func_ini
        PUBLIC encoder_minus_buf
        PUBLIC encoder_plus_buf
        PUBLIC error_counter
        PUBLIC fuck_next_command
        PUBLIC fuck_power_off_command
        PUBLIC func_buffer_ini
        PUBLIC keyBuf
        PUBLIC protocol
        PUBLIC redrow_menu_simbol
        PUBLIC rs_frame


        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
TXbuf:
        DS8 12

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
RXbuf:
        DS8 12

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
keyBuf:
        DS8 12

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        DATA
rs_frame:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
encoder0:
        DS8 12

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
encoder1:
        DS8 12

        SECTION `.data`:DATA:REORDER:NOROOT(0)
        DATA
fuck_power_off_command:
        DC8 1

        SECTION `.data`:DATA:REORDER:NOROOT(2)
        DATA
encoder_plus_buf:
        DC8 27, 18, 74, 23, 22, 20, 25, 55, 65, 252, 254, 0

        SECTION `.data`:DATA:REORDER:NOROOT(2)
        DATA
encoder_minus_buf:
        DC8 28, 17, 75, 24, 21, 19, 26, 56, 66, 253, 255, 0

        SECTION `.data`:DATA:REORDER:NOROOT(2)
        DATA
encoder_func_buf:
        DC8 32, 39, 33, 34, 35, 36, 37, 38, 40, 68, 43, 44

        SECTION `.data`:DATA:REORDER:NOROOT(2)
        DATA
encoder0_masks_buf:
        DC8 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255

        SECTION `.data`:DATA:REORDER:NOROOT(2)
        DATA
encoder1_masks_buf:
        DC8 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255

        SECTION `.data`:DATA:REORDER:NOROOT(2)
        DATA
ctrl_unit_masks_buf:
        DC8 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        DATA
encoder_func_count:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
        DATA
error_counter:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        DATA
fuck_next_command:
        DS8 1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
func_buffer_ini:
        MOVS     R0,#+27
        LDR.W    R1,??DataTable3
        STRB     R0,[R1, #+0]
        MOVS     R0,#+18
        LDR.W    R1,??DataTable3
        STRB     R0,[R1, #+1]
        MOVS     R0,#+74
        LDR.W    R1,??DataTable3
        STRB     R0,[R1, #+2]
        MOVS     R0,#+23
        LDR.W    R1,??DataTable3
        STRB     R0,[R1, #+3]
        MOVS     R0,#+22
        LDR.W    R1,??DataTable3
        STRB     R0,[R1, #+4]
        MOVS     R0,#+20
        LDR.W    R1,??DataTable3
        STRB     R0,[R1, #+5]
        MOVS     R0,#+25
        LDR.W    R1,??DataTable3
        STRB     R0,[R1, #+6]
        MOVS     R0,#+55
        LDR.W    R1,??DataTable3
        STRB     R0,[R1, #+7]
        MOVS     R0,#+65
        LDR.W    R1,??DataTable3
        STRB     R0,[R1, #+8]
        MOVS     R0,#+252
        LDR.W    R1,??DataTable3
        STRB     R0,[R1, #+9]
        MOVS     R0,#+254
        LDR.W    R1,??DataTable3
        STRB     R0,[R1, #+10]
        MOVS     R0,#+28
        LDR.W    R1,??DataTable3_1
        STRB     R0,[R1, #+0]
        MOVS     R0,#+17
        LDR.W    R1,??DataTable3_1
        STRB     R0,[R1, #+1]
        MOVS     R0,#+75
        LDR.W    R1,??DataTable3_1
        STRB     R0,[R1, #+2]
        MOVS     R0,#+24
        LDR.W    R1,??DataTable3_1
        STRB     R0,[R1, #+3]
        MOVS     R0,#+21
        LDR.W    R1,??DataTable3_1
        STRB     R0,[R1, #+4]
        MOVS     R0,#+19
        LDR.W    R1,??DataTable3_1
        STRB     R0,[R1, #+5]
        MOVS     R0,#+26
        LDR.W    R1,??DataTable3_1
        STRB     R0,[R1, #+6]
        MOVS     R0,#+56
        LDR.W    R1,??DataTable3_1
        STRB     R0,[R1, #+7]
        MOVS     R0,#+66
        LDR.W    R1,??DataTable3_1
        STRB     R0,[R1, #+8]
        MOVS     R0,#+253
        LDR.W    R1,??DataTable3_1
        STRB     R0,[R1, #+9]
        MOVS     R0,#+255
        LDR.W    R1,??DataTable3_1
        STRB     R0,[R1, #+10]
        MOVS     R0,#+39
        LDR.W    R1,??DataTable3_2
        STRB     R0,[R1, #+1]
        MOVS     R0,#+33
        LDR.W    R1,??DataTable3_2
        STRB     R0,[R1, #+2]
        MOVS     R0,#+34
        LDR.W    R1,??DataTable3_2
        STRB     R0,[R1, #+3]
        MOVS     R0,#+35
        LDR.W    R1,??DataTable3_2
        STRB     R0,[R1, #+4]
        MOVS     R0,#+36
        LDR.W    R1,??DataTable3_2
        STRB     R0,[R1, #+5]
        MOVS     R0,#+37
        LDR.W    R1,??DataTable3_2
        STRB     R0,[R1, #+6]
        MOVS     R0,#+38
        LDR.W    R1,??DataTable3_2
        STRB     R0,[R1, #+7]
        MOVS     R0,#+40
        LDR.W    R1,??DataTable3_2
        STRB     R0,[R1, #+8]
        MOVS     R0,#+68
        LDR.W    R1,??DataTable3_2
        STRB     R0,[R1, #+9]
        MOVS     R0,#+43
        LDR.W    R1,??DataTable3_2
        STRB     R0,[R1, #+10]
        MOVS     R0,#+44
        LDR.W    R1,??DataTable3_2
        STRB     R0,[R1, #+11]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
encoder_func_ini:
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_3
        STRB     R0,[R1, #+0]
        LDR.W    R0,??DataTable3_2
        LDR.W    R1,??DataTable3_3
        LDRB     R1,[R1, #+0]
        LDRB     R0,[R0, R1]
        LDR.W    R1,??DataTable3_4
        LDR.W    R2,??DataTable3_4
        LDRB     R2,[R2, #+112]
        STRB     R0,[R1, R2]
        LDR.W    R0,??DataTable3_4
        LDRB     R0,[R0, #+112]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable3_4
        STRB     R0,[R1, #+112]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
protocol:
        PUSH     {R4-R7,LR}
        SUB      SP,SP,#+20
        MOVS     R0,#+0
        LDR.W    R0,??DataTable3_5
        BL       del_stsp
        LDR.W    R0,??DataTable3_5
        BL       check_crc
        LDR.W    R0,??DataTable3_5
        BL       `pop`
        MOVS     R4,R0
        LDR.W    R0,??DataTable3_5
        BL       `pop`
        MOVS     R5,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+4
        BNE.W    ??protocol_0
        MOV      R0,#+300
        LDR.W    R1,??DataTable3_6
        STRH     R0,[R1, #+0]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,R5
        CMP      R0,#+1
        BEQ.N    ??protocol_1
        CMP      R0,#+4
        BEQ.W    ??protocol_2
        B.N      ??protocol_0
??protocol_1:
        LDR.W    R0,??DataTable3_5
        BL       `pop`
        MOVS     R6,R0
        MOVS     R7,#+0
        B.N      ??protocol_3
??protocol_4:
        LDR.W    R0,??DataTable3_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??protocol_5
        MOVS     R1,#+7
        LDR.W    R0,??DataTable3_8
        BL       `push`
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_7
        STRB     R0,[R1, #+0]
??protocol_5:
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_9
        STRB     R0,[R1, #+0]
??protocol_6:
        ADDS     R7,R7,#+1
??protocol_3:
        MOVS     R0,R7
        MOVS     R1,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R0,R1
        BCS.W    ??protocol_7
        LDR.W    R0,??DataTable3_5
        BL       `pop`
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,R0
        CMP      R1,#+1
        BEQ.N    ??protocol_8
        CMP      R1,#+4
        BEQ.W    ??protocol_9
        CMP      R1,#+5
        BEQ.W    ??protocol_10
        CMP      R1,#+6
        BEQ.W    ??protocol_11
        CMP      R1,#+7
        BEQ.W    ??protocol_12
        CMP      R1,#+9
        BEQ.W    ??protocol_13
        CMP      R1,#+10
        BEQ.W    ??protocol_14
        CMP      R1,#+11
        BEQ.W    ??protocol_15
        CMP      R1,#+66
        BEQ.N    ??protocol_16
        CMP      R1,#+67
        BEQ.N    ??protocol_17
        CMP      R1,#+68
        BEQ.W    ??protocol_18
        CMP      R1,#+69
        BEQ.N    ??protocol_4
        B.N      ??protocol_6
??protocol_16:
        LDR.W    R0,??DataTable3
        LDR.W    R1,??DataTable3_3
        LDRB     R1,[R1, #+0]
        ADD      R0,R0,R1
        LDRB     R1,[R0, #-1]
        LDR.W    R0,??DataTable3_8
        BL       `push`
        B.N      ??protocol_6
??protocol_17:
        LDR.W    R0,??DataTable3_1
        LDR.W    R1,??DataTable3_3
        LDRB     R1,[R1, #+0]
        ADD      R0,R0,R1
        LDRB     R1,[R0, #-1]
        LDR.W    R0,??DataTable3_8
        BL       `push`
        B.N      ??protocol_6
??protocol_8:
        LDR.W    R0,??DataTable3_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??protocol_19
        LDR.W    R0,??DataTable3_10
        LDRB     R0,[R0, #+8]
        LSLS     R0,R0,#+28
        BMI.N    ??protocol_20
        LDR.W    R0,??DataTable3_3
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable3_3
        STRB     R0,[R1, #+0]
        LDR.W    R0,??DataTable3_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+12
        BLT.N    ??protocol_21
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_3
        STRB     R0,[R1, #+0]
        B.N      ??protocol_21
??protocol_22:
        LDR.W    R0,??DataTable3_3
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable3_3
        STRB     R0,[R1, #+0]
        LDR.W    R0,??DataTable3_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+12
        BLT.N    ??protocol_21
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_3
        STRB     R0,[R1, #+0]
??protocol_21:
        LDR.W    R0,??DataTable3_2
        LDR.W    R1,??DataTable3_3
        LDRB     R1,[R1, #+0]
        LDRB     R0,[R0, R1]
        LDR.W    R1,??DataTable3_11
        LDR.W    R2,??DataTable3_3
        LDRB     R2,[R2, #+0]
        LDRB     R1,[R1, R2]
        TST      R0,R1
        BEQ.N    ??protocol_22
??protocol_20:
        MOVS     R1,#+32
        LDR.W    R0,??DataTable3_8
        BL       `push`
        LDR.W    R0,??DataTable3_2
        LDR.W    R1,??DataTable3_3
        LDRB     R1,[R1, #+0]
        LDRB     R1,[R0, R1]
        LDR.W    R0,??DataTable3_8
        BL       `push`
        B.N      ??protocol_23
??protocol_19:
        MOVS     R1,#+99
        LDR.W    R0,??DataTable3_8
        BL       `push`
??protocol_23:
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_7
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_9
        STRB     R0,[R1, #+0]
        B.N      ??protocol_6
??protocol_12:
        MOVS     R1,R0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.W    R0,??DataTable3_8
        BL       `push`
        B.N      ??protocol_6
??protocol_15:
        MOVS     R1,#+240
        LDR.W    R0,??DataTable3_8
        BL       `push`
        B.N      ??protocol_6
??protocol_10:
        MOVS     R1,#+1
        LDR.W    R0,??DataTable3_8
        BL       `push`
        B.N      ??protocol_6
??protocol_11:
        MOVS     R1,R0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.W    R0,??DataTable3_8
        BL       `push`
        B.N      ??protocol_6
??protocol_9:
        MOVS     R1,#+4
        LDR.W    R0,??DataTable3_8
        BL       `push`
        B.N      ??protocol_6
??protocol_13:
        MOVS     R1,#+9
        LDR.W    R0,??DataTable3_8
        BL       `push`
        B.N      ??protocol_6
??protocol_14:
        MOVS     R1,#+10
        LDR.W    R0,??DataTable3_8
        BL       `push`
        B.N      ??protocol_6
??protocol_18:
        MOVS     R1,#+16
        LDR.W    R0,??DataTable3_8
        BL       `push`
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_7
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_9
        STRB     R0,[R1, #+0]
        B.N      ??protocol_6
??protocol_7:
        LDR.W    R0,??DataTable3_4
        LDRB     R0,[R0, #+112]
        ADDS     R0,R6,R0
        LDR.W    R1,??DataTable3_4
        STRB     R0,[R1, #+112]
        B.N      ??protocol_0
??protocol_2:
        BL       net_init
??protocol_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BNE.N    ??protocol_24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,R5
        CMP      R0,#+1
        BEQ.N    ??protocol_25
        CMP      R0,#+255
        BEQ.N    ??protocol_26
        B.N      ??protocol_24
??protocol_25:
        MOVS     R0,#+1
        BL       net_set_default
        B.N      ??protocol_24
??protocol_26:
        BL       rfu_start
??protocol_24:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+96
        BNE.N    ??protocol_27
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+2
??protocol_27:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.W    ??protocol_28
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,R5
        CMP      R0,#+4
        BEQ.N    ??protocol_29
        CMP      R0,#+5
        BEQ.N    ??protocol_30
        CMP      R0,#+9
        BEQ.W    ??protocol_31
        CMP      R0,#+12
        BEQ.W    ??protocol_32
        CMP      R0,#+13
        BEQ.W    ??protocol_33
        B.N      ??protocol_28
??protocol_29:
        ADD      R6,SP,#+8
        LDR.W    R0,??DataTable3_5
        BL       `pop`
        STRB     R0,[R6, #+0]
        LDR.W    R0,??DataTable3_5
        BL       `pop`
        STRB     R0,[R6, #+1]
        LDR.W    R0,??DataTable3_5
        BL       `pop`
        STRB     R0,[R6, #+2]
        LDR.W    R0,??DataTable3_5
        BL       `pop`
        STRB     R0,[R6, #+3]
        LDR      R1,[SP, #+8]
        LDR.W    R0,??DataTable3_12  ;; 0xc0a00000
        BL       __aeabi_fadd
        STR      R0,[SP, #+8]
        LDR.W    R0,??DataTable3_13
        LDRB     R0,[R0, #+38]
        CMP      R0,#+0
        BEQ.N    ??protocol_34
        LDR      R1,[SP, #+8]
        MOVS     R0,#+1065353216
        BL       __aeabi_fadd
        MOVS     R1,R0
        LDR.W    R0,??DataTable3_13
        LDR      R0,[R0, #+4]
        BL       __aeabi_cfrcmple
        BLS.N    ??protocol_35
        LDR      R1,[SP, #+8]
        LDR.W    R0,??DataTable3_14  ;; 0xbf800000
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable3_13
        LDR      R1,[R1, #+4]
        BL       __aeabi_cfrcmple
        BHI.N    ??protocol_36
??protocol_35:
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_13
        STRB     R0,[R1, #+36]
??protocol_36:
        LDR      R0,[SP, #+8]
        LDR.W    R1,??DataTable3_15  ;; 0x42340000
        BL       __aeabi_cfrcmple
        BHI.N    ??protocol_37
        LDR.W    R0,??DataTable3_16  ;; 0x42480000
        STR      R0,[SP, #+8]
??protocol_37:
        LDR      R0,[SP, #+8]
        LDR.N    R1,??DataTable3_13
        STR      R0,[R1, #+4]
        LDR.N    R0,??DataTable3_13
        LDR      R1,[R0, #+4]
        MOVS     R0,#+4
        BL       wright_data_to_cam
??protocol_34:
        B.N      ??protocol_28
??protocol_30:
        ADD      R6,SP,#+16
        LDR.N    R0,??DataTable3_5
        BL       `pop`
        STRB     R0,[R6, #+0]
        LDR.N    R0,??DataTable3_5
        BL       `pop`
        STRB     R0,[R6, #+1]
        LDR.N    R0,??DataTable3_5
        BL       `pop`
        STRB     R0,[R6, #+2]
        LDR.N    R0,??DataTable3_5
        BL       `pop`
        STRB     R0,[R6, #+3]
        LDR.N    R0,??DataTable3_13
        LDRB     R0,[R0, #+39]
        CMP      R0,#+0
        BEQ.N    ??protocol_38
        LDR      R1,[SP, #+16]
        MOVS     R0,#+1065353216
        BL       __aeabi_fadd
        MOVS     R1,R0
        LDR.N    R0,??DataTable3_13
        LDR      R0,[R0, #+8]
        BL       __aeabi_cfrcmple
        BLS.N    ??protocol_39
        LDR      R1,[SP, #+16]
        LDR.N    R0,??DataTable3_14  ;; 0xbf800000
        BL       __aeabi_fadd
        LDR.N    R1,??DataTable3_13
        LDR      R1,[R1, #+8]
        BL       __aeabi_cfrcmple
        BHI.N    ??protocol_40
??protocol_39:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_13
        STRB     R0,[R1, #+36]
??protocol_40:
        LDR      R0,[SP, #+16]
        LDR.N    R1,??DataTable3_13
        STR      R0,[R1, #+8]
        LDR.N    R0,??DataTable3_13
        LDR      R1,[R0, #+8]
        MOVS     R0,#+5
        BL       wright_data_to_cam
??protocol_38:
        B.N      ??protocol_28
??protocol_32:
        ADD      R6,SP,#+4
        LDR.N    R0,??DataTable3_5
        BL       `pop`
        STRB     R0,[R6, #+0]
        LDR.N    R0,??DataTable3_5
        BL       `pop`
        STRB     R0,[R6, #+1]
        LDR.N    R0,??DataTable3_5
        BL       `pop`
        STRB     R0,[R6, #+2]
        LDR.N    R0,??DataTable3_5
        BL       `pop`
        STRB     R0,[R6, #+3]
        LDR      R0,[SP, #+4]
        LDR.N    R1,??DataTable3_17  ;; 0x42b40000
        BL       __aeabi_cfrcmple
        BHI.N    ??protocol_41
        LDR      R1,[SP, #+4]
        LDR.N    R0,??DataTable3_18  ;; 0xc3340000
        BL       __aeabi_fadd
        STR      R0,[SP, #+4]
??protocol_41:
        LDR      R0,[SP, #+4]
        LDR.N    R1,??DataTable3_19  ;; 0xc2b3ffff
        BL       __aeabi_cfcmple
        BCS.N    ??protocol_42
        LDR      R1,[SP, #+4]
        LDR.N    R0,??DataTable3_20  ;; 0x43340000
        BL       __aeabi_fadd
        STR      R0,[SP, #+4]
??protocol_42:
        LDR      R1,[SP, #+4]
        MOVS     R0,#+1065353216
        BL       __aeabi_fadd
        MOVS     R1,R0
        LDR.N    R0,??DataTable3_13
        LDR      R0,[R0, #+28]
        BL       __aeabi_cfrcmple
        BLS.N    ??protocol_43
        LDR      R1,[SP, #+4]
        LDR.N    R0,??DataTable3_14  ;; 0xbf800000
        BL       __aeabi_fadd
        LDR.N    R1,??DataTable3_13
        LDR      R1,[R1, #+28]
        BL       __aeabi_cfrcmple
        BHI.N    ??protocol_44
??protocol_43:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_13
        STRB     R0,[R1, #+36]
??protocol_44:
        LDR      R0,[SP, #+4]
        LDR.N    R1,??DataTable3_13
        STR      R0,[R1, #+28]
        B.N      ??protocol_28
??protocol_33:
        MOV      R6,SP
        LDR.N    R0,??DataTable3_5
        BL       `pop`
        STRB     R0,[R6, #+0]
        LDR.N    R0,??DataTable3_5
        BL       `pop`
        STRB     R0,[R6, #+1]
        LDR.N    R0,??DataTable3_5
        BL       `pop`
        STRB     R0,[R6, #+2]
        LDR.N    R0,??DataTable3_5
        BL       `pop`
        STRB     R0,[R6, #+3]
        LDR      R0,[SP, #+0]
        LDR.N    R1,??DataTable3_17  ;; 0x42b40000
        BL       __aeabi_cfrcmple
        BHI.N    ??protocol_45
        LDR      R1,[SP, #+0]
        LDR.N    R0,??DataTable3_18  ;; 0xc3340000
        BL       __aeabi_fadd
        STR      R0,[SP, #+0]
??protocol_45:
        LDR      R0,[SP, #+0]
        LDR.N    R1,??DataTable3_19  ;; 0xc2b3ffff
        BL       __aeabi_cfcmple
        BCS.N    ??protocol_46
        LDR      R1,[SP, #+0]
        LDR.N    R0,??DataTable3_20  ;; 0x43340000
        BL       __aeabi_fadd
        STR      R0,[SP, #+0]
??protocol_46:
        LDR      R0,[SP, #+0]
        LDR.N    R1,??DataTable3_13
        STR      R0,[R1, #+20]
        LDR      R1,[SP, #+0]
        MOVS     R0,#+1065353216
        BL       __aeabi_fadd
        MOVS     R1,R0
        LDR.N    R0,??DataTable3_13
        LDR      R0,[R0, #+20]
        BL       __aeabi_cfrcmple
        BLS.N    ??protocol_47
        LDR      R1,[SP, #+0]
        LDR.N    R0,??DataTable3_14  ;; 0xbf800000
        BL       __aeabi_fadd
        LDR.N    R1,??DataTable3_13
        LDR      R1,[R1, #+20]
        BL       __aeabi_cfrcmple
        BHI.N    ??protocol_48
??protocol_47:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_13
        STRB     R0,[R1, #+36]
??protocol_48:
        LDR.N    R0,??DataTable3_13
        LDR      R1,[R0, #+20]
        MOVS     R0,#+12
        BL       wright_data_to_cam
        B.N      ??protocol_28
??protocol_31:
        ADD      R6,SP,#+12
        LDR.N    R0,??DataTable3_5
        BL       `pop`
        STRB     R0,[R6, #+0]
        LDR.N    R0,??DataTable3_5
        BL       `pop`
        STRB     R0,[R6, #+1]
        LDR.N    R0,??DataTable3_5
        BL       `pop`
        STRB     R0,[R6, #+2]
        LDR.N    R0,??DataTable3_5
        BL       `pop`
        STRB     R0,[R6, #+3]
        LDR      R0,[SP, #+12]
        LDR.N    R1,??DataTable3_13
        STR      R0,[R1, #+32]
        LDR      R1,[SP, #+12]
        MOVS     R0,#+1065353216
        BL       __aeabi_fadd
        MOVS     R1,R0
        LDR.N    R0,??DataTable3_13
        LDR      R0,[R0, #+32]
        BL       __aeabi_cfrcmple
        BLS.N    ??protocol_49
        LDR      R1,[SP, #+12]
        LDR.N    R0,??DataTable3_14  ;; 0xbf800000
        BL       __aeabi_fadd
        LDR.N    R1,??DataTable3_13
        LDR      R1,[R1, #+32]
        BL       __aeabi_cfrcmple
        BHI.N    ??protocol_50
??protocol_49:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_13
        STRB     R0,[R1, #+36]
??protocol_50:
??protocol_28:
        MOVS     R0,R4
        LDR.N    R1,??DataTable3_21
        LDRB     R1,[R1, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,R1
        BNE.N    ??protocol_51
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable3_21
        LDR      R1,[R1, #+4]
        BLX      R1
??protocol_51:
        MOVS     R0,R4
        LDR.N    R1,??DataTable3_22
        LDRB     R1,[R1, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,R1
        BNE.N    ??protocol_52
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable3_22
        LDR      R1,[R1, #+4]
        BLX      R1
??protocol_52:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+8
        BNE.N    ??protocol_53
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       lpd_requests
??protocol_53:
        LDR.N    R0,??DataTable3_5
        BL       clean
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_23
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_24
        STRH     R0,[R1, #+0]
        ADD      SP,SP,#+20
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
redrow_menu_simbol:
        PUSH     {R7,LR}
        LDR.N    R0,??DataTable3_2
        LDR.N    R1,??DataTable3_3
        LDRB     R1,[R1, #+0]
        LDRB     R0,[R0, R1]
        LDR.N    R1,??DataTable3_11
        LDR.N    R2,??DataTable3_3
        LDRB     R2,[R2, #+0]
        LDRB     R1,[R1, R2]
        TST      R0,R1
        BNE.N    ??redrow_menu_simbol_0
        LDR.N    R0,??DataTable3_3
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable3_3
        STRB     R0,[R1, #+0]
        LDR.N    R0,??DataTable3_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+12
        BLT.N    ??redrow_menu_simbol_1
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_3
        STRB     R0,[R1, #+0]
        B.N      ??redrow_menu_simbol_1
??redrow_menu_simbol_2:
        LDR.N    R0,??DataTable3_3
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable3_3
        STRB     R0,[R1, #+0]
        LDR.N    R0,??DataTable3_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+12
        BLT.N    ??redrow_menu_simbol_1
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_3
        STRB     R0,[R1, #+0]
??redrow_menu_simbol_1:
        LDR.N    R0,??DataTable3_2
        LDR.N    R1,??DataTable3_3
        LDRB     R1,[R1, #+0]
        LDRB     R0,[R0, R1]
        LDR.N    R1,??DataTable3_11
        LDR.N    R2,??DataTable3_3
        LDRB     R2,[R2, #+0]
        LDRB     R1,[R1, R2]
        TST      R0,R1
        BEQ.N    ??redrow_menu_simbol_2
??redrow_menu_simbol_0:
        MOVS     R1,#+32
        LDR.N    R0,??DataTable3_8
        BL       `push`
        LDR.N    R0,??DataTable3_2
        LDR.N    R1,??DataTable3_3
        LDRB     R1,[R1, #+0]
        LDRB     R1,[R0, R1]
        LDR.N    R0,??DataTable3_8
        BL       `push`
        LDR.N    R0,??DataTable3_25
        LDRB     R0,[R0, #+16]
        LSLS     R0,R0,#+25
        BPL.N    ??redrow_menu_simbol_3
        LDR.N    R0,??DataTable3_26  ;; 0x443b8000
        LDR.N    R1,??DataTable3_13
        STR      R0,[R1, #+8]
        LDR.N    R0,??DataTable3_13
        LDR      R1,[R0, #+8]
        MOVS     R0,#+5
        BL       wright_data_to_cam
        LDR.N    R0,??DataTable3_27  ;; 0x41700000
        LDR.N    R1,??DataTable3_13
        STR      R0,[R1, #+4]
        LDR.N    R0,??DataTable3_13
        LDR      R1,[R0, #+4]
        MOVS     R0,#+4
        BL       wright_data_to_cam
??redrow_menu_simbol_3:
        MOV      R0,#+1000
        LDR.N    R1,??DataTable3_6
        STRH     R0,[R1, #+0]
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     encoder_plus_buf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     encoder_minus_buf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     encoder_func_buf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     encoder_func_count

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     keys

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     RXbuf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     error_counter

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_7:
        DC32     fuck_next_command

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_8:
        DC32     keys+0x64

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_9:
        DC32     fuck_power_off_command

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_10:
        DC32     spi_sets

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_11:
        DC32     encoder0_masks_buf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_12:
        DC32     0xc0a00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_13:
        DC32     senspar

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_14:
        DC32     0xbf800000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_15:
        DC32     0x42340000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_16:
        DC32     0x42480000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_17:
        DC32     0x42b40000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_18:
        DC32     0xc3340000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_19:
        DC32     0xc2b3ffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_20:
        DC32     0x43340000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_21:
        DC32     encoder1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_22:
        DC32     encoder0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_23:
        DC32     task_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_24:
        DC32     counter_sys

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_25:
        DC32     flash

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_26:
        DC32     0x443b8000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_27:
        DC32     0x41700000

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
//    65 bytes in section .bss
//    73 bytes in section .data
// 1 970 bytes in section .text
// 
// 1 970 bytes of CODE memory
//   138 bytes of DATA memory
//
//Errors: none
//Warnings: 7
