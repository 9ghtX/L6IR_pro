#ifdef TNM_MODE
#include "digital_resist.h"
//#include "i2c.h"
//#include "stm32l1xx_hal.h"


void dital_resist_ini()
{


}

void digital_resist_send_function(u8 value)
{
  u8 send_data = value*31;
  //DP[0] = value*32;
  i2c_WriteReg(I2C2, DIGITAL_RESIST_ADRESS|WRIGHT_FLAG, WRIGHT_REG_ADR, &send_data, 1);
  //uint8_t DP[1] = value; 
  //HAL_I2C_Mem_Write(&hi2c1, 0xA0, 0x10, I2C_MEMADD_SIZE_8BIT, DP, 1, 100);
}
#endif
