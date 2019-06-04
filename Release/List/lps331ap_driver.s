///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.70.1.11437/W32 for ARM      18/Apr/2019  18:40:23
// Copyright 1999-2016 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\projects\L6IR\programm\L6_pro\lps331ap_driver.c
//    Command line =  
//        E:\projects\L6IR\programm\L6_pro\lps331ap_driver.c -D
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
//        E:\projects\L6IR\programm\L6_pro\Release\List\lps331ap_driver.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN LPS331AP_Read_Pressure_Regs
        EXTERN __aeabi_d2f
        EXTERN __aeabi_d2uiz
        EXTERN __aeabi_dadd
        EXTERN __aeabi_ddiv
        EXTERN __aeabi_dmul
        EXTERN __aeabi_f2d
        EXTERN __aeabi_i2d
        EXTERN __aeabi_ui2d
        EXTERN __aeabi_ui2f
        EXTERN i2c_ReadReg
        EXTERN i2c_WriteReg
        EXTERN log

        PUBLIC LPS331AP_Config
        PUBLIC LPS331AP_Get_Altitude
        PUBLIC LPS331AP_Get_Pressure
        PUBLIC LPS331AP_Get_Raw_Pressure
        PUBLIC LPS331AP_Get_Temperature
        PUBLIC LPS331AP_I2C_Init
        PUBLIC LPS331AP_PowerDown_Cmd
        PUBLIC LPS331AP_Read
        PUBLIC LPS331AP_Reboot_Cmd
        PUBLIC LPS331AP_Set_Reference
        PUBLIC LPS331AP_Write


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LPS331AP_I2C_Init:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LPS331AP_Config:
        PUSH     {R7,LR}
        LDRB     R1,[R0, #+0]
        LDRB     R2,[R0, #+1]
        ADDS     R1,R2,R1
        LDRB     R2,[R0, #+2]
        ADDS     R1,R2,R1
        LDRB     R0,[R0, #+3]
        ADDS     R0,R0,R1
        STRB     R0,[SP, #+0]
        MOVS     R2,#+1
        MOVS     R1,#+32
        MOV      R0,SP
        BL       LPS331AP_Write
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LPS331AP_PowerDown_Cmd:
        PUSH     {R4,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R0
        MOVS     R0,#+0
        STRB     R0,[SP, #+0]
        MOVS     R2,#+1
        MOVS     R1,#+32
        MOV      R0,SP
        BL       LPS331AP_Read
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??LPS331AP_PowerDown_Cmd_0
        LDRB     R0,[SP, #+0]
        ORRS     R0,R0,#0x80
        STRB     R0,[SP, #+0]
        B.N      ??LPS331AP_PowerDown_Cmd_1
??LPS331AP_PowerDown_Cmd_0:
        LDRB     R0,[SP, #+0]
        ANDS     R0,R0,#0x7F
        STRB     R0,[SP, #+0]
??LPS331AP_PowerDown_Cmd_1:
        MOVS     R2,#+1
        MOVS     R1,#+32
        MOV      R0,SP
        BL       LPS331AP_Write
        POP      {R0,R1,R4,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LPS331AP_Reboot_Cmd:
        PUSH     {R7,LR}
        MOVS     R0,#+128
        STRB     R0,[SP, #+0]
        MOVS     R2,#+1
        MOVS     R1,#+33
        MOV      R0,SP
        BL       LPS331AP_Write
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LPS331AP_Set_Reference:
        PUSH     {R7,LR}
        BL       __aeabi_ui2d
        LDR.N    R2,??DataTable5  ;; 0xeb851eb8
        LDR.N    R3,??DataTable5_1  ;; 0x3fceb851
        BL       __aeabi_ddiv
        BL       __aeabi_d2uiz
        MOVS     R1,R0
        STRB     R1,[SP, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[SP, #+1]
        MOVS     R0,#+0
        STRB     R0,[SP, #+2]
        MOVS     R2,#+3
        MOVS     R1,#+8
        MOV      R0,SP
        BL       LPS331AP_Write
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LPS331AP_Get_Altitude:
        PUSH     {R4,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R0
        MOV      R0,SP
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        MOVS     R0,#+0
        MOVS     R0,#+0
        MOV      R0,SP
        BL       LPS331AP_Read_Pressure_Regs
        LDRB     R0,[SP, #+2]
        LDRB     R1,[SP, #+1]
        LSLS     R1,R1,#+8
        ADDS     R0,R1,R0, LSL #+16
        LDRB     R1,[SP, #+0]
        ADDS     R0,R1,R0
        BL       __aeabi_ui2d
        LDR.N    R2,??DataTable5  ;; 0xeb851eb8
        LDR.N    R3,??DataTable5_1  ;; 0x3fceb851
        BL       __aeabi_ddiv
        BL       __aeabi_d2uiz
        BL       __aeabi_ui2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_2  ;; 0x40c3ca40
        BL       __aeabi_ddiv
        BL       log
        MOVS     R2,#+0
        LDR.N    R3,??DataTable5_3  ;; 0x40bc7a00
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        STR      R0,[R4, #+0]
        POP      {R0,R1,R4,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LPS331AP_Get_Pressure:
        PUSH     {R4,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R0
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOV      R0,SP
        BL       LPS331AP_Get_Raw_Pressure
        LDR      R0,[SP, #+0]
        BL       __aeabi_ui2f
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.N    R3,??DataTable5_4  ;; 0x40b00000
        BL       __aeabi_ddiv
        MOVS     R2,#+0
        LDR.N    R3,??DataTable5_5  ;; 0x3fe80000
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        STR      R0,[R4, #+0]
        POP      {R0,R1,R4,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LPS331AP_Get_Raw_Pressure:
        PUSH     {R4,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R0
        MOV      R0,SP
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        MOVS     R0,#+0
        MOVS     R2,#+1
        MOVS     R1,#+40
        MOV      R0,SP
        BL       LPS331AP_Read
        MOVS     R2,#+1
        MOVS     R1,#+41
        ADD      R0,SP,#+1
        BL       LPS331AP_Read
        MOVS     R2,#+1
        MOVS     R1,#+42
        ADD      R0,SP,#+2
        BL       LPS331AP_Read
        LDRB     R0,[SP, #+2]
        LDRB     R1,[SP, #+1]
        LSLS     R1,R1,#+8
        ADDS     R0,R1,R0, LSL #+16
        LDRB     R1,[SP, #+0]
        ADDS     R0,R1,R0
        STR      R0,[R4, #+0]
        POP      {R0,R1,R4,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LPS331AP_Get_Temperature:
        PUSH     {R4,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R0
        MOVS     R0,#+0
        STRH     R0,[SP, #+0]
        MOVS     R0,#+0
        MOVS     R2,#+1
        MOVS     R1,#+43
        MOV      R0,SP
        BL       LPS331AP_Read
        MOVS     R2,#+1
        MOVS     R1,#+44
        ADD      R0,SP,#+1
        BL       LPS331AP_Read
        LDRB     R0,[SP, #+1]
        LDRB     R1,[SP, #+0]
        ADDS     R0,R1,R0, LSL #+8
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        BL       __aeabi_i2d
        MOVS     R2,#+0
        LDR.N    R3,??DataTable5_6  ;; 0x407e0000
        BL       __aeabi_ddiv
        MOVS     R2,#+0
        LDR.N    R3,??DataTable5_7  ;; 0x40454000
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        STR      R0,[R4, #+0]
        POP      {R0,R1,R4,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LPS331AP_Read:
        PUSH     {R7,LR}
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        STR      R2,[SP, #+0]
        MOVS     R3,R0
        MOVS     R2,R1
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,#+187
        LDR.N    R0,??DataTable5_8  ;; 0x40005800
        BL       i2c_ReadReg
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LPS331AP_Write:
        PUSH     {R7,LR}
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        STR      R2,[SP, #+0]
        MOVS     R3,R0
        MOVS     R2,R1
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,#+187
        LDR.N    R0,??DataTable5_8  ;; 0x40005800
        BL       i2c_WriteReg
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     0xeb851eb8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     0x3fceb851

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     0x40c3ca40

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     0x40bc7a00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     0x40b00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     0x3fe80000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_6:
        DC32     0x407e0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_7:
        DC32     0x40454000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_8:
        DC32     0x40005800

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
        DC8 0, 0

        END
// 
//  10 bytes in section .rodata
// 544 bytes in section .text
// 
// 544 bytes of CODE  memory
//  10 bytes of CONST memory
//
//Errors: none
//Warnings: none
