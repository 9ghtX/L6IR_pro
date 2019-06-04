/**
 * @file   lps331ap_driver.c
 * @date   14 рту. 2013 у.
 * @author
 * @brief  lps331aptrdriver
 */

#include <math.h>
#include "lps331ap_driver.h"
#include "hal_mcu.h"
#include "hal_critical_section.h"
#include "i2c.h"
//#include "debug.h"

void LPS331AP_I2C_Init(void)
{
  //already initialized
}

//void LPS331AP_INT1_Config(void);
void LPS331AP_Config(LPS331AP_ConfigTypeDef *LPS331AP_Config_Struct)
{
  uint8_t tmpreg;
  tmpreg = (uint8_t)( (uint8_t)LPS331AP_Config_Struct->Power            +
                      (uint8_t)LPS331AP_Config_Struct->Output_Data_Rate +
                      (uint8_t)LPS331AP_Config_Struct->Data_Update      +
                      (uint8_t)LPS331AP_Config_Struct->DeltaEnabled       );
  LPS331AP_Write(&tmpreg, LPS331AP_CTRL_REG1_ADDR, 1);
}


void LPS331AP_PowerDown_Cmd(FunctionalState NewState)
{
  uint8_t tmpreg = 0x00;
  LPS331AP_Read(&tmpreg, LPS331AP_CTRL_REG1_ADDR, 1);
  if(NewState==DISABLE)
  {
    tmpreg |= LPS331AP_CTRL_REG1_POWER_ACTIVE_MODE;
  }
  else
  {
    tmpreg &= ~(LPS331AP_CTRL_REG1_POWER_ACTIVE_MODE);;
  }
  LPS331AP_Write(&tmpreg, LPS331AP_CTRL_REG1_ADDR, 1);
}
void LPS331AP_Reboot_Cmd(void)
{
  uint8_t tmpreg = LPS331AP_CTRL_REG2_REBOOT_MEMORY;
  LPS331AP_Write(&tmpreg, LPS331AP_CTRL_REG2_ADDR, 1);
}

void LPS331AP_Set_Reference(uint32_t refvalue)
{
  uint16_t temp;
  uint8_t  tempbuffer[3];
  temp = (uint32_t) (refvalue/P_Conversion);
  tempbuffer[0] = (uint8_t) (temp);     //low part
  tempbuffer[1] = (uint8_t) (temp>>8);  //mid part
  tempbuffer[2] = (uint8_t) (temp>>16); //high part
  LPS331AP_Write(&tempbuffer[0], LPS331AP_REF_P_XL_ADDR, 3);
}

void LPS331AP_Get_Altitude(float* altitude)
{
  uint8_t temp[3]={0,0,0};
  uint32_t press_temp = 0;
  uint32_t press_value = 0;
  LPS331AP_Read_Pressure_Regs(&temp[0]);
  press_temp = (((uint32_t)temp[2])<<16) + (((uint32_t)temp[1])<<8) + ((uint32_t)(temp[0]));
  press_value = (uint32_t)(press_temp/P_Conversion);
  *altitude =   (uint32_t) (H_p)*(log(P_0/press_value));
}

void LPS331AP_Get_Pressure(float* pressure)
{
  uint32_t press_temp = 0;
  LPS331AP_Get_Raw_Pressure(&press_temp);
  *pressure = (float)press_temp / 4096.0 * 0.75;
 // *pressure = (uint32_t)(press_temp)/P_Conversion;
}

void LPS331AP_Get_Raw_Pressure(uint32_t* pressure)
{
  uint8_t  temp[3]={0,0,0};
  uint32_t press_temp = 0;
  LPS331AP_Read(&temp[0], LPS331AP_PRESS_POUT_XL_REH_ADDR, 1);
  LPS331AP_Read(&temp[1], LPS331AP_PRESS_OUT_L_ADDR, 1);
  LPS331AP_Read(&temp[2], LPS331AP_PRESS_OUT_H_ADDR, 1);
  press_temp = (((uint32_t)temp[2])<<16) + (((uint32_t)temp[1])<<8) + (((uint32_t)(temp[0])));
  *pressure = (uint32_t)(press_temp);
}

void LPS331AP_Get_Temperature(float* temperature)
{
  uint8_t temp[2]={0,0};
  int16_t temp_value = 0;
  LPS331AP_Read(&temp[0], LPS331AP_TEMP_OUT_L_ADDR, 1);
  LPS331AP_Read(&temp[1], LPS331AP_TEMP_OUT_H_ADDR, 1);
  temp_value = (int16_t)((((uint16_t)temp[1])<<8) + ((uint16_t)(temp[0])));
  *temperature = 42.5 + (temp_value/480.0);
}


void LPS331AP_Read(uint8_t* pBuffer, uint8_t ReadAddr, uint8_t NumByteToRead)
{
  bool result = i2c_ReadReg(LPS331AP_I2C, LPS331AP_DEVICE_ADDRESS, ReadAddr, pBuffer, NumByteToRead);
  //if(false == result) DBG("LPS331AP_Read error\n");
}


void LPS331AP_Write(uint8_t* pBuffer, uint8_t WriteAddr, uint8_t NumByteToWrite)
{
 bool result = i2c_WriteReg(LPS331AP_I2C, LPS331AP_DEVICE_ADDRESS, WriteAddr, pBuffer, NumByteToWrite);
 //if(false == result) DBG("LPS331AP_Write error\n");
}