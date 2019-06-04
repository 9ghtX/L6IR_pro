/**
 * @file   system_timer.h
 * @date   19 июля 2013 г.
 * @author
 * @brief  system_timer
 */

#ifndef SYSTEM_TIMER_H_
#define SYSTEM_TIMER_H_

#include <hal_types.h>

typedef uint32_t tick_t;

void system_timer_init(void);
void system_timer_start(void);
void system_timer_stop(void);
void system_delay(tick_t ticks);

extern volatile tick_t system_ticks;
static inline tick_t get_system_timer_ticks(void){ return (system_ticks); }

#endif /* SYSTEM_TIMER_H_ */
