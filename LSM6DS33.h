
#include "stm32l1xx_i2c.h"
#include "stm32l1xx_syscfg.h"
#include "stm32l1xx_rcc.h"

//########   LSM6DS33 MAIN INIT COSNTANTS  #####################################
#ifndef TNM_MODE
#define LSM6DS33_I2C   I2C1
#else
#define LSM6DS33_I2C   I2C1
#endif
#define LSM6DS33_ADRESS  0xD7
#define LSM6DS33_PERIOD  100



//########   LSM6DS33  REGISTERS   #############################################
#define FUNC_CFG_ACCESS            0x01
#define FIFO_CTRL1                 0x06
#define FIFO_CTRL2                 0x07
#define FIFO_CTRL3                 0x08
#define FIFO_CTRL4                 0x09
#define FIFO_CTRL5                 0x0A
#define ORIENT_CFG_G               0x0B
#define INT1_CTRL                  0x0D
#define INT2_CTRL                  0x0E
#define WHO_AM_I                   0x0F
#define CTRL1_XL                   0x10
#define CTRL2_G                    0x11
#define CTRL3_C                    0x12
#define CTRL4_C                    0x13
#define CTRL5_C                    0x14
#define CTRL6_C                    0x15
#define CTRL7_G                    0x16
#define CTRL8_XL                   0x17
#define CTRL9_XL                   0x18
#define CTRL10_C                   0x19
#define WAKE_UP_SRC                0x1B
#define TAP_SRC                    0x1C
#define D6D_SRC                    0x1D
#define STATUS_REG                 0x1E
#define OUT_TEMP_L                 0x20
#define OUT_TEMP_H                 0x21
#define OUTX_L_G                   0x22
#define OUTX_H_G                   0x23
#define OUTY_L_G                   0x24
#define OUTY_H_G                   0x25
#define OUTZ_L_G                   0x26
#define OUTZ_H_G                   0x27
#define OUTX_L_XL                  0x28
#define OUTX_H_XL                  0x29
#define OUTY_L_XL                  0x2A
#define OUTY_H_XL                  0x2B
#define OUTZ_L_XL                  0x2C
#define OUTZ_H_XL                  0x2D
#define FIFO_STATUS1               0x3A
#define FIFO_STATUS2               0x3B
#define FIFO_STATUS3               0x3C
#define FIFO_STATUS4               0x3D
#define FIFO_DATA_OUT_L            0x3E
#define FIFO_DATA_OUT_H            0x3F
#define TIMESTAMP0_REG             0x40
#define TIMESTAMP1_REG             0x41
#define TIMESTAMP2_REG             0x42
#define STEP_TIMESTAMP_L           0x49
#define STEP_TIMESTAMP_H           0x4A
#define STEP_COUNTER_L             0x4B
#define STEP_COUNTER_H             0x4C
#define FUNC_SRC                   0x53
#define TAP_CFG                    0x58
#define TAP_THS_6D                 0x59
#define INT_DUR2                   0x5A
#define WAKE_UP_THS                0x5B
#define WAKE_UP_DUR                0x5C
#define FREE_FALL                  0x5D
#define MD1_CFG                    0x5E
#define MD2_CFG                    0x5F

//############## CTRL1XL REGISTER VALUE ########################################
#define ODRXLSHDN   0x00
#define ODRXL13     0x10
#define ODRXL26     0x20
#define ODRXL52     0x30
#define ODRXL104    0x40
#define ODRXL208    0x50
#define ODRXL416    0x60
#define ODRXL833    0x70
#define ODRXL1_66K  0x80
#define ODRXL3_33K  0x90
#define ODRXL6_66K  0xA0

#define FSXL2G      0x00
#define FSXL16G     0x04
#define FSXL4G      0x08
#define FSXL8G      0x0C

#define BWXL400HZ   0x00
#define BWXL200HZ   0x01
#define BWXL100HZ   0x02
#define BWXL050HZ   0x03

//################ STATUS REGISTER VALUE #######################################
#define XLDA 0x01
#define GDA  0x02
#define TDA  0x04

//#########   START-STOP I2C ###################################################
#define I2C1_BEGIN     if(false == i2c_open(1)) return 0; else do
#define I2C1_COMPLETE  while(0);   i2c_close(1);

//#########   DATA STRUCTS    ##################################################
typedef struct
{
 u8 status;
 s16 temperature;
 bool temp_ready;
 s16 accelerometer_x;
 s16 accelerometer_y;
 s16 accelerometer_z;
 bool accel_ready;
 //s16 inclinate;
 //s16 declinate;
 bool turnover;
 u16 gyroscope_x;
 u16 gyroscope_y;
 u16 gyroxcope_z;
 bool gyro_ready;
}LSM6DS33_data;



//#########   DEFINE EXTERN DATAS ##############################################
extern LSM6DS33_data LSM6DS33_out_data;


//######## GYROSKOP TASKS ######################################################
void LSM6DS33_tasks();


//#########   DRIVER FUNCTION ##################################################
void LSM6DS33_wright_data_word(u16 word,u8 addr);
u16  LSM6DS33_read_data_word(u8 addr);

//######### MAIN FUNCTIONS   ###################################################

void LSM6DS33_congig();

void LSM6DS33_read_accelerometer();
void LSM6DS33_read_gyroscope();
void LSM6DS33_read_temperature();
uint8_t LSM6DS33_get_status();
