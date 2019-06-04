///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.70.1.11437/W32 for ARM      18/Apr/2019  18:40:36
// Copyright 1999-2016 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        E:\projects\L6IR\programm\L6_pro\rfu_stm32\source\rfu_stm32L10x.c
//    Command line =  
//        E:\projects\L6IR\programm\L6_pro\rfu_stm32\source\rfu_stm32L10x.c -D
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
//        E:\projects\L6IR\programm\L6_pro\Release\List\rfu_stm32L10x.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1
        #define SHF_EXECINSTR 0x4

        EXTERN DATA_EEPROM_Unlock

        PUBLIC RFU_FLASH_ClearFlag
        PUBLIC RFU_FLASH_EraseAllPages
        PUBLIC RFU_FLASH_ErasePage
        PUBLIC RFU_FLASH_FastProgramWord
        PUBLIC RFU_FLASH_GetFlagStatus
        PUBLIC RFU_FLASH_GetStatus
        PUBLIC RFU_FLASH_Lock
        PUBLIC RFU_FLASH_PrefetchBufferCmd
        PUBLIC RFU_FLASH_ReadAccess64Cmd
        PUBLIC RFU_FLASH_SLEEPPowerDownCmd
        PUBLIC RFU_FLASH_SetLatency
        PUBLIC RFU_FLASH_Unlock
        PUBLIC RFU_FLASH_WaitForLastOperation


        SECTION RFU_CODE:CODE:NOROOT(1)
        THUMB
RFU_FLASH_SetLatency:
        MOVS     R1,#+0
        LDR.N    R1,??DataTable10  ;; 0x40023c00
        LDR      R1,[R1, #+0]
        LSRS     R1,R1,#+1
        LSLS     R1,R1,#+1
        ORRS     R1,R0,R1
        LDR.N    R0,??DataTable10  ;; 0x40023c00
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION RFU_CODE:CODE:NOROOT(1)
        THUMB
RFU_FLASH_PrefetchBufferCmd:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??RFU_FLASH_PrefetchBufferCmd_0
        LDR.N    R0,??DataTable10  ;; 0x40023c00
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable10  ;; 0x40023c00
        STR      R0,[R1, #+0]
        B.N      ??RFU_FLASH_PrefetchBufferCmd_1
??RFU_FLASH_PrefetchBufferCmd_0:
        LDR.N    R0,??DataTable10  ;; 0x40023c00
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x2
        LDR.N    R1,??DataTable10  ;; 0x40023c00
        STR      R0,[R1, #+0]
??RFU_FLASH_PrefetchBufferCmd_1:
        BX       LR               ;; return

        SECTION RFU_CODE:CODE:NOROOT(1)
        THUMB
RFU_FLASH_ReadAccess64Cmd:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??RFU_FLASH_ReadAccess64Cmd_0
        LDR.N    R0,??DataTable10  ;; 0x40023c00
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable10  ;; 0x40023c00
        STR      R0,[R1, #+0]
        B.N      ??RFU_FLASH_ReadAccess64Cmd_1
??RFU_FLASH_ReadAccess64Cmd_0:
        LDR.N    R0,??DataTable10  ;; 0x40023c00
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x4
        LDR.N    R1,??DataTable10  ;; 0x40023c00
        STR      R0,[R1, #+0]
??RFU_FLASH_ReadAccess64Cmd_1:
        BX       LR               ;; return

        SECTION RFU_CODE:CODE:NOROOT(1)
        THUMB
RFU_FLASH_SLEEPPowerDownCmd:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??RFU_FLASH_SLEEPPowerDownCmd_0
        LDR.N    R0,??DataTable10  ;; 0x40023c00
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.N    R1,??DataTable10  ;; 0x40023c00
        STR      R0,[R1, #+0]
        B.N      ??RFU_FLASH_SLEEPPowerDownCmd_1
??RFU_FLASH_SLEEPPowerDownCmd_0:
        LDR.N    R0,??DataTable10  ;; 0x40023c00
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x8
        LDR.N    R1,??DataTable10  ;; 0x40023c00
        STR      R0,[R1, #+0]
??RFU_FLASH_SLEEPPowerDownCmd_1:
        BX       LR               ;; return

        SECTION RFU_CODE:CODE:NOROOT(1)
        THUMB
RFU_FLASH_Unlock:
        PUSH     {R7,LR}
        LDR.N    R0,??DataTable10_1  ;; 0x40023c04
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+30
        BPL.N    ??RFU_FLASH_Unlock_0
        BL       DATA_EEPROM_Unlock
        LDR.N    R0,??DataTable10_2  ;; 0x8c9daebf
        LDR.N    R1,??DataTable10_3  ;; 0x40023c10
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable10_4  ;; 0x13141516
        LDR.N    R1,??DataTable10_3  ;; 0x40023c10
        STR      R0,[R1, #+0]
??RFU_FLASH_Unlock_0:
        MOVW     R0,#+770
        BL       RFU_FLASH_ClearFlag
        POP      {R0,PC}          ;; return

        SECTION RFU_CODE:CODE:NOROOT(1)
        THUMB
RFU_FLASH_Lock:
        LDR.N    R0,??DataTable10_1  ;; 0x40023c04
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable10_1  ;; 0x40023c04
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION RFU_CODE:CODE:NOROOT(1)
        THUMB
RFU_FLASH_ErasePage:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R0,#+4
        MOV      R0,#+32768
        BL       RFU_FLASH_WaitForLastOperation
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??RFU_FLASH_ErasePage_0
        LDR.N    R0,??DataTable10_1  ;; 0x40023c04
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x200
        LDR.N    R1,??DataTable10_1  ;; 0x40023c04
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable10_1  ;; 0x40023c04
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.N    R1,??DataTable10_1  ;; 0x40023c04
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        STR      R0,[R4, #+0]
        MOV      R0,#+32768
        BL       RFU_FLASH_WaitForLastOperation
        LDR.N    R1,??DataTable10_1  ;; 0x40023c04
        LDR      R1,[R1, #+0]
        BICS     R1,R1,#0x8
        LDR.N    R2,??DataTable10_1  ;; 0x40023c04
        STR      R1,[R2, #+0]
        LDR.N    R1,??DataTable10_1  ;; 0x40023c04
        LDR      R1,[R1, #+0]
        BICS     R1,R1,#0x200
        LDR.N    R2,??DataTable10_1  ;; 0x40023c04
        STR      R1,[R2, #+0]
??RFU_FLASH_ErasePage_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,PC}          ;; return

        SECTION RFU_CODE:CODE:NOROOT(1)
        THUMB
RFU_FLASH_EraseAllPages:
        PUSH     {R3-R7,LR}
        MOVS     R4,#+4
        MOVS     R5,#+134217728
        LDR.N    R6,??DataTable10_5  ;; 0x803ffff
        MOV      R7,#+256
        B.N      ??RFU_FLASH_EraseAllPages_0
??RFU_FLASH_EraseAllPages_1:
        MOVS     R0,R5
        BL       RFU_FLASH_ErasePage
        ORRS     R4,R0,R4
        ADDS     R5,R7,R5
??RFU_FLASH_EraseAllPages_0:
        CMP      R5,R6
        BCC.N    ??RFU_FLASH_EraseAllPages_1
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4-R7,PC}    ;; return

        SECTION RFU_CODE:CODE:NOROOT(1)
        THUMB
RFU_FLASH_FastProgramWord:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R0,#+4
        MOV      R0,#+32768
        BL       RFU_FLASH_WaitForLastOperation
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??RFU_FLASH_FastProgramWord_0
        STR      R5,[R4, #+0]
        MOV      R0,#+32768
        BL       RFU_FLASH_WaitForLastOperation
??RFU_FLASH_FastProgramWord_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return

        SECTION RFU_CODE:CODE:NOROOT(1)
        THUMB
RFU_FLASH_GetFlagStatus:
        MOVS     R1,#+0
        LDR.N    R1,??DataTable10_6  ;; 0x40023c18
        LDR      R1,[R1, #+0]
        TST      R1,R0
        BEQ.N    ??RFU_FLASH_GetFlagStatus_0
        MOVS     R1,#+1
        B.N      ??RFU_FLASH_GetFlagStatus_1
??RFU_FLASH_GetFlagStatus_0:
        MOVS     R1,#+0
??RFU_FLASH_GetFlagStatus_1:
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION RFU_CODE:CODE:NOROOT(1)
        THUMB
RFU_FLASH_ClearFlag:
        LDR.N    R1,??DataTable10_6  ;; 0x40023c18
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION RFU_CODE:CODE:NOROOT(1)
        THUMB
RFU_FLASH_GetStatus:
        MOVS     R0,#+4
        LDR.N    R0,??DataTable10_6  ;; 0x40023c18
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+31
        BPL.N    ??RFU_FLASH_GetStatus_0
        MOVS     R0,#+1
        B.N      ??RFU_FLASH_GetStatus_1
??RFU_FLASH_GetStatus_0:
        LDR.N    R0,??DataTable10_6  ;; 0x40023c18
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+23
        BPL.N    ??RFU_FLASH_GetStatus_2
        MOVS     R0,#+2
        B.N      ??RFU_FLASH_GetStatus_1
??RFU_FLASH_GetStatus_2:
        LDR.N    R0,??DataTable10_6  ;; 0x40023c18
        LDR      R0,[R0, #+0]
        TST      R0,#0x1E00
        BEQ.N    ??RFU_FLASH_GetStatus_3
        MOVS     R0,#+3
        B.N      ??RFU_FLASH_GetStatus_1
??RFU_FLASH_GetStatus_3:
        MOVS     R0,#+4
??RFU_FLASH_GetStatus_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION RFU_CODE:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10:
        DC32     0x40023c00

        SECTION RFU_CODE:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_1:
        DC32     0x40023c04

        SECTION RFU_CODE:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_2:
        DC32     0x8c9daebf

        SECTION RFU_CODE:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_3:
        DC32     0x40023c10

        SECTION RFU_CODE:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_4:
        DC32     0x13141516

        SECTION RFU_CODE:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_5:
        DC32     0x803ffff

        SECTION RFU_CODE:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_6:
        DC32     0x40023c18

        SECTION RFU_CODE:CODE:NOROOT(1)
        THUMB
RFU_FLASH_WaitForLastOperation:
        PUSH     {R4,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R0
        MOVS     R0,#+4
        STRB     R0,[SP, #+0]
        BL       RFU_FLASH_GetStatus
        STRB     R0,[SP, #+0]
        B.N      ??RFU_FLASH_WaitForLastOperation_0
??RFU_FLASH_WaitForLastOperation_1:
        BL       RFU_FLASH_GetStatus
        STRB     R0,[SP, #+0]
        SUBS     R4,R4,#+1
??RFU_FLASH_WaitForLastOperation_0:
        LDRB     R0,[SP, #+0]
        CMP      R0,#+1
        BNE.N    ??RFU_FLASH_WaitForLastOperation_2
        CMP      R4,#+0
        BNE.N    ??RFU_FLASH_WaitForLastOperation_1
??RFU_FLASH_WaitForLastOperation_2:
        CMP      R4,#+0
        BNE.N    ??RFU_FLASH_WaitForLastOperation_3
        MOVS     R0,#+5
        STRB     R0,[SP, #+0]
??RFU_FLASH_WaitForLastOperation_3:
        LDRB     R0,[SP, #+0]
        POP      {R1,R2,R4,PC}    ;; return

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
// 488 bytes in section RFU_CODE
// 
// 488 bytes of CODE memory
//
//Errors: none
//Warnings: none
