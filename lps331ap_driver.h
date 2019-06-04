/**
 * @file   lps331ap_driver.h
 * @date   14 рту. 2013 у.
 * @author
 * @brief  lps331aptrdriver
 */

#ifndef LPS331AP_DRIVER_H_
#define LPS331AP_DRIVER_H_

#include <hal_types.h>
#include <hal_mcu.h>

#define P_Sensitivity     4096     /*!< Pressure Sensitivity [LSb/mbar] */
#define T_Sensitivity     480      /*!< Temperature Sensitivity LSb/C */
#define P_Conversion      0.24     /*!< (1/P_Sensitivity)*1000 => Pressure_Data x P_conversion = Pressure in bar */
#define T_Conversion      2.08     /*!< (1/T_Sensitivity)x1000 => Temperature_Data x T_Conversion = Temperature in АC/1000*/
#define P_0               10132.5  /*!< Pressure value in dmbar at zero level */
#define H_p               7290     /*!< Constant (expressed in meter) for altitude-pressure conversion according to the formula: z[m]=H_p * ln(P_0/P)*/


#define LPS331AP_I2C                     I2C2

#define LPS331AP_DEVICE_ADDRESS          0xBB  //!< I2C LPS331AP address

#define LPS331AP_REF_P_XL_ADDR           0x08  //!< Reference pressure (LSB data)      bits: 0-7
#define LPS331AP_REF_P_L_ADDR            0x09  //!< Reference pressure (middle part)   bits: 8-15
#define LPS331AP_REF_P_H_ADDR            0x0A  //!< Reference pressure (MSB data)      bits: 16-23

//---------------------------------------------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------------------//
#define LPS331AP_RES_CONF_ADDR       0x10  //!< Pressure resolution mode register
//-----------------------------------------------------
#define LPS331AP_AVGP_MASK           0x0F //!< AVGP3-AVGP0 allow to select the pressure internal average.
#define LPS331AP_AVGP_1              0x00 //!< pressure internal average = 1  .
#define LPS331AP_AVGP_2              0x01 //!< pressure internal average = 2  .
#define LPS331AP_AVGP_4              0x02 //!< pressure internal average = 4  .
#define LPS331AP_AVGP_8              0x03 //!< pressure internal average = 8  .
#define LPS331AP_AVGP_16             0x04 //!< pressure internal average = 16 .
#define LPS331AP_AVGP_32             0x05 //!< pressure internal average = 32 .
#define LPS331AP_AVGP_64             0x06 //!< pressure internal average = 64 .
#define LPS331AP_AVGP_128            0x07 //!< pressure internal average = 128.
#define LPS331AP_AVGP_256            0x08 //!< pressure internal average = 256.
#define LPS331AP_AVGP_384            0x09 //!< pressure internal average = 384.
#define LPS331AP_AVGP_512            0x0A //!< pressure internal average = 512.
//-----------------------------------------------------
#define LPS331AP_AVGT_MASK           0x70 //!< AVGT2-AVGT0 allow to select the temperature internal average.
#define LPS331AP_AVGT_1              0x00 //!< temperature internal averag = 1  .
#define LPS331AP_AVGT_2              0x10 //!< temperature internal averag = 2  .
#define LPS331AP_AVGT_4              0x20 //!< temperature internal averag = 4  .
#define LPS331AP_AVGT_8              0x30 //!< temperature internal averag = 8  .
#define LPS331AP_AVGT_16             0x40 //!< temperature internal averag = 16 .
#define LPS331AP_AVGT_32             0x50 //!< temperature internal averag = 32 .
#define LPS331AP_AVGT_64             0x60 //!< temperature internal averag = 64 .
#define LPS331AP_AVGT_128            0x70 //!< temperature internal averag = 128.
//---------------------------------------------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------------------//
#define LPS331AP_WHO_AM_I_ADDR       0x0F //!< Device identification
#define LPS331AP_WHO_AM_I_ANSWER     0xBB //!< Valid answer when read WHO_AM_I from LPS331AP
//---------------------------------------------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------------------//
#define LPS331AP_CTRL_REG1_ADDR                0x20  //!< Control register 1
//-----------------------------------------------------
#define LPS331AP_CTRL_REG1_PD_MASK             0x80 //!< power down control.
#define LPS331AP_CTRL_REG1_POWER_ACTIVE_MODE   0x80 //!< Active mode
#define LPS331AP_CTRL_REG1_POWER_DOWN_MODE     0x00 //!< Power down mode
//-----------------------------------------------------
#define LPS331AP_CTRL_REG1_ODR_MASK            0x70 //!< output data rate selection
#define LPS331AP_CTRL_REG1_ODR_ONE_SHOT        0x00 //!< output data rate: One shot
#define LPS331AP_CTRL_REG1_ODR_P1_T1_Hz        0x10 //!< output data rate: P = 1    Hz; T = 1    Hz
#define LPS331AP_CTRL_REG1_ODR_P7_T1_Hz        0x20 //!< output data rate: P = 7    Hz; T = 1    Hz
#define LPS331AP_CTRL_REG1_ODR_P12P5_T1_Hz     0x30 //!< output data rate: P = 12.5 Hz; T = 1    Hz
#define LPS331AP_CTRL_REG1_ODR_P25_T1_Hz       0x40 //!< output data rate: P = 25   Hz; T = 1    Hz
#define LPS331AP_CTRL_REG1_ODR_P7_T7_Hz        0x50 //!< output data rate: P = 7    Hz; T = 7    Hz
#define LPS331AP_CTRL_REG1_ODR_P12P5_T15P5_Hz  0x60 //!< output data rate: P = 12.5 Hz; T = 12.5 Hz
#define LPS331AP_CTRL_REG1_ODR_P25_T25_Hz      0x70 //!< output data rate: P = 25   Hz; T = 25   Hz
//-----------------------------------------------------
#define LPS331AP_CTRL_REG1_DIFF_EN_MASK        0x08  //!< Interrupt circuit enable
#define LPS331AP_CTRL_REG1_DIFF_ENABLED        0x08  //!< interrupt circuit enabled
#define LPS331AP_CTRL_REG1_DIFF_DISABLED       0x00  //!< interrupt generation disabled
//-----------------------------------------------------
#define LPS331AP_CTRL_REG1_DBDU_MASK           0x04 //!< block data update
#define LPS331AP_CTRL_REG1_DBDU_WAIT_READ      0x04 //!< output registers not updated until MSB and LSB reading
#define LPS331AP_CTRL_REG1_DBDU_CONTINUOUS     0x00 //!< continuous update
//-----------------------------------------------------
#define LPS331AP_CTRL_REG1_DELTA_EN_MASK       0x02 //!< delta pressure enable.
#define LPS331AP_CTRL_REG1_DELTA_ENABLED       0x02 //!< delta pressure registers enabled.
#define LPS331AP_CTRL_REG1_DELTA_DISABLED      0x00 //!< delta pressure registers disable.
//-----------------------------------------------------
#define LPS331AP_CTRL_REG1_SIM_MASK            0x01 //!< Serial Interface Mode selection
//---------------------------------------------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------------------//
#define LPS331AP_CTRL_REG2_ADDR               0x21 //!< Control register 2
//-----------------------------------------------------
#define LPS331AP_CTRL_REG2_ONE_SHOT_MASK      0x01 //!< One shot enable
#define LPS331AP_CTRL_REG2_ONE_SHOT           0x01 //!< Start for a new dataset
#define LPS331AP_CTRL_REG2_WAIT_START         0x00 //!< Waiting for start of conversion
//-----------------------------------------------------
#define LPS331AP_CTRL_REG2_AUTO_ZERO_MASK     0x02 //!< Autozero enable
 #define LPS331AP_CTRL_REG2_AUTO_ZERO_ENABLE  0x02 //!< Autozero enable
//-----------------------------------------------------
#define LPS331AP_CTRL_REG2_SWRESET_MASK       0x04  //!< Software reset
#define LPS331AP_CTRL_REG2_SWRESET            0x04  //!< Software reset
//-----------------------------------------------------
#define LPS331AP_CTRL_REG2_BOOT               0x80 //!<  Reboot memory content.
#define LPS331AP_CTRL_REG2_REBOOT_MEMORY      0x80 //!<  reboot memory content
//---------------------------------------------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------------------//
#define LPS331AP_CTRL_REG3_ADDR                   0x22  //!< Control register 3
//-----------------------------------------------------
//-----------------------------------------------------
#define LPS331AP_CTRL_REG3_INT1_SIGNAL_MASK       0x07  //!< data signal on INT1 pad control bits
#define LPS331AP_CTRL_REG3_INT1_GND               0x00  //!< Int1 pin GND
#define LPS331AP_CTRL_REG3_INT1_P_HIGH            0x01  //!< Int1 pin Pressure high (P_high)
#define LPS331AP_CTRL_REG3_INT1_P_LOW             0x02  //!< Int1 pin Pressure low (P_high)
#define LPS331AP_CTRL_REG3_INT1_P_HIGTH_LOW       0x03  //!< Int1 P_low OR P_high
#define LPS331AP_CTRL_REG3_INT1_DATA_READY        0x04  //!< Int1 Data ready
#define LPS331AP_CTRL_REG3_INT1_TRISTATE          0x07  //!< Int1 Tri-state
//-----------------------------------------------------
#define LPS331AP_CTRL_REG3_INT2_SIGNAL_MASK       0x38  //!< data signal on INT2 pad control bits
#define LPS331AP_CTRL_REG3_INT2_GND               0x00  //!< Int2 pin GND
#define LPS331AP_CTRL_REG3_INT2_P_HIGH            0x08  //!< Int2 pin Pressure high (P_high)
#define LPS331AP_CTRL_REG3_INT2_P_LOW             0x10  //!< Int2 pin Pressure low (P_high)
#define LPS331AP_CTRL_REG3_INT2_P_HIGTH_LOW       0x18  //!< Int2 P_low OR P_high
#define LPS331AP_CTRL_REG3_INT2_DATA_READY        0x20  //!< Int2 Data ready
#define LPS331AP_CTRL_REG3_INT2_TRISTATE          0x38  //!< Int2 Tri-state
//-----------------------------------------------------
#define LPS331AP_CTRL_REG3_PP_OD_MASK             0x40  //!< Push-pull/open drain selection on interrupt pads
#define LPS331AP_CTRL_REG3_PP                     0x00  //!< Push-pull
#define LPS331AP_CTRL_REG3_OD                     0x40  //!< open drain
//-----------------------------------------------------
#define LPS331AP_CTRL_REG3_INT_H_L                0x80  //!< Interrupt active high, low
#define LPS331AP_CTRL_REG3_INT_H                  0x00  //!< Interrupt active high
#define LPS331AP_CTRL_REG3_INT_L                  0x80  //!< Interrupt active low
//---------------------------------------------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------------------//
#define LPS331AP_INT_CFG_REG_ADDR        0x23  //!< Interrupt configuration
#define LPS331AP_INT_CFG_REG_PH_E        0x01  //!< enable interrupt request on measured differential pressure value higher than preset threshold
#define LPS331AP_INT_CFG_REG_PL_E        0x02  //!< enable interrupt request on measured differential pressure value lower than preset threshold
#define LPS331AP_INT_CFG_REG_LIR         0x04  //!< interrupt request latched
//---------------------------------------------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------------------//
#define LPS331AP_INT_SOURCE_REG_ADDR     0x24 //!< Interrupt source
#define LPS331AP_INT_SOURCE_REG_PH       0x01 //!< Differential pressure High
#define LPS331AP_INT_SOURCE_REG_PL       0x02 //!< Differential pressure Low
#define LPS331AP_INT_SOURCE_REG_IA       0x04 //!< Interrupt Active. one or more interrupt events have been generated
//---------------------------------------------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------------------//
#define LPS331AP_THS_P_LOW_REG_ADDR      0x25  //!< THS7 - THS0: Threshold pressure LSB.
#define LPS331AP_THS_P_HIGH_REG_ADDR     0x26  //!< THS8 - THS15: Threshold pressure MSB.
//---------------------------------------------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------------------//
#define LPS331AP_STATUS_REG_ADDR         0x27  //!< Status register
#define LPS331AP_STATUS_REG_T_DA_MASK    0x01  //!< Temperature data available.
#define LPS331AP_STATUS_REG_P_DA_MASK    0x02  //!< Pressure data available.
#define LPS331AP_STATUS_REG_T_OR_MASK    0x10  //!< Temperature data overrun.
#define LPS331AP_STATUS_REG_P_OR_MASK    0x20  //!< Pressure data overrun.
//---------------------------------------------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------------------//
#define LPS331AP_PRESS_POUT_XL_REH_ADDR  0x28  //!< Pressure data (LSB) [7:0]   POUT7  - POUT0
#define LPS331AP_PRESS_OUT_L_ADDR        0x29  //!< Pressure data       [15:8]  POUT15 - POUT8
#define LPS331AP_PRESS_OUT_H_ADDR        0x2A  //!< Pressure data (MSB) [24:17] POUT23 - POUT16
//---------------------------------------------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------------------//
#define LPS331AP_TEMP_OUT_L_ADDR         0x2B  //!< Temperature data (LSB) [7:0]  TOUT7  - TOUT0
#define LPS331AP_TEMP_OUT_H_ADDR         0x2C  //!< Temperature data (MSB) [15:8] TOUT15 - TOUT8
//---------------------------------------------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------------------//
#define LPS331AP_AMP_CTRL_ADDR           0x30  //!< Analog front end control
#define LPS331AP_AMP_CTRL_SELMAN         0x01  //!< Current of operational amplifier selector always high current
//---------------------------------------------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------------------//
#define LPS331AP_DELTA_PRESS_XL_ADDR     0x3C  //!< Pressure offset bits: [7:0]   DELTA0 - DELTA7:
#define LPS331AP_DELTA_PRESS_L_ADDR      0x3D  //!< Pressure offset bits: [15:8]  DELTA15-DELTA8
#define LPS331AP_DELTA_PRESS_H           0x3E  //!< Pressure offset bits: [23:16] DELTA23-DELTA16

//---------------------------------------------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------------------//

typedef enum  LPS331AP_PowerMode_type_tag
{
  LPS331AP_POWER_DOWN   = 0,
  LPS331AP_POWER_ACTIVE = 0x80
} LPS331AP_PowerMode_t;

typedef enum  LPS331AP_OutputDataRate_type_tag
{
  LPS331AP_ONE_SHOT        = 0x00,
  LPS331AP_1Hz             = 0x10,
  LPS331AP_P7Hz_T1Hz       = 0x20,
  LPS331AP_P12p5Hz_T1Hz    = 0x30,
  LPS331AP_P25Hz_T1Hz      = 0x40,
  LPS331AP_P7Hz_T7Hz       = 0x50,
  LPS331AP_P12p5Hz_T15p5Hz = 0x60,
  LPS331AP_P25Hz_T25Hz     = 0x70
} LPS331AP_OutputDataRate_t;

typedef enum  LPS331AP_DataUpdateMode_type_tag
{
  LPS331AP_CONTINUOUS_DATA_UPDATE    = 0x00,
  LPS331AP_NO_DATA_UPDATE_UNTIL_READ = 0x04
} LPS331AP_DataUpdateMode_t;
typedef enum LPS331AP_InterruptEnabled_type_tag
{
  LPS331AP_INT_GENERATION_DISABLED = 0x00, //!< interrupt circuit disabled
  LPS331AP_INT_GENERATION_ENABLED  = 0x08  //!< interrupt circuit enabled
} LPS331AP_InterruptEnabled_t;

typedef enum LPS331AP_DeltaPressureEnabled_type_tag
{
  LPS331AP_DELTA_P_DISABLED = 0x00,
  LPS331AP_DELTA_P_ENABLED  = 0x02
} LPS331AP_DeltaPressureEnabled_t;


typedef struct LPS331AP_ConfigTypeDef_tag
{
  LPS331AP_PowerMode_t            Power;              //!< Power mode
  LPS331AP_OutputDataRate_t       Output_Data_Rate;   //!< Output data rate
  LPS331AP_DataUpdateMode_t       Data_Update;        //!< Continuos update or update until MSB and LSB reading
  LPS331AP_DeltaPressureEnabled_t DeltaEnabled;       //!< Delta pressure enabled
//  LPS331AP_InterruptEnabled_t     InterruptsGeneration;  //!< Ints enabled
} LPS331AP_ConfigTypeDef;


//typedef struct LPS331AP_InterruptTypeDef_tag
//{
//  uint8_t Mode;               /*!<Active high or active low*/
//  uint8_t PP_OD;              /*!<Push-pull or Open-Drain */
//  uint8_t Int2_Pad_Mode;      /*!<See table 15 LPS001DL datasheet*/
//  uint8_t Int1_Pad_Mode;      /*!<See table 15 LPS001DL datasheet*/
//  uint8_t Latch;              /*!<Latch enable or disable*/
//  uint8_t Delta_Press_Low;    /*!<DPL enable or disable*/
//  uint8_t Delta_Press_High;   /*!<DPH enable or disable*/
//}LPS331AP_InterruptTypeDef;

//---------------------------------------------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------------------//
void LPS331AP_I2C_Init(void);
void LPS331AP_INT1_Config(void);
void LPS331AP_Config(LPS331AP_ConfigTypeDef *LPS331AP_Config_Struct);
//void LPS001DL_Interrupt_Config(LPS331AP_InterruptTypeDef *LPS331AP_Interrupt_Struct);
//void LPS001DL_Interrupt_Cmd(FunctionalState NewState);
//void LPS001DL_Lowpower_Cmd(FunctionalState NewState);
void LPS331AP_PowerDown_Cmd(FunctionalState NewState);
void LPS331AP_Reboot_Cmd(void);
void LPS331AP_Read_Pressure_Regs(uint8_t* pBuffer);
void LPS331AP_Read_Temperature_Regs(uint8_t* pBuffer);
void LPS331AP_Set_Reference(uint32_t refvalue);
//void LPS331AP_Set_Threshold(uint16_t refvalue);
void LPS331AP_Get_Altitude(float* altitude);
void LPS331AP_Get_Pressure(float* pressure);
void LPS331AP_Get_Raw_Pressure(uint32_t* pressure);
void LPS331AP_Get_Temperature(float* temperature);
void LPS331AP_Write(uint8_t* pBuffer, uint8_t WriteAddr, uint8_t NumByteToWrite);
void LPS331AP_Read(uint8_t* pBuffer, uint8_t ReadAddr, uint8_t NumByteToRead);
//---------------------------------------------------------------------------------------------------------//
//---------------------------------------------------------------------------------------------------------//



#endif /* LPS331AP_DRIVER_H_ */
