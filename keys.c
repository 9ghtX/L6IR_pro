#include "keys.h"

void Init_key( GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin, Kes_type* key)
{
  key->PORT = GPIOx;
  key->PIN  = GPIO_Pin;
  key->event_type = NON_EVENT;
  key->count =0;
}

void test_key(Kes_type* key)
{
 if( GPIO_ReadInputDataBit(key->PORT,key->PIN )==0)
   {
    key->count++;
    if(key->count >200)key->count=200;
   }

}
     
uint8_t get_key_event(Kes_type* key)    
{
 if(GPIO_ReadInputDataBit(key->PORT,key->PIN )!=0)
   {    
    if((key->count >= CLICK_COUNT) && (key->count <= PRESS_COUNT))key->event_type = CLICK_EVENT;
    else  key->event_type = NON_EVENT;
    key->count =0;
   }
 if(key->count > PRESS_COUNT)key->event_type = LONG_PRESS;
 return key->event_type;
}
