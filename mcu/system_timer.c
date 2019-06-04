/**
 * @file   system_timer.c
 * @date   19 июля 2013 г.
 * @author
 * @brief  system_timer
 */


#include  <hal_mcu.h>
//#include  <mTask.h>
//#include  <debug.h>
#include  <system_timer.h>

volatile tick_t system_ticks;

void system_timer_init(void)
{
  SystemCoreClockUpdate();
	if ( SysTick_Config( SystemCoreClock / 500UL) )
	{
		while(1)
                {
                  
                }
	}
	system_ticks = 0;
}


void system_delay(tick_t ms)
{
	tick_t time = system_ticks;
	while( (system_ticks - time) < ms )
	{
	}
}

/**
  * @brief  This function handles SysTick Handler.
  * @param  None
  * @retval None
  */

