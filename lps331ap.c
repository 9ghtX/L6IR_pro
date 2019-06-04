/**
 * @file   lps331ap.c
 * @date   14 рту. 2013 у.
 * @author
 * @brief  lps331ap
 */
#ifdef LPS331AP
#include <hal_types.h>
//#include <debug.h>
#include <protocol.h>
//#include "MeteoModuleTasks.h"
#include "lps331ap.h"
#include "lps331ap_driver.h"
#include "i2c.h"

#define I2C_BEGIN     if(false == i2c_open(2)) return 0; else do
#define I2C_COMPLETE  while(0); i2c_close(2);

typedef enum lps331ap_state_type_tag
{
  POWER_OFF         = -1,
  POWER_ON          =  0,
  CHECK_LINK        =  1,
  SET_CONFIGURATION =  2,
  MEASURE_POLLING   =  3
} lps331ap_state_t;

static int32_t lps331ap_task(uint16_t tid);
static lps331ap_state_t state = POWER_OFF;
 float pressure;
 float temperature;


float lps331ap_get_temperature(void)
{
  return (temperature);
}

int32_t(*pressure_f_point)(uint16_t); 
void lps331ap_init(void)
{
    pressure_f_point = lps331ap_task;
//  DBG("lps331ap_init\n");
//  protocol_set_callback(READ_P_SENSOR, send_pressure);
//  protocol_set_callback(READ_T_SENSOR, send_temperature);
//  mtask_start(TASK_LPS331AP, 0, lps331ap_task);
}

int32_t lps331ap_task(uint16_t tid)
{
  switch(state)
  {

    case POWER_OFF:
    I2C_BEGIN
    {
      LPS331AP_Reboot_Cmd();
      LPS331AP_PowerDown_Cmd(ENABLE);
    }
    I2C_COMPLETE
    state = POWER_ON;
    return (100);
    case POWER_ON:
      I2C_BEGIN
      {
        LPS331AP_PowerDown_Cmd(DISABLE);
      }
      I2C_COMPLETE
      state = CHECK_LINK;
    return 100; //100 ms for powering on
    case CHECK_LINK:
      I2C_BEGIN
      {
        uint8_t who_am_i;
        LPS331AP_Read(&who_am_i, LPS331AP_WHO_AM_I_ADDR, 1);
        if(who_am_i != 0xBB)
        {
          state = POWER_OFF;
        }
        else
        {
          state = SET_CONFIGURATION;
        }
      }
      I2C_COMPLETE
      return (100);

    case SET_CONFIGURATION:
      I2C_BEGIN
      {
        LPS331AP_ConfigTypeDef  LPS331AP_InitStructure;
        //LPS331AP_InterruptTypeDef LPS331AP_InterruptStructure;
        /*  LPS331AP configuration */
        LPS331AP_InitStructure.Power = LPS331AP_POWER_ACTIVE;
        LPS331AP_InitStructure.Output_Data_Rate = LPS331AP_P12p5Hz_T1Hz;
        LPS331AP_InitStructure.Data_Update = LPS331AP_NO_DATA_UPDATE_UNTIL_READ; //LPS001DL_BDU_Single;
        LPS331AP_InitStructure.DeltaEnabled = LPS331AP_DELTA_P_DISABLED;
        LPS331AP_Config(&LPS331AP_InitStructure);
      }
      I2C_COMPLETE
      state = MEASURE_POLLING;
      return (1000);
    case MEASURE_POLLING:
      I2C_BEGIN
      {
        LPS331AP_Get_Pressure(&pressure);
        LPS331AP_Get_Temperature(&temperature);
    //    DBG("LPS331AP: T=%0.2f АC; P=%0.2f mmHg\n", temperature, pressure);
 //       protocol_log(2, "LPS331AP: T=%0.2f АC; P=%0.2f mmHg", temperature, pressure);
      }
      I2C_COMPLETE
      return (1000);
    default:
      return (0);
  }
}
#endif