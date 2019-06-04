///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.70.1.11437/W32 for ARM      18/Apr/2019  18:40:15
// Copyright 1999-2016 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\projects\L6IR\programm\L6_pro\A3G4250D_driver.c
//    Command line =  
//        E:\projects\L6IR\programm\L6_pro\A3G4250D_driver.c -D
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
//        E:\projects\L6IR\programm\L6_pro\Release\List\A3G4250D_driver.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN i2c_ReadReg
        EXTERN i2c_WriteReg

        PUBLIC A3G4250D_Config
        PUBLIC A3G4250D_FifoConfig
        PUBLIC A3G4250D_FilterConfig
        PUBLIC A3G4250D_I2C_Init
        PUBLIC A3G4250D_ReadReg
        PUBLIC A3G4250D_WriteReg


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
A3G4250D_WriteReg:
        PUSH     {R1,LR}
        SUB      SP,SP,#+8
        MOVS     R1,#+1
        STR      R1,[SP, #+0]
        ADD      R3,SP,#+8
        MOVS     R2,R0
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,#+211
        LDR.N    R0,??DataTable1  ;; 0x40005400
        BL       i2c_WriteReg
        POP      {R1-R3,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
A3G4250D_ReadReg:
        PUSH     {R7,LR}
        MOVS     R2,#+1
        STR      R2,[SP, #+0]
        MOVS     R3,R1
        MOVS     R2,R0
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,#+211
        LDR.N    R0,??DataTable1  ;; 0x40005400
        BL       i2c_ReadReg
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0x40005400

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
A3G4250D_I2C_Init:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
A3G4250D_Config:
        PUSH     {R4,LR}
        MOVS     R4,R1
        LDRB     R1,[R0, #+0]
        LDRB     R2,[R0, #+2]
        ADDS     R1,R2,R1
        LDRB     R0,[R0, #+1]
        ADDS     R1,R0,R1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+32
        BL       A3G4250D_WriteReg
        LDRB     R1,[R4, #+1]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+35
        BL       A3G4250D_WriteReg
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
A3G4250D_FilterConfig:
        PUSH     {R7,LR}
        LDRB     R1,[R0, #+1]
        LDRB     R0,[R0, #+0]
        ADDS     R1,R0,R1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+33
        BL       A3G4250D_WriteReg
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
A3G4250D_FifoConfig:
        PUSH     {R7,LR}
        LDRB     R1,[R0, #+0]
        LDRB     R0,[R0, #+1]
        ADDS     R1,R0,R1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+34
        BL       A3G4250D_WriteReg
        POP      {R0,PC}          ;; return

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
// 122 bytes in section .text
// 
// 122 bytes of CODE memory
//
//Errors: none
//Warnings: none
