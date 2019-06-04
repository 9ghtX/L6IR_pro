///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.70.1.11437/W32 for ARM      18/Apr/2019  18:40:19
// Copyright 1999-2016 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\projects\L6IR\programm\L6_pro\galenic.c
//    Command line =  
//        E:\projects\L6IR\programm\L6_pro\galenic.c -D USE_STDPERIPH_DRIVER -D
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
//    List file    =  E:\projects\L6IR\programm\L6_pro\Release\List\galenic.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN GPIO_ReadInputDataBit
        EXTERN set_device_mode

        PUBLIC dev_mode
        PUBLIC galenic_func
        PUBLIC n_mode_count
        PUBLIC nd_mode_count
        PUBLIC nl_mode_count
        PUBLIC t_mode_count
        PUBLIC tn_mode_count


        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        DATA
t_mode_count:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        DATA
n_mode_count:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        DATA
tn_mode_count:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        DATA
nd_mode_count:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        DATA
nl_mode_count:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        DATA
dev_mode:
        DS8 1

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
galenic_func:
        PUSH     {R7,LR}
        MOVS     R1,#+1
        LDR.N    R0,??galenic_func_0  ;; 0x40020400
        BL       GPIO_ReadInputDataBit
        CMP      R0,#+0
        BNE.N    ??galenic_func_1
        MOVS     R1,#+2
        LDR.N    R0,??galenic_func_0  ;; 0x40020400
        BL       GPIO_ReadInputDataBit
        CMP      R0,#+0
        BEQ.N    ??galenic_func_1
        MOVS     R1,#+8
        LDR.N    R0,??galenic_func_0+0x4  ;; 0x40020000
        BL       GPIO_ReadInputDataBit
        CMP      R0,#+0
        BEQ.N    ??galenic_func_1
        MOVS     R1,#+16
        LDR.N    R0,??galenic_func_0+0x4  ;; 0x40020000
        BL       GPIO_ReadInputDataBit
        CMP      R0,#+0
        BEQ.N    ??galenic_func_1
        MOVS     R1,#+4
        LDR.N    R0,??galenic_func_0  ;; 0x40020400
        BL       GPIO_ReadInputDataBit
        CMP      R0,#+0
        BEQ.N    ??galenic_func_1
        LDR.N    R0,??galenic_func_0+0x8
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??galenic_func_0+0x8
        STRB     R0,[R1, #+0]
        B.N      ??galenic_func_2
??galenic_func_1:
        MOVS     R0,#+0
        LDR.N    R1,??galenic_func_0+0x8
        STRB     R0,[R1, #+0]
??galenic_func_2:
        MOVS     R1,#+2
        LDR.N    R0,??galenic_func_0  ;; 0x40020400
        BL       GPIO_ReadInputDataBit
        CMP      R0,#+0
        BNE.N    ??galenic_func_3
        MOVS     R1,#+1
        LDR.N    R0,??galenic_func_0  ;; 0x40020400
        BL       GPIO_ReadInputDataBit
        CMP      R0,#+0
        BEQ.N    ??galenic_func_3
        MOVS     R1,#+8
        LDR.N    R0,??galenic_func_0+0x4  ;; 0x40020000
        BL       GPIO_ReadInputDataBit
        CMP      R0,#+0
        BEQ.N    ??galenic_func_3
        MOVS     R1,#+16
        LDR.N    R0,??galenic_func_0+0x4  ;; 0x40020000
        BL       GPIO_ReadInputDataBit
        CMP      R0,#+0
        BEQ.N    ??galenic_func_3
        MOVS     R1,#+4
        LDR.N    R0,??galenic_func_0  ;; 0x40020400
        BL       GPIO_ReadInputDataBit
        CMP      R0,#+0
        BEQ.N    ??galenic_func_3
        LDR.N    R0,??galenic_func_0+0xC
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??galenic_func_0+0xC
        STRB     R0,[R1, #+0]
        B.N      ??galenic_func_4
??galenic_func_3:
        MOVS     R0,#+0
        LDR.N    R1,??galenic_func_0+0xC
        STRB     R0,[R1, #+0]
??galenic_func_4:
        MOVS     R1,#+8
        LDR.N    R0,??galenic_func_0+0x4  ;; 0x40020000
        BL       GPIO_ReadInputDataBit
        CMP      R0,#+0
        BNE.N    ??galenic_func_5
        MOVS     R1,#+1
        LDR.N    R0,??galenic_func_0  ;; 0x40020400
        BL       GPIO_ReadInputDataBit
        CMP      R0,#+0
        BEQ.N    ??galenic_func_5
        MOVS     R1,#+2
        LDR.N    R0,??galenic_func_0  ;; 0x40020400
        BL       GPIO_ReadInputDataBit
        CMP      R0,#+0
        BEQ.N    ??galenic_func_5
        MOVS     R1,#+16
        LDR.N    R0,??galenic_func_0+0x4  ;; 0x40020000
        BL       GPIO_ReadInputDataBit
        CMP      R0,#+0
        BEQ.N    ??galenic_func_5
        MOVS     R1,#+4
        LDR.N    R0,??galenic_func_0  ;; 0x40020400
        BL       GPIO_ReadInputDataBit
        CMP      R0,#+0
        BEQ.N    ??galenic_func_5
        LDR.N    R0,??galenic_func_0+0x10
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??galenic_func_0+0x10
        STRB     R0,[R1, #+0]
        B.N      ??galenic_func_6
??galenic_func_5:
        MOVS     R0,#+0
        LDR.N    R1,??galenic_func_0+0x10
        STRB     R0,[R1, #+0]
??galenic_func_6:
        MOVS     R1,#+16
        LDR.N    R0,??galenic_func_0+0x4  ;; 0x40020000
        BL       GPIO_ReadInputDataBit
        CMP      R0,#+0
        BNE.N    ??galenic_func_7
        MOVS     R1,#+1
        LDR.N    R0,??galenic_func_0  ;; 0x40020400
        BL       GPIO_ReadInputDataBit
        CMP      R0,#+0
        BEQ.N    ??galenic_func_7
        MOVS     R1,#+2
        LDR.N    R0,??galenic_func_0  ;; 0x40020400
        BL       GPIO_ReadInputDataBit
        CMP      R0,#+0
        BEQ.N    ??galenic_func_7
        MOVS     R1,#+8
        LDR.N    R0,??galenic_func_0+0x4  ;; 0x40020000
        BL       GPIO_ReadInputDataBit
        CMP      R0,#+0
        BEQ.N    ??galenic_func_7
        MOVS     R1,#+4
        LDR.N    R0,??galenic_func_0  ;; 0x40020400
        BL       GPIO_ReadInputDataBit
        CMP      R0,#+0
        BEQ.N    ??galenic_func_7
        LDR.N    R0,??galenic_func_0+0x14
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??galenic_func_0+0x14
        STRB     R0,[R1, #+0]
        B.N      ??galenic_func_8
??galenic_func_7:
        MOVS     R0,#+0
        LDR.N    R1,??galenic_func_0+0x14
        STRB     R0,[R1, #+0]
??galenic_func_8:
        MOVS     R1,#+4
        LDR.N    R0,??galenic_func_0  ;; 0x40020400
        BL       GPIO_ReadInputDataBit
        CMP      R0,#+0
        BNE.N    ??galenic_func_9
        MOVS     R1,#+1
        LDR.N    R0,??galenic_func_0  ;; 0x40020400
        BL       GPIO_ReadInputDataBit
        CMP      R0,#+0
        BEQ.N    ??galenic_func_9
        MOVS     R1,#+2
        LDR.N    R0,??galenic_func_0  ;; 0x40020400
        BL       GPIO_ReadInputDataBit
        CMP      R0,#+0
        BEQ.N    ??galenic_func_9
        MOVS     R1,#+8
        LDR.N    R0,??galenic_func_0+0x4  ;; 0x40020000
        BL       GPIO_ReadInputDataBit
        CMP      R0,#+0
        BEQ.N    ??galenic_func_9
        MOVS     R1,#+16
        LDR.N    R0,??galenic_func_0+0x4  ;; 0x40020000
        BL       GPIO_ReadInputDataBit
        CMP      R0,#+0
        BEQ.N    ??galenic_func_9
        LDR.N    R0,??galenic_func_0+0x18
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??galenic_func_0+0x18
        STRB     R0,[R1, #+0]
        B.N      ??galenic_func_10
??galenic_func_9:
        MOVS     R0,#+0
        LDR.N    R1,??galenic_func_0+0x18
        STRB     R0,[R1, #+0]
??galenic_func_10:
        LDR.N    R0,??galenic_func_0+0x8
        LDRB     R0,[R0, #+0]
        CMP      R0,#+3
        BLT.N    ??galenic_func_11
        LDR.N    R0,??galenic_func_0+0xC
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??galenic_func_0+0x10
        LDRB     R1,[R1, #+0]
        ORRS     R0,R1,R0
        LDR.N    R1,??galenic_func_0+0x14
        LDRB     R1,[R1, #+0]
        ORRS     R0,R1,R0
        LDR.N    R1,??galenic_func_0+0x18
        LDRB     R1,[R1, #+0]
        ORRS     R0,R1,R0
        CMP      R0,#+0
        BNE.N    ??galenic_func_11
        LDR.N    R0,??galenic_func_0+0x1C
        LDRB     R0,[R0, #+0]
        CMP      R0,#+6
        BEQ.N    ??galenic_func_11
        MOVS     R0,#+6
        LDR.N    R1,??galenic_func_0+0x1C
        STRB     R0,[R1, #+0]
        LDR.N    R0,??galenic_func_0+0x1C
        LDRB     R0,[R0, #+0]
        BL       set_device_mode
??galenic_func_11:
        LDR.N    R0,??galenic_func_0+0xC
        LDRB     R0,[R0, #+0]
        CMP      R0,#+3
        BLT.N    ??galenic_func_12
        LDR.N    R0,??galenic_func_0+0x8
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??galenic_func_0+0x10
        LDRB     R1,[R1, #+0]
        ORRS     R0,R1,R0
        LDR.N    R1,??galenic_func_0+0x14
        LDRB     R1,[R1, #+0]
        ORRS     R0,R1,R0
        LDR.N    R1,??galenic_func_0+0x18
        LDRB     R1,[R1, #+0]
        ORRS     R0,R1,R0
        CMP      R0,#+0
        BNE.N    ??galenic_func_12
        LDR.N    R0,??galenic_func_0+0x1C
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ.N    ??galenic_func_12
        MOVS     R0,#+1
        LDR.N    R1,??galenic_func_0+0x1C
        STRB     R0,[R1, #+0]
        LDR.N    R0,??galenic_func_0+0x1C
        LDRB     R0,[R0, #+0]
        BL       set_device_mode
??galenic_func_12:
        LDR.N    R0,??galenic_func_0+0x10
        LDRB     R0,[R0, #+0]
        CMP      R0,#+3
        BLT.N    ??galenic_func_13
        LDR.N    R0,??galenic_func_0+0x8
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??galenic_func_0+0xC
        LDRB     R1,[R1, #+0]
        ORRS     R0,R1,R0
        LDR.N    R1,??galenic_func_0+0x14
        LDRB     R1,[R1, #+0]
        ORRS     R0,R1,R0
        LDR.N    R1,??galenic_func_0+0x18
        LDRB     R1,[R1, #+0]
        ORRS     R0,R1,R0
        CMP      R0,#+0
        BNE.N    ??galenic_func_13
        LDR.N    R0,??galenic_func_0+0x1C
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
        BEQ.N    ??galenic_func_13
        MOVS     R0,#+2
        LDR.N    R1,??galenic_func_0+0x1C
        STRB     R0,[R1, #+0]
        LDR.N    R0,??galenic_func_0+0x1C
        LDRB     R0,[R0, #+0]
        BL       set_device_mode
??galenic_func_13:
        LDR.N    R0,??galenic_func_0+0x14
        LDRB     R0,[R0, #+0]
        CMP      R0,#+3
        BLT.N    ??galenic_func_14
        LDR.N    R0,??galenic_func_0+0x8
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??galenic_func_0+0xC
        LDRB     R1,[R1, #+0]
        ORRS     R0,R1,R0
        LDR.N    R1,??galenic_func_0+0x10
        LDRB     R1,[R1, #+0]
        ORRS     R0,R1,R0
        LDR.N    R1,??galenic_func_0+0x18
        LDRB     R1,[R1, #+0]
        ORRS     R0,R1,R0
        CMP      R0,#+0
        BNE.N    ??galenic_func_14
        LDR.N    R0,??galenic_func_0+0x1C
        LDRB     R0,[R0, #+0]
        CMP      R0,#+3
        BEQ.N    ??galenic_func_14
        MOVS     R0,#+3
        LDR.N    R1,??galenic_func_0+0x1C
        STRB     R0,[R1, #+0]
        MOVS     R0,#+3
        BL       set_device_mode
??galenic_func_14:
        LDR.N    R0,??galenic_func_0+0x18
        LDRB     R0,[R0, #+0]
        CMP      R0,#+3
        BLT.N    ??galenic_func_15
        LDR.N    R0,??galenic_func_0+0x8
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??galenic_func_0+0xC
        LDRB     R1,[R1, #+0]
        ORRS     R0,R1,R0
        LDR.N    R1,??galenic_func_0+0x10
        LDRB     R1,[R1, #+0]
        ORRS     R0,R1,R0
        LDR.N    R1,??galenic_func_0+0x14
        LDRB     R1,[R1, #+0]
        ORRS     R0,R1,R0
        CMP      R0,#+0
        BNE.N    ??galenic_func_15
        LDR.N    R0,??galenic_func_0+0x1C
        LDRB     R0,[R0, #+0]
        CMP      R0,#+4
        BEQ.N    ??galenic_func_15
        MOVS     R0,#+4
        LDR.N    R1,??galenic_func_0+0x1C
        STRB     R0,[R1, #+0]
        MOVS     R0,#+4
        BL       set_device_mode
??galenic_func_15:
        POP      {R0,PC}          ;; return
        Nop      
        DATA
??galenic_func_0:
        DC32     0x40020400
        DC32     0x40020000
        DC32     t_mode_count
        DC32     n_mode_count
        DC32     tn_mode_count
        DC32     nd_mode_count
        DC32     nl_mode_count
        DC32     dev_mode

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
//   6 bytes in section .bss
// 704 bytes in section .text
// 
// 704 bytes of CODE memory
//   6 bytes of DATA memory
//
//Errors: none
//Warnings: none
