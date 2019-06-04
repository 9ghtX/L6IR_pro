///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.70.1.11437/W32 for ARM      18/Apr/2019  18:40:38
// Copyright 1999-2016 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\projects\L6IR\programm\L6_pro\Sensors.c
//    Command line =  
//        E:\projects\L6IR\programm\L6_pro\Sensors.c -D USE_STDPERIPH_DRIVER -D
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
//    List file    =  E:\projects\L6IR\programm\L6_pro\Release\List\Sensors.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN LSM6DS33_out_data
        EXTERN LSM6DS33_tasks
        EXTERN __aeabi_d2f
        EXTERN __aeabi_dmul
        EXTERN __aeabi_f2d
        EXTERN __aeabi_fdiv
        EXTERN __aeabi_i2f
        EXTERN atan
        EXTERN senspar
        EXTERN wright_data_to_cam

        PUBLIC angles_calculate
        PUBLIC axis_point
        PUBLIC axis_quant
        PUBLIC i2c_sensors_tasks
        PUBLIC sens_synchro_func
        PUBLIC turning_off_indicate
        PUBLIC xbuf
        PUBLIC ybuf
        PUBLIC zbuf


        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
sens_synchro_time:
        DS8 8

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
sens_synchro_func:
        LDR.N    R0,??DataTable3
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable3
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable3
        LDR      R0,[R0, #+4]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable3
        STR      R0,[R1, #+4]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
i2c_sensors_tasks:
        PUSH     {R7,LR}
        LDR.N    R0,??DataTable3
        LDR      R0,[R0, #+4]
        CMP      R0,#+0
        BPL.N    ??i2c_sensors_tasks_0
        BL       LSM6DS33_tasks
        MOVS     R0,#+100
        LDR.N    R1,??DataTable3
        STR      R0,[R1, #+4]
        LDR.N    R0,??DataTable3_1
        LDRB     R0,[R0, #+4]
        CMP      R0,#+0
        BEQ.N    ??i2c_sensors_tasks_1
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_1
        STRB     R0,[R1, #+4]
??i2c_sensors_tasks_1:
        LDR.N    R0,??DataTable3_1
        LDRB     R0,[R0, #+12]
        CMP      R0,#+0
        BEQ.N    ??i2c_sensors_tasks_0
        BL       angles_calculate
        BL       turning_off_indicate
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_1
        STRB     R0,[R1, #+12]
??i2c_sensors_tasks_0:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
angles_calculate:
        PUSH     {R4-R6,LR}
        LDR.N    R0,??DataTable3_1
        LDRSH    R0,[R0, #+6]
        BL       __aeabi_i2f
        MOVS     R5,R0
        LDR.N    R0,??DataTable3_1
        LDRSH    R0,[R0, #+8]
        BL       __aeabi_i2f
        MOVS     R4,R0
        LDR.N    R0,??DataTable3_1
        LDRSH    R0,[R0, #+10]
        BL       __aeabi_i2f
        MOVS     R6,R0
        MOVS     R0,R5
        MOVS     R1,R4
        BL       __aeabi_fdiv
        BL       __aeabi_f2d
        BL       atan
        LDR.N    R2,??DataTable3_2  ;; 0x1a5d2372
        LDR.N    R3,??DataTable3_3  ;; 0xc04ca5dc
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        LDR.N    R1,??DataTable3_4
        STR      R0,[R1, #+28]
        MOVS     R0,R6
        MOVS     R1,R4
        BL       __aeabi_fdiv
        BL       __aeabi_f2d
        BL       atan
        LDR.N    R2,??DataTable3_2  ;; 0x1a5d2372
        LDR.N    R3,??DataTable3_3  ;; 0xc04ca5dc
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        LDR.N    R1,??DataTable3_4
        STR      R0,[R1, #+20]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_4
        STRB     R0,[R1, #+36]
        LDR.N    R0,??DataTable3_4
        LDR      R1,[R0, #+20]
        MOVS     R0,#+12
        BL       wright_data_to_cam
        POP      {R4-R6,PC}       ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
xbuf:
        DS8 80

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
ybuf:
        DS8 80

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
zbuf:
        DS8 80

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
        DATA
axis_quant:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
        DATA
axis_point:
        DS8 2

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
turning_off_indicate:
        PUSH     {R4,R5}
        MOVS     R0,#+0
        MOVS     R1,#+0
        MOVS     R2,#+0
        LDR.N    R3,??DataTable3_1
        LDRSH    R3,[R3, #+6]
        LDR.N    R4,??DataTable3_5
        LDR.N    R5,??DataTable3_6
        LDRH     R5,[R5, #+0]
        STR      R3,[R4, R5, LSL #+2]
        LDR.N    R3,??DataTable3_1
        LDRSH    R3,[R3, #+8]
        LDR.N    R4,??DataTable3_7
        LDR.N    R5,??DataTable3_6
        LDRH     R5,[R5, #+0]
        STR      R3,[R4, R5, LSL #+2]
        LDR.N    R3,??DataTable3_1
        LDRSH    R3,[R3, #+10]
        LDR.N    R4,??DataTable3_8
        LDR.N    R5,??DataTable3_6
        LDRH     R5,[R5, #+0]
        STR      R3,[R4, R5, LSL #+2]
        LDR.N    R3,??DataTable3_9
        LDRH     R3,[R3, #+0]
        CMP      R3,#+20
        BGE.N    ??turning_off_indicate_0
        LDR.N    R3,??DataTable3_9
        LDRH     R3,[R3, #+0]
        ADDS     R3,R3,#+1
        LDR.N    R4,??DataTable3_9
        STRH     R3,[R4, #+0]
??turning_off_indicate_0:
        LDR.N    R3,??DataTable3_6
        LDRH     R3,[R3, #+0]
        ADDS     R3,R3,#+1
        LDR.N    R4,??DataTable3_6
        STRH     R3,[R4, #+0]
        LDR.N    R3,??DataTable3_6
        LDRH     R3,[R3, #+0]
        CMP      R3,#+20
        BLT.N    ??turning_off_indicate_1
        MOVS     R3,#+0
        LDR.N    R4,??DataTable3_6
        STRH     R3,[R4, #+0]
??turning_off_indicate_1:
        MOVS     R3,#+0
        B.N      ??turning_off_indicate_2
??turning_off_indicate_3:
        LDR.N    R4,??DataTable3_5
        LDR      R4,[R4, R3, LSL #+2]
        ADDS     R0,R4,R0
        LDR.N    R4,??DataTable3_7
        LDR      R4,[R4, R3, LSL #+2]
        ADDS     R1,R4,R1
        LDR.N    R4,??DataTable3_8
        LDR      R4,[R4, R3, LSL #+2]
        ADDS     R2,R4,R2
        ADDS     R3,R3,#+1
??turning_off_indicate_2:
        LDR.N    R4,??DataTable3_9
        LDRH     R4,[R4, #+0]
        CMP      R3,R4
        BLT.N    ??turning_off_indicate_3
        LDR.N    R3,??DataTable3_9
        LDRH     R3,[R3, #+0]
        SDIV     R0,R0,R3
        LDR.N    R3,??DataTable3_9
        LDRH     R3,[R3, #+0]
        SDIV     R1,R1,R3
        LDR.N    R3,??DataTable3_9
        LDRH     R3,[R3, #+0]
        SDIV     R2,R2,R3
        ADDW     R0,R0,#+299
        MOVW     R3,#+599
        CMP      R0,R3
        BCS.N    ??turning_off_indicate_4
        ADDW     R0,R2,#+299
        MOVW     R2,#+599
        CMP      R0,R2
        BCS.N    ??turning_off_indicate_4
        CMN      R1,#+16000
        BGE.N    ??turning_off_indicate_5
        LDR.N    R0,??DataTable3_1
        LDRB     R0,[R0, #+13]
        CMP      R0,#+0
        BEQ.N    ??turning_off_indicate_5
        MOVS     R0,#+0
        LDR.N    R2,??DataTable3_1
        STRB     R0,[R2, #+13]
??turning_off_indicate_5:
        CMP      R1,#+16000
        BLE.N    ??turning_off_indicate_4
        LDR.N    R0,??DataTable3_1
        LDRB     R0,[R0, #+13]
        CMP      R0,#+0
        BNE.N    ??turning_off_indicate_4
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_1
        STRB     R0,[R1, #+13]
??turning_off_indicate_4:
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     sens_synchro_time

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     LSM6DS33_out_data

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     0x1a5d2372

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     0xc04ca5dc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     senspar

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     xbuf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     axis_point

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_7:
        DC32     ybuf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_8:
        DC32     zbuf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_9:
        DC32     axis_quant

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
// 252 bytes in section .bss
// 470 bytes in section .text
// 
// 470 bytes of CODE memory
// 252 bytes of DATA memory
//
//Errors: none
//Warnings: none
