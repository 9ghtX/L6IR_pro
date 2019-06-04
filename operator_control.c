#include "L6IR.h"
#include "Ball.h"

#define OPERATOR_CONTROL_PERIOD  50
#define PHOTO_DEFAULT_ON_VALUE   285
#define PHOTO_DEFAULT_OFF_VALUE  600

display_state display_st;
operator_control_consist operator_ctrl_consist;
s16 waiting_control_time;
extern uint16_t ADCBuffer[];
extern ADC_result ADC_data;
u32 photo_data_light, photo_data_dark;
extern spi_def spi_sets;


void Operator_present_control()
{
  u32 photo_data;
  //if(waiting_control_time >0) waiting_control_time--;
  //else
  //{
   switch(operator_ctrl_consist)
   {
    case led_pulse:
      if(waiting_control_time >0) waiting_control_time--;
      else
      {
       Led_ON;
       operator_ctrl_consist = pulse_adc1;
       waiting_control_time = OPERATOR_CONTROL_PERIOD;
      }
    break;
   
    case pulse_adc1:
      photo_data_light = ADC_data.operator_photo;// ADCBuffer[2];//ADC_GetInjectedConversionValue(ADC1, ADC_InjectedChannel_3);
      operator_ctrl_consist = pulse_adc2;
    break;
    
    case pulse_adc2:
      photo_data_light += ADC_data.operator_photo;//ADCBuffer[2];//ADC_GetInjectedConversionValue(ADC1, ADC_InjectedChannel_3);
      if(waiting_control_time >0) waiting_control_time--;
      else                        operator_ctrl_consist = pulse_adc3;    
    break;

    case pulse_adc3:
      photo_data_light+= ADC_data.operator_photo;//ADCBuffer[2];//ADC_GetInjectedConversionValue(ADC1, ADC_InjectedChannel_3);   
      //photo_data_light = photo_data_light/OPERATOR_CONTROL_PERIOD;
       if((display_st == display_on)&&(photo_data_light>PHOTO_DEFAULT_OFF_VALUE)) display_st = display_make_off;

       
       if((display_st == display_off)&&(photo_data_light<PHOTO_DEFAULT_ON_VALUE))  display_st = display_make_on;
     
      Led_OFF;
      //display_st = display_on;
      waiting_control_time = OPERATOR_CONTROL_PERIOD;
      operator_ctrl_consist = led_pulse;
    break;

    case not_action:
      operator_ctrl_consist = led_pulse;      
    break;  
   }
 // }
}