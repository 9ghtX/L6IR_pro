/**
 * @file   hal_critical_section.h
 * @date   07 рту. 2013 у.
 * @author lavrentev
 * @brief  hal_critical_section
 */
#ifndef HAL_CRITICAL_SECTION_H_
#define HAL_CRITICAL_SECTION_H_

#include "hal_types.h"
#include "hal_mcu.h"

extern uint16_t critcal_section_level;

static inline void enter_critical_section(void)
{
  if(0 == critcal_section_level) __disable_irq();
  critcal_section_level++;
}


static inline void exit_critical_section(void)
{
  critcal_section_level--;
  if( 0 == critcal_section_level ) __enable_irq();
}

#endif /* HAL_CRITICAL_SECTION_H_ */
