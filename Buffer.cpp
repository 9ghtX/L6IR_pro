/************************************************************
  * @file    Project/LPD/Soft/bus.c
  * @author  Sergey Voron
  * @version V 3.0
  * @date    4/02/2010
  * @brief   Ring buffer
************************************************************/
#include "buffer.h"
#include "stm32l1xx.h"

void IniRingBuf(u8 *pbuf,u8 Size, Buf_Head* head)	//)
//void IniRingBuf(u8 Size, Buf_Head* head)	//)
		{
        head->size = Size;//sizeof pbuf;
        head->buf=pbuf;
        head->index_wr=head->index_rd=0;
        head->empty = true;
        head->full  = false;
		}
//=========================================================
bool get_empty(Buf_Head* head)
	{
	return head->empty;
	}
bool get_full(Buf_Head* head)
	{
	return head->full;
	}
//------------------------------------------------------
u8 get_free(Buf_Head* head)
	{
		u8 free;
		if(head->full) free=0;
		else
			{
			if(head->empty) free=head->size;
			else
				{
				if(head->index_wr > head->index_rd)	free = head->index_rd + head->size - head->index_wr;
				else 			 	                free = head->index_rd - head->index_wr;
				}	
			}
	return free;			
	}
//------------------------------------------------------
u8 get_fill(Buf_Head* head)
	{
		int fill;
		if(head->empty) fill=0;
		else
			{
			if(head->full) fill=head->size;
			else
				{
				if(head->index_wr > head->index_rd)	fill = head->index_wr - head->index_rd;
				else 			 	                fill = head->size + head->index_wr - head->index_rd;
				}
			}
	return fill;			
	}
//------------------------------------------------------
void clean(Buf_Head* head)
	{
	head->index_rd=head->index_wr;
	head->empty=true;
	head->full=false;
	}
//------------------------------------------------------
void push(Buf_Head* head,u8 item)
	{
	if(!head->full)
		{
		head->buf[head->index_wr++] = item;
		if(head->index_wr >= head->size) head->index_wr=0;		
		if(head->index_wr == head->index_rd)head->full=true;		
    	head->empty=false;			
  		}
  	}
//------------------------------------------------------
u8 pop(Buf_Head* head)
	{
	u8 item;		
    if(!head->empty)
		{
		item = head->buf[head->index_rd++];
		if(head->index_rd >= head->size) head->index_rd=0;
		if(head->index_wr == head->index_rd)head->empty=true;
    	head->full=false;
  		}
    return item;
	}
//------------------------------------------------------
u8 get(Buf_Head* head)
	{
	return head->buf[head->index_rd];	
	}
//------------------------------------------------------
void ipush(Buf_Head* head,int item)
	{
	push(head,(u8)(item&0xff));
	push(head,(u8)((item&0xff00)>>8));
  	}
//----------------------------------------------------------
int ipop(Buf_Head* head)
	{
	int item;		
	item = pop(head);
	item = item|(pop(head)<<8);
    return item;
	}
//------------------------------------------------------
///////////////////////////////////////////////////////////////////////////////
void insert_stsp(Buf_Head* head)
    {
    u8  temp,len,i;

    len = get_fill(head);
    push(head,SOH);
    for(i=0;i<len;i++)
      {
			temp = pop(head);			
		
			if((temp == SOH) || (temp == DLE) || (temp == ETX))
				{
				push(head,DLE);
				temp = ~temp;
				}
			push(head,temp);
      }
    push(head,ETX);
    }

//------------------------------------------------------
void del_stsp(Buf_Head* head)
    {
    u8  len,i,temp;

    len = get_fill(head);
    for(i=0;i<len;i++)
      {
      temp = pop(head);
      if((temp != SOH)&&(temp != ETX))
				{
				if(temp == DLE)
					{
					temp = pop(head);		
					temp = ~temp;
					len--;
					}
        push(head,temp);			
				}
      }
    }
//------------------------------------------------------
u8 dow_crc(Buf_Head* head)
    {
    u8 temp,count,fl,i,j,crc=0;

    count = get_fill(head);

    for(j=0;j<count;j++)
      {
      temp = pop(head);
      push(head,temp);
      crc = crc ^ temp;

      for(i=0;i<8;i++)
        {
        fl=crc&1;
        if(fl)
          {
          crc = crc ^ 0x18;
          crc = 0x80 | (crc >>1);
          }
        else crc = (crc >>1);
        }
      }
    return crc;
    }
//------------------------------------------------------
bool check_crc(Buf_Head* head)	
	{
    u8  chcrc;

    chcrc=dow_crc(head);

	if(chcrc==0)
		{
		if(head->index_wr == 0)	head->index_wr = head->size - 1;
		else 					head->index_wr = head->index_wr - 1;			
		
		return true;
		}
	else
		{					//if crc is wrong then buf clean.
		clean(head);
		return false;	
		}
	}
//------------------------------------------------------
bool insert_crc(Buf_Head* head)
	{
	u8  count,outcrc;
	
	count = get_fill(head);
	if(2*count <= head->size)
		{
        outcrc = dow_crc(head);
        push(head,outcrc);
		return true;		
		}
	return false;				//if isn't place then false
	}
//------------------------------------------------------

void next(Buf_Head* head, u8 c)
{
    u8 item;		
    item = get_fill(head);

    if(item >= c)
	{
        if((head->index_rd + c) >= head->size)
          {
           head->index_rd = (head->index_rd + c) - head->size;
          }
        else
          {
           head->index_rd = (head->index_rd + c);
          }
	   head->empty = (head->index_wr == head->index_rd);
    	   head->full=false;

  	}
    else clean(head);
}
