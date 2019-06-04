#ifndef BUFFER_H
#define BUFFER_H

#include "stm32l1xx.h"
#include <stdio.h>
#include <hal_types.h>
//======NET CODE=========================
#define SOH   	0x24//0xFF
#define DLE   	0x2F//0x10
#define ETX   	0x3B//0x03
//======end NET CODE=====================

typedef struct
{
    u8  size;
    u8* buf;
    u8  index_rd;
    u8  index_wr;
    bool  empty;
    bool  full;
}Buf_Head;

typedef struct
{
    u8  size;
    int* buf;
    u8  index_rd;
    u8  index_wr;
    bool  empty;
    bool  full;
}IBuf_Head;



	void IniRingBuf(u8 *pbuf,u8 Size, Buf_Head* head);
	void IniRingIBuf(int *pbuf,u8 Size, IBuf_Head* head);

    u8 get_free(Buf_Head* bulk);
    u8 get_fill(Buf_Head* bulk);

    bool get_empty(Buf_Head* bulk);
    bool get_full(Buf_Head* bulk);

    void clean(Buf_Head* bulk);
    void push(Buf_Head* bulk, u8 item);
    u8 pop(Buf_Head* bulk);

    void ipush(Buf_Head* bulk, int item);
    int  ipop(Buf_Head* bulk);
	
	void insert_stsp(Buf_Head* head);
	void del_stsp(Buf_Head* head);
	u8 dow_crc(Buf_Head* head);
	bool check_crc(Buf_Head* head);
	bool insert_crc(Buf_Head* head);
        void next(Buf_Head* head, u8 c);

#endif	//BUFFER_H
