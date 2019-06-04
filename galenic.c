#include "galenic.h"
#include "L6IR.h"
//#include "led_control.h"
u8 t_mode_count, n_mode_count, tn_mode_count, nd_mode_count, nl_mode_count;
u8 dev_mode;

void galenic_func()
{
  if((!TEST_T_MODE)&&TEST_N_MODE&&TEST_TN_MODE&&TEST_ND_MODE&&TEST_NL_MODE) t_mode_count++;
  else t_mode_count = 0; 
  if((!TEST_N_MODE)&&TEST_T_MODE&&TEST_TN_MODE&&TEST_ND_MODE&&TEST_NL_MODE) n_mode_count++;
  else n_mode_count = 0;
  if((!TEST_TN_MODE)&&TEST_T_MODE&&TEST_N_MODE&&TEST_ND_MODE&&TEST_NL_MODE) tn_mode_count++;
  else tn_mode_count =0;
  if((!TEST_ND_MODE)&&TEST_T_MODE&&TEST_N_MODE&&TEST_TN_MODE&&TEST_NL_MODE) nd_mode_count++;
  else nd_mode_count = 0;
  if((!TEST_NL_MODE)&&TEST_T_MODE&&TEST_N_MODE&&TEST_TN_MODE&&TEST_ND_MODE) nl_mode_count++;
  else nl_mode_count =0;
  
  if((t_mode_count>=3)&&(!(n_mode_count|tn_mode_count|nd_mode_count|nl_mode_count))&&(dev_mode!=T_MODE))     {dev_mode = T_MODE; set_device_mode(dev_mode);/*led_off();*/}
  if((n_mode_count>=3)&&(!(t_mode_count|tn_mode_count|nd_mode_count|nl_mode_count))&&(dev_mode!=N_MODE))     {dev_mode = N_MODE; set_device_mode(dev_mode);/*led_off();*/}
  if((tn_mode_count>=3)&&(!(t_mode_count|n_mode_count|nd_mode_count|nl_mode_count))&&(dev_mode!=TN_MODE))    {dev_mode = TN_MODE; set_device_mode(dev_mode);/*led_off();*/}
  if((nd_mode_count>=3)&&(!(t_mode_count|n_mode_count|tn_mode_count|nl_mode_count))&&(dev_mode!=N_MODE_DISP)){dev_mode = N_MODE_DISP; set_device_mode(N_MODE_DISP);/*led_off();*/}
  if((nl_mode_count>=3)&&(!(t_mode_count|n_mode_count|tn_mode_count|nd_mode_count))&&(dev_mode!=N_MODE_IR))  {dev_mode = N_MODE_IR; set_device_mode(N_MODE_IR); /*led_pulse_control();*/}    
}