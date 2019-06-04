#ifndef NET_H_
#define NET_H_

#include "hal_types.h"
#ifdef L6IR_CU
#include "stm32l1xx.h"
#endif
#include "protocol.h"
#include "buffer.h"

/*################################
Список сетевых событий
#################################*/
#define SYSTEM_INIT_WAIT       0x00
#define CU_GET_KEYS            0x01
#define GET_GPS                0x02
#define METEO_GET_TEMP         0x03
#define METEO_GET_PRESS        0x04
#define METEO_GET_INCLINATE    0x05
#define METEO_GET_DECLINATE    0x06
#define METEO_GET_GYRO         0x07

#define GET_COMPASS            0x08
#define COMPASS_CALIBRATE      0x09
#define GET_COMPASS_STATUS     0x0a

#define RF_START_MESSURE       0x0b
#define RF_GET_STATUS          0x0c
#define RF_GET_DISTANCE        0x0e

#define RADIO_GET_MESSAGE      0x0f
#define RADIO_GIVE_MESSAGE     0x10
#define RADIO_GET_STATUS       0x11

#define POWER_OFF_COM          0x12

#define ENCODER0_GET_KEYS      0x13
#define ENCODER1_GET_KEYS      0x14

#define EXTERN_MASTER_FIND     0x15
#define CU_GET_NET_CONDIT      0x16
/*
Времена синхронизации сетевых событий
*/
#define CU_GET_KEYS_TIMER            100
#define GET_GPS_TIMER                1000
#define GET_TEMPERATURE_TIMER        1000
#define GET_PRESSURE_TIMER           1000
#define GET_COMPASS_TIMER            500
#define GET_INCLINE_TIMER            1000
#define GET_HUMIDITY_TYMER           1000
#define COMPASS_CALIBRATE_TIMER      5300
#define GET_COMPASS_STATUS_TIMER     500
#define GET_RF_STATUS_TIMER          500
#define GET_INCLINATE_TIMER          100
#define GET_DECLINATE_TIMER          100

#define RF_START_MESSURE_TIMER       5500
#define RF_GET_DISTANCE_TIMER        5600
#define SYSTEM_INIT_WAIT_TIMER       5000
#define POWER_OFF_TIMER              150
#define EXT_MASTER_DELAY             5200
#define CU_GET_CONDIT_TIMER          5300



#define LD_START_MESURE              0x03
#define LD_GET_MESURE_RES            0x04

#define BD115200                     0x10

#define UART_OBJ_Q                   15

#define MASK_OFF         0x00
#define MASK_ON          0xFF
#define ERROR_WAITING_TIME  300
//#########
typedef enum
{
 SYNCHRO     = 0,
 ASYNCHRO    = 1,
 LONGSYNCHRO = 2
} synchronical;



//########
typedef struct
{
 u8 task_id;
 u8 dev_addr;
 u8 command;
 u16 counter;
 u16 delay;
 synchronical synchro;
 u16 obj_net_number;
} uart_obj;

//#########
typedef enum
{
 NET_MASTER =0,
 NET_SLAVE  =1
}net_priority;
/*
//#########
typedef enum
{

}
*/
//#########
typedef struct
{
 u8 adress;
 void (*encoder_func)(u8);
 u16 functions;
}encoder;


//#########
/*
typedef struct
{
 bool enable;
 synchronical synchro;
}
*/
//##########
typedef struct
{
 u8 boudrate;
 net_priority net_pr;
 bool net_control_unit1;
 bool net_control_unit2;
 bool net_external_slave;
 bool net_external_master;
 bool net_navigator;
 bool net_meteo;
 bool net_range_finder;
 bool net_ext_communication;
 bool net_encoder_0;
 bool net_encoder_1;
 bool net_encoder_2;
 bool net_encoder_3;
 bool net_encoder_4;
 bool net_encoder_5;
 bool net_encoder_6;
 bool net_encoder_7;
 bool net_encoder_8;
 bool net_encoder_9;
 bool net_encoder_A;
 bool net_encoder_B;
 bool net_encoder_C;
 bool net_encoder_D;
 bool net_encoder_E;
 bool net_encoder_F;
}net_settigs;

typedef struct
{
 u16 status;
 u8  last_net_task;
 u8 fifo_buf[50];
 Buf_Head fifo_stack;
}net_status_struct;

extern net_status_struct net_status;
extern bool net_fault_flag;
extern u16 system_wait_timer;
extern bool task_flag;
extern net_settigs net_sets;
extern uart_obj extern_master_find;
extern u16 keys_syncro_count;
void keys_syncro_func();
void net_init();
void net_task();
void make_request(uart_obj object);
void net_set_default(net_priority net_pr);
void  net_counter();
void net_fault_function();
net_priority find_PC_connecting();
void pref_net_init();
void lpd_requests(u8 command);
void encoder0_func(u8 command);
void encoder1_func(u8 command);
void encoder1_t_func(u8 command);
void encoder0_eoc_func(u8 command);
void keys_analis_P_O();
/*
#ifdef CU_DEVICE


#endif

#ifdef LD_DEVICE
#endif


#ifdef METEO_DEVICE
#endif


#ifdef RADIO_DEVICE
#endif
*/

#endif