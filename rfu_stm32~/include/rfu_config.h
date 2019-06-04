#ifndef RFU_H
#define RFU_H

#ifdef __cplusplus
extern "C" {
#endif


#define RFU_DEVICE_ID            0
#define RFU_USARTx                 USART1
#define RFU_RS485_TXON()     do{GPIOC->BSRR=GPIO_Pin_9;}while(0)
#define RFU_RS485_TXOFF()    do{GPIOC->BRR=GPIO_Pin_9;}while(0)
#define RFU_PASSWORD          "12345"

#define onSystemUpdateStart()
#define getDeviceAddress()          8

#define RFU_PROTOCOL_MAX_PKT_SIZE 512UL

#ifdef __cplusplus
}
#endif

#endif //RFU_H


