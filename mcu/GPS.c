#include "GPS.h"

Buf_Head GPS_RX, GPS_DATA;

  char world_time[6];
  bool ready;
  u8 Nord;
  u8 East;
  /*int H_pos;*/
  char posN[16];
  char posE[16];
  char posN2[16];
  char posE2[16];

/******************************************************************************
// ��������� ��������� NMEA 0183 
*******************************************************************************/
void gps_exe(void)
{
  u8  tbuf[15];
  u8 c;

  next(&GPS_RX,3);
  c = pop(&GPS_RX);

  if(c == 'M')  GPS1_decodeRMC(&tbuf[0]);  //($GPRM)//C,002302.289,V,,,,,0.00
  if(c == 'G')  GPS1_decodeGGA(&tbuf[0]);  //
  if(c == 'L')  GPS1_decodeGLL(&tbuf[0]);  //
}

//==============================================================================
void GPS1_decodeRMC(u8 *buf)    //SV 29.01.14
    {
      u8 size;//,Nord,East;
      for(u8 i = 0;i < 7;i++)
        {
        size = gpfield(buf);
        if(size)
          {
          switch (i)
             {
              case 1:
                   buftimetopos(buf);   //�� ����������� ���������
              break;

              case 2:
                   if(*buf != 'A')i = 7; //exit? data not valid
              break;

              case 3:
                   //Latitude = buftobin(&tbuf[0]);
                    buftopos(buf,LATITUDE);
              break;

              case 4:
                   if(*buf == 'N')Nord = 1;
                   else           Nord = 0;
              break;

              case 5:
//                   Longitude = buftobin(&tbuf[0]);
                    buftopos(buf,LONGITUDE);
              break;

              case 6:
                   if(*buf == 'E')East = 1;
                   else           East = 0;
              break;
              default: 
              break;
             }
          }
        }
      ready = true;
    }
//==============================================================================
void GPS1_decodeGGA(u8 *buf)   ////SV 29.01.14
    {
      u8 size;//,Nord,East;
      for(u8 i = 0;i < 7;i++)
        {
        size = gpfield(buf);
        if(size)
          {
          switch (i)
             {
              case 1:
                  buftimetopos(buf);   //�� ����������� ���������
              break;

              case 2:
//                   Latitude = buftobin(&tbuf[0]);
                     buftopos(buf,LATITUDE);
              break;

              case 3:
                   if(*buf == 'N')Nord = 1;
                   else           Nord = 0;
              break;

              case 4:
//                   Longitude = buftobin(&tbuf[0]);
                    buftopos(buf,LONGITUDE);                
              break;

              case 5:
                   if(*buf == 'E')East = 1;
                   else           East = 0;
              break;
              default: 
              break;
             }
          }
        }
      ready = true;
    }
//==============================================================================
void GPS1_decodeGLL(u8 *buf)  //SV 29.01.14
    {
      u8 size;//,Nord,East;
      for(u8 i = 0;i < 7;i++)
        {
        size = gpfield(buf);
        if(size)
          {
          switch (i)
             {
              case 1:
//                   Latitude = buftobin(&tbuf[0]);
                    buftopos(buf,LATITUDE);                
              break;

              case 2:
                   if(*buf == 'N')Nord = 1;
                   else           Nord = 0;
              break;

              case 3:
//                   Longitude = buftobin(&tbuf[0]);
                    buftopos(buf,LONGITUDE);                
              break;

              case 4:
                   if(*buf == 'E')East = 1;
                   else           East = 0;
              break;
              
//              case 5:
//                   time = buftobin(&tbuf[0]);   //ascii to binary
//              break;
              
              case 6:
                    if(*buf != 'A')
                      {
                        i = 7; //exit? data not valid
                      //������ �� �������������(��� ������???)
                      }
              break;
              
              default: 
              break;
             }
          }
        }
      ready = true;
    }

/******************************************************************************
* ���������� ������ ASCII[] ��������� �� �������
* ���������� ���������� ��������  ����� � ������ u8  //add SV 29.01.14
******************************************************************************/
//byte g_section(byte *ptr)
u8 gpfield(u8 *ptr)
{
u8 c,i=0;  
  
do 
    {
    c = pop(&GPS_RX); 
    if(c == ',')c = 0;
    *ptr++ = c;
    i++;
    }
while(c != 0);      //string with zero in end/

if(i > 1)return i-1;
else return 0;
}

//..===========================================================================
void  buftimetopos(u8 *ptr) 
{
  u8 c;
  char *buf;
  buf = &posN[0]; 

  ptr = ptr + 4;      //���������� ����,������
  do
    {
    c = *ptr++;
    if(c != 0)
      if(c != '.')*buf++ = atob(c); //������� � ������ 2 ������
    }
  while(c != 0);
	posN[2] = 0;      //��������� ������� �������� 0
	posN[3] = 0;
	posN[4] = 0;
	posN[5] = 0;
	posN[6] = 0;
	posN[7] = 0;
	posN[8] = 0;
        posN[9] = 0;
        posN[10] = 0;

	posE[0] = 0;
	posE[1] = 0;
	posE[2] = 0;
	posE[3] = 0;
	posE[4] = 0;
	posE[5] = 0;
	posE[6] = 0;
	posE[7] = 0;
        posE[8] = 0;
	posE[9] = 0;
	posE[10] = 0;
}


/******************************************************************************
* �������������� ASCII  ptr[] -> buf[] (������� ������ ������ � 0 � ����� � ������ ������)
* ��������� ������ � ��������� ����� ��� ����� � 0.
* (������� ���������� ���������� �� �����)?   SV 29.01.14
******************************************************************************/
void  buftopos(u8 *ptr,u8 l) 
{
  u8 c;
  char *buf;
  if(l == LATITUDE) buf = &posN[0];
  if(l == LONGITUDE)buf = &posE[0];
  
  do
    {
    c = *ptr++;
    if(c != 0)
      if(c != '.')*buf++ = atob(c);
    }
  while(c != 0);
}

/******************************************************************************
* �������������� ASCII[] -> Binary     //SV 29.01.14
* ���������� ���������� �������� �������� u8 ��������������� ��������
******************************************************************************/
u8 atob(u8 c)
{
 if((c >= '0')&&(c <= '9'))	c = c - '0';
 else                           c = 0;
return c;
}

/*****************************************************************************
 �������� ������ GPS � ����� ��� ��������
*****************************************************************************/
void load_gps_buffer(Buf_Head *buffer)
{
 u8 i,size;
 size = sizeof(posN);
 for(i=0;i<size;i++)
 {
  push(buffer,posN[i]);
 }
 
 size = sizeof(posE);
 for(i=0;i<size;i++)
 {
  push(buffer,posE[i]);
 }
}