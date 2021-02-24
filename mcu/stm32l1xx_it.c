#include "stm32l1xx_it.h"
#include "net.h"
#include "led_control.h"
#include "keys.h"
void NMI_Handler(void){ }
void HardFault_Handler(void)
{

  while (1)  /* Go to infinite loop when Hard Fault exception occurs */
  {
  }
}

void MemManage_Handler(void)
{
  while (1)  /* Go to infinite loop when Memory Manage exception occurs */
  {
  }
}
void BusFault_Handler(void)
{
  while (1)  /* Go to infinite loop when Bus Fault exception occurs */
  {
  }
}

void UsageFault_Handler(void)
{
  while (1)  /* Go to infinite loop when Usage Fault exception occurs */
  {
  }
}

void SVC_Handler(void)
{
}

void DebugMon_Handler(void)
{
}

void PendSV_Handler(void)
{
}


 extern u8 last_com;

void USART1_IRQHandler(void)
{
  u8 temp;

  if(USART_GetITStatus(USART1, USART_IT_RXNE) != RESET)
  {
    /* Read one byte from the receive data register */	

	temp = USART_ReceiveData(USART1);
//------new------------------------------
        if(temp == SOH)clean(&RXbuf);
//------new------------------------------
	
	if(!get_full(&RXbuf))//	push(&RXbuf,temp);
		{
		push(&RXbuf,temp);
		if(temp == ETX)
                {  
                  rs_frame=true;
		}
                  
                }
        
  }

  if(USART_GetITStatus(USART1, USART_IT_TC) != RESET) //_TXE
  {
    /* Write one byte to the transmit data register */
	if(!get_empty(&TXbuf))
		{
		  temp = pop(&TXbuf);
                  uDE;//DE = 1;
		  USART_SendData(USART1, temp);
		}
	else	
                {
                  /* Disable the USART1 Transmit interrupt */
                  //USART_ITConfig(USART1, USART_IT_TXE, DISABLE);
                  USART_ITConfig(USART1, USART_IT_TC, DISABLE);
                  dDE;//DE = 0;             //uart input
                }
	
  	}
  
   if(USART_GetITStatus(USART1, USART_IT_ERR) != RESET)
     {
      temp =0;
     }
   if(USART_GetITStatus(USART1, USART_IT_PE) != RESET)
     {
      temp =0;
     }
   if(USART_GetITStatus(USART1, USART_IT_CTS) != RESET)
     {
      temp =0;
     }
   if(USART_GetITStatus(USART1, USART_IT_NE) != RESET)
     {
      temp =0;
     }
   if(USART_GetITStatus(USART1, USART_IT_FE) != RESET)
     {
      temp =0;
     }
   if(USART_GetITStatus(USART1, USART_IT_ORE_RX) != RESET)
     {
      temp =0;
      USART_ReceiveData(USART1);
     }
   if(USART_GetITStatus(USART1, USART_IT_ORE_ER) != RESET)
     {
      temp =0;
     }
   if(USART_GetITStatus(USART1, USART_IT_TC) != RESET)
     {
      temp =0;
     }
   if(USART_GetITStatus(USART1, USART_IT_IDLE) != RESET)
     {
      temp =0;
     }

  }


/**
  * @brief  This function handles SysTick Handler.
  * @param  None
  * @retval None
  */

u16 counter_sys;
static u8 irled;
static u8 irledmax=255;
bool net_fault_flag;
extern u16 key1_count;
extern u8 galenic_counter;
extern u16 error_counter;
extern u16 expo_timeout;
extern bool led_pulse_enable;
extern u8 led_brightnes;
extern u8 eye_sens_set_level_count;
extern Kes_type key_menu;
u8 keys_counter;
extern u8 main_net_count;
void SysTick_Handler(void)
{

 system_ticks++;
 if(task_flag)counter_sys++;
 if(galenic_counter) galenic_counter--;
 if(error_counter) error_counter--;
 if(expo_timeout) expo_timeout--;
 //if(encoder.disable_timer!=0)encoder.disable_timer--;
 net_counter();
 spi_sichro_func();
 keys_syncro_func();
 marks_syncro_func();
 sens_synchro_func();
// Operator_present_control();
 if(counter_sys>system_wait_timer)
 {
  counter_sys = 0;
  task_flag = false;
  net_fault_flag = true;
 }
 
 if(keys_counter>30)
 {
   keys_counter =0;
   test_key(&key_menu);
 }
 else keys_counter++;
 
 if(eye_sens_set_level_count<100)eye_sens_set_level_count++;
 
 if(key1_count!=0) key1_count--;
 //counter_delay(time);		//(&TimeDelay);
 if((main_net_count !=0)) main_net_count--;
 if(led_pulse_enable)   //регулировка яркости ик светодиода 
 {
   irled=irled+10;
   if(irled==irledmax)
     irled=0;
   if(irled<=led_brightnes)
     led_pulse_control();
   else
     led_off();
 }
 else 
   led_off();
 

}
