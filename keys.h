//#include "stm32f10x_conf.h"
#include "stm32l1xx_gpio.h"
#include "stm32l1xx_rcc.h"

typedef enum
{
 NON_EVENT    = 0,
 CLICK_EVENT  = 1,
 LONG_PRESS   = 2
}key_state;

#define CLICK_COUNT  3
#define PRESS_COUNT  30 

typedef struct
{
 GPIO_TypeDef* PORT;
 uint16_t PIN;
 key_state  event_type;
 uint8_t  count;
}Kes_type;

void Init_key( GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin, Kes_type* key);
void test_key(Kes_type* key);
