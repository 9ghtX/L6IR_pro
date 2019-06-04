///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.70.1.11437/W32 for ARM      18/Apr/2019  18:40:51
// Copyright 1999-2016 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\projects\L6IR\programm\L6_pro\system_init.c
//    Command line =  
//        E:\projects\L6IR\programm\L6_pro\system_init.c -D
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
//        E:\projects\L6IR\programm\L6_pro\Release\List\system_init.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN ADC_Cmd
        EXTERN ADC_CommonStructInit
        EXTERN ADC_ContinuousModeCmd
        EXTERN ADC_DMACmd
        EXTERN ADC_DMARequestAfterLastTransferCmd
        EXTERN ADC_DeInit
        EXTERN ADC_DelaySelectionConfig
        EXTERN ADC_GetFlagStatus
        EXTERN ADC_Init
        EXTERN ADC_RegularChannelConfig
        EXTERN ADC_SoftwareStartConv
        EXTERN DMA_Cmd
        EXTERN DMA_DeInit
        EXTERN DMA_Init
        EXTERN GPIO_Init
        EXTERN GPIO_PinAFConfig
        EXTERN GPIO_SetBits
        EXTERN I2C_Init
        EXTERN NVIC_Init
        EXTERN NVIC_PriorityGroupConfig
        EXTERN NVIC_SetVectorTable
        EXTERN RCC_AHBPeriphClockCmd
        EXTERN RCC_APB1PeriphClockCmd
        EXTERN RCC_APB1PeriphResetCmd
        EXTERN RCC_APB2PeriphClockCmd
        EXTERN RCC_HSICmd
        EXTERN SPI_Cmd
        EXTERN SPI_Init
        EXTERN USART_Cmd
        EXTERN USART_DeInit
        EXTERN USART_ITConfig
        EXTERN USART_Init

        PUBLIC ADCBuffer
        PUBLIC ADC_data
        PUBLIC ADC_init_func
        PUBLIC GPIO_Configuration
        PUBLIC I2C_LowLevel_Init
        PUBLIC NVIC_Configuration
        PUBLIC SPI_init_func
        PUBLIC UART_init
        PUBLIC timers_config


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_Configuration:
        PUSH     {LR}
        SUB      SP,SP,#+12
        MOVS     R1,#+1
        MOVS     R0,#+2
        BL       RCC_AHBPeriphClockCmd
        MOVS     R1,#+1
        MOVS     R0,#+1
        BL       RCC_AHBPeriphClockCmd
        MOVS     R1,#+1
        MOV      R0,#+16384
        BL       RCC_APB2PeriphClockCmd
        MOVS     R1,#+1
        MOV      R0,#+512
        BL       RCC_APB2PeriphClockCmd
        MOVS     R1,#+1
        MOVS     R0,#+16777216
        BL       RCC_AHBPeriphClockCmd
        MOVS     R1,#+1
        MOV      R0,#+16384
        BL       RCC_APB1PeriphClockCmd
        MOVS     R1,#+1
        MOVS     R0,#+2097152
        BL       RCC_APB1PeriphClockCmd
        MOVS     R1,#+1
        MOVS     R0,#+4194304
        BL       RCC_APB1PeriphClockCmd
        MOVS     R0,#+1
        BL       RCC_HSICmd
        MOVS     R0,#+67
        STR      R0,[SP, #+0]
        MOVS     R0,#+3
        STRB     R0,[SP, #+4]
        MOVS     R0,#+0
        STRB     R0,[SP, #+6]
        MOVS     R0,#+0
        STRB     R0,[SP, #+7]
        MOVS     R0,#+3
        STRB     R0,[SP, #+5]
        MOV      R1,SP
        LDR.W    R0,??DataTable4  ;; 0x40020000
        BL       GPIO_Init
        MOV      R0,#+1536
        STR      R0,[SP, #+0]
        MOVS     R0,#+2
        STRB     R0,[SP, #+4]
        MOVS     R0,#+0
        STRB     R0,[SP, #+6]
        MOVS     R0,#+0
        STRB     R0,[SP, #+7]
        MOVS     R0,#+3
        STRB     R0,[SP, #+5]
        MOV      R1,SP
        LDR.W    R0,??DataTable4  ;; 0x40020000
        BL       GPIO_Init
        MOVS     R2,#+7
        MOVS     R1,#+9
        LDR.W    R0,??DataTable4  ;; 0x40020000
        BL       GPIO_PinAFConfig
        MOVS     R2,#+7
        MOVS     R1,#+10
        LDR.W    R0,??DataTable4  ;; 0x40020000
        BL       GPIO_PinAFConfig
        MOV      R0,#+384
        STR      R0,[SP, #+0]
        MOVS     R0,#+1
        STRB     R0,[SP, #+4]
        MOVS     R0,#+0
        STRB     R0,[SP, #+6]
        MOVS     R0,#+0
        STRB     R0,[SP, #+7]
        MOVS     R0,#+3
        STRB     R0,[SP, #+5]
        MOV      R1,SP
        LDR.W    R0,??DataTable4  ;; 0x40020000
        BL       GPIO_Init
        MOVS     R0,#+24
        STR      R0,[SP, #+0]
        MOVS     R0,#+0
        STRB     R0,[SP, #+4]
        MOVS     R0,#+1
        STRB     R0,[SP, #+7]
        MOVS     R0,#+3
        STRB     R0,[SP, #+5]
        MOV      R1,SP
        LDR.W    R0,??DataTable4  ;; 0x40020000
        BL       GPIO_Init
        MOVS     R0,#+32
        STR      R0,[SP, #+0]
        MOVS     R0,#+1
        STRB     R0,[SP, #+4]
        MOVS     R0,#+0
        STRB     R0,[SP, #+6]
        MOVS     R0,#+0
        STRB     R0,[SP, #+7]
        MOVS     R0,#+3
        STRB     R0,[SP, #+5]
        MOV      R1,SP
        LDR.W    R0,??DataTable4_1  ;; 0x40020400
        BL       GPIO_Init
        MOVS     R1,#+32
        LDR.W    R0,??DataTable4_1  ;; 0x40020400
        BL       GPIO_SetBits
        MOVS     R0,#+192
        STR      R0,[SP, #+0]
        MOVS     R0,#+2
        STRB     R0,[SP, #+4]
        MOVS     R0,#+0
        STRB     R0,[SP, #+6]
        MOVS     R0,#+0
        STRB     R0,[SP, #+7]
        MOVS     R0,#+3
        STRB     R0,[SP, #+5]
        MOV      R1,SP
        LDR.W    R0,??DataTable4_1  ;; 0x40020400
        BL       GPIO_Init
        MOVS     R2,#+4
        MOVS     R1,#+6
        LDR.W    R0,??DataTable4_1  ;; 0x40020400
        BL       GPIO_PinAFConfig
        MOVS     R2,#+4
        MOVS     R1,#+7
        LDR.W    R0,??DataTable4_1  ;; 0x40020400
        BL       GPIO_PinAFConfig
        MOV      R0,#+1024
        STR      R0,[SP, #+0]
        MOVS     R0,#+2
        STRB     R0,[SP, #+4]
        MOVS     R0,#+0
        STRB     R0,[SP, #+6]
        MOVS     R0,#+0
        STRB     R0,[SP, #+7]
        MOVS     R0,#+3
        STRB     R0,[SP, #+5]
        MOV      R1,SP
        LDR.W    R0,??DataTable4_1  ;; 0x40020400
        BL       GPIO_Init
        MOV      R0,#+2048
        STR      R0,[SP, #+0]
        MOVS     R0,#+2
        STRB     R0,[SP, #+4]
        MOVS     R0,#+0
        STRB     R0,[SP, #+6]
        MOVS     R0,#+0
        STRB     R0,[SP, #+7]
        MOVS     R0,#+3
        STRB     R0,[SP, #+5]
        MOV      R1,SP
        LDR.W    R0,??DataTable4_1  ;; 0x40020400
        BL       GPIO_Init
        MOVS     R2,#+4
        MOVS     R1,#+10
        LDR.W    R0,??DataTable4_1  ;; 0x40020400
        BL       GPIO_PinAFConfig
        MOVS     R2,#+4
        MOVS     R1,#+11
        LDR.W    R0,??DataTable4_1  ;; 0x40020400
        BL       GPIO_PinAFConfig
        MOV      R0,#+40960
        STR      R0,[SP, #+0]
        MOVS     R0,#+2
        STRB     R0,[SP, #+4]
        MOVS     R0,#+0
        STRB     R0,[SP, #+6]
        MOVS     R0,#+2
        STRB     R0,[SP, #+7]
        MOVS     R0,#+3
        STRB     R0,[SP, #+5]
        MOV      R1,SP
        LDR.W    R0,??DataTable4_1  ;; 0x40020400
        BL       GPIO_Init
        MOV      R0,#+16384
        STR      R0,[SP, #+0]
        MOVS     R0,#+2
        STRB     R0,[SP, #+4]
        MOVS     R0,#+0
        STRB     R0,[SP, #+6]
        MOVS     R0,#+2
        STRB     R0,[SP, #+7]
        MOVS     R0,#+3
        STRB     R0,[SP, #+5]
        MOV      R1,SP
        LDR.N    R0,??DataTable4_1  ;; 0x40020400
        BL       GPIO_Init
        MOVS     R2,#+5
        MOVS     R1,#+13
        LDR.N    R0,??DataTable4_1  ;; 0x40020400
        BL       GPIO_PinAFConfig
        MOVS     R2,#+5
        MOVS     R1,#+14
        LDR.N    R0,??DataTable4_1  ;; 0x40020400
        BL       GPIO_PinAFConfig
        MOVS     R2,#+5
        MOVS     R1,#+15
        LDR.N    R0,??DataTable4_1  ;; 0x40020400
        BL       GPIO_PinAFConfig
        MOV      R0,#+4096
        STR      R0,[SP, #+0]
        MOVS     R0,#+1
        STRB     R0,[SP, #+4]
        MOVS     R0,#+0
        STRB     R0,[SP, #+6]
        MOVS     R0,#+0
        STRB     R0,[SP, #+7]
        MOVS     R0,#+3
        STRB     R0,[SP, #+5]
        MOV      R1,SP
        LDR.N    R0,??DataTable4_1  ;; 0x40020400
        BL       GPIO_Init
        MOVS     R0,#+7
        STR      R0,[SP, #+0]
        MOVS     R0,#+0
        STRB     R0,[SP, #+4]
        MOVS     R0,#+1
        STRB     R0,[SP, #+7]
        MOVS     R0,#+3
        STRB     R0,[SP, #+5]
        MOV      R1,SP
        LDR.N    R0,??DataTable4_1  ;; 0x40020400
        BL       GPIO_Init
        POP      {R0-R2,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NVIC_Configuration:
        PUSH     {R7,LR}
        MOVS     R1,#+0
        MOVS     R0,#+134217728
        BL       NVIC_SetVectorTable
        MOV      R0,#+1792
        BL       NVIC_PriorityGroupConfig
        MOVS     R0,#+37
        STRB     R0,[SP, #+0]
        MOVS     R0,#+0
        STRB     R0,[SP, #+2]
        MOVS     R0,#+1
        STRB     R0,[SP, #+3]
        MOV      R0,SP
        BL       NVIC_Init
        MOVS     R0,#+40
        STRB     R0,[SP, #+0]
        MOVS     R0,#+15
        STRB     R0,[SP, #+1]
        MOVS     R0,#+15
        STRB     R0,[SP, #+2]
        MOVS     R0,#+1
        STRB     R0,[SP, #+3]
        MOV      R0,SP
        BL       NVIC_Init
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
UART_init:
        PUSH     {LR}
        SUB      SP,SP,#+20
        LDR.N    R0,??DataTable4_2  ;; 0x40013800
        BL       USART_DeInit
        MOVS     R0,#+115200
        STR      R0,[SP, #+0]
        MOVS     R0,#+0
        STRH     R0,[SP, #+4]
        MOVS     R0,#+0
        STRH     R0,[SP, #+6]
        MOVS     R0,#+0
        STRH     R0,[SP, #+8]
        MOVS     R0,#+0
        STRH     R0,[SP, #+12]
        MOVS     R0,#+12
        STRH     R0,[SP, #+10]
        MOV      R1,SP
        LDR.N    R0,??DataTable4_2  ;; 0x40013800
        BL       USART_Init
        MOVS     R2,#+1
        MOVW     R1,#+1574
        LDR.N    R0,??DataTable4_2  ;; 0x40013800
        BL       USART_ITConfig
        MOVS     R2,#+1
        MOVW     R1,#+1317
        LDR.N    R0,??DataTable4_2  ;; 0x40013800
        BL       USART_ITConfig
        MOVS     R1,#+1
        LDR.N    R0,??DataTable4_2  ;; 0x40013800
        BL       USART_Cmd
        ADD      SP,SP,#+20
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_init_func:
        PUSH     {LR}
        SUB      SP,SP,#+20
        MOVS     R0,#+0
        STRH     R0,[SP, #+0]
        MOV      R0,#+260
        STRH     R0,[SP, #+2]
        MOVS     R0,#+0
        STRH     R0,[SP, #+4]
        MOVS     R0,#+0
        STRH     R0,[SP, #+6]
        MOVS     R0,#+0
        STRH     R0,[SP, #+8]
        MOV      R0,#+512
        STRH     R0,[SP, #+10]
        MOVS     R0,#+8
        STRH     R0,[SP, #+12]
        MOVS     R0,#+0
        STRH     R0,[SP, #+14]
        MOV      R1,#+4096
        LDR.N    R0,??DataTable4_1  ;; 0x40020400
        BL       GPIO_SetBits
        MOV      R1,SP
        LDR.N    R0,??DataTable4_3  ;; 0x40003800
        BL       SPI_Init
        MOVS     R1,#+1
        LDR.N    R0,??DataTable4_3  ;; 0x40003800
        BL       SPI_Cmd
        ADD      SP,SP,#+20
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_LowLevel_Init:
        PUSH     {R4,LR}
        SUB      SP,SP,#+24
        MOVS     R4,R0
        MOVS     R1,#+1
        MOVS     R0,#+2
        BL       RCC_AHBPeriphClockCmd
        MOVS     R1,#+1
        MOVS     R0,#+16777216
        BL       RCC_AHBPeriphClockCmd
        MOVS     R1,#+1
        MOVS     R0,#+4194304
        BL       RCC_APB1PeriphClockCmd
        LDR.N    R0,??DataTable4_4  ;; 0x40005400
        CMP      R4,R0
        BNE.N    ??I2C_LowLevel_Init_0
        MOVS     R1,#+1
        MOVS     R0,#+2097152
        BL       RCC_APB1PeriphClockCmd
        MOVS     R0,#+192
        STR      R0,[SP, #+0]
        MOVS     R0,#+2
        STRB     R0,[SP, #+4]
        MOVS     R0,#+1
        STRB     R0,[SP, #+6]
        MOVS     R0,#+0
        STRB     R0,[SP, #+7]
        MOVS     R0,#+0
        STRB     R0,[SP, #+5]
        MOV      R1,SP
        LDR.N    R0,??DataTable4_1  ;; 0x40020400
        BL       GPIO_Init
        MOVS     R2,#+4
        MOVS     R1,#+6
        LDR.N    R0,??DataTable4_1  ;; 0x40020400
        BL       GPIO_PinAFConfig
        MOVS     R2,#+4
        MOVS     R1,#+7
        LDR.N    R0,??DataTable4_1  ;; 0x40020400
        BL       GPIO_PinAFConfig
        MOVS     R1,#+1
        MOVS     R0,#+2097152
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+2097152
        BL       RCC_APB1PeriphResetCmd
        B.N      ??I2C_LowLevel_Init_1
??I2C_LowLevel_Init_0:
        MOVS     R1,#+1
        MOVS     R0,#+4194304
        BL       RCC_APB1PeriphClockCmd
        MOV      R0,#+3072
        STR      R0,[SP, #+0]
        MOVS     R0,#+2
        STRB     R0,[SP, #+4]
        MOVS     R0,#+1
        STRB     R0,[SP, #+6]
        MOVS     R0,#+1
        STRB     R0,[SP, #+7]
        MOVS     R0,#+0
        STRB     R0,[SP, #+5]
        MOV      R1,SP
        LDR.N    R0,??DataTable4_1  ;; 0x40020400
        BL       GPIO_Init
        MOVS     R2,#+4
        MOVS     R1,#+10
        LDR.N    R0,??DataTable4_1  ;; 0x40020400
        BL       GPIO_PinAFConfig
        MOVS     R2,#+4
        MOVS     R1,#+11
        LDR.N    R0,??DataTable4_1  ;; 0x40020400
        BL       GPIO_PinAFConfig
        MOVS     R1,#+1
        MOVS     R0,#+4194304
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+4194304
        BL       RCC_APB1PeriphResetCmd
??I2C_LowLevel_Init_1:
        MOVS     R0,#+0
        STRH     R0,[SP, #+12]
        MOVW     R0,#+49151
        STRH     R0,[SP, #+14]
        MOVS     R0,#+0
        STRH     R0,[SP, #+16]
        MOV      R0,#+1024
        STRH     R0,[SP, #+18]
        MOV      R0,#+16384
        STRH     R0,[SP, #+20]
        LDR.N    R0,??DataTable4_5  ;; 0x186a0
        STR      R0,[SP, #+8]
        ADD      R1,SP,#+8
        LDR.N    R0,??DataTable4_4  ;; 0x40005400
        BL       I2C_Init
        MOVS     R0,#+0
        STRH     R0,[SP, #+16]
        ADD      R1,SP,#+8
        LDR.N    R0,??DataTable4_6  ;; 0x40005800
        BL       I2C_Init
        ADD      SP,SP,#+24
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
timers_config:
        BX       LR               ;; return

        SECTION `.data`:DATA:REORDER:NOROOT(2)
        DATA
ADCBuffer:
        DC16 43690, 43690, 43690
        DC8 0, 0

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
ADC_data:
        DS8 8

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_init_func:
        PUSH     {LR}
        SUB      SP,SP,#+76
        LDR.N    R0,??DataTable4_7  ;; 0x40012400
        BL       ADC_DeInit
        LDR.N    R0,??DataTable4_8  ;; 0x40026008
        BL       DMA_DeInit
        MOVS     R0,#+3
        STR      R0,[SP, #+16]
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
        MOVS     R0,#+0
        STR      R0,[SP, #+44]
        LDR.N    R0,??DataTable4_9
        STR      R0,[SP, #+8]
        MOV      R0,#+1024
        STR      R0,[SP, #+32]
        MOVS     R0,#+128
        STR      R0,[SP, #+24]
        MOVS     R0,#+32
        STR      R0,[SP, #+36]
        LDR.N    R0,??DataTable4_10  ;; 0x40012458
        STR      R0,[SP, #+4]
        MOV      R0,#+256
        STR      R0,[SP, #+28]
        MOVS     R0,#+0
        STR      R0,[SP, #+20]
        MOV      R0,#+8192
        STR      R0,[SP, #+40]
        ADD      R1,SP,#+4
        LDR.N    R0,??DataTable4_8  ;; 0x40026008
        BL       DMA_Init
        MOVS     R1,#+1
        LDR.N    R0,??DataTable4_8  ;; 0x40026008
        BL       DMA_Cmd
        MOVS     R0,#+0
        STR      R0,[SP, #+48]
        MOVS     R0,#+1
        STRB     R0,[SP, #+52]
        MOVS     R0,#+1
        STRB     R0,[SP, #+53]
        MOVS     R0,#+0
        STR      R0,[SP, #+56]
        MOVS     R0,#+0
        STR      R0,[SP, #+64]
        MOVS     R0,#+3
        STRB     R0,[SP, #+68]
        ADD      R1,SP,#+48
        LDR.N    R0,??DataTable4_7  ;; 0x40012400
        BL       ADC_Init
        MOVS     R0,#+131072
        STR      R0,[SP, #+0]
        MOV      R0,SP
        BL       ADC_CommonStructInit
        MOVS     R3,#+7
        MOVS     R2,#+1
        MOVS     R1,#+0
        LDR.N    R0,??DataTable4_7  ;; 0x40012400
        BL       ADC_RegularChannelConfig
        MOVS     R3,#+7
        MOVS     R2,#+2
        MOVS     R1,#+1
        LDR.N    R0,??DataTable4_7  ;; 0x40012400
        BL       ADC_RegularChannelConfig
        MOVS     R3,#+7
        MOVS     R2,#+3
        MOVS     R1,#+6
        LDR.N    R0,??DataTable4_7  ;; 0x40012400
        BL       ADC_RegularChannelConfig
        MOVS     R1,#+16
        LDR.N    R0,??DataTable4_7  ;; 0x40012400
        BL       ADC_DelaySelectionConfig
        MOVS     R1,#+1
        LDR.N    R0,??DataTable4_7  ;; 0x40012400
        BL       ADC_ContinuousModeCmd
        MOVS     R1,#+1
        LDR.N    R0,??DataTable4_7  ;; 0x40012400
        BL       ADC_DMARequestAfterLastTransferCmd
        MOVS     R1,#+1
        LDR.N    R0,??DataTable4_7  ;; 0x40012400
        BL       ADC_DMACmd
        MOVS     R1,#+1
        LDR.N    R0,??DataTable4_8  ;; 0x40026008
        BL       DMA_Cmd
        MOVS     R1,#+1
        LDR.N    R0,??DataTable4_7  ;; 0x40012400
        BL       ADC_Cmd
??ADC_init_func_0:
        MOVS     R1,#+64
        LDR.N    R0,??DataTable4_7  ;; 0x40012400
        BL       ADC_GetFlagStatus
        CMP      R0,#+0
        BEQ.N    ??ADC_init_func_0
        LDR.N    R0,??DataTable4_7  ;; 0x40012400
        BL       ADC_SoftwareStartConv
        ADD      SP,SP,#+76
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     0x40020000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     0x40020400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     0x40013800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     0x40003800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     0x40005400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     0x186a0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_6:
        DC32     0x40005800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_7:
        DC32     0x40012400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_8:
        DC32     0x40026008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_9:
        DC32     ADC_data

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_10:
        DC32     0x40012458

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
//     8 bytes in section .bss
//     8 bytes in section .data
// 1 470 bytes in section .text
// 
// 1 470 bytes of CODE memory
//    16 bytes of DATA memory
//
//Errors: none
//Warnings: 1
