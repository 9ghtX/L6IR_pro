#include "net.h"
#include "Ball.h"
#include "keys.h"

#ifdef TNM_MODE
#include "digital_resist.h"
#endif

uart_obj uart_obj_buf[UART_OBJ_Q];
net_settigs net_sets;
u16 obj_in_net;
bool task_flag;
u16 keys_syncro_count;
u16 system_wait_timer;
net_status_struct net_status;
u16 net_global_count;
extern encoder encoder0, encoder1;
  uart_obj extern_master_find;

  uart_obj cu_get_keys;
  uart_obj cu_get_net_condition;

  uart_obj get_gps;
  uart_obj get_compass;
  uart_obj calibrate_compass;
  uart_obj get_compass_status;
  uart_obj get_temperature;
  uart_obj get_pressure;
  uart_obj get_inclinate;
  uart_obj get_declinate;

  uart_obj power_off;

  uart_obj get_encoder_0;
  uart_obj get_encoder_1;

  uart_obj rf_start_messure;
  uart_obj rf_get_status;
  uart_obj rf_get_distance;
  
  uart_obj get_focus;

  
extern  Kes_type key_menu;
//  uart_obj system_init_wait;



extern spi_def spi_sets;

#define EXPOSSITION_MAX 15
#define EXPOSSITION_MIN -15
#define EOC_BRIGHTNES_MAX 8
#define EOC_BRIGHTNES_MIN 0
#define LED_BRIGHTNES_MAX 255
#define LED_BRIGHTNES_MIN 1

s8 expossition_value;
u16 expo_timeout;
u8 led_brightnes = LED_BRIGHTNES_MAX;
extern operator_control_state eye_sens_state;
extern u16 error_counter;
extern bool led_pulse_enable;
u8 eoc_brightnes_value = EOC_BRIGHTNES_MAX;
extern bool cam_power_state;
bool led_consist;


/*
#ifdef CU_DEVICE
  uart_obj cu_get_keys;
  uart_obj cu_get_gps;

#endif

#ifdef LD_DEVICE

#endif


#ifdef METEO_DEVICE

#endif


#ifdef RADIO_DEVICE

#endif
*/



/*¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹
  ×òåíèå íàñòðîåê èçäåëèÿ ñ ïëàòû óñòðîéñòâà óïðàâëåíèÿ
¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹*/

void read_sets_from_CU()
{

}


/*¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹
  Ôóíêöèÿ ïîèñêà âíåøíåãî ïîäêëþ÷åíèÿ
¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹*/
net_priority find_PC_connecting()
{
 net_priority net_pr= NET_MASTER;



 return net_pr;
}

/*¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹
  Ôóíêöèÿ èíèöèàëèçàöèè êàìåðû è ñåòè ïî êîíôèãóðàöèè, ñ÷èòàííîé èç Flash
¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹*/
extern  u8 encoder1_masks_buf[];// ={MASK_ON, MASK_ON, MASK_ON, MASK_ON, MASK_ON, MASK_ON, MASK_ON};
extern  u8 encoder0_masks_buf[];
extern  u8 ctrl_unit_masks_buf[];

void smart_device_ini()
{
 if((flash.cam_type&0x0000000f)==setup)
   {
     net_sets.net_pr = NET_SLAVE;
   }
 else
 {
   net_sets.net_pr = NET_MASTER;
 }   
   
 if((flash.cam_type&0x0000000f)==thermal_head)
   {
     
     encoder1_masks_buf[ZOOM_FUNC_NUM] = MASK_OFF;
     encoder0_masks_buf[DISTANTS_FUNC_NUM] = MASK_OFF;
     encoder0_masks_buf[ZOOM_FUNC_NUM] = MASK_OFF;  
     ctrl_unit_masks_buf[DISTANTS_FUNC_NUM] = MASK_OFF;
     ctrl_unit_masks_buf[ZOOM_FUNC_NUM] = MASK_OFF;  
   }
 
 switch(flash.cam_type&0x0000C200)
 {
   
   case 0x0000C200:// 3 encoder, 1 control unit
     
   break;
   
   case 0x0000C000:// 3 encoder, 0 control unit
     
   break;
   
   case 0x00004200: // 1 encoder, 1 control unit
    net_sets.net_control_unit1 = true;
    net_sets.net_encoder_0 = true;
    encoder0.adress = ADRESS_ENCODER1;
    encoder1.adress = ADRESS_ENCODER2;
    encoder0.encoder_func = encoder0_func;
   break;

   case 0x00004000:// 1 encoder, 0 control unit
    net_sets.net_encoder_0 = true;
    encoder0.adress = ADRESS_ENCODER3;
    encoder1.adress = ADRESS_ENCODER2;
    encoder0.encoder_func = encoder0_func;  
    encoder0_masks_buf[EOC_BRIGHTNES_FUNC_NUM] = MASK_OFF;
   break;

   case 0x00008200:// 2 encoder, 1 control unit
     net_sets.net_control_unit1 = true;
     net_sets.net_encoder_2 = true;
     net_sets.net_encoder_3 = true;
     encoder0.adress =  ADRESS_ENCODER0;
     encoder1.adress =ADRESS_ENCODER1;
     
     encoder0_masks_buf[DISTANTS_FUNC_NUM] = MASK_OFF;
     
     encoder0.encoder_func = encoder0_func_2enc;
     if(flash.cam_type&CONFIG_BALL_TEST) encoder1.encoder_func = encoder1_func;
     else encoder1.encoder_func = encoder1_t_func;     
   break;
   
   case 0x00008000:// 2 encoder, 0 control unit
     net_sets.net_encoder_1 = true;
     net_sets.net_encoder_0 = true;
     encoder0.adress = ADRESS_ENCODER2;
     encoder1.adress = ADRESS_ENCODER3;
     
     encoder0_masks_buf[DISTANTS_FUNC_NUM] = MASK_OFF;
     encoder0_masks_buf[EYE_SENSOR_ON_FUNC_NUM] = MASK_OFF;
     encoder0_masks_buf[EOC_BRIGHTNES_FUNC_NUM] = MASK_OFF;     
     encoder1.encoder_func = encoder0_func;
     if(flash.cam_type&CONFIG_BALL_TEST) encoder0.encoder_func = encoder1_func;
     else encoder0.encoder_func = encoder1_t_func;
   break;//ye lf
   
   case 0x00000200:// 0 encoder, 1 control unit
     net_sets.net_control_unit1 = true;
     encoder0_masks_buf[DISTANTS_FUNC_NUM] = MASK_OFF;
     encoder0_masks_buf[MARKS_BRIGHTNES_FUNC_NUM] = MASK_OFF;
     encoder0.adress =  ADRESS_ENCODER0;
     encoder1.adress =ADRESS_ENCODER1;
   break;
   
   case 0x00000000://  0 encoder, 0 control unit
     
   break;  
 }
 
 //switch
 net_sets.net_range_finder = true;

 if(flash.cam_type&CONFIG_METEO_TEST) net_sets.net_meteo = true;
 else net_sets.net_meteo = false;
 if(flash.cam_type&CONFIG_GPS_TEST)   net_sets.net_navigator = true;
 else net_sets.net_navigator = false;
 if(flash.cam_type&CONFIG_RADIO_TEST) net_sets.net_ext_communication =true;
 else net_sets.net_ext_communication =false;
 
 if(flash.cam_type&CONFIG_EXPO_TEST) encoder0_masks_buf[EXPOSSITION_FUNC_NUM] = MASK_ON;
 else encoder0_masks_buf[EXPOSSITION_FUNC_NUM] = MASK_OFF;

 if(flash.cam_type&CONFIG_EOC_TEST)   encoder0_masks_buf[EOC_BRIGHTNES_FUNC_NUM] = MASK_ON;
 else   encoder0_masks_buf[EOC_BRIGHTNES_FUNC_NUM] = MASK_OFF;
 if(flash.cam_type&CONFIG_BALL_TEST)   cam_sets.ball_calculation = true;
 else cam_sets.ball_calculation = false;
 
 if(flash.cam_type&CONFIG_AUTO_FOCUS_TEST) net_sets.net_auto_focus = true;
   else net_sets.net_auto_focus = false;
 
 if(((flash.cam_type&CONFIG_CAM_TYPE_TEST)==CAM_IS_MONOCULAR)||((flash.cam_type&CONFIG_CAM_TYPE_TEST)==CAM_IS_NOZZLE))
 {
   encoder0_masks_buf[MARKS_BRIGHTNES_FUNC_NUM] = MASK_OFF;
   encoder0_masks_buf[DISTANTS_FUNC_NUM] = MASK_OFF;
 }
 
  if(((flash.cam_type&CONFIG_CAM_TYPE_TEST)==CAM_IS_MEDICAL)||((flash.cam_type&CONFIG_CAM_TYPE_TEST)==CAM_IS_NOZZLE)||((flash.cam_type&CONFIG_CAM_TYPE_TEST)==CAM_IS_MONOCULAR))
  {
   encoder0_masks_buf[EYE_SENSOR_ON_FUNC_NUM]  = MASK_OFF;
  }
 if(!(flash.cam_type&CONFIG_EYE_SENS_TEST))
  {
  encoder0_masks_buf[EYE_SENSOR_ON_FUNC_NUM]  = MASK_OFF;
  encoder1_masks_buf[EYE_SENSOR_ON_FUNC_NUM]  = MASK_OFF;
  }
 if(!(flash.cam_type&CONFIG_TEMP_PRESS_TEST))
   {
    encoder0_masks_buf[TEMP_ENTER_FUNC_NUM]  = MASK_OFF;
    encoder0_masks_buf[PRESS_ENTER_FUNC_NUM]   = MASK_OFF; 
   }
 
 
}

/*¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹
  Óñòàíîâêà íàñòðîåê ïî óìîë÷àíèþ 
¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹*/

void net_set_default(net_priority net_pr)
{
 net_sets.boudrate = BD115200;
 net_sets.net_pr = net_pr;
}



/*¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹
 Ôóíêöèÿ ïåðâè÷íîé èíèöèàëèçàöèè ñåòåâûõ çàäà÷.
¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹*/
void pref_net_init()
{
   obj_in_net = 0;
   extern_master_find.task_id          =   EXTERN_MASTER_FIND;
   extern_master_find.dev_addr         =   ADRESS_EXT_MASTER;
   extern_master_find.command          =   EXT_MASTER_REQUEST;
   extern_master_find.counter          =   0;
   extern_master_find.delay            =   EXT_MASTER_DELAY;
   extern_master_find.obj_net_number   =   obj_in_net;
   extern_master_find.synchro          =   ASYNCHRO;
   uart_obj_buf[obj_in_net]            =   extern_master_find;
   obj_in_net++;

   cu_get_net_condition.task_id        =   CU_GET_NET_CONDIT;
   cu_get_net_condition.dev_addr       =   ADRESS_CU;
   cu_get_net_condition.command        =   CONDISSION_REQUEST;
   cu_get_net_condition.counter        =   0;
   cu_get_net_condition.delay          =   CU_GET_CONDIT_TIMER;
   cu_get_net_condition.obj_net_number =   obj_in_net;
   cu_get_net_condition.synchro        =   ASYNCHRO;               
   uart_obj_buf[obj_in_net]            =   cu_get_net_condition;
   obj_in_net++;
   net_sets.net_pr = NET_MASTER;
   uart_obj_buf[extern_master_find.obj_net_number].counter  =   EXT_MASTER_DELAY;
}


/*¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹
 Ôóíêöèÿ èíèöèàëèçàöèè ñåòåâûõ çàäà÷.
¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹*/

void net_init()
{
  obj_in_net = 0;
  net_global_count = 0;
  net_status.last_net_task = 0;
 /* system_init_wait.task_id = SYSTEM_INIT_WAIT;
  system_init_wait.counter = SYSTEM_INIT_WAIT_TIMER;
  system_init_wait.delay   = SYSTEM_INIT_WAIT_TIMER;
  system_init_wait.synchro = ASYNCHRO;
  uart_obj_buf[obj_in_net] = system_init_wait;
  obj_in_net++;*/





  if(net_sets.net_control_unit1)
    {
        if(flash.cam_type&CONFIG_CU_KEYS_TEST)
        {
        cu_get_keys.task_id         = CU_GET_KEYS;
        cu_get_keys.dev_addr        = ADRESS_CU;
        cu_get_keys.command         = GET_KEY_CODE;
        cu_get_keys.counter         = 0;
        cu_get_keys.delay           = CU_GET_KEYS_TIMER;
        cu_get_keys.synchro         = SYNCHRO;
        cu_get_keys.obj_net_number  = obj_in_net;
        uart_obj_buf[obj_in_net]    = cu_get_keys;
        obj_in_net++;
        }

        power_off.task_id           = POWER_OFF_COM;
        power_off.dev_addr          = ADRESS_CU;
        power_off.command           = POWER_OFF_COMMAND;
        power_off.counter           = 0;
        power_off.delay             = POWER_OFF_TIMER;
        power_off.synchro           = ASYNCHRO;
        power_off.obj_net_number    = obj_in_net;
        uart_obj_buf[obj_in_net]    = power_off;
        obj_in_net++;

    }


  if( net_sets.net_encoder_0)
    {
        get_encoder_0.task_id      = ENCODER0_GET_KEYS;
        get_encoder_0.dev_addr     = encoder0.adress;
        get_encoder_0.command      = GET_KEY_CODE;
        get_encoder_0.counter      = (CU_GET_KEYS_TIMER/2);
        get_encoder_0.delay        = CU_GET_KEYS_TIMER;
        get_encoder_0.synchro      = SYNCHRO;
        uart_obj_buf[obj_in_net]   = get_encoder_0;
        obj_in_net++;
    }

  if( net_sets.net_encoder_1)
    {
        get_encoder_1.task_id      = ENCODER1_GET_KEYS;
        get_encoder_1.dev_addr     = encoder1.adress;
        get_encoder_1.command      = GET_KEY_CODE;
        get_encoder_1.counter      = 0;
        get_encoder_1.delay        = CU_GET_KEYS_TIMER;
        get_encoder_1.synchro      = SYNCHRO;
        uart_obj_buf[obj_in_net]   = get_encoder_1;
        obj_in_net++;
    }
// #endif
 /* 
   #ifdef TNV_MODE
  if( net_sets.net_encoder_1)
    {
        get_encoder_1.task_id      = ENCODER1_GET_KEYS;
        get_encoder_1.dev_addr     = ADRESS_ENCODER1;
        get_encoder_1.command      = GET_KEY_CODE;
        get_encoder_1.counter      = 0;
        get_encoder_1.delay        = CU_GET_KEYS_TIMER;
        get_encoder_1.synchro      = SYNCHRO;
        uart_obj_buf[obj_in_net]   = get_encoder_1;
        obj_in_net++;
    } 
   #endif
*/
  if(net_sets.net_navigator)
    {
     get_gps.task_id               = GET_GPS;
     get_gps.dev_addr              = ADRESS_GPS;
     get_gps.command               = GET_GPS_DATA;
     get_gps.counter               = 0;
     get_gps.delay                 = GET_GPS_TIMER;
     get_gps.synchro               = SYNCHRO;
     uart_obj_buf[obj_in_net]      = get_gps;
     obj_in_net++;
    }
//#ifdef METEO
  if(net_sets.net_meteo)
    {
     get_compass.task_id  = GET_COMPASS;
     get_compass.dev_addr = ADRESS_METEO;
     get_compass.command  = GET_COMPASS_DATA;
     get_compass.counter  = 0;
     get_compass.delay    = GET_COMPASS_TIMER;
     if((flash.cam_type&CONFIG_METEO_TEST) != TPmeteo)get_compass.synchro  = SYNCHRO;
     else get_compass.synchro  = ASYNCHRO;
     get_compass.obj_net_number = obj_in_net;
     uart_obj_buf[obj_in_net] = get_compass;
     obj_in_net++;

     calibrate_compass.task_id  = COMPASS_CALIBRATE;
     calibrate_compass.dev_addr = ADRESS_METEO;
     calibrate_compass.command  = COMPASS_CALIBRATE_DATA;
     calibrate_compass.counter = 0;
     calibrate_compass.delay = COMPASS_CALIBRATE_TIMER;
     calibrate_compass.synchro = ASYNCHRO;
     calibrate_compass.obj_net_number = obj_in_net;
     uart_obj_buf[obj_in_net] = calibrate_compass;
     obj_in_net++;

     get_compass_status.task_id  = GET_COMPASS_STATUS;
     get_compass_status.dev_addr = ADRESS_METEO;
     get_compass_status.command  = GET_COMPASS_STATUS_DATA;
     get_compass_status.counter  = 0;
     get_compass_status.delay    = GET_COMPASS_STATUS_TIMER;
     get_compass_status.synchro  = ASYNCHRO;
     get_compass_status.obj_net_number = obj_in_net;
     uart_obj_buf[obj_in_net]    = get_compass_status;
     obj_in_net++;

     get_temperature.task_id     = METEO_GET_TEMP;
     get_temperature.dev_addr    = ADRESS_METEO;
     get_temperature.command     = GET_TEMPERATURE_DATA;
     get_temperature.counter     = 0;
     get_temperature.delay       = GET_TEMPERATURE_TIMER;
     get_temperature.synchro     = SYNCHRO;
     get_temperature.obj_net_number = obj_in_net;
     uart_obj_buf[obj_in_net]    = get_temperature;
     obj_in_net++;

     get_pressure.task_id     = METEO_GET_PRESS;
     get_pressure.dev_addr    = ADRESS_METEO;
     get_pressure.command     = GET_PRESSURE_DATA;
     get_pressure.counter     = GET_PRESSURE_TIMER/2;
     get_pressure.delay       = GET_PRESSURE_TIMER;
     get_pressure.synchro     = SYNCHRO;
     get_pressure.obj_net_number = obj_in_net;
     uart_obj_buf[obj_in_net]    = get_pressure;
     obj_in_net++;

     get_inclinate.task_id     = METEO_GET_INCLINATE;
     get_inclinate.dev_addr    = ADRESS_METEO;
     get_inclinate.command     = METEO_GET_INCLINATE_DATA;
     get_inclinate.counter     = 0;
     get_inclinate.delay       = GET_INCLINATE_TIMER;
     if((flash.cam_type&CONFIG_METEO_TEST) == TPABCmeteo)get_inclinate.synchro     = SYNCHRO;
     else get_inclinate.synchro     = ASYNCHRO;
     get_inclinate.obj_net_number = obj_in_net;
     uart_obj_buf[obj_in_net]    = get_inclinate;
     obj_in_net++;

     get_declinate.task_id     = METEO_GET_DECLINATE;
     get_declinate.dev_addr    = ADRESS_METEO;
     get_declinate.command     = METEO_GET_DECLINATE_DATA;
     get_declinate.counter     = GET_DECLINATE_TIMER/2;
     get_declinate.delay       = GET_DECLINATE_TIMER;
     if((flash.cam_type&CONFIG_METEO_TEST) == TPABCmeteo)get_declinate.synchro     = SYNCHRO;
     else get_declinate.synchro     = ASYNCHRO;
     get_declinate.obj_net_number = obj_in_net;
     uart_obj_buf[obj_in_net]    = get_declinate;
     obj_in_net++;

    }
//#endif
  if(net_sets.net_range_finder)
    {
     rf_start_messure.task_id  = RF_START_MESSURE;
     rf_start_messure.dev_addr = ADRESS_LPD;
     rf_start_messure.command  = START_MESSURE_DIST;
     rf_start_messure.counter  = 0;
     rf_start_messure.delay    = RF_START_MESSURE_TIMER;
     rf_start_messure.synchro  = ASYNCHRO;
     rf_start_messure.obj_net_number = obj_in_net;
     uart_obj_buf[obj_in_net] = rf_start_messure;
     obj_in_net++;

     rf_get_status.task_id  = RF_GET_STATUS;
     rf_get_status.dev_addr = ADRESS_LPD;
     rf_get_status.command  = GET_LPD_STATUS;
     rf_get_status.counter  = 0;
     rf_get_status.delay    = GET_RF_STATUS_TIMER;
     rf_get_status.synchro  = ASYNCHRO;
     rf_get_status.obj_net_number = obj_in_net;
     uart_obj_buf[obj_in_net] = rf_get_status;
     obj_in_net++;

     rf_get_distance.task_id  = RF_GET_DISTANCE;
     rf_get_distance.dev_addr = ADRESS_LPD;
     rf_get_distance.command  = GET_LPD_DISTANCE;
     rf_get_distance.counter  = 0;
     rf_get_distance.delay    = RF_GET_DISTANCE_TIMER;
     rf_get_distance.synchro  = ASYNCHRO;
     rf_get_distance.obj_net_number = obj_in_net;
     uart_obj_buf[obj_in_net] = rf_get_distance;
     obj_in_net++;
    }
  
  if(net_sets.net_auto_focus)
    {
      get_focus.task_id  = AF_GET_FOCUS;
      get_focus.dev_addr = ADRESS_OBJ_FOCUS;
      get_focus.command  = GET_FOCUS_F_REQUEST;
      get_focus.counter  = 0;
      get_focus.delay    = AUTOFOCUS_GET_FOCUS_TIMER;
      get_focus.synchro  = SYNCHRO;
      get_focus.obj_net_number = obj_in_net;
      uart_obj_buf[obj_in_net] = get_focus;
      obj_in_net++;    
    }

}



/*##############################################################################
METEO ACTIVATE/DEACTEVATE FUNCTION
##############################################################################*/
void meteo_actevate(bool active)
{
if(active)
{
     uart_obj_buf[get_temperature.obj_net_number].synchro     = SYNCHRO;     
     uart_obj_buf[get_pressure.obj_net_number].synchro     = SYNCHRO;

     if((flash.cam_type&CONFIG_METEO_TEST) == TPABCmeteo)uart_obj_buf[get_inclinate.obj_net_number].synchro     = SYNCHRO;
     else uart_obj_buf[get_inclinate.obj_net_number].synchro   = ASYNCHRO;

     
     if((flash.cam_type&CONFIG_METEO_TEST) == TPABCmeteo)uart_obj_buf[get_declinate.obj_net_number].synchro     = SYNCHRO;
     else uart_obj_buf[get_declinate.obj_net_number].synchro    = ASYNCHRO;

}
else
{
     uart_obj_buf[get_temperature.obj_net_number].synchro     = ASYNCHRO;     
     uart_obj_buf[get_pressure.obj_net_number].synchro     = ASYNCHRO;

     if((flash.cam_type&CONFIG_METEO_TEST) == TPABCmeteo)uart_obj_buf[get_inclinate.obj_net_number].synchro     = ASYNCHRO;
     else uart_obj_buf[get_inclinate.obj_net_number].synchro   = ASYNCHRO;

     
     if((flash.cam_type&CONFIG_METEO_TEST) == TPABCmeteo)uart_obj_buf[get_declinate.obj_net_number].synchro     = ASYNCHRO;
     else uart_obj_buf[get_declinate.obj_net_number].synchro    = ASYNCHRO;

}
}



/*¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹
Ôóíêöèÿ èíêðèìåíòèðîâàíèÿ ñ÷åò÷èêîâ ñèíõðîíèçàöèè
¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹*/

void  net_counter()
{
  u16 i;
 for(i=0;i<obj_in_net;i++)
 {
  if(uart_obj_buf[i].synchro != ASYNCHRO) uart_obj_buf[i].counter++;
 }
}

/*¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹
Ôóíêöèÿ öèêëè÷åñêîãî îïðîñà çàäà÷.
¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹*/

void net_task()
{
 u16 i;
 u8 task_number;
if(!task_flag)
  {

   for(i=0;i<obj_in_net;i++)
      {
       if(uart_obj_buf[i].counter >= uart_obj_buf[i].delay)
         {
          push(&net_status.fifo_stack, i);
          uart_obj_buf[i].counter = 0;
         }
      }

    if(!get_empty(&net_status.fifo_stack))
    {
      task_number = pop(&net_status.fifo_stack);
      make_request(uart_obj_buf[task_number]);
      net_status.last_net_task = uart_obj_buf[task_number].task_id;
      uart_obj_buf[task_number].counter = 0;
      task_flag = true;
      
    }
  }
 }



/*¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹
 Ôóíêöèÿ ôîðìèðîâàíèÿ çàïðîñà äëÿ óñòðîéñòâ.
¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹*/
u8 last_com, last_adrr;

void make_request(uart_obj object)
{  
     push(&TXbuf,object.dev_addr);
     push(&TXbuf,object.command);
     insert_crc(&TXbuf);
     insert_stsp(&TXbuf);
     
     USART_ITConfig(USART1, USART_IT_TC, ENABLE);
}



/*¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹
 Ôóíêöèÿ îáðàáîòêè îøèáîê ñåòè
¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹*/


void net_fault_function()
{
 switch(net_status.last_net_task)
 {
 case EXTERN_MASTER_FIND:
   net_set_default(NET_MASTER);
   net_init();
   //uart_obj_buf[cu_get_net_condition.obj_net_number].counter  =   CU_GET_CONDIT_TIMER;
 break;

 case CU_GET_NET_CONDIT:
  net_init();
  system_wait_timer =500;
 break;

 default:
 system_wait_timer =100;

 break;
 }
 clean(&net_status.fifo_stack);
 //clean(&RXbuf);
 net_fault_flag = false;
}


/*##############################################################################
        Ôóíêöèÿ êîíòðîëÿ çàðÿäà àêêóìóëÿòîðà
###############################################################################*/
extern ADC_result ADC_data;
#define MAX_EYE_BUFF 10
float eye_buff[MAX_EYE_BUFF]=0;
float disp_buff[MAX_EYE_BUFF]=0;
u8 eye_buff_point, eye_buff_quant;
float eye_buff_sum, current_buff_summ; 
eye_sens_struct eye_sens_par;

void Power_control_func()
{
 int adc_data;
 float voltage, temperature, eye_temp, current_temp;
 //if(ADC_GetFlagStatus(ADC1, ADC_FLAG_EOC)==SET)
//  {
  // adc_data = ADC_GetInjectedConversionValue(ADC1, ADC_InjectedChannel_1);
  // voltage = ((float)ADC_data.battery_ctrl*6.6)/4096;
   eye_temp = (float)ADC_data.operator_photo;

  eye_buff_sum = eye_buff_sum - eye_buff[eye_buff_point]+eye_temp;
  eye_buff[eye_buff_point]=eye_temp;
  
  current_buff_summ = current_buff_summ - disp_buff[eye_buff_point] + current_temp;
  disp_buff[eye_buff_point] = current_temp;
  
  if(eye_buff_quant<MAX_EYE_BUFF)eye_buff_quant++;
  
  eye_buff_point++;
  if(eye_buff_point>=MAX_EYE_BUFF)eye_buff_point=0;
  
  eye_sens_par.eye_photo_data = eye_buff_sum/eye_buff_quant;
  eye_sens_par.current_sens   = current_buff_summ/eye_buff_quant;
  
  //senspar.inclinate = temperature;//*10;
  eye_sens_par.eye_norn_data = eye_sens_par.eye_photo_data;///eye_sens_par.current_sens;
 
    if(eye_sens_par.eye_norn_data> eye_sens_par.eye_threshold)//16.6)//0.02) 
    {
              if(display_st== display_on) display_st = display_make_off;        
    }
    else
    {
    if(display_st== display_off) display_st = display_make_on; 
    }
    // wright_data_to_cam(GET_PRESSURE_DATA, senspar.inclinate);
   // ADC_SoftwareStartConv(ADC1);
//  }
}



void lpd_requests(u8 command)
{
   switch(command)
   {
     case START_MESSURE_DIST:
          uart_obj_buf[rf_get_status.obj_net_number].synchro = SYNCHRO;
     break;


     case GET_LPD_STATUS:
          uart_obj_buf[rf_get_distance.obj_net_number].counter = uart_obj_buf[rf_get_distance.obj_net_number].delay;
     break;


     case GET_LPD_DISTANCE:
          uart_obj_buf[rf_get_status.obj_net_number].synchro = ASYNCHRO;
          u8 targets;
          u8* data;//0, data1, data2, data3;
          float dist;
          float* dist_point;
          dist_point = &dist;
          data = (u8*)(dist_point);

          targets = pop(&RXbuf);
          *(data+0) = pop(&RXbuf);
          *(data+1) = pop(&RXbuf);
          *(data+2) = pop(&RXbuf);
          *(data+3) = pop(&RXbuf);

          // data = (((u32)data0)<<24)&(((u32)data1)<<16)&(((u32)data2)<<8)&((u32)data3);
          senspar.distance = dist;
          spi_objects[DISTANCE_ADDR].wright_data = (0x0000FFFF&((u32)senspar.distance));
          senspar.change_par = true;
          //balCalculate(senspar.distance);

     break;

   }

}


//##############################################################################
//         WRIGHT DATA TO CAMERA FOR IMAGINE
//##############################################################################
void wright_data_to_cam(u8 addr, float data)
{
 switch(addr)
 {
   case GET_TEMPERATURE_DATA:
   spi_objects[TEMPERATURE_WRIGHT_ADDR].wright_data = 0xF0000000|0x0000FFFF&((s32)data);
   break;

   case GET_PRESSURE_DATA:
   spi_objects[PRESSURE_ADDR].wright_data = 0xF0000000|0x0000FFFF&((s32)data);
   break;

   case METEO_GET_INCLINATE_DATA:
   spi_objects[INCLINATE_ADDR].wright_data = 0xF0000000|0x0000FFFF&((s32)data);
   break;
 }
}


/*¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹

¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹¹*/
/*
void encoder_func_ini()
{
  bool ready=false;
  u32 count=0, reg=0;
 while(!ready)
 {
   spi_objects[COMMAND_REG_ADDR].wright_data = COM_ZOOM_DISP;
        task_flag =true;
        while(task_flag);
       reg= spi_silar_read(COMMAND_REG_ADDR);
   if(reg==COM_ZOOM_DISP) ready = true;
   else count++;
     if(count>10) ready=true;
 }
}*/
//==============================================================================
//           KEYS SYNCRO FUNCTION
//==============================================================================
void keys_syncro_func()
{
   if(keys_syncro_count !=0) keys_syncro_count--;
}
/*#############################################################################
Îáðàáîòêà áóôåðà êîäîâ êíîïîê, ïîëó÷åííûõ îò óñòðîéñòâ ñåòè
##############################################################################*/



#ifdef L6IR_CU

#include "L6IR.h"


void keys_analis()
{
  u8 i, key_code;
  u8 ball_num = (u8)(0x0f&(spi_sets.silar_state>>4));
  u32 temp_dist;
  s32 temp_press;
  
  if(get_key_event(&key_menu)==CLICK_EVENT)
  {
  // WRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_MENU_CLICK); //Çàêîìåí÷åíî äëÿ êàìåð íà çàâîä. Â äàëüíåéøåì ñäåëàòü íàñòðîå÷íûì ïàðàìåòðîì
  }
   
  if(!get_empty(&keys.keys_stack))
  {
     if(cam_power_state) spi_read_camers_state();
   //keys.quant--;
   key_code = get(&keys.keys_stack);//keys.buffer[i];
   if(error_counter==0) clean(&keys.keys_stack);
   switch(key_code)
   {
    case KEY_ID:
 //    if(!task_flag)
 //      {
        // rf_start_messure.counter
         uart_obj_buf[rf_start_messure.obj_net_number].counter= RF_START_MESSURE_TIMER;
         pop(&keys.keys_stack);
         //keys.quant--;
//       }
    break;

    case KEY_ENTER:
    WRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_ENTER_CLICK);
    break;

    case KEY_PLUS:
    WRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_PLUS_CLICK);
    break;

    case KEY_MINUS:
    WRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_MINUS_CLICK);
    break;

    case KEY_PHOTO:
    if(0x08&spi_sets.silar_state)  {WRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_ENTER_CLICK);}
    else                           {WRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_PHOTO_CLICK);}

    case KEY_MENU_ENTER:
    WRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_MENU_CLICK);
    break;

    case KEY_ENCODER1:
    spi_objects[COMMAND_REG_ADDR].wright_data = KEY_MENU_CLICK;
    // if((0x08&spi_sets.silar_state)) spi_objects[COMMAND_REG_ADDR].wright_data = spi_sets.current_function;
    break;

    
    
    case KEY_DISTANTS_PLUS:
      if((0x08&spi_sets.silar_state)||(ball_num==0)||(!(flash.cam_type&CONFIG_BALL_TEST)))  
      {
#ifdef ENCODER2_IS_UP
        if(net_sets.net_encoder_1) { cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_ENCODER2_PLUS);}
        else                        {cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_PLUS_CLICK);}
#else
        cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_PLUS_CLICK);
#endif
      }
      else
      {
       if((!spi_objects[DISTANCE_ADDR].wright_data)&&(spi_objects[DISTANCE_ADDR].wright_enable))
       {
        temp_dist = (u32)senspar.distance;
        temp_dist=(temp_dist - temp_dist%50)+50;//(0xfff&(spi_objects[DISTANCE_ADDR].read_data+50));
        if(temp_dist > 1000) temp_dist =1000;

        spi_objects[DISTANCE_ADDR].reg_for_wright = true;
        spi_objects[DISTANCE_ADDR].wright_data = (0x0000FFFF&temp_dist);
        if((0xfff&spi_objects[DISTANCE_ADDR].wright_data)==0) spi_objects[DISTANCE_ADDR].wright_data|=0x01;
        senspar.distance = (float)temp_dist;
        senspar.change_par = true;
        clean(&keys.keys_stack);
       }
      }
    break;

    case KEY_DISTANTS_MINUS:
    if((0x08&spi_sets.silar_state)||(ball_num==0)||(!(flash.cam_type&CONFIG_BALL_TEST)))  
    {
#ifdef ENCODER2_IS_UP     
      if(net_sets.net_encoder_1)    {  cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_ENCODER2_MINUS);}
      else                          { cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_MINUS_CLICK);}
#else 
      cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_MINUS_CLICK);
#endif
    }
    else
    {
      if((!spi_objects[DISTANCE_ADDR].wright_data)&&(spi_objects[DISTANCE_ADDR].wright_enable))
      {      
      temp_dist = (u32)senspar.distance;
      temp_dist = (temp_dist - temp_dist%50)- 50;   

    if(temp_dist<100) temp_dist =100;

    spi_objects[DISTANCE_ADDR].reg_for_wright = true;
    spi_objects[DISTANCE_ADDR].wright_data = (0xffff&temp_dist);
    if((0xfff&spi_objects[DISTANCE_ADDR].wright_data)==0) spi_objects[DISTANCE_ADDR].wright_data|=0x01;
    senspar.distance = (float)temp_dist;
    senspar.change_par = true;
    clean(&keys.keys_stack);
      }
    }
    break;
    
    case ENCODER_PLUS_ZOOM:
    if(0x08&spi_sets.silar_state)  
    {
#ifndef ENCODER2_IS_UP
        if(net_sets.net_encoder_1) { cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_ENCODER2_PLUS);}
        else                        {cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_PLUS_CLICK);}
#else
        cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_PLUS_CLICK);
#endif
    }
    else {cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_ZOOM_PLUS);}
    break;

    case ENCODER_MINUS_ZOOM:
    if(0x08&spi_sets.silar_state) 
    {
#ifndef ENCODER2_IS_UP     
      if(net_sets.net_encoder_1)    {  cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_ENCODER2_MINUS);}
      else                          { cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_MINUS_CLICK);}
#else 
      cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_MINUS_CLICK);
#endif
    }
    else {cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_ZOOM_MINUS);}
    break;

    case KEY_BRIGHTNES_MINUS:
    if(0x08&spi_sets.silar_state)  
    {
#ifndef ENCODER2_IS_UP     
      if(net_sets.net_encoder_1)    {  cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_ENCODER2_MINUS);}
      else                          { cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_MINUS_CLICK);}
#else 
      cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_MINUS_CLICK);
#endif
    }
    else {WRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_BRIGHTNES_MINUS);}
    break;

    case KEY_BRIGHTNES_PLUS:
    if(0x08&spi_sets.silar_state)  
    {
#ifndef ENCODER2_IS_UP
        if(net_sets.net_encoder_1) { cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_ENCODER2_PLUS);}
        else                        {cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_PLUS_CLICK);}
#else
        cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_PLUS_CLICK);
#endif
    }
    else {WRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_BRIGHTNES_PLUS);}
    break;

    case KEY_MARKS_BRIGHTNES_MINUS:
    if(0x08&spi_sets.silar_state) 
    {
#ifndef ENCODER2_IS_UP     
      if(net_sets.net_encoder_1)    {  cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_ENCODER2_MINUS);}
      else                          { cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_MINUS_CLICK);}
#else 
      cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_MINUS_CLICK);
#endif
    }
    else {WRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_MARKS_BRIGHTNES_MINUS);}
    break;

    case KEY_MARKS_BRIGHTNES_PLUS:
    if(0x08&spi_sets.silar_state)  
    {
#ifndef ENCODER2_IS_UP
        if(net_sets.net_encoder_1) { cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_ENCODER2_PLUS);}
        else                        {cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_PLUS_CLICK);}
#else
        cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_PLUS_CLICK);
#endif
    }
    else {WRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_MARKS_BRIGHTNES_PLUS);}
    break;
    
#ifdef TNM_MODE
    case KEY_EOC_BRIGHTNES_MINUS:
    if(0x08&spi_sets.silar_state)  {cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_MINUS_CLICK);}
    else 
    {
      if(eoc_brightnes_value>EOC_BRIGHTNES_MIN)        
      {
        eoc_brightnes_value--;
        if(cam_power_state)cWRIGHT_SPI_REG(COMMAND_REG_ADDR, COM_SET_EOC_BR_VALUE|eoc_brightnes_value);
        digital_resist_send_function(eoc_brightnes_value);
      }
      if(led_pulse_enable)
      {
       if(led_brightnes>LED_BRIGHTNES_MIN)
       {
        led_brightnes = led_brightnes&(led_brightnes>>1);
        
       }
      }
    }
    break;

    case KEY_EOC_BRIGHTNES_PLUS:
    if(0x08&spi_sets.silar_state)  {cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_PLUS_CLICK);}
    else 
    { 
      if(eoc_brightnes_value<EOC_BRIGHTNES_MAX)
      {
      eoc_brightnes_value++;      
      if(cam_power_state)cWRIGHT_SPI_REG(COMMAND_REG_ADDR, COM_SET_EOC_BR_VALUE|eoc_brightnes_value);
      digital_resist_send_function(eoc_brightnes_value); 
      
      if(led_pulse_enable)
      {
       if(led_brightnes<=LED_BRIGHTNES_MAX)
       {
        led_brightnes = led_brightnes|(led_brightnes<<1);
        
       }
      }
      }
    }
    break;
#endif 
    
    
    case KEY_EXPOSSITION_MINUS:
    if(0x08&spi_sets.silar_state)  
    {
#ifndef ENCODER2_IS_UP     
      if(net_sets.net_encoder_1)    {  cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_ENCODER2_MINUS);}
      else                          { cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_MINUS_CLICK);}
#else 
      cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_MINUS_CLICK);
#endif
    }
    else 
    {
      if((expossition_value>EXPOSSITION_MIN)&&(expo_timeout == 0))        
      {
        expossition_value-=1;
        cWRIGHT_SPI_REG(COMMAND_REG_ADDR, COM_SET_EXPOSIT_VALUE|(((u32)expossition_value)&0x000000ff));
        expo_timeout =300;
      }
      else clean(&keys.keys_stack);
    } 
    
    break;
    
    case KEY_EXPOSSITION_PLUS:
    if(0x08&spi_sets.silar_state)  
    {
#ifndef ENCODER2_IS_UP
        if(net_sets.net_encoder_1) { cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_ENCODER2_PLUS);}
        else                        {cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_PLUS_CLICK);}
#else
        cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_PLUS_CLICK);
#endif
    }
    else 
    {
      if((expossition_value<EXPOSSITION_MAX)&&(expo_timeout == 0))        
      {
        expossition_value+=1;
        cWRIGHT_SPI_REG(COMMAND_REG_ADDR, COM_SET_EXPOSIT_VALUE|expossition_value);
        expo_timeout =300;
      }
      else clean(&keys.keys_stack);
    }    
    break;   
    
    
    case KEY_LEGIBILITY_MINUS:
    if(0x08&spi_sets.silar_state)  
    {
#ifndef ENCODER2_IS_UP     
      if(net_sets.net_encoder_1)    {  cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_ENCODER2_MINUS);}
      else                          { cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_MINUS_CLICK);}
#else 
      cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_MINUS_CLICK);
#endif
    }
    else {WRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_LEGIBILITY_MINUS);}
    break;

    case KEY_LEGIBILITY_PLUS:
    if(0x08&spi_sets.silar_state)  
    {
#ifndef ENCODER2_IS_UP
        if(net_sets.net_encoder_1) { cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_ENCODER2_PLUS);}
        else                        {cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_PLUS_CLICK);}
#else
        cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_PLUS_CLICK);
#endif
    }
    else {WRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_LEGIBILITY_PLUS);}
    break;

    case KEY_PALETTE_MINUS:
    if(0x08&spi_sets.silar_state)  
    {
#ifndef ENCODER2_IS_UP     
      if(net_sets.net_encoder_1)    {  cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_ENCODER2_MINUS);}
      else                          { cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_MINUS_CLICK);}
#else 
      cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_MINUS_CLICK);
#endif
    }
    else {WRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_PALETTE_MINUS);}
    break;

    case KEY_PALETTE_PLUS:
    if(0x08&spi_sets.silar_state)  
    {
#ifndef ENCODER2_IS_UP
        if(net_sets.net_encoder_1) { cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_ENCODER2_PLUS);}
        else                        {cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_PLUS_CLICK);}
#else
        cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_PLUS_CLICK);
#endif
    }
    else {WRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_PALETTE_PLUS);}
    break;

    case KEY_POSITIVE:
    if(0x08&spi_sets.silar_state)  
    {
#ifndef ENCODER2_IS_UP
        if(net_sets.net_encoder_1) { cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_ENCODER2_PLUS);}
        else                        {cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_PLUS_CLICK);}
#else
        cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_PLUS_CLICK);
#endif
    }
    else {WRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_POSITIVE);}
    break;

    case KEY_NEGATIVE:
    if(0x08&spi_sets.silar_state) 
    {
#ifndef ENCODER2_IS_UP     
      if(net_sets.net_encoder_1)    {  cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_ENCODER2_MINUS);}
      else                          { cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_MINUS_CLICK);}
#else 
      cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_MINUS_CLICK);
#endif
    }
    else {WRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_NEGATIVE);}
    break;
    
    case KEY_EYE_SENS_MINUS:
          if(0x08&spi_sets.silar_state)  
          {
#ifndef ENCODER2_IS_UP     
      if(net_sets.net_encoder_1)    {  cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_ENCODER2_MINUS);}
      else                          { cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_MINUS_CLICK);}
#else 
      cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_MINUS_CLICK);
#endif
          }
          else
          {
           pop(&keys.keys_stack);
           eye_sens_state = eye_sensor_off;
           WRIGHT_SPI_REG(COMMAND_REG_ADDR, (COM_EYE_SENS_DISP+eye_sens_state));
           spi_sets.current_function = COM_EYE_SENS_DISP+eye_sens_state;
           Led_OFF;	
          }
    break;
    
    case KEY_EYE_SENS_PLUS:
          if(0x08&spi_sets.silar_state)  
          {
#ifndef ENCODER2_IS_UP
        if(net_sets.net_encoder_1) { cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_ENCODER2_PLUS);}
        else                        {cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_PLUS_CLICK);}
#else
        cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_PLUS_CLICK);
#endif
          }
          else
          {
            pop(&keys.keys_stack);
            if(eye_sens_state == eye_sensor_off)
            {
              eye_sens_state = eye_sensor_on;
            WRIGHT_SPI_REG(COMMAND_REG_ADDR, (COM_EYE_SENS_DISP+eye_sens_state));
            spi_sets.current_function = COM_EYE_SENS_DISP+eye_sens_state;
            eye_sens_set_level();
            }
//            else
//            {
//              if(led_consist) {Led_OFF; led_consist= false;}
//              else {Led_ON; led_consist= true;}
//            }
          }
    break;
    
    case COM_NO_SYMBOL_DISP:
    if(!(0x08&spi_sets.silar_state))//  {WRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_ENTER_CLICK);}
    {
      WRIGHT_SPI_REG(COMMAND_REG_ADDR, COM_NO_SYMBOL_DISP);
      spi_sets.current_function = COM_NO_SYMBOL_DISP;
    }
    else pop(&keys.keys_stack);
    break;
    
    case COM_DISTANTS_DISP:
    if(0x08&spi_sets.silar_state)  {WRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_ENTER_CLICK);}
    else
    {
      WRIGHT_SPI_REG(COMMAND_REG_ADDR, COM_DISTANTS_DISP);
      spi_sets.current_function = COM_DISTANTS_DISP;     
    }
    break;
    
    case COM_MARKS_BRIGHTNES_DISP:
    if(0x08&spi_sets.silar_state)  {WRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_ENTER_CLICK);}
    else
    {
      WRIGHT_SPI_REG(COMMAND_REG_ADDR, COM_MARKS_BRIGHTNES_DISP);
      spi_sets.current_function = COM_MARKS_BRIGHTNES_DISP;   
    }
    break;
    
    case COM_EOC_BRIGHTNES_DISP:
    if(0x08&spi_sets.silar_state)  {WRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_ENTER_CLICK);}
    else
    {
      WRIGHT_SPI_REG(COMMAND_REG_ADDR, COM_EOC_BRIGHTNES_DISP);
      spi_sets.current_function = COM_EOC_BRIGHTNES_DISP;   
    }
    break;
    
    case COM_BRIGHTNES_DISP:
    if(0x08&spi_sets.silar_state)  {WRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_ENTER_CLICK);}
    else
    {
      WRIGHT_SPI_REG(COMMAND_REG_ADDR, COM_BRIGHTNES_DISP);
      spi_sets.current_function = COM_BRIGHTNES_DISP;
    }
    break;

    case COM_ZOOM_DISP:
    if(0x08&spi_sets.silar_state)  {WRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_ENTER_CLICK);}
    else
    {
      WRIGHT_SPI_REG(COMMAND_REG_ADDR, COM_ZOOM_DISP);
      spi_sets.current_function = COM_ZOOM_DISP;
    }
    break;

    case COM_POS_NEG_DISP:
    if(0x08&spi_sets.silar_state)  {WRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_ENTER_CLICK);}
    else
    {
      WRIGHT_SPI_REG(COMMAND_REG_ADDR, COM_POS_NEG_DISP);
      spi_sets.current_function = COM_POS_NEG_DISP;
    }
    break;

    case COM_POLETTE_DISP:
    if(0x08&spi_sets.silar_state)  {WRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_ENTER_CLICK);}
    else
    {
      WRIGHT_SPI_REG(COMMAND_REG_ADDR, COM_POLETTE_DISP);
      spi_sets.current_function = COM_POLETTE_DISP;
    }
    break;

    case COM_LIGIBILITY_DISP:
    if(0x08&spi_sets.silar_state)  {WRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_ENTER_CLICK);}
    else
    {
      WRIGHT_SPI_REG(COMMAND_REG_ADDR, COM_LIGIBILITY_DISP);
      spi_sets.current_function = COM_LIGIBILITY_DISP;
    }
    break;

    case COM_EYE_SENS_DISP:
    if(0x08&spi_sets.silar_state)  {WRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_ENTER_CLICK);}
    else
    {
      WRIGHT_SPI_REG(COMMAND_REG_ADDR, (COM_EYE_SENS_DISP+eye_sens_state));
      spi_sets.current_function = COM_EYE_SENS_DISP+eye_sens_state;
    }
    break;
    
    case KEY_ENTER_L:
     WRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_ENTER_PRESS);
    break;

    case KEY_POWER_OFF:
      if(0x08&spi_sets.silar_state) { WRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_ENTER_PRESS);}
    else
    {
     // WRIGHT_SPI_REG(COMMAND_REG_ADDR, CAMERA_OFF_COMMAND);
      clean(&keys.keys_stack);
#ifdef L6IR
      if(net_sets.net_control_unit1)
      {
        uart_obj_buf[power_off.obj_net_number].counter  = POWER_OFF_TIMER;
        uart_obj_buf[power_off.obj_net_number].synchro  = SYNCHRO;
      }
      // pop(&);
#endif
    }
    break;
    
    case KEY_ENTER_SPECIAL_MENU:
     WRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_ENTER_SPECIAL_MENU);
     break;
     
    case COM_TEMPERATURE_DISP:
    if(0x08&spi_sets.silar_state)  {WRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_ENTER_CLICK);}
    else
    {
      WRIGHT_SPI_REG(COMMAND_REG_ADDR, COM_TEMPERATURE_DISP); 
      spi_sets.current_function = COM_DISTANTS_DISP;     
    }
     
    break;  
    
    case KEY_TEMPERATURE_PLUS:
    if(0x08&spi_sets.silar_state)  
    {
#ifndef ENCODER2_IS_UP
        if(net_sets.net_encoder_1) { cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_ENCODER2_PLUS);}
        else                        {cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_PLUS_CLICK);}
#else
        cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_PLUS_CLICK);
#endif
    }
    else
    {
     senspar.temp_auto = false;
     clean(&keys.keys_stack);
     if(senspar.temperature < 50)
       {
         senspar.temperature += 1;
         wright_data_to_cam(GET_TEMPERATURE_DATA, senspar.temperature);
       }
    }
    break;
         
    case KEY_TEMPERATURE_MINUS:
    if(0x08&spi_sets.silar_state)  
    {
#ifndef ENCODER2_IS_UP     
      if(net_sets.net_encoder_1)    {  cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_ENCODER2_MINUS);}
      else                          { cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_MINUS_CLICK);}
#else 
      cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_MINUS_CLICK);
#endif
    }
    else
    {
     senspar.temp_auto = false;
     clean(&keys.keys_stack);
     if(senspar.temperature > -50)
       {
         senspar.temperature -= 1;
         wright_data_to_cam(GET_TEMPERATURE_DATA, senspar.temperature);
       }
    }     
    break;
         
    case COM_PRESSURE_DISP:
    if(0x08&spi_sets.silar_state)  {WRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_ENTER_CLICK);}
    else
    {
      WRIGHT_SPI_REG(COMMAND_REG_ADDR, COM_PRESSURE_DISP);
      spi_sets.current_function = COM_DISTANTS_DISP;     
    }
      
    break;
    
         
    case KEY_PRESSURE_PLUS:
    if(0x08&spi_sets.silar_state)  
    {
#ifndef ENCODER2_IS_UP
        if(net_sets.net_encoder_1) { cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_ENCODER2_PLUS);}
        else                        {cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_PLUS_CLICK);}
#else
        cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_PLUS_CLICK);
#endif
    }
    else
    {
      senspar.press_auto = false;
      clean(&keys.keys_stack);
      if(senspar.pressure < 990)
        {
          temp_press = (s32)senspar.pressure;
           temp_press=temp_press+ 10 - (temp_press%10);
           senspar.pressure = (float)temp_press;
          wright_data_to_cam(GET_PRESSURE_DATA, senspar.pressure);
        }
    }
    break;
    
         
    case KEY_PRESSURE_MINUS:
    if(0x08&spi_sets.silar_state)  
    {
#ifndef ENCODER2_IS_UP     
      if(net_sets.net_encoder_1)    {  cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_ENCODER2_MINUS);}
      else                          { cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_MINUS_CLICK);}
#else 
      cWRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_MINUS_CLICK);
#endif
    }
    else
    {
      clean(&keys.keys_stack);
      senspar.press_auto = false;
      if(senspar.pressure > 200)
        {
          temp_press = (s32)senspar.pressure;
          temp_press = temp_press -10 - (temp_press%10);
          senspar.pressure = (float)temp_press;
          wright_data_to_cam(GET_PRESSURE_DATA, senspar.pressure);
        }
    }
    break;
    
     case NO_ACTION:
      clean(&keys.keys_stack);
     break;
     
     default:
    if(0x08&spi_sets.silar_state)  {WRIGHT_SPI_REG(COMMAND_REG_ADDR, KEY_ENTER_CLICK);}
    else
    {
      WRIGHT_SPI_REG(COMMAND_REG_ADDR, key_code);
      spi_sets.current_function = key_code;
    }       
     break;  
   }
  }
}


void keys_analis_P_O()
{
  #ifdef TNM_MODE
  u8 i, key_code;
    if(!get_empty(&keys.keys_stack))
  {
   key_code = pop(&keys.keys_stack);//keys.buffer[i];
   if(error_counter==0) clean(&keys.keys_stack);
   switch(key_code)
   {
    case KEY_EOC_BRIGHTNES_MINUS:

      if(eoc_brightnes_value>EOC_BRIGHTNES_MIN)        
      {
        eoc_brightnes_value--;
        digital_resist_send_function(eoc_brightnes_value);
      }
      if(led_pulse_enable)
      {
       if(led_brightnes<=LED_BRIGHTNES_MAX)
       {
        led_brightnes = led_brightnes|(led_brightnes<<1);
        
       }
      }
 
    break;

    case KEY_EOC_BRIGHTNES_PLUS:
      if(eoc_brightnes_value<EOC_BRIGHTNES_MAX)
      {
      eoc_brightnes_value++;      
      digital_resist_send_function(eoc_brightnes_value); 
      }
      if(led_pulse_enable)
      {
       if(led_brightnes>=LED_BRIGHTNES_MIN)
       {
        led_brightnes = led_brightnes&(led_brightnes>>1);
        
       }
      }
      
    break;
   }
  }
#endif  
}

#endif