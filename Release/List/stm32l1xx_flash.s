///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.70.1.11437/W32 for ARM      18/Apr/2019  18:40:44
// Copyright 1999-2016 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        E:\projects\L6IR\programm\L6_pro\STM32L1xx_StdPeriph_Driver\src\stm32l1xx_flash.c
//    Command line =  
//        E:\projects\L6IR\programm\L6_pro\STM32L1xx_StdPeriph_Driver\src\stm32l1xx_flash.c
//        -D USE_STDPERIPH_DRIVER -D STM32L1XX_MD -D FR14745600 -D nFR11059200
//        -D L6IR_CU -D nPT2_MODE -D PT7_MODE -D nTABLE_BAL -D nTNM_MODE -D
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
//        E:\projects\L6IR\programm\L6_pro\Release\List\stm32l1xx_flash.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC DATA_EEPROM_EraseByte
        PUBLIC DATA_EEPROM_EraseHalfWord
        PUBLIC DATA_EEPROM_EraseWord
        PUBLIC DATA_EEPROM_FastProgramByte
        PUBLIC DATA_EEPROM_FastProgramHalfWord
        PUBLIC DATA_EEPROM_FastProgramWord
        PUBLIC DATA_EEPROM_FixedTimeProgramCmd
        PUBLIC DATA_EEPROM_Lock
        PUBLIC DATA_EEPROM_ProgramByte
        PUBLIC DATA_EEPROM_ProgramHalfWord
        PUBLIC DATA_EEPROM_ProgramWord
        PUBLIC DATA_EEPROM_Unlock
        PUBLIC FLASH_ClearFlag
        PUBLIC FLASH_ErasePage
        PUBLIC FLASH_FastProgramWord
        PUBLIC FLASH_GetFlagStatus
        PUBLIC FLASH_GetStatus
        PUBLIC FLASH_ITConfig
        PUBLIC FLASH_Lock
        PUBLIC FLASH_OB_BORConfig
        PUBLIC FLASH_OB_BootConfig
        PUBLIC FLASH_OB_GetBOR
        PUBLIC FLASH_OB_GetRDP
        PUBLIC FLASH_OB_GetUser
        PUBLIC FLASH_OB_GetWRP
        PUBLIC FLASH_OB_GetWRP1
        PUBLIC FLASH_OB_GetWRP2
        PUBLIC FLASH_OB_Launch
        PUBLIC FLASH_OB_Lock
        PUBLIC FLASH_OB_RDPConfig
        PUBLIC FLASH_OB_Unlock
        PUBLIC FLASH_OB_UserConfig
        PUBLIC FLASH_OB_WRP1Config
        PUBLIC FLASH_OB_WRP2Config
        PUBLIC FLASH_OB_WRPConfig
        PUBLIC FLASH_PrefetchBufferCmd
        PUBLIC FLASH_ReadAccess64Cmd
        PUBLIC FLASH_SLEEPPowerDownCmd
        PUBLIC FLASH_SetLatency
        PUBLIC FLASH_Unlock
        PUBLIC FLASH_WaitForLastOperation


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_SetLatency:
        MOVS     R1,#+0
        LDR.W    R1,??DataTable32  ;; 0x40023c00
        LDR      R1,[R1, #+0]
        LSRS     R1,R1,#+1
        LSLS     R1,R1,#+1
        ORRS     R1,R0,R1
        LDR.W    R0,??DataTable32  ;; 0x40023c00
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_PrefetchBufferCmd:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??FLASH_PrefetchBufferCmd_0
        LDR.W    R0,??DataTable32  ;; 0x40023c00
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.W    R1,??DataTable32  ;; 0x40023c00
        STR      R0,[R1, #+0]
        B.N      ??FLASH_PrefetchBufferCmd_1
??FLASH_PrefetchBufferCmd_0:
        LDR.W    R0,??DataTable32  ;; 0x40023c00
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x2
        LDR.W    R1,??DataTable32  ;; 0x40023c00
        STR      R0,[R1, #+0]
??FLASH_PrefetchBufferCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_ReadAccess64Cmd:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??FLASH_ReadAccess64Cmd_0
        LDR.W    R0,??DataTable32  ;; 0x40023c00
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.W    R1,??DataTable32  ;; 0x40023c00
        STR      R0,[R1, #+0]
        B.N      ??FLASH_ReadAccess64Cmd_1
??FLASH_ReadAccess64Cmd_0:
        LDR.W    R0,??DataTable32  ;; 0x40023c00
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x4
        LDR.W    R1,??DataTable32  ;; 0x40023c00
        STR      R0,[R1, #+0]
??FLASH_ReadAccess64Cmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_SLEEPPowerDownCmd:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??FLASH_SLEEPPowerDownCmd_0
        LDR.W    R0,??DataTable32  ;; 0x40023c00
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.W    R1,??DataTable32  ;; 0x40023c00
        STR      R0,[R1, #+0]
        B.N      ??FLASH_SLEEPPowerDownCmd_1
??FLASH_SLEEPPowerDownCmd_0:
        LDR.W    R0,??DataTable32  ;; 0x40023c00
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x8
        LDR.W    R1,??DataTable32  ;; 0x40023c00
        STR      R0,[R1, #+0]
??FLASH_SLEEPPowerDownCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_Unlock:
        PUSH     {R7,LR}
        LDR.W    R0,??DataTable32_1  ;; 0x40023c04
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+30
        BPL.N    ??FLASH_Unlock_0
        BL       DATA_EEPROM_Unlock
        LDR.W    R0,??DataTable32_2  ;; 0x8c9daebf
        LDR.W    R1,??DataTable32_3  ;; 0x40023c10
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable32_4  ;; 0x13141516
        LDR.W    R1,??DataTable32_3  ;; 0x40023c10
        STR      R0,[R1, #+0]
??FLASH_Unlock_0:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_Lock:
        LDR.W    R0,??DataTable32_1  ;; 0x40023c04
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.W    R1,??DataTable32_1  ;; 0x40023c04
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_ErasePage:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R0,#+4
        MOV      R0,#+32768
        BL       FLASH_WaitForLastOperation
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??FLASH_ErasePage_0
        LDR.W    R0,??DataTable32_1  ;; 0x40023c04
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x200
        LDR.W    R1,??DataTable32_1  ;; 0x40023c04
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable32_1  ;; 0x40023c04
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.W    R1,??DataTable32_1  ;; 0x40023c04
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        STR      R0,[R4, #+0]
        MOV      R0,#+32768
        BL       FLASH_WaitForLastOperation
        LDR.W    R1,??DataTable32_1  ;; 0x40023c04
        LDR      R1,[R1, #+0]
        BICS     R1,R1,#0x8
        LDR.W    R2,??DataTable32_1  ;; 0x40023c04
        STR      R1,[R2, #+0]
        LDR.W    R1,??DataTable32_1  ;; 0x40023c04
        LDR      R1,[R1, #+0]
        BICS     R1,R1,#0x200
        LDR.W    R2,??DataTable32_1  ;; 0x40023c04
        STR      R1,[R2, #+0]
??FLASH_ErasePage_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_FastProgramWord:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R0,#+4
        MOV      R0,#+32768
        BL       FLASH_WaitForLastOperation
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??FLASH_FastProgramWord_0
        STR      R5,[R4, #+0]
        MOV      R0,#+32768
        BL       FLASH_WaitForLastOperation
??FLASH_FastProgramWord_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DATA_EEPROM_Unlock:
        LDR.W    R0,??DataTable32_1  ;; 0x40023c04
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+31
        BPL.N    ??DATA_EEPROM_Unlock_0
        LDR.W    R0,??DataTable32_5  ;; 0x89abcdef
        LDR.W    R1,??DataTable32_6  ;; 0x40023c0c
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable32_7  ;; 0x2030405
        LDR.W    R1,??DataTable32_6  ;; 0x40023c0c
        STR      R0,[R1, #+0]
??DATA_EEPROM_Unlock_0:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DATA_EEPROM_Lock:
        LDR.W    R0,??DataTable32_1  ;; 0x40023c04
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable32_1  ;; 0x40023c04
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DATA_EEPROM_FixedTimeProgramCmd:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??DATA_EEPROM_FixedTimeProgramCmd_0
        LDR.W    R0,??DataTable32_1  ;; 0x40023c04
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x100
        LDR.W    R1,??DataTable32_1  ;; 0x40023c04
        STR      R0,[R1, #+0]
        B.N      ??DATA_EEPROM_FixedTimeProgramCmd_1
??DATA_EEPROM_FixedTimeProgramCmd_0:
        LDR.W    R0,??DataTable32_1  ;; 0x40023c04
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x100
        LDR.W    R1,??DataTable32_1  ;; 0x40023c04
        STR      R0,[R1, #+0]
??DATA_EEPROM_FixedTimeProgramCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DATA_EEPROM_EraseByte:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R0,#+4
        MOV      R0,#+32768
        BL       FLASH_WaitForLastOperation
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??DATA_EEPROM_EraseByte_0
        MOVS     R1,#+0
        STRB     R1,[R4, #+0]
??DATA_EEPROM_EraseByte_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DATA_EEPROM_EraseHalfWord:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R0,#+4
        MOV      R0,#+32768
        BL       FLASH_WaitForLastOperation
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??DATA_EEPROM_EraseHalfWord_0
        MOVS     R1,#+0
        STRH     R1,[R4, #+0]
??DATA_EEPROM_EraseHalfWord_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DATA_EEPROM_EraseWord:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R0,#+4
        MOV      R0,#+32768
        BL       FLASH_WaitForLastOperation
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??DATA_EEPROM_EraseWord_0
        MOVS     R1,#+0
        STR      R1,[R4, #+0]
??DATA_EEPROM_EraseWord_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DATA_EEPROM_FastProgramByte:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R0,#+4
        MOVS     R6,#+0
        MOVS     R0,#+0
        MOV      R0,#+32768
        BL       FLASH_WaitForLastOperation
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??DATA_EEPROM_FastProgramByte_0
        LDR.W    R0,??DataTable32_1  ;; 0x40023c04
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x100
        LDR.W    R1,??DataTable32_1  ;; 0x40023c04
        STR      R0,[R1, #+0]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??DATA_EEPROM_FastProgramByte_1
        STRB     R5,[R4, #+0]
        MOV      R0,#+32768
        BL       FLASH_WaitForLastOperation
        B.N      ??DATA_EEPROM_FastProgramByte_0
??DATA_EEPROM_FastProgramByte_1:
        LSRS     R0,R4,#+2
        LSLS     R0,R0,#+2
        LDR      R6,[R0, #+0]
        MOVS     R0,#+255
        ANDS     R1,R4,#0x3
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R1,R1,#+3
        LSLS     R0,R0,R1
        BICS     R6,R6,R0
        LSRS     R0,R4,#+2
        LSLS     R0,R0,#+2
        BL       DATA_EEPROM_EraseWord
        MOVS     R1,R6
        LSRS     R0,R4,#+2
        LSLS     R0,R0,#+2
        BL       DATA_EEPROM_FastProgramWord
??DATA_EEPROM_FastProgramByte_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DATA_EEPROM_FastProgramHalfWord:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,#+4
        MOVS     R7,#+0
        MOVS     R0,#+0
        MOV      R0,#+32768
        BL       FLASH_WaitForLastOperation
        MOVS     R6,R0
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+4
        BNE.N    ??DATA_EEPROM_FastProgramHalfWord_0
        LDR.W    R0,??DataTable32_1  ;; 0x40023c04
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x100
        LDR.W    R1,??DataTable32_1  ;; 0x40023c04
        STR      R0,[R1, #+0]
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+0
        BEQ.N    ??DATA_EEPROM_FastProgramHalfWord_1
        STRH     R5,[R4, #+0]
        MOV      R0,#+32768
        BL       FLASH_WaitForLastOperation
        MOVS     R6,R0
        B.N      ??DATA_EEPROM_FastProgramHalfWord_0
??DATA_EEPROM_FastProgramHalfWord_1:
        ANDS     R0,R4,#0x3
        CMP      R0,#+3
        BEQ.N    ??DATA_EEPROM_FastProgramHalfWord_2
        LSRS     R0,R4,#+2
        LSLS     R0,R0,#+2
        LDR      R7,[R0, #+0]
        MOVW     R0,#+65535
        ANDS     R1,R4,#0x3
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R1,R1,#+3
        LSLS     R0,R0,R1
        BICS     R7,R7,R0
        LSRS     R0,R4,#+2
        LSLS     R0,R0,#+2
        BL       DATA_EEPROM_EraseWord
        MOVS     R6,R0
        MOVS     R1,R7
        LSRS     R0,R4,#+2
        LSLS     R0,R0,#+2
        BL       DATA_EEPROM_FastProgramWord
        MOVS     R6,R0
        B.N      ??DATA_EEPROM_FastProgramHalfWord_0
??DATA_EEPROM_FastProgramHalfWord_2:
        MOVS     R1,#+0
        MOVS     R0,R4
        BL       DATA_EEPROM_FastProgramByte
        MOVS     R1,#+0
        ADDS     R0,R4,#+1
        BL       DATA_EEPROM_FastProgramByte
??DATA_EEPROM_FastProgramHalfWord_0:
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DATA_EEPROM_FastProgramWord:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R0,#+4
        MOV      R0,#+32768
        BL       FLASH_WaitForLastOperation
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??DATA_EEPROM_FastProgramWord_0
        LDR.W    R0,??DataTable32_1  ;; 0x40023c04
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x100
        LDR.W    R1,??DataTable32_1  ;; 0x40023c04
        STR      R0,[R1, #+0]
        STR      R5,[R4, #+0]
        MOV      R0,#+32768
        BL       FLASH_WaitForLastOperation
??DATA_EEPROM_FastProgramWord_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DATA_EEPROM_ProgramByte:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R0,#+4
        MOVS     R6,#+0
        MOVS     R0,#+0
        MOV      R0,#+32768
        BL       FLASH_WaitForLastOperation
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??DATA_EEPROM_ProgramByte_0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??DATA_EEPROM_ProgramByte_1
        STRB     R5,[R4, #+0]
        MOV      R0,#+32768
        BL       FLASH_WaitForLastOperation
        B.N      ??DATA_EEPROM_ProgramByte_0
??DATA_EEPROM_ProgramByte_1:
        LSRS     R0,R4,#+2
        LSLS     R0,R0,#+2
        LDR      R6,[R0, #+0]
        MOVS     R0,#+255
        ANDS     R1,R4,#0x3
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R1,R1,#+3
        LSLS     R0,R0,R1
        BICS     R6,R6,R0
        LSRS     R0,R4,#+2
        LSLS     R0,R0,#+2
        BL       DATA_EEPROM_EraseWord
        MOVS     R1,R6
        LSRS     R0,R4,#+2
        LSLS     R0,R0,#+2
        BL       DATA_EEPROM_FastProgramWord
??DATA_EEPROM_ProgramByte_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DATA_EEPROM_ProgramHalfWord:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,#+4
        MOVS     R7,#+0
        MOVS     R0,#+0
        MOV      R0,#+32768
        BL       FLASH_WaitForLastOperation
        MOVS     R6,R0
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+4
        BNE.N    ??DATA_EEPROM_ProgramHalfWord_0
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+0
        BEQ.N    ??DATA_EEPROM_ProgramHalfWord_1
        STRH     R5,[R4, #+0]
        MOV      R0,#+32768
        BL       FLASH_WaitForLastOperation
        MOVS     R6,R0
        B.N      ??DATA_EEPROM_ProgramHalfWord_0
??DATA_EEPROM_ProgramHalfWord_1:
        ANDS     R0,R4,#0x3
        CMP      R0,#+3
        BEQ.N    ??DATA_EEPROM_ProgramHalfWord_2
        LSRS     R0,R4,#+2
        LSLS     R0,R0,#+2
        LDR      R7,[R0, #+0]
        MOVW     R0,#+65535
        ANDS     R1,R4,#0x3
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R1,R1,#+3
        LSLS     R0,R0,R1
        BICS     R7,R7,R0
        LSRS     R0,R4,#+2
        LSLS     R0,R0,#+2
        BL       DATA_EEPROM_EraseWord
        MOVS     R6,R0
        MOVS     R1,R7
        LSRS     R0,R4,#+2
        LSLS     R0,R0,#+2
        BL       DATA_EEPROM_FastProgramWord
        MOVS     R6,R0
        B.N      ??DATA_EEPROM_ProgramHalfWord_0
??DATA_EEPROM_ProgramHalfWord_2:
        MOVS     R1,#+0
        MOVS     R0,R4
        BL       DATA_EEPROM_FastProgramByte
        MOVS     R1,#+0
        ADDS     R0,R4,#+1
        BL       DATA_EEPROM_FastProgramByte
??DATA_EEPROM_ProgramHalfWord_0:
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DATA_EEPROM_ProgramWord:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R0,#+4
        MOV      R0,#+32768
        BL       FLASH_WaitForLastOperation
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??DATA_EEPROM_ProgramWord_0
        STR      R5,[R4, #+0]
        MOV      R0,#+32768
        BL       FLASH_WaitForLastOperation
??DATA_EEPROM_ProgramWord_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_OB_Unlock:
        PUSH     {R7,LR}
        LDR.W    R0,??DataTable32_1  ;; 0x40023c04
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+29
        BPL.N    ??FLASH_OB_Unlock_0
        BL       DATA_EEPROM_Unlock
        LDR.W    R0,??DataTable32_8  ;; 0xfbead9c8
        LDR.W    R1,??DataTable32_9  ;; 0x40023c14
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable32_10  ;; 0x24252627
        LDR.W    R1,??DataTable32_9  ;; 0x40023c14
        STR      R0,[R1, #+0]
??FLASH_OB_Unlock_0:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_OB_Lock:
        LDR.W    R0,??DataTable32_1  ;; 0x40023c04
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.W    R1,??DataTable32_1  ;; 0x40023c04
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_OB_Launch:
        LDR.W    R0,??DataTable32_1  ;; 0x40023c04
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x40000
        LDR.W    R1,??DataTable32_1  ;; 0x40023c04
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_OB_WRPConfig:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R0,#+0
        MOVS     R1,#+0
        MOVS     R0,#+4
        MOVS     R0,#+0
        MOVS     R0,#+0
        MOV      R0,#+32768
        BL       FLASH_WaitForLastOperation
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??FLASH_OB_WRPConfig_0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??FLASH_OB_WRPConfig_1
        LDR.N    R0,??DataTable32_11  ;; 0x1ff80008
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.N    R1,??DataTable32_12  ;; 0x1ff8000c
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,R4, LSR #+16
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MVNS     R2,R0
        ORRS     R0,R0,R2, LSL #+16
        LDR.N    R2,??DataTable32_11  ;; 0x1ff80008
        STR      R0,[R2, #+0]
        MVNS     R0,R1
        ORRS     R0,R1,R0, LSL #+16
        LDR.N    R1,??DataTable32_12  ;; 0x1ff8000c
        STR      R0,[R1, #+0]
        B.N      ??FLASH_OB_WRPConfig_2
??FLASH_OB_WRPConfig_1:
        LDR.N    R0,??DataTable32_11  ;; 0x1ff80008
        LDR      R0,[R0, #+0]
        BICS     R0,R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        UBFX     R1,R4,#+16,#+16
        EOR      R1,R1,#0xFF00
        EORS     R1,R1,#0xFF
        LDR.N    R2,??DataTable32_12  ;; 0x1ff8000c
        LDR      R2,[R2, #+0]
        ANDS     R1,R2,R1
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MVNS     R2,R0
        ORRS     R0,R0,R2, LSL #+16
        LDR.N    R2,??DataTable32_11  ;; 0x1ff80008
        STR      R0,[R2, #+0]
        MVNS     R0,R1
        ORRS     R0,R1,R0, LSL #+16
        LDR.N    R1,??DataTable32_12  ;; 0x1ff8000c
        STR      R0,[R1, #+0]
??FLASH_OB_WRPConfig_2:
        MOV      R0,#+32768
        BL       FLASH_WaitForLastOperation
??FLASH_OB_WRPConfig_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_OB_WRP1Config:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R0,#+0
        MOVS     R1,#+0
        MOVS     R0,#+4
        MOVS     R0,#+0
        MOVS     R0,#+0
        MOV      R0,#+32768
        BL       FLASH_WaitForLastOperation
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??FLASH_OB_WRP1Config_0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??FLASH_OB_WRP1Config_1
        LDR.N    R0,??DataTable32_13  ;; 0x1ff80010
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.N    R1,??DataTable32_14  ;; 0x1ff80014
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,R4, LSR #+16
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MVNS     R2,R0
        ORRS     R0,R0,R2, LSL #+16
        LDR.N    R2,??DataTable32_13  ;; 0x1ff80010
        STR      R0,[R2, #+0]
        MVNS     R0,R1
        ORRS     R0,R1,R0, LSL #+16
        LDR.N    R1,??DataTable32_14  ;; 0x1ff80014
        STR      R0,[R1, #+0]
        B.N      ??FLASH_OB_WRP1Config_2
??FLASH_OB_WRP1Config_1:
        LDR.N    R0,??DataTable32_13  ;; 0x1ff80010
        LDR      R0,[R0, #+0]
        BICS     R0,R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        UBFX     R1,R4,#+16,#+16
        EOR      R1,R1,#0xFF00
        EORS     R1,R1,#0xFF
        LDR.N    R2,??DataTable32_14  ;; 0x1ff80014
        LDR      R2,[R2, #+0]
        ANDS     R1,R2,R1
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MVNS     R2,R0
        ORRS     R0,R0,R2, LSL #+16
        LDR.N    R2,??DataTable32_13  ;; 0x1ff80010
        STR      R0,[R2, #+0]
        MVNS     R0,R1
        ORRS     R0,R1,R0, LSL #+16
        LDR.N    R1,??DataTable32_14  ;; 0x1ff80014
        STR      R0,[R1, #+0]
??FLASH_OB_WRP1Config_2:
        MOV      R0,#+32768
        BL       FLASH_WaitForLastOperation
??FLASH_OB_WRP1Config_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_OB_WRP2Config:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R0,#+0
        MOVS     R1,#+0
        MOVS     R0,#+4
        MOVS     R0,#+0
        MOVS     R0,#+0
        MOV      R0,#+32768
        BL       FLASH_WaitForLastOperation
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??FLASH_OB_WRP2Config_0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??FLASH_OB_WRP2Config_1
        LDR.N    R0,??DataTable32_15  ;; 0x1ff80018
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.N    R1,??DataTable32_16  ;; 0x1ff8001c
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,R4, LSR #+16
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MVNS     R2,R0
        ORRS     R0,R0,R2, LSL #+16
        LDR.N    R2,??DataTable32_15  ;; 0x1ff80018
        STR      R0,[R2, #+0]
        MVNS     R0,R1
        ORRS     R0,R1,R0, LSL #+16
        LDR.N    R1,??DataTable32_16  ;; 0x1ff8001c
        STR      R0,[R1, #+0]
        B.N      ??FLASH_OB_WRP2Config_2
??FLASH_OB_WRP2Config_1:
        LDR.N    R0,??DataTable32_15  ;; 0x1ff80018
        LDR      R0,[R0, #+0]
        BICS     R0,R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        UBFX     R1,R4,#+16,#+16
        EOR      R1,R1,#0xFF00
        EORS     R1,R1,#0xFF
        LDR.N    R2,??DataTable32_16  ;; 0x1ff8001c
        LDR      R2,[R2, #+0]
        ANDS     R1,R2,R1
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MVNS     R2,R0
        ORRS     R0,R0,R2, LSL #+16
        LDR.N    R2,??DataTable32_15  ;; 0x1ff80018
        STR      R0,[R2, #+0]
        MVNS     R0,R1
        ORRS     R0,R1,R0, LSL #+16
        LDR.N    R1,??DataTable32_16  ;; 0x1ff8001c
        STR      R0,[R1, #+0]
??FLASH_OB_WRP2Config_2:
        MOV      R0,#+32768
        BL       FLASH_WaitForLastOperation
??FLASH_OB_WRP2Config_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_OB_RDPConfig:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R0,#+4
        MOVS     R1,#+0
        MOVS     R1,#+0
        MOV      R0,#+32768
        BL       FLASH_WaitForLastOperation
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MVNS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ORRS     R1,R4,R1, LSL #+16
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??FLASH_OB_RDPConfig_0
        LDR.N    R0,??DataTable32_17  ;; 0x1ff80000
        STR      R1,[R0, #+0]
??FLASH_OB_RDPConfig_0:
        MOV      R0,#+32768
        BL       FLASH_WaitForLastOperation
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_OB_UserConfig:
        PUSH     {R4,LR}
        MOVS     R3,R0
        MOVS     R0,#+4
        MOVS     R4,#+0
        MOVS     R0,#+0
        LDR.N    R0,??DataTable32_18  ;; 0x40023c1c
        LDR      R0,[R0, #+0]
        UBFX     R0,R0,#+16,#+4
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ORRS     R4,R1,R3
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ORRS     R4,R2,R4
        ORRS     R4,R0,R4
        MVNS     R4,R4
        LSLS     R4,R4,#+16
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ORRS     R1,R1,R3
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ORRS     R1,R2,R1
        ORRS     R0,R0,R1
        ORRS     R4,R0,R4
        MOV      R0,#+32768
        BL       FLASH_WaitForLastOperation
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??FLASH_OB_UserConfig_0
        LDR.N    R0,??DataTable32_19  ;; 0x1ff80004
        STR      R4,[R0, #+0]
??FLASH_OB_UserConfig_0:
        MOV      R0,#+32768
        BL       FLASH_WaitForLastOperation
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_OB_BORConfig:
        PUSH     {R4,LR}
        MOVS     R1,R0
        MOVS     R0,#+4
        MOVS     R4,#+0
        MOVS     R0,#+0
        LDR.N    R0,??DataTable32_18  ;; 0x40023c1c
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+16
        ANDS     R0,R0,#0xF0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ORRS     R2,R0,R1
        MVNS     R2,R2
        LSLS     R4,R2,#+16
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ORRS     R0,R0,R1
        ORRS     R4,R0,R4
        MOV      R0,#+32768
        BL       FLASH_WaitForLastOperation
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??FLASH_OB_BORConfig_0
        LDR.N    R0,??DataTable32_19  ;; 0x1ff80004
        STR      R4,[R0, #+0]
??FLASH_OB_BORConfig_0:
        MOV      R0,#+32768
        BL       FLASH_WaitForLastOperation
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_OB_BootConfig:
        PUSH     {R4,LR}
        MOVS     R1,R0
        MOVS     R0,#+4
        MOVS     R4,#+0
        MOVS     R0,#+0
        LDR.N    R0,??DataTable32_18  ;; 0x40023c1c
        LDR      R0,[R0, #+0]
        UBFX     R0,R0,#+16,#+7
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ORRS     R2,R0,R1
        MVNS     R2,R2
        LSLS     R4,R2,#+16
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ORRS     R0,R0,R1
        ORRS     R4,R0,R4
        MOV      R0,#+32768
        BL       FLASH_WaitForLastOperation
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??FLASH_OB_BootConfig_0
        LDR.N    R0,??DataTable32_19  ;; 0x1ff80004
        STR      R4,[R0, #+0]
??FLASH_OB_BootConfig_0:
        MOV      R0,#+32768
        BL       FLASH_WaitForLastOperation
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_OB_GetUser:
        LDR.N    R0,??DataTable32_18  ;; 0x40023c1c
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+20
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_OB_GetWRP:
        LDR.N    R0,??DataTable32_20  ;; 0x40023c20
        LDR      R0,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_OB_GetWRP1:
        LDR.N    R0,??DataTable32_21  ;; 0x40023c80
        LDR      R0,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_OB_GetWRP2:
        LDR.N    R0,??DataTable32_22  ;; 0x40023c84
        LDR      R0,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_OB_GetRDP:
        MOVS     R0,#+0
        LDR.N    R0,??DataTable32_18  ;; 0x40023c1c
        LDR      R0,[R0, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+170
        BEQ.N    ??FLASH_OB_GetRDP_0
        MOVS     R0,#+1
        B.N      ??FLASH_OB_GetRDP_1
??FLASH_OB_GetRDP_0:
        MOVS     R0,#+0
??FLASH_OB_GetRDP_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_OB_GetBOR:
        LDR.N    R0,??DataTable32_18  ;; 0x40023c1c
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+16
        ANDS     R0,R0,#0xF
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_ITConfig:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??FLASH_ITConfig_0
        LDR.N    R1,??DataTable32_1  ;; 0x40023c04
        LDR      R1,[R1, #+0]
        ORRS     R0,R0,R1
        LDR.N    R1,??DataTable32_1  ;; 0x40023c04
        STR      R0,[R1, #+0]
        B.N      ??FLASH_ITConfig_1
??FLASH_ITConfig_0:
        LDR.N    R1,??DataTable32_1  ;; 0x40023c04
        LDR      R1,[R1, #+0]
        BICS     R0,R1,R0
        LDR.N    R1,??DataTable32_1  ;; 0x40023c04
        STR      R0,[R1, #+0]
??FLASH_ITConfig_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_GetFlagStatus:
        MOVS     R1,#+0
        LDR.N    R1,??DataTable32_23  ;; 0x40023c18
        LDR      R1,[R1, #+0]
        TST      R1,R0
        BEQ.N    ??FLASH_GetFlagStatus_0
        MOVS     R1,#+1
        B.N      ??FLASH_GetFlagStatus_1
??FLASH_GetFlagStatus_0:
        MOVS     R1,#+0
??FLASH_GetFlagStatus_1:
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_ClearFlag:
        LDR.N    R1,??DataTable32_23  ;; 0x40023c18
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_GetStatus:
        MOVS     R0,#+4
        LDR.N    R0,??DataTable32_23  ;; 0x40023c18
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+31
        BPL.N    ??FLASH_GetStatus_0
        MOVS     R0,#+1
        B.N      ??FLASH_GetStatus_1
??FLASH_GetStatus_0:
        LDR.N    R0,??DataTable32_23  ;; 0x40023c18
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+23
        BPL.N    ??FLASH_GetStatus_2
        MOVS     R0,#+2
        B.N      ??FLASH_GetStatus_1
??FLASH_GetStatus_2:
        LDR.N    R0,??DataTable32_23  ;; 0x40023c18
        LDR      R0,[R0, #+0]
        TST      R0,#0x1E00
        BEQ.N    ??FLASH_GetStatus_3
        MOVS     R0,#+3
        B.N      ??FLASH_GetStatus_1
??FLASH_GetStatus_3:
        MOVS     R0,#+4
??FLASH_GetStatus_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable32:
        DC32     0x40023c00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable32_1:
        DC32     0x40023c04

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable32_2:
        DC32     0x8c9daebf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable32_3:
        DC32     0x40023c10

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable32_4:
        DC32     0x13141516

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable32_5:
        DC32     0x89abcdef

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable32_6:
        DC32     0x40023c0c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable32_7:
        DC32     0x2030405

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable32_8:
        DC32     0xfbead9c8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable32_9:
        DC32     0x40023c14

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable32_10:
        DC32     0x24252627

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable32_11:
        DC32     0x1ff80008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable32_12:
        DC32     0x1ff8000c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable32_13:
        DC32     0x1ff80010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable32_14:
        DC32     0x1ff80014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable32_15:
        DC32     0x1ff80018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable32_16:
        DC32     0x1ff8001c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable32_17:
        DC32     0x1ff80000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable32_18:
        DC32     0x40023c1c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable32_19:
        DC32     0x1ff80004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable32_20:
        DC32     0x40023c20

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable32_21:
        DC32     0x40023c80

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable32_22:
        DC32     0x40023c84

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable32_23:
        DC32     0x40023c18

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_WaitForLastOperation:
        PUSH     {R4,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R0
        MOVS     R0,#+4
        STRB     R0,[SP, #+0]
        BL       FLASH_GetStatus
        STRB     R0,[SP, #+0]
        B.N      ??FLASH_WaitForLastOperation_0
??FLASH_WaitForLastOperation_1:
        BL       FLASH_GetStatus
        STRB     R0,[SP, #+0]
        SUBS     R4,R4,#+1
??FLASH_WaitForLastOperation_0:
        LDRB     R0,[SP, #+0]
        CMP      R0,#+1
        BNE.N    ??FLASH_WaitForLastOperation_2
        CMP      R4,#+0
        BNE.N    ??FLASH_WaitForLastOperation_1
??FLASH_WaitForLastOperation_2:
        CMP      R4,#+0
        BNE.N    ??FLASH_WaitForLastOperation_3
        MOVS     R0,#+5
        STRB     R0,[SP, #+0]
??FLASH_WaitForLastOperation_3:
        LDRB     R0,[SP, #+0]
        POP      {R1,R2,R4,PC}    ;; return

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
// 2 124 bytes in section .text
// 
// 2 124 bytes of CODE memory
//
//Errors: none
//Warnings: none
