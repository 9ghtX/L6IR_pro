#include <hal_types.h>
#include "protocol.h"
#include "Ball.h"
#include "i2c.h"
#include "galenic.h"

#ifdef TNM_MODE
#include "digital_resist.h"
#endif


u8 TXD[192];				//buffer
u8 RXD[64];				//buffer
 key_struct keys;
bool key1_pulse = false;
u16  key1_count = 0;
bool encoder_ini=false;
bool flash_is_read = false;
extern operator_control_consist operator_ctrl_consist;
u8 galenic_counter =0;
extern bool cam_power_state;
extern u8 eoc_brightnes_value;
bool led_pulse_enable=false;

void iclinate_analis()
{
 if(((senspar.declinate - senspar.prev_declinate)>1) || ((senspar.declinate - senspar.prev_declinate)<-1))
   {
     senspar.change_par = true;

   }
 if((senspar.inclinate>45) || (senspar.inclinate<-45)||(senspar.declinate>5) || (senspar.declinate<-5))
   {
    if(!senspar.trabl_par)
    {
      senspar.change_par = true;
      senspar.trabl_par  = true;
    }
   }
 else
   {
    if(senspar.trabl_par)
    {
      senspar.change_par = true;
      senspar.trabl_par  = false;
    }
   }
}



int main()
{
        SystemInit();
        RCC_PLLConfig(RCC_PLLSource_HSE,RCC_PLLMul_4,RCC_PLLDiv_2);
        RCC_PLLCmd(ENABLE);
        RCC_SYSCLKConfig(RCC_SYSCLKSource_PLLCLK);
        RCC_HCLKConfig(RCC_SYSCLK_Div1);
        RCC_PCLK2Config(RCC_HCLK_Div1);
        
        SystemCoreClockUpdate();
        system_timer_init();
	
        NVIC_Configuration();

        #ifdef TNM_MODE
        KEY1_SET;
        CAM_POWER_OFF;
        #endif
        //SPI_EEPROM_Init();

        timers_config();
      
        
        //***************
        #ifndef TNM_MODE
        #ifndef TEST_MODE
        system_wait_timer = SECOND_9;//SECOND_0_2;//NO_DELAY;
        if(system_wait_timer != NO_DELAY)
        {
        task_flag =true;     // пауза перед инициализацией
        while(task_flag);
        }
        #endif
        #endif
        
        //***************
        GPIO_Configuration();
        UART_init();
        #ifndef TNM_MODE
        SPI_init_func();
        #endif
        
        #ifdef TNM_MODE
        cam_power_state = false;
        #endif
        ADC_init_func();
        //i2c_init();
        //lps331ap_init();
       //LSM6DS33_congig();

        clean(&RXbuf);
        init_spi_objects();

        IniRingBuf(TXD,sizeof(TXD), &TXbuf);
	IniRingBuf(RXD,sizeof(RXD), &RXbuf);
        IniRingBuf(net_status.fifo_buf, sizeof(net_status.fifo_buf), &net_status.fifo_stack);
        IniRingBuf(keys.buffer, sizeof(keys.buffer), &keys.keys_stack);
        
        default_ball_ini();
        default_cam_sets();
        

#ifndef TNM_MODE
        spi_silar_read(STATUS_REG_ADDR);

        spi_read_camers_state();        
         //system_wait_timer =15000;
         task_flag =true;        
         u32 temp_data;
//         spi_objects[20].sinchro_count = 50;
//        while(task_flag)
//         { 
//           if(!spi_objects[20].sinchro_count)
//           {
//            temp_data = spi_silar_read(DISTANCE_ADDR);
//            if(temp_data != 0) task_flag = false;
//            spi_objects[20].sinchro_count = 50;
//           }
//         }

        while(!flash_is_read)
        {
         spi_silar_tasks();
         if(!task_flag) flash_is_read = true;
        }

        //flash.cam_type = PT2_CONFIG;


        //flash.cam_type = TNV_CONFIG; 
       // flash.cam_type = TNV_CU_CONFIG;
        
        //flash.cam_type = PT6_CONFIG;
        //flash.cam_type = PT6_AB_CONFIG;
        
          //flash.cam_type = PT9_1ENCODER_M_CONFIG;
         // flash.cam_type = PT9_1ENCODER_BME_CONFIG;
        //flash.cam_type = PT9_1ENCODER_ME_CONFIG;
         // flash.cam_type = PT9_1ENCODER_E_CONFIG;
        flash.cam_type = PT9_1ENCODER_CONFIG;
        //flash.cam_type = PT9_2ENCODER_B_CONFIG;
        //flash.cam_type = PT9_2ENCODER_CONFIG;
        //flash.cam_type = PT9_2ENCODER_CU_CONFIG;

        
        //flash.cam_type = SWIR_N_EXPO_CONFIG;
        //flash.cam_type = SWIR_CONFIG;
        //flash.cam_type = SWIR_BME_CONFIG;
        // flash.cam_type = SWIR_BM_CONFIG;
#else
  //     digital_resist_ini();      
       flash.cam_type = TNP_CONFIG;
#endif
   

        smart_device_ini();
        func_buffer_ini();
        encoder_func_ini();
        system_wait_timer =500;
        pref_net_init();
        senspar.change_par = true;
        senspar.temp_auto = true;
        senspar.press_auto = true;
        operator_ctrl_consist = not_action;
        #ifndef TNM_MODE
        
        redrow_menu_simbol();
        #else
        set_device_mode(N_MODE);//N_MODE);
        #endif
        Led_ON;
        while(1)
        {
          //GPIO_SetBits(GPIOB, GPIO_Pin_10);
          //GPIO_SetBits(GPIOB, GPIO_Pin_11);
          //u8 send_data = eoc_brightnes_value;
          //i2c_WriteReg(I2C2, DIGITAL_RESIST_ADRESS|WRIGHT_FLAG, WRIGHT_REG_ADR, &send_data, 1);
         if(rs_frame)
          {
           protocol();
           rs_frame = false;
          }
         #ifndef TEST_MODE
          if(net_sets.net_pr == NET_MASTER) net_task();
          if(net_fault_flag) net_fault_function();
         #endif


         #ifdef TEST_MODE
          u32 test_data;
          if( )
         #endif
            
          if(cam_power_state)
          {
            spi_silar_tasks();
            keys_analis();
            
           if(flash.cam_type&CONFIG_BALL_TEST)
           {
           #ifndef TABLE_BAL
          //iclinate_analis();
          if(cam_sets.syncro_count==0)mark_tasks();
          #endif
           }
          }
          else
          {
            keys_analis_P_O();
          }
          //i2c_sensors_tasks();
          Power_control_func();
          
          oled_control();
          
          //LSM6DS33_tasks();
          //if((!galenic_counter)&&(flash.cam_type&CONFIG_GALINIC_TEST))
#ifdef TNM_MODE
          if(!galenic_counter){galenic_func(); galenic_counter =40;}
#endif
 //         Operator_present_control();
//         if(led_pulse_enable) 
//            {
//              led_pulse_control();
//            }
//         else led_off();
          
        }
  return 0;
}
