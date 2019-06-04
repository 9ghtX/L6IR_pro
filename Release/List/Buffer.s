///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.70.1.11437/W32 for ARM      18/Apr/2019  18:40:16
// Copyright 1999-2016 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\projects\L6IR\programm\L6_pro\Buffer.cpp
//    Command line =  
//        E:\projects\L6IR\programm\L6_pro\Buffer.cpp -D USE_STDPERIPH_DRIVER
//        -D STM32L1XX_MD -D FR14745600 -D nFR11059200 -D L6IR_CU -D nPT2_MODE
//        -D PT7_MODE -D nTABLE_BAL -D nTNM_MODE -D nSWIR_MODE -D nA3G4250D -D
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
//    List file    =  E:\projects\L6IR\programm\L6_pro\Release\List\Buffer.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC IniRingBuf
        PUBLIC check_crc
        PUBLIC clean
        PUBLIC del_stsp
        PUBLIC dow_crc
        PUBLIC get
        PUBLIC get_empty
        PUBLIC get_fill
        PUBLIC get_free
        PUBLIC get_full
        PUBLIC insert_crc
        PUBLIC insert_stsp
        PUBLIC ipop
        PUBLIC ipush
        PUBLIC next
        PUBLIC `pop`
        PUBLIC `push`


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
IniRingBuf:
        STRB     R1,[R2, #+0]
        STR      R0,[R2, #+4]
        MOVS     R0,#+0
        STRB     R0,[R2, #+8]
        LDRB     R0,[R2, #+8]
        STRB     R0,[R2, #+9]
        MOVS     R0,#+1
        STRB     R0,[R2, #+10]
        MOVS     R0,#+0
        STRB     R0,[R2, #+11]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
get_empty:
        LDRB     R0,[R0, #+10]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
get_full:
        LDRB     R0,[R0, #+11]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
get_free:
        LDRB     R1,[R0, #+11]
        CMP      R1,#+0
        BEQ.N    ??get_free_0
        MOVS     R0,#+0
        B.N      ??get_free_1
??get_free_0:
        LDRB     R1,[R0, #+10]
        CMP      R1,#+0
        BEQ.N    ??get_free_2
        LDRB     R0,[R0, #+0]
        B.N      ??get_free_1
??get_free_2:
        LDRB     R1,[R0, #+8]
        LDRB     R2,[R0, #+9]
        CMP      R1,R2
        BCS.N    ??get_free_3
        LDRB     R1,[R0, #+8]
        LDRB     R2,[R0, #+0]
        ADDS     R1,R2,R1
        LDRB     R0,[R0, #+9]
        SUBS     R0,R1,R0
        B.N      ??get_free_1
??get_free_3:
        LDRB     R1,[R0, #+8]
        LDRB     R0,[R0, #+9]
        SUBS     R0,R1,R0
??get_free_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
get_fill:
        LDRB     R1,[R0, #+10]
        CMP      R1,#+0
        BEQ.N    ??get_fill_0
        MOVS     R0,#+0
        B.N      ??get_fill_1
??get_fill_0:
        LDRB     R1,[R0, #+11]
        CMP      R1,#+0
        BEQ.N    ??get_fill_2
        LDRB     R0,[R0, #+0]
        B.N      ??get_fill_1
??get_fill_2:
        LDRB     R1,[R0, #+8]
        LDRB     R2,[R0, #+9]
        CMP      R1,R2
        BCS.N    ??get_fill_3
        LDRB     R1,[R0, #+9]
        LDRB     R0,[R0, #+8]
        SUBS     R0,R1,R0
        B.N      ??get_fill_1
??get_fill_3:
        LDRB     R1,[R0, #+0]
        LDRB     R2,[R0, #+9]
        ADDS     R1,R2,R1
        LDRB     R0,[R0, #+8]
        SUBS     R0,R1,R0
??get_fill_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
clean:
        LDRB     R1,[R0, #+9]
        STRB     R1,[R0, #+8]
        MOVS     R1,#+1
        STRB     R1,[R0, #+10]
        MOVS     R1,#+0
        STRB     R1,[R0, #+11]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
`push`:
        LDRB     R2,[R0, #+11]
        CMP      R2,#+0
        BNE.N    ??push_0
        LDRB     R2,[R0, #+9]
        ADDS     R3,R2,#+1
        STRB     R3,[R0, #+9]
        LDR      R3,[R0, #+4]
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        STRB     R1,[R3, R2]
        LDRB     R1,[R0, #+9]
        LDRB     R2,[R0, #+0]
        CMP      R1,R2
        BCC.N    ??push_1
        MOVS     R1,#+0
        STRB     R1,[R0, #+9]
??push_1:
        LDRB     R1,[R0, #+9]
        LDRB     R2,[R0, #+8]
        CMP      R1,R2
        BNE.N    ??push_2
        MOVS     R1,#+1
        STRB     R1,[R0, #+11]
??push_2:
        MOVS     R1,#+0
        STRB     R1,[R0, #+10]
??push_0:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
`pop`:
        LDRB     R2,[R0, #+10]
        CMP      R2,#+0
        BNE.N    ??pop_0
        LDRB     R1,[R0, #+8]
        ADDS     R2,R1,#+1
        STRB     R2,[R0, #+8]
        LDR      R2,[R0, #+4]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDRB     R1,[R2, R1]
        LDRB     R2,[R0, #+8]
        LDRB     R3,[R0, #+0]
        CMP      R2,R3
        BCC.N    ??pop_1
        MOVS     R2,#+0
        STRB     R2,[R0, #+8]
??pop_1:
        LDRB     R2,[R0, #+9]
        LDRB     R3,[R0, #+8]
        CMP      R2,R3
        BNE.N    ??pop_2
        MOVS     R2,#+1
        STRB     R2,[R0, #+10]
??pop_2:
        MOVS     R2,#+0
        STRB     R2,[R0, #+11]
??pop_0:
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
get:
        LDR      R1,[R0, #+4]
        LDRB     R0,[R0, #+8]
        LDRB     R0,[R1, R0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ipush:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R0,R5
        MOVS     R1,R0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        BL       `push`
        ASRS     R0,R5,#+8
        MOVS     R1,R0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        BL       `push`
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ipop:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R0,R4
        BL       `pop`
        MOVS     R5,R0
        MOVS     R0,R4
        BL       `pop`
        ORRS     R5,R5,R0, LSL #+8
        MOVS     R0,R5
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
insert_stsp:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R0,R4
        BL       get_fill
        MOVS     R6,R0
        MOVS     R1,#+36
        MOVS     R0,R4
        BL       `push`
        MOVS     R7,#+0
        B.N      ??insert_stsp_0
??insert_stsp_1:
        MOVS     R0,R4
        BL       `pop`
        MOVS     R5,R0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+36
        BEQ.N    ??insert_stsp_2
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+47
        BEQ.N    ??insert_stsp_2
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+59
        BNE.N    ??insert_stsp_3
??insert_stsp_2:
        MOVS     R1,#+47
        MOVS     R0,R4
        BL       `push`
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MVNS     R5,R5
??insert_stsp_3:
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        BL       `push`
        ADDS     R7,R7,#+1
??insert_stsp_0:
        MOVS     R0,R7
        MOVS     R1,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R0,R1
        BCC.N    ??insert_stsp_1
        MOVS     R1,#+59
        MOVS     R0,R4
        BL       `push`
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
del_stsp:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R0,R4
        BL       get_fill
        MOVS     R5,R0
        MOVS     R6,#+0
        B.N      ??del_stsp_0
??del_stsp_1:
        MOVS     R0,R4
        BL       `pop`
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+36
        BEQ.N    ??del_stsp_2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+59
        BEQ.N    ??del_stsp_2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+47
        BNE.N    ??del_stsp_3
        MOVS     R0,R4
        BL       `pop`
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MVNS     R0,R0
        SUBS     R5,R5,#+1
??del_stsp_3:
        MOVS     R1,R0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        BL       `push`
??del_stsp_2:
        ADDS     R6,R6,#+1
??del_stsp_0:
        MOVS     R0,R6
        MOVS     R1,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R0,R1
        BCC.N    ??del_stsp_1
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
dow_crc:
        PUSH     {R4-R8,LR}
        MOVS     R4,R0
        MOVS     R5,#+0
        MOVS     R0,R4
        BL       get_fill
        MOVS     R7,R0
        MOVS     R6,#+0
        B.N      ??dow_crc_0
??dow_crc_1:
        ADDS     R6,R6,#+1
??dow_crc_0:
        MOVS     R0,R6
        MOVS     R1,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R0,R1
        BCS.N    ??dow_crc_2
        MOVS     R0,R4
        BL       `pop`
        MOV      R8,R0
        MOV      R1,R8
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        BL       `push`
        EORS     R5,R8,R5
        MOVS     R1,#+0
        B.N      ??dow_crc_3
??dow_crc_4:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LSRS     R5,R5,#+1
??dow_crc_5:
        ADDS     R1,R1,#+1
??dow_crc_3:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+8
        BGE.N    ??dow_crc_1
        ANDS     R0,R5,#0x1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??dow_crc_4
        EORS     R5,R5,#0x18
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LSRS     R0,R5,#+1
        ORRS     R5,R0,#0x80
        B.N      ??dow_crc_5
??dow_crc_2:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R8,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
check_crc:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R0,R4
        BL       dow_crc
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??check_crc_0
        LDRB     R0,[R4, #+9]
        CMP      R0,#+0
        BNE.N    ??check_crc_1
        LDRB     R0,[R4, #+0]
        SUBS     R0,R0,#+1
        STRB     R0,[R4, #+9]
        B.N      ??check_crc_2
??check_crc_1:
        LDRB     R0,[R4, #+9]
        SUBS     R0,R0,#+1
        STRB     R0,[R4, #+9]
??check_crc_2:
        MOVS     R0,#+1
        B.N      ??check_crc_3
??check_crc_0:
        MOVS     R0,R4
        BL       clean
        MOVS     R0,#+0
??check_crc_3:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
insert_crc:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R0,R4
        BL       get_fill
        LDRB     R1,[R4, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R1,R0, LSL #+1
        BLT.N    ??insert_crc_0
        MOVS     R0,R4
        BL       dow_crc
        MOVS     R1,R0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        BL       `push`
        MOVS     R0,#+1
        B.N      ??insert_crc_1
??insert_crc_0:
        MOVS     R0,#+0
??insert_crc_1:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
next:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R0,R4
        BL       get_fill
        MOVS     R1,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R0,R1
        BCC.N    ??next_0
        LDRB     R0,[R4, #+8]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R5,R0
        LDRB     R1,[R4, #+0]
        CMP      R0,R1
        BLT.N    ??next_1
        LDRB     R0,[R4, #+8]
        ADDS     R0,R5,R0
        LDRB     R1,[R4, #+0]
        SUBS     R0,R0,R1
        STRB     R0,[R4, #+8]
        B.N      ??next_2
??next_1:
        LDRB     R0,[R4, #+8]
        ADDS     R0,R5,R0
        STRB     R0,[R4, #+8]
??next_2:
        LDRB     R0,[R4, #+9]
        LDRB     R1,[R4, #+8]
        CMP      R0,R1
        BNE.N    ??next_3
        MOVS     R0,#+1
        B.N      ??next_4
??next_3:
        MOVS     R0,#+0
??next_4:
        STRB     R0,[R4, #+10]
        MOVS     R0,#+0
        STRB     R0,[R4, #+11]
        B.N      ??next_5
??next_0:
        MOVS     R0,R4
        BL       clean
??next_5:
        POP      {R0,R4,R5,PC}    ;; return

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
// 764 bytes in section .text
// 
// 764 bytes of CODE memory
//
//Errors: none
//Warnings: none
