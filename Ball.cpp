
#include <hal_types.h>
#include <stdio.h>
#include "Ball.h"
#include <stdlib.h>
#include  <math.h>


/*
  File: Ball.cpp

*/


#define M_PI  3.1415926536

//extern Sets Seting;

WeapParam weapon;
BullParam bullet;
Sens_param senspar;

void default_ball_ini()
{
bullet._V0 = 920;
bullet.BC = 0.45;
weapon._Z =100;
senspar.wind_speed=4;
senspar.wind_dir =30;
senspar.temperature = 15;
weapon._S = 40;
weapon.Nstep = 10;
weapon._PR0=750;
senspar.pressure=752;
senspar.distance = 100;
}



ball_result balCalculate(float in_distance, cam_ballistic ballist)
{

ball_result ball_res;
bool correct = false;
float MOAy, MOAx,MOAd;
float distance;
static float pref_correct_g, pref_correct_v;
  	float  x;
           x= in_distance/0.9144;

           	float	//_WT=105.0,
			_V0= ballist.bullet_V0/0.3048,            //начальная скорость
			_C = ballist.bullet_BC,                   //баллистический коэффициент
			_HZ= 0.0,                                                        //
			_Z=  ballist.weapon_L0/0.9144,            //дальность пристрелки
			_VW=(float)senspar.wind_speed/0.44704,    //скорость ветра
			_WDir=(float)senspar.wind_dir/30.0,       //направление ветра
			_TC=(float)senspar.temperature,           //температура
			_AL= 100.0,                               // высота над уровнем моря
			_PR=(float)senspar.pressure/0.7501,
			_S=ballist.weapon_H/25.4,
                         l=ballist.weapon_step/2.54,               //шаг нарезки
			_MOAValue=1.05,
			_PR0 = ballist.weapon_P0/0.7501,
			_MayewskiConst=246.0;

         int V0int = (int)floor(((bullet._V0-300.0)/100.0)+0.5);
         int BCint = (int)floor(((_C-0.2)*10.0)+0.5);

         float st = stepen[V0int][BCint];
	     float    	_TE=(_TC*1.8)+32.0,
			_F=_C*_MayewskiConst*pow(_V0,st),
			_FC=_F*(460.0+_TE)/(519.0-_AL/280.0)*exp(_AL/31654.0)*(2.0-_PR/_PR0),
			_DZ=pow(((41.68/_V0)/((1.0/(_Z))-(1.0/(_FC-(0.75+0.00006*_Z)*_N1*_Z)))),2.0);
	    float C5;

		C5=x;
		float F5/*DropInches*/= pow(  (41.68/_V0)/((1.0/(C5))-(1.0/(_FC-(0.75+0.00006*C5)*_N1*C5))),2.0);
		float G5/*PathInches*/=-(F5+_S)+(_DZ+_S+_HZ)*C5/_Z;
		float H5/*MOAy*/=-G5/C5/_MOAValue*100.0;
		float I5/*MOAx*/=(79.2*C5*_VW/_V0/(_FC/C5-1.0-_N1))/C5/_MOAValue*100.0*sin(_WDir/12.0*2.0*3.1415926/*M_PI*/);



  MOAy = H5;//(((((pow(Yz,2)+fS+fZ)*dist)/(fZ))-(pow(Yx,2)+fS))/dist)*100;

  MOAx = I5;// (((79.2*dist*(fVW/fV0))/((K2/dist)-1-_N1))/dist)*100*sin((fVDIR/12)*2*3.14);

  MOAd = (pow(x/0.9144,2)*(6-(l/4)))/(10000000*0.2909);

if(x==0.0)
{
MOAy=0.0;
MOAx=0.0;
MOAd=0.0;
}




distance = (MOAy);

  if(distance>9999) distance = 9999;
  if(distance<-9999) distance = -9999;

  ball_res.MOAySM = distance*0.0290893*0.9144*x;


  if(pref_correct_v  != distance)correct = true;

  pref_correct_v  = distance;

  distance = ((MOAx+MOAd));

  if(distance>9999)  distance = 9999;
  if(distance<-9999) distance = -9999;

  ball_res.MOAxSM = distance*0.0290893*0.9144*x;

      if(pref_correct_g != distance)
      {
      ball_res.correct = true;
      // gor_correct_par.change_bit = true;
      }
      pref_correct_g = distance;
return ball_res;
}


float K3(float x)
{
 return ((0.75+0.00006*x)*_N1*x);
}
