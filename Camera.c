#include "L6IR.h"
#include "Ball.h"
#include "hal_critical_section.h"
#include "net.h"

spi_object spi_objects[SPI_OBJ_Q];
spi_def spi_sets;
#define ZOOM    (spi_sets.silar_state&0x03)
#define EN_MENU (0x08&spi_sets.silar_state)

u8 spi_task_count;
cam_settings cam_sets;
extern bool flash_is_read;
flash_memory flash;
uint16_t critcal_section_level=0;
camera_operation cam_operation;
//cam_ballistic ballistics_buf[11];
extern bool key1_pulse;
extern u16  key1_count;
extern bool led_pulse_enable;
extern encoder encoder0;
extern float currient_focus;

void init_spi_objects()
{
  spi_task_count = 0;
  spi_sets.spi_obj_q =34;
  spi_sets.silar_status = 0;
  spi_sets.read_status_zero_count = 0;
  spi_sets.stat_read_enable = false;
  spi_sets.read_sichro_count = READ_SYCHRO_TIME;
  spi_sets.wright_sinchro_count = WRIGHT_SYCHRO_TIME;
  spi_sets.wright_enable = true;
  spi_objects[0].adress  = MARK_0_ADDR;
  spi_objects[0].reg_for_wright = true;
  spi_objects[1].adress  = MARK_1_ADDR;
  spi_objects[1].reg_for_wright = true;
  spi_objects[2].adress  = MARK_2_ADDR;
  spi_objects[2].reg_for_wright = true;
  spi_objects[3].adress  = MARK_3_ADDR;
  spi_objects[3].reg_for_wright = true;
  spi_objects[4].adress  = MARK_4_ADDR;
  spi_objects[4].reg_for_wright = true;
  spi_objects[5].adress  = MARK_5_ADDR;
  spi_objects[5].reg_for_wright = false;
  spi_objects[6].adress  = MARK_6_ADDR;
  spi_objects[6].reg_for_wright = false;
  spi_objects[7].adress  = MARK_7_ADDR;
  spi_objects[7].reg_for_wright = true;
  spi_objects[8].adress  = MARK_8_ADDR;
  spi_objects[8].reg_for_wright = true;
  spi_objects[9].adress  = MARK_9_ADDR;
  spi_objects[9].reg_for_wright = true;
  spi_objects[10].adress = MARK_10_ADDR;
  spi_objects[10].reg_for_wright = true;
  spi_objects[11].adress = MARK_11_ADDR;
  spi_objects[11].reg_for_wright = true;
  spi_objects[12].adress = MARK_12_ADDR;
  spi_objects[12].reg_for_wright = false;
  spi_objects[13].adress = MARK_13_ADDR;
  spi_objects[13].reg_for_wright = false;
  spi_objects[14].adress = MARK_14_ADDR;
  spi_objects[14].reg_for_wright = false;
  spi_objects[15].adress = MARK_15_ADDR;
  spi_objects[15].reg_for_wright = false;
  spi_objects[16].adress = MARK_16_ADDR;
  spi_objects[16].reg_for_wright = true;
  spi_objects[17].adress = FLASH_READING_ADDRES;
  spi_objects[17].reg_for_wright = true;
  spi_objects[18].adress = CAMERA_STATE_ADDR;
  spi_objects[18].reg_for_wright = false;
  spi_objects[19].adress = TEMPERATURE_READ_ADDR;
  spi_objects[19].reg_for_wright = false;
  spi_objects[20].adress = DISTANCE_ADDR;
  spi_objects[20].reg_for_wright = true;
  spi_objects[21].adress = TEMPERATURE_WRIGHT_ADDR;
  spi_objects[21].reg_for_wright = true;
  spi_objects[22].adress = PRESSURE_ADDR;
  spi_objects[22].reg_for_wright = true;
  spi_objects[23].adress = INCLINATE_ADDR;
  spi_objects[23].reg_for_wright = true;
  spi_objects[30].adress = COMMAND_REG_ADDR;
  spi_objects[30].reg_for_wright = true;

 for(u8 i=0; i<spi_sets.spi_obj_q; i++)
 {
   spi_objects[i].wright_enable=true;
 spi_objects[i].error_count =0;
 }
  cam_operation = wright;
  clean(&keys.keys_stack);
}
#ifdef TNM_MODE
bool cam_power_state = false;
#else
bool cam_power_state = true;
#endif
extern u16 system_wait_timer;
extern bool task_flag;
extern u8 encoder0_masks_buf[];

void set_device_mode(u8 mode)
{
switch(mode)
{
case T_MODE:
  
      EOC_POWER_OFF;
      if(cam_power_state==false)
      {

      CAM_POWER_ON;
      KEY1_RESET;
        system_wait_timer = SECOND_9;
        task_flag =true;     
        while(task_flag);
        KEY1_SET;
      SPI_init_func();
      init_spi_objects();
      key1_pulse = false;
      system_wait_timer = 150;
      cam_power_state = true;
      }
      senspar.change_par = false;
      spi_objects[COMMAND_REG_ADDR].wright_data = OLED_ON_COMMAND;
      spi_sets.current_function = OLED_ON_COMMAND;
      while(senspar.change_par != true)spi_silar_tasks();
      senspar.change_par = false;
//
//      spi_objects[COMMAND_REG_ADDR].wright_data = VIDEO_OFF_COMMAND;
//      spi_sets.current_function = VIDEO_OFF_COMMAND;
//      while(senspar.change_par != true)spi_silar_tasks();
//      senspar.change_par = false;  
      
      spi_objects[COMMAND_REG_ADDR].wright_data = VIDEO_ON_COMMAND;
      spi_sets.current_function = VIDEO_ON_COMMAND; 
      while(senspar.change_par != true)spi_silar_tasks();
      senspar.change_par = false;
      
      led_pulse_enable=false;
      
      spi_objects[COMMAND_REG_ADDR].wright_data = INFO_ON_COMMAND;
      spi_sets.current_function = INFO_ON_COMMAND;
      while(senspar.change_par != true)spi_silar_tasks();
      senspar.change_par = false;
      encoder0.encoder_func = encoder0_func; 
      if((flash.cam_type&0x0000C000)>=0x00008000)encoder0_masks_buf[DISTANTS_FUNC_NUM] = MASK_OFF;
      else encoder0_masks_buf[DISTANTS_FUNC_NUM] = MASK_ON;
      encoder0_masks_buf[BRIGHTNES_FUNC_NUM] = MASK_ON;
      encoder0_masks_buf[ZOOM_FUNC_NUM] = MASK_ON;
      encoder0_masks_buf[POS_NEG_FUNC_NUM] = MASK_ON;
      encoder0_masks_buf[POLETTE_FUNC_NUM] = MASK_ON;
      encoder0_masks_buf[LIGIBILITY_FUNC_NUM] = MASK_ON;
      encoder0_masks_buf[MARKS_BRIGHTNES_FUNC_NUM] = MASK_ON;
      encoder0_masks_buf[EOC_BRIGHTNES_FUNC_NUM] = MASK_OFF;
break;

case N_MODE:              
  EOC_POWER_ON;
  CAM_POWER_OFF;
  SPI_Cmd(SPI2, DISABLE);
  downCS_silar;
  cam_power_state = false;

if(cam_power_state)
{
        spi_objects[COMMAND_REG_ADDR].wright_data = OLED_OFF_COMMAND;
      spi_sets.current_function = OLED_OFF_COMMAND; 
      while(senspar.change_par != true)spi_silar_tasks();
      senspar.change_par = false;   
}

//        KEY1_RESET;
//        system_wait_timer = SECOND_12;
//        task_flag =true;     
//        while(task_flag);
//        KEY1_SET;
     led_pulse_enable=false;
      net_sets.net_encoder_0 = true;
    encoder0.adress = ADRESS_ENCODER3;
    encoder0.encoder_func = encoder0_eoc_func; 
    //cam_power_state = false;
//   spi_objects[COMMAND_REG_ADDR].wright_data = CAMERA_OFF_COMMAND;
break;

case TN_MODE:             
      EOC_POWER_ON;
       if(cam_power_state==false)
      {
 
      CAM_POWER_ON;
      KEY1_RESET;
         system_wait_timer = SECOND_9;
        task_flag =true;     
        while(task_flag); 
        KEY1_SET;
        key1_pulse = false;  
        cam_power_state = true;
        SPI_init_func();
        init_spi_objects();
        system_wait_timer = 150;
      }
      senspar.change_par = false;
      spi_objects[COMMAND_REG_ADDR].wright_data = OLED_ON_COMMAND;
      spi_sets.current_function = OLED_ON_COMMAND;
      while(senspar.change_par != true)spi_silar_tasks();
      senspar.change_par = false;      
      
//      spi_objects[COMMAND_REG_ADDR].wright_data = VIDEO_OFF_COMMAND;
//      spi_sets.current_function = VIDEO_OFF_COMMAND;
//      while(senspar.change_par != true)spi_silar_tasks();
//      senspar.change_par = false; 
      
      led_pulse_enable=false;
      
      spi_objects[COMMAND_REG_ADDR].wright_data = VIDEO_ON_COMMAND;
      spi_sets.current_function = VIDEO_ON_COMMAND;
      while(senspar.change_par != true)spi_silar_tasks();
      senspar.change_par = false;     
      
      spi_objects[COMMAND_REG_ADDR].wright_data = INFO_ON_COMMAND;
      spi_sets.current_function = INFO_ON_COMMAND;
      while(senspar.change_par != true)spi_silar_tasks();
      senspar.change_par = false;
      encoder0.encoder_func = encoder0_func; 
     if((flash.cam_type&0x0000C000)>=0x00008000)encoder0_masks_buf[DISTANTS_FUNC_NUM] = MASK_OFF;
     else encoder0_masks_buf[DISTANTS_FUNC_NUM] = MASK_ON;
     encoder0_masks_buf[BRIGHTNES_FUNC_NUM] = MASK_ON;
     encoder0_masks_buf[ZOOM_FUNC_NUM] = MASK_OFF;
     encoder0_masks_buf[POS_NEG_FUNC_NUM] = MASK_ON;
     encoder0_masks_buf[POLETTE_FUNC_NUM] = MASK_ON;
     encoder0_masks_buf[LIGIBILITY_FUNC_NUM] = MASK_ON;
     encoder0_masks_buf[MARKS_BRIGHTNES_FUNC_NUM] = MASK_ON;
     encoder0_masks_buf[EOC_BRIGHTNES_FUNC_NUM] = MASK_ON;

break;

case N_MODE_DISP:      
  
      EOC_POWER_ON;
      if(cam_power_state==false)
      {

      CAM_POWER_ON;
      KEY1_RESET;
         system_wait_timer = SECOND_9;
        task_flag =true;     
        while(task_flag); 
        KEY1_SET;
        key1_pulse = false;        
        cam_power_state = true;
        SPI_init_func();
        init_spi_objects();
              system_wait_timer = 150;
      }  
      led_pulse_enable=false;
      senspar.change_par = false;
      spi_objects[COMMAND_REG_ADDR].wright_data = OLED_ON_COMMAND;
      spi_sets.current_function = OLED_ON_COMMAND;
      while(senspar.change_par != true)spi_silar_tasks();
      senspar.change_par = false;

      
      spi_objects[COMMAND_REG_ADDR].wright_data = VIDEO_OFF_COMMAND;
      spi_sets.current_function = VIDEO_OFF_COMMAND; 
      while(senspar.change_par != true)spi_silar_tasks();
      senspar.change_par = false;

      
      spi_objects[COMMAND_REG_ADDR].wright_data = INFO_ON_COMMAND;
      spi_sets.current_function = INFO_ON_COMMAND;
      while(senspar.change_par != true)spi_silar_tasks();
      senspar.change_par = false;    
      encoder0.encoder_func = encoder0_func; 
     if((flash.cam_type&0x0000C000)>=0x00008000)encoder0_masks_buf[DISTANTS_FUNC_NUM] = MASK_OFF;
     else encoder0_masks_buf[DISTANTS_FUNC_NUM] = MASK_ON;
     encoder0_masks_buf[BRIGHTNES_FUNC_NUM] = MASK_OFF;
     encoder0_masks_buf[ZOOM_FUNC_NUM] = MASK_OFF;
     encoder0_masks_buf[POS_NEG_FUNC_NUM] = MASK_OFF;
     encoder0_masks_buf[POLETTE_FUNC_NUM] = MASK_OFF;
     encoder0_masks_buf[LIGIBILITY_FUNC_NUM] = MASK_OFF;
     encoder0_masks_buf[MARKS_BRIGHTNES_FUNC_NUM] = MASK_ON;
     encoder0_masks_buf[EOC_BRIGHTNES_FUNC_NUM] = MASK_ON;
break;

case N_MODE_IR:   
     EOC_POWER_ON;
     CAM_POWER_OFF;
     SPI_Cmd(SPI2, DISABLE);
     downCS_silar;
     cam_power_state = false;
     if(cam_power_state)
     {
      spi_objects[COMMAND_REG_ADDR].wright_data = OLED_OFF_COMMAND;
      spi_sets.current_function = OLED_OFF_COMMAND; 
      while(senspar.change_par != true)spi_silar_tasks();
      senspar.change_par = false;   
     }
   led_pulse_enable = true;
   net_sets.net_encoder_0 = true;
   encoder0.adress = ADRESS_ENCODER3;
   encoder0.encoder_func = encoder0_eoc_func; 
//   cam_power_state = false;
//   spi_objects[COMMAND_REG_ADDR].wright_data = CAMERA_OFF_COMMAND;
break; 

}
 if(cam_power_state) redrow_menu_simbol();
}



//==============================================================================
//      SPI TASK MANAGER
//==============================================================================
#ifdef TEST_MODE
u8 spi_test_tasks[4] = {20,21,22,23};
u8 test_task_count;
#endif


u32 prev_cam_state;


void spi_silar_tasks()
{

 bool find_task = false;
 u8  count, temp_task;
 temp_task = spi_task_count;
 u32 prob;
// if(cam_operation == read)
// {
#ifndef TEST_MODE
 if(spi_sets.read_sichro_count==0)
   {
    if(spi_sets.stat_read_enable)
     {
      spi_sets.silar_status = spi_silar_read(STATUS_REG_ADDR);

      for(count=0;count<32;count++)
         {
          if((spi_sets.silar_status>>count)&0x00000001)
            {
             spi_objects[count].read_data = spi_silar_read(READ_COM|spi_objects[count].adress);

             if((spi_objects[count].read_data != spi_objects[count].last_data)&&(spi_objects[count].reg_for_wright))
               {
                if((count <= 16)||(count == 30))              cam_sets.syncro_count = 0;
                spi_objects[count].wright_data = spi_objects[count].last_data;
                spi_objects[count].wright_enable = true;
               }

           if(count==30)
           {
             senspar.change_par = true;
             if(spi_objects[count].last_data == KEY_MENU_CLICK)
              {
               if((0x08&spi_sets.silar_state))
               {
                 spi_objects[COMMAND_REG_ADDR].wright_data = spi_sets.current_function;
                 //meteo_actevate(true);
               }
               else
               {
                //meteo_actevate(false);
               }
              }
            
           }

           if((count == 17)&&(!flash_is_read))
             {
              flash_reading_process();
             //spi_objects[count].reg_for_wright = false;
             }

           if(spi_objects[count].reg_for_wright)
             {
              spi_objects[count].wright_enable = true;
              if(count == 30)spi_sets.stat_read_enable = false;
             }
         }
       }
     }
     else
      {
      if(!spi_objects[count].wright_enable)spi_objects[count].error_count++;
      if(spi_objects[count].error_count>10)
        {
         senspar.change_par = true;
         init_spi_objects();
        }
      }

       

    spi_sets.silar_status = 0;

//    spi_sets.silar_state = spi_silar_read(CAMERA_STATE_ADDR);
  //  if((0x08&spi_sets.silar_state) && (prev_cam_state!=spi_sets.silar_state)) spi_objects[COMMAND_REG_ADDR].wright_data = spi_sets.current_function;
//    prev_cam_state = spi_sets.silar_state;
    spi_sets.read_sichro_count = READ_SYCHRO_TIME;

   }
#endif
 //if(((0x08&spi_sets.silar_state)) && (prev_cam_state!=spi_sets.silar_state)) spi_objects[COMMAND_REG_ADDR].wright_data = spi_sets.current_function;//Прорисовка текущего пункта оперативного меню при выходе из инженерного
 spi_task_count=0;

      while(!find_task)
           {
            if((spi_objects[spi_task_count].wright_data!=0) && (spi_objects[spi_task_count].wright_enable == true))
              {
               find_task = true;
               if((spi_task_count>=TEMPERATURE_WRIGHT_ADDR)&&(spi_task_count<=INCLINATE_ADDR)) spi_objects[spi_task_count].wright_data &= 0x0FFFFFFF;
               spi_objects[spi_task_count].wright_enable = false;
               spi_silar_wright(WRIGHT_COM|spi_objects[spi_task_count].adress,  spi_objects[spi_task_count].wright_data);
               spi_objects[spi_task_count].sinchro_count = spi_objects[spi_task_count].sinchro_time;
               spi_objects[spi_task_count].last_data  = spi_objects[spi_task_count].wright_data;
               if((spi_task_count ==30)&&(spi_objects[spi_task_count].wright_data == CAMERA_OFF_COMMAND))cam_power_state = false;
               spi_objects[spi_task_count].wright_data=0;
                 
              }
  spi_task_count++;
  if(spi_task_count>spi_sets.spi_obj_q)find_task = true;
           }

}

//==============================================================================
//          SPI READ CAMERA STATE
//==============================================================================
void spi_read_camers_state()
{
    spi_sets.silar_state = spi_silar_read(CAMERA_STATE_ADDR);
  //  if((0x08&spi_sets.silar_state) && (prev_cam_state!=spi_sets.silar_state)) spi_objects[COMMAND_REG_ADDR].wright_data = spi_sets.current_function;
    prev_cam_state = spi_sets.silar_state;

}





//==============================================================================
//           SPI SYNCHRO FUNCTION
//==============================================================================

void spi_sichro_func()
{
 u8 count;
 if(spi_sets.stat_read_enable && (spi_sets.read_sichro_count!=0))spi_sets.read_sichro_count--;
 if(spi_sets.wright_sinchro_count!=0) spi_sets.wright_sinchro_count--;
 for(count=0;count<spi_sets.spi_obj_q;count++)if(spi_objects[count].sinchro_count!=0) spi_objects[count].sinchro_count--;
}



//==============================================================================
//            SPI READ FUNCTION
//==============================================================================
u32 spi_silar_read(u8 addr)
{
 u32 data=0;
 u8 i,data_byte;
 enter_critical_section();
 downCS_silar;


    SPI_I2S_SendData(SPI2, addr|READ_COM);
    while (SPI_I2S_GetFlagStatus(SPI2, SPI_I2S_FLAG_TXE) == RESET);
    SPI_I2S_ReceiveData(SPI2); //for clear Flag_RXNE
    for(i=0; i<4;i++)
       {
        SPI_I2S_SendData(SPI2, 0);
        while (SPI_I2S_GetFlagStatus(SPI2, SPI_I2S_FLAG_TXE) == RESET);
        data_byte = SPI_I2S_ReceiveData(SPI2);
        data = (data<<(8))|((u32)data_byte);
       }
 upCS_silar;
 exit_critical_section();
 return data;
}




//==============================================================================
//             SPI WRIGHT FUNCTION
//==============================================================================
void spi_silar_wright(u8 addr, u32 data)
{
  u8 data_byte;
  u8 i =0;

  enter_critical_section();
  downCS_silar;

        SPI_I2S_SendData(SPI2, addr|WRIGHT_COM);
        while (SPI_I2S_GetFlagStatus(SPI2, SPI_I2S_FLAG_TXE) == RESET);

        data_byte = (u8)(data>>(24));
        SPI_I2S_SendData(SPI2,data_byte );
        while (SPI_I2S_GetFlagStatus(SPI2, SPI_I2S_FLAG_TXE) == RESET);

        data_byte = (u8)(data>>(16));
        SPI_I2S_SendData(SPI2,data_byte );
        while (SPI_I2S_GetFlagStatus(SPI2, SPI_I2S_FLAG_TXE) == RESET);

        data_byte = (u8)(data>>(8));
        SPI_I2S_SendData(SPI2,data_byte );
        while (SPI_I2S_GetFlagStatus(SPI2, SPI_I2S_FLAG_TXE) == RESET);

        data_byte = (u8)(data);
        SPI_I2S_SendData(SPI2,data_byte );
        while (SPI_I2S_GetFlagStatus(SPI2, SPI_I2S_FLAG_TXE) == RESET);
exit_critical_section();
 upCS_silar;

 spi_sets.wright_enable = false;
 spi_sets.stat_read_enable = true;
 //spi_sets.wright_sinchro_count = WRIGHT_SYCHRO_TIME;
}

//==============================================================================
//             CAMERA START SETTINGS
//==============================================================================


//==============================================================================
//             MARKS DEFAULT VALUES READENG
//==============================================================================
void read_marks_state()
{
 spi_objects[MARK_16_ADDR].read_data = spi_silar_read(READ_COM|spi_objects[MARK_16_ADDR].adress);
}



//==============================================================================
//       BALLISTIC CORRECTION ENTER
//==============================================================================
#define NULL_POSSITION_DESCRIPT_1   0x04000000 //1/8 пикселя матрицы, зависит от выверки и дистанции
#define NULL_POSSITION_DESCRIPT_2   0x08000000 //1/8 пикселя матрицы, зависит от выверки
#define NULL_POSSITION_DESCRIPT_3   0x0C000000 // пиксель дисплея, не зависит от выверки и дистанции

void correct_enter(u8 mark_addr, float v_angle,float g_angle, u16 offset, float distance, bool redrow, u32 color)
{
 u32 null_possition;
 u8 step;
 if(mark_addr == MARK_16_ADDR) step =8;
 else    step =8;
 if(color<INVISIBLE)
 {
 if(redrow)
 {
        null_possition = color|NULL_POSSITION_DESCRIPT_1|REDROW_SCREEN;
 }
 else   null_possition = color|NULL_POSSITION_DESCRIPT_1;

 float g_correct_in_pixels, v_correct_in_pixels;
 g_correct_in_pixels = step*g_angle*flash.obj_focus/(flash.pix_size*100*distance);///(2*cam_sets.obj_focus*g_angle*0.0290893)/cam_sets.pix_size;
 v_correct_in_pixels = step*v_angle*flash.obj_focus/(flash.pix_size*100*distance);///(2*cam_sets.obj_focus*v_angle*0.0290893)/cam_sets.pix_size;
 spi_objects[mark_addr].wright_data = null_possition|(0x1fff&((u32)v_correct_in_pixels))|((0x1fff&(((u32)g_correct_in_pixels)+(u32)(offset)))<<13);
 }
 else
 {
   spi_objects[mark_addr].wright_data=0x80000000;
 }
   //spi_objects[MARK_16_ADDR].wright_data = NULL_POSSITION_DESCRIPT
}


//##############################################################################
//          DEFOULT CAMERA SETS
//##############################################################################

void default_cam_sets()
{
  cam_sets.pix_size =  0.012;
  cam_sets.obj_focus = 34.3;
  cam_sets.life_size_snail_val = 1.7;



  if(flash.cam_type&CONFIG_BALL_TEST)spi_objects[MARKS_BLOCK_REG_ADDR].wright_data = AUTO_MARK_MOVENG_BLOCK|AITO_DIST_ENTER_BLOCK;
  else
  {
  spi_objects[MARKS_BLOCK_REG_ADDR].wright_data = 0x04;

  cam_sets.mark_quant      = 4;
  cam_sets.dist_mark[0]    = 100;
  cam_sets.dist_mark[1]    = 400;
  cam_sets.dist_mark[2]    = 500;
  cam_sets.dist_mark[3]    = 600;
  cam_sets.dist_mark[4]    = 600;
  cam_sets.dist_mark[5]    = 600;
  cam_sets.marks_offset[0] = 0;
  cam_sets.marks_offset[1] = 0;
  cam_sets.marks_offset[2] = 0;
  cam_sets.marks_offset[3] = 0;
  cam_sets.marks_offset[4] = 275;//380;
  cam_sets.marks_offset[5] = 275;//380;
  cam_sets.marks_offset[6] = 485;//1700;
  cam_sets.marks_offset[7] = 645;//2200;
  cam_sets.marks_offset[8] = 0;
  cam_sets.mark_addres[0]  = 0;
  cam_sets.mark_addres[1]  = 1;
  cam_sets.mark_addres[2]  = 2;
  cam_sets.mark_addres[3]  = 3;
  cam_sets.mark_addres[4]  = 7;  //улитка
  cam_sets.mark_addres[5]  = 8;  //улитка
  cam_sets.mark_addres[6]  = 9;  //индикация завала
  cam_sets.mark_addres[7]  = 10; //индикация завала
  cam_sets.mark_addres[8]  = 11; // дальномерная.
  }
  
#ifdef FLASH_ENABLE
  flash.reading_count = 0;
  spi_objects[FLASH_READING_ADDRES].wright_data = 0x200;
#else
  flash.reading_count = true;
  flash_is_read = true;
  default_flash_content();
#endif
  
}



//##############################################################################
//                         FLASH READING FUNCTION
//##############################################################################

void flash_reading_process()
{

 if((flash.reading_count>(flash.data_quant+4))&&(flash.reading_count>7))
 {             
   spi_objects[FLASH_READING_ADDRES].reg_for_wright =false;
   flash_is_read = true;
 }
 else
 {
  if(spi_objects[FLASH_READING_ADDRES].read_data != 0)
  {
    if((flash.reading_count ==0)&&(((u8)(spi_objects[FLASH_READING_ADDRES].read_data)) !=FLASH_DATA_TAG)) 
      {
        flash_is_read = true;
        spi_objects[FLASH_READING_ADDRES].read_data = 0;

        flash.cam_type = DEFAULT_CONFIG;
      }
    else
    {
     if(flash.reading_count > 0)
     {
     u32* flash_pointer = &flash.data_quant;
     u8* data = (u8*)flash_pointer;
     *(data+flash.reading_count-1) = ((u8)(0xFF&spi_objects[FLASH_READING_ADDRES].read_data));
     }
     if((spi_objects[FLASH_READING_ADDRES].read_data&0x0000ff00) == (0x200+(flash.reading_count<<8)))flash.reading_count++;
     spi_objects[FLASH_READING_ADDRES].wright_data = 0x200+(flash.reading_count<<8);
     spi_objects[FLASH_READING_ADDRES].read_data =0;

    }
  }
 }

}



//##############################################################################
//                       MARKS CONTROL FUNCTION
//##############################################################################
//#define MARK_START_POSITION           300//1600
//#define LIFE_SIZE_SNAIL_START_POS     496//2535
//#define SCREEN_CENTER 563


  float zoom_val[4] = {ZOOM1, ZOOM2, ZOOM3, ZOOM4};

void marks_syncro_func()
{
 if(cam_sets.syncro_count!=0) cam_sets.syncro_count--;
}



void mark_tasks()
{
  u32 color_mark;
  u8 ball_num;
 // float tresholt = flash.pix_size/flash.obj_focus;
  ball_result ball_res;
  spi_read_camers_state();//spi_sets.silar_state = spi_silar_read(CAMERA_STATE_ADDR);
  ball_num = (u8)(0x0f&(spi_sets.silar_state>>4));
  float obj_focus_var;
  
  if(flash.cam_type&CONFIG_AUTO_FOCUS_TEST)
  {
    if(obj_focus_var != currient_focus)senspar.change_par = true;
    obj_focus_var = currient_focus;
  }
  else obj_focus_var = flash.obj_focus;
  
  
    float tresholt = flash.pix_size/obj_focus_var;
  if(senspar.change_par)
    {
     senspar.change_par = false;

     if(senspar.trabl_par)color_mark = RED_COLOR;
     else                 color_mark = BLUE_COLOR;
     
    // color_mark = INVISIBLE;

      u32 vert_possition, gor_possition, null_possition;

      
      //###################
      //ростовая улитка
      //###################
      
      null_possition =  YELLOW_COLOR|NULL_POSSITION_DESCRIPT_3;
     
      vert_possition = (u32)(LIFE_SIZE_SNAIL_START_POS - (u32)((zoom_val[ZOOM]*obj_focus_var*cam_sets.life_size_snail_val)/(flash.pix_size*senspar.distance)));
      gor_possition  = cam_sets.marks_offset[4];

      spi_objects[cam_sets.mark_addres[4]].wright_data = null_possition|(0x1fff&((u32)vert_possition))|((0x1fff&((u32)gor_possition))<<13);

      null_possition =  YELLOW_COLOR|NULL_POSSITION_DESCRIPT_3;
      vert_possition = (u32)(LIFE_SIZE_SNAIL_START_POS - (u32)((zoom_val[ZOOM]*obj_focus_var*cam_sets.life_size_snail_val)/(flash.pix_size*senspar.distance)));
      gor_possition  = cam_sets.marks_offset[5];

      spi_objects[cam_sets.mark_addres[5]].wright_data = null_possition|(0x1fff&((u32)vert_possition))|((0x1fff&((u32)gor_possition))<<13);


      //#################
      //индикация заклона
      //#################
      
      if(senspar.declinate>30) senspar.declinate = 30;
      if(senspar.declinate<-30) senspar.declinate = -30;

       
      null_possition = color_mark|NULL_POSSITION_DESCRIPT_1; 
      if(flash.cam_type&CONFIG_METEO_TEST)
      {
      vert_possition = MARK_START_POSITION - 5*((s32)(senspar.declinate));
#ifndef CIVIL1024
      if(tresholt > ZOOM_TRESHOLD)gor_possition  = SCREEN_CENTER - (u32)(zoom_val[ZOOM]*obj_focus_var*DECLINE_SCALE_COEFF +16);//declin_gor_poss[ZOOM][0];
      else                        gor_possition  = SCREEN_CENTER - (u32)(zoom_val[0]*obj_focus_var*DECLINE_SCALE_COEFF +16);
#else
      if(ZOOM<2)                  gor_possition  = SCREEN_CENTER - (u32)(zoom_val[0]*obj_focus_var*DECLINE_SCALE_COEFF +16);//declin_gor_poss[ZOOM][0];
      else                        gor_possition  = SCREEN_CENTER - (u32)(zoom_val[0]*obj_focus_var*DECLINE_SCALE_COEFF/3 +16);
#endif
      
      spi_objects[cam_sets.mark_addres[6]].wright_data = null_possition|(0x1fff&((u32)vert_possition))|((0x1fff&((u32)gor_possition))<<13);
      }
      else
      {
       spi_objects[cam_sets.mark_addres[6]].wright_data = 0x80000000;
      }
      
      
     if(flash.cam_type&CONFIG_METEO_TEST)
      {    
      null_possition = color_mark|NULL_POSSITION_DESCRIPT_1;
      if(!(flash.cam_type&CONFIG_BALL_TEST))null_possition|=REDROW_SCREEN; // Redrow screen now, if ballistic is tabble
      vert_possition = MARK_START_POSITION + 5*((s32)(senspar.declinate));
#ifndef CIVIL1024      
      if(tresholt > ZOOM_TRESHOLD)   gor_possition  = SCREEN_CENTER + (u32)(zoom_val[ZOOM]*obj_focus_var*DECLINE_SCALE_COEFF +16);//declin_gor_poss[ZOOM][1];
      else  gor_possition  = SCREEN_CENTER + (u32)(zoom_val[0]*obj_focus_var*DECLINE_SCALE_COEFF +16);
#else
      if(ZOOM<2)                     gor_possition  = SCREEN_CENTER + (u32)(zoom_val[0]*obj_focus_var*DECLINE_SCALE_COEFF +16);//declin_gor_poss[ZOOM][1];
      else  gor_possition  = SCREEN_CENTER + (u32)(zoom_val[0]*obj_focus_var*DECLINE_SCALE_COEFF/3 +16);
#endif
      
      spi_objects[cam_sets.mark_addres[7]].wright_data = null_possition|(0x1fff&((u32)vert_possition))|((0x1fff&((u32)gor_possition))<<13);
      }
      else
      {
        spi_objects[cam_sets.mark_addres[7]].wright_data = 0x80000000;
      }
             
             
     //#######################
     //        Расчет положений марок дальности
     //#######################        
     
    if(flash.cam_type&CONFIG_BALL_TEST)
           {             
     for(u16 i =0; i<cam_sets.mark_quant; i++)
        {
          if(senspar.distance>100)correct_enter(cam_sets.mark_addres[i],ball_res.MOAySM,ball_res.MOAxSM, cam_sets.marks_offset[i],(float)cam_sets.dist_mark[i],false/*(i==(cam_sets.mark_quant-1))*/,INVISIBLE);
          else
          {
          ball_res = balCalculate((float)cam_sets.dist_mark[i], flash.ballistics_buf[ball_num]);
          if(ball_res.correct) correct_enter(cam_sets.mark_addres[i],ball_res.MOAySM,ball_res.MOAxSM, cam_sets.marks_offset[i],(float)cam_sets.dist_mark[i],false/*(i==(cam_sets.mark_quant-1))*/,YELLOW_COLOR);
          }
        }
     //
     if(EN_MENU) ball_res = balCalculate(100, flash.ballistics_buf[ball_num]);
     else        ball_res = balCalculate(senspar.distance, flash.ballistics_buf[ball_num]);
     if(ball_res.correct) correct_enter(MARK_16_ADDR,ball_res.MOAySM,ball_res.MOAxSM,0, senspar.distance, true,YELLOW_COLOR);
     else
     {
      spi_objects[cam_sets.mark_addres[7]].wright_data = spi_objects[cam_sets.mark_addres[7]].wright_data|REDROW_SCREEN;
      spi_objects[cam_sets.mark_addres[6]].wright_data = spi_objects[cam_sets.mark_addres[6]].wright_data|REDROW_SCREEN;
     }
     }
    }
cam_sets.syncro_count = MARK_CORRECT_PERIOD;
}


/*##############################################################################

            OPERATOR PRESENTS CONTROL

##############################################################################*/

void oled_control()
{
          
         if(display_st == display_make_off) 
         {
           display_st = display_off;
           senspar.change_par = false;
           spi_objects[COMMAND_REG_ADDR].wright_data = OLED_OFF_COMMAND;
           spi_sets.current_function = OLED_OFF_COMMAND;
           while(senspar.change_par != true)spi_silar_tasks();
           senspar.change_par = false; 
         }
          
        if(display_st == display_make_on) 
         {
           display_st = display_on;
           senspar.change_par = false;
           spi_objects[COMMAND_REG_ADDR].wright_data = OLED_ON_COMMAND;
           spi_sets.current_function = OLED_ON_COMMAND;
           while(senspar.change_par != true)spi_silar_tasks();
           senspar.change_par = false; 
         }
          
}

u8 eye_sens_set_level_count;
extern ADC_result ADC_data;
void eye_sens_set_level()
{
 float eye_temp = 0.0;
 Led_ON;
 eye_sens_set_level_count =0;
 while(eye_sens_set_level_count<100)
 {
   if(eye_sens_set_level_count%10==9) {eye_temp += (float)ADC_data.operator_photo; eye_sens_set_level_count++;} 
 }
 eye_sens_par.eye_threshold = (eye_temp/10)+50;
}

