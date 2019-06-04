#include <stm32l1xx.h>
#include "L6IR.h"
//#include  "spieeprom.h"
//#include "stm32lxx_exti.h"
#include "stm32l1xx_dma.h"

void GPIO_Configuration(void)
{
	/* Private typedef ---------------------------------------------------------*/
	GPIO_InitTypeDef GPIO_InitStruct;


	/*Enable or disable the AHB peripheral clock */
	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOB, ENABLE);
        RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOA , ENABLE);
//        RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA, ENABLE);
//        RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB, ENABLE);
        RCC_APB2PeriphClockCmd(RCC_APB2Periph_USART1, ENABLE);
        
        RCC_APB2PeriphClockCmd(RCC_APB2Periph_ADC1, ENABLE);
        RCC_AHBPeriphClockCmd(RCC_AHBPeriph_DMA1 , ENABLE );
        RCC_APB1PeriphClockCmd(RCC_APB1Periph_SPI2, ENABLE);
        RCC_APB1PeriphClockCmd(RCC_APB1Periph_I2C1, ENABLE);
        RCC_APB1PeriphClockCmd(RCC_APB1Periph_I2C2, ENABLE);
        RCC_HSICmd(ENABLE);

        //########## PORT A ###############################

        
       //****** ADC PINs ********** 
       GPIO_InitStruct.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_1 | GPIO_Pin_6;
       GPIO_InitStruct.GPIO_Mode = GPIO_Mode_AN;
       GPIO_InitStruct.GPIO_OType = GPIO_OType_PP;
       GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_NOPULL;
       GPIO_InitStruct.GPIO_Speed = GPIO_Speed_40MHz;
       GPIO_Init(GPIOA, &GPIO_InitStruct);
       
        //***** USART PINs **********
	/*Configure GPIO pin */
	GPIO_InitStruct.GPIO_Pin = GPIO_Pin_9|GPIO_Pin_10;
	GPIO_InitStruct.GPIO_Mode = GPIO_Mode_AF;
	GPIO_InitStruct.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_NOPULL;
	GPIO_InitStruct.GPIO_Speed = GPIO_Speed_40MHz;
	GPIO_Init(GPIOA, &GPIO_InitStruct);

	/*Configure GPIO pin alternate function */
	GPIO_PinAFConfig(GPIOA, GPIO_PinSource9, GPIO_AF_USART1);

	/*Configure GPIO pin alternate function */
	GPIO_PinAFConfig(GPIOA, GPIO_PinSource10, GPIO_AF_USART1);

        //*********** OUT PINs ***************
	/*Configure GPIO pin */
#ifdef TNM_MODE
        GPIO_InitStruct.GPIO_Pin = GPIO_Pin_11;
	GPIO_InitStruct.GPIO_Mode = GPIO_Mode_OUT;
	GPIO_InitStruct.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_DOWN;
	GPIO_InitStruct.GPIO_Speed = GPIO_Speed_40MHz;
	GPIO_Init(GPIOA, &GPIO_InitStruct);

        GPIO_InitStruct.GPIO_Pin = GPIO_Pin_12;
	GPIO_InitStruct.GPIO_Mode = GPIO_Mode_OUT;
	GPIO_InitStruct.GPIO_OType = GPIO_OType_OD;
	GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_NOPULL;
	GPIO_InitStruct.GPIO_Speed = GPIO_Speed_40MHz;
	GPIO_Init(GPIOA, &GPIO_InitStruct);
        
        GPIO_InitStruct.GPIO_Pin = GPIO_Pin_7|GPIO_Pin_8|GPIO_Pin_15;
#else
	GPIO_InitStruct.GPIO_Pin = GPIO_Pin_7|GPIO_Pin_8;
#endif
	GPIO_InitStruct.GPIO_Mode = GPIO_Mode_OUT;
	GPIO_InitStruct.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_NOPULL;
	GPIO_InitStruct.GPIO_Speed = GPIO_Speed_40MHz;
	GPIO_Init(GPIOA, &GPIO_InitStruct);

        //*********** IN PINs *****************
	GPIO_InitStruct.GPIO_Pin = GPIO_Pin_4|GPIO_Pin_3;//|GPIO_Pin_15;
	GPIO_InitStruct.GPIO_Mode = GPIO_Mode_IN;
	//GPIO_InitStruct.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_UP;
	GPIO_InitStruct.GPIO_Speed = GPIO_Speed_40MHz;
	GPIO_Init(GPIOA, &GPIO_InitStruct);

        
        //######## PORT B ##########################
	/*Configure GPIO pin */
    
        /*Configure IR led pin*/
        GPIO_InitStruct.GPIO_Pin = GPIO_Pin_5;
	GPIO_InitStruct.GPIO_Mode = GPIO_Mode_OUT;
	GPIO_InitStruct.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_NOPULL;
	GPIO_InitStruct.GPIO_Speed = GPIO_Speed_40MHz;
	GPIO_Init(GPIOB, &GPIO_InitStruct);
        
        GPIO_SetBits(GPIOB, GPIO_Pin_5);  /* указание начального состояния пина*/
        
	GPIO_InitStruct.GPIO_Pin = GPIO_Pin_6|GPIO_Pin_7;
	GPIO_InitStruct.GPIO_Mode = GPIO_Mode_AF;
	GPIO_InitStruct.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_NOPULL;
	GPIO_InitStruct.GPIO_Speed = GPIO_Speed_40MHz;
	GPIO_Init(GPIOB, &GPIO_InitStruct);

	/*Configure GPIO pin alternate function */
	GPIO_PinAFConfig(GPIOB, GPIO_PinSource6, GPIO_AF_I2C1);

	/*Configure GPIO pin alternate function */
	GPIO_PinAFConfig(GPIOB, GPIO_PinSource7, GPIO_AF_I2C1);


	/*Configure GPIO pin */
	GPIO_InitStruct.GPIO_Pin = GPIO_Pin_10;
	GPIO_InitStruct.GPIO_Mode = GPIO_Mode_AF;
	GPIO_InitStruct.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_NOPULL;
	GPIO_InitStruct.GPIO_Speed = GPIO_Speed_40MHz;
	GPIO_Init(GPIOB, &GPIO_InitStruct);
        
        GPIO_InitStruct.GPIO_Pin = GPIO_Pin_11;
	GPIO_InitStruct.GPIO_Mode = GPIO_Mode_AF;
	GPIO_InitStruct.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_NOPULL;
	GPIO_InitStruct.GPIO_Speed = GPIO_Speed_40MHz;
	GPIO_Init(GPIOB, &GPIO_InitStruct);

	/*Configure GPIO pin alternate function */
	GPIO_PinAFConfig(GPIOB, GPIO_PinSource10, GPIO_AF_I2C2); 

	/*Configure GPIO pin alternate function */
	GPIO_PinAFConfig(GPIOB, GPIO_PinSource11, GPIO_AF_I2C2);

	/** SPI2 GPIO Configuration	
		 PB13	 ------> SPI2_SCK
		 PB14	 ------> SPI2_MISO
                 PB15	 ------> SPI2_MOSI
	*/
	/*Configure GPIO pin */


       /* Configure SPI2 pins: SCK and MOSI */		//	MISO


        GPIO_InitStruct.GPIO_Pin = GPIO_Pin_13 | GPIO_Pin_15;//| GPIO_Pin_6 ;
	GPIO_InitStruct.GPIO_Mode = GPIO_Mode_AF;
	GPIO_InitStruct.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_DOWN;
	GPIO_InitStruct.GPIO_Speed = GPIO_Speed_40MHz;
	GPIO_Init(GPIOB, &GPIO_InitStruct);


        GPIO_InitStruct.GPIO_Pin = GPIO_Pin_14;				
	GPIO_InitStruct.GPIO_Mode = GPIO_Mode_AF;
	GPIO_InitStruct.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_DOWN;
	GPIO_InitStruct.GPIO_Speed = GPIO_Speed_40MHz;
        GPIO_Init(GPIOB, &GPIO_InitStruct);	
	

	/*Configure GPIO pin alternate function */
	GPIO_PinAFConfig(GPIOB, GPIO_PinSource13, GPIO_AF_SPI2);

	/*Configure GPIO pin alternate function */
	GPIO_PinAFConfig(GPIOB, GPIO_PinSource14, GPIO_AF_SPI2);

	/*Configure GPIO pin alternate function */
	GPIO_PinAFConfig(GPIOB, GPIO_PinSource15, GPIO_AF_SPI2);
	/*Enable or disable the AHB peripheral clock */



	/*Configure GPIO pin */
	GPIO_InitStruct.GPIO_Pin = GPIO_Pin_12;//|GPIO_Pin_8|GPIO_Pin_9;
	GPIO_InitStruct.GPIO_Mode = GPIO_Mode_OUT;
	GPIO_InitStruct.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_NOPULL;
	GPIO_InitStruct.GPIO_Speed = GPIO_Speed_40MHz;
	GPIO_Init(GPIOB, &GPIO_InitStruct);
        
        	GPIO_InitStruct.GPIO_Pin = GPIO_Pin_0|GPIO_Pin_1|GPIO_Pin_2;//|GPIO_Pin_8|GPIO_Pin_9;
	GPIO_InitStruct.GPIO_Mode = GPIO_Mode_IN;
	//GPIO_InitStruct.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_UP;
	GPIO_InitStruct.GPIO_Speed = GPIO_Speed_40MHz;
	GPIO_Init(GPIOB, &GPIO_InitStruct);

}
//=============================================================================

//=============================================================================
void NVIC_Configuration(void)
{
  NVIC_InitTypeDef NVIC_InitStructure;

#ifdef  VECT_TAB_RAM
  /* Set the Vector Table base location at 0x20000000 */
  NVIC_SetVectorTable(NVIC_VectTab_RAM, 0x0);
#else  /* VECT_TAB_FLASH  */
  /* Set the Vector Table base location at 0x08000000 */
  NVIC_SetVectorTable(NVIC_VectTab_FLASH, 0x0);
#endif

  /* Configure the NVIC Preemption Priority Bits */
  NVIC_PriorityGroupConfig(NVIC_PriorityGroup_0);

  /* Enable the USART1 Interrupt */
  NVIC_InitStructure.NVIC_IRQChannel = USART1_IRQn;			
  NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;
  NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
  NVIC_Init(&NVIC_InitStructure);

    /* Enable the USART1 Interrupt */
 // NVIC_InitStructure.NVIC_IRQChannel = USART2_IRQn;			
 // NVIC_InitStructure.NVIC_IRQChannelSubPriority = 1;
 // NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
 // NVIC_Init(&NVIC_InitStructure);


    NVIC_InitStructure.NVIC_IRQChannel = EXTI15_10_IRQn;
    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0x0F;
    NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0x0F;
    NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;

    NVIC_Init(&NVIC_InitStructure);

  //=======================================================
  /* Enable the TIM2 global Interrupt */
//  NVIC_InitStructure.NVIC_IRQChannel = TIM2_IRQn;//TIM2_IRQChannel;
//  NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0;
//  NVIC_InitStructure.NVIC_IRQChannelSubPriority = 1;
//  NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
//  NVIC_Init(&NVIC_InitStructure);

}
//==============================================================================



//==============================================================================

 void UART_init()
 {
        USART_InitTypeDef USART_InitStructure;
        USART_DeInit(USART1);
  	USART_InitStructure.USART_BaudRate = 115200;
  	USART_InitStructure.USART_WordLength = USART_WordLength_8b;
  	USART_InitStructure.USART_StopBits = USART_StopBits_1;
  	USART_InitStructure.USART_Parity = USART_Parity_No;
  	USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
  	USART_InitStructure.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;

	USART_Init(USART1, &USART_InitStructure);
  	USART_ITConfig(USART1, USART_IT_TC, ENABLE);//USART_IT_TXE
	USART_ITConfig(USART1, USART_IT_RXNE, ENABLE);	

	USART_Cmd(USART1, ENABLE);	

 }


//==============================================================================

void SPI_init_func()
{

  SPI_InitTypeDef SPI_InitStruct;
  SPI_InitStruct.SPI_Direction = SPI_Direction_2Lines_FullDuplex;
  SPI_InitStruct.SPI_Mode      = SPI_Mode_Master;
  SPI_InitStruct.SPI_DataSize  = SPI_DataSize_8b;
  SPI_InitStruct.SPI_CPOL      = SPI_CPOL_Low;
  SPI_InitStruct.SPI_CPHA      = SPI_CPHA_1Edge;
  SPI_InitStruct.SPI_NSS       = SPI_NSS_Soft;
  SPI_InitStruct.SPI_BaudRatePrescaler =   SPI_BaudRatePrescaler_4;
  SPI_InitStruct.SPI_FirstBit = SPI_FirstBit_MSB;
  //SPI_InitStruct.SPI_CRCPolynomial = 7;

  upCS_silar;
  SPI_Init(SPI2, &SPI_InitStruct);
  SPI_Cmd(SPI2, ENABLE);
}


//==============================================================================


extern DMA_InitTypeDef  I2CDMA_InitStructure;
extern __IO uint32_t I2CDirection;
extern __IO uint32_t NumbOfBytes1;
extern __IO uint32_t NumbOfBytes2;
extern __IO uint8_t Address;

#define  ClockSpeed           100000

#define I2C_DIRECTION_TX 0
#define I2C_DIRECTION_RX 1

#define OwnAddress1 0x00
#define OwnAddress2 0x00

static bool is_opened[2];
void I2C_LowLevel_Init(I2C_TypeDef* I2Cx)
{
    GPIO_InitTypeDef  GPIO_InitStruct;
    I2C_InitTypeDef  I2C_InitStructure;

    /* GPIOB clock enable */
    RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOB, ENABLE);
    /* Enable the DMA1 clock */
    RCC_AHBPeriphClockCmd(RCC_AHBPeriph_DMA1, ENABLE);
    RCC_APB1PeriphClockCmd(RCC_APB1Periph_I2C2, ENABLE); 
    if (I2Cx == I2C1)
    {
        RCC_APB1PeriphClockCmd(RCC_APB1Periph_I2C1, ENABLE);        /* I2C1 clock enable */

        /*Configure GPIO pin */
        GPIO_InitStruct.GPIO_Pin = GPIO_Pin_6|GPIO_Pin_7;
        GPIO_InitStruct.GPIO_Mode = GPIO_Mode_AF;
        GPIO_InitStruct.GPIO_OType = GPIO_OType_OD;
        GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_NOPULL;
        GPIO_InitStruct.GPIO_Speed = GPIO_Speed_400KHz;
        GPIO_Init(GPIOB, &GPIO_InitStruct);
        GPIO_PinAFConfig(GPIOB, GPIO_PinSource6, GPIO_AF_I2C1); /*Configure GPIO pin alternate function */
        GPIO_PinAFConfig(GPIOB, GPIO_PinSource7, GPIO_AF_I2C1); /*Configure GPIO pin alternate function */
        /* Enable I2C1 reset state */
        RCC_APB1PeriphResetCmd(RCC_APB1Periph_I2C1, ENABLE);
        /* Release I2C1 from reset state */
        RCC_APB1PeriphResetCmd(RCC_APB1Periph_I2C1, DISABLE);
    }
    else /* I2Cx = I2C2 */
    {
      RCC_APB1PeriphClockCmd(RCC_APB1Periph_I2C2, ENABLE); /* I2C2 clock enable */
      /*Configure GPIO pin */
	  GPIO_InitStruct.GPIO_Pin = GPIO_Pin_10|GPIO_Pin_11;
	  GPIO_InitStruct.GPIO_Mode = GPIO_Mode_AF;
	  GPIO_InitStruct.GPIO_OType = GPIO_OType_OD;
	  GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_UP;
	  GPIO_InitStruct.GPIO_Speed = GPIO_Speed_400KHz;
	  GPIO_Init(GPIOB, &GPIO_InitStruct);
	  GPIO_PinAFConfig(GPIOB, GPIO_PinSource10, GPIO_AF_I2C2); /*Configure GPIO pin alternate function */
	  GPIO_PinAFConfig(GPIOB, GPIO_PinSource11, GPIO_AF_I2C2); /*Configure GPIO pin alternate function */
      /* Enable I2C2 reset state */
      RCC_APB1PeriphResetCmd(RCC_APB1Periph_I2C2, ENABLE);
      /* Release I2C2 from reset state */
      RCC_APB1PeriphResetCmd(RCC_APB1Periph_I2C2, DISABLE);
    }

    /* I2C1 and I2C2 configuration */
    I2C_InitStructure.I2C_Mode = I2C_Mode_I2C;
    I2C_InitStructure.I2C_DutyCycle = I2C_DutyCycle_2;
    I2C_InitStructure.I2C_OwnAddress1 = OwnAddress1;
    I2C_InitStructure.I2C_Ack = I2C_Ack_Enable;
    I2C_InitStructure.I2C_AcknowledgedAddress = I2C_AcknowledgedAddress_7bit;
    I2C_InitStructure.I2C_ClockSpeed = ClockSpeed;
    I2C_Init(I2C1, &I2C_InitStructure);
    I2C_InitStructure.I2C_OwnAddress1 = OwnAddress2;
    I2C_Init(I2C2, &I2C_InitStructure);

//    if (I2Cx == I2C1)
//
//    {   /* I2C1 TX DMA Channel configuration */
//
//        DMA_DeInit(I2C1_DMA_CHANNEL_TX);
//        I2CDMA_InitStructure.DMA_PeripheralBaseAddr = (uint32_t)I2C1_DR_Address;
//        I2CDMA_InitStructure.DMA_MemoryBaseAddr = (uint32_t)0;   /* This parameter will be configured durig communication */
//        I2CDMA_InitStructure.DMA_DIR = DMA_DIR_PeripheralDST;    /* This parameter will be configured durig communication */
//        I2CDMA_InitStructure.DMA_BufferSize = 0xFFFF;            /* This parameter will be configured durig communication */
//        I2CDMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;
//        I2CDMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable;
//        I2CDMA_InitStructure.DMA_PeripheralDataSize = DMA_MemoryDataSize_Byte;
//        I2CDMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_Byte;
//        I2CDMA_InitStructure.DMA_Mode = DMA_Mode_Normal;
//        I2CDMA_InitStructure.DMA_Priority = DMA_Priority_VeryHigh;
//        I2CDMA_InitStructure.DMA_M2M = DMA_M2M_Disable;
//        DMA_Init(I2C1_DMA_CHANNEL_TX, &I2CDMA_InitStructure);
//
//        /* I2C1 RX DMA Channel configuration */
//        DMA_DeInit(I2C1_DMA_CHANNEL_RX);
//        DMA_Init(I2C1_DMA_CHANNEL_RX, &I2CDMA_InitStructure);
//    }
//
//    else /* I2Cx = I2C2 */
//
//    {
//        /* I2C2 TX DMA Channel configuration */
//        DMA_DeInit(I2C2_DMA_CHANNEL_TX);
//        I2CDMA_InitStructure.DMA_PeripheralBaseAddr = (uint32_t)I2C2_DR_Address;
//        I2CDMA_InitStructure.DMA_MemoryBaseAddr = (uint32_t)0;   /* This parameter will be configured durig communication */
//        I2CDMA_InitStructure.DMA_DIR = DMA_DIR_PeripheralDST;    /* This parameter will be configured durig communication */
//        I2CDMA_InitStructure.DMA_BufferSize = 0xFFFF;            /* This parameter will be configured durig communication */
//        I2CDMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;
//        I2CDMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable;
//        I2CDMA_InitStructure.DMA_PeripheralDataSize = DMA_MemoryDataSize_Byte;
//        I2CDMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_Byte;
//        I2CDMA_InitStructure.DMA_Mode = DMA_Mode_Normal;
//        I2CDMA_InitStructure.DMA_Priority = DMA_Priority_VeryHigh;
//        I2CDMA_InitStructure.DMA_M2M = DMA_M2M_Disable;
//        DMA_Init(I2C2_DMA_CHANNEL_TX, &I2CDMA_InitStructure);
//
//        /* I2C2 RX DMA Channel configuration */
//        DMA_DeInit(I2C2_DMA_CHANNEL_RX);
//        DMA_Init(I2C2_DMA_CHANNEL_RX, &I2CDMA_InitStructure);
//
//    }
}

//
//void i2c_init(void)
//{
//  I2C_LowLevel_Init(I2C1);
//  I2C_LowLevel_Init(I2C2);
//  NVIC_PriorityGroupConfig(NVIC_PriorityGroup_4);
//  NVIC_SetPriority(I2C1_EV_IRQn, 0x00);
//  NVIC_EnableIRQ(I2C1_EV_IRQn);
//  NVIC_SetPriority(I2C1_ER_IRQn, 0x01);
//  NVIC_EnableIRQ(I2C1_ER_IRQn);
//  NVIC_SetPriority(I2C2_EV_IRQn, 0x00);
//  NVIC_EnableIRQ(I2C2_EV_IRQn);
//  NVIC_SetPriority(I2C2_ER_IRQn, 0x01);
//  NVIC_EnableIRQ(I2C2_ER_IRQn);
//  is_opened[0] = false;
//  is_opened[1] = false;
//}

void timers_config()
{

}


uint16_t ADCBuffer[] = {0xAAAA, 0xAAAA, 0xAAAA};
ADC_result ADC_data;
void ADC_init_func()
{
  ADC_InitTypeDef  ADC_InitStruct;
  ADC_CommonInitTypeDef ADC_CommonInitStructure; 
  ADC_DeInit(ADC1);

    DMA_InitTypeDef DMA_InitStructure;
 
    DMA_DeInit(DMA1_Channel1);
    DMA_InitStructure.DMA_BufferSize = 3;
    DMA_InitStructure.DMA_DIR = DMA_DIR_PeripheralSRC;
    DMA_InitStructure.DMA_M2M = DMA_M2M_Disable;
    DMA_InitStructure.DMA_MemoryBaseAddr = (uint32_t)&ADC_data.battery_ctrl;//ADCBuffer;
    DMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_HalfWord;
    DMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable;
    DMA_InitStructure.DMA_Mode = DMA_Mode_Circular;
    DMA_InitStructure.DMA_PeripheralBaseAddr = (uint32_t)&ADC1->DR;
    DMA_InitStructure.DMA_PeripheralDataSize = DMA_PeripheralDataSize_HalfWord;
    DMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;
    DMA_InitStructure.DMA_Priority = DMA_Priority_High;
    DMA_Init(DMA1_Channel1, &DMA_InitStructure);
    DMA_Cmd(DMA1_Channel1 , ENABLE ) ;  
  
    ADC_InitStruct.ADC_Resolution = ADC_Resolution_12b;
    ADC_InitStruct.ADC_ScanConvMode = ENABLE;
    ADC_InitStruct.ADC_ContinuousConvMode = ENABLE;
    ADC_InitStruct.ADC_ExternalTrigConvEdge = ADC_ExternalTrigConvEdge_None;
    ADC_InitStruct.ADC_DataAlign = ADC_DataAlign_Right;
    ADC_InitStruct.ADC_NbrOfConversion = 3;

    ADC_Init(ADC1, &ADC_InitStruct);

  
    ADC_CommonInitStructure.ADC_Prescaler = ADC_Prescaler_Div4;
    ADC_CommonStructInit(&ADC_CommonInitStructure);
  
    ADC_RegularChannelConfig(ADC1, ADC_Channel_0, 1, ADC_SampleTime_384Cycles);
    ADC_RegularChannelConfig(ADC1, ADC_Channel_1, 2, ADC_SampleTime_384Cycles);
    ADC_RegularChannelConfig(ADC1, ADC_Channel_6, 3, ADC_SampleTime_384Cycles);
    ADC_DelaySelectionConfig(ADC1, ADC_DelayLength_Freeze);
    ADC_ContinuousModeCmd(ADC1, ENABLE);
    ADC_DMARequestAfterLastTransferCmd(ADC1, ENABLE);
    
    ADC_DMACmd(ADC1 , ENABLE ) ;
    DMA_Cmd(DMA1_Channel1 , ENABLE ) ;
    
    ADC_Cmd(ADC1, ENABLE);
    
    while (ADC_GetFlagStatus(ADC1, ADC_FLAG_ADONS) == RESET);

   
   
   ADC_SoftwareStartConv(ADC1);
}

