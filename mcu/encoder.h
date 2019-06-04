#include "stm32f10x_conf.h"
#include "stm32f10x_gpio.h"
#include "stm32f10x_rcc.h"
#include <hal_types.h>

typedef enum
{
       TO_RIGHT = 0,
       TO_LEFT  = 1,
       NOT_MOVE = 2
} encoder_condition;

#define       EXTI_DISABLE_TIME 30
#define       LEVEL_UP       15
#define       LEVEL_DOWN     25


typedef struct
{
 GPIO_TypeDef* PORT_S0;
 uint16_t PIN_S0;
 GPIO_TypeDef* PORT_S1;
 uint16_t PIN_S1; 
 EXTITrigger_TypeDef front_dirrection;
 bool event;
 u8 disable_timer;
 u8 prev_condition;
 encoder_condition state;
} encoder_struct;

void encoder_ini(GPIO_TypeDef* GPIO_S0, uint16_t GPIO_Pin_S0,GPIO_TypeDef* GPIO_S1, uint16_t GPIO_Pin_S1,encoder_struct* encoder);

void test_encoder(encoder_struct* encoder);

encoder_condition get_encoder_state(encoder_struct* encoder);