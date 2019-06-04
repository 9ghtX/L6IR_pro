///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.70.1.11437/W32 for ARM      18/Apr/2019  18:40:16
// Copyright 1999-2016 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\projects\L6IR\programm\L6_pro\Ball.cpp
//    Command line =  
//        E:\projects\L6IR\programm\L6_pro\Ball.cpp -D USE_STDPERIPH_DRIVER -D
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
//    List file    =  E:\projects\L6IR\programm\L6_pro\Release\List\Ball.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_cfcmpeq
        EXTERN __aeabi_cfcmple
        EXTERN __aeabi_cfrcmple
        EXTERN __aeabi_d2f
        EXTERN __aeabi_d2iz
        EXTERN __aeabi_dadd
        EXTERN __aeabi_ddiv
        EXTERN __aeabi_dmul
        EXTERN __aeabi_dsub
        EXTERN __aeabi_f2d
        EXTERN __aeabi_fadd
        EXTERN __aeabi_fdiv
        EXTERN __aeabi_fmul
        EXTERN __aeabi_fsub
        EXTERN exp
        EXTERN floor
        EXTERN pow
        EXTERN sin

        PUBLIC K3
        PUBLIC balCalculate
        PUBLIC bullet
        PUBLIC default_ball_ini
        PUBLIC senspar
        PUBLIC weapon


        SECTION `.data`:DATA:REORDER:NOROOT(2)
        DATA
// static __absolute float stepen[10][5]
stepen:
        DC32 3F2BC6A8H, 3F29374CH, 3F283127H, 3F272B02H, 3F272B02H, 3F19999AH
        DC32 3F133333H, 3F0ED917H, 3F0BC6A8H, 3F09BA5EH, 3F0F1AA0H, 3F072B02H
        DC32 3F028F5CH, 3EFF7CEEH, 3EFBE76DH, 3F083127H, 3F00C49CH, 3EF8D4FEH
        DC32 3EF4BC6AH, 3EF2B021H, 3EF4BC6AH, 3EEF1AA0H, 3EED9168H, 3EED0E56H
        DC32 3EED0E56H, 3EF22D0EH, 3EED9168H, 3EEC8B44H, 3EEC0831H, 3EEC0831H
        DC32 3EF020C5H, 3EEC8B44H, 3EEB851FH, 3EEB020CH, 3EEB020CH, 3EEE978DH
        DC32 3EEB851FH, 3EEA7EFAH, 3EE9FBE7H, 3EE9FBE7H, 3EED9168H, 3EEA7EFAH
        DC32 3EE9FBE7H, 3EE978D5H, 3EE8F5C3H, 3EEC8B44H, 3EE9FBE7H, 3EE8F5C3H
        DC32 3EE872B0H, 3EE7EF9EH

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
weapon:
        DS8 24

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
bullet:
        DS8 16

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
senspar:
        DS8 40

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
default_ball_ini:
        LDR.W    R0,??DataTable2  ;; 0x44660000
        LDR.W    R1,??DataTable2_1
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable2_2  ;; 0x3ee66666
        LDR.W    R1,??DataTable2_1
        STR      R0,[R1, #+4]
        LDR.W    R0,??DataTable2_3  ;; 0x42c80000
        LDR.W    R1,??DataTable2_4
        STR      R0,[R1, #+4]
        MOVS     R0,#+1082130432
        LDR.W    R1,??DataTable2_5
        STR      R0,[R1, #+12]
        LDR.W    R0,??DataTable2_6  ;; 0x41f00000
        LDR.W    R1,??DataTable2_5
        STR      R0,[R1, #+16]
        LDR.W    R0,??DataTable2_7  ;; 0x41700000
        LDR.W    R1,??DataTable2_5
        STR      R0,[R1, #+4]
        LDR.W    R0,??DataTable2_8  ;; 0x42200000
        LDR.W    R1,??DataTable2_4
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable2_9  ;; 0x41200000
        LDR.W    R1,??DataTable2_4
        STR      R0,[R1, #+16]
        LDR.W    R0,??DataTable2_10  ;; 0x443b8000
        LDR.W    R1,??DataTable2_4
        STR      R0,[R1, #+8]
        LDR.W    R0,??DataTable2_11  ;; 0x443c0000
        LDR.W    R1,??DataTable2_5
        STR      R0,[R1, #+8]
        LDR.W    R0,??DataTable2_3  ;; 0x42c80000
        LDR.W    R1,??DataTable2_5
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
balCalculate:
        PUSH     {R0,R2,R3}
        PUSH     {R4-R11,LR}
        SUB      SP,SP,#+64
        MOVS     R0,R1
        MOVS     R1,#+0
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable2_12  ;; 0xc9eecbfb
        LDR.W    R3,??DataTable2_13  ;; 0x3fed42c3
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        STR      R0,[SP, #+16]
        LDR      R0,[SP, #+108]
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable2_14  ;; 0xdbf487fd
        LDR.W    R3,??DataTable2_15  ;; 0x3fd381d7
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        STR      R0,[SP, #+24]
        LDR      R4,[SP, #+116]
        MOVS     R0,#+0
        STR      R0,[SP, #+48]
        LDR      R0,[SP, #+120]
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable2_12  ;; 0xc9eecbfb
        LDR.W    R3,??DataTable2_13  ;; 0x3fed42c3
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        STR      R0,[SP, #+20]
        LDR.W    R0,??DataTable2_5
        LDR      R0,[R0, #+12]
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable2_16  ;; 0xa9003eea
        LDR.W    R3,??DataTable2_17  ;; 0x3fdc9c4d
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        STR      R0,[SP, #+44]
        LDR.W    R0,??DataTable2_5
        LDR      R0,[R0, #+16]
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable2_18  ;; 0x403e0000
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        STR      R0,[SP, #+40]
        LDR.W    R0,??DataTable2_5
        LDR      R7,[R0, #+4]
        LDR.W    R5,??DataTable2_3  ;; 0x42c80000
        LDR.W    R0,??DataTable2_5
        LDR      R0,[R0, #+8]
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable2_19  ;; 0xb71758e2
        LDR.W    R3,??DataTable2_20  ;; 0x3fe800d1
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        MOV      R11,R0
        LDR      R0,[SP, #+136]
        BL       __aeabi_f2d
        MOVS     R2,#+1717986918
        LDR.W    R3,??DataTable2_21  ;; 0x40396666
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        STR      R0,[SP, #+32]
        LDR      R0,[SP, #+132]
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable2_22  ;; 0x851eb852
        LDR.W    R3,??DataTable2_23  ;; 0x400451eb
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        STR      R0,[SP, #+36]
        LDR.W    R0,??DataTable2_24  ;; 0x3f866666
        STR      R0,[SP, #+28]
        LDR      R0,[SP, #+128]
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable2_19  ;; 0xb71758e2
        LDR.W    R3,??DataTable2_20  ;; 0x3fe800d1
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        MOV      R10,R0
        LDR.W    R8,??DataTable2_25  ;; 0x43760000
        LDR.W    R0,??DataTable2_1
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable2_26  ;; 0xc072c000
        BL       __aeabi_dadd
        MOVS     R2,#+0
        LDR.W    R3,??DataTable2_27  ;; 0x40590000
        BL       __aeabi_ddiv
        MOVS     R2,#+0
        LDR.W    R3,??DataTable2_28  ;; 0x3fe00000
        BL       __aeabi_dadd
        BL       floor
        BL       __aeabi_d2iz
        MOVS     R6,R0
        MOVS     R0,R4
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable2_29  ;; 0x9999999a
        LDR.W    R3,??DataTable2_30  ;; 0xbfc99999
        BL       __aeabi_dadd
        MOVS     R2,#+0
        LDR.W    R3,??DataTable2_31  ;; 0x40240000
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.W    R3,??DataTable2_28  ;; 0x3fe00000
        BL       __aeabi_dadd
        BL       floor
        BL       __aeabi_d2iz
        LDR.W    R1,??DataTable2_32
        MOVS     R2,#+20
        MUL      R2,R2,R6
        ADD      R1,R1,R2
        LDR      R6,[R1, R0, LSL #+2]
        MOVS     R0,R7
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable2_33  ;; 0xcccccccd
        LDR.W    R3,??DataTable2_34  ;; 0x3ffccccc
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.W    R3,??DataTable2_35  ;; 0x40400000
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        MOVS     R7,R0
        MOVS     R0,R4
        MOV      R1,R8
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        STRD     R0,R1,[SP, #+0]
        MOVS     R0,R6
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOV      R8,R2
        MOV      R9,R3
        LDR      R0,[SP, #+24]
        BL       __aeabi_f2d
        MOV      R2,R8
        MOV      R3,R9
        BL       pow
        LDRD     R2,R3,[SP, #+0]
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        BL       __aeabi_f2d
        MOV      R8,R0
        MOV      R9,R1
        MOVS     R0,R7
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable2_36  ;; 0x407cc000
        BL       __aeabi_dadd
        MOV      R2,R8
        MOV      R3,R9
        BL       __aeabi_dmul
        MOVS     R6,R0
        MOVS     R7,R1
        MOVS     R0,R5
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable2_37  ;; 0x40718000
        BL       __aeabi_ddiv
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2_38  ;; 0x40803800
        BL       __aeabi_dsub
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R6
        MOVS     R1,R7
        BL       __aeabi_ddiv
        MOVS     R6,R0
        MOVS     R7,R1
        MOVS     R0,R5
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable2_39  ;; 0x40dee980
        BL       __aeabi_ddiv
        BL       exp
        MOVS     R2,R6
        MOVS     R3,R7
        BL       __aeabi_dmul
        MOVS     R4,R0
        MOVS     R5,R1
        MOV      R0,R11
        MOV      R1,R10
        BL       __aeabi_fdiv
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,#+0
        MOVS     R1,#+1073741824
        BL       __aeabi_dsub
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        MOVS     R4,R0
        LDR      R0,[SP, #+24]
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        LDR.W    R0,??DataTable2_40  ;; 0x3d70a3d7
        LDR.W    R1,??DataTable2_41  ;; 0x4044d70a
        BL       __aeabi_ddiv
        STRD     R0,R1,[SP, #+0]
        LDR      R0,[SP, #+20]
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2_42  ;; 0x3ff00000
        BL       __aeabi_ddiv
        MOV      R10,R0
        MOV      R11,R1
        MOVS     R0,R4
        BL       __aeabi_f2d
        MOV      R8,R0
        MOV      R9,R1
        LDR      R0,[SP, #+20]
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable2_43  ;; 0x4d551d69
        LDR.W    R3,??DataTable2_44  ;; 0x3f0f7510
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.W    R3,??DataTable2_45  ;; 0x3fe80000
        BL       __aeabi_dadd
        MOVS     R2,#+0
        LDR.W    R3,??DataTable2_28  ;; 0x3fe00000
        BL       __aeabi_dmul
        MOVS     R6,R0
        MOVS     R7,R1
        LDR      R0,[SP, #+20]
        BL       __aeabi_f2d
        MOVS     R2,R6
        MOVS     R3,R7
        BL       __aeabi_dmul
        MOVS     R2,R0
        MOVS     R3,R1
        MOV      R0,R8
        MOV      R1,R9
        BL       __aeabi_dsub
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2_42  ;; 0x3ff00000
        BL       __aeabi_ddiv
        MOVS     R2,R0
        MOVS     R3,R1
        MOV      R0,R10
        MOV      R1,R11
        BL       __aeabi_dsub
        MOVS     R2,R0
        MOVS     R3,R1
        LDRD     R0,R1,[SP, #+0]
        BL       __aeabi_ddiv
        MOVS     R2,R0
        MOVS     R3,R1
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        MOV      R8,R0
        LDR      R5,[SP, #+16]
        LDR      R0,[SP, #+24]
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        LDR.W    R0,??DataTable2_40  ;; 0x3d70a3d7
        LDR.W    R1,??DataTable2_41  ;; 0x4044d70a
        BL       __aeabi_ddiv
        STRD     R0,R1,[SP, #+8]
        MOVS     R0,R5
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2_42  ;; 0x3ff00000
        BL       __aeabi_ddiv
        STRD     R0,R1,[SP, #+0]
        MOVS     R0,R4
        BL       __aeabi_f2d
        MOV      R10,R0
        MOV      R11,R1
        MOVS     R0,R5
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable2_43  ;; 0x4d551d69
        LDR.W    R3,??DataTable2_44  ;; 0x3f0f7510
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.W    R3,??DataTable2_45  ;; 0x3fe80000
        BL       __aeabi_dadd
        MOVS     R2,#+0
        LDR.N    R3,??DataTable2_28  ;; 0x3fe00000
        BL       __aeabi_dmul
        MOVS     R6,R0
        MOVS     R7,R1
        MOVS     R0,R5
        BL       __aeabi_f2d
        MOVS     R2,R6
        MOVS     R3,R7
        BL       __aeabi_dmul
        MOVS     R2,R0
        MOVS     R3,R1
        MOV      R0,R10
        MOV      R1,R11
        BL       __aeabi_dsub
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_42  ;; 0x3ff00000
        BL       __aeabi_ddiv
        MOVS     R2,R0
        MOVS     R3,R1
        LDRD     R0,R1,[SP, #+0]
        BL       __aeabi_dsub
        MOVS     R2,R0
        MOVS     R3,R1
        LDRD     R0,R1,[SP, #+8]
        BL       __aeabi_ddiv
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R2
        MOVS     R1,R3
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        MOVS     R6,R0
        LDR      R0,[SP, #+32]
        MOV      R1,R8
        BL       __aeabi_fadd
        LDR      R1,[SP, #+48]
        BL       __aeabi_fadd
        MOVS     R1,R5
        BL       __aeabi_fmul
        LDR      R1,[SP, #+20]
        BL       __aeabi_fdiv
        MOVS     R7,R0
        LDR      R0,[SP, #+32]
        MOVS     R1,R6
        BL       __aeabi_fadd
        MOVS     R1,R0
        MOVS     R0,R7
        BL       __aeabi_fsub
        EORS     R0,R0,#0x80000000
        MOVS     R1,R5
        BL       __aeabi_fdiv
        LDR      R1,[SP, #+28]
        BL       __aeabi_fdiv
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.N    R3,??DataTable2_27  ;; 0x40590000
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        MOVS     R6,R0
        MOVS     R0,R5
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable2_33  ;; 0xcccccccd
        LDR.N    R3,??DataTable2_46  ;; 0x4053cccc
        BL       __aeabi_dmul
        MOV      R8,R0
        MOV      R9,R1
        LDR      R0,[SP, #+44]
        BL       __aeabi_f2d
        MOV      R2,R8
        MOV      R3,R9
        BL       __aeabi_dmul
        MOV      R8,R0
        MOV      R9,R1
        LDR      R0,[SP, #+24]
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOV      R0,R8
        MOV      R1,R9
        BL       __aeabi_ddiv
        MOV      R8,R0
        MOV      R9,R1
        MOVS     R0,R4
        MOVS     R1,R5
        BL       __aeabi_fdiv
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.N    R3,??DataTable2_47  ;; 0xbff00000
        BL       __aeabi_dadd
        MOVS     R2,#+0
        LDR.N    R3,??DataTable2_48  ;; 0xbfe00000
        BL       __aeabi_dadd
        MOVS     R2,R0
        MOVS     R3,R1
        MOV      R0,R8
        MOV      R1,R9
        BL       __aeabi_ddiv
        MOV      R8,R0
        MOV      R9,R1
        MOVS     R0,R5
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOV      R0,R8
        MOV      R1,R9
        BL       __aeabi_ddiv
        MOVS     R4,R0
        MOVS     R5,R1
        LDR      R0,[SP, #+28]
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R4
        MOVS     R1,R5
        BL       __aeabi_ddiv
        MOVS     R2,#+0
        LDR.N    R3,??DataTable2_27  ;; 0x40590000
        BL       __aeabi_dmul
        MOVS     R4,R0
        MOVS     R5,R1
        LDR      R0,[SP, #+40]
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.N    R3,??DataTable2_49  ;; 0x40280000
        BL       __aeabi_ddiv
        MOVS     R2,#+0
        MOVS     R3,#+1073741824
        BL       __aeabi_dmul
        LDR.N    R2,??DataTable2_50  ;; 0x4d12d84a
        LDR.N    R3,??DataTable2_51  ;; 0x400921fb
        BL       __aeabi_dmul
        BL       sin
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        MOVS     R7,R0
        LDR      R0,[SP, #+16]
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable2_12  ;; 0xc9eecbfb
        LDR.N    R3,??DataTable2_13  ;; 0x3fed42c3
        BL       __aeabi_ddiv
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R2
        MOVS     R1,R3
        BL       __aeabi_dmul
        MOVS     R4,R0
        MOVS     R5,R1
        LDR      R0,[SP, #+36]
        MOVS     R1,#+1082130432
        BL       __aeabi_fdiv
        MOVS     R1,R0
        LDR.N    R0,??DataTable2_52  ;; 0x40c00000
        BL       __aeabi_fsub
        BL       __aeabi_f2d
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.N    R3,??DataTable2_53  ;; 0x414631a4
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        MOVS     R4,R0
        LDR      R0,[SP, #+16]
        MOVS     R1,#+0
        BL       __aeabi_cfcmpeq
        BNE.N    ??balCalculate_0
        MOVS     R6,#+0
        MOVS     R7,#+0
        MOVS     R4,#+0
??balCalculate_0:
        MOVS     R0,R6
        LDR.N    R1,??DataTable2_54  ;; 0x461c3c01
        BL       __aeabi_cfrcmple
        BHI.N    ??balCalculate_1
        LDR.N    R6,??DataTable2_55  ;; 0x461c3c00
??balCalculate_1:
        MOVS     R0,R6
        LDR.N    R1,??DataTable2_56  ;; 0xc61c3c00
        BL       __aeabi_cfcmple
        BCS.N    ??balCalculate_2
        LDR.N    R6,??DataTable2_56  ;; 0xc61c3c00
??balCalculate_2:
        MOVS     R0,R6
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable2_57  ;; 0xe0a77524
        LDR.N    R3,??DataTable2_58  ;; 0x3f9dc995
        BL       __aeabi_dmul
        LDR.N    R2,??DataTable2_12  ;; 0xc9eecbfb
        LDR.N    R3,??DataTable2_13  ;; 0x3fed42c3
        BL       __aeabi_dmul
        MOV      R8,R0
        MOV      R9,R1
        LDR      R0,[SP, #+16]
        BL       __aeabi_f2d
        MOV      R2,R8
        MOV      R3,R9
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        STR      R0,[SP, #+52]
        LDR.N    R0,??DataTable2_59
        LDR      R0,[R0, #+0]
        MOVS     R1,R6
        BL       __aeabi_cfcmpeq
        BEQ.N    ??balCalculate_3
        MOVS     R1,#+1
??balCalculate_3:
        LDR.N    R0,??DataTable2_59
        STR      R6,[R0, #+0]
        MOVS     R0,R7
        MOVS     R1,R4
        BL       __aeabi_fadd
        MOVS     R6,R0
        MOVS     R0,R6
        LDR.N    R1,??DataTable2_54  ;; 0x461c3c01
        BL       __aeabi_cfrcmple
        BHI.N    ??balCalculate_4
        LDR.N    R6,??DataTable2_55  ;; 0x461c3c00
??balCalculate_4:
        MOVS     R0,R6
        LDR.N    R1,??DataTable2_56  ;; 0xc61c3c00
        BL       __aeabi_cfcmple
        BCS.N    ??balCalculate_5
        LDR.N    R6,??DataTable2_56  ;; 0xc61c3c00
??balCalculate_5:
        MOVS     R0,R6
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable2_57  ;; 0xe0a77524
        LDR.N    R3,??DataTable2_58  ;; 0x3f9dc995
        BL       __aeabi_dmul
        LDR.N    R2,??DataTable2_12  ;; 0xc9eecbfb
        LDR.N    R3,??DataTable2_13  ;; 0x3fed42c3
        BL       __aeabi_dmul
        MOVS     R4,R0
        MOVS     R5,R1
        LDR      R0,[SP, #+16]
        BL       __aeabi_f2d
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        STR      R0,[SP, #+56]
        LDR.N    R0,??DataTable2_60
        LDR      R0,[R0, #+0]
        MOVS     R1,R6
        BL       __aeabi_cfcmpeq
        BEQ.N    ??balCalculate_6
        MOVS     R0,#+1
        STRB     R0,[SP, #+60]
??balCalculate_6:
        LDR.N    R0,??DataTable2_60
        STR      R6,[R0, #+0]
        LDR      R0,[SP, #+100]
        ADD      R1,SP,#+52
        LDM      R1!,{R2-R4}
        STM      R0!,{R2-R4}
        SUBS     R1,R1,#+12
        SUBS     R0,R0,#+12
        ADD      SP,SP,#+64
        POP      {R4-R11}
        LDR      PC,[SP], #+16    ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
`balCalculate::pref_correct_g`:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
`balCalculate::pref_correct_v`:
        DS8 4

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
K3:
        PUSH     {R4,R6,R7,LR}
        MOVS     R4,R0
        MOVS     R0,R4
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable2_43  ;; 0x4d551d69
        LDR.N    R3,??DataTable2_44  ;; 0x3f0f7510
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.N    R3,??DataTable2_45  ;; 0x3fe80000
        BL       __aeabi_dadd
        MOVS     R2,#+0
        LDR.N    R3,??DataTable2_28  ;; 0x3fe00000
        BL       __aeabi_dmul
        MOVS     R6,R0
        MOVS     R7,R1
        MOVS     R0,R4
        BL       __aeabi_f2d
        MOVS     R2,R6
        MOVS     R3,R7
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        POP      {R4,R6,R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     0x44660000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     bullet

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     0x3ee66666

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     0x42c80000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     weapon

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     senspar

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     0x41f00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     0x41700000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_8:
        DC32     0x42200000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_9:
        DC32     0x41200000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_10:
        DC32     0x443b8000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_11:
        DC32     0x443c0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_12:
        DC32     0xc9eecbfb

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_13:
        DC32     0x3fed42c3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_14:
        DC32     0xdbf487fd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_15:
        DC32     0x3fd381d7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_16:
        DC32     0xa9003eea

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_17:
        DC32     0x3fdc9c4d

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_18:
        DC32     0x403e0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_19:
        DC32     0xb71758e2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_20:
        DC32     0x3fe800d1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_21:
        DC32     0x40396666

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_22:
        DC32     0x851eb852

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_23:
        DC32     0x400451eb

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_24:
        DC32     0x3f866666

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_25:
        DC32     0x43760000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_26:
        DC32     0xc072c000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_27:
        DC32     0x40590000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_28:
        DC32     0x3fe00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_29:
        DC32     0x9999999a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_30:
        DC32     0xbfc99999

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_31:
        DC32     0x40240000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_32:
        DC32     stepen

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_33:
        DC32     0xcccccccd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_34:
        DC32     0x3ffccccc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_35:
        DC32     0x40400000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_36:
        DC32     0x407cc000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_37:
        DC32     0x40718000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_38:
        DC32     0x40803800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_39:
        DC32     0x40dee980

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_40:
        DC32     0x3d70a3d7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_41:
        DC32     0x4044d70a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_42:
        DC32     0x3ff00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_43:
        DC32     0x4d551d69

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_44:
        DC32     0x3f0f7510

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_45:
        DC32     0x3fe80000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_46:
        DC32     0x4053cccc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_47:
        DC32     0xbff00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_48:
        DC32     0xbfe00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_49:
        DC32     0x40280000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_50:
        DC32     0x4d12d84a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_51:
        DC32     0x400921fb

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_52:
        DC32     0x40c00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_53:
        DC32     0x414631a4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_54:
        DC32     0x461c3c01

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_55:
        DC32     0x461c3c00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_56:
        DC32     0xc61c3c00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_57:
        DC32     0xe0a77524

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_58:
        DC32     0x3f9dc995

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_59:
        DC32     `balCalculate::pref_correct_v`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_60:
        DC32     `balCalculate::pref_correct_g`

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
//    88 bytes in section .bss
//   200 bytes in section .data
// 1 978 bytes in section .text
// 
// 1 978 bytes of CODE memory
//   288 bytes of DATA memory
//
//Errors: none
//Warnings: 1
