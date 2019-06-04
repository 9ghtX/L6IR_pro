#include "protocol.h"
#include "net.h"
#include "rfu.h"
#include "L6IR.h"
#include "Ball.h"

extern u8 encoder_plus_buf[ALL_ENCODER_FUNC];
extern u8 encoder_minus_buf[ALL_ENCODER_FUNC];
extern u8 encoder_func_buf[ALL_ENCODER_FUNC+1];
extern u8 encoder0_masks_buf[ALL_ENCODER_FUNC+1];   
extern u8 encoder1_masks_buf[ALL_ENCODER_FUNC+1];
extern u8 ctrl_unit_masks_buf[ALL_ENCODER_FUNC+1];  
extern bool fuck_power_off_command;
extern u8 encoder_func_count;
extern u16 error_counter;
extern bool fuck_next_command;
extern spi_def spi_sets;


void encoder1_func_2enc(u8 command)
{
  u8 keys_q, code, i;

    switch(command)
    {
    case GET_KEY_CODE:
     u8 i, keys_q, code;
     keys_q = pop(&RXbuf);
     if((keys_q)&&(display_st==display_off))display_st =display_make_on;
     for(i=0;i<keys_q;i++)
        {
          code = pop(&RXbuf);
          switch(code)
          {
           case ENCODER_PLUS_0:
                 senspar.change_par = true;
                 push(&keys.keys_stack, ENCODER_PLUS_1);
           break;

           case ENCODER_MINUS_0:
                 senspar.change_par = true;
                 push(&keys.keys_stack, ENCODER_MINUS_1);
           break;

           case KEY_PHOTO://KEY_ENTER:
                push(&keys.keys_stack, KEY_ENTER);
           break;
           
           case ENCODER_PLUS_PRESS_1:
             keys.buffer[keys.quant+i] = KEY_ENTER_SPECIAL_MENU;
           break;
             
           case KEY_MENU_ENTER:
             keys.buffer[keys.quant+i] = KEY_POWER_OFF;
             
           break;
           
          default:
            
          // keys.buffer[keys.quant+i] = code;// KEY_ENTER;
          break;  
        }
       }
    break;
    }
}


void encoder1_t_func_2enc(u8 command)
{
  u8 keys_q, code, i;

    switch(command)
    {
    case GET_KEY_CODE:
     u8 i, keys_q, code;
     keys_q = pop(&RXbuf);
     for(i=0;i<keys_q;i++)
        {
          code = pop(&RXbuf);
          switch(code)
          {
           case ENCODER_PLUS_0:
                 push(&keys.keys_stack, KEY_PLUS);//encoder_plus_buf[encoder_func_count-1];
           break;

           case ENCODER_MINUS_0:
                 push(&keys.keys_stack, KEY_MINUS);//encoder_minus_buf[encoder_func_count-1];
                 
           break;

           case KEY_PHOTO://KEY_ENTER:
             push(&keys.keys_stack, KEY_ENTER);
             /*device_mode++;
             if(device_mode>=MODES_QUANT)device_mode = 0;
             set_device_mode(device_mode);*/
           break;
           
           case ENCODER_PLUS_PRESS_1:
             keys.buffer[keys.quant+i] = KEY_ENTER_SPECIAL_MENU;
           break;
             
           case KEY_MENU_ENTER:
             keys.buffer[keys.quant+i] = KEY_POWER_OFF;
             
           break;
           
          default:
            
          // keys.buffer[keys.quant+i] = code;// KEY_ENTER;
          break;  
        }
       }
    break;
    }
}

void encoder0_func_2enc(u8 command)
{
  u8 keys_q, code, i;
  switch(command)
    {

    case GET_KEY_CODE:
      
     keys_q = pop(&RXbuf);
     
     for(i=0;i<keys_q;i++)
        {
          code = pop(&RXbuf);
           error_counter = ERROR_WAITING_TIME;
          switch(code)
          {
           case ENCODER_PLUS_0:
              //senspar.change_par = true;
                 push(&keys.keys_stack, encoder_plus_buf[encoder_func_count-1]);
                fuck_next_command = false;
                fuck_power_off_command = false;
           break;

           case ENCODER_MINUS_0:
              //senspar.change_par = true;
                 push(&keys.keys_stack, encoder_minus_buf[encoder_func_count-1]);
                fuck_next_command = false;
                fuck_power_off_command = false;
           break;

           case KEY_PHOTO://KEY_ENTER:
             if(!fuck_next_command)
             {
             if(!(0x08&spi_sets.silar_state))
             {
             encoder_func_count++;
             if(encoder_func_count>ALL_ENCODER_FUNC) encoder_func_count=1;
             
             while(!(encoder_func_buf[encoder_func_count]&encoder0_masks_buf[encoder_func_count]))
             {
              encoder_func_count++;
              if(encoder_func_count>ALL_ENCODER_FUNC) encoder_func_count=1;            
             }
             }
              push(&keys.keys_stack, COM_NO_SYMBOL_DISP);
              push(&keys.keys_stack, encoder_func_buf[encoder_func_count]);
             }
             else  push(&keys.keys_stack, NO_ACTION);
             
             fuck_next_command = false;
             fuck_power_off_command = false;
           break;
           
           case ENCODER_PLUS_PRESS_1:
             push(&keys.keys_stack, KEY_ENTER_SPECIAL_MENU);
             fuck_next_command = true;
             fuck_power_off_command = false;
           break;
           
           case ENCODER_MINUS_PRESS_1:
             if(!fuck_next_command)
             {
             push(&keys.keys_stack, KEY_MENU_ENTER);           
             fuck_next_command=true;
             }
             fuck_power_off_command = false;
           break;

           case KEY_MENU_ENTER:

             push(&keys.keys_stack,code);
           break;
          }
        }
    break;
    }
}
