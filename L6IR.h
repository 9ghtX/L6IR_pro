#ifndef L6IR_H
#define L6IR_H


#include "stm32l1xx_syscfg.h"
#include "stm32l1xx_rcc.h"
#include "stm32l1xx_usart.h"
#include "stm32l1xx_adc.h"
#include "buffer.h"

#ifdef A3G4250D
#include <a3g4250d.h>
#include <a3g4250d_driver.h>
#endif

//#ifdef LPS331AP
#include "lps331ap.h"
#include "lps331ap_driver.h"
//#endif


/*#############################################################################
                    MAIN CONSTANTS

##############################################################################*/
#define NO_DELAY    0
#define SECOND_0_2  200
#define SECOND_1    1000
#define SECOND_2    2000
#define SECOND_3    3000
#define SECOND_4    4000
#define SECOND_5    5000
#define SECOND_6    6000
#define SECOND_7    7000
#define SECOND_8    8000
#define SECOND_9    9000
#define SECOND_10    10000
#define SECOND_11    11000
#define SECOND_12    12000
#define SECOND_15    15000
#define SECOND_20    20000
#define SECOND_40    40000

#define ZOOM_TRESHOLD  0.00021

/*##############################################################################
                   Default configurations
##############################################################################*/
#define PT9_2ENCODER_CONFIG     0x00008001
#define PT9_2ENCODER_CU_CONFIG  0x00008201
#define PT9_2ENCODER_B_CONFIG   0x00008011
#define PT9_2ENCODER_M_CONFIG   0x0000A001
#define PT9_1ENCODER_CONFIG     0x00004001
#define PT9_1ENCODER_E_CONFIG   0x00004041
#define PT9_1ENCODER_M_CONFIG   0x00006001
#define PT9_1ENCODER_ME_CONFIG  0x00006041
#define PT9_1ENCODER_BME_CONFIG 0x00005051
#define PT6_CONFIG              0x00003F11   
#define PT6_AB_CONFIG           0x00001F11 
#define PT6_R_CONFIG            0x00003F01    
#define TNV_CONFIG              0x00004003   
#define TNV_CU_CONFIG           0x00004203   
#define PT2_CONFIG              0x00000302
#define SWIR_CONFIG             0x00008021
#define SWIR_M_CONFIG           0x0000A021
#define SWIR_BM_CONFIG          0x0000A031
#define SWIR_BME_CONFIG         0x00009071
#define SWIR_N_EXPO_CONFIG      0x00008001
#define TNM_CONFIG              0x00034002
#define TNP_CONFIG              0x00034001

#ifdef  PT7_MODE
#ifdef  METEO
#define DEFAULT_CONFIG PT9_1ENCODER_M_CONFIG
#else
#define DEFAULT_CONFIG PT9_1ENCODER_CONFIG//PT9_1ENCODER_CONFIG
#endif
#endif
#ifdef PT2_MODE
#ifdef  METEO
#define DEFAULT_CONFIG PT6_CONFIG
#else
#define DEFAULT_CONFIG PT2_CONFIG
#endif
#endif

#ifdef TNV_MODE
#define DEAULT_CONFIG TNV_CONFIG
#endif

#define T_MODE              6
#define N_MODE              1
#define TN_MODE             2
#define N_MODE_DISP         3
#define N_MODE_IR           4
#define MODES_QUANT         5

#define CONFIG_RADIO_TEST      0x00000400
#define CONFIG_GPS_TEST        0x00000800
#define CONFIG_METEO_TEST      0x00003000
#define CONFIG_RANGE_TEST      0x00000100
#define CONFIG_GALINIC_TEST    0x00010000
#define CONFIG_EOC_TEST        0x00020000
#define CONFIG_CU_KEYS_TEST    0x00000100
#define CONFIG_BALL_TEST       0x00000010
#define CONFIG_EXPO_TEST       0x00000020
#define CONFIG_CAM_TYPE_TEST   0x00000007
#define CONFIG_TEMP_PRESS_TEST 0x00000040
#define TPABCmeteo             0x00001000
#define TPmeteo                0x00002000
#define TPCmeteo               0x00003000
#define CAM_IS_SIGHT         0x00000001
#define CAM_IS_MONOCULAR     0x00000002
#define CAM_IS_NOZZLE        0x00000003
#define CAM_IS_MEDICAL       0x00000004



/*#############################################################################
                    SPI commands and address space

##############################################################################*/


#define upCS_silar    GPIO_SetBits(GPIOB,GPIO_Pin_12)
#define downCS_silar  GPIO_ResetBits(GPIOB,GPIO_Pin_12)
#define Led_ON        GPIO_SetBits(GPIOA,GPIO_Pin_7)
#define Led_OFF	      GPIO_ResetBits(GPIOA,GPIO_Pin_7)
#define EOC_POWER_OFF GPIO_SetBits(GPIOA,GPIO_Pin_12)
#define EOC_POWER_ON  GPIO_ResetBits(GPIOA,GPIO_Pin_12)
#define CAM_POWER_ON GPIO_SetBits(GPIOA,GPIO_Pin_11)
#define CAM_POWER_OFF  GPIO_ResetBits(GPIOA,GPIO_Pin_11)
#define KEY1_SET      GPIO_SetBits(GPIOA,GPIO_Pin_15)
#define KEY1_RESET    GPIO_ResetBits(GPIOA,GPIO_Pin_15)
#define WRIGHT_COM    0x80
#define READ_COM      0x00
#define REDROW_SCREEN 0x80000000

#define READ_SYCHRO_TIME 100

#ifdef  TEST_MODE
//#define WRIGHT_SYCHRO_TIME 200
#else
#define WRIGHT_SYCHRO_TIME 0
#endif

#define MARK_CORRECT_PERIOD      100

#define MARK_0_ADDR              0x00
#define MARK_1_ADDR              0x01
#define MARK_2_ADDR              0x02
#define MARK_3_ADDR              0x03
#define MARK_4_ADDR              0x04
#define MARK_5_ADDR              0x05
#define MARK_6_ADDR              0x06
#define MARK_7_ADDR              0x07
#define MARK_8_ADDR              0x08
#define MARK_9_ADDR              0x09
#define MARK_10_ADDR             0x0A
#define MARK_11_ADDR             0x0B
#define MARK_12_ADDR             0x0C
#define MARK_13_ADDR             0x0D
#define MARK_14_ADDR             0x0E
#define MARK_15_ADDR             0x0F
#define MARK_16_ADDR             0x10

#define GRID_DINAMIC_ADDR        0x0F
#define GRID_STATIC_ADDR         0x10

#define FLASH_READING_ADDRES     0x11
#define CAMERA_STATE_ADDR        0x12

#define MARKS_BLOCK_REG_ADDR     0x13
#define TEMPERATURE_READ_ADDR    0x13
#define DISTANCE_ADDR            0x14
#define TEMPERATURE_WRIGHT_ADDR  0x15
#define PRESSURE_ADDR            0x16
#define INCLINATE_ADDR           0x17

#define COMMAND_REG_ADDR         0x1E
#define STATUS_REG_ADDR          0x20

#define SPI_OBJ_Q                35

//******************************************************************************
//        CAMERA COMMANDS
//******************************************************************************

#define KEY_PLUS_CLICK             1
#define KEY_MINUS_CLICK            2
#define KEY_ENTER_CLICK            3
#define KEY_PLUS_PRESS             5
#define KEY_MINUS_PRESS            6
#define KEY_ENTER_PRESS            7
#define KEY_ZOOM_PLUS              8
#define KEY_ZOOM_MINUS             9
#define KEY_MENU_CLICK             12
#define KEY_INVERSION_CLICK        14
#define KEY_PHOTO_CLICK            15
#define KEY_ENTER_SPECIAL_MENU     16
#define KEY_BRIGHTNES_MINUS        17
#define KEY_BRIGHTNES_PLUS         18
#define KEY_LEGIBILITY_MINUS       19 //Чёткость
#define KEY_LEGIBILITY_PLUS        20
#define KEY_PALETTE_MINUS          21
#define KEY_PALETTE_PLUS           22
#define KEY_POSITIVE               23
#define KEY_NEGATIVE               24

#define KEY_MARKS_BRIGHTNES_PLUS   25
#define KEY_MARKS_BRIGHTNES_MINUS  26
#define KEY_DISTANTS_PLUS          27
#define KEY_DISTANTS_MINUS         28


#define KEY_EOC_BRIGHTNES_PLUS     55
#define KEY_EOC_BRIGHTNES_MINUS    56
#define KEY_EXPOSSITION_PLUS       65 
#define KEY_EXPOSSITION_MINUS      66

#define KEY_TEMPERATURE_PLUS       252
#define KEY_TEMPERATURE_MINUS      253
#define KEY_PRESSURE_PLUS          254
#define KEY_PRESSURE_MINUS         255


#define COM_NO_SYMBOL_DISP         32
#define COM_BRIGHTNES_DISP         33
#define COM_ZOOM_DISP              34
#define COM_POS_NEG_DISP           35
#define COM_POLETTE_DISP           36
#define COM_LIGIBILITY_DISP        37
#define COM_EXPOSSITION_DISP       68


#define COM_MARKS_BRIGHTNES_DISP   38
#define COM_DISTANTS_DISP          39

#define COM_EOC_BRIGHTNES_DISP     40

#define TURNON_COMAND              41 // переворот меню
#define TURNOFF_COMAND             42

#define COM_TEMPERATURE_DISP       43
#define COM_PRESSURE_DISP          44

#define CAMERA_OFF_COMMAND         50
#define OLED_OFF_COMMAND           51
#define OLED_ON_COMMAND             52
#define VIDEO_OFF_COMMAND          53
#define VIDEO_ON_COMMAND           54
#define INFO_ON_COMMAND            57
#define INFO_OFF_COMMAND           58

#define COM_SET_EOC_BR_VALUE       0x003B0000
#define COM_SET_EXPOSIT_VALUE      0x00430000

//Порядок расоложения функций энкодеров и УУ в буфере
#define DISTANTS_FUNC_NUM          1  // Ввод дальности
#define BRIGHTNES_FUNC_NUM         2  // Ввод яркости экрана
#define ZOOM_FUNC_NUM              3  // Ввод зума
#define POS_NEG_FUNC_NUM           4  // Переключение позитив/негатив
#define POLETTE_FUNC_NUM           5  // Переключение палитр
#define LIGIBILITY_FUNC_NUM        6  // Ввод чёткости
#define MARKS_BRIGHTNES_FUNC_NUM   7  // Ввод яркости сеток
#define EOC_BRIGHTNES_FUNC_NUM     8  // Ввод яркости ЭОПа
#define EXPOSSITION_FUNC_NUM       9  // Ввод времени экспозиции
#define TEMP_ENTER_FUNC_NUM        10 // Ввод значения температуры
#define PRESS_ENTER_FUNC_NUM       11 // Ввод значения давления

#define NO_ACTION               99

#define AUTO_MARK_MOVENG_BLOCK  0x01
#define AITO_DIST_ENTER_BLOCK   0x02

#define YELLOW_COLOR              0x60000000
#define GREEN_COLOR               0x20000000
#define BLUE_COLOR                0x40000000
#define RED_COLOR                 0x00000000
#define INVISIBLE                 0x70000000

//#define KEY_M_PLUS_CLICK        16
//#define KEY_M_MINUS_CLICK       17
//#define KEY_M_ENTER_CLICK       18







typedef struct
{
 u8  adress;
 u32 read_data;
 u32 wright_data;
 u32 sinchro_count;
 u32 sinchro_time;
 u32 last_data;
 bool reg_for_wright;
 bool wright_enable;
 u8 error_count;
}spi_object;

typedef struct
{
 u8 spi_obj_q;
 u32 silar_status;
 u32 silar_state;
 u8  current_function;
 u32 read_sichro_count;
 u32 wright_sinchro_count;
 bool wright_enable;
 bool stat_read_enable;
 u8 read_status_zero_count;
}spi_def;

typedef enum
{
 setup =0, 
 rifle_scope=1,//прицел 
 monocular =2,//монокуляр
 thermal_head =3,//насадка
 medical =4//медкамера
}camera_state;

typedef struct
{
 uint16_t battery_ctrl;
 uint16_t temperature;
 uint16_t operator_photo;
}ADC_result;

typedef enum
{
 led_pulse =0,
 pulse_adc1 = 1,
 pulse_adc2 = 2,
 pulse_adc3 = 3,
 end_of_pulse =4,
 not_action =5
} operator_control_consist;

typedef enum
{
 display_on =0,
 display_off,
 display_make_on,
 display_make_off
}display_state;

extern display_state display_st;
typedef enum
{
 read =0,
 wright =1
}camera_operation;


typedef struct
{
camera_state cam_state;
bool ball_calculation;
u8 modify;
float obj_focus;
float  pix_size;
float  life_size_snail_val;
u16 composition;
u16 syncro_count;
u8  mark_quant;
u16 dist_mark[14];
u16 marks_offset[14];
u16 mark_addres[14];
}cam_settings;

extern cam_settings cam_sets;

typedef struct
{
 u32 identify;
 float bullet_V0;
 float bullet_m;
 float bullet_BC;
 float weapon_L0;
 float weapon_T0;
 float weapon_P0;
 float weapon_step;
 float weapon_H;
}cam_ballistic;
//extern cam_ballistic ballistics_buf[11];
#define FLASH_DATA_TAG            0xAA



typedef struct
{
 u32 reading_count;
 u32 data_quant;
 float obj_focus;
 float pix_size;
 u32 cam_type;
 cam_ballistic ballistics_buf[11];

 //float
} flash_memory;
extern flash_memory flash;


typedef struct
{
 float current_sens;
 float eye_photo_data;
 float eye_norn_data;
}
eye_sens_struct;
extern eye_sens_struct eye_sens_par;

extern spi_object spi_objects[SPI_OBJ_Q];
void spi_sichro_func();
void init_spi_objects();
void  sens_synchro_func();
void read_marks_state();


#define WRIGHT_SPI_REG(REG, DATA) {if(spi_objects[REG].wright_enable&&(!spi_objects[REG].wright_data)){pop(&keys.keys_stack); spi_objects[REG].wright_data = DATA;}}
#define cWRIGHT_SPI_REG(REG, DATA) {if(spi_objects[REG].wright_enable&&(!spi_objects[REG].wright_data)){clean(&keys.keys_stack); spi_objects[REG].wright_data = DATA;}}
#define vWRIGHT_SPI_REG(REG, DATA) {pop(&keys.keys_stack); spi_objects[REG].wright_data = DATA;}
/*#############################################################################*/
typedef struct
{
 u8 buffer[100];
 Buf_Head keys_stack;
 u8 quant;
}key_struct;

extern key_struct keys;

void GPIO_Configuration(void);
void NVIC_Configuration(void);
void timers_congig();
void UART_init();
void SPI_init_func();
void ADC_init_func();
//void  i2c_init();
void system_timer_init(void);
void UART_task();
void SPI_task();
void I2C_task();
void spi_silar_tasks();
u32 spi_silar_read(u8 addr);
void spi_silar_wright(u8 addr, u32 data);
void i2c_sensors_tasks();
void read_sets_from_CU();
void default_cam_sets();
void flash_reading_process();
void Power_control_func();
void mark_tasks();
void marks_syncro_func();
void wright_data_to_cam(u8,float);
void spi_read_camers_state();
void Operator_present_control();
void angles_calculate();
void turning_off_indicate();
void func_buffer_ini();
void set_device_mode(u8);
void redrow_menu_simbol();
void oled_control();
void default_flash_content();
//void EXTI_config(FunctionalState state, EXTITrigger_TypeDef type);
#endif

