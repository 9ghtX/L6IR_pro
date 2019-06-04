///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.70.1.11437/W32 for ARM      18/Apr/2019  18:40:46
// Copyright 1999-2016 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\projects\L6IR\programm\L6_pro\mcu\stm32l1xx_it.c
//    Command line =  
//        E:\projects\L6IR\programm\L6_pro\mcu\stm32l1xx_it.c -D
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
//        E:\projects\L6IR\programm\L6_pro\Release\List\stm32l1xx_it.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN GPIO_ResetBits
        EXTERN GPIO_SetBits
        EXTERN Operator_present_control
        EXTERN RXbuf
        EXTERN TXbuf
        EXTERN USART_GetITStatus
        EXTERN USART_ITConfig
        EXTERN USART_ReceiveData
        EXTERN USART_SendData
        EXTERN clean
        EXTERN error_counter
        EXTERN expo_timeout
        EXTERN galenic_counter
        EXTERN get_empty
        EXTERN get_full
        EXTERN key1_count
        EXTERN keys_syncro_func
        EXTERN led_brightnes
        EXTERN led_off
        EXTERN led_pulse_control
        EXTERN led_pulse_enable
        EXTERN marks_syncro_func
        EXTERN net_counter
        EXTERN `pop`
        EXTERN `push`
        EXTERN rs_frame
        EXTERN sens_synchro_func
        EXTERN spi_sichro_func
        EXTERN system_ticks
        EXTERN system_wait_timer
        EXTERN task_flag

        PUBLIC BusFault_Handler
        PUBLIC DebugMon_Handler
        PUBLIC HardFault_Handler
        PUBLIC MemManage_Handler
        PUBLIC NMI_Handler
        PUBLIC PendSV_Handler
        PUBLIC SVC_Handler
        PUBLIC SysTick_Handler
        PUBLIC USART1_IRQHandler
        PUBLIC UsageFault_Handler
        PUBLIC counter_sys
        PUBLIC net_fault_flag


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NMI_Handler:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HardFault_Handler:
??HardFault_Handler_0:
        B.N      ??HardFault_Handler_0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
MemManage_Handler:
??MemManage_Handler_0:
        B.N      ??MemManage_Handler_0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BusFault_Handler:
??BusFault_Handler_0:
        B.N      ??BusFault_Handler_0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
UsageFault_Handler:
??UsageFault_Handler_0:
        B.N      ??UsageFault_Handler_0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SVC_Handler:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DebugMon_Handler:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
PendSV_Handler:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART1_IRQHandler:
        PUSH     {R4,LR}
        MOVW     R1,#+1317
        LDR.N    R0,??DataTable1  ;; 0x40013800
        BL       USART_GetITStatus
        CMP      R0,#+0
        BEQ.N    ??USART1_IRQHandler_0
        LDR.N    R0,??DataTable1  ;; 0x40013800
        BL       USART_ReceiveData
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+36
        BNE.N    ??USART1_IRQHandler_1
        LDR.N    R0,??DataTable1_1
        BL       clean
??USART1_IRQHandler_1:
        LDR.N    R0,??DataTable1_1
        BL       get_full
        CMP      R0,#+0
        BNE.N    ??USART1_IRQHandler_0
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable1_1
        BL       `push`
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+59
        BNE.N    ??USART1_IRQHandler_0
        MOVS     R0,#+1
        LDR.N    R1,??DataTable1_2
        STRB     R0,[R1, #+0]
??USART1_IRQHandler_0:
        MOVW     R1,#+1574
        LDR.N    R0,??DataTable1  ;; 0x40013800
        BL       USART_GetITStatus
        CMP      R0,#+0
        BEQ.N    ??USART1_IRQHandler_2
        LDR.N    R0,??DataTable1_3
        BL       get_empty
        CMP      R0,#+0
        BNE.N    ??USART1_IRQHandler_3
        LDR.N    R0,??DataTable1_3
        BL       `pop`
        MOVS     R4,R0
        MOV      R1,#+256
        LDR.N    R0,??DataTable1_4  ;; 0x40020000
        BL       GPIO_SetBits
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,R4
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.N    R0,??DataTable1  ;; 0x40013800
        BL       USART_SendData
        B.N      ??USART1_IRQHandler_2
??USART1_IRQHandler_3:
        MOVS     R2,#+0
        MOVW     R1,#+1574
        LDR.N    R0,??DataTable1  ;; 0x40013800
        BL       USART_ITConfig
        MOV      R1,#+256
        LDR.N    R0,??DataTable1_4  ;; 0x40020000
        BL       GPIO_ResetBits
??USART1_IRQHandler_2:
        MOVS     R1,#+96
        LDR.N    R0,??DataTable1  ;; 0x40013800
        BL       USART_GetITStatus
        CMP      R0,#+0
        BEQ.N    ??USART1_IRQHandler_4
        MOVS     R4,#+0
??USART1_IRQHandler_4:
        MOVS     R1,#+40
        LDR.N    R0,??DataTable1  ;; 0x40013800
        BL       USART_GetITStatus
        CMP      R0,#+0
        BEQ.N    ??USART1_IRQHandler_5
        MOVS     R4,#+0
??USART1_IRQHandler_5:
        MOVW     R1,#+2410
        LDR.N    R0,??DataTable1  ;; 0x40013800
        BL       USART_GetITStatus
        CMP      R0,#+0
        BEQ.N    ??USART1_IRQHandler_6
        MOVS     R4,#+0
??USART1_IRQHandler_6:
        MOV      R1,#+608
        LDR.N    R0,??DataTable1  ;; 0x40013800
        BL       USART_GetITStatus
        CMP      R0,#+0
        BEQ.N    ??USART1_IRQHandler_7
        MOVS     R4,#+0
??USART1_IRQHandler_7:
        MOV      R1,#+352
        LDR.N    R0,??DataTable1  ;; 0x40013800
        BL       USART_GetITStatus
        CMP      R0,#+0
        BEQ.N    ??USART1_IRQHandler_8
        MOVS     R4,#+0
??USART1_IRQHandler_8:
        MOVW     R1,#+805
        LDR.N    R0,??DataTable1  ;; 0x40013800
        BL       USART_GetITStatus
        CMP      R0,#+0
        BEQ.N    ??USART1_IRQHandler_9
        MOVS     R4,#+0
        LDR.N    R0,??DataTable1  ;; 0x40013800
        BL       USART_ReceiveData
??USART1_IRQHandler_9:
        MOV      R1,#+864
        LDR.N    R0,??DataTable1  ;; 0x40013800
        BL       USART_GetITStatus
        CMP      R0,#+0
        BEQ.N    ??USART1_IRQHandler_10
        MOVS     R4,#+0
??USART1_IRQHandler_10:
        MOVW     R1,#+1574
        LDR.N    R0,??DataTable1  ;; 0x40013800
        BL       USART_GetITStatus
        CMP      R0,#+0
        BEQ.N    ??USART1_IRQHandler_11
        MOVS     R4,#+0
??USART1_IRQHandler_11:
        MOVW     R1,#+1060
        LDR.N    R0,??DataTable1  ;; 0x40013800
        BL       USART_GetITStatus
        CMP      R0,#+0
        BEQ.N    ??USART1_IRQHandler_12
        MOVS     R4,#+0
??USART1_IRQHandler_12:
        POP      {R4,PC}          ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
        DATA
counter_sys:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        DATA
irled:
        DS8 1

        SECTION `.data`:DATA:REORDER:NOROOT(0)
        DATA
irledmax:
        DC8 255

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        DATA
net_fault_flag:
        DS8 1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SysTick_Handler:
        PUSH     {R7,LR}
        LDR.N    R0,??DataTable1_5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable1_5
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable1_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??SysTick_Handler_0
        LDR.N    R0,??DataTable1_7
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable1_7
        STRH     R0,[R1, #+0]
??SysTick_Handler_0:
        LDR.N    R0,??DataTable1_8
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??SysTick_Handler_1
        LDR.N    R0,??DataTable1_8
        LDRB     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable1_8
        STRB     R0,[R1, #+0]
??SysTick_Handler_1:
        LDR.N    R0,??DataTable1_9
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??SysTick_Handler_2
        LDR.N    R0,??DataTable1_9
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable1_9
        STRH     R0,[R1, #+0]
??SysTick_Handler_2:
        LDR.N    R0,??DataTable1_10
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??SysTick_Handler_3
        LDR.N    R0,??DataTable1_10
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable1_10
        STRH     R0,[R1, #+0]
??SysTick_Handler_3:
        BL       net_counter
        BL       spi_sichro_func
        BL       keys_syncro_func
        BL       marks_syncro_func
        BL       sens_synchro_func
        BL       Operator_present_control
        LDR.N    R0,??DataTable1_11
        LDRH     R0,[R0, #+0]
        LDR.N    R1,??DataTable1_7
        LDRH     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??SysTick_Handler_4
        MOVS     R0,#+0
        LDR.N    R1,??DataTable1_7
        STRH     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable1_6
        STRB     R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable1_12
        STRB     R0,[R1, #+0]
??SysTick_Handler_4:
        LDR.N    R0,??DataTable1_13
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??SysTick_Handler_5
        LDR.N    R0,??DataTable1_13
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable1_13
        STRH     R0,[R1, #+0]
??SysTick_Handler_5:
        LDR.N    R0,??DataTable1_14
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??SysTick_Handler_6
        LDR.N    R0,??DataTable1_15
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+10
        LDR.N    R1,??DataTable1_15
        STRB     R0,[R1, #+0]
        LDR.N    R0,??DataTable1_15
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable1_16
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BNE.N    ??SysTick_Handler_7
        MOVS     R0,#+0
        LDR.N    R1,??DataTable1_15
        STRB     R0,[R1, #+0]
??SysTick_Handler_7:
        LDR.N    R0,??DataTable1_17
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable1_15
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCC.N    ??SysTick_Handler_8
        BL       led_pulse_control
        B.N      ??SysTick_Handler_9
??SysTick_Handler_8:
        BL       led_off
        B.N      ??SysTick_Handler_9
??SysTick_Handler_6:
        BL       led_off
??SysTick_Handler_9:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0x40013800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     RXbuf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     rs_frame

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     TXbuf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     0x40020000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     system_ticks

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     task_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_7:
        DC32     counter_sys

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_8:
        DC32     galenic_counter

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_9:
        DC32     error_counter

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_10:
        DC32     expo_timeout

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_11:
        DC32     system_wait_timer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_12:
        DC32     net_fault_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_13:
        DC32     key1_count

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_14:
        DC32     led_pulse_enable

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_15:
        DC32     irled

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_16:
        DC32     irledmax

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_17:
        DC32     led_brightnes

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
//   4 bytes in section .bss
//   1 byte  in section .data
// 604 bytes in section .text
// 
// 604 bytes of CODE memory
//   5 bytes of DATA memory
//
//Errors: none
//Warnings: none
