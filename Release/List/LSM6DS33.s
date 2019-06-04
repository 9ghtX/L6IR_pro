///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.70.1.11437/W32 for ARM      18/Apr/2019  18:40:24
// Copyright 1999-2016 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\projects\L6IR\programm\L6_pro\LSM6DS33.c
//    Command line =  
//        E:\projects\L6IR\programm\L6_pro\LSM6DS33.c -D USE_STDPERIPH_DRIVER
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
//    List file    =  E:\projects\L6IR\programm\L6_pro\Release\List\LSM6DS33.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN i2c_ReadReg
        EXTERN i2c_WriteReg

        PUBLIC LSM6DS33_congig
        PUBLIC LSM6DS33_get_status
        PUBLIC LSM6DS33_out_data
        PUBLIC LSM6DS33_read_accelerometer
        PUBLIC LSM6DS33_read_data_word
        PUBLIC LSM6DS33_read_gyroscope
        PUBLIC LSM6DS33_read_temperature
        PUBLIC LSM6DS33_tasks
        PUBLIC LSM6DS33_wright_data_word


        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
LSM6DS33_out_data:
        DS8 24

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LSM6DS33_tasks:
        PUSH     {R7,LR}
        BL       LSM6DS33_get_status
        LDR.N    R1,??DataTable3
        STRB     R0,[R1, #+0]
        LDR.N    R0,??DataTable3
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+31
        BPL.N    ??LSM6DS33_tasks_0
        MOVS     R0,#+40
        BL       LSM6DS33_read_data_word
        LDR.N    R1,??DataTable3
        STRH     R0,[R1, #+6]
        MOVS     R0,#+42
        BL       LSM6DS33_read_data_word
        LDR.N    R1,??DataTable3
        STRH     R0,[R1, #+8]
        MOVS     R0,#+44
        BL       LSM6DS33_read_data_word
        LDR.N    R1,??DataTable3
        STRH     R0,[R1, #+10]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3
        STRB     R0,[R1, #+12]
        LDR.N    R0,??DataTable3
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0xFE
        LDR.N    R1,??DataTable3
        STRB     R0,[R1, #+0]
??LSM6DS33_tasks_0:
        LDR.N    R0,??DataTable3
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+29
        BPL.N    ??LSM6DS33_tasks_1
        MOVS     R0,#+32
        BL       LSM6DS33_read_data_word
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+4
        LDR.N    R1,??DataTable3
        STRH     R0,[R1, #+2]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3
        STRB     R0,[R1, #+4]
        LDR.N    R0,??DataTable3
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0xFB
        LDR.N    R1,??DataTable3
        STRB     R0,[R1, #+0]
??LSM6DS33_tasks_1:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LSM6DS33_wright_data_word:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LSM6DS33_read_data_word:
        PUSH     {R4,R5,LR}
        SUB      SP,SP,#+12
        MOVS     R4,R0
        MOVS     R0,#+0
        STRH     R0,[SP, #+4]
        ADD      R5,SP,#+4
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
        MOVS     R3,R5
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R2,R4
        MOVS     R1,#+215
        LDR.N    R0,??DataTable3_1  ;; 0x40005400
        BL       i2c_ReadReg
        ADDS     R5,R5,#+1
        ADDS     R4,R4,#+1
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
        MOVS     R3,R5
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R2,R4
        MOVS     R1,#+215
        LDR.N    R0,??DataTable3_1  ;; 0x40005400
        BL       i2c_ReadReg
        LDRH     R0,[SP, #+4]
        POP      {R1-R5,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LSM6DS33_congig:
        PUSH     {LR}
        SUB      SP,SP,#+12
        MOVS     R0,#+16
        STRB     R0,[SP, #+4]
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
        ADD      R3,SP,#+4
        MOVS     R2,#+16
        MOVS     R1,#+215
        LDR.N    R0,??DataTable3_1  ;; 0x40005400
        BL       i2c_WriteReg
        POP      {R0-R2,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LSM6DS33_read_accelerometer:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LSM6DS33_read_gyroscope:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LSM6DS33_read_temperature:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LSM6DS33_get_status:
        PUSH     {LR}
        SUB      SP,SP,#+12
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
        ADD      R3,SP,#+4
        MOVS     R2,#+30
        MOVS     R1,#+215
        LDR.N    R0,??DataTable3_1  ;; 0x40005400
        BL       i2c_ReadReg
        LDRB     R0,[SP, #+4]
        POP      {R1-R3,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     LSM6DS33_out_data

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     0x40005400

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
//  24 bytes in section .bss
// 238 bytes in section .text
// 
// 238 bytes of CODE memory
//  24 bytes of DATA memory
//
//Errors: none
//Warnings: 3
