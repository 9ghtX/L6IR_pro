
/**
 * @file rfu_ram.c
 */

#include "rfu_platform.h"

#define read32(pBuf)                                                           \
  (((uint32_t)(pBuf)[0]) | ((uint32_t)(pBuf)[1] << 8) |                        \
   ((uint32_t)(pBuf)[2] << 16) | ((uint32_t)(pBuf)[3] << 24))

#define read16(pBuf) (((uint16_t)(pBuf)[0]) | ((uint16_t)(pBuf)[1] << 8))

#define CRC8_NEXT(crc, data)                                                   \
  do {                                                                         \
    uint8_t temp = data;                                                       \
    crc = crc ^ temp;                                                          \
    for (int i = 0; i < 8; ++i) {                                              \
      if (crc & 1) {                                                           \
        crc = crc ^ 0x18;                                                      \
        crc = 0x80 | (crc >> 1);                                               \
      } else {                                                                 \
        crc = ~0x80 & (crc >> 1);                                              \
      }                                                                        \
    }                                                                          \
  } while (__LINE__ == -1)

typedef enum protocol_symbols_et {
  START_SYMBOL = 0x24,
  STOP_SYMBOL = 0x3B,
  ESCAPE_SYMBOL = 0x2F
} protocol_symbols_t;

typedef enum protocol_state_et {
  rx_start_symbol = 0,
  rx_destination_address = 1,
  rx_operation_code = 2,
  rx_data = 3,
  process_command = 4
} protocol_state_t;

typedef enum operation_code_et {
  o_info = 63,   //'?'
  o_crc = 99,    //'c'
  o_auth = 105,  //'a'
  o_erase = 101, //'e'
  o_write = 119, //'w'
  o_exit = 120,  //'x'
  o_swicth = 0xFF //already switched to reprogramming mode - send ok
} operation_code_t;

RFU_CODE(void send_char(int ch))
{
  while (!(RFU_USARTx->SR & USART_FLAG_TXE))
    ;
  RFU_USARTx->DR = (ch & 0x1FF);
}

RFU_CODE(void send(uint8_t *data, uint32_t length))
{
  uint8_t crc = 0;
  RFU_RS485_TXON();

  send_char(START_SYMBOL);
  while (length--) {
    uint8_t ch = *data;
    CRC8_NEXT(crc, ch);
    if ((START_SYMBOL == ch) || (STOP_SYMBOL == ch) || (ESCAPE_SYMBOL == ch)) {
      send_char(ESCAPE_SYMBOL);
      ch ^= 0xFF;
    }
    send_char(ch);
    data++;
  }
  if ((START_SYMBOL == crc) || (STOP_SYMBOL == crc) || (ESCAPE_SYMBOL == crc)) {
      send_char(ESCAPE_SYMBOL);
      crc ^= 0xFF;
  }
  send_char(crc); 
  send_char(STOP_SYMBOL);
  while (!(RFU_USARTx->SR & USART_FLAG_TC ));
  RFU_RS485_TXOFF();
}

RFU_CODE(void send_ec(uint8_t self_address, uint8_t opcode, uint8_t ec))
{
  uint8_t data_buffer[3] = {self_address, opcode, ec};
  send(data_buffer, sizeof(data_buffer)/sizeof(data_buffer[0]));
}

RFU_CODE(void send_u32(uint8_t self_address, uint8_t opcode, uint32_t value))
{
  uint8_t data_buffer[6] = {self_address, opcode, 0,0,0,0 };
  data_buffer[2]  =   value;
  data_buffer[3]  =   value>>8;
  data_buffer[4]  =   value>>16;
  data_buffer[5]  =   value>>24;
  send(data_buffer, sizeof(data_buffer)/sizeof(data_buffer[0]));
}

RFU_CODE(void rfu_main(uint8_t nt_address))
{
  uint8_t in_buffer[RFU_PROTOCOL_MAX_PKT_SIZE] = {0};
  uint16_t in_count = 0;
  volatile uint8_t crc = 0;
  uint8_t byte_stuffing_on = 0;

  uint8_t opcode = 0;
  uint8_t auth_ok = 0;
  protocol_state_t protocol_state = rx_start_symbol;

  // initialize
  // ! —читаем что UART уже проинициализирован как надо.

  // exec app
  while (1) {
    /* receiving */
    if (!(RFU_USARTx->SR & USART_FLAG_RXNE)) {
     continue;
    }
    uint8_t rxed = (RFU_USARTx->DR & 0xFF);
    /**************************************************************************/

    /* process received byte */
    if (byte_stuffing_on) {
      rxed ^= 0xFF;
      byte_stuffing_on = 0;
    } else if (ESCAPE_SYMBOL == rxed) {
      byte_stuffing_on = 1;
      continue; /* receive next byte */
    } else if (STOP_SYMBOL == rxed) {
      protocol_state = process_command;
    } else {
    }
    /**************************************************************************/

    switch (protocol_state) {

    case rx_start_symbol:
      if (START_SYMBOL == rxed) {
        crc = 0;
        byte_stuffing_on = 0;
        in_count = 0;
        protocol_state = rx_destination_address;
      }
      break;

    case rx_destination_address:
      protocol_state =
          (nt_address == rxed) ? rx_operation_code : rx_start_symbol;
      CRC8_NEXT(crc, rxed); /*crc push*/
      break;

    case rx_operation_code:
      opcode = rxed;
      protocol_state = rx_data;
      CRC8_NEXT(crc, rxed); /*crc push*/
      break;

    case rx_data:
      /* accumulate data */
      if (in_count < RFU_PROTOCOL_MAX_PKT_SIZE) {
        in_buffer[in_count] = rxed;
        CRC8_NEXT(crc, rxed); /*crc push*/
        ++in_count;
      } else {
        /*buffer ovferflowed*/
        protocol_state = rx_start_symbol;
      }
      break;

    case process_command:
      if ((0 != crc) || (0 == in_count)) {
        /* crc failed */
        protocol_state = rx_start_symbol;
        break;
      }

      /*crc - ok(0) packet ready - handling operation starts here*/
      in_count -= 1; /*remove crc byte*/
      
      if(opcode == o_info) {
        send_u32(nt_address, o_info, RFU_DEVICE_ID);
      } else if( opcode == o_swicth ) {
        send_u32(nt_address, o_swicth, RFU_DEVICE_ID);
      } else if ( opcode == o_auth )  {
        /* todo add auth procedures */
        /* return info - to usart */
       
        RFU_FLASH_Unlock();       
        RFU_FLASH_ClearFlag(FLASH_COMPLETE |FLASH_ERROR_WRP | FLASH_ERROR_PROGRAM );	

        send_u32(nt_address, o_auth, RFU_DEVICE_ID);
        auth_ok = 1;
      } else {
        if (!auth_ok) {
          /*return code 4 to master*/
          send_ec(nt_address, opcode, 4);
          /*password protection not passed*/
          protocol_state = rx_start_symbol;
          break;
        }

        if (opcode == o_crc) {
#if 0 // crc not used yet
          if (12 != in_count) {
            /*format error*/
            send_ec(nt_address, o_crc, 2);
            protocol_state = rx_start_symbol;
            break;
          }

          uint32_t start_address = read32(&in_buffer[0]);
          uint32_t length = read32(&in_buffer[4]);
          uint32_t crc32_data = read32(&in_buffer[8]);
          /*crc32 calc*/

          CRC->CR = 1;
          for (uint32_t i = 0; i < length; length += 4) {
            CRC->DR = *((uint32_t *)(start_address + i));
          }
          CRC->DR = crc32_data;
          //check crc
          (0 == CRC->DR) ? 0 : 0xFF;
#endif    
            uint8_t ok = 0xFF;        
            send_ec(nt_address, o_crc, ok);
          

        } else if (opcode == o_erase) {
          // todo add custom flags for pages erasure
          // erase flash
                    
           uint8_t ec = (FLASH_COMPLETE == RFU_FLASH_ErasePage(0x08000000)) ? 0:4;
           send_ec(nt_address, o_erase, ec);

        } else if (opcode == o_write) {
          if (12 > in_count) {
            /*format error*/
            send_ec(nt_address, o_write, 2);
            protocol_state = rx_start_symbol;
            break;
          }
#if 0 // crc not used yet
          uint32_t crc32_data = read32(&in_buffer[in_count - 4]);
#endif          
          uint32_t start_address = read32(&in_buffer[0]);
          uint32_t length        = read32(&in_buffer[4]);
          uint8_t *data_ptr = &in_buffer[8];
          /* send ack code 3. */

          /* check crc32 of data_ptr length */
#if 0
           CRC->CR = 1;
           for (uint32_t i = 0; i < length + 4; i += 4) {
             CRC->DR = *((uint32_t *)(in_buffer + i));
           }
           if(0 != CRC->DR)
           {
             send_ec(nt_address, o_write, 2);
             protocol_state = rx_start_symbol;
             break;
           }
#endif
           /* check alignment */
           if(0 != length % sizeof(uint16_t))
           {
             send_ec(nt_address, o_write, 2);
             protocol_state = rx_start_symbol;
             break;
           }

           /* check bank ranges */
          if (!IS_FLASH_PROGRAM_ADDRESS(start_address) &&
              (!IS_FLASH_PROGRAM_ADDRESS(start_address + length))) { // address range error:
                  send_ec(nt_address, o_write, 2);
             protocol_state = rx_start_symbol;
             break;
           }

          /* write flash */

            for (uint32_t address = start_address; address < start_address + length;
                 address += sizeof(uint32_t)) {
              uint32_t data = read32(data_ptr);
              FLASH_Status st = RFU_FLASH_FastProgramWord(address, data);
              data_ptr += sizeof(uint32_t);
            }
            send_ec(nt_address, o_write, 0);
          /* return code 0 to MASTER */
        } else if (opcode == o_exit) {

          RFU_FLASH_Lock();
          /* return code 0 to MASTER */
          send_ec(nt_address, o_exit, 3);
          /* device restart here */
          RFU_Restart();

        } else {
          send_ec(nt_address, o_exit, 1);
          /* bad command - return code 1 to MASTER */
        }
        protocol_state = rx_start_symbol;
      }
      break;
    default:
      protocol_state = rx_start_symbol;
      break;
    }
  } /* while(1) */
}

