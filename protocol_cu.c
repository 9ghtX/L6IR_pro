#ifdef CONTROL_UNIT

#include "protocol.h"
#include "net.h"
#include "GPS.h"
#include "spieeprom.h"
#include "Persey_headers.h"


 void protocol()
{
 bool st;
 u8 command, adress, size;
 del_stsp(&RXbuf);
 st = check_crc(&RXbuf);
 adress = pop(&RXbuf);
 command = pop(&RXbuf);

#ifdef GPS_UNIT
  if((st)&&((adress == ADRESS)||(adress == ADRESS_GPS)||(net_sets.net_pr == NET_MASTER)))
#else
  if((st)&&((adress == ADRESS)||(net_sets.net_pr == NET_MASTER)))
#endif

 {
   switch(command)
   {
    case GET_KEY_CODE:
      size = get_fill(&keyBuf);
     push(&TXbuf,ADRESS);
     push(&TXbuf,GET_KEY_CODE);
     push(&TXbuf, size);
     for(u8 i=0; i<size; i++)
     {
      push(&TXbuf,pop(&keyBuf));
     }
    insert_crc(&TXbuf);
    insert_stsp(&TXbuf);
    break;

    case GET_GPS_DATA:
     push(&TXbuf,ADRESS);
     push(&TXbuf,GET_GPS_DATA);
     load_gps_buffer(&TXbuf);
     insert_crc(&TXbuf);
     insert_stsp(&TXbuf);
    break;

    case WRITE_SERIAL_NUMBER:
      size = sizeof(serial_number);
      u8 data, i;

      for(i=0;i<size;i++)
      {
       data = pop(&RXbuf);
       serial_number |= (data<<(8*i));
      }
      EEPROMWriteByte(SERIAL_NUMBER_ADDRESS, data);
      push(&TXbuf,ADRESS);
      push(&TXbuf,WRITE_SERIAL_NUMBER);
      insert_crc(&TXbuf);
      insert_stsp(&TXbuf);
    break;

    case READ_SERIAL_NUMBER:
     data = EEPROMReadByte(SERIAL_NUMBER_ADDRESS);
     push(&TXbuf,ADRESS);
     push(&TXbuf,READ_SERIAL_NUMBER);
     push(&TXbuf,data);
     insert_crc(&TXbuf);
     insert_stsp(&TXbuf);
    break;

    case GET_PO_VERSION:
     push(&TXbuf,ADRESS);
     push(&TXbuf, GET_PO_VERSION);
     push(&TXbuf, ((u8)(PROGRAMM_VERSION&0xff)));
     push(&TXbuf, ((u8)((PROGRAMM_VERSION>>8)&0xff)));
     insert_crc(&TXbuf);
     insert_stsp(&TXbuf);
    break;

    case 0x15:
       data = EEPROMReadStatus();
       push(&TXbuf,data);
    break;

   }
#ifndef L6IR_CU
   USART_ITConfig(USART1, USART_IT_TC, ENABLE);
#endif
 }
 clean(&RXbuf);
 task_flag = false;
 counter_sys  = 0;
}

#endif