///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.70.1.11437/W32 for ARM      18/Apr/2019  18:40:26
// Copyright 1999-2016 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\projects\L6IR\programm\L6_pro\main.c
//    Command line =  
//        E:\projects\L6IR\programm\L6_pro\main.c -D USE_STDPERIPH_DRIVER -D
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
//    List file    =  E:\projects\L6IR\programm\L6_pro\Release\List\main.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN ADC_init_func
        EXTERN GPIO_Configuration
        EXTERN IniRingBuf
        EXTERN LSM6DS33_congig
        EXTERN LSM6DS33_tasks
        EXTERN NVIC_Configuration
        EXTERN RCC_HCLKConfig
        EXTERN RCC_PCLK2Config
        EXTERN RCC_PLLCmd
        EXTERN RCC_PLLConfig
        EXTERN RCC_SYSCLKConfig
        EXTERN RXbuf
        EXTERN SPI_init_func
        EXTERN SystemCoreClockUpdate
        EXTERN SystemInit
        EXTERN TXbuf
        EXTERN UART_init
        EXTERN __aeabi_cfcmple
        EXTERN __aeabi_cfrcmple
        EXTERN __aeabi_fsub
        EXTERN cam_power_state
        EXTERN cam_sets
        EXTERN clean
        EXTERN default_ball_ini
        EXTERN default_cam_sets
        EXTERN encoder_func_ini
        EXTERN flash
        EXTERN func_buffer_ini
        EXTERN i2c_init
        EXTERN i2c_sensors_tasks
        EXTERN init_spi_objects
        EXTERN keys_analis
        EXTERN keys_analis_P_O
        EXTERN mark_tasks
        EXTERN net_fault_flag
        EXTERN net_fault_function
        EXTERN net_sets
        EXTERN net_status
        EXTERN net_task
        EXTERN operator_ctrl_consist
        EXTERN pref_net_init
        EXTERN protocol
        EXTERN redrow_menu_simbol
        EXTERN rs_frame
        EXTERN senspar
        EXTERN smart_device_ini
        EXTERN spi_read_camers_state
        EXTERN spi_silar_read
        EXTERN spi_silar_tasks
        EXTERN system_timer_init
        EXTERN system_wait_timer
        EXTERN task_flag
        EXTERN timers_config

        PUBLIC RXD
        PUBLIC TXD
        PUBLIC encoder_ini
        PUBLIC flash_is_read
        PUBLIC galenic_counter
        PUBLIC iclinate_analis
        PUBLIC key1_count
        PUBLIC key1_pulse
        PUBLIC keys
        PUBLIC led_pulse_enable
        PUBLIC main


        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
TXD:
        DS8 192

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
RXD:
        DS8 64

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
keys:
        DS8 116

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        DATA
key1_pulse:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
        DATA
key1_count:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        DATA
encoder_ini:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        DATA
flash_is_read:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        DATA
galenic_counter:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        DATA
led_pulse_enable:
        DS8 1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
iclinate_analis:
        PUSH     {R7,LR}
        LDR.N    R0,??DataTable1
        LDR      R0,[R0, #+28]
        LDR.N    R1,??DataTable1
        LDR      R1,[R1, #+24]
        BL       __aeabi_fsub
        LDR.N    R1,??DataTable1_1  ;; 0x3f800001
        BL       __aeabi_cfrcmple
        BLS.N    ??iclinate_analis_0
        LDR.N    R0,??DataTable1
        LDR      R0,[R0, #+28]
        LDR.N    R1,??DataTable1
        LDR      R1,[R1, #+24]
        BL       __aeabi_fsub
        LDR.N    R1,??DataTable1_2  ;; 0xbf800000
        BL       __aeabi_cfcmple
        BCS.N    ??iclinate_analis_1
??iclinate_analis_0:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+36]
??iclinate_analis_1:
        LDR.N    R0,??DataTable1
        LDR      R0,[R0, #+20]
        LDR.N    R1,??DataTable1_3  ;; 0x42340001
        BL       __aeabi_cfrcmple
        BLS.N    ??iclinate_analis_2
        LDR.N    R0,??DataTable1
        LDR      R0,[R0, #+20]
        LDR.N    R1,??DataTable1_4  ;; 0xc2340000
        BL       __aeabi_cfcmple
        BCC.N    ??iclinate_analis_2
        LDR.N    R0,??DataTable1
        LDR      R0,[R0, #+28]
        LDR.N    R1,??DataTable1_5  ;; 0x40a00001
        BL       __aeabi_cfrcmple
        BLS.N    ??iclinate_analis_2
        LDR.N    R0,??DataTable1
        LDR      R0,[R0, #+28]
        LDR.N    R1,??DataTable1_6  ;; 0xc0a00000
        BL       __aeabi_cfcmple
        BCS.N    ??iclinate_analis_3
??iclinate_analis_2:
        LDR.N    R0,??DataTable1
        LDRB     R0,[R0, #+37]
        CMP      R0,#+0
        BNE.N    ??iclinate_analis_4
        MOVS     R0,#+1
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+36]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+37]
        B.N      ??iclinate_analis_4
??iclinate_analis_3:
        LDR.N    R0,??DataTable1
        LDRB     R0,[R0, #+37]
        CMP      R0,#+0
        BEQ.N    ??iclinate_analis_4
        MOVS     R0,#+1
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+36]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+37]
??iclinate_analis_4:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
main:
        PUSH     {R7,LR}
        BL       SystemInit
        MOVS     R2,#+64
        MOVS     R1,#+4
        MOVS     R0,#+1
        BL       RCC_PLLConfig
        MOVS     R0,#+1
        BL       RCC_PLLCmd
        MOVS     R0,#+3
        BL       RCC_SYSCLKConfig
        MOVS     R0,#+0
        BL       RCC_HCLKConfig
        MOVS     R0,#+0
        BL       RCC_PCLK2Config
        BL       SystemCoreClockUpdate
        BL       system_timer_init
        BL       NVIC_Configuration
        BL       timers_config
        MOVW     R0,#+9000
        LDR.N    R1,??DataTable1_7
        STRH     R0,[R1, #+0]
        LDR.N    R0,??DataTable1_7
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??main_0
        MOVS     R0,#+1
        LDR.N    R1,??DataTable1_8
        STRB     R0,[R1, #+0]
??main_1:
        LDR.N    R0,??DataTable1_8
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??main_1
??main_0:
        BL       GPIO_Configuration
        BL       UART_init
        BL       SPI_init_func
        BL       ADC_init_func
        BL       i2c_init
        BL       LSM6DS33_congig
        LDR.N    R0,??DataTable1_9
        BL       clean
        BL       init_spi_objects
        LDR.N    R2,??DataTable1_10
        MOVS     R1,#+192
        LDR.N    R0,??DataTable1_11
        BL       IniRingBuf
        LDR.N    R2,??DataTable1_9
        MOVS     R1,#+64
        LDR.N    R0,??DataTable1_12
        BL       IniRingBuf
        LDR.N    R2,??DataTable1_13
        MOVS     R1,#+50
        LDR.N    R0,??DataTable1_14
        BL       IniRingBuf
        LDR.N    R2,??DataTable1_15
        MOVS     R1,#+100
        LDR.N    R0,??DataTable1_16
        BL       IniRingBuf
        BL       default_ball_ini
        BL       default_cam_sets
        MOVS     R0,#+32
        BL       spi_silar_read
        BL       spi_read_camers_state
        MOVS     R0,#+1
        LDR.N    R1,??DataTable1_8
        STRB     R0,[R1, #+0]
        B.N      ??main_2
??main_3:
        BL       spi_silar_tasks
        LDR.N    R0,??DataTable1_8
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??main_2
        MOVS     R0,#+1
        LDR.N    R1,??DataTable1_17
        STRB     R0,[R1, #+0]
??main_2:
        LDR.N    R0,??DataTable1_17
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??main_3
        MOVW     R0,#+16449
        LDR.N    R1,??DataTable1_18
        STR      R0,[R1, #+16]
        BL       smart_device_ini
        BL       func_buffer_ini
        BL       encoder_func_ini
        MOV      R0,#+500
        LDR.N    R1,??DataTable1_7
        STRH     R0,[R1, #+0]
        BL       pref_net_init
        MOVS     R0,#+1
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+36]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+38]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+39]
        MOVS     R0,#+5
        LDR.N    R1,??DataTable1_19
        STRB     R0,[R1, #+0]
        BL       redrow_menu_simbol
        B.N      ??main_4
??main_5:
        BL       keys_analis_P_O
??main_6:
        BL       i2c_sensors_tasks
        BL       LSM6DS33_tasks
??main_4:
        LDR.N    R0,??DataTable1_20
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??main_7
        BL       protocol
        MOVS     R0,#+0
        LDR.N    R1,??DataTable1_20
        STRB     R0,[R1, #+0]
??main_7:
        LDR.N    R0,??DataTable1_21
        LDRB     R0,[R0, #+1]
        CMP      R0,#+0
        BNE.N    ??main_8
        BL       net_task
??main_8:
        LDR.N    R0,??DataTable1_22
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??main_9
        BL       net_fault_function
??main_9:
        LDR.N    R0,??DataTable1_23
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??main_5
        BL       spi_silar_tasks
        BL       keys_analis
        LDR.N    R0,??DataTable1_18
        LDRB     R0,[R0, #+16]
        LSLS     R0,R0,#+27
        BPL.N    ??main_6
        LDR.N    R0,??DataTable1_24
        LDRH     R0,[R0, #+18]
        CMP      R0,#+0
        BNE.N    ??main_6
        BL       mark_tasks
        B.N      ??main_6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     senspar

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     0x3f800001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     0xbf800000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     0x42340001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     0xc2340000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     0x40a00001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     0xc0a00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_7:
        DC32     system_wait_timer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_8:
        DC32     task_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_9:
        DC32     RXbuf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_10:
        DC32     TXbuf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_11:
        DC32     TXD

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_12:
        DC32     RXD

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_13:
        DC32     net_status+0x38

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_14:
        DC32     net_status+0x3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_15:
        DC32     keys+0x64

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_16:
        DC32     keys

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_17:
        DC32     flash_is_read

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_18:
        DC32     flash

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_19:
        DC32     operator_ctrl_consist

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_20:
        DC32     rs_frame

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_21:
        DC32     net_sets

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_22:
        DC32     net_fault_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_23:
        DC32     cam_power_state

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_24:
        DC32     cam_sets

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
// 379 bytes in section .bss
// 626 bytes in section .text
// 
// 626 bytes of CODE memory
// 379 bytes of DATA memory
//
//Errors: none
//Warnings: 7
