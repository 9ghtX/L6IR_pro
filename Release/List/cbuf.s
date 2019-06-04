///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.70.1.11437/W32 for ARM      18/Apr/2019  18:40:18
// Copyright 1999-2016 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\projects\L6IR\programm\L6_pro\cbuf.c
//    Command line =  
//        E:\projects\L6IR\programm\L6_pro\cbuf.c -D USE_STDPERIPH_DRIVER -D
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
//    List file    =  E:\projects\L6IR\programm\L6_pro\Release\List\cbuf.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC CbufFlush
        PUBLIC CbufGet
        PUBLIC CbufGetFreeSize
        PUBLIC CbufGetItemCount
        PUBLIC CbufInit
        PUBLIC CbufPut
        PUBLIC CbufRead
        PUBLIC CbufTestItem
        PUBLIC CbufWrite


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CbufPush:
        LDR      R2,[R0, #+0]
        LDR      R3,[R0, #+16]
        STRB     R1,[R2, R3]
        LDR      R1,[R0, #+16]
        ADDS     R1,R1,#+1
        STR      R1,[R0, #+16]
        LDR      R1,[R0, #+8]
        ADDS     R1,R1,#+1
        STR      R1,[R0, #+8]
        LDR      R1,[R0, #+16]
        LDR      R2,[R0, #+4]
        UDIV     R3,R1,R2
        MLS      R1,R2,R3,R1
        STR      R1,[R0, #+16]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CbufPop:
        PUSH     {R4}
        LDR      R1,[R0, #+0]
        LDR      R2,[R0, #+12]
        LDRB     R1,[R1, R2]
        LDR      R2,[R0, #+8]
        SUBS     R2,R2,#+1
        STR      R2,[R0, #+8]
        LDR      R2,[R0, #+12]
        ADDS     R2,R2,#+1
        STR      R2,[R0, #+12]
        LDR      R2,[R0, #+12]
        LDR      R3,[R0, #+4]
        UDIV     R4,R2,R3
        MLS      R2,R3,R4,R2
        STR      R2,[R0, #+12]
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CbufInit:
        STR      R1,[R0, #+0]
        STR      R2,[R0, #+4]
        MOVS     R1,#+0
        STR      R1,[R0, #+12]
        MOVS     R1,#+0
        STR      R1,[R0, #+16]
        MOVS     R1,#+0
        STR      R1,[R0, #+8]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CbufWrite:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R0,#+0
        LDR      R1,[R4, #+4]
        LDR      R2,[R4, #+8]
        SUBS     R1,R1,R2
        CMP      R1,R6
        BCC.N    ??CbufWrite_0
        MOVS     R7,#+0
        B.N      ??CbufWrite_1
??CbufWrite_2:
        LDRB     R1,[R5, #+0]
        MOVS     R0,R4
        BL       CbufPush
        ADDS     R5,R5,#+1
        ADDS     R7,R7,#+1
??CbufWrite_1:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,R6
        BCC.N    ??CbufWrite_2
        MOVS     R0,#+1
??CbufWrite_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CbufRead:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        LDR      R0,[R4, #+8]
        CMP      R6,R0
        BCC.N    ??CbufRead_0
??CbufRead_1:
        LDR      R6,[R4, #+8]
??CbufRead_0:
        MOVS     R7,#+0
        B.N      ??CbufRead_2
??CbufRead_3:
        MOVS     R0,R4
        BL       CbufPop
        STRB     R0,[R5, R7]
        ADDS     R7,R7,#+1
??CbufRead_2:
        CMP      R7,R6
        BCC.N    ??CbufRead_3
        MOVS     R0,R7
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CbufTestItem:
        LDR      R2,[R0, #+12]
        ADDS     R1,R1,R2
        LDR      R2,[R0, #+4]
        CMP      R1,R2
        BCS.N    ??CbufTestItem_0
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, R1]
        B.N      ??CbufTestItem_1
??CbufTestItem_0:
        LDR      R2,[R0, #+0]
        LDR      R0,[R0, #+4]
        SUBS     R0,R1,R0
        LDRB     R0,[R2, R0]
??CbufTestItem_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CbufPut:
        PUSH     {R4,LR}
        MOVS     R2,R0
        MOVS     R0,#+0
        LDR      R3,[R2, #+8]
        LDR      R4,[R2, #+4]
        CMP      R3,R4
        BCS.N    ??CbufPut_0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R2
        BL       CbufPush
        MOVS     R0,#+1
??CbufPut_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CbufGet:
        PUSH     {R4,LR}
        MOVS     R2,R0
        MOVS     R4,R1
        MOVS     R0,#+0
        LDR      R1,[R2, #+8]
        CMP      R1,#+0
        BEQ.N    ??CbufGet_0
        MOVS     R0,R2
        BL       CbufPop
        STRB     R0,[R4, #+0]
        MOVS     R0,#+1
??CbufGet_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CbufGetItemCount:
        LDR      R0,[R0, #+8]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CbufGetFreeSize:
        LDR      R1,[R0, #+4]
        LDR      R0,[R0, #+8]
        SUBS     R0,R1,R0
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CbufFlush:
        MOVS     R1,#+0
        STR      R1,[R0, #+8]
        LDR      R1,[R0, #+16]
        STR      R1,[R0, #+12]
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
// 286 bytes in section .text
// 
// 286 bytes of CODE memory
//
//Errors: none
//Warnings: none
