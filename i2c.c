/**
 * @file   i2c.c
 * @date   21 èşëÿ 2013 ã.
 * @author
 * @brief  i2c
 */
#include "hal_types.h"
#include "i2c.h"
#include "hal_critical_section.h"

uint8_t Buffer_Rx1[16]; /* Buffer of data to be received by I2C1 */
uint8_t Buffer_Tx1[16]; /* Buffer of data to be transmitted by I2C1 */
uint8_t Buffer_Rx2[16]; /* Buffer of data to be received by I2C2 */
uint8_t Buffer_Tx2[16]; /* Buffer of data to be transmitted by I2C2 */
extern __IO uint8_t Tx_Idx1 , Rx_Idx1;
extern __IO uint8_t Tx_Idx2 , Rx_Idx2;


extern DMA_InitTypeDef  I2CDMA_InitStructure;
extern __IO uint32_t I2CDirection;
extern __IO uint32_t NumbOfBytes1;
extern __IO uint32_t NumbOfBytes2;
extern __IO uint8_t Address;

static bool is_opened[2];

void i2c_init(void)
{
#ifndef TNM_MODE
  I2C_LowLevel_Init(I2C1);
  NVIC_SetPriority(I2C1_EV_IRQn, 0x00);
  NVIC_EnableIRQ(I2C1_EV_IRQn);
  NVIC_SetPriority(I2C1_ER_IRQn, 0x01);
  NVIC_EnableIRQ(I2C1_ER_IRQn);
#endif
  I2C_LowLevel_Init(I2C2);
  NVIC_PriorityGroupConfig(NVIC_PriorityGroup_4);

  NVIC_SetPriority(I2C2_EV_IRQn, 0x00);
  NVIC_EnableIRQ(I2C2_EV_IRQn);
  NVIC_SetPriority(I2C2_ER_IRQn, 0x01);
  NVIC_EnableIRQ(I2C2_ER_IRQn);
  is_opened[0] = false;
  is_opened[1] = false;
}

bool i2c_open(uint8_t i2c_id)
{
  bool retval = false;
  i2c_id--;
  enter_critical_section();
  if(!is_opened[i2c_id])
  {
    is_opened[i2c_id] = true;
    retval = true;
  }
  exit_critical_section();
  return (retval);
}

void i2c_close (uint8_t i2c_id)
{
  i2c_id--;
  enter_critical_section();
  is_opened[i2c_id] = false;
  exit_critical_section();
}


bool i2c_ReadReg(I2C_TypeDef* I2Cx,
                    uint8_t SlaveAddress,
                    uint8_t      reg,
                    uint8_t* pBuffer,
                    uint32_t NumByteToRead)
{
    __IO uint32_t temp = 0;
    __IO uint32_t Timeout = 0;
    Timeout = 0xFFFF;
        /* Send START condition */
        I2Cx->CR1 |= CR1_START_Set;
        /* Wait until SB flag is set: EV5 */
        while ((I2Cx->SR1&0x0001) != 0x0001)
        {
            if (Timeout-- == 0)
                return false;
        }

        /* Send slave address */
        /* Reset the address bit0 for write*/
        SlaveAddress &= OAR1_ADD0_Reset;
        Address = SlaveAddress;
        /* Send the slave address */
        I2Cx->DR = Address;
        Timeout = 0xFFFF;
        /* Wait until ADDR is set: EV6 */
        while ((I2Cx->SR1 &0x0002) != 0x0002)
        {
            if (Timeout-- == 0)
                return false;
        }
        /* Clear ADDR flag by reading SR2 register */
        temp = I2Cx->SR2;
        /* Write the register address in DR register (EV8_1) */
        if(NumByteToRead > 1)
        {
          reg |= 0x80;
        }
        I2Cx->DR = reg;
        /* EV8_2: Wait until BTF is set before programming the STOP */
        while ((I2Cx->SR1 & 0x00004) != 0x000004);
        if (NumByteToRead == 1)
        {
            Timeout = 0xFFFF;
            /* Send START condition */
            I2Cx->CR1 |= CR1_START_Set;
            /* Wait until SB flag is set: EV5  */
            while ((I2Cx->SR1&0x0001) != 0x0001)
            {
                if (Timeout-- == 0)
                    return false;
            }
            /* Send slave address */
            /* Reset the address bit0 for read */
            SlaveAddress |= OAR1_ADD0_Set;
            Address = SlaveAddress;
            /* Send the slave address */
            I2Cx->DR = Address;
            /* Wait until ADDR is set: EV6_3, then program ACK = 0, clear ADDR
            and program the STOP just after ADDR is cleared. The EV6_3
            software sequence must complete before the current byte end of transfer.*/
            /* Wait until ADDR is set */
            Timeout = 0xFFFF;
            while ((I2Cx->SR1&0x0002) != 0x0002)
            {
                if (Timeout-- == 0)
                    return false;
            }
            /* Clear ACK bit */
            I2Cx->CR1 &= CR1_ACK_Reset;
            /* Disable all active IRQs around ADDR clearing and STOP programming because the EV6_3
            software sequence must complete before the current byte end of transfer */
            __disable_irq();
            /* Clear ADDR flag */
            temp = I2Cx->SR2;
            /* Program the STOP */
            I2Cx->CR1 |= CR1_STOP_Set;
            /* Re-enable IRQs */
            __enable_irq();
            /* Wait until a data is received in DR register (RXNE = 1) EV7 */
            while ((I2Cx->SR1 & 0x00040) != 0x000040);
            /* Read the data */
            *pBuffer = I2Cx->DR;
            /* Make sure that the STOP bit is cleared by Hardware before CR1 write access */
            while ((I2Cx->CR1&0x200) == 0x200);
            /* Enable Acknowledgement to be ready for another reception */
            I2Cx->CR1 |= CR1_ACK_Set;

        }

        else if (NumByteToRead == 2)
        {
            /* Set POS bit */
            I2Cx->CR1 |= CR1_POS_Set;
            Timeout = 0xFFFF;
            /* Send START condition */
            I2Cx->CR1 |= CR1_START_Set;
            /* Wait until SB flag is set: EV5 */
            while ((I2Cx->SR1&0x0001) != 0x0001)
            {
                if (Timeout-- == 0)
                    return false;
            }
            Timeout = 0xFFFF;
            /* Send slave address */
            /* Set the address bit0 for read */
            SlaveAddress |= OAR1_ADD0_Set;
            Address = SlaveAddress;
            /* Send the slave address */
            I2Cx->DR = Address;
            /* Wait until ADDR is set: EV6 */
            while ((I2Cx->SR1&0x0002) != 0x0002)
            {
                if (Timeout-- == 0)
                    return false;
            }
            /* EV6_1: The acknowledge disable should be done just after EV6,
            that is after ADDR is cleared, so disable all active IRQs around ADDR clearing and
            ACK clearing */
            __disable_irq();
            /* Clear ADDR by reading SR2 register  */
            temp = I2Cx->SR2;
            /* Clear ACK */
            I2Cx->CR1 &= CR1_ACK_Reset;
            /*Re-enable IRQs */
            __enable_irq();
            /* Wait until BTF is set */
            while ((I2Cx->SR1 & 0x00004) != 0x000004);
            /* Disable IRQs around STOP programming and data reading because of the limitation ?*/
            __disable_irq();
            /* Program the STOP */
            I2C_GenerateSTOP(I2Cx, ENABLE);
            /* Read first data */
            *pBuffer = I2Cx->DR;
            /* Re-enable IRQs */
            __enable_irq();
            /**/
            pBuffer++;
            /* Read second data */
            *pBuffer = I2Cx->DR;
            /* Make sure that the STOP bit is cleared by Hardware before CR1 write access */
            while ((I2Cx->CR1&0x200) == 0x200);
            /* Enable Acknowledgement to be ready for another reception */
            I2Cx->CR1  |= CR1_ACK_Set;
            /* Clear POS bit */
            I2Cx->CR1  &= CR1_POS_Reset;

        }

        else

        {

            Timeout = 0xFFFF;
            /* Send START condition */
            I2Cx->CR1 |= CR1_START_Set;
            /* Wait until SB flag is set: EV5 */
            while ((I2Cx->SR1&0x0001) != 0x0001)
            {
                if (Timeout-- == 0)
                    return false;
            }
            Timeout = 0xFFFF;
            /* Send slave address */
            /* Reset the address bit0 for write */
            SlaveAddress |= OAR1_ADD0_Set;;
            Address = SlaveAddress;
            /* Send the slave address */
            I2Cx->DR = Address;
            /* Wait until ADDR is set: EV6 */
            while ((I2Cx->SR1&0x0002) != 0x0002)
            {
                if (Timeout-- == 0)
                    return false;
            }
            /* Clear ADDR by reading SR2 status register */
            temp = I2Cx->SR2;
            /* While there is data to be read */
            while (NumByteToRead)
            {
                /* Receive bytes from first byte until byte N-3 */
                if (NumByteToRead != 3)
                {
                    /* Poll on BTF to receive data because in polling mode we can not guarantee the
                    EV7 software sequence is managed before the current byte transfer completes */
                    while ((I2Cx->SR1 & 0x00004) != 0x000004);
                    /* Read data */
                    *pBuffer = I2Cx->DR;
                    /* */
                    pBuffer++;
                    /* Decrement the read bytes counter */
                    NumByteToRead--;
                }

                /* it remains to read three data: data N-2, data N-1, Data N */
                if (NumByteToRead == 3)
                {

                    /* Wait until BTF is set: Data N-2 in DR and data N -1 in shift register */
                    while ((I2Cx->SR1 & 0x00004) != 0x000004);
                    /* Clear ACK */
                    I2Cx->CR1 &= CR1_ACK_Reset;

                    /* Disable IRQs around data reading and STOP programming because of the
                    limitation ? */
                    __disable_irq();
                    /* Read Data N-2 */
                    *pBuffer = I2Cx->DR;
                    /* Increment */
                    pBuffer++;
                    /* Program the STOP */
                    I2Cx->CR1 |= CR1_STOP_Set;
                    /* Read DataN-1 */
                    *pBuffer = I2Cx->DR;
                    /* Re-enable IRQs */
                    __enable_irq();
                    /* Increment */
                    pBuffer++;
                    /* Wait until RXNE is set (DR contains the last data) */
                    while ((I2Cx->SR1 & 0x00040) != 0x000040);
                    /* Read DataN */
                    *pBuffer = I2Cx->DR;
                    /* Reset the number of bytes to be read by master */
                    NumByteToRead = 0;

                }
            }
            /* Make sure that the STOP bit is cleared by Hardware before CR1 write access */
            while ((I2Cx->CR1&0x200) == 0x200);
            /* Enable Acknowledgement to be ready for another reception */
            I2Cx->CR1 |= CR1_ACK_Set;

        }

  return true;
}

bool i2c_WriteReg(I2C_TypeDef* I2Cx, uint8_t SlaveAddress, uint8_t reg, uint8_t* pBuffer, uint32_t NumByteToWrite)
{
    __IO uint32_t temp = 0;
    __IO uint32_t Timeout = 0xFFFF;
    //I2Cx->CR1 |= I2C_CR1_SWRST;
    /* Enable Error IT */
    I2Cx->CR2 |= I2C_IT_ERR;
    I2Cx->CR1 |= CR1_START_Set;/* Send START condition */
    while ((I2Cx->SR1&0x0001) != 0x0001)/* Wait until SB flag is set: EV5 */
    {
      if (Timeout-- == 0)
        return false;
    }
    /* Send slave address */
    /* Reset the address bit0 for write*/
    SlaveAddress &= OAR1_ADD0_Reset;
    Address = SlaveAddress;
    /* Send the slave address */
    I2Cx->DR = Address;
    Timeout = 0xFFFF;
    /* Wait until ADDR is set: EV6 */
    while ((I2Cx->SR1 &0x0002) != 0x0002)
    {
      if (Timeout-- == 0)
        return false;
    }

    temp = I2Cx->SR2;      /* Clear ADDR flag by reading SR2 register */
    I2Cx->DR = reg;   /* Write the first data in DR register (EV8_1) */
    while (NumByteToWrite--)       /* While there is data to be written */
    { /* Poll on BTF to receive data because in polling mode we can not guarantee the
         EV8 software sequence is managed before the current byte transfer completes */
      while ((I2Cx->SR1 & 0x00004) != 0x000004);

            I2Cx->DR = *pBuffer;            /* Send the current byte */
            pBuffer++;                      /* Point to the next byte to be written */
    }
    while ((I2Cx->SR1 & 0x00004) != 0x000004); /* EV8_2: Wait until BTF is set before programming the STOP */
    I2Cx->CR1 |= CR1_STOP_Set;                 /* Send STOP condition */
    while ((I2Cx->CR1&0x200) == 0x200);        /* Make sure that the STOP bit is cleared by Hardware */
    return true;
}

