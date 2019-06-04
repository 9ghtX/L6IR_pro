#include "buffer.h"

#define LATITUDE 0
#define LONGITUDE 1

extern Buf_Head GPS_RX, GPS_DATA;
extern bool gps_paket;

void  gps_exe();
void GPS1_decodeRMC(u8 *buf);
void GPS1_decodeGGA(u8 *buf);
void GPS1_decodeGLL(u8 *buf); 
 void buftopos(u8 *ptr, u8); 
 u8 gpfield(u8 *ptr);   
 void  buftimetopos(u8 *ptr);
u8 atob(u8 c);
void load_gps_buffer(Buf_Head *buffer);