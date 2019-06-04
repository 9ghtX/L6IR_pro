#include "LSM6DS33.h"

LSM6DS33_data LSM6DS33_out_data;

//#########     TASK MANAGER ###################################################
void LSM6DS33_tasks()
{
 LSM6DS33_out_data.status = LSM6DS33_get_status();
 if(LSM6DS33_out_data.status&XLDA) 
 {
   LSM6DS33_out_data.accelerometer_x = LSM6DS33_read_data_word(OUTX_L_XL);
   LSM6DS33_out_data.accelerometer_y = LSM6DS33_read_data_word(OUTY_L_XL);
   LSM6DS33_out_data.accelerometer_z = LSM6DS33_read_data_word(OUTZ_L_XL);
   LSM6DS33_out_data.accel_ready = true;
   LSM6DS33_out_data.status &=~XLDA;
 }
 
 if(LSM6DS33_out_data.status&TDA)
   {
    LSM6DS33_out_data.temperature = ((LSM6DS33_read_data_word(OUT_TEMP_L))>>4);
    LSM6DS33_out_data.temp_ready = true;
    LSM6DS33_out_data.status&=~TDA;
   }
}

//#########   DRIVER FUNCTION ##################################################
void LSM6DS33_wright_data_word(u16 word, u8 addr)
{
 
}

u16  LSM6DS33_read_data_word(u8 addr)
{
 u16 word =0;
 u8*data;
 data = (u8*)(&word);
 i2c_ReadReg(LSM6DS33_I2C, LSM6DS33_ADRESS, addr, data, 1);
 data++;
 addr++;
 i2c_ReadReg(LSM6DS33_I2C, LSM6DS33_ADRESS, addr, data, 1);

 return word;
}

//######### MAIN FUNCTIONS   ###################################################

void LSM6DS33_congig()
{
 u8 wright_reg;
 
 wright_reg = ODRXL13|FSXL2G|BWXL400HZ; 
 i2c_WriteReg(LSM6DS33_I2C, LSM6DS33_ADRESS, CTRL1_XL, &wright_reg, 1);

 
}

void LSM6DS33_read_accelerometer()
{


}


void LSM6DS33_read_gyroscope()
{


}


void LSM6DS33_read_temperature()
{

}

uint8_t LSM6DS33_get_status()
{
  u8 status_reg;
 i2c_ReadReg(LSM6DS33_I2C, LSM6DS33_ADRESS, STATUS_REG, &status_reg, 1);
 return status_reg;
}