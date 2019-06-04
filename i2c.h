/**
 * @file   i2c.h
 * @date   21 июля 2013 г.
 * @author
 * @brief  i2c
 */

#ifndef I2C_H_
#define I2C_H_

#include "hal_types.h"
#include "stm32l1xx_i2c.h"
#include "I2CRoutines.h"

void i2c_init(void);
bool i2c_open(uint8_t i2c_id);
void i2c_close(uint8_t i2c_id);

bool i2c_ReadReg(I2C_TypeDef* I2Cx,
                 uint8_t SlaveAddress,
                 uint8_t      reg,
                 uint8_t* pBuffer,
                 uint32_t NumByteToRead);

bool i2c_WriteReg(I2C_TypeDef* I2Cx,
                  uint8_t SlaveAddress,
                  uint8_t      reg,
                  uint8_t* pBuffer,
                  uint32_t NumByteToWrite);


#endif /* I2C_H_ */
