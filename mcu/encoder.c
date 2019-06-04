#include "encoder.h"


 
 
void encoder_ini(GPIO_TypeDef* GPIO_S0, uint16_t GPIO_Pin_S0,GPIO_TypeDef* GPIO_S1, uint16_t GPIO_Pin_S1,encoder_struct* encoder)
{
  encoder->PORT_S0 = GPIO_S0;
  encoder->PIN_S0  = GPIO_Pin_S0;
  encoder->PORT_S1 = GPIO_S1;
  encoder->PIN_S1  = GPIO_Pin_S1; 
  encoder->prev_condition =0;
}

void test_encoder(encoder_struct* encoder)
{
 u8 testing_port_s0, testing_port_s1;
 testing_port_s0 = GPIO_ReadInputDataBit(encoder -> PORT_S0,encoder ->PIN_S0);
 testing_port_s1 = GPIO_ReadInputDataBit(encoder -> PORT_S1,encoder ->PIN_S1);
 
 if((testing_port_s0+encoder->prev_condition)&0x01)
 {
  encoder->prev_condition = testing_port_s0;
  if(testing_port_s0)
    {
     if(testing_port_s1)  encoder->state = TO_LEFT;
     else                 encoder->state = TO_RIGHT;
    }
  else
    {
     if(testing_port_s1)  encoder->state = TO_RIGHT;
     else                 encoder->state = TO_LEFT;  
    }
 }
 else  encoder->state = NOT_MOVE;
}


void interrupt_test_encoder(encoder_struct* encoder)
{
 u8 testing_port_s0, testing_port_s1;
 //testing_port_s0 = GPIO_ReadInputDataBit(encoder -> PORT_S0,encoder ->PIN_S0);
 testing_port_s1 = GPIO_ReadInputDataBit(encoder -> PORT_S1,encoder ->PIN_S1);
 
 // encoder->prev_condition = testing_port_s0;
  if(encoder->front_dirrection == EXTI_Trigger_Rising)
    {
     if(testing_port_s1)  encoder->state = TO_LEFT;
     else                 encoder->state = TO_RIGHT;
     encoder->front_dirrection = EXTI_Trigger_Falling;     
    }
  else
    {
     if(testing_port_s1)  encoder->state = TO_RIGHT;
     else                 encoder->state = TO_LEFT;  
     encoder->front_dirrection = EXTI_Trigger_Rising;
     
    }
   EXTI_config(ENABLE,encoder->front_dirrection);
}


encoder_condition get_encoder_state(encoder_struct* encoder)
{
 encoder_condition temp = encoder->state;
 encoder->state = NOT_MOVE;
 return temp;
}
