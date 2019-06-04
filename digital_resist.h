#include "i2c.h"
#include "stm32l1xx_i2c.h"
#include "stm32l1xx_syscfg.h"
#include "stm32l1xx_rcc.h"

#define DIGITAL_RESIST_ADRESS     0xA0
#define WRIGHT_FLAG               0x01
#define WRIGHT_REG_ADR            0x00
void digital_resist_ini();
void digital_resist_send_function(u8);