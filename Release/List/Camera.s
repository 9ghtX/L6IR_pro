///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.70.1.11437/W32 for ARM      18/Apr/2019  18:40:18
// Copyright 1999-2016 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\projects\L6IR\programm\L6_pro\Camera.c
//    Command line =  
//        E:\projects\L6IR\programm\L6_pro\Camera.c -D USE_STDPERIPH_DRIVER -D
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
//    List file    =  E:\projects\L6IR\programm\L6_pro\Release\List\Camera.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN GPIO_ResetBits
        EXTERN GPIO_SetBits
        EXTERN SPI_Cmd
        EXTERN SPI_I2S_GetFlagStatus
        EXTERN SPI_I2S_ReceiveData
        EXTERN SPI_I2S_SendData
        EXTERN SPI_init_func
        EXTERN __aeabi_cfcmple
        EXTERN __aeabi_cfrcmple
        EXTERN __aeabi_d2uiz
        EXTERN __aeabi_dadd
        EXTERN __aeabi_dmul
        EXTERN __aeabi_f2d
        EXTERN __aeabi_f2iz
        EXTERN __aeabi_f2uiz
        EXTERN __aeabi_fdiv
        EXTERN __aeabi_fmul
        EXTERN __aeabi_memcpy4
        EXTERN __aeabi_ui2f
        EXTERN balCalculate
        EXTERN clean
        EXTERN default_flash_content
        EXTERN display_st
        EXTERN encoder0
        EXTERN encoder0_eoc_func
        EXTERN encoder0_func
        EXTERN encoder0_masks_buf
        EXTERN flash_is_read
        EXTERN key1_pulse
        EXTERN keys
        EXTERN led_pulse_enable
        EXTERN net_sets
        EXTERN redrow_menu_simbol
        EXTERN senspar
        EXTERN system_wait_timer
        EXTERN task_flag

        PUBLIC cam_operation
        PUBLIC cam_power_state
        PUBLIC cam_sets
        PUBLIC correct_enter
        PUBLIC critcal_section_level
        PUBLIC default_cam_sets
        PUBLIC flash
        PUBLIC flash_reading_process
        PUBLIC init_spi_objects
        PUBLIC mark_tasks
        PUBLIC marks_syncro_func
        PUBLIC oled_control
        PUBLIC prev_cam_state
        PUBLIC read_marks_state
        PUBLIC set_device_mode
        PUBLIC spi_objects
        PUBLIC spi_read_camers_state
        PUBLIC spi_sets
        PUBLIC spi_sichro_func
        PUBLIC spi_silar_read
        PUBLIC spi_silar_tasks
        PUBLIC spi_silar_wright
        PUBLIC spi_task_count
        PUBLIC zoom_val


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void enter_critical_section(void)
enter_critical_section:
        LDR.W    R0,??DataTable9
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??enter_critical_section_0
        CPSID    I
??enter_critical_section_0:
        LDR.W    R0,??DataTable9
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable9
        STRH     R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void exit_critical_section(void)
exit_critical_section:
        LDR.W    R0,??DataTable9
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable9
        STRH     R0,[R1, #+0]
        LDR.W    R0,??DataTable9
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??exit_critical_section_0
        CPSIE    I
??exit_critical_section_0:
        BX       LR               ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
spi_objects:
        DS8 980

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
spi_sets:
        DS8 28

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        DATA
spi_task_count:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
cam_sets:
        DS8 108

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
flash:
        DS8 416

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
        DATA
critcal_section_level:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        DATA
cam_operation:
        DS8 1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
init_spi_objects:
        PUSH     {R7,LR}
        MOVS     R0,#+0
        LDR.W    R1,??DataTable9_1
        STRB     R0,[R1, #+0]
        MOVS     R0,#+34
        LDR.W    R1,??DataTable9_2
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable9_2
        STR      R0,[R1, #+4]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable9_2
        STRB     R0,[R1, #+26]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable9_2
        STRB     R0,[R1, #+25]
        MOVS     R0,#+100
        LDR.W    R1,??DataTable9_2
        STR      R0,[R1, #+16]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable9_2
        STR      R0,[R1, #+20]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable9_2
        STRB     R0,[R1, #+24]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+24]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+28]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+52]
        MOVS     R0,#+2
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+56]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+80]
        MOVS     R0,#+3
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+84]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+108]
        MOVS     R0,#+4
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+112]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+136]
        MOVS     R0,#+5
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+140]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+164]
        MOVS     R0,#+6
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+168]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+192]
        MOVS     R0,#+7
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+196]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+220]
        MOVS     R0,#+8
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+224]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+248]
        MOVS     R0,#+9
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+252]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+276]
        MOVS     R0,#+10
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+280]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+304]
        MOVS     R0,#+11
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+308]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+332]
        MOVS     R0,#+12
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+336]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+360]
        MOVS     R0,#+13
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+364]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+388]
        MOVS     R0,#+14
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+392]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+416]
        MOVS     R0,#+15
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+420]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+444]
        MOVS     R0,#+16
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+448]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+472]
        MOVS     R0,#+17
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+476]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+500]
        MOVS     R0,#+18
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+504]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+528]
        MOVS     R0,#+19
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+532]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+556]
        MOVS     R0,#+20
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+560]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+584]
        MOVS     R0,#+21
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+588]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+612]
        MOVS     R0,#+22
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+616]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+640]
        MOVS     R0,#+23
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+644]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+668]
        MOVS     R0,#+30
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+840]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable9_3
        STRB     R0,[R1, #+864]
        MOVS     R0,#+0
        B.N      ??init_spi_objects_0
??init_spi_objects_1:
        MOVS     R1,#+1
        LDR.W    R2,??DataTable9_3
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R3,#+28
        MUL      R3,R3,R0
        ADD      R2,R2,R3
        STRB     R1,[R2, #+25]
        MOVS     R1,#+0
        LDR.W    R2,??DataTable9_3
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R3,#+28
        MUL      R3,R3,R0
        ADD      R2,R2,R3
        STRB     R1,[R2, #+26]
        ADDS     R0,R0,#+1
??init_spi_objects_0:
        MOVS     R1,R0
        LDR.W    R2,??DataTable9_2
        LDRB     R2,[R2, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,R2
        BCC.N    ??init_spi_objects_1
        MOVS     R0,#+1
        LDR.W    R1,??DataTable11
        STRB     R0,[R1, #+0]
        LDR.W    R0,??DataTable13
        BL       clean
        POP      {R0,PC}          ;; return

        SECTION `.data`:DATA:REORDER:NOROOT(0)
        DATA
cam_power_state:
        DC8 1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
set_device_mode:
        PUSH     {R7,LR}
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BEQ.W    ??set_device_mode_0
        CMP      R0,#+2
        BEQ.W    ??set_device_mode_1
        CMP      R0,#+3
        BEQ.W    ??set_device_mode_2
        CMP      R0,#+4
        BEQ.W    ??set_device_mode_3
        CMP      R0,#+6
        BNE.W    ??set_device_mode_4
??set_device_mode_5:
        MOV      R1,#+4096
        LDR.W    R0,??DataTable11_1  ;; 0x40020000
        BL       GPIO_SetBits
        LDR.W    R0,??DataTable13_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??set_device_mode_6
        MOV      R1,#+2048
        LDR.W    R0,??DataTable11_1  ;; 0x40020000
        BL       GPIO_SetBits
        MOV      R1,#+32768
        LDR.W    R0,??DataTable11_1  ;; 0x40020000
        BL       GPIO_ResetBits
        MOVW     R0,#+9000
        LDR.W    R1,??DataTable11_2
        STRH     R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable11_3
        STRB     R0,[R1, #+0]
??set_device_mode_7:
        LDR.W    R0,??DataTable11_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??set_device_mode_7
        MOV      R1,#+32768
        LDR.W    R0,??DataTable11_1  ;; 0x40020000
        BL       GPIO_SetBits
        BL       SPI_init_func
        BL       init_spi_objects
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11_4
        STRB     R0,[R1, #+0]
        MOVS     R0,#+150
        LDR.W    R1,??DataTable11_2
        STRH     R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable13_1
        STRB     R0,[R1, #+0]
??set_device_mode_6:
        MOVS     R0,#+0
        LDR.W    R1,??DataTable12
        STRB     R0,[R1, #+36]
        MOVS     R0,#+52
        LDR.W    R1,??DataTable9_3
        STR      R0,[R1, #+848]
        MOVS     R0,#+52
        LDR.W    R1,??DataTable9_2
        STRB     R0,[R1, #+12]
        B.N      ??set_device_mode_8
??set_device_mode_9:
        BL       spi_silar_tasks
??set_device_mode_8:
        LDR.W    R0,??DataTable12
        LDRB     R0,[R0, #+36]
        CMP      R0,#+0
        BEQ.N    ??set_device_mode_9
        MOVS     R0,#+0
        LDR.W    R1,??DataTable12
        STRB     R0,[R1, #+36]
        MOVS     R0,#+54
        LDR.W    R1,??DataTable9_3
        STR      R0,[R1, #+848]
        MOVS     R0,#+54
        LDR.W    R1,??DataTable9_2
        STRB     R0,[R1, #+12]
        B.N      ??set_device_mode_10
??set_device_mode_11:
        BL       spi_silar_tasks
??set_device_mode_10:
        LDR.W    R0,??DataTable12
        LDRB     R0,[R0, #+36]
        CMP      R0,#+0
        BEQ.N    ??set_device_mode_11
        MOVS     R0,#+0
        LDR.W    R1,??DataTable12
        STRB     R0,[R1, #+36]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable13_2
        STRB     R0,[R1, #+0]
        MOVS     R0,#+57
        LDR.W    R1,??DataTable9_3
        STR      R0,[R1, #+848]
        MOVS     R0,#+57
        LDR.W    R1,??DataTable9_2
        STRB     R0,[R1, #+12]
        B.N      ??set_device_mode_12
??set_device_mode_13:
        BL       spi_silar_tasks
??set_device_mode_12:
        LDR.W    R0,??DataTable12
        LDRB     R0,[R0, #+36]
        CMP      R0,#+0
        BEQ.N    ??set_device_mode_13
        MOVS     R0,#+0
        LDR.W    R1,??DataTable12
        STRB     R0,[R1, #+36]
        LDR.W    R0,??DataTable13_3
        LDR.W    R1,??DataTable13_4
        STR      R0,[R1, #+4]
        LDR.W    R0,??DataTable13_5
        LDR      R0,[R0, #+16]
        ANDS     R0,R0,#0xC000
        CMP      R0,#+32768
        BCC.N    ??set_device_mode_14
        MOVS     R0,#+0
        LDR.W    R1,??DataTable13_6
        STRB     R0,[R1, #+1]
        B.N      ??set_device_mode_15
??set_device_mode_14:
        MOVS     R0,#+255
        LDR.W    R1,??DataTable13_6
        STRB     R0,[R1, #+1]
??set_device_mode_15:
        MOVS     R0,#+255
        LDR.W    R1,??DataTable13_6
        STRB     R0,[R1, #+2]
        MOVS     R0,#+255
        LDR.W    R1,??DataTable13_6
        STRB     R0,[R1, #+3]
        MOVS     R0,#+255
        LDR.W    R1,??DataTable13_6
        STRB     R0,[R1, #+4]
        MOVS     R0,#+255
        LDR.W    R1,??DataTable13_6
        STRB     R0,[R1, #+5]
        MOVS     R0,#+255
        LDR.W    R1,??DataTable13_6
        STRB     R0,[R1, #+6]
        MOVS     R0,#+255
        LDR.W    R1,??DataTable13_6
        STRB     R0,[R1, #+7]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable13_6
        STRB     R0,[R1, #+8]
        B.N      ??set_device_mode_4
??set_device_mode_0:
        MOV      R1,#+4096
        LDR.W    R0,??DataTable11_1  ;; 0x40020000
        BL       GPIO_ResetBits
        MOV      R1,#+2048
        LDR.W    R0,??DataTable11_1  ;; 0x40020000
        BL       GPIO_ResetBits
        MOVS     R1,#+0
        LDR.W    R0,??DataTable13_7  ;; 0x40003800
        BL       SPI_Cmd
        MOV      R1,#+4096
        LDR.W    R0,??DataTable13_8  ;; 0x40020400
        BL       GPIO_ResetBits
        MOVS     R0,#+0
        LDR.W    R1,??DataTable13_1
        STRB     R0,[R1, #+0]
        LDR.W    R0,??DataTable13_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??set_device_mode_16
        MOVS     R0,#+51
        LDR.W    R1,??DataTable9_3
        STR      R0,[R1, #+848]
        MOVS     R0,#+51
        LDR.W    R1,??DataTable9_2
        STRB     R0,[R1, #+12]
        B.N      ??set_device_mode_17
??set_device_mode_18:
        BL       spi_silar_tasks
??set_device_mode_17:
        LDR.W    R0,??DataTable12
        LDRB     R0,[R0, #+36]
        CMP      R0,#+0
        BEQ.N    ??set_device_mode_18
        MOVS     R0,#+0
        LDR.W    R1,??DataTable12
        STRB     R0,[R1, #+36]
??set_device_mode_16:
        MOVS     R0,#+0
        LDR.W    R1,??DataTable13_2
        STRB     R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable13_9
        STRB     R0,[R1, #+10]
        MOVS     R0,#+51
        LDR.W    R1,??DataTable13_4
        STRB     R0,[R1, #+0]
        LDR.W    R0,??DataTable13_10
        LDR.W    R1,??DataTable13_4
        STR      R0,[R1, #+4]
        B.N      ??set_device_mode_4
??set_device_mode_1:
        MOV      R1,#+4096
        LDR.W    R0,??DataTable11_1  ;; 0x40020000
        BL       GPIO_ResetBits
        LDR.W    R0,??DataTable13_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??set_device_mode_19
        MOV      R1,#+2048
        LDR.W    R0,??DataTable11_1  ;; 0x40020000
        BL       GPIO_SetBits
        MOV      R1,#+32768
        LDR.W    R0,??DataTable11_1  ;; 0x40020000
        BL       GPIO_ResetBits
        MOVW     R0,#+9000
        LDR.W    R1,??DataTable11_2
        STRH     R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable11_3
        STRB     R0,[R1, #+0]
??set_device_mode_20:
        LDR.W    R0,??DataTable11_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??set_device_mode_20
        MOV      R1,#+32768
        LDR.W    R0,??DataTable11_1  ;; 0x40020000
        BL       GPIO_SetBits
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11_4
        STRB     R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable13_1
        STRB     R0,[R1, #+0]
        BL       SPI_init_func
        BL       init_spi_objects
        MOVS     R0,#+150
        LDR.W    R1,??DataTable11_2
        STRH     R0,[R1, #+0]
??set_device_mode_19:
        MOVS     R0,#+0
        LDR.W    R1,??DataTable12
        STRB     R0,[R1, #+36]
        MOVS     R0,#+52
        LDR.W    R1,??DataTable9_3
        STR      R0,[R1, #+848]
        MOVS     R0,#+52
        LDR.W    R1,??DataTable9_2
        STRB     R0,[R1, #+12]
        B.N      ??set_device_mode_21
??set_device_mode_22:
        BL       spi_silar_tasks
??set_device_mode_21:
        LDR.W    R0,??DataTable12
        LDRB     R0,[R0, #+36]
        CMP      R0,#+0
        BEQ.N    ??set_device_mode_22
        MOVS     R0,#+0
        LDR.W    R1,??DataTable12
        STRB     R0,[R1, #+36]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable13_2
        STRB     R0,[R1, #+0]
        MOVS     R0,#+54
        LDR.W    R1,??DataTable9_3
        STR      R0,[R1, #+848]
        MOVS     R0,#+54
        LDR.W    R1,??DataTable9_2
        STRB     R0,[R1, #+12]
        B.N      ??set_device_mode_23
??set_device_mode_24:
        BL       spi_silar_tasks
??set_device_mode_23:
        LDR.W    R0,??DataTable12
        LDRB     R0,[R0, #+36]
        CMP      R0,#+0
        BEQ.N    ??set_device_mode_24
        MOVS     R0,#+0
        LDR.W    R1,??DataTable12
        STRB     R0,[R1, #+36]
        MOVS     R0,#+57
        LDR.W    R1,??DataTable9_3
        STR      R0,[R1, #+848]
        MOVS     R0,#+57
        LDR.W    R1,??DataTable9_2
        STRB     R0,[R1, #+12]
        B.N      ??set_device_mode_25
??set_device_mode_26:
        BL       spi_silar_tasks
??set_device_mode_25:
        LDR.W    R0,??DataTable12
        LDRB     R0,[R0, #+36]
        CMP      R0,#+0
        BEQ.N    ??set_device_mode_26
        MOVS     R0,#+0
        LDR.W    R1,??DataTable12
        STRB     R0,[R1, #+36]
        LDR.W    R0,??DataTable13_3
        LDR.W    R1,??DataTable13_4
        STR      R0,[R1, #+4]
        LDR.W    R0,??DataTable13_5
        LDR      R0,[R0, #+16]
        ANDS     R0,R0,#0xC000
        CMP      R0,#+32768
        BCC.N    ??set_device_mode_27
        MOVS     R0,#+0
        LDR.W    R1,??DataTable13_6
        STRB     R0,[R1, #+1]
        B.N      ??set_device_mode_28
??set_device_mode_27:
        MOVS     R0,#+255
        LDR.W    R1,??DataTable13_6
        STRB     R0,[R1, #+1]
??set_device_mode_28:
        MOVS     R0,#+255
        LDR.W    R1,??DataTable13_6
        STRB     R0,[R1, #+2]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable13_6
        STRB     R0,[R1, #+3]
        MOVS     R0,#+255
        LDR.W    R1,??DataTable13_6
        STRB     R0,[R1, #+4]
        MOVS     R0,#+255
        LDR.W    R1,??DataTable13_6
        STRB     R0,[R1, #+5]
        MOVS     R0,#+255
        LDR.W    R1,??DataTable13_6
        STRB     R0,[R1, #+6]
        MOVS     R0,#+255
        LDR.W    R1,??DataTable13_6
        STRB     R0,[R1, #+7]
        MOVS     R0,#+255
        LDR.W    R1,??DataTable13_6
        STRB     R0,[R1, #+8]
        B.N      ??set_device_mode_4
??set_device_mode_2:
        MOV      R1,#+4096
        LDR.W    R0,??DataTable11_1  ;; 0x40020000
        BL       GPIO_ResetBits
        LDR.W    R0,??DataTable13_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??set_device_mode_29
        MOV      R1,#+2048
        LDR.W    R0,??DataTable11_1  ;; 0x40020000
        BL       GPIO_SetBits
        MOV      R1,#+32768
        LDR.W    R0,??DataTable11_1  ;; 0x40020000
        BL       GPIO_ResetBits
        MOVW     R0,#+9000
        LDR.W    R1,??DataTable11_2
        STRH     R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable11_3
        STRB     R0,[R1, #+0]
??set_device_mode_30:
        LDR.W    R0,??DataTable11_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??set_device_mode_30
        MOV      R1,#+32768
        LDR.W    R0,??DataTable11_1  ;; 0x40020000
        BL       GPIO_SetBits
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11_4
        STRB     R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable13_1
        STRB     R0,[R1, #+0]
        BL       SPI_init_func
        BL       init_spi_objects
        MOVS     R0,#+150
        LDR.W    R1,??DataTable11_2
        STRH     R0,[R1, #+0]
??set_device_mode_29:
        MOVS     R0,#+0
        LDR.W    R1,??DataTable13_2
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable12
        STRB     R0,[R1, #+36]
        MOVS     R0,#+52
        LDR.W    R1,??DataTable9_3
        STR      R0,[R1, #+848]
        MOVS     R0,#+52
        LDR.W    R1,??DataTable9_2
        STRB     R0,[R1, #+12]
        B.N      ??set_device_mode_31
??set_device_mode_32:
        BL       spi_silar_tasks
??set_device_mode_31:
        LDR.W    R0,??DataTable12
        LDRB     R0,[R0, #+36]
        CMP      R0,#+0
        BEQ.N    ??set_device_mode_32
        MOVS     R0,#+0
        LDR.W    R1,??DataTable12
        STRB     R0,[R1, #+36]
        MOVS     R0,#+53
        LDR.W    R1,??DataTable9_3
        STR      R0,[R1, #+848]
        MOVS     R0,#+53
        LDR.W    R1,??DataTable9_2
        STRB     R0,[R1, #+12]
        B.N      ??set_device_mode_33
??set_device_mode_34:
        BL       spi_silar_tasks
??set_device_mode_33:
        LDR.W    R0,??DataTable12
        LDRB     R0,[R0, #+36]
        CMP      R0,#+0
        BEQ.N    ??set_device_mode_34
        MOVS     R0,#+0
        LDR.W    R1,??DataTable12
        STRB     R0,[R1, #+36]
        MOVS     R0,#+57
        LDR.W    R1,??DataTable9_3
        STR      R0,[R1, #+848]
        MOVS     R0,#+57
        LDR.W    R1,??DataTable9_2
        STRB     R0,[R1, #+12]
        B.N      ??set_device_mode_35
??set_device_mode_36:
        BL       spi_silar_tasks
??set_device_mode_35:
        LDR.W    R0,??DataTable12
        LDRB     R0,[R0, #+36]
        CMP      R0,#+0
        BEQ.N    ??set_device_mode_36
        MOVS     R0,#+0
        LDR.W    R1,??DataTable12
        STRB     R0,[R1, #+36]
        LDR.W    R0,??DataTable13_3
        LDR.W    R1,??DataTable13_4
        STR      R0,[R1, #+4]
        LDR.W    R0,??DataTable13_5
        LDR      R0,[R0, #+16]
        ANDS     R0,R0,#0xC000
        CMP      R0,#+32768
        BCC.N    ??set_device_mode_37
        MOVS     R0,#+0
        LDR.W    R1,??DataTable13_6
        STRB     R0,[R1, #+1]
        B.N      ??set_device_mode_38
??set_device_mode_37:
        MOVS     R0,#+255
        LDR.W    R1,??DataTable13_6
        STRB     R0,[R1, #+1]
??set_device_mode_38:
        MOVS     R0,#+0
        LDR.W    R1,??DataTable13_6
        STRB     R0,[R1, #+2]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable13_6
        STRB     R0,[R1, #+3]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable13_6
        STRB     R0,[R1, #+4]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable13_6
        STRB     R0,[R1, #+5]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable13_6
        STRB     R0,[R1, #+6]
        MOVS     R0,#+255
        LDR.W    R1,??DataTable13_6
        STRB     R0,[R1, #+7]
        MOVS     R0,#+255
        LDR.W    R1,??DataTable13_6
        STRB     R0,[R1, #+8]
        B.N      ??set_device_mode_4
??set_device_mode_3:
        MOV      R1,#+4096
        LDR.W    R0,??DataTable11_1  ;; 0x40020000
        BL       GPIO_ResetBits
        MOV      R1,#+2048
        LDR.W    R0,??DataTable11_1  ;; 0x40020000
        BL       GPIO_ResetBits
        MOVS     R1,#+0
        LDR.W    R0,??DataTable13_7  ;; 0x40003800
        BL       SPI_Cmd
        MOV      R1,#+4096
        LDR.W    R0,??DataTable13_8  ;; 0x40020400
        BL       GPIO_ResetBits
        MOVS     R0,#+0
        LDR.W    R1,??DataTable13_1
        STRB     R0,[R1, #+0]
        LDR.W    R0,??DataTable13_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??set_device_mode_39
        MOVS     R0,#+51
        LDR.W    R1,??DataTable9_3
        STR      R0,[R1, #+848]
        MOVS     R0,#+51
        LDR.W    R1,??DataTable9_2
        STRB     R0,[R1, #+12]
        B.N      ??set_device_mode_40
??set_device_mode_41:
        BL       spi_silar_tasks
??set_device_mode_40:
        LDR.W    R0,??DataTable12
        LDRB     R0,[R0, #+36]
        CMP      R0,#+0
        BEQ.N    ??set_device_mode_41
        MOVS     R0,#+0
        LDR.W    R1,??DataTable12
        STRB     R0,[R1, #+36]
??set_device_mode_39:
        MOVS     R0,#+1
        LDR.W    R1,??DataTable13_2
        STRB     R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable13_9
        STRB     R0,[R1, #+10]
        MOVS     R0,#+51
        LDR.W    R1,??DataTable13_4
        STRB     R0,[R1, #+0]
        LDR.W    R0,??DataTable13_10
        LDR.W    R1,??DataTable13_4
        STR      R0,[R1, #+4]
??set_device_mode_4:
        LDR.W    R0,??DataTable13_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??set_device_mode_42
        BL       redrow_menu_simbol
??set_device_mode_42:
        POP      {R0,PC}          ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
prev_cam_state:
        DS8 4

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spi_silar_tasks:
        PUSH     {R3-R5,LR}
        MOVS     R4,#+0
        LDR.W    R0,??DataTable9_1
        LDRB     R0,[R0, #+0]
        LDR.W    R0,??DataTable9_2
        LDR      R0,[R0, #+16]
        CMP      R0,#+0
        BNE.W    ??spi_silar_tasks_0
        LDR.W    R0,??DataTable9_2
        LDRB     R0,[R0, #+25]
        CMP      R0,#+0
        BEQ.W    ??spi_silar_tasks_0
        MOVS     R0,#+32
        BL       spi_silar_read
        LDR.W    R1,??DataTable9_2
        STR      R0,[R1, #+4]
        MOVS     R5,#+0
        B.N      ??spi_silar_tasks_1
??spi_silar_tasks_2:
        LDR.W    R0,??DataTable9_3
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R1,#+28
        MUL      R1,R1,R5
        ADD      R0,R0,R1
        LDRB     R0,[R0, #+25]
        CMP      R0,#+0
        BNE.N    ??spi_silar_tasks_3
        LDR.W    R0,??DataTable9_3
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R1,#+28
        MUL      R1,R1,R5
        ADD      R0,R0,R1
        LDRB     R0,[R0, #+26]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable9_3
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R2,#+28
        MUL      R2,R2,R5
        ADD      R1,R1,R2
        STRB     R0,[R1, #+26]
??spi_silar_tasks_3:
        LDR.W    R0,??DataTable9_3
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R1,#+28
        MUL      R1,R1,R5
        ADD      R0,R0,R1
        LDRB     R0,[R0, #+26]
        CMP      R0,#+11
        BLT.N    ??spi_silar_tasks_4
        MOVS     R0,#+1
        LDR.W    R1,??DataTable12
        STRB     R0,[R1, #+36]
        BL       init_spi_objects
??spi_silar_tasks_4:
        ADDS     R5,R5,#+1
??spi_silar_tasks_1:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+32
        BGE.W    ??spi_silar_tasks_5
        LDR.W    R0,??DataTable9_2
        LDR      R0,[R0, #+4]
        LSRS     R0,R0,R5
        LSLS     R0,R0,#+31
        BPL.N    ??spi_silar_tasks_2
        LDR.W    R0,??DataTable9_3
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R1,#+28
        MUL      R1,R1,R5
        LDRB     R0,[R0, R1]
        BL       spi_silar_read
        LDR.W    R1,??DataTable9_3
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R2,#+28
        MUL      R2,R2,R5
        ADD      R1,R1,R2
        STR      R0,[R1, #+4]
        LDR.W    R0,??DataTable9_3
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R1,#+28
        MUL      R1,R1,R5
        ADD      R0,R0,R1
        LDR      R0,[R0, #+4]
        LDR.W    R1,??DataTable9_3
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R2,#+28
        MUL      R2,R2,R5
        ADD      R1,R1,R2
        LDR      R1,[R1, #+20]
        CMP      R0,R1
        BEQ.N    ??spi_silar_tasks_6
        LDR.W    R0,??DataTable9_3
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R1,#+28
        MUL      R1,R1,R5
        ADD      R0,R0,R1
        LDRB     R0,[R0, #+24]
        CMP      R0,#+0
        BEQ.N    ??spi_silar_tasks_6
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+17
        BLT.N    ??spi_silar_tasks_7
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+30
        BNE.N    ??spi_silar_tasks_8
??spi_silar_tasks_7:
        MOVS     R0,#+0
        LDR.W    R1,??DataTable15
        STRH     R0,[R1, #+18]
??spi_silar_tasks_8:
        LDR.W    R0,??DataTable9_3
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R1,#+28
        MUL      R1,R1,R5
        ADD      R0,R0,R1
        LDR      R0,[R0, #+20]
        LDR.W    R1,??DataTable9_3
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R2,#+28
        MUL      R2,R2,R5
        ADD      R1,R1,R2
        STR      R0,[R1, #+8]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable9_3
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R2,#+28
        MUL      R2,R2,R5
        ADD      R1,R1,R2
        STRB     R0,[R1, #+25]
??spi_silar_tasks_6:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+30
        BNE.N    ??spi_silar_tasks_9
        MOVS     R0,#+1
        LDR.W    R1,??DataTable12
        STRB     R0,[R1, #+36]
        LDR.W    R0,??DataTable9_3
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R1,#+28
        MUL      R1,R1,R5
        ADD      R0,R0,R1
        LDR      R0,[R0, #+20]
        CMP      R0,#+12
        BNE.N    ??spi_silar_tasks_9
        LDR.W    R0,??DataTable9_2
        LDRB     R0,[R0, #+8]
        LSLS     R0,R0,#+28
        BPL.N    ??spi_silar_tasks_9
        LDR.W    R0,??DataTable9_2
        LDRB     R0,[R0, #+12]
        LDR.W    R1,??DataTable9_3
        STR      R0,[R1, #+848]
??spi_silar_tasks_9:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+17
        BNE.N    ??spi_silar_tasks_10
        LDR.W    R0,??DataTable15_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??spi_silar_tasks_10
        BL       flash_reading_process
??spi_silar_tasks_10:
        LDR.N    R0,??DataTable9_3
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R1,#+28
        MUL      R1,R1,R5
        ADD      R0,R0,R1
        LDRB     R0,[R0, #+24]
        CMP      R0,#+0
        BEQ.W    ??spi_silar_tasks_4
        MOVS     R0,#+1
        LDR.N    R1,??DataTable9_3
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R2,#+28
        MUL      R2,R2,R5
        ADD      R1,R1,R2
        STRB     R0,[R1, #+25]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+30
        BNE.W    ??spi_silar_tasks_4
        MOVS     R0,#+0
        LDR.N    R1,??DataTable9_2
        STRB     R0,[R1, #+25]
        B.N      ??spi_silar_tasks_4
??spi_silar_tasks_5:
        MOVS     R0,#+0
        LDR.W    R1,??DataTable15_2
        STR      R0,[R1, #+4]
        MOVS     R0,#+100
        LDR.W    R1,??DataTable15_2
        STR      R0,[R1, #+16]
??spi_silar_tasks_0:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable9_1
        STRB     R0,[R1, #+0]
        B.N      ??spi_silar_tasks_11
??spi_silar_tasks_12:
        LDR.N    R0,??DataTable9_3
        LDR.N    R1,??DataTable9_1
        LDRB     R1,[R1, #+0]
        MOVS     R2,#+28
        MULS     R1,R2,R1
        ADD      R0,R0,R1
        LDR      R0,[R0, #+8]
        CMP      R0,#+0
        BEQ.N    ??spi_silar_tasks_13
        LDR.N    R0,??DataTable9_3
        LDR.N    R1,??DataTable9_1
        LDRB     R1,[R1, #+0]
        MOVS     R2,#+28
        MULS     R1,R2,R1
        ADD      R0,R0,R1
        LDRB     R0,[R0, #+25]
        CMP      R0,#+0
        BEQ.N    ??spi_silar_tasks_13
        MOVS     R4,#+1
        LDR.N    R0,??DataTable9_1
        LDRB     R0,[R0, #+0]
        SUBS     R0,R0,#+21
        CMP      R0,#+3
        BCS.N    ??spi_silar_tasks_14
        LDR.N    R0,??DataTable9_3
        LDR.N    R1,??DataTable9_1
        LDRB     R1,[R1, #+0]
        MOVS     R2,#+28
        MULS     R1,R2,R1
        ADD      R0,R0,R1
        LDR      R0,[R0, #+8]
        BIC      R0,R0,#0xF0000000
        LDR.N    R1,??DataTable9_3
        LDR.N    R2,??DataTable9_1
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+28
        MULS     R2,R3,R2
        ADD      R1,R1,R2
        STR      R0,[R1, #+8]
??spi_silar_tasks_14:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable9_3
        LDR.N    R2,??DataTable9_1
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+28
        MULS     R2,R3,R2
        ADD      R1,R1,R2
        STRB     R0,[R1, #+25]
        LDR.N    R0,??DataTable9_3
        LDR.N    R1,??DataTable9_1
        LDRB     R1,[R1, #+0]
        MOVS     R2,#+28
        MULS     R1,R2,R1
        ADD      R0,R0,R1
        LDR      R1,[R0, #+8]
        LDR.N    R0,??DataTable9_3
        LDR.N    R2,??DataTable9_1
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+28
        MULS     R2,R3,R2
        LDRB     R0,[R0, R2]
        ORRS     R0,R0,#0x80
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       spi_silar_wright
        LDR.N    R0,??DataTable9_3
        LDR.N    R1,??DataTable9_1
        LDRB     R1,[R1, #+0]
        MOVS     R2,#+28
        MULS     R1,R2,R1
        ADD      R0,R0,R1
        LDR      R0,[R0, #+16]
        LDR.N    R1,??DataTable9_3
        LDR.N    R2,??DataTable9_1
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+28
        MULS     R2,R3,R2
        ADD      R1,R1,R2
        STR      R0,[R1, #+12]
        LDR.N    R0,??DataTable9_3
        LDR.N    R1,??DataTable9_1
        LDRB     R1,[R1, #+0]
        MOVS     R2,#+28
        MULS     R1,R2,R1
        ADD      R0,R0,R1
        LDR      R0,[R0, #+8]
        LDR.N    R1,??DataTable9_3
        LDR.N    R2,??DataTable9_1
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+28
        MULS     R2,R3,R2
        ADD      R1,R1,R2
        STR      R0,[R1, #+20]
        LDR.N    R0,??DataTable9_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+30
        BNE.N    ??spi_silar_tasks_15
        LDR.N    R0,??DataTable9_3
        LDR.N    R1,??DataTable9_1
        LDRB     R1,[R1, #+0]
        MOVS     R2,#+28
        MULS     R1,R2,R1
        ADD      R0,R0,R1
        LDR      R0,[R0, #+8]
        CMP      R0,#+50
        BNE.N    ??spi_silar_tasks_15
        MOVS     R0,#+0
        LDR.W    R1,??DataTable13_1
        STRB     R0,[R1, #+0]
??spi_silar_tasks_15:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable9_3
        LDR.N    R2,??DataTable9_1
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+28
        MULS     R2,R3,R2
        ADD      R1,R1,R2
        STR      R0,[R1, #+8]
??spi_silar_tasks_13:
        LDR.N    R0,??DataTable9_1
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable9_1
        STRB     R0,[R1, #+0]
        LDR.W    R0,??DataTable15_2
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable9_1
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??spi_silar_tasks_11
        MOVS     R4,#+1
??spi_silar_tasks_11:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.W    ??spi_silar_tasks_12
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spi_read_camers_state:
        PUSH     {R7,LR}
        MOVS     R0,#+18
        BL       spi_silar_read
        LDR.N    R1,??DataTable9_2
        STR      R0,[R1, #+8]
        LDR.N    R0,??DataTable9_2
        LDR      R0,[R0, #+8]
        LDR.W    R1,??DataTable15_3
        STR      R0,[R1, #+0]
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spi_sichro_func:
        LDR.W    R0,??DataTable15_2
        LDRB     R0,[R0, #+25]
        CMP      R0,#+0
        BEQ.N    ??spi_sichro_func_0
        LDR.W    R0,??DataTable15_2
        LDR      R0,[R0, #+16]
        CMP      R0,#+0
        BEQ.N    ??spi_sichro_func_0
        LDR.W    R0,??DataTable15_2
        LDR      R0,[R0, #+16]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable15_2
        STR      R0,[R1, #+16]
??spi_sichro_func_0:
        LDR.W    R0,??DataTable15_2
        LDR      R0,[R0, #+20]
        CMP      R0,#+0
        BEQ.N    ??spi_sichro_func_1
        LDR.W    R0,??DataTable15_2
        LDR      R0,[R0, #+20]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable15_2
        STR      R0,[R1, #+20]
??spi_sichro_func_1:
        MOVS     R0,#+0
        B.N      ??spi_sichro_func_2
??spi_sichro_func_3:
        LDR.N    R1,??DataTable9_3
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R2,#+28
        MUL      R2,R2,R0
        ADD      R1,R1,R2
        LDR      R1,[R1, #+12]
        CMP      R1,#+0
        BEQ.N    ??spi_sichro_func_4
        LDR.N    R1,??DataTable9_3
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R2,#+28
        MUL      R2,R2,R0
        ADD      R1,R1,R2
        LDR      R1,[R1, #+12]
        SUBS     R1,R1,#+1
        LDR.N    R2,??DataTable9_3
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R3,#+28
        MUL      R3,R3,R0
        ADD      R2,R2,R3
        STR      R1,[R2, #+12]
??spi_sichro_func_4:
        ADDS     R0,R0,#+1
??spi_sichro_func_2:
        MOVS     R1,R0
        LDR.W    R2,??DataTable15_2
        LDRB     R2,[R2, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,R2
        BCC.N    ??spi_sichro_func_3
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spi_silar_read:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,#+0
        BL       enter_critical_section
        MOV      R1,#+4096
        LDR.W    R0,??DataTable13_8  ;; 0x40020400
        BL       GPIO_ResetBits
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,R4
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.W    R0,??DataTable13_7  ;; 0x40003800
        BL       SPI_I2S_SendData
??spi_silar_read_0:
        MOVS     R1,#+2
        LDR.W    R0,??DataTable13_7  ;; 0x40003800
        BL       SPI_I2S_GetFlagStatus
        CMP      R0,#+0
        BEQ.N    ??spi_silar_read_0
        LDR.W    R0,??DataTable13_7  ;; 0x40003800
        BL       SPI_I2S_ReceiveData
        MOVS     R4,#+0
        B.N      ??spi_silar_read_1
??spi_silar_read_2:
        MOVS     R1,#+0
        LDR.W    R0,??DataTable13_7  ;; 0x40003800
        BL       SPI_I2S_SendData
??spi_silar_read_3:
        MOVS     R1,#+2
        LDR.W    R0,??DataTable13_7  ;; 0x40003800
        BL       SPI_I2S_GetFlagStatus
        CMP      R0,#+0
        BEQ.N    ??spi_silar_read_3
        LDR.W    R0,??DataTable13_7  ;; 0x40003800
        BL       SPI_I2S_ReceiveData
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ORRS     R5,R0,R5, LSL #+8
        ADDS     R4,R4,#+1
??spi_silar_read_1:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+4
        BLT.N    ??spi_silar_read_2
        MOV      R1,#+4096
        LDR.W    R0,??DataTable13_8  ;; 0x40020400
        BL       GPIO_SetBits
        BL       exit_critical_section
        MOVS     R0,R5
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spi_silar_wright:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R0,#+0
        BL       enter_critical_section
        MOV      R1,#+4096
        LDR.W    R0,??DataTable13_8  ;; 0x40020400
        BL       GPIO_ResetBits
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ORRS     R1,R4,#0x80
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.W    R0,??DataTable13_7  ;; 0x40003800
        BL       SPI_I2S_SendData
??spi_silar_wright_0:
        MOVS     R1,#+2
        LDR.W    R0,??DataTable13_7  ;; 0x40003800
        BL       SPI_I2S_GetFlagStatus
        CMP      R0,#+0
        BEQ.N    ??spi_silar_wright_0
        LSRS     R1,R5,#+24
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.W    R0,??DataTable13_7  ;; 0x40003800
        BL       SPI_I2S_SendData
??spi_silar_wright_1:
        MOVS     R1,#+2
        LDR.W    R0,??DataTable13_7  ;; 0x40003800
        BL       SPI_I2S_GetFlagStatus
        CMP      R0,#+0
        BEQ.N    ??spi_silar_wright_1
        LSRS     R1,R5,#+16
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.W    R0,??DataTable13_7  ;; 0x40003800
        BL       SPI_I2S_SendData
??spi_silar_wright_2:
        MOVS     R1,#+2
        LDR.W    R0,??DataTable13_7  ;; 0x40003800
        BL       SPI_I2S_GetFlagStatus
        CMP      R0,#+0
        BEQ.N    ??spi_silar_wright_2
        LSRS     R1,R5,#+8
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.W    R0,??DataTable13_7  ;; 0x40003800
        BL       SPI_I2S_SendData
??spi_silar_wright_3:
        MOVS     R1,#+2
        LDR.W    R0,??DataTable13_7  ;; 0x40003800
        BL       SPI_I2S_GetFlagStatus
        CMP      R0,#+0
        BEQ.N    ??spi_silar_wright_3
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.N    R0,??DataTable13_7  ;; 0x40003800
        BL       SPI_I2S_SendData
??spi_silar_wright_4:
        MOVS     R1,#+2
        LDR.N    R0,??DataTable13_7  ;; 0x40003800
        BL       SPI_I2S_GetFlagStatus
        CMP      R0,#+0
        BEQ.N    ??spi_silar_wright_4
        BL       exit_critical_section
        MOV      R1,#+4096
        LDR.N    R0,??DataTable13_8  ;; 0x40020400
        BL       GPIO_SetBits
        MOVS     R0,#+0
        LDR.W    R1,??DataTable15_2
        STRB     R0,[R1, #+24]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable15_2
        STRB     R0,[R1, #+25]
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
read_marks_state:
        PUSH     {R7,LR}
        LDR.W    R0,??DataTable15_4
        LDRB     R0,[R0, #+448]
        BL       spi_silar_read
        LDR.W    R1,??DataTable15_4
        STR      R0,[R1, #+452]
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9:
        DC32     critcal_section_level

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_1:
        DC32     spi_task_count

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_2:
        DC32     spi_sets

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_3:
        DC32     spi_objects

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
correct_enter:
        PUSH     {R4-R10,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOV      R8,R2
        MOVS     R6,R3
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+16
        BNE.N    ??correct_enter_0
        MOVS     R7,#+8
        B.N      ??correct_enter_1
??correct_enter_0:
        MOVS     R7,#+8
??correct_enter_1:
        LDR      R1,[SP, #+40]
        CMP      R1,#+1879048192
        BCS.N    ??correct_enter_2
        LDR      R0,[SP, #+36]
        CMP      R0,#+0
        BEQ.N    ??correct_enter_3
        ORRS     R9,R1,#0x84000000
        B.N      ??correct_enter_4
??correct_enter_3:
        ORRS     R9,R1,#0x4000000
??correct_enter_4:
        LDR      R10,[SP, #+32]
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        MOVS     R0,R7
        BL       __aeabi_ui2f
        MOV      R1,R8
        BL       __aeabi_fmul
        LDR.N    R1,??DataTable13_5
        LDR      R1,[R1, #+8]
        BL       __aeabi_fmul
        MOV      R8,R0
        LDR.N    R0,??DataTable13_5
        LDR      R1,[R0, #+12]
        LDR.W    R0,??DataTable15_5  ;; 0x42c80000
        BL       __aeabi_fmul
        MOV      R1,R10
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOV      R0,R8
        BL       __aeabi_fdiv
        MOV      R8,R0
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        MOVS     R0,R7
        BL       __aeabi_ui2f
        MOVS     R1,R5
        BL       __aeabi_fmul
        LDR.N    R1,??DataTable13_5
        LDR      R1,[R1, #+8]
        BL       __aeabi_fmul
        MOVS     R5,R0
        LDR.N    R0,??DataTable13_5
        LDR      R1,[R0, #+12]
        LDR.W    R0,??DataTable15_5  ;; 0x42c80000
        BL       __aeabi_fmul
        MOV      R1,R10
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fdiv
        BL       __aeabi_f2uiz
        LSLS     R0,R0,#+19       ;; ZeroExtS R0,R0,#+19,#+19
        LSRS     R0,R0,#+19
        ORRS     R5,R0,R9
        MOV      R0,R8
        BL       __aeabi_f2uiz
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        ADDS     R0,R6,R0
        LDR.W    R1,??DataTable15_6  ;; 0x3ffe000
        ANDS     R0,R1,R0, LSL #+13
        ORRS     R0,R0,R5
        LDR.W    R1,??DataTable15_4
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R2,#+28
        MUL      R2,R2,R4
        ADD      R1,R1,R2
        STR      R0,[R1, #+8]
        B.N      ??correct_enter_5
??correct_enter_2:
        MOVS     R0,#-2147483648
        LDR.W    R1,??DataTable15_4
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R2,#+28
        MUL      R2,R2,R4
        ADD      R1,R1,R2
        STR      R0,[R1, #+8]
??correct_enter_5:
        POP      {R4-R10,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
default_cam_sets:
        PUSH     {R7,LR}
        LDR.W    R0,??DataTable15_7  ;; 0x3c8b4396
        LDR.W    R1,??DataTable15
        STR      R0,[R1, #+8]
        LDR.W    R0,??DataTable15_8  ;; 0x424acccd
        LDR.W    R1,??DataTable15
        STR      R0,[R1, #+4]
        MOVS     R0,#+1065353216
        LDR.W    R1,??DataTable15
        STR      R0,[R1, #+12]
        LDR.N    R0,??DataTable13_5
        LDRB     R0,[R0, #+16]
        LSLS     R0,R0,#+27
        BPL.N    ??default_cam_sets_0
        MOVS     R0,#+3
        LDR.W    R1,??DataTable15_4
        STR      R0,[R1, #+540]
        B.N      ??default_cam_sets_1
??default_cam_sets_0:
        MOVS     R0,#+4
        LDR.W    R1,??DataTable15_4
        STR      R0,[R1, #+540]
        MOVS     R0,#+4
        LDR.W    R1,??DataTable15
        STRB     R0,[R1, #+20]
        MOVS     R0,#+100
        LDR.W    R1,??DataTable15
        STRH     R0,[R1, #+22]
        MOV      R0,#+400
        LDR.W    R1,??DataTable15
        STRH     R0,[R1, #+24]
        MOV      R0,#+500
        LDR.W    R1,??DataTable15
        STRH     R0,[R1, #+26]
        MOV      R0,#+600
        LDR.W    R1,??DataTable15
        STRH     R0,[R1, #+28]
        MOV      R0,#+600
        LDR.W    R1,??DataTable15
        STRH     R0,[R1, #+30]
        MOV      R0,#+600
        LDR.W    R1,??DataTable15
        STRH     R0,[R1, #+32]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable15
        STRH     R0,[R1, #+50]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable15
        STRH     R0,[R1, #+52]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable15
        STRH     R0,[R1, #+54]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable15
        STRH     R0,[R1, #+56]
        MOVW     R0,#+275
        LDR.W    R1,??DataTable15
        STRH     R0,[R1, #+58]
        MOVW     R0,#+275
        LDR.W    R1,??DataTable15
        STRH     R0,[R1, #+60]
        MOVW     R0,#+485
        LDR.W    R1,??DataTable15
        STRH     R0,[R1, #+62]
        MOVW     R0,#+645
        LDR.W    R1,??DataTable15
        STRH     R0,[R1, #+64]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable15
        STRH     R0,[R1, #+66]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable15
        STRH     R0,[R1, #+78]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable15
        STRH     R0,[R1, #+80]
        MOVS     R0,#+2
        LDR.W    R1,??DataTable15
        STRH     R0,[R1, #+82]
        MOVS     R0,#+3
        LDR.W    R1,??DataTable15
        STRH     R0,[R1, #+84]
        MOVS     R0,#+7
        LDR.W    R1,??DataTable15
        STRH     R0,[R1, #+86]
        MOVS     R0,#+8
        LDR.W    R1,??DataTable15
        STRH     R0,[R1, #+88]
        MOVS     R0,#+9
        LDR.W    R1,??DataTable15
        STRH     R0,[R1, #+90]
        MOVS     R0,#+10
        LDR.W    R1,??DataTable15
        STRH     R0,[R1, #+92]
        MOVS     R0,#+11
        LDR.W    R1,??DataTable15
        STRH     R0,[R1, #+94]
??default_cam_sets_1:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable13_5
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable15_1
        STRB     R0,[R1, #+0]
        BL       default_flash_content
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11:
        DC32     cam_operation

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_1:
        DC32     0x40020000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_2:
        DC32     system_wait_timer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_3:
        DC32     task_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_4:
        DC32     key1_pulse

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
flash_reading_process:
        LDR.N    R0,??DataTable13_5
        LDR      R0,[R0, #+4]
        ADDS     R0,R0,#+4
        LDR.N    R1,??DataTable13_5
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??flash_reading_process_0
        LDR.N    R0,??DataTable13_5
        LDR      R0,[R0, #+0]
        CMP      R0,#+8
        BCC.N    ??flash_reading_process_0
        MOVS     R0,#+0
        LDR.W    R1,??DataTable15_4
        STRB     R0,[R1, #+500]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable15_1
        STRB     R0,[R1, #+0]
        B.N      ??flash_reading_process_1
??flash_reading_process_0:
        LDR.W    R0,??DataTable15_4
        LDR      R0,[R0, #+480]
        CMP      R0,#+0
        BEQ.N    ??flash_reading_process_1
        LDR.N    R0,??DataTable13_5
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??flash_reading_process_2
        LDR.W    R0,??DataTable15_4
        LDRB     R0,[R0, #+480]
        CMP      R0,#+170
        BEQ.N    ??flash_reading_process_2
        MOVS     R0,#+1
        LDR.W    R1,??DataTable15_1
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable15_4
        STR      R0,[R1, #+480]
        MOVW     R0,#+24577
        LDR.N    R1,??DataTable13_5
        STR      R0,[R1, #+16]
        B.N      ??flash_reading_process_1
??flash_reading_process_2:
        LDR.W    R0,??DataTable15_9
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??flash_reading_process_3
        LDR.W    R0,??DataTable15_10
        LDR.W    R1,??DataTable15_4
        LDR      R1,[R1, #+480]
        LDR.W    R2,??DataTable15_9
        LDR      R2,[R2, #+0]
        ADD      R0,R0,R2
        STRB     R1,[R0, #-1]
??flash_reading_process_3:
        LDR.W    R0,??DataTable15_4
        LDR      R0,[R0, #+480]
        ANDS     R0,R0,#0xFF00
        LDR.W    R1,??DataTable15_9
        LDR      R1,[R1, #+0]
        LSLS     R1,R1,#+8
        ADDS     R1,R1,#+512
        CMP      R0,R1
        BNE.N    ??flash_reading_process_4
        LDR.W    R0,??DataTable15_9
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable15_9
        STR      R0,[R1, #+0]
??flash_reading_process_4:
        LDR.W    R0,??DataTable15_9
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+8
        ADDS     R0,R0,#+512
        LDR.W    R1,??DataTable15_4
        STR      R0,[R1, #+484]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable15_4
        STR      R0,[R1, #+480]
??flash_reading_process_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12:
        DC32     senspar

        SECTION `.data`:DATA:REORDER:NOROOT(2)
        DATA
zoom_val:
        DC32 3FA00000H, 40200000H, 40700000H, 40A00000H

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
marks_syncro_func:
        LDR.W    R0,??DataTable15
        LDRH     R0,[R0, #+18]
        CMP      R0,#+0
        BEQ.N    ??marks_syncro_func_0
        LDR.W    R0,??DataTable15
        LDRH     R0,[R0, #+18]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable15
        STRH     R0,[R1, #+18]
??marks_syncro_func_0:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13:
        DC32     keys+0x64

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_1:
        DC32     cam_power_state

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_2:
        DC32     led_pulse_enable

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_3:
        DC32     encoder0_func

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_4:
        DC32     encoder0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_5:
        DC32     flash

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_6:
        DC32     encoder0_masks_buf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_7:
        DC32     0x40003800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_8:
        DC32     0x40020400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_9:
        DC32     net_sets

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_10:
        DC32     encoder0_eoc_func

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
mark_tasks:
        PUSH     {R4-R9,LR}
        SUB      SP,SP,#+44
        LDR.W    R0,??DataTable15_9
        LDR      R0,[R0, #+12]
        LDR.W    R1,??DataTable15_9
        LDR      R1,[R1, #+8]
        BL       __aeabi_fdiv
        MOV      R8,R0
        BL       spi_read_camers_state
        LDR.W    R0,??DataTable15_2
        LDR      R0,[R0, #+8]
        UBFX     R4,R0,#+4,#+4
        LDR.W    R0,??DataTable15_11
        LDRB     R0,[R0, #+36]
        CMP      R0,#+0
        BEQ.W    ??mark_tasks_0
        MOVS     R0,#+0
        LDR.W    R1,??DataTable15_11
        STRB     R0,[R1, #+36]
        LDR.W    R0,??DataTable15_11
        LDRB     R0,[R0, #+37]
        CMP      R0,#+0
        BEQ.N    ??mark_tasks_1
        MOVS     R5,#+0
        B.N      ??mark_tasks_2
??mark_tasks_1:
        MOVS     R5,#+536870912
??mark_tasks_2:
        MOVS     R6,#+1811939328
        LDR.W    R0,??DataTable15_12
        LDR.W    R1,??DataTable15_2
        LDRB     R1,[R1, #+8]
        ANDS     R1,R1,#0x3
        LDR      R1,[R0, R1, LSL #+2]
        LDR.W    R0,??DataTable15_9
        LDR      R0,[R0, #+8]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable15
        LDR      R1,[R1, #+12]
        BL       __aeabi_fmul
        MOVS     R7,R0
        LDR.W    R0,??DataTable15_9
        LDR      R1,[R0, #+12]
        LDR.W    R0,??DataTable15_11
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R7
        BL       __aeabi_fdiv
        BL       __aeabi_f2uiz
        RSBS     R7,R0,#+496
        LDR.W    R0,??DataTable15
        LDRH     R0,[R0, #+58]
        LSLS     R1,R7,#+19       ;; ZeroExtS R1,R7,#+19,#+19
        LSRS     R1,R1,#+19
        ORRS     R1,R1,R6
        LDR.W    R2,??DataTable15_6  ;; 0x3ffe000
        ANDS     R0,R2,R0, LSL #+13
        ORRS     R0,R0,R1
        LDR.W    R1,??DataTable15_4
        LDR.W    R2,??DataTable15
        LDRH     R2,[R2, #+86]
        MOVS     R3,#+28
        MULS     R2,R3,R2
        ADD      R1,R1,R2
        STR      R0,[R1, #+8]
        MOVS     R6,#+1811939328
        LDR.W    R0,??DataTable15_12
        LDR.W    R1,??DataTable15_2
        LDRB     R1,[R1, #+8]
        ANDS     R1,R1,#0x3
        LDR      R1,[R0, R1, LSL #+2]
        LDR.W    R0,??DataTable15_9
        LDR      R0,[R0, #+8]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable15
        LDR      R1,[R1, #+12]
        BL       __aeabi_fmul
        MOVS     R7,R0
        LDR.W    R0,??DataTable15_9
        LDR      R1,[R0, #+12]
        LDR.W    R0,??DataTable15_11
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R7
        BL       __aeabi_fdiv
        BL       __aeabi_f2uiz
        RSBS     R7,R0,#+496
        LDR.W    R0,??DataTable15
        LDRH     R0,[R0, #+60]
        LSLS     R1,R7,#+19       ;; ZeroExtS R1,R7,#+19,#+19
        LSRS     R1,R1,#+19
        ORRS     R1,R1,R6
        LDR.W    R2,??DataTable15_6  ;; 0x3ffe000
        ANDS     R0,R2,R0, LSL #+13
        ORRS     R0,R0,R1
        LDR.W    R1,??DataTable15_4
        LDR.W    R2,??DataTable15
        LDRH     R2,[R2, #+88]
        MOVS     R3,#+28
        MULS     R2,R3,R2
        ADD      R1,R1,R2
        STR      R0,[R1, #+8]
        LDR.W    R0,??DataTable15_11
        LDR      R0,[R0, #+28]
        LDR.W    R1,??DataTable15_13  ;; 0x41f00001
        BL       __aeabi_cfrcmple
        BHI.N    ??mark_tasks_3
        LDR.W    R0,??DataTable15_14  ;; 0x41f00000
        LDR.W    R1,??DataTable15_11
        STR      R0,[R1, #+28]
??mark_tasks_3:
        LDR.W    R0,??DataTable15_11
        LDR      R0,[R0, #+28]
        LDR.W    R1,??DataTable15_15  ;; 0xc1f00000
        BL       __aeabi_cfcmple
        BCS.N    ??mark_tasks_4
        LDR.W    R0,??DataTable15_15  ;; 0xc1f00000
        LDR.N    R1,??DataTable15_11
        STR      R0,[R1, #+28]
??mark_tasks_4:
        ORRS     R6,R5,#0xC000000
        LDR.N    R0,??DataTable15_11
        LDR      R0,[R0, #+28]
        BL       __aeabi_f2iz
        MOVS     R1,#+5
        MULS     R0,R1,R0
        RSBS     R7,R0,#+300
        MOV      R0,R8
        LDR.N    R1,??DataTable15_16  ;; 0x395c3373
        BL       __aeabi_cfrcmple
        BHI.N    ??mark_tasks_5
        MOVW     R9,#+563
        LDR.N    R0,??DataTable15_12
        LDR.N    R1,??DataTable15_2
        LDRB     R1,[R1, #+8]
        ANDS     R1,R1,#0x3
        LDR      R1,[R0, R1, LSL #+2]
        LDR.N    R0,??DataTable15_9
        LDR      R0,[R0, #+8]
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable15_17  ;; 0x119ce076
        LDR.N    R3,??DataTable15_18  ;; 0x3ff1bda5
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.N    R3,??DataTable15_19  ;; 0x40240000
        BL       __aeabi_dadd
        BL       __aeabi_d2uiz
        SUBS     R0,R9,R0
        B.N      ??mark_tasks_6
??mark_tasks_5:
        MOVW     R9,#+563
        LDR.N    R0,??DataTable15_12
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable15_9
        LDR      R0,[R0, #+8]
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable15_17  ;; 0x119ce076
        LDR.N    R3,??DataTable15_18  ;; 0x3ff1bda5
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.N    R3,??DataTable15_19  ;; 0x40240000
        BL       __aeabi_dadd
        BL       __aeabi_d2uiz
        SUBS     R0,R9,R0
??mark_tasks_6:
        LSLS     R1,R7,#+19       ;; ZeroExtS R1,R7,#+19,#+19
        LSRS     R1,R1,#+19
        ORRS     R1,R1,R6
        LDR.N    R2,??DataTable15_6  ;; 0x3ffe000
        ANDS     R0,R2,R0, LSL #+13
        ORRS     R0,R0,R1
        LDR.N    R1,??DataTable15_4
        LDR.N    R2,??DataTable15
        LDRH     R2,[R2, #+90]
        MOVS     R3,#+28
        MULS     R2,R3,R2
        ADD      R1,R1,R2
        STR      R0,[R1, #+8]
        ORRS     R6,R5,#0xC000000
        LDR.N    R0,??DataTable15_11
        LDR      R0,[R0, #+28]
        BL       __aeabi_f2iz
        MOVS     R1,#+5
        MULS     R0,R1,R0
        ADDS     R7,R0,#+300
        MOV      R0,R8
        LDR.N    R1,??DataTable15_16  ;; 0x395c3373
        BL       __aeabi_cfrcmple
        BHI.N    ??mark_tasks_7
        LDR.N    R0,??DataTable15_12
        LDR.N    R1,??DataTable15_2
        LDRB     R1,[R1, #+8]
        ANDS     R1,R1,#0x3
        LDR      R1,[R0, R1, LSL #+2]
        LDR.N    R0,??DataTable15_9
        LDR      R0,[R0, #+8]
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable15_17  ;; 0x119ce076
        LDR.N    R3,??DataTable15_18  ;; 0x3ff1bda5
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.N    R3,??DataTable15_19  ;; 0x40240000
        BL       __aeabi_dadd
        BL       __aeabi_d2uiz
        ADDW     R0,R0,#+563
        B.N      ??mark_tasks_8
??mark_tasks_7:
        LDR.N    R0,??DataTable15_12
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable15_9
        LDR      R0,[R0, #+8]
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable15_17  ;; 0x119ce076
        LDR.N    R3,??DataTable15_18  ;; 0x3ff1bda5
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.N    R3,??DataTable15_19  ;; 0x40240000
        BL       __aeabi_dadd
        BL       __aeabi_d2uiz
        ADDW     R0,R0,#+563
??mark_tasks_8:
        LSLS     R1,R7,#+19       ;; ZeroExtS R1,R7,#+19,#+19
        LSRS     R1,R1,#+19
        ORRS     R1,R1,R6
        LDR.N    R2,??DataTable15_6  ;; 0x3ffe000
        ANDS     R0,R2,R0, LSL #+13
        ORRS     R0,R0,R1
        LDR.N    R1,??DataTable15_4
        LDR.N    R2,??DataTable15
        LDRH     R2,[R2, #+92]
        MOVS     R3,#+28
        MULS     R2,R3,R2
        ADD      R1,R1,R2
        STR      R0,[R1, #+8]
        MOVS     R5,#+0
        B.N      ??mark_tasks_9
??mark_tasks_10:
        LDR.N    R0,??DataTable15_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+36
        MUL      R1,R1,R4
        ADD      R0,R0,R1
        ADDS     R1,R0,#+20
        SUB      SP,SP,#+8
        MOV      R0,SP
        MOVS     R2,#+36
        BL       __aeabi_memcpy4
        POP      {R2,R3}
        MOVS     R6,R2
        MOVS     R7,R3
        LDR.N    R0,??DataTable15
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        ADD      R0,R0,R5, LSL #+1
        LDRH     R0,[R0, #+22]
        BL       __aeabi_ui2f
        MOVS     R1,R0
        MOVS     R2,R6
        MOVS     R3,R7
        ADD      R0,SP,#+28
        BL       balCalculate
        LDRB     R0,[SP, #+36]
        CMP      R0,#+0
        BEQ.N    ??mark_tasks_11
        MOVS     R0,#+1610612736
        STR      R0,[SP, #+8]
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        LDR.N    R0,??DataTable15
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        ADD      R0,R0,R5, LSL #+1
        LDRH     R0,[R0, #+22]
        BL       __aeabi_ui2f
        STR      R0,[SP, #+0]
        LDR.N    R0,??DataTable15
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        ADD      R0,R0,R5, LSL #+1
        LDRH     R3,[R0, #+50]
        LDR      R2,[SP, #+32]
        LDR      R1,[SP, #+28]
        LDR.N    R0,??DataTable15
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        ADD      R0,R0,R5, LSL #+1
        LDRH     R0,[R0, #+78]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       correct_enter
??mark_tasks_11:
        ADDS     R5,R5,#+1
??mark_tasks_9:
        MOVS     R0,R5
        LDR.N    R1,??DataTable15
        LDRB     R1,[R1, #+20]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R0,R1
        BCS.N    ??mark_tasks_12
        LDR.N    R0,??DataTable15_11
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable15_20  ;; 0x42c80001
        BL       __aeabi_cfrcmple
        BHI.N    ??mark_tasks_10
        MOVS     R0,#+1879048192
        STR      R0,[SP, #+8]
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        LDR.N    R0,??DataTable15
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        ADD      R0,R0,R5, LSL #+1
        LDRH     R0,[R0, #+22]
        BL       __aeabi_ui2f
        STR      R0,[SP, #+0]
        LDR.N    R0,??DataTable15
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        ADD      R0,R0,R5, LSL #+1
        LDRH     R3,[R0, #+50]
        LDR      R2,[SP, #+32]
        LDR      R1,[SP, #+28]
        LDR.N    R0,??DataTable15
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        ADD      R0,R0,R5, LSL #+1
        LDRH     R0,[R0, #+78]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       correct_enter
        B.N      ??mark_tasks_11
??mark_tasks_12:
        LDR.N    R0,??DataTable15_2
        LDRB     R0,[R0, #+8]
        LSLS     R0,R0,#+28
        BPL.N    ??mark_tasks_13
        LDR.N    R0,??DataTable15_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+36
        MUL      R1,R1,R4
        ADD      R0,R0,R1
        ADDS     R1,R0,#+20
        SUB      SP,SP,#+8
        MOV      R0,SP
        MOVS     R2,#+36
        BL       __aeabi_memcpy4
        POP      {R2,R3}
        LDR.N    R1,??DataTable15_5  ;; 0x42c80000
        ADD      R0,SP,#+28
        BL       balCalculate
        B.N      ??mark_tasks_14
??mark_tasks_13:
        LDR.N    R0,??DataTable15_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+36
        MUL      R1,R1,R4
        ADD      R0,R0,R1
        ADDS     R1,R0,#+20
        SUB      SP,SP,#+8
        MOV      R0,SP
        MOVS     R2,#+36
        BL       __aeabi_memcpy4
        POP      {R2,R3}
        LDR.N    R0,??DataTable15_11
        LDR      R1,[R0, #+0]
        ADD      R0,SP,#+28
        BL       balCalculate
??mark_tasks_14:
        LDRB     R0,[SP, #+36]
        CMP      R0,#+0
        BEQ.N    ??mark_tasks_15
        MOVS     R0,#+1610612736
        STR      R0,[SP, #+8]
        MOVS     R0,#+1
        STR      R0,[SP, #+4]
        LDR.N    R0,??DataTable15_11
        LDR      R0,[R0, #+0]
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        LDR      R2,[SP, #+32]
        LDR      R1,[SP, #+28]
        MOVS     R0,#+16
        BL       correct_enter
??mark_tasks_15:
        MOVS     R0,#+100
        LDR.N    R1,??DataTable15
        STRH     R0,[R1, #+18]
??mark_tasks_0:
        ADD      SP,SP,#+44
        POP      {R4-R9,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
oled_control:
        PUSH     {R7,LR}
        LDR.N    R0,??DataTable15_21
        LDRB     R0,[R0, #+0]
        CMP      R0,#+3
        BNE.N    ??oled_control_0
        MOVS     R0,#+1
        LDR.N    R1,??DataTable15_21
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable15_11
        STRB     R0,[R1, #+36]
        MOVS     R0,#+52
        LDR.N    R1,??DataTable15_4
        STR      R0,[R1, #+848]
        MOVS     R0,#+51
        LDR.N    R1,??DataTable15_2
        STRB     R0,[R1, #+12]
        B.N      ??oled_control_1
??oled_control_2:
        BL       spi_silar_tasks
??oled_control_1:
        LDR.N    R0,??DataTable15_11
        LDRB     R0,[R0, #+36]
        CMP      R0,#+0
        BEQ.N    ??oled_control_2
        MOVS     R0,#+0
        LDR.N    R1,??DataTable15_11
        STRB     R0,[R1, #+36]
??oled_control_0:
        LDR.N    R0,??DataTable15_21
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
        BNE.N    ??oled_control_3
        MOVS     R0,#+0
        LDR.N    R1,??DataTable15_21
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable15_11
        STRB     R0,[R1, #+36]
        MOVS     R0,#+52
        LDR.N    R1,??DataTable15_4
        STR      R0,[R1, #+848]
        MOVS     R0,#+52
        LDR.N    R1,??DataTable15_2
        STRB     R0,[R1, #+12]
        B.N      ??oled_control_4
??oled_control_5:
        BL       spi_silar_tasks
??oled_control_4:
        LDR.N    R0,??DataTable15_11
        LDRB     R0,[R0, #+36]
        CMP      R0,#+0
        BEQ.N    ??oled_control_5
        MOVS     R0,#+0
        LDR.N    R1,??DataTable15_11
        STRB     R0,[R1, #+36]
??oled_control_3:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15:
        DC32     cam_sets

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_1:
        DC32     flash_is_read

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_2:
        DC32     spi_sets

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_3:
        DC32     prev_cam_state

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_4:
        DC32     spi_objects

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_5:
        DC32     0x42c80000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_6:
        DC32     0x3ffe000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_7:
        DC32     0x3c8b4396

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_8:
        DC32     0x424acccd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_9:
        DC32     flash

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_10:
        DC32     flash+0x4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_11:
        DC32     senspar

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_12:
        DC32     zoom_val

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_13:
        DC32     0x41f00001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_14:
        DC32     0x41f00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_15:
        DC32     0xc1f00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_16:
        DC32     0x395c3373

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_17:
        DC32     0x119ce076

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_18:
        DC32     0x3ff1bda5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_19:
        DC32     0x40240000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_20:
        DC32     0x42c80001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_21:
        DC32     display_st

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
// 1 540 bytes in section .bss
//    17 bytes in section .data
// 5 516 bytes in section .text
// 
// 5 516 bytes of CODE memory
// 1 557 bytes of DATA memory
//
//Errors: none
//Warnings: 3
