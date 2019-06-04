///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.70.1.11437/W32 for ARM      18/Apr/2019  18:40:29
// Copyright 1999-2016 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\projects\L6IR\programm\L6_pro\net.c
//    Command line =  
//        E:\projects\L6IR\programm\L6_pro\net.c -D USE_STDPERIPH_DRIVER -D
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
//    List file    =  E:\projects\L6IR\programm\L6_pro\Release\List\net.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN ADC_data
        EXTERN RXbuf
        EXTERN TXbuf
        EXTERN USART_ITConfig
        EXTERN __aeabi_cfcmple
        EXTERN __aeabi_cfrcmple
        EXTERN __aeabi_d2f
        EXTERN __aeabi_dadd
        EXTERN __aeabi_ddiv
        EXTERN __aeabi_dmul
        EXTERN __aeabi_f2d
        EXTERN __aeabi_f2iz
        EXTERN __aeabi_f2uiz
        EXTERN __aeabi_fadd
        EXTERN __aeabi_i2f
        EXTERN __aeabi_memcpy
        EXTERN __aeabi_ui2f
        EXTERN cam_power_state
        EXTERN cam_sets
        EXTERN clean
        EXTERN ctrl_unit_masks_buf
        EXTERN encoder0
        EXTERN encoder0_func
        EXTERN encoder0_func_2enc
        EXTERN encoder0_masks_buf
        EXTERN encoder1
        EXTERN encoder1_func
        EXTERN encoder1_masks_buf
        EXTERN encoder1_t_func
        EXTERN error_counter
        EXTERN flash
        EXTERN get
        EXTERN get_empty
        EXTERN insert_crc
        EXTERN insert_stsp
        EXTERN keys
        EXTERN net_fault_flag
        EXTERN `pop`
        EXTERN `push`
        EXTERN senspar
        EXTERN spi_objects
        EXTERN spi_read_camers_state
        EXTERN spi_sets

        PUBLIC Power_control_func
        PUBLIC calibrate_compass
        PUBLIC cu_get_keys
        PUBLIC cu_get_net_condition
        PUBLIC eoc_brightnes_value
        PUBLIC expo_timeout
        PUBLIC expossition_value
        PUBLIC extern_master_find
        PUBLIC find_PC_connecting
        PUBLIC get_compass
        PUBLIC get_compass_status
        PUBLIC get_declinate
        PUBLIC get_encoder_0
        PUBLIC get_encoder_1
        PUBLIC get_gps
        PUBLIC get_inclinate
        PUBLIC get_pressure
        PUBLIC get_temperature
        PUBLIC keys_analis
        PUBLIC keys_analis_P_O
        PUBLIC keys_syncro_count
        PUBLIC keys_syncro_func
        PUBLIC led_brightnes
        PUBLIC lpd_requests
        PUBLIC make_request
        PUBLIC net_counter
        PUBLIC net_fault_function
        PUBLIC net_global_count
        PUBLIC net_init
        PUBLIC net_set_default
        PUBLIC net_sets
        PUBLIC net_status
        PUBLIC net_task
        PUBLIC obj_in_net
        PUBLIC power_off
        PUBLIC pref_net_init
        PUBLIC read_sets_from_CU
        PUBLIC rf_get_distance
        PUBLIC rf_get_status
        PUBLIC rf_start_messure
        PUBLIC smart_device_ini
        PUBLIC system_wait_timer
        PUBLIC task_flag
        PUBLIC uart_obj_buf
        PUBLIC wright_data_to_cam


        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
uart_obj_buf:
        DS8 180

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
net_sets:
        DS8 28

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
        DATA
obj_in_net:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        DATA
task_flag:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
        DATA
keys_syncro_count:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
        DATA
system_wait_timer:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
net_status:
        DS8 68

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
        DATA
net_global_count:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
extern_master_find:
        DS8 12

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
cu_get_keys:
        DS8 12

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
cu_get_net_condition:
        DS8 12

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
get_gps:
        DS8 12

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
get_compass:
        DS8 12

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
calibrate_compass:
        DS8 12

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
get_compass_status:
        DS8 12

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
get_temperature:
        DS8 12

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
get_pressure:
        DS8 12

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
get_inclinate:
        DS8 12

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
get_declinate:
        DS8 12

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
power_off:
        DS8 12

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
get_encoder_0:
        DS8 12

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
get_encoder_1:
        DS8 12

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
rf_start_messure:
        DS8 12

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
rf_get_status:
        DS8 12

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
rf_get_distance:
        DS8 12

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
read_sets_from_CU:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
find_PC_connecting:
        MOVS     R0,#+0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
smart_device_ini:
        LDR.W    R0,??DataTable8
        LDRB     R0,[R0, #+16]
        TST      R0,#0xF
        BNE.N    ??smart_device_ini_0
        MOVS     R0,#+1
        LDR.W    R1,??DataTable8_1
        STRB     R0,[R1, #+1]
        B.N      ??smart_device_ini_1
??smart_device_ini_0:
        MOVS     R0,#+0
        LDR.W    R1,??DataTable8_1
        STRB     R0,[R1, #+1]
??smart_device_ini_1:
        LDR.W    R0,??DataTable8
        LDRB     R0,[R0, #+16]
        ANDS     R0,R0,#0xF
        CMP      R0,#+3
        BNE.N    ??smart_device_ini_2
        MOVS     R0,#+0
        LDR.W    R1,??DataTable8_2
        STRB     R0,[R1, #+3]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11
        STRB     R0,[R1, #+1]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11
        STRB     R0,[R1, #+3]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable8_3
        STRB     R0,[R1, #+1]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable8_3
        STRB     R0,[R1, #+3]
??smart_device_ini_2:
        LDR.W    R0,??DataTable8
        LDR      R0,[R0, #+16]
        ANDS     R0,R0,#0xC200
        CMP      R0,#+0
        BEQ.W    ??smart_device_ini_3
        CMP      R0,#+512
        BEQ.W    ??smart_device_ini_4
        CMP      R0,#+16384
        BEQ.N    ??smart_device_ini_5
        CMP      R0,#+16896
        BEQ.N    ??smart_device_ini_6
        CMP      R0,#+32768
        BEQ.N    ??smart_device_ini_7
        CMP      R0,#+33280
        BEQ.N    ??smart_device_ini_8
        CMP      R0,#+49152
        BEQ.N    ??smart_device_ini_9
        CMP      R0,#+49664
        BNE.W    ??smart_device_ini_10
??smart_device_ini_11:
        B.N      ??smart_device_ini_10
??smart_device_ini_9:
        B.N      ??smart_device_ini_10
??smart_device_ini_6:
        MOVS     R0,#+1
        LDR.W    R1,??DataTable8_1
        STRB     R0,[R1, #+2]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable8_1
        STRB     R0,[R1, #+10]
        MOVS     R0,#+49
        LDR.W    R1,??DataTable9
        STRB     R0,[R1, #+0]
        MOVS     R0,#+50
        LDR.W    R1,??DataTable9_1
        STRB     R0,[R1, #+0]
        LDR.W    R0,??DataTable9_2
        LDR.W    R1,??DataTable9
        STR      R0,[R1, #+4]
        B.N      ??smart_device_ini_10
??smart_device_ini_5:
        MOVS     R0,#+1
        LDR.W    R1,??DataTable8_1
        STRB     R0,[R1, #+10]
        MOVS     R0,#+51
        LDR.W    R1,??DataTable9
        STRB     R0,[R1, #+0]
        MOVS     R0,#+50
        LDR.W    R1,??DataTable9_1
        STRB     R0,[R1, #+0]
        LDR.W    R0,??DataTable9_2
        LDR.W    R1,??DataTable9
        STR      R0,[R1, #+4]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11
        STRB     R0,[R1, #+8]
        B.N      ??smart_device_ini_10
??smart_device_ini_8:
        MOVS     R0,#+1
        LDR.W    R1,??DataTable8_1
        STRB     R0,[R1, #+2]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable8_1
        STRB     R0,[R1, #+11]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable8_1
        STRB     R0,[R1, #+10]
        MOVS     R0,#+48
        LDR.W    R1,??DataTable9
        STRB     R0,[R1, #+0]
        MOVS     R0,#+49
        LDR.W    R1,??DataTable9_1
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11
        STRB     R0,[R1, #+1]
        LDR.W    R0,??DataTable10
        LDR.W    R1,??DataTable9
        STR      R0,[R1, #+4]
        LDR.W    R0,??DataTable8
        LDRB     R0,[R0, #+16]
        LSLS     R0,R0,#+27
        BPL.N    ??smart_device_ini_12
        LDR.W    R0,??DataTable11_1
        LDR.W    R1,??DataTable9_1
        STR      R0,[R1, #+4]
        B.N      ??smart_device_ini_13
??smart_device_ini_12:
        LDR.W    R0,??DataTable11_2
        LDR.W    R1,??DataTable9_1
        STR      R0,[R1, #+4]
??smart_device_ini_13:
        B.N      ??smart_device_ini_10
??smart_device_ini_7:
        MOVS     R0,#+1
        LDR.W    R1,??DataTable8_1
        STRB     R0,[R1, #+11]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable8_1
        STRB     R0,[R1, #+10]
        MOVS     R0,#+49
        LDR.W    R1,??DataTable9
        STRB     R0,[R1, #+0]
        MOVS     R0,#+51
        LDR.W    R1,??DataTable9_1
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11
        STRB     R0,[R1, #+1]
        LDR.W    R0,??DataTable9_2
        LDR.W    R1,??DataTable9_1
        STR      R0,[R1, #+4]
        LDR.W    R0,??DataTable8
        LDRB     R0,[R0, #+16]
        LSLS     R0,R0,#+27
        BPL.N    ??smart_device_ini_14
        LDR.W    R0,??DataTable11_1
        LDR.W    R1,??DataTable9
        STR      R0,[R1, #+4]
        B.N      ??smart_device_ini_15
??smart_device_ini_14:
        LDR.W    R0,??DataTable11_2
        LDR.W    R1,??DataTable9
        STR      R0,[R1, #+4]
??smart_device_ini_15:
        B.N      ??smart_device_ini_10
??smart_device_ini_4:
        MOVS     R0,#+1
        LDR.W    R1,??DataTable8_1
        STRB     R0,[R1, #+2]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11
        STRB     R0,[R1, #+1]
        MOVS     R0,#+48
        LDR.W    R1,??DataTable9
        STRB     R0,[R1, #+0]
        MOVS     R0,#+49
        LDR.W    R1,??DataTable9_1
        STRB     R0,[R1, #+0]
        B.N      ??smart_device_ini_10
??smart_device_ini_3:
??smart_device_ini_10:
        MOVS     R0,#+1
        LDR.W    R1,??DataTable8_1
        STRB     R0,[R1, #+8]
        LDR.W    R0,??DataTable8
        LDR      R0,[R0, #+16]
        TST      R0,#0x3000
        BEQ.N    ??smart_device_ini_16
        MOVS     R0,#+1
        LDR.W    R1,??DataTable8_1
        STRB     R0,[R1, #+7]
        B.N      ??smart_device_ini_17
??smart_device_ini_16:
        MOVS     R0,#+0
        LDR.W    R1,??DataTable8_1
        STRB     R0,[R1, #+7]
??smart_device_ini_17:
        LDR.W    R0,??DataTable8
        LDR      R0,[R0, #+16]
        LSLS     R0,R0,#+20
        BPL.N    ??smart_device_ini_18
        MOVS     R0,#+1
        LDR.W    R1,??DataTable8_1
        STRB     R0,[R1, #+6]
        B.N      ??smart_device_ini_19
??smart_device_ini_18:
        MOVS     R0,#+0
        LDR.W    R1,??DataTable8_1
        STRB     R0,[R1, #+6]
??smart_device_ini_19:
        LDR.W    R0,??DataTable8
        LDR      R0,[R0, #+16]
        LSLS     R0,R0,#+21
        BPL.N    ??smart_device_ini_20
        MOVS     R0,#+1
        LDR.W    R1,??DataTable8_1
        STRB     R0,[R1, #+9]
        B.N      ??smart_device_ini_21
??smart_device_ini_20:
        MOVS     R0,#+0
        LDR.W    R1,??DataTable8_1
        STRB     R0,[R1, #+9]
??smart_device_ini_21:
        LDR.W    R0,??DataTable8
        LDRB     R0,[R0, #+16]
        LSLS     R0,R0,#+26
        BPL.N    ??smart_device_ini_22
        MOVS     R0,#+255
        LDR.W    R1,??DataTable11
        STRB     R0,[R1, #+9]
        B.N      ??smart_device_ini_23
??smart_device_ini_22:
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11
        STRB     R0,[R1, #+9]
??smart_device_ini_23:
        LDR.W    R0,??DataTable8
        LDR      R0,[R0, #+16]
        LSLS     R0,R0,#+14
        BPL.N    ??smart_device_ini_24
        MOVS     R0,#+255
        LDR.W    R1,??DataTable11
        STRB     R0,[R1, #+8]
        B.N      ??smart_device_ini_25
??smart_device_ini_24:
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11
        STRB     R0,[R1, #+8]
??smart_device_ini_25:
        LDR.W    R0,??DataTable8
        LDRB     R0,[R0, #+16]
        LSLS     R0,R0,#+27
        BPL.N    ??smart_device_ini_26
        MOVS     R0,#+1
        LDR.W    R1,??DataTable11_3
        STRB     R0,[R1, #+1]
        B.N      ??smart_device_ini_27
??smart_device_ini_26:
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11_3
        STRB     R0,[R1, #+1]
??smart_device_ini_27:
        LDR.W    R0,??DataTable8
        LDRB     R0,[R0, #+16]
        ANDS     R0,R0,#0x7
        CMP      R0,#+2
        BEQ.N    ??smart_device_ini_28
        LDR.W    R0,??DataTable8
        LDRB     R0,[R0, #+16]
        ANDS     R0,R0,#0x7
        CMP      R0,#+3
        BNE.N    ??smart_device_ini_29
??smart_device_ini_28:
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11
        STRB     R0,[R1, #+7]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11
        STRB     R0,[R1, #+1]
??smart_device_ini_29:
        LDR.W    R0,??DataTable8
        LDRB     R0,[R0, #+16]
        LSLS     R0,R0,#+25
        BMI.N    ??smart_device_ini_30
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11
        STRB     R0,[R1, #+10]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11
        STRB     R0,[R1, #+11]
??smart_device_ini_30:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
net_set_default:
        MOVS     R1,#+16
        LDR.W    R2,??DataTable8_1
        STRB     R1,[R2, #+0]
        LDR.W    R1,??DataTable8_1
        STRB     R0,[R1, #+1]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
pref_net_init:
        PUSH     {R7,LR}
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11_4
        STRH     R0,[R1, #+0]
        MOVS     R0,#+21
        LDR.W    R1,??DataTable11_5
        STRB     R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable11_5
        STRB     R0,[R1, #+1]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable11_5
        STRB     R0,[R1, #+2]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11_5
        STRH     R0,[R1, #+4]
        MOVW     R0,#+5200
        LDR.W    R1,??DataTable11_5
        STRH     R0,[R1, #+6]
        LDR.W    R0,??DataTable11_4
        LDRH     R0,[R0, #+0]
        LDR.W    R1,??DataTable11_5
        STRH     R0,[R1, #+10]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable11_5
        STRB     R0,[R1, #+8]
        LDR.W    R0,??DataTable11_6
        LDR.W    R1,??DataTable11_4
        LDRH     R1,[R1, #+0]
        MOVS     R2,#+12
        MULS     R1,R2,R1
        ADD      R0,R0,R1
        LDR.W    R1,??DataTable11_5
        MOVS     R2,#+12
        BL       __aeabi_memcpy
        LDR.W    R0,??DataTable11_4
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable11_4
        STRH     R0,[R1, #+0]
        MOVS     R0,#+22
        LDR.W    R1,??DataTable11_7
        STRB     R0,[R1, #+0]
        MOVS     R0,#+4
        LDR.W    R1,??DataTable11_7
        STRB     R0,[R1, #+1]
        MOVS     R0,#+4
        LDR.W    R1,??DataTable11_7
        STRB     R0,[R1, #+2]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11_7
        STRH     R0,[R1, #+4]
        MOVW     R0,#+5300
        LDR.W    R1,??DataTable11_7
        STRH     R0,[R1, #+6]
        LDR.W    R0,??DataTable11_4
        LDRH     R0,[R0, #+0]
        LDR.W    R1,??DataTable11_7
        STRH     R0,[R1, #+10]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable11_7
        STRB     R0,[R1, #+8]
        LDR.W    R0,??DataTable11_6
        LDR.W    R1,??DataTable11_4
        LDRH     R1,[R1, #+0]
        MOVS     R2,#+12
        MULS     R1,R2,R1
        ADD      R0,R0,R1
        LDR.W    R1,??DataTable11_7
        MOVS     R2,#+12
        BL       __aeabi_memcpy
        LDR.W    R0,??DataTable11_4
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable11_4
        STRH     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable8_1
        STRB     R0,[R1, #+1]
        MOVW     R0,#+5200
        LDR.W    R1,??DataTable11_6
        LDR.W    R2,??DataTable11_5
        LDRH     R2,[R2, #+10]
        MOVS     R3,#+12
        MULS     R2,R3,R2
        ADD      R1,R1,R2
        STRH     R0,[R1, #+4]
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
net_init:
        PUSH     {R7,LR}
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11_4
        STRH     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11_8
        STRH     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11_9
        STRB     R0,[R1, #+2]
        LDR.W    R0,??DataTable8_1
        LDRB     R0,[R0, #+2]
        CMP      R0,#+0
        BEQ.N    ??net_init_0
        LDR.W    R0,??DataTable8
        LDR      R0,[R0, #+16]
        LSLS     R0,R0,#+23
        BPL.N    ??net_init_1
        MOVS     R0,#+1
        LDR.W    R1,??DataTable11_10
        STRB     R0,[R1, #+0]
        MOVS     R0,#+4
        LDR.W    R1,??DataTable11_10
        STRB     R0,[R1, #+1]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable11_10
        STRB     R0,[R1, #+2]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11_10
        STRH     R0,[R1, #+4]
        MOVS     R0,#+100
        LDR.W    R1,??DataTable11_10
        STRH     R0,[R1, #+6]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11_10
        STRB     R0,[R1, #+8]
        LDR.W    R0,??DataTable11_4
        LDRH     R0,[R0, #+0]
        LDR.W    R1,??DataTable11_10
        STRH     R0,[R1, #+10]
        LDR.W    R0,??DataTable11_6
        LDR.W    R1,??DataTable11_4
        LDRH     R1,[R1, #+0]
        MOVS     R2,#+12
        MULS     R1,R2,R1
        ADD      R0,R0,R1
        LDR.W    R1,??DataTable11_10
        MOVS     R2,#+12
        BL       __aeabi_memcpy
        LDR.W    R0,??DataTable11_4
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable11_4
        STRH     R0,[R1, #+0]
??net_init_1:
        MOVS     R0,#+18
        LDR.W    R1,??DataTable11_11
        STRB     R0,[R1, #+0]
        MOVS     R0,#+4
        LDR.W    R1,??DataTable11_11
        STRB     R0,[R1, #+1]
        MOVS     R0,#+2
        LDR.W    R1,??DataTable11_11
        STRB     R0,[R1, #+2]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11_11
        STRH     R0,[R1, #+4]
        MOVS     R0,#+150
        LDR.W    R1,??DataTable11_11
        STRH     R0,[R1, #+6]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable11_11
        STRB     R0,[R1, #+8]
        LDR.W    R0,??DataTable11_4
        LDRH     R0,[R0, #+0]
        LDR.W    R1,??DataTable11_11
        STRH     R0,[R1, #+10]
        LDR.W    R0,??DataTable11_6
        LDR.W    R1,??DataTable11_4
        LDRH     R1,[R1, #+0]
        MOVS     R2,#+12
        MULS     R1,R2,R1
        ADD      R0,R0,R1
        LDR.W    R1,??DataTable11_11
        MOVS     R2,#+12
        BL       __aeabi_memcpy
        LDR.W    R0,??DataTable11_4
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable11_4
        STRH     R0,[R1, #+0]
??net_init_0:
        LDR.W    R0,??DataTable8_1
        LDRB     R0,[R0, #+10]
        CMP      R0,#+0
        BEQ.N    ??net_init_2
        MOVS     R0,#+19
        LDR.W    R1,??DataTable11_12
        STRB     R0,[R1, #+0]
        LDR.W    R0,??DataTable9
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable11_12
        STRB     R0,[R1, #+1]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable11_12
        STRB     R0,[R1, #+2]
        MOVS     R0,#+50
        LDR.W    R1,??DataTable11_12
        STRH     R0,[R1, #+4]
        MOVS     R0,#+100
        LDR.W    R1,??DataTable11_12
        STRH     R0,[R1, #+6]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11_12
        STRB     R0,[R1, #+8]
        LDR.W    R0,??DataTable11_6
        LDR.W    R1,??DataTable11_4
        LDRH     R1,[R1, #+0]
        MOVS     R2,#+12
        MULS     R1,R2,R1
        ADD      R0,R0,R1
        LDR.W    R1,??DataTable11_12
        MOVS     R2,#+12
        BL       __aeabi_memcpy
        LDR.W    R0,??DataTable11_4
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable11_4
        STRH     R0,[R1, #+0]
??net_init_2:
        LDR.W    R0,??DataTable8_1
        LDRB     R0,[R0, #+11]
        CMP      R0,#+0
        BEQ.N    ??net_init_3
        MOVS     R0,#+20
        LDR.W    R1,??DataTable11_13
        STRB     R0,[R1, #+0]
        LDR.W    R0,??DataTable9_1
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable11_13
        STRB     R0,[R1, #+1]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable11_13
        STRB     R0,[R1, #+2]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11_13
        STRH     R0,[R1, #+4]
        MOVS     R0,#+100
        LDR.W    R1,??DataTable11_13
        STRH     R0,[R1, #+6]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11_13
        STRB     R0,[R1, #+8]
        LDR.W    R0,??DataTable11_6
        LDR.W    R1,??DataTable11_4
        LDRH     R1,[R1, #+0]
        MOVS     R2,#+12
        MULS     R1,R2,R1
        ADD      R0,R0,R1
        LDR.W    R1,??DataTable11_13
        MOVS     R2,#+12
        BL       __aeabi_memcpy
        LDR.W    R0,??DataTable11_4
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable11_4
        STRH     R0,[R1, #+0]
??net_init_3:
        LDR.W    R0,??DataTable8_1
        LDRB     R0,[R0, #+6]
        CMP      R0,#+0
        BEQ.N    ??net_init_4
        MOVS     R0,#+2
        LDR.W    R1,??DataTable11_14
        STRB     R0,[R1, #+0]
        MOVS     R0,#+96
        LDR.W    R1,??DataTable11_14
        STRB     R0,[R1, #+1]
        MOVS     R0,#+2
        LDR.W    R1,??DataTable11_14
        STRB     R0,[R1, #+2]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11_14
        STRH     R0,[R1, #+4]
        MOV      R0,#+1000
        LDR.W    R1,??DataTable11_14
        STRH     R0,[R1, #+6]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11_14
        STRB     R0,[R1, #+8]
        LDR.W    R0,??DataTable11_6
        LDR.W    R1,??DataTable11_4
        LDRH     R1,[R1, #+0]
        MOVS     R2,#+12
        MULS     R1,R2,R1
        ADD      R0,R0,R1
        LDR.W    R1,??DataTable11_14
        MOVS     R2,#+12
        BL       __aeabi_memcpy
        LDR.W    R0,??DataTable11_4
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable11_4
        STRH     R0,[R1, #+0]
??net_init_4:
        LDR.W    R0,??DataTable8_1
        LDRB     R0,[R0, #+7]
        CMP      R0,#+0
        BEQ.W    ??net_init_5
        MOVS     R0,#+8
        LDR.W    R1,??DataTable11_15
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11_15
        STRB     R0,[R1, #+1]
        MOVS     R0,#+9
        LDR.W    R1,??DataTable11_15
        STRB     R0,[R1, #+2]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11_15
        STRH     R0,[R1, #+4]
        MOV      R0,#+500
        LDR.W    R1,??DataTable11_15
        STRH     R0,[R1, #+6]
        LDR.W    R0,??DataTable8
        LDR      R0,[R0, #+16]
        ANDS     R0,R0,#0x3000
        CMP      R0,#+8192
        BEQ.N    ??net_init_6
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11_15
        STRB     R0,[R1, #+8]
        B.N      ??net_init_7
??net_init_6:
        MOVS     R0,#+1
        LDR.W    R1,??DataTable11_15
        STRB     R0,[R1, #+8]
??net_init_7:
        LDR.W    R0,??DataTable11_4
        LDRH     R0,[R0, #+0]
        LDR.W    R1,??DataTable11_15
        STRH     R0,[R1, #+10]
        LDR.W    R0,??DataTable11_6
        LDR.W    R1,??DataTable11_4
        LDRH     R1,[R1, #+0]
        MOVS     R2,#+12
        MULS     R1,R2,R1
        ADD      R0,R0,R1
        LDR.W    R1,??DataTable11_15
        MOVS     R2,#+12
        BL       __aeabi_memcpy
        LDR.W    R0,??DataTable11_4
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable11_4
        STRH     R0,[R1, #+0]
        MOVS     R0,#+9
        LDR.W    R1,??DataTable11_16
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11_16
        STRB     R0,[R1, #+1]
        MOVS     R0,#+14
        LDR.W    R1,??DataTable11_16
        STRB     R0,[R1, #+2]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11_16
        STRH     R0,[R1, #+4]
        MOVW     R0,#+5300
        LDR.W    R1,??DataTable11_16
        STRH     R0,[R1, #+6]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable11_16
        STRB     R0,[R1, #+8]
        LDR.W    R0,??DataTable11_4
        LDRH     R0,[R0, #+0]
        LDR.W    R1,??DataTable11_16
        STRH     R0,[R1, #+10]
        LDR.W    R0,??DataTable11_6
        LDR.W    R1,??DataTable11_4
        LDRH     R1,[R1, #+0]
        MOVS     R2,#+12
        MULS     R1,R2,R1
        ADD      R0,R0,R1
        LDR.W    R1,??DataTable11_16
        MOVS     R2,#+12
        BL       __aeabi_memcpy
        LDR.W    R0,??DataTable11_4
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable11_4
        STRH     R0,[R1, #+0]
        MOVS     R0,#+10
        LDR.W    R1,??DataTable11_17
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11_17
        STRB     R0,[R1, #+1]
        MOVS     R0,#+15
        LDR.W    R1,??DataTable11_17
        STRB     R0,[R1, #+2]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11_17
        STRH     R0,[R1, #+4]
        MOV      R0,#+500
        LDR.W    R1,??DataTable11_17
        STRH     R0,[R1, #+6]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable11_17
        STRB     R0,[R1, #+8]
        LDR.W    R0,??DataTable11_4
        LDRH     R0,[R0, #+0]
        LDR.W    R1,??DataTable11_17
        STRH     R0,[R1, #+10]
        LDR.W    R0,??DataTable11_6
        LDR.W    R1,??DataTable11_4
        LDRH     R1,[R1, #+0]
        MOVS     R2,#+12
        MULS     R1,R2,R1
        ADD      R0,R0,R1
        LDR.W    R1,??DataTable11_17
        MOVS     R2,#+12
        BL       __aeabi_memcpy
        LDR.W    R0,??DataTable11_4
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable11_4
        STRH     R0,[R1, #+0]
        MOVS     R0,#+3
        LDR.W    R1,??DataTable11_18
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11_18
        STRB     R0,[R1, #+1]
        MOVS     R0,#+4
        LDR.W    R1,??DataTable11_18
        STRB     R0,[R1, #+2]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11_18
        STRH     R0,[R1, #+4]
        MOV      R0,#+1000
        LDR.W    R1,??DataTable11_18
        STRH     R0,[R1, #+6]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11_18
        STRB     R0,[R1, #+8]
        LDR.W    R0,??DataTable11_4
        LDRH     R0,[R0, #+0]
        LDR.W    R1,??DataTable11_18
        STRH     R0,[R1, #+10]
        LDR.W    R0,??DataTable11_6
        LDR.W    R1,??DataTable11_4
        LDRH     R1,[R1, #+0]
        MOVS     R2,#+12
        MULS     R1,R2,R1
        ADD      R0,R0,R1
        LDR.W    R1,??DataTable11_18
        MOVS     R2,#+12
        BL       __aeabi_memcpy
        LDR.W    R0,??DataTable11_4
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable11_4
        STRH     R0,[R1, #+0]
        MOVS     R0,#+4
        LDR.W    R1,??DataTable11_19
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11_19
        STRB     R0,[R1, #+1]
        MOVS     R0,#+5
        LDR.W    R1,??DataTable11_19
        STRB     R0,[R1, #+2]
        MOV      R0,#+500
        LDR.W    R1,??DataTable11_19
        STRH     R0,[R1, #+4]
        MOV      R0,#+1000
        LDR.W    R1,??DataTable11_19
        STRH     R0,[R1, #+6]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11_19
        STRB     R0,[R1, #+8]
        LDR.W    R0,??DataTable11_4
        LDRH     R0,[R0, #+0]
        LDR.W    R1,??DataTable11_19
        STRH     R0,[R1, #+10]
        LDR.W    R0,??DataTable11_6
        LDR.W    R1,??DataTable11_4
        LDRH     R1,[R1, #+0]
        MOVS     R2,#+12
        MULS     R1,R2,R1
        ADD      R0,R0,R1
        LDR.W    R1,??DataTable11_19
        MOVS     R2,#+12
        BL       __aeabi_memcpy
        LDR.W    R0,??DataTable11_4
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable11_4
        STRH     R0,[R1, #+0]
        MOVS     R0,#+5
        LDR.W    R1,??DataTable11_20
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11_20
        STRB     R0,[R1, #+1]
        MOVS     R0,#+12
        LDR.W    R1,??DataTable11_20
        STRB     R0,[R1, #+2]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11_20
        STRH     R0,[R1, #+4]
        MOVS     R0,#+100
        LDR.W    R1,??DataTable11_20
        STRH     R0,[R1, #+6]
        LDR.W    R0,??DataTable8
        LDR      R0,[R0, #+16]
        ANDS     R0,R0,#0x3000
        CMP      R0,#+4096
        BNE.N    ??net_init_8
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11_20
        STRB     R0,[R1, #+8]
        B.N      ??net_init_9
??net_init_8:
        MOVS     R0,#+1
        LDR.W    R1,??DataTable11_20
        STRB     R0,[R1, #+8]
??net_init_9:
        LDR.W    R0,??DataTable11_4
        LDRH     R0,[R0, #+0]
        LDR.W    R1,??DataTable11_20
        STRH     R0,[R1, #+10]
        LDR.W    R0,??DataTable11_6
        LDR.W    R1,??DataTable11_4
        LDRH     R1,[R1, #+0]
        MOVS     R2,#+12
        MULS     R1,R2,R1
        ADD      R0,R0,R1
        LDR.W    R1,??DataTable11_20
        MOVS     R2,#+12
        BL       __aeabi_memcpy
        LDR.W    R0,??DataTable11_4
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable11_4
        STRH     R0,[R1, #+0]
        MOVS     R0,#+6
        LDR.W    R1,??DataTable11_21
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11_21
        STRB     R0,[R1, #+1]
        MOVS     R0,#+13
        LDR.W    R1,??DataTable11_21
        STRB     R0,[R1, #+2]
        MOVS     R0,#+50
        LDR.W    R1,??DataTable11_21
        STRH     R0,[R1, #+4]
        MOVS     R0,#+100
        LDR.W    R1,??DataTable11_21
        STRH     R0,[R1, #+6]
        LDR.N    R0,??DataTable8
        LDR      R0,[R0, #+16]
        ANDS     R0,R0,#0x3000
        CMP      R0,#+4096
        BNE.N    ??net_init_10
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11_21
        STRB     R0,[R1, #+8]
        B.N      ??net_init_11
??net_init_10:
        MOVS     R0,#+1
        LDR.W    R1,??DataTable11_21
        STRB     R0,[R1, #+8]
??net_init_11:
        LDR.W    R0,??DataTable11_4
        LDRH     R0,[R0, #+0]
        LDR.W    R1,??DataTable11_21
        STRH     R0,[R1, #+10]
        LDR.W    R0,??DataTable11_6
        LDR.W    R1,??DataTable11_4
        LDRH     R1,[R1, #+0]
        MOVS     R2,#+12
        MULS     R1,R2,R1
        ADD      R0,R0,R1
        LDR.W    R1,??DataTable11_21
        MOVS     R2,#+12
        BL       __aeabi_memcpy
        LDR.W    R0,??DataTable11_4
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable11_4
        STRH     R0,[R1, #+0]
??net_init_5:
        LDR.N    R0,??DataTable8_1
        LDRB     R0,[R0, #+8]
        CMP      R0,#+0
        BEQ.W    ??net_init_12
        MOVS     R0,#+11
        LDR.W    R1,??DataTable11_22
        STRB     R0,[R1, #+0]
        MOVS     R0,#+8
        LDR.W    R1,??DataTable11_22
        STRB     R0,[R1, #+1]
        MOVS     R0,#+5
        LDR.W    R1,??DataTable11_22
        STRB     R0,[R1, #+2]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11_22
        STRH     R0,[R1, #+4]
        MOVW     R0,#+5500
        LDR.W    R1,??DataTable11_22
        STRH     R0,[R1, #+6]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable11_22
        STRB     R0,[R1, #+8]
        LDR.W    R0,??DataTable11_4
        LDRH     R0,[R0, #+0]
        LDR.W    R1,??DataTable11_22
        STRH     R0,[R1, #+10]
        LDR.W    R0,??DataTable11_6
        LDR.W    R1,??DataTable11_4
        LDRH     R1,[R1, #+0]
        MOVS     R2,#+12
        MULS     R1,R2,R1
        ADD      R0,R0,R1
        LDR.W    R1,??DataTable11_22
        MOVS     R2,#+12
        BL       __aeabi_memcpy
        LDR.W    R0,??DataTable11_4
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable11_4
        STRH     R0,[R1, #+0]
        MOVS     R0,#+12
        LDR.W    R1,??DataTable11_23
        STRB     R0,[R1, #+0]
        MOVS     R0,#+8
        LDR.W    R1,??DataTable11_23
        STRB     R0,[R1, #+1]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable11_23
        STRB     R0,[R1, #+2]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11_23
        STRH     R0,[R1, #+4]
        MOV      R0,#+500
        LDR.W    R1,??DataTable11_23
        STRH     R0,[R1, #+6]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable11_23
        STRB     R0,[R1, #+8]
        LDR.W    R0,??DataTable11_4
        LDRH     R0,[R0, #+0]
        LDR.W    R1,??DataTable11_23
        STRH     R0,[R1, #+10]
        LDR.W    R0,??DataTable11_6
        LDR.W    R1,??DataTable11_4
        LDRH     R1,[R1, #+0]
        MOVS     R2,#+12
        MULS     R1,R2,R1
        ADD      R0,R0,R1
        LDR.W    R1,??DataTable11_23
        MOVS     R2,#+12
        BL       __aeabi_memcpy
        LDR.W    R0,??DataTable11_4
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable11_4
        STRH     R0,[R1, #+0]
        MOVS     R0,#+14
        LDR.W    R1,??DataTable11_24
        STRB     R0,[R1, #+0]
        MOVS     R0,#+8
        LDR.W    R1,??DataTable11_24
        STRB     R0,[R1, #+1]
        MOVS     R0,#+4
        LDR.W    R1,??DataTable11_24
        STRB     R0,[R1, #+2]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable11_24
        STRH     R0,[R1, #+4]
        MOV      R0,#+5600
        LDR.W    R1,??DataTable11_24
        STRH     R0,[R1, #+6]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable11_24
        STRB     R0,[R1, #+8]
        LDR.W    R0,??DataTable11_4
        LDRH     R0,[R0, #+0]
        LDR.W    R1,??DataTable11_24
        STRH     R0,[R1, #+10]
        LDR.W    R0,??DataTable11_6
        LDR.N    R1,??DataTable11_4
        LDRH     R1,[R1, #+0]
        MOVS     R2,#+12
        MULS     R1,R2,R1
        ADD      R0,R0,R1
        LDR.W    R1,??DataTable11_24
        MOVS     R2,#+12
        BL       __aeabi_memcpy
        LDR.N    R0,??DataTable11_4
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable11_4
        STRH     R0,[R1, #+0]
??net_init_12:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
net_counter:
        MOVS     R0,#+0
        B.N      ??net_counter_0
??net_counter_1:
        LDR.N    R1,??DataTable11_6
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        MOVS     R2,#+12
        MUL      R2,R2,R0
        ADD      R1,R1,R2
        LDRB     R1,[R1, #+8]
        CMP      R1,#+1
        BEQ.N    ??net_counter_2
        LDR.N    R1,??DataTable11_6
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        MOVS     R2,#+12
        MUL      R2,R2,R0
        ADD      R1,R1,R2
        LDRH     R1,[R1, #+4]
        ADDS     R1,R1,#+1
        LDR.N    R2,??DataTable11_6
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        MOVS     R3,#+12
        MUL      R3,R3,R0
        ADD      R2,R2,R3
        STRH     R1,[R2, #+4]
??net_counter_2:
        ADDS     R0,R0,#+1
??net_counter_0:
        MOVS     R1,R0
        LDR.N    R2,??DataTable11_4
        LDRH     R2,[R2, #+0]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,R2
        BCC.N    ??net_counter_1
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
net_task:
        PUSH     {R4,LR}
        SUB      SP,SP,#+16
        LDR.N    R0,??DataTable11_25
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??net_task_0
        MOVS     R4,#+0
        B.N      ??net_task_1
??net_task_2:
        LDR.N    R0,??DataTable11_6
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVS     R1,#+12
        MUL      R1,R1,R4
        ADD      R0,R0,R1
        LDRH     R0,[R0, #+4]
        LDR.N    R1,??DataTable11_6
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVS     R2,#+12
        MUL      R2,R2,R4
        ADD      R1,R1,R2
        LDRH     R1,[R1, #+6]
        CMP      R0,R1
        BCC.N    ??net_task_3
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable11_26
        BL       `push`
        MOVS     R0,#+0
        LDR.N    R1,??DataTable11_6
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVS     R2,#+12
        MUL      R2,R2,R4
        ADD      R1,R1,R2
        STRH     R0,[R1, #+4]
??net_task_3:
        ADDS     R4,R4,#+1
??net_task_1:
        MOVS     R0,R4
        LDR.N    R1,??DataTable11_4
        LDRH     R1,[R1, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,R1
        BCC.N    ??net_task_2
        LDR.N    R0,??DataTable11_26
        BL       get_empty
        CMP      R0,#+0
        BNE.N    ??net_task_0
        LDR.N    R0,??DataTable11_26
        BL       `pop`
        MOVS     R4,R0
        MOV      R0,SP
        LDR.N    R1,??DataTable11_6
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R2,#+12
        MUL      R2,R2,R4
        ADD      R1,R1,R2
        MOVS     R2,#+12
        BL       __aeabi_memcpy
        MOV      R0,SP
        LDM      R0,{R0-R2}
        BL       make_request
        LDR.N    R0,??DataTable11_6
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+12
        MUL      R1,R1,R4
        LDRB     R0,[R0, R1]
        LDR.N    R1,??DataTable11_9
        STRB     R0,[R1, #+2]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable11_6
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R2,#+12
        MUL      R2,R2,R4
        ADD      R1,R1,R2
        STRH     R0,[R1, #+4]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable11_25
        STRB     R0,[R1, #+0]
??net_task_0:
        POP      {R0-R4,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
make_request:
        PUSH     {R0-R2,LR}
        LDRB     R1,[SP, #+1]
        LDR.N    R0,??DataTable11_27
        BL       `push`
        LDRB     R1,[SP, #+2]
        LDR.N    R0,??DataTable11_27
        BL       `push`
        LDR.N    R0,??DataTable11_27
        BL       insert_crc
        LDR.N    R0,??DataTable11_27
        BL       insert_stsp
        MOVS     R2,#+1
        MOVW     R1,#+1574
        LDR.N    R0,??DataTable11_28  ;; 0x40013800
        BL       USART_ITConfig
        POP      {R0-R2,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
net_fault_function:
        PUSH     {R7,LR}
        LDR.N    R0,??DataTable11_9
        LDRB     R0,[R0, #+2]
        CMP      R0,#+21
        BEQ.N    ??net_fault_function_0
        CMP      R0,#+22
        BEQ.N    ??net_fault_function_1
        B.N      ??net_fault_function_2
??net_fault_function_0:
        MOVS     R0,#+0
        BL       net_set_default
        BL       net_init
        B.N      ??net_fault_function_3
??net_fault_function_1:
        BL       net_init
        MOV      R0,#+500
        LDR.N    R1,??DataTable11_29
        STRH     R0,[R1, #+0]
        B.N      ??net_fault_function_3
??net_fault_function_2:
        MOVS     R0,#+100
        LDR.N    R1,??DataTable11_29
        STRH     R0,[R1, #+0]
??net_fault_function_3:
        LDR.N    R0,??DataTable11_26
        BL       clean
        MOVS     R0,#+0
        LDR.N    R1,??DataTable11_30
        STRB     R0,[R1, #+0]
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Power_control_func:
        PUSH     {R4,LR}
        LDR.N    R0,??DataTable11_31
        LDRH     R0,[R0, #+0]
        BL       __aeabi_ui2f
        BL       __aeabi_f2d
        MOVS     R2,#+1717986918
        LDR.N    R3,??DataTable11_32  ;; 0x401a6666
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.N    R3,??DataTable11_33  ;; 0x40b00000
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        MOVS     R4,R0
        LDR.N    R0,??DataTable11_31
        LDRH     R0,[R0, #+2]
        BL       __aeabi_ui2f
        BL       __aeabi_f2d
        MOVS     R2,#+1717986918
        LDR.N    R3,??DataTable11_34  ;; 0x400a6666
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.N    R3,??DataTable11_33  ;; 0x40b00000
        BL       __aeabi_ddiv
        LDR.N    R2,??DataTable11_35  ;; 0x63886595
        LDR.N    R3,??DataTable11_36  ;; 0xbffddc5d
        BL       __aeabi_dadd
        LDR.N    R2,??DataTable11_37  ;; 0x3d859c8d
        LDR.N    R3,??DataTable11_38  ;; 0x3f87f0ed
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        MOVS     R2,R0
        MOVS     R0,R4
        LDR.N    R1,??DataTable11_39  ;; 0x4059999a
        BL       __aeabi_cfcmple
        BCS.N    ??Power_control_func_0
        MOVS     R4,#+0
??Power_control_func_0:
        MOVS     R0,R2
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BCS.N    ??Power_control_func_1
        MOVS     R2,#+0
??Power_control_func_1:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8:
        DC32     flash

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_1:
        DC32     net_sets

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_2:
        DC32     encoder1_masks_buf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_3:
        DC32     ctrl_unit_masks_buf

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
lpd_requests:
        PUSH     {R4,LR}
        SUB      SP,SP,#+8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BEQ.N    ??lpd_requests_0
        CMP      R0,#+4
        BEQ.N    ??lpd_requests_1
        CMP      R0,#+5
        BNE.N    ??lpd_requests_2
??lpd_requests_3:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable11_6
        LDR.N    R2,??DataTable11_23
        LDRH     R2,[R2, #+10]
        MOVS     R3,#+12
        MULS     R2,R3,R2
        ADD      R1,R1,R2
        STRB     R0,[R1, #+8]
        B.N      ??lpd_requests_2
??lpd_requests_0:
        LDR.N    R0,??DataTable11_6
        LDR.N    R1,??DataTable11_24
        LDRH     R1,[R1, #+10]
        MOVS     R2,#+12
        MULS     R1,R2,R1
        ADD      R0,R0,R1
        LDRH     R0,[R0, #+6]
        LDR.N    R1,??DataTable11_6
        LDR.N    R2,??DataTable11_24
        LDRH     R2,[R2, #+10]
        MOVS     R3,#+12
        MULS     R2,R3,R2
        ADD      R1,R1,R2
        STRH     R0,[R1, #+4]
        B.N      ??lpd_requests_2
??lpd_requests_1:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable11_6
        LDR.N    R2,??DataTable11_23
        LDRH     R2,[R2, #+10]
        MOVS     R3,#+12
        MULS     R2,R3,R2
        ADD      R1,R1,R2
        STRB     R0,[R1, #+8]
        MOV      R4,SP
        LDR.N    R0,??DataTable11_40
        BL       `pop`
        LDR.N    R0,??DataTable11_40
        BL       `pop`
        STRB     R0,[R4, #+0]
        LDR.N    R0,??DataTable11_40
        BL       `pop`
        STRB     R0,[R4, #+1]
        LDR.N    R0,??DataTable11_40
        BL       `pop`
        STRB     R0,[R4, #+2]
        LDR.N    R0,??DataTable11_40
        BL       `pop`
        STRB     R0,[R4, #+3]
        LDR      R0,[SP, #+0]
        LDR.N    R1,??DataTable11_41
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable11_41
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2uiz
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.N    R1,??DataTable11_42
        STR      R0,[R1, #+568]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable11_41
        STRB     R0,[R1, #+36]
??lpd_requests_2:
        POP      {R0,R1,R4,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9:
        DC32     encoder0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_1:
        DC32     encoder1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_2:
        DC32     encoder0_func

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
wright_data_to_cam:
        PUSH     {R7,LR}
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BEQ.N    ??wright_data_to_cam_0
        CMP      R0,#+5
        BEQ.N    ??wright_data_to_cam_1
        CMP      R0,#+12
        BEQ.N    ??wright_data_to_cam_2
        B.N      ??wright_data_to_cam_3
??wright_data_to_cam_0:
        MOVS     R0,R1
        BL       __aeabi_f2iz
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        ORRS     R0,R0,#0xF0000000
        LDR.N    R1,??DataTable11_42
        STR      R0,[R1, #+596]
        B.N      ??wright_data_to_cam_3
??wright_data_to_cam_1:
        MOVS     R0,R1
        BL       __aeabi_f2iz
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        ORRS     R0,R0,#0xF0000000
        LDR.N    R1,??DataTable11_42
        STR      R0,[R1, #+624]
        B.N      ??wright_data_to_cam_3
??wright_data_to_cam_2:
        MOVS     R0,R1
        BL       __aeabi_f2iz
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        ORRS     R0,R0,#0xF0000000
        LDR.N    R1,??DataTable11_42
        STR      R0,[R1, #+652]
??wright_data_to_cam_3:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10:
        DC32     encoder0_func_2enc

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
keys_syncro_func:
        LDR.N    R0,??DataTable11_43
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??keys_syncro_func_0
        LDR.N    R0,??DataTable11_43
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable11_43
        STRH     R0,[R1, #+0]
??keys_syncro_func_0:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11:
        DC32     encoder0_masks_buf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_1:
        DC32     encoder1_func

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_2:
        DC32     encoder1_t_func

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_3:
        DC32     cam_sets

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_4:
        DC32     obj_in_net

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_5:
        DC32     extern_master_find

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_6:
        DC32     uart_obj_buf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_7:
        DC32     cu_get_net_condition

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_8:
        DC32     net_global_count

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_9:
        DC32     net_status

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_10:
        DC32     cu_get_keys

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_11:
        DC32     power_off

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_12:
        DC32     get_encoder_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_13:
        DC32     get_encoder_1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_14:
        DC32     get_gps

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_15:
        DC32     get_compass

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_16:
        DC32     calibrate_compass

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_17:
        DC32     get_compass_status

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_18:
        DC32     get_temperature

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_19:
        DC32     get_pressure

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_20:
        DC32     get_inclinate

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_21:
        DC32     get_declinate

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_22:
        DC32     rf_start_messure

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_23:
        DC32     rf_get_status

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_24:
        DC32     rf_get_distance

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_25:
        DC32     task_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_26:
        DC32     net_status+0x38

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_27:
        DC32     TXbuf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_28:
        DC32     0x40013800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_29:
        DC32     system_wait_timer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_30:
        DC32     net_fault_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_31:
        DC32     ADC_data

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_32:
        DC32     0x401a6666

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_33:
        DC32     0x40b00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_34:
        DC32     0x400a6666

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_35:
        DC32     0x63886595

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_36:
        DC32     0xbffddc5d

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_37:
        DC32     0x3d859c8d

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_38:
        DC32     0x3f87f0ed

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_39:
        DC32     0x4059999a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_40:
        DC32     RXbuf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_41:
        DC32     senspar

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_42:
        DC32     spi_objects

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_43:
        DC32     keys_syncro_count

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        DATA
expossition_value:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
        DATA
expo_timeout:
        DS8 2

        SECTION `.data`:DATA:REORDER:NOROOT(0)
        DATA
led_brightnes:
        DC8 255

        SECTION `.data`:DATA:REORDER:NOROOT(0)
        DATA
eoc_brightnes_value:
        DC8 8

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
keys_analis:
        PUSH     {R3-R5,LR}
        LDR.W    R0,??keys_analis_0
        LDR      R0,[R0, #+8]
        UBFX     R4,R0,#+4,#+4
        LDR.W    R0,??keys_analis_0+0x4
        BL       get_empty
        CMP      R0,#+0
        BNE.W    ??keys_analis_1
        LDR.W    R0,??keys_analis_0+0x8
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_2
        BL       spi_read_camers_state
??keys_analis_2:
        LDR.W    R0,??keys_analis_0+0x4
        BL       get
        MOVS     R5,R0
        LDR.W    R0,??keys_analis_0+0xC
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??keys_analis_3
        LDR.W    R0,??keys_analis_0+0x4
        BL       clean
??keys_analis_3:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,R5
        CMP      R0,#+1
        BEQ.W    ??keys_analis_4
        CMP      R0,#+4
        BEQ.N    ??keys_analis_5
        CMP      R0,#+5
        BEQ.W    ??keys_analis_6
        CMP      R0,#+6
        BEQ.W    ??keys_analis_7
        CMP      R0,#+7
        BEQ.W    ??keys_analis_8
        CMP      R0,#+9
        BEQ.W    ??keys_analis_9
        CMP      R0,#+10
        BEQ.W    ??keys_analis_10
        CMP      R0,#+16
        BEQ.W    ??keys_analis_11
        CMP      R0,#+17
        BEQ.W    ??keys_analis_12
        CMP      R0,#+18
        BEQ.W    ??keys_analis_13
        CMP      R0,#+19
        BEQ.W    ??keys_analis_14
        CMP      R0,#+20
        BEQ.W    ??keys_analis_15
        CMP      R0,#+21
        BEQ.W    ??keys_analis_16
        CMP      R0,#+22
        BEQ.W    ??keys_analis_17
        CMP      R0,#+23
        BEQ.W    ??keys_analis_18
        CMP      R0,#+24
        BEQ.W    ??keys_analis_19
        CMP      R0,#+25
        BEQ.W    ??keys_analis_20
        CMP      R0,#+26
        BEQ.W    ??keys_analis_21
        CMP      R0,#+27
        BEQ.W    ??keys_analis_22
        CMP      R0,#+28
        BEQ.W    ??keys_analis_23
        CMP      R0,#+32
        BEQ.W    ??keys_analis_24
        CMP      R0,#+33
        BEQ.W    ??keys_analis_25
        CMP      R0,#+34
        BEQ.W    ??keys_analis_26
        CMP      R0,#+35
        BEQ.W    ??keys_analis_27
        CMP      R0,#+36
        BEQ.W    ??keys_analis_28
        CMP      R0,#+37
        BEQ.W    ??keys_analis_29
        CMP      R0,#+38
        BEQ.W    ??keys_analis_30
        CMP      R0,#+39
        BEQ.W    ??keys_analis_31
        CMP      R0,#+40
        BEQ.W    ??keys_analis_32
        CMP      R0,#+43
        BEQ.W    ??keys_analis_33
        CMP      R0,#+44
        BEQ.W    ??keys_analis_34
        CMP      R0,#+65
        BEQ.W    ??keys_analis_35
        CMP      R0,#+66
        BEQ.W    ??keys_analis_36
        CMP      R0,#+74
        BEQ.W    ??keys_analis_37
        CMP      R0,#+75
        BEQ.W    ??keys_analis_38
        CMP      R0,#+99
        BEQ.W    ??keys_analis_39
        CMP      R0,#+129
        BEQ.W    ??keys_analis_40
        CMP      R0,#+240
        BEQ.W    ??keys_analis_41
        CMP      R0,#+252
        BEQ.W    ??keys_analis_42
        CMP      R0,#+253
        BEQ.W    ??keys_analis_43
        CMP      R0,#+254
        BEQ.W    ??keys_analis_44
        CMP      R0,#+255
        BEQ.W    ??keys_analis_45
        B.W      ??keys_analis_46
??keys_analis_5:
        MOVW     R0,#+5500
        LDR.W    R1,??keys_analis_47
        LDR.W    R2,??keys_analis_47+0x4
        LDRH     R2,[R2, #+10]
        MOVS     R3,#+12
        MULS     R2,R3,R2
        ADD      R1,R1,R2
        STRH     R0,[R1, #+4]
        LDR.W    R0,??keys_analis_0+0x4
        BL       `pop`
        B.W      ??keys_analis_1
??keys_analis_4:
        LDR.W    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_48
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_48
        LDR.W    R0,??keys_analis_0+0x4
        BL       `pop`
        MOVS     R0,#+3
        LDR.W    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
??keys_analis_48:
        B.W      ??keys_analis_1
??keys_analis_9:
        LDR.W    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_49
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_49
        LDR.W    R0,??keys_analis_0+0x4
        BL       `pop`
        MOVS     R0,#+1
        LDR.W    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
??keys_analis_49:
        B.W      ??keys_analis_1
??keys_analis_10:
        LDR.W    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_50
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_50
        LDR.W    R0,??keys_analis_0+0x4
        BL       `pop`
        MOVS     R0,#+2
        LDR.W    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
??keys_analis_50:
        B.W      ??keys_analis_1
??keys_analis_7:
        LDR.W    R0,??keys_analis_0
        LDRB     R0,[R0, #+8]
        LSLS     R0,R0,#+28
        BPL.N    ??keys_analis_51
        LDR.W    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_8
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_8
        LDR.W    R0,??keys_analis_0+0x4
        BL       `pop`
        MOVS     R0,#+3
        LDR.W    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
        B.N      ??keys_analis_8
??keys_analis_51:
        LDR.W    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_8
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_8
        LDR.W    R0,??keys_analis_0+0x4
        BL       `pop`
        MOVS     R0,#+15
        LDR.W    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
??keys_analis_8:
        LDR.W    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_52
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_52
        LDR.W    R0,??keys_analis_0+0x4
        BL       `pop`
        MOVS     R0,#+12
        LDR.W    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
??keys_analis_52:
        B.W      ??keys_analis_1
??keys_analis_6:
        MOVS     R0,#+12
        LDR.W    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
        B.W      ??keys_analis_1
??keys_analis_22:
        LDR.W    R0,??keys_analis_0
        LDRB     R0,[R0, #+8]
        LSLS     R0,R0,#+28
        BMI.N    ??keys_analis_53
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??keys_analis_53
        LDR.W    R0,??keys_analis_54
        LDRB     R0,[R0, #+16]
        LSLS     R0,R0,#+27
        BMI.N    ??keys_analis_55
??keys_analis_53:
        LDR.W    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_56
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_56
        LDR.W    R0,??keys_analis_0+0x4
        BL       clean
        MOVS     R0,#+1
        LDR.W    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
        B.N      ??keys_analis_56
??keys_analis_55:
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+568]
        CMP      R0,#+0
        BNE.N    ??keys_analis_56
        LDR.W    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+585]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_56
        LDR.W    R0,??keys_analis_57
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2uiz
        MOVS     R4,R0
        MOVS     R0,#+50
        SUBS     R1,R4,R4
        UDIV     R2,R4,R0
        MLA      R0,R0,R2,R1
        ADDS     R4,R0,#+50
        CMP      R4,#+1000
        BLS.N    ??keys_analis_58
        MOV      R4,#+1000
??keys_analis_58:
        MOVS     R0,#+1
        LDR.W    R1,??keys_analis_47+0x8
        STRB     R0,[R1, #+584]
        UXTH     R0,R4            ;; ZeroExt  R0,R4,#+16,#+16
        LDR.W    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+568]
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+568]
        LSLS     R0,R0,#+20
        BNE.N    ??keys_analis_59
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+568]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+568]
??keys_analis_59:
        MOVS     R0,R4
        BL       __aeabi_ui2f
        LDR.W    R1,??keys_analis_57
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??keys_analis_57
        STRB     R0,[R1, #+36]
        LDR.W    R0,??keys_analis_0+0x4
        BL       clean
??keys_analis_56:
        B.W      ??keys_analis_1
??keys_analis_23:
        LDR.W    R0,??keys_analis_0
        LDRB     R0,[R0, #+8]
        LSLS     R0,R0,#+28
        BMI.N    ??keys_analis_60
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??keys_analis_60
        LDR.W    R0,??keys_analis_54
        LDRB     R0,[R0, #+16]
        LSLS     R0,R0,#+27
        BMI.N    ??keys_analis_61
??keys_analis_60:
        LDR.W    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_62
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_62
        LDR.W    R0,??keys_analis_0+0x4
        BL       clean
        MOVS     R0,#+2
        LDR.W    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
        B.N      ??keys_analis_62
??keys_analis_61:
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+568]
        CMP      R0,#+0
        BNE.N    ??keys_analis_62
        LDR.W    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+585]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_62
        LDR.W    R0,??keys_analis_57
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2uiz
        MOVS     R4,R0
        MOVS     R0,#+50
        SUBS     R1,R4,R4
        UDIV     R2,R4,R0
        MLA      R0,R0,R2,R1
        SUBS     R4,R0,#+50
        CMP      R4,#+100
        BCS.N    ??keys_analis_63
        MOVS     R4,#+100
??keys_analis_63:
        MOVS     R0,#+1
        LDR.W    R1,??keys_analis_47+0x8
        STRB     R0,[R1, #+584]
        LDR.W    R0,??keys_analis_57
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2uiz
        LSLS     R0,R0,#+20       ;; ZeroExtS R0,R0,#+20,#+20
        LSRS     R0,R0,#+20
        LDR.W    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+568]
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+568]
        LSLS     R0,R0,#+20
        BNE.N    ??keys_analis_64
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+568]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+568]
??keys_analis_64:
        MOVS     R0,R4
        BL       __aeabi_ui2f
        LDR.W    R1,??keys_analis_57
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??keys_analis_57
        STRB     R0,[R1, #+36]
        LDR.W    R0,??keys_analis_0+0x4
        BL       clean
??keys_analis_62:
        B.W      ??keys_analis_1
??keys_analis_37:
        LDR.W    R0,??keys_analis_0
        LDRB     R0,[R0, #+8]
        LSLS     R0,R0,#+28
        BPL.N    ??keys_analis_65
        LDR.W    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_66
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_66
        LDR.W    R0,??keys_analis_0+0x4
        BL       clean
        MOVS     R0,#+1
        LDR.W    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
        B.N      ??keys_analis_66
??keys_analis_65:
        LDR.W    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_66
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_66
        LDR.W    R0,??keys_analis_0+0x4
        BL       clean
        MOVS     R0,#+8
        LDR.W    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
??keys_analis_66:
        B.W      ??keys_analis_1
??keys_analis_38:
        LDR.W    R0,??keys_analis_0
        LDRB     R0,[R0, #+8]
        LSLS     R0,R0,#+28
        BPL.N    ??keys_analis_67
        LDR.W    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_68
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_68
        LDR.W    R0,??keys_analis_0+0x4
        BL       clean
        MOVS     R0,#+2
        LDR.W    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
        B.N      ??keys_analis_68
??keys_analis_67:
        LDR.W    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_68
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_68
        LDR.W    R0,??keys_analis_0+0x4
        BL       clean
        MOVS     R0,#+9
        LDR.W    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
??keys_analis_68:
        B.W      ??keys_analis_1
??keys_analis_12:
        LDR.W    R0,??keys_analis_0
        LDRB     R0,[R0, #+8]
        LSLS     R0,R0,#+28
        BPL.N    ??keys_analis_69
        LDR.W    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_70
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_70
        LDR.W    R0,??keys_analis_0+0x4
        BL       clean
        MOVS     R0,#+2
        LDR.W    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
        B.N      ??keys_analis_70
??keys_analis_69:
        LDR.W    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_70
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_70
        LDR.W    R0,??keys_analis_0+0x4
        BL       `pop`
        MOVS     R0,#+17
        LDR.W    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
??keys_analis_70:
        B.W      ??keys_analis_1
??keys_analis_13:
        LDR.W    R0,??keys_analis_0
        LDRB     R0,[R0, #+8]
        LSLS     R0,R0,#+28
        BPL.N    ??keys_analis_71
        LDR.W    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_72
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_72
        LDR.W    R0,??keys_analis_0+0x4
        BL       clean
        MOVS     R0,#+1
        LDR.W    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
        B.N      ??keys_analis_72
??keys_analis_71:
        LDR.W    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_72
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_72
        LDR.W    R0,??keys_analis_0+0x4
        BL       `pop`
        MOVS     R0,#+18
        LDR.W    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
??keys_analis_72:
        B.W      ??keys_analis_1
??keys_analis_21:
        LDR.W    R0,??keys_analis_0
        LDRB     R0,[R0, #+8]
        LSLS     R0,R0,#+28
        BPL.N    ??keys_analis_73
        LDR.W    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_74
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_74
        LDR.W    R0,??keys_analis_0+0x4
        BL       clean
        MOVS     R0,#+2
        LDR.W    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
        B.N      ??keys_analis_74
??keys_analis_73:
        LDR.W    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_74
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_74
        LDR.W    R0,??keys_analis_0+0x4
        BL       `pop`
        MOVS     R0,#+26
        LDR.W    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
??keys_analis_74:
        B.W      ??keys_analis_1
??keys_analis_20:
        LDR.W    R0,??keys_analis_0
        LDRB     R0,[R0, #+8]
        LSLS     R0,R0,#+28
        BPL.N    ??keys_analis_75
        LDR.W    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_76
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_76
        LDR.W    R0,??keys_analis_0+0x4
        BL       clean
        MOVS     R0,#+1
        LDR.W    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
        B.N      ??keys_analis_76
??keys_analis_75:
        LDR.W    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_76
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_76
        LDR.W    R0,??keys_analis_0+0x4
        BL       `pop`
        MOVS     R0,#+25
        LDR.W    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
??keys_analis_76:
        B.W      ??keys_analis_1
??keys_analis_36:
        LDR.W    R0,??keys_analis_0
        LDRB     R0,[R0, #+8]
        LSLS     R0,R0,#+28
        BPL.N    ??keys_analis_77
        LDR.W    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_78
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_78
        LDR.W    R0,??keys_analis_0+0x4
        BL       clean
        MOVS     R0,#+2
        LDR.W    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
        B.N      ??keys_analis_78
??keys_analis_77:
        LDR.W    R0,??DataTable12
        LDRSB    R0,[R0, #+0]
        CMN      R0,#+14
        BLT.N    ??keys_analis_79
        LDR.W    R0,??DataTable12_1
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??keys_analis_79
        LDR.W    R0,??DataTable12
        LDRB     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable12
        STRB     R0,[R1, #+0]
        LDR.W    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_80
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_80
        LDR.W    R0,??keys_analis_0+0x4
        BL       clean
        LDR.W    R0,??DataTable12
        LDRB     R0,[R0, #+0]
        AND      R0,R0,#0xFF
        ORRS     R0,R0,#0x430000
        LDR.W    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
??keys_analis_80:
        MOV      R0,#+300
        LDR.W    R1,??DataTable12_1
        STRH     R0,[R1, #+0]
        B.N      ??keys_analis_78
??keys_analis_79:
        LDR.W    R0,??keys_analis_0+0x4
        BL       clean
??keys_analis_78:
        B.W      ??keys_analis_1
??keys_analis_35:
        LDR.W    R0,??keys_analis_0
        LDRB     R0,[R0, #+8]
        LSLS     R0,R0,#+28
        BPL.N    ??keys_analis_81
        LDR.W    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_82
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_82
        LDR.W    R0,??keys_analis_0+0x4
        BL       clean
        MOVS     R0,#+2
        LDR.W    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
        B.N      ??keys_analis_82
??keys_analis_81:
        LDR.W    R0,??DataTable12
        LDRSB    R0,[R0, #+0]
        CMP      R0,#+15
        BGE.N    ??keys_analis_83
        LDR.W    R0,??DataTable12_1
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??keys_analis_83
        LDR.W    R0,??DataTable12
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable12
        STRB     R0,[R1, #+0]
        LDR.W    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_84
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_84
        LDR.W    R0,??keys_analis_0+0x4
        BL       clean
        LDR.W    R0,??DataTable12
        LDRSB    R0,[R0, #+0]
        ORRS     R0,R0,#0x430000
        LDR.W    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
??keys_analis_84:
        MOV      R0,#+300
        LDR.W    R1,??DataTable12_1
        STRH     R0,[R1, #+0]
        B.N      ??keys_analis_82
??keys_analis_83:
        LDR.W    R0,??keys_analis_0+0x4
        BL       clean
??keys_analis_82:
        B.N      ??keys_analis_1
??keys_analis_14:
        LDR.W    R0,??keys_analis_0
        LDRB     R0,[R0, #+8]
        LSLS     R0,R0,#+28
        BPL.N    ??keys_analis_85
        LDR.W    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_86
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_86
        LDR.W    R0,??keys_analis_0+0x4
        BL       clean
        MOVS     R0,#+2
        LDR.W    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
        B.N      ??keys_analis_86
??keys_analis_85:
        LDR.W    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_86
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_86
        LDR.W    R0,??keys_analis_0+0x4
        BL       `pop`
        MOVS     R0,#+19
        LDR.W    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
??keys_analis_86:
        B.N      ??keys_analis_1
??keys_analis_15:
        LDR.W    R0,??keys_analis_0
        LDRB     R0,[R0, #+8]
        LSLS     R0,R0,#+28
        BPL.N    ??keys_analis_87
        LDR.W    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_88
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_88
        LDR.W    R0,??keys_analis_0+0x4
        BL       clean
        MOVS     R0,#+1
        LDR.W    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
        B.N      ??keys_analis_88
??keys_analis_87:
        LDR.W    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_88
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_88
        LDR.W    R0,??keys_analis_0+0x4
        BL       `pop`
        MOVS     R0,#+20
        LDR.W    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
??keys_analis_88:
        B.N      ??keys_analis_1
??keys_analis_16:
        LDR.W    R0,??keys_analis_0
        LDRB     R0,[R0, #+8]
        LSLS     R0,R0,#+28
        BPL.N    ??keys_analis_89
        LDR.W    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_90
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_90
        LDR.W    R0,??keys_analis_0+0x4
        BL       clean
        MOVS     R0,#+2
        LDR.W    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
        B.N      ??keys_analis_90
??keys_analis_89:
        LDR.W    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_90
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_90
        LDR.W    R0,??keys_analis_0+0x4
        BL       `pop`
        MOVS     R0,#+21
        LDR.W    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
??keys_analis_90:
        B.N      ??keys_analis_1
??keys_analis_17:
        LDR.W    R0,??keys_analis_0
        LDRB     R0,[R0, #+8]
        LSLS     R0,R0,#+28
        BPL.N    ??keys_analis_91
        LDR.W    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_92
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_92
        LDR.W    R0,??keys_analis_0+0x4
        BL       clean
        MOVS     R0,#+1
        LDR.W    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
        B.N      ??keys_analis_92
??keys_analis_91:
        LDR.W    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_92
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_92
        LDR.W    R0,??keys_analis_0+0x4
        BL       `pop`
        MOVS     R0,#+22
        LDR.W    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
??keys_analis_92:
        B.N      ??keys_analis_1
??keys_analis_18:
        LDR.W    R0,??keys_analis_0
        LDRB     R0,[R0, #+8]
        LSLS     R0,R0,#+28
        BPL.N    ??keys_analis_93
        LDR.W    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_94
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_94
        LDR.W    R0,??keys_analis_0+0x4
        BL       clean
        MOVS     R0,#+1
        LDR.W    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
        B.N      ??keys_analis_94
??keys_analis_93:
        LDR.W    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_94
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_94
        LDR.W    R0,??keys_analis_0+0x4
        BL       `pop`
        MOVS     R0,#+23
        LDR.W    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
??keys_analis_94:
        B.N      ??keys_analis_1
??keys_analis_19:
        LDR.W    R0,??keys_analis_0
        LDRB     R0,[R0, #+8]
        LSLS     R0,R0,#+28
        BPL.N    ??keys_analis_95
        LDR.W    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_96
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_96
        LDR.W    R0,??keys_analis_0+0x4
        BL       clean
        MOVS     R0,#+2
        LDR.W    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
        B.N      ??keys_analis_96
??keys_analis_95:
        LDR.W    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_96
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_96
        LDR.W    R0,??keys_analis_0+0x4
        BL       `pop`
        MOVS     R0,#+24
        LDR.W    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
??keys_analis_96:
        B.N      ??keys_analis_1
??keys_analis_24:
        LDR.W    R0,??keys_analis_0
        LDRB     R0,[R0, #+8]
        LSLS     R0,R0,#+28
        BMI.N    ??keys_analis_97
        LDR.W    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_98
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_98
        LDR.W    R0,??keys_analis_0+0x4
        BL       `pop`
        MOVS     R0,#+32
        LDR.W    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
??keys_analis_98:
        MOVS     R0,#+32
        LDR.N    R1,??keys_analis_0
        STRB     R0,[R1, #+12]
        B.N      ??keys_analis_99
??keys_analis_97:
        LDR.N    R0,??keys_analis_0+0x4
        BL       `pop`
??keys_analis_99:
        B.N      ??keys_analis_1
??keys_analis_31:
        LDR.N    R0,??keys_analis_0
        LDRB     R0,[R0, #+8]
        LSLS     R0,R0,#+28
        BPL.N    ??keys_analis_100
        LDR.W    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_101
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_101
        LDR.N    R0,??keys_analis_0+0x4
        BL       `pop`
        MOVS     R0,#+3
        LDR.W    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
        B.N      ??keys_analis_101
??keys_analis_100:
        LDR.W    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_102
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_102
        LDR.N    R0,??keys_analis_0+0x4
        BL       `pop`
        MOVS     R0,#+39
        LDR.W    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
??keys_analis_102:
        MOVS     R0,#+39
        LDR.N    R1,??keys_analis_0
        STRB     R0,[R1, #+12]
??keys_analis_101:
        B.N      ??keys_analis_1
??keys_analis_30:
        LDR.N    R0,??keys_analis_0
        LDRB     R0,[R0, #+8]
        LSLS     R0,R0,#+28
        BPL.N    ??keys_analis_103
        LDR.W    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_104
        LDR.W    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_104
        LDR.N    R0,??keys_analis_0+0x4
        BL       `pop`
        MOVS     R0,#+3
        LDR.N    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
        B.N      ??keys_analis_104
??keys_analis_103:
        LDR.N    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_105
        LDR.N    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_105
        LDR.N    R0,??keys_analis_0+0x4
        BL       `pop`
        MOVS     R0,#+38
        LDR.N    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
??keys_analis_105:
        MOVS     R0,#+38
        LDR.N    R1,??keys_analis_0
        STRB     R0,[R1, #+12]
??keys_analis_104:
        B.N      ??keys_analis_1
??keys_analis_32:
        LDR.N    R0,??keys_analis_0
        LDRB     R0,[R0, #+8]
        LSLS     R0,R0,#+28
        BPL.N    ??keys_analis_106
        LDR.N    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_107
        LDR.N    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_107
        LDR.N    R0,??keys_analis_0+0x4
        BL       `pop`
        MOVS     R0,#+3
        LDR.N    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
        B.N      ??keys_analis_107
??keys_analis_106:
        LDR.N    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_108
        LDR.N    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_108
        LDR.N    R0,??keys_analis_0+0x4
        BL       `pop`
        MOVS     R0,#+40
        LDR.N    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
??keys_analis_108:
        MOVS     R0,#+40
        LDR.N    R1,??keys_analis_0
        STRB     R0,[R1, #+12]
??keys_analis_107:
        B.N      ??keys_analis_1
??keys_analis_25:
        LDR.N    R0,??keys_analis_0
        LDRB     R0,[R0, #+8]
        LSLS     R0,R0,#+28
        BPL.N    ??keys_analis_109
        LDR.N    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_110
        LDR.N    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_110
        LDR.N    R0,??keys_analis_0+0x4
        BL       `pop`
        MOVS     R0,#+3
        LDR.N    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
        B.N      ??keys_analis_110
??keys_analis_109:
        LDR.N    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_111
        LDR.N    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_111
        LDR.N    R0,??keys_analis_0+0x4
        BL       `pop`
        MOVS     R0,#+33
        LDR.N    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
??keys_analis_111:
        MOVS     R0,#+33
        LDR.N    R1,??keys_analis_0
        STRB     R0,[R1, #+12]
??keys_analis_110:
        B.N      ??keys_analis_1
??keys_analis_26:
        LDR.N    R0,??keys_analis_0
        LDRB     R0,[R0, #+8]
        LSLS     R0,R0,#+28
        BPL.N    ??keys_analis_112
        LDR.N    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_113
        LDR.N    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_113
        LDR.N    R0,??keys_analis_0+0x4
        BL       `pop`
        MOVS     R0,#+3
        LDR.N    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
        B.N      ??keys_analis_113
??keys_analis_112:
        LDR.N    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_114
        LDR.N    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_114
        LDR.N    R0,??keys_analis_0+0x4
        BL       `pop`
        MOVS     R0,#+34
        LDR.N    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
??keys_analis_114:
        MOVS     R0,#+34
        LDR.N    R1,??keys_analis_0
        STRB     R0,[R1, #+12]
??keys_analis_113:
        B.N      ??keys_analis_1
??keys_analis_27:
        LDR.N    R0,??keys_analis_0
        LDRB     R0,[R0, #+8]
        LSLS     R0,R0,#+28
        BPL.N    ??keys_analis_115
        LDR.N    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_116
        LDR.N    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_116
        LDR.N    R0,??keys_analis_0+0x4
        BL       `pop`
        MOVS     R0,#+3
        LDR.N    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
        B.N      ??keys_analis_116
??keys_analis_115:
        LDR.N    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_117
        LDR.N    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_117
        LDR.N    R0,??keys_analis_0+0x4
        BL       `pop`
        MOVS     R0,#+35
        LDR.N    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
??keys_analis_117:
        MOVS     R0,#+35
        LDR.N    R1,??keys_analis_0
        STRB     R0,[R1, #+12]
??keys_analis_116:
        B.N      ??keys_analis_1
??keys_analis_28:
        LDR.N    R0,??keys_analis_0
        LDRB     R0,[R0, #+8]
        LSLS     R0,R0,#+28
        BPL.N    ??keys_analis_118
        LDR.N    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_119
        LDR.N    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_119
        LDR.N    R0,??keys_analis_0+0x4
        BL       `pop`
        MOVS     R0,#+3
        LDR.N    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
        B.N      ??keys_analis_119
??keys_analis_118:
        LDR.N    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_120
        LDR.N    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_120
        LDR.N    R0,??keys_analis_0+0x4
        BL       `pop`
        MOVS     R0,#+36
        LDR.N    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
??keys_analis_120:
        MOVS     R0,#+36
        LDR.N    R1,??keys_analis_0
        STRB     R0,[R1, #+12]
??keys_analis_119:
        B.N      ??keys_analis_1
??keys_analis_29:
        LDR.N    R0,??keys_analis_0
        LDRB     R0,[R0, #+8]
        LSLS     R0,R0,#+28
        BPL.N    ??keys_analis_121
        LDR.N    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_122
        LDR.N    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_122
        LDR.N    R0,??keys_analis_0+0x4
        BL       `pop`
        MOVS     R0,#+3
        LDR.N    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
        B.N      ??keys_analis_122
??keys_analis_121:
        LDR.N    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_123
        LDR.N    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_123
        LDR.N    R0,??keys_analis_0+0x4
        BL       `pop`
        MOVS     R0,#+37
        LDR.N    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
??keys_analis_123:
        MOVS     R0,#+37
        LDR.N    R1,??keys_analis_0
        STRB     R0,[R1, #+12]
??keys_analis_122:
        B.N      ??keys_analis_1
        DATA
??keys_analis_0:
        DC32     spi_sets
        DC32     keys+0x64
        DC32     cam_power_state
        DC32     error_counter
        THUMB
??keys_analis_40:
        LDR.N    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_124
        LDR.N    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_124
        LDR.N    R0,??DataTable12_2
        BL       `pop`
        MOVS     R0,#+7
        LDR.N    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
??keys_analis_124:
        B.N      ??keys_analis_1
??keys_analis_41:
        LDR.N    R0,??DataTable12_3
        LDRB     R0,[R0, #+8]
        LSLS     R0,R0,#+28
        BPL.N    ??keys_analis_125
        LDR.N    R0,??keys_analis_47+0x8
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_126
        LDR.N    R0,??keys_analis_47+0x8
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_126
        LDR.N    R0,??DataTable12_2
        BL       `pop`
        MOVS     R0,#+7
        LDR.N    R1,??keys_analis_47+0x8
        STR      R0,[R1, #+848]
        B.N      ??keys_analis_126
??keys_analis_125:
        LDR.N    R0,??DataTable12_2
        BL       clean
        LDR.N    R0,??DataTable12_4
        LDRB     R0,[R0, #+2]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_126
        MOVS     R0,#+150
        LDR.N    R1,??keys_analis_47
        LDR.N    R2,??DataTable12_5
        LDRH     R2,[R2, #+10]
        MOVS     R3,#+12
        MULS     R2,R3,R2
        ADD      R1,R1,R2
        STRH     R0,[R1, #+4]
        MOVS     R0,#+0
        LDR.N    R1,??keys_analis_47
        LDR.N    R2,??DataTable12_5
        LDRH     R2,[R2, #+10]
        MOVS     R3,#+12
        MULS     R2,R3,R2
        ADD      R1,R1,R2
        STRB     R0,[R1, #+8]
??keys_analis_126:
        B.N      ??keys_analis_1
        DATA
??keys_analis_47:
        DC32     uart_obj_buf
        DC32     rf_start_messure
        DC32     spi_objects
        THUMB
??keys_analis_11:
        LDR.N    R0,??DataTable12_6
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_127
        LDR.N    R0,??DataTable12_6
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_127
        LDR.N    R0,??DataTable12_2
        BL       `pop`
        MOVS     R0,#+16
        LDR.N    R1,??DataTable12_6
        STR      R0,[R1, #+848]
??keys_analis_127:
        B.N      ??keys_analis_1
??keys_analis_33:
        LDR.N    R0,??DataTable12_6
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_128
        LDR.N    R0,??DataTable12_6
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_128
        LDR.N    R0,??DataTable12_2
        BL       `pop`
        MOVS     R0,#+43
        LDR.N    R1,??DataTable12_6
        STR      R0,[R1, #+848]
??keys_analis_128:
        B.N      ??keys_analis_1
??keys_analis_42:
        MOVS     R0,#+0
        LDR.N    R1,??keys_analis_57
        STRB     R0,[R1, #+38]
        LDR.N    R0,??DataTable12_2
        BL       clean
        LDR.N    R0,??keys_analis_57
        LDR      R0,[R0, #+4]
        LDR.N    R1,??DataTable12_7  ;; 0x42480000
        BL       __aeabi_cfcmple
        BCS.N    ??keys_analis_129
        LDR.N    R0,??keys_analis_57
        LDR      R1,[R0, #+4]
        MOVS     R0,#+1065353216
        BL       __aeabi_fadd
        LDR.N    R1,??keys_analis_57
        STR      R0,[R1, #+4]
        LDR.N    R0,??keys_analis_57
        LDR      R1,[R0, #+4]
        MOVS     R0,#+4
        BL       wright_data_to_cam
??keys_analis_129:
        B.N      ??keys_analis_1
??keys_analis_43:
        MOVS     R0,#+0
        LDR.N    R1,??keys_analis_57
        STRB     R0,[R1, #+38]
        LDR.N    R0,??DataTable12_2
        BL       clean
        LDR.N    R0,??keys_analis_57
        LDR      R0,[R0, #+4]
        LDR.N    R1,??DataTable12_8  ;; 0xc247ffff
        BL       __aeabi_cfrcmple
        BHI.N    ??keys_analis_130
        LDR.N    R0,??keys_analis_57
        LDR      R1,[R0, #+4]
        LDR.N    R0,??DataTable12_9  ;; 0xbf800000
        BL       __aeabi_fadd
        LDR.N    R1,??keys_analis_57
        STR      R0,[R1, #+4]
        LDR.N    R0,??keys_analis_57
        LDR      R1,[R0, #+4]
        MOVS     R0,#+4
        BL       wright_data_to_cam
??keys_analis_130:
        B.N      ??keys_analis_1
??keys_analis_34:
        LDR.N    R0,??DataTable12_6
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_131
        LDR.N    R0,??DataTable12_6
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_131
        LDR.N    R0,??DataTable12_2
        BL       `pop`
        MOVS     R0,#+44
        LDR.N    R1,??DataTable12_6
        STR      R0,[R1, #+848]
??keys_analis_131:
        B.N      ??keys_analis_1
??keys_analis_44:
        MOVS     R0,#+0
        LDR.N    R1,??keys_analis_57
        STRB     R0,[R1, #+39]
        LDR.N    R0,??DataTable12_2
        BL       clean
        LDR.N    R0,??keys_analis_57
        LDR      R0,[R0, #+8]
        LDR.N    R1,??DataTable12_10  ;; 0x44778000
        BL       __aeabi_cfcmple
        BCS.N    ??keys_analis_132
        LDR.N    R0,??keys_analis_57
        LDR      R0,[R0, #+8]
        BL       __aeabi_f2iz
        MOVS     R1,#+10
        ADDS     R2,R0,#+10
        SUBS     R2,R2,R0
        SDIV     R0,R0,R1
        MLA      R0,R1,R0,R2
        BL       __aeabi_i2f
        LDR.N    R1,??keys_analis_57
        STR      R0,[R1, #+8]
        LDR.N    R0,??keys_analis_57
        LDR      R1,[R0, #+8]
        MOVS     R0,#+5
        BL       wright_data_to_cam
??keys_analis_132:
        B.N      ??keys_analis_1
??keys_analis_45:
        LDR.N    R0,??DataTable12_2
        BL       clean
        MOVS     R0,#+0
        LDR.N    R1,??keys_analis_57
        STRB     R0,[R1, #+39]
        LDR.N    R0,??keys_analis_57
        LDR      R0,[R0, #+8]
        LDR.N    R1,??DataTable12_11  ;; 0x43480001
        BL       __aeabi_cfrcmple
        BHI.N    ??keys_analis_133
        LDR.N    R0,??keys_analis_57
        LDR      R0,[R0, #+8]
        BL       __aeabi_f2iz
        MOVS     R1,#+10
        SUBS     R2,R0,#+10
        SUBS     R2,R2,R0
        SDIV     R0,R0,R1
        MLA      R0,R1,R0,R2
        BL       __aeabi_i2f
        LDR.N    R1,??keys_analis_57
        STR      R0,[R1, #+8]
        LDR.N    R0,??keys_analis_57
        LDR      R1,[R0, #+8]
        MOVS     R0,#+5
        BL       wright_data_to_cam
??keys_analis_133:
        B.N      ??keys_analis_1
??keys_analis_39:
        LDR.N    R0,??DataTable12_2
        BL       clean
        B.N      ??keys_analis_1
        Nop      
        DATA
??keys_analis_54:
        DC32     flash
        THUMB
??keys_analis_46:
        LDR.N    R0,??DataTable12_3
        LDRB     R0,[R0, #+8]
        LSLS     R0,R0,#+28
        BPL.N    ??keys_analis_134
        LDR.N    R0,??DataTable12_6
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_135
        LDR.N    R0,??DataTable12_6
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_135
        LDR.N    R0,??DataTable12_2
        BL       `pop`
        MOVS     R0,#+3
        LDR.N    R1,??DataTable12_6
        STR      R0,[R1, #+848]
        B.N      ??keys_analis_135
??keys_analis_134:
        LDR.N    R0,??DataTable12_6
        LDRB     R0,[R0, #+865]
        CMP      R0,#+0
        BEQ.N    ??keys_analis_136
        LDR.N    R0,??DataTable12_6
        LDR      R0,[R0, #+848]
        CMP      R0,#+0
        BNE.N    ??keys_analis_136
        LDR.N    R0,??DataTable12_2
        BL       `pop`
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.N    R0,??DataTable12_6
        STR      R5,[R0, #+848]
??keys_analis_136:
        LDR.N    R0,??DataTable12_3
        STRB     R5,[R0, #+12]
??keys_analis_135:
??keys_analis_1:
        POP      {R0,R4,R5,PC}    ;; return
        DATA
??keys_analis_57:
        DC32     senspar

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12:
        DC32     expossition_value

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_1:
        DC32     expo_timeout

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_2:
        DC32     keys+0x64

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_3:
        DC32     spi_sets

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_4:
        DC32     net_sets

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_5:
        DC32     power_off

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_6:
        DC32     spi_objects

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_7:
        DC32     0x42480000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_8:
        DC32     0xc247ffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_9:
        DC32     0xbf800000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_10:
        DC32     0x44778000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_11:
        DC32     0x43480001

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
keys_analis_P_O:
        BX       LR               ;; return

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
//   492 bytes in section .bss
//     2 bytes in section .data
// 7 612 bytes in section .text
// 
// 7 612 bytes of CODE memory
//   494 bytes of DATA memory
//
//Errors: none
//Warnings: 4
