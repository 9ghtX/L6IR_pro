/**
 * @file   A3G4250D_driver.c
 * @date   14 рту. 2013 у.
 * @author
 * @brief  A3G4250D_driver
 */

#include "hal_mcu.h"
#include "A3G4250D_driver.h"
#include "i2c.h"
//#include "debug.h"

#define I2C_LINE    I2C1
#define I2C_ADDRESS 0xD3

bool A3G4250D_WriteReg(uint8_t reg, uint8_t  data){ return (i2c_WriteReg(I2C_LINE,I2C_ADDRESS, reg, &data, 1)); }
bool A3G4250D_ReadReg (uint8_t reg, uint8_t* data){ return (i2c_ReadReg(I2C_LINE,I2C_ADDRESS, reg, data, 1)); }


void A3G4250D_I2C_Init(void);
void A3G4250D_INT1_Config(A3G4250D_IntConfigTypeDef* A3G4250D_IntConfig);




void A3G4250D_I2C_Init(void){}

void A3G4250D_Config(A3G4250D_ConfigTypeDef *A3G4250D_Config, A3G4250D_config4 *A3G4250D_Cfg4)
{
  uint8_t regval = ( (uint8_t)(A3G4250D_Config->power) +
                     (uint8_t)(A3G4250D_Config->odr)   +
                      (A3G4250D_Config->axis) );
  A3G4250D_WriteReg(A3G4250D_CTRL_REG1,regval);
  regval = A3G4250D_Cfg4->self_test;
    A3G4250D_WriteReg(A3G4250D_CTRL_REG4,regval);

}

void A3G4250D_FilterConfig(A3G4250D_FilterConfigTypeDef* A3G4250D_FilterConfig)
{
  uint8_t regval = (uint8_t)A3G4250D_FilterConfig->filter_cutoff +
                   (uint8_t)A3G4250D_FilterConfig->filter_mode;

  A3G4250D_WriteReg(A3G4250D_CTRL_REG2,regval);
}

void A3G4250D_FifoConfig(A3G4250D_FifoConfigTypeDef* A3G4250D_FilterConfig)
{
  uint8_t regval = (uint8_t)A3G4250D_FilterConfig->fifo_mode +
                   (uint8_t)A3G4250D_FilterConfig->fifo_wm;
  A3G4250D_WriteReg(A3G4250D_CTRL_REG3,regval);
}








