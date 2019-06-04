#include "L6IR.h"
#include "lps331ap.h"
#include "Ball.h"
#include "net.h"
#include "LSM6DS33.h"
#include <math.h>

 typedef struct
{
 s32 lps331ap;
 s32 lsm6ds33;
} synchro_time;

static synchro_time sens_synchro_time;
extern int32_t(*pressure_f_point)(uint16_t); 

extern float pressure;
extern float temperature;

void  sens_synchro_func()
{
  sens_synchro_time.lps331ap --;
  sens_synchro_time.lsm6ds33 --;
}


void i2c_sensors_tasks()
{
  /*
 if(sens_synchro_time.lps331ap < 0)
   {
     sens_synchro_time.lps331ap = (*pressure_f_point)(0);
     senspar.pressure = pressure;
     senspar.temperature = temperature;
     senspar.change_par = true;
     wright_data_to_cam(GET_PRESSURE_DATA, senspar.pressure);
     wright_data_to_cam(GET_TEMPERATURE_DATA, senspar.temperature);
   }
 */
 if(sens_synchro_time.lsm6ds33 <0)
   {
     LSM6DS33_tasks();
     sens_synchro_time.lsm6ds33 = LSM6DS33_PERIOD;
   
 
 if(LSM6DS33_out_data.temp_ready)
  {
    
   LSM6DS33_out_data.temp_ready = false; 
  }
 if(LSM6DS33_out_data.accel_ready)
  {
   angles_calculate();
   turning_off_indicate();
   LSM6DS33_out_data.accel_ready = false;
  }
 }
}
#define CONST_2PI_DEV_360    0.017453292
#define CONST_360_DEV_2PI    57.29577951

void    angles_calculate()
{
 float x_axis, y_axis, z_axis;
 x_axis = (float)LSM6DS33_out_data.accelerometer_x;
 y_axis = (float)LSM6DS33_out_data.accelerometer_y;
 z_axis = (float)LSM6DS33_out_data.accelerometer_z;
 
 
 senspar.declinate =0- CONST_360_DEV_2PI*atan(x_axis/y_axis);
 
 senspar.inclinate = 0- CONST_360_DEV_2PI*atan(z_axis/y_axis);
 senspar.change_par = true;
 //if((senspar.inclinate>=(decl+1)) ||(senspar.inclinate<=(decl-1)) )
 wright_data_to_cam(METEO_GET_INCLINATE_DATA, senspar.inclinate); 
  
}


#define FILTER_PERIOD_FOR_TURN_OFF 20
s32 xbuf[FILTER_PERIOD_FOR_TURN_OFF];
s32 ybuf[FILTER_PERIOD_FOR_TURN_OFF];
s32 zbuf[FILTER_PERIOD_FOR_TURN_OFF];
u16 axis_quant, axis_point;
void   turning_off_indicate()
{
s32 x_axis_filter=0, y_axis_filter=0, z_axis_filter=0;
int i;

  xbuf[axis_point] = (s32)LSM6DS33_out_data.accelerometer_x;
  ybuf[axis_point] = (s32)LSM6DS33_out_data.accelerometer_y;
  zbuf[axis_point] = (s32)LSM6DS33_out_data.accelerometer_z;
  
 if(axis_quant<FILTER_PERIOD_FOR_TURN_OFF) axis_quant++;
 axis_point++;
 if(axis_point>=FILTER_PERIOD_FOR_TURN_OFF)axis_point=0;
 
 for(i=0; i<axis_quant; i++)
 {
  x_axis_filter += xbuf[i];
  y_axis_filter += ybuf[i];
  z_axis_filter += zbuf[i];
 }
 x_axis_filter = x_axis_filter/axis_quant;
 y_axis_filter = y_axis_filter/axis_quant;
 z_axis_filter = z_axis_filter/axis_quant;
 
 if((x_axis_filter>-300)&&(x_axis_filter<300)&&(z_axis_filter>-300)&&(z_axis_filter<300))
 {
  if(y_axis_filter<-16000)  
  {
    if(LSM6DS33_out_data.turnover == true)
    {
     //spi_objects[COMMAND_REG_ADDR].wright_data = TURNON_COMAND; // «акоменчено пока точно не определимс€ с командами
     LSM6DS33_out_data.turnover = false;
    }
  }
  if(y_axis_filter> 16000) 
  {
    
    if(LSM6DS33_out_data.turnover == false)
    {
     // spi_objects[COMMAND_REG_ADDR].wright_data = TURNON_COMAND;// «акоменчено пока точно не определимс€ с командами
      LSM6DS33_out_data.turnover = true; 
    }
  }
 }
 

}