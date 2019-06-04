#define MC  245
#define _N1 0.5
#include "L6IR.h"

static float stepen[10][5]=
{/*      0.2    0.3     0.4     0.5     0.6*/
 /*300*/{0.671,	0.661,	0.657,	0.653,	0.653},
 /*400*/{0.600,	0.575,	0.558,	0.546,	0.538},
 /*500*/{0.559,	0.528,	0.510,	0.499,	0.492},
 /*600*/{0.532,	0.503,	0.486,	0.478,	0.474},
 /*700*/{0.478,	0.467,	0.464,	0.463,	0.463},
 /*800*/{0.473,	0.464,	0.462,	0.461,	0.461},
 /*900*/{0.469,	0.462,	0.460,	0.459,	0.459},
/*1000*/{0.466,	0.460,	0.458,	0.457,	0.457},
/*1100*/{0.464,	0.458,	0.457,	0.456,	0.455},
/*1200*/{0.462,	0.457,	0.455,	0.454,	0.453}
};

typedef struct{
    float _S;        //высота прицела
    float _Z;        //дальность пристрелки
    float _PR0;      //давление пристрелки
    float T0;
    float Nstep;
    float control_w; //контроль считывания пустой EEPROM
   }WeapParam;

typedef struct{
    float _V0;       //начальная скорость пули
    float BC;        //баллестический коэффициент
    float _m;
    float control_b; //контроль считывания пустой EEPROM
   }BullParam;

typedef struct{
    float distance;
    float temperature;
    float pressure;
    float wind_speed;
    float wind_dir;
    float inclinate;
    float prev_declinate;
    float declinate;
    float compas;
    bool  change_par;
    bool  trabl_par;
    bool temp_auto;
    bool press_auto;
   }Sens_param;

typedef struct{
    float MOAySM;
    float MOAxSM;
    bool  correct;
}ball_result;


extern WeapParam weapon;
extern BullParam bullet;
extern Sens_param senspar;

ball_result balCalculate(float, cam_ballistic);
float K3(float);
char* BallName(int);
char* GunName(int);
void correct_enter(unsigned char,float,float, unsigned short, float, bool, unsigned int);
//void vert_correct_enter(float);
void default_ball_ini();