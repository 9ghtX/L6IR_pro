
#include "buffer.h"

#define SERIAL_NUMBER_TYPE u8



#define ADRESS_EXT_MASTER 0x01
#define ADRESS_L6IR       0x11
#define ADRESS_METEO      0x00
#define ADRESS_LPD        0x08
#define ADRESS_CU         0x04
#define ADRESS_KEYS       0x05
#define ADRESS_GPS        0x60

#define ADRESS_ENCODER0   0x30
#define ADRESS_ENCODER1   0x31
#define ADRESS_ENCODER2   0x32
#define ADRESS_ENCODER3   0x33
#define ADRESS_ENCODER4   0x34
#define ADRESS_ENCODER5   0x35
#define ADRESS_ENCODER6   0x36
#define ADRESS_ENCODER7   0x37
#define ADRESS_ENCODER8   0x38
#define ADRESS_ENCODER9   0x39
#define ADRESS_ENCODERA   0x3A
#define ADRESS_ENCODERB   0x3B
#define ADRESS_ENCODERC   0x3C
#define ADRESS_ENCODERD   0x3D
#define ADRESS_ENCODERE   0x3E
#define ADRESS_ENCODERF   0x3F


/*##############################################################################

##############################################################################*/
// KEY kodes
#define KEY_ENTER              0x01
#define KEY_MENU_SEL           0x02
#define KEY_ID                 0x04
#define KEY_ENCODER1           0x05
#define KEY_PHOTO              0x06
#define KEY_MENU_ENTER         0x07 
#define KEY_DO_NOTHING         0x08
#define KEY_PLUS               0x09
#define KEY_MINUS              0x0a
#define KEY_ENCODER_PRESS      0x0b
#define KEY_MARK_SEL           0x0c

#define ENCODER_PLUS_1         0x40
#define ENCODER_MINUS_1        0x41
#define ENCODER_PLUS_0         0x42
#define ENCODER_MINUS_0        0x43
#define ENCODER_PLUS_MENU      0x44
#define ENCODER_MINUS_MENU     0x45
#define ENCODER_PLUS_CONTRAST  0x46
#define ENCODER_MINUS_CONTRAST 0x47
#define ENCODER_PLUS_INVERT    0x48
#define ENCODER_MINUS_INVERT   0x49
#define ENCODER_PLUS_ZOOM      0x4a
#define ENCODER_MINUS_ZOOM     0x4b
#define ENCODER_PLUS_BRIGHT    0x4c
#define ENCODER_MINUS_BRIGHT   0x4d

#define ENCODER_PLUS_PRESS_1   0x44
#define ENCODER_MINUS_PRESS_1  0x45

#define ENCODER_PLUS_P_0       0x62
#define ENCODER_MINUS_P_0      0x63
#define ENCODER_M_PLUS_P       0x64
#define ENCODER_M_MINUS_P      0x65

#define KEY_ENTER_L     0x81
#define KEY_MENU_SEL_L  0x82
#define KEY_PLUS_L      0x89
#define KEY_MINUS_L     0x8a
#define KEY_ID_L        0x84
#define KEY_ENCODER1_L  0x85


#define KEY_POWER_OFF   0xf0


#define ALL_ENCODER_FUNC 11

//########  PERSEY CONTROL UNIT #############
#ifdef CONTROL_UNIT

#define ADRESS  ADRESS_CU
#define MASTER_ADRESS ADRESS_L6IR

//############ L6IR CONTROL UNIT #############
#elif L6IR_CU

#include "L6IR.h"
#include "net.h"
#define ADRESS  ADRESS_L6IR

//############ METEOMODUL UNIT #############
#elif METEO_MOD
#define ADRESS  ADRESS_METEO

//######## RANGE_FINDER CONTROL UNIT #######
#elif LPD_CU
#define ADRESS  ADRESS_LPD
#endif


//#### REQUESTS########
#define GET_KEY_CODE               0x01
#define GET_GPS_DATA               0x02
//#define WRITE_SERIAL_NUMBER 0x04
#define READ_SERIAL_NUMBER         0x05
#define GET_PO_VERSION             0x06
#define GET_DEV_MODEL              0x07

#define START_MESSURE_DIST         0x05
#define GET_LPD_STATUS             0x01
#define GET_LPD_DISTANCE           0x04


#define GET_COMPASS_DATA           0x09
#define COMPASS_CALIBRATE_DATA     0x0E
#define GET_COMPASS_STATUS_DATA    0x0F
#define GET_TEMPERATURE_DATA       0x04
#define GET_PRESSURE_DATA          0x05
#define METEO_GET_INCLINATE_DATA   0x0C
#define METEO_GET_DECLINATE_DATA   0x0D

#define POWER_OFF_COMMAND          0x02
#define CONDISSION_REQUEST         0x04

#define EXT_MASTER_REQUEST         0x01
#define EXT_MASTER_RFU_START       0xFF



extern  Buf_Head	 TXbuf,RXbuf,keyBuf;
extern bool     rs_frame;
extern SERIAL_NUMBER_TYPE serial_number;

void encoder_func_ini();
void encoder0_func_2enc(u8 command);
void encoder1_t_func_2enc(u8 command);
void encoder1_func_2enc(u8 command);

void protocol();

#ifdef CONTROL_UNIT
#define         dDE			GPIO_ResetBits(GPIOA,GPIO_Pin_8)
#define         uDE			GPIO_SetBits(GPIOA,GPIO_Pin_8)
#elif L6IR_CU
#define         dDE			GPIO_ResetBits(GPIOA,GPIO_Pin_8)
#define         uDE			GPIO_SetBits(GPIOA,GPIO_Pin_8)

#endif