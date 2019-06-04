#include "led_control.h"
#include "stm32l1xx_gpio.h"



void led_pulse_control()
{
  GPIO_ResetBits(GPIOB, GPIO_Pin_5);
}


void led_off()
{
  GPIO_SetBits(GPIOB, GPIO_Pin_5);
}
