#ifdef L6IR_CU

#include "protocol.h"
#include "net.h"
#include "rfu.h"
#include "L6IR.h"
#include "Ball.h"

extern Sens_param senspar;
extern u16 counter_sys;

Buf_Head	 TXbuf,RXbuf, keyBuf;
 bool     rs_frame;
encoder encoder0, encoder1;
bool fuck_power_off_command = true;
extern spi_def spi_sets;

//#define MASK_OFF         0x00
//#define MASK_ON          0xFF

 u8 encoder_plus_buf[ALL_ENCODER_FUNC]=  {KEY_DISTANTS_PLUS, KEY_BRIGHTNES_PLUS, ENCODER_PLUS_ZOOM, KEY_POSITIVE, KEY_PALETTE_PLUS, KEY_LEGIBILITY_PLUS, KEY_MARKS_BRIGHTNES_PLUS, KEY_EOC_BRIGHTNES_PLUS, KEY_EXPOSSITION_PLUS, KEY_TEMPERATURE_PLUS, KEY_PRESSURE_PLUS};
 u8 encoder_minus_buf[ALL_ENCODER_FUNC]= {KEY_DISTANTS_MINUS, KEY_BRIGHTNES_MINUS, ENCODER_MINUS_ZOOM, KEY_NEGATIVE, KEY_PALETTE_MINUS, KEY_LEGIBILITY_MINUS,KEY_MARKS_BRIGHTNES_MINUS, KEY_EOC_BRIGHTNES_MINUS, KEY_EXPOSSITION_MINUS,KEY_TEMPERATURE_MINUS, KEY_PRESSURE_MINUS};
 u8 encoder_func_buf[ALL_ENCODER_FUNC+1]=  {COM_NO_SYMBOL_DISP, COM_DISTANTS_DISP, COM_BRIGHTNES_DISP, COM_ZOOM_DISP, COM_POS_NEG_DISP, COM_POLETTE_DISP, COM_LIGIBILITY_DISP, COM_MARKS_BRIGHTNES_DISP, COM_EOC_BRIGHTNES_DISP, COM_EXPOSSITION_DISP, COM_TEMPERATURE_DISP, COM_PRESSURE_DISP};
 u8 encoder0_masks_buf[ALL_ENCODER_FUNC+1]   ={MASK_ON, MASK_ON, MASK_ON, MASK_ON, MASK_ON, MASK_ON, MASK_ON, MASK_ON, MASK_ON, MASK_ON, MASK_ON, MASK_ON};
 u8 encoder1_masks_buf[ALL_ENCODER_FUNC+1]   ={MASK_ON, MASK_ON, MASK_ON, MASK_ON, MASK_ON, MASK_ON, MASK_ON, MASK_ON, MASK_ON, MASK_ON, MASK_ON, MASK_ON};
 u8 ctrl_unit_masks_buf[ALL_ENCODER_FUNC+1]  ={MASK_ON, MASK_ON, MASK_ON, MASK_ON, MASK_ON, MASK_ON, MASK_ON, MASK_ON, MASK_ON, MASK_ON, MASK_ON, MASK_ON};
 u8 encoder_func_count;

u16 error_counter;


bool fuck_next_command = false;

void func_buffer_ini()
{
 encoder_plus_buf[DISTANTS_FUNC_NUM-1] = KEY_DISTANTS_PLUS;
 encoder_plus_buf[BRIGHTNES_FUNC_NUM-1] = KEY_BRIGHTNES_PLUS;
 encoder_plus_buf[ZOOM_FUNC_NUM-1] = ENCODER_PLUS_ZOOM;
 encoder_plus_buf[POS_NEG_FUNC_NUM-1] = KEY_POSITIVE;
 encoder_plus_buf[POLETTE_FUNC_NUM-1] = KEY_PALETTE_PLUS;
 encoder_plus_buf[LIGIBILITY_FUNC_NUM-1] = KEY_LEGIBILITY_PLUS;
 encoder_plus_buf[MARKS_BRIGHTNES_FUNC_NUM-1] =  KEY_MARKS_BRIGHTNES_PLUS;
 encoder_plus_buf[EOC_BRIGHTNES_FUNC_NUM-1] = KEY_EOC_BRIGHTNES_PLUS;
 encoder_plus_buf[EXPOSSITION_FUNC_NUM-1] = KEY_EXPOSSITION_PLUS;
 encoder_plus_buf[TEMP_ENTER_FUNC_NUM -1] = KEY_TEMPERATURE_PLUS;
 encoder_plus_buf[PRESS_ENTER_FUNC_NUM -1] = KEY_PRESSURE_PLUS;
 
 encoder_minus_buf[DISTANTS_FUNC_NUM-1] = KEY_DISTANTS_MINUS;
 encoder_minus_buf[BRIGHTNES_FUNC_NUM-1] = KEY_BRIGHTNES_MINUS;
 encoder_minus_buf[ZOOM_FUNC_NUM-1] = ENCODER_MINUS_ZOOM;
 encoder_minus_buf[POS_NEG_FUNC_NUM-1] = KEY_NEGATIVE;
 encoder_minus_buf[POLETTE_FUNC_NUM-1] = KEY_PALETTE_MINUS;
 encoder_minus_buf[LIGIBILITY_FUNC_NUM-1] = KEY_LEGIBILITY_MINUS;
 encoder_minus_buf[MARKS_BRIGHTNES_FUNC_NUM-1] = KEY_MARKS_BRIGHTNES_MINUS;
 encoder_minus_buf[EOC_BRIGHTNES_FUNC_NUM-1] = KEY_EOC_BRIGHTNES_MINUS;
 encoder_minus_buf[EXPOSSITION_FUNC_NUM-1] = KEY_EXPOSSITION_MINUS;
 encoder_minus_buf[TEMP_ENTER_FUNC_NUM -1] =  KEY_TEMPERATURE_MINUS;
 encoder_minus_buf[PRESS_ENTER_FUNC_NUM -1] =  KEY_PRESSURE_MINUS;
 
 encoder_func_buf[DISTANTS_FUNC_NUM] = COM_DISTANTS_DISP;
 encoder_func_buf[BRIGHTNES_FUNC_NUM] = COM_BRIGHTNES_DISP;
 encoder_func_buf[ZOOM_FUNC_NUM] = COM_ZOOM_DISP;
 encoder_func_buf[POS_NEG_FUNC_NUM] = COM_POS_NEG_DISP;
 encoder_func_buf[POLETTE_FUNC_NUM] = COM_POLETTE_DISP;
 encoder_func_buf[LIGIBILITY_FUNC_NUM] = COM_LIGIBILITY_DISP;
 encoder_func_buf[MARKS_BRIGHTNES_FUNC_NUM] = COM_MARKS_BRIGHTNES_DISP;
 encoder_func_buf[EOC_BRIGHTNES_FUNC_NUM] = COM_EOC_BRIGHTNES_DISP;
 encoder_func_buf[EXPOSSITION_FUNC_NUM] = COM_EXPOSSITION_DISP;
 encoder_func_buf[TEMP_ENTER_FUNC_NUM] = COM_TEMPERATURE_DISP;
 encoder_func_buf[PRESS_ENTER_FUNC_NUM] =   COM_PRESSURE_DISP;
}

void encoder_func_ini()
{
      encoder_func_count=1; //
      keys.buffer[keys.quant] = encoder_func_buf[encoder_func_count];
      keys.quant++;
}



 void protocol()
{
 bool st;
 u8 command, adress;
 u8 i, keys_q,dop_symb=0,code;
 del_stsp(&RXbuf);
 st = check_crc(&RXbuf);
 adress = pop(&RXbuf);
 command = pop(&RXbuf);
// error_counter = ERROR_WAITING_TIME;

if(adress == ADRESS_CU)
 {
   error_counter = ERROR_WAITING_TIME;
    switch(command)
    {
    case GET_KEY_CODE:
     keys_q = pop(&RXbuf);
     for(i=0;i<keys_q;i++)
        {
          code = pop(&RXbuf);
          switch(code)
          {
           case ENCODER_PLUS_0:
                 push(&keys.keys_stack, encoder_plus_buf[encoder_func_count-1]);
           break;

           case ENCODER_MINUS_0:
                 push(&keys.keys_stack, encoder_minus_buf[encoder_func_count-1]);
           break;

           case KEY_ENTER:
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
//             encoder_func_count++;
//             if(encoder_func_count>ALL_ENCODER_FUNC) encoder_func_count=1;
//             if(encoder_func_count<2) encoder_func_count=1; //
//             push(&keys.keys_stack, encoder_func_buf[encoder_func_count]);
           break;

           case KEY_MENU_ENTER:
              push(&keys.keys_stack, code);
           break;

           case KEY_ENCODER_PRESS:
              push(&keys.keys_stack, KEY_POWER_OFF);
           break;

           case KEY_ENCODER1:
              push(&keys.keys_stack, KEY_ENTER);
           break;


           case KEY_PHOTO:
              push(&keys.keys_stack, code);
           break;

           case KEY_ID:
              push(&keys.keys_stack, KEY_ID);
           break;

           case KEY_PLUS:
               push(&keys.keys_stack,  KEY_PLUS);
           break;

           case KEY_MINUS:
               push(&keys.keys_stack, KEY_MINUS);
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
          }
        }
     keys.quant+=keys_q;
    break;


    case CONDISSION_REQUEST:
         net_init();
    break;
    }
 }

if(adress == ADRESS_EXT_MASTER)
  {
    switch(command)
    {
      case EXT_MASTER_REQUEST:
           net_set_default(NET_SLAVE);
      break;
      
      case EXT_MASTER_RFU_START:
        rfu_start();
      break;
    }
  }


if(adress == ADRESS_GPS)
{
  switch(command)
  {
    case GET_GPS_DATA:

    break;
  }
}

if(adress == ADRESS_METEO)
  {
    u8* data;
    switch(command)
    {
    case GET_TEMPERATURE_DATA:
     float temper;
     float* temper_point;
     temper_point = &temper;
      data = (u8*)temper_point;
     *(data+0) = pop(&RXbuf);
     *(data+1) = pop(&RXbuf);
     *(data+2) = pop(&RXbuf);
     *(data+3) = pop(&RXbuf);
     temper = temper -5;
     if(senspar.temp_auto)
     {
     if((senspar.temperature>=(temper+1))||(senspar.temperature<=(temper-1)) )senspar.change_par = true;
     if(temper >= 45) temper = 50;
     //if(temper <= -20) temper = -40;
     //if((temper>=20)&&(temper<=26)) temper = 23;
      senspar.temperature= temper;
     wright_data_to_cam(GET_TEMPERATURE_DATA, senspar.temperature);
     }
    break;

    case GET_PRESSURE_DATA:
     float press;
     float* press_point;
     press_point = &press;
      data = (u8*)press_point;
     *(data+0) = pop(&RXbuf);
     *(data+1) = pop(&RXbuf);
     *(data+2) = pop(&RXbuf);
     *(data+3) = pop(&RXbuf);
     if(senspar.press_auto)
     {
     if((senspar.pressure>=(press+1)) ||(senspar.pressure<=(press-1)) )senspar.change_par = true;
    // if(senspar.temperature<-20) press = 763;
     senspar.pressure = press;
     wright_data_to_cam(GET_PRESSURE_DATA, senspar.pressure);
     }
    break;

    case METEO_GET_INCLINATE_DATA:
     float incl;
     float* incl_point;
     incl_point = &incl;
     data = (u8*)incl_point;
     *(data+0) = pop(&RXbuf);
     *(data+1) = pop(&RXbuf);
     *(data+2) = pop(&RXbuf);
     *(data+3) = pop(&RXbuf);
    if(incl>=90) incl -=180;
    if(incl<=-90) incl +=180;
     //incl +=180;
    if((senspar.declinate>=(incl+1)) ||(senspar.declinate<=(incl-1)) )senspar.change_par = true;
     senspar.declinate = incl;

    break;

    case METEO_GET_DECLINATE_DATA:
      float decl;
     float* decl_point;
     decl_point = &decl;
     data = (u8*)decl_point;
     *(data+0) = pop(&RXbuf);
     *(data+1) = pop(&RXbuf);
     *(data+2) = pop(&RXbuf);
     *(data+3) = pop(&RXbuf);
     if(decl>=90) decl -=180;
     if(decl<=-90) decl +=180;
    // decl +=180;
     senspar.inclinate = decl;
     if((senspar.inclinate>=(decl+1)) ||(senspar.inclinate<=(decl-1)) )senspar.change_par = true;
     wright_data_to_cam(METEO_GET_INCLINATE_DATA, senspar.inclinate);
    break;
    
    case GET_COMPASS_DATA:
     float compasl;
     float* compas_point;
     compas_point = &compasl;
     data = (u8*)compas_point;
     *(data+0) = pop(&RXbuf);
     *(data+1) = pop(&RXbuf);
     *(data+2) = pop(&RXbuf);
     *(data+3) = pop(&RXbuf);
     //if(decl>=90) decl -=180;
     //if(decl<=-90) decl +=180;
    // decl +=180;
     senspar.compas = compasl;
     if((senspar.compas>=(compasl+1)) ||(senspar.compas<=(compasl-1)) )senspar.change_par = true;
//     wright_data_to_cam(GET_PRESSURE_DATA, senspar.compas);
    break;
   }
 }


if(adress == encoder1.adress)
  {  
    encoder1.encoder_func(command);    
  }



if(adress == encoder0.adress)
  {
    encoder0.encoder_func(command);
  }



// LPD protocol
if(adress == ADRESS_LPD)
  {
    lpd_requests(command);
  }

 clean(&RXbuf);
 task_flag = false;
 counter_sys  = 0;
}


void redrow_menu_simbol()
{
  if(!(encoder_func_buf[encoder_func_count]&encoder0_masks_buf[encoder_func_count]))
  {
             encoder_func_count++;
             if(encoder_func_count>ALL_ENCODER_FUNC) encoder_func_count=1;
             while(!(encoder_func_buf[encoder_func_count]&encoder0_masks_buf[encoder_func_count]))
             {
              encoder_func_count++;
              if(encoder_func_count>ALL_ENCODER_FUNC) encoder_func_count=1;            
             }
             

  }  

      push(&keys.keys_stack,  COM_NO_SYMBOL_DISP);
  
      push(&keys.keys_stack,  encoder_func_buf[encoder_func_count]);
      
      if(flash.cam_type&CONFIG_TEMP_PRESS_TEST)
        {
         senspar.pressure = 750;
         wright_data_to_cam(GET_PRESSURE_DATA, senspar.pressure);
         senspar.temperature = 15;
         wright_data_to_cam(GET_TEMPERATURE_DATA, senspar.temperature);
        }
      error_counter = 1000;
}

#endif