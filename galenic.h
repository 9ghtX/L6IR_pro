#include "stm32l1xx_syscfg.h"
#include "stm32l1xx_rcc.h"

#include "stm32l1xx.h"
#include "stm32l1xx_gpio.h"
#include <stdio.h>
#include <hal_types.h>

#define TEST_T_MODE    GPIO_ReadInputDataBit(GPIOB, GPIO_Pin_0)
#define TEST_N_MODE    GPIO_ReadInputDataBit(GPIOB, GPIO_Pin_1)
#define TEST_TN_MODE   GPIO_ReadInputDataBit(GPIOA, GPIO_Pin_3)
#define TEST_ND_MODE   GPIO_ReadInputDataBit(GPIOA, GPIO_Pin_4)
#define TEST_NL_MODE   GPIO_ReadInputDataBit(GPIOB, GPIO_Pin_2)
void galenic_func();