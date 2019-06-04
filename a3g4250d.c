/**
 * @file   A3G4250D.c
 * @date   14 рту. 2013 у.
 * @author
 * @brief  A3G4250D
 */
#ifdef A3G4250D
#include <hal_types.h>
//#include <debug.h>
#include <a3g4250d_driver.h>
#include <i2c.h>
#include <cbuf.h>
#include <protocol.h>
//#include <MeteoModuleTasks.h>
//#include <Calibration.h>
//#include <mTask.h>
#include <a3g4250d.h>


#define I2C_BEGIN       if(false == i2c_open(1)) return 0; else do
#define I2C_COMPLETE    while(0); i2c_close(1);
#define I2C_SET_FREE()  i2c_close(1)

#define ToRad(x) ((x)*0.01745329252)  // *pi/180
#define ToDeg(x) ((x)*57.2957795131)  // *180/pi

// gyro: 490 dps full scale
// 8.75 mdps/digit; 1 dps = 0.00875
#define Gyro_Gain_X 0.00875 //X axis Gyro gain
#define Gyro_Gain_Y 0.00875 //Y axis Gyro gain
#define Gyro_Gain_Z 0.00875 //Z axis Gyro gain
#define Gyro_Scaled_X(x) ((x)*(Gyro_Gain_X)) //Return the scaled ADC raw data of the gyro in radians for second
#define Gyro_Scaled_Y(x) ((x)*(Gyro_Gain_Y)) //Return the scaled ADC raw data of the gyro in radians for second
#define Gyro_Scaled_Z(x) ((x)*(Gyro_Gain_Z)) //Return the scaled ADC raw data of the gyro in radians for second

extern uint8_t compas_status;
static bool is_ready = false;
static bool send_than_ready = false;
static float RollPitchYaw[3] = {0}; //x,y,z

static int32_t a3g4250d_start(uint16_t tid);
static int32_t a3g4250d_begin_read(uint16_t tid);
static int32_t a3g4250d_complete_read(uint16_t tid);
static void protocol_callback(cbuf_t* buf);

void protocol_callback(cbuf_t* buf)
{
  uint8_t cmd;
  CbufGet(buf, &cmd  );
  if(is_ready)
  {
  }
  else
  {
    send_than_ready = true;
  }
}


void a3g4250d_init(void)
{
  DBG("a3g4250d_init\n");
 // protocol_set_callback(READ_G_SENSOR, protocol_callback);
//  mtask_start(TASK_A3G4250D, 0, a3g4250d_start);
}

int32_t a3g4250d_start(uint16_t tid)
{
  I2C_BEGIN
  {
    A3G4250D_ConfigTypeDef A3G4250D_Cfg;
    A3G4250D_config4 A3G4250D_Cfg4;
      A3G4250D_Cfg4.ble=0;
      A3G4250D_Cfg4.self_test=A3G4250D_SELF_TEST_DISABLE;
      A3G4250D_Cfg4.sim =0;
    A3G4250D_FilterConfigTypeDef A3G4250D_Filter_Cfg;
    A3G4250D_Cfg.odr   = A3G4250D_ODR_100Hz;
    A3G4250D_Cfg.axis  = A3G4250D_X_ENABLED + A3G4250D_Y_ENABLED + A3G4250D_Z_ENABLED;
    A3G4250D_Cfg.power = A3G4250D_POWER_NOMAL;
    A3G4250D_Cfg.cutoff = A3G4250D_CUTOFF_110;
    A3G4250D_Config(&A3G4250D_Cfg, &A3G4250D_Cfg4);

    A3G4250D_Filter_Cfg.filter_mode   = A3G4250D_FILTER_MODE_NORMAL;
    A3G4250D_Filter_Cfg.filter_cutoff =
    //A3G4250D_ODR100Hz_FILTER_CUTOFF_8Hz    ;
    //A3G4250D_ODR100Hz_FILTER_CUTOFF_4Hz    ;
    //A3G4250D_ODR100Hz_FILTER_CUTOFF_2Hz    ;
    //A3G4250D_ODR100Hz_FILTER_CUTOFF_1Hz    ;
    //A3G4250D_ODR100Hz_FILTER_CUTOFF_0p5Hz  ;
    //A3G4250D_ODR100Hz_FILTER_CUTOFF_0p2Hz  ;
    //A3G4250D_ODR100Hz_FILTER_CUTOFF_0p1Hz  ;
    //A3G4250D_ODR100Hz_FILTER_CUTOFF_0p05Hz ;
    //A3G4250D_ODR100Hz_FILTER_CUTOFF_0p02Hz ;
    A3G4250D_ODR100Hz_FILTER_CUTOFF_0p01Hz ;

    A3G4250D_FilterConfig(&A3G4250D_Filter_Cfg);
  }
  I2C_COMPLETE
 // mtask_start(TASK_A3G4250D, 0, a3g4250d_begin_read);
  return 100;
}

extern bool not_moving;
#define FILTER_PERIOD 100
float filterbufX[FILTER_PERIOD], filterbufY[FILTER_PERIOD], filterbufZ[FILTER_PERIOD], filterbufDef[FILTER_PERIOD];
int  filter_pointer, filter_count;
float sumDataX, sumDataY, sumDataZ, sumDataDef, filtDataX, filtDataY, filtDataZ, filtDataDef;
float ex_angle;
int compensator_count;
int time_compensator;
float dreif = -0.233;//0.415;
//#define COEFFS_GIRO 0.025
float angle;

static int32_t a3g4250d_begin_read(uint16_t tid)
{
  uint8_t ready = 0;
  a3g4250d_status_t* status = (a3g4250d_status_t*) &ready;
  I2C_BEGIN
  {
    bool ok = false;
    ok = A3G4250D_ReadReg(A3G4250D_STATUS_REG, &ready);
    if(!ok)
    {
      DBG("A3G4250D: STATUS REG READ FAILED\n");
   //   mtask_start(TASK_A3G4250D, 0, a3g4250d_start);
      I2C_SET_FREE();
      return (100);
    }
  }
  I2C_COMPLETE

  if(status->ZYXDA)
  {
    return a3g4250d_complete_read(tid);
  }
 // mtask_start(TASK_A3G4250D, 0, a3g4250d_begin_read);
  return 10;
}

static int32_t a3g4250d_complete_read(uint16_t tid)
{
  bool ok = false;
  uint8_t data[6];
  int16_t* values = (int16_t*)data;
  uint8_t data_temp;
  I2C_BEGIN
  {
#if 1
    ok = (i2c_ReadReg(I2C1,0xD3, A3G4250D_OUT_XL_REG, data, 6));
    ok = (i2c_ReadReg(I2C1,0xD3, A3G4250D_OUT_TEMP_REG, &data_temp, 1));
#else
    ok |= A3G4250D_ReadReg(A3G4250D_OUT_XL_REG, &data[0]);
    ok |= A3G4250D_ReadReg(A3G4250D_OUT_XH_REG, &data[1]);
    ok |= A3G4250D_ReadReg(A3G4250D_OUT_YL_REG, &data[2]);
    ok |= A3G4250D_ReadReg(A3G4250D_OUT_YH_REG, &data[3]);
    ok |= A3G4250D_ReadReg(A3G4250D_OUT_ZL_REG, &data[4]);
    ok |= A3G4250D_ReadReg(A3G4250D_OUT_ZH_REG, &data[5]);
#endif
  }
  I2C_COMPLETE

  if(!ok)
  {
    DBG("A3G4250D: READ FAILED\n");
  //  mtask_start(TASK_A3G4250D, 0, a3g4250d_start);
    return (100);
  }
  is_ready = true;

  RollPitchYaw[0] = Gyro_Scaled_X((float) values[0]);
  RollPitchYaw[1] = Gyro_Scaled_Y((float) values[1]);
  RollPitchYaw[2] = Gyro_Scaled_Z((float) values[2]);

  if(filter_count<FILTER_PERIOD)filter_count++;

  sumDataX= sumDataX- filterbufX[filter_pointer]+ RollPitchYaw[0];
  sumDataY= sumDataY- filterbufY[filter_pointer]+ RollPitchYaw[1];
  sumDataZ= sumDataZ- filterbufZ[filter_pointer]+ RollPitchYaw[2];

  filterbufX[filter_pointer] = RollPitchYaw[0];
  filterbufY[filter_pointer] = RollPitchYaw[1];
  filterbufZ[filter_pointer] = RollPitchYaw[2];

  filtDataX = sumDataX/filter_count;
  filtDataY = sumDataY/filter_count;
  filtDataZ = sumDataZ/filter_count;

  //static float angle;

//
//   if(!not_moving)
//   {
//     angle = angle + (filtDataZ-dreif)*COEFFS_GIRO;// - dreif;//Gyro_Scaled_Z((float) (values[2] &0xFFF0));
//     filtDataDef = filtDataZ;
//   }
//   else
//   {
////    float defirent = filtDataZ; //angle - ex_angle;
////    sumDataDef = sumDataDef - filterbufDef[filter_pointer] + defirent;
////    filterbufDef[filter_pointer] =defirent;
//    filtDataDef = filtDataZ;//sumDataDef/filter_count;
//    //ex_angle = angle;
//
//   }
//
//
//   filter_pointer++;
//   if(filter_pointer>=FILTER_PERIOD)
//   {
//     filter_pointer=0;
//
////     if(filtDataZ>0)
////       {
////         if(filtDataZ>filtDataDef) not_moving = false;
////         else {filtDataDef = filtDataZ; not_moving = true;}
////       }
////     else
////       {
////         if(filtDataZ<filtDataDef) not_moving = false;
////         else {filtDataDef = filtDataZ; not_moving = true;}
////       }
//   }
//
//   if((compas_status == COMPAS_CALLIBRATION) || (compas_status == COMP_DEBUG_BUF_READ)) compass_calibration_task(12);
//
////  protocol_log(1,"A3G4250D: X=%.02f;Y=%.02f;Z=%.02f;", RollPitchYaw[0], RollPitchYaw[1], RollPitchYaw[2]);
//  mtask_start(TASK_A3G4250D, 0, a3g4250d_begin_read);
  return (10);
}

#endif //A3G4250D
