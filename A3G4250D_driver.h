/**
 * @file   A3G4250D_driver.h
 * @date   14 рту. 2013 у.
 * @author
 * @brief  A3G4250D_driver
 */

#ifndef A3G4250D_DRIVER_H_
#define A3G4250D_DRIVER_H_
#include "hal_types.h"


#define CTRL_REG1_DEFAULT               (BIT(2)|BIT(1)|BIT(0))
#define CTRL_REG2_DEFAULT               0
#define CTRL_REG3_DEFAULT               0
#define CTRL_REG4_DEFAULT               0
#define CTRL_REG5_DEFAULT               0

#define CTRL_REG5_FIFO_EN		    BIT(6)
#define CTRL_REG5_STOP_ON_WTM		BIT(5)

#define A3G4250D_WHO_AM_I            0x0F
#define I_AM_A3G4250D	               0xD3

#define A3G4250D_CTRL_REG1           0x20
#define A3G4250D_CTRL_REG2           0x21
#define A3G4250D_CTRL_REG3           0x22
#define A3G4250D_CTRL_REG4           0x23
#define A3G4250D_CTRL_REG5           0x24
#define A3G4250D_DATACAPTURE_REG     0x25
#define A3G4250D_REFERENCE_REG       0x25
#define A3G4250D_OUT_TEMP_REG        0x26
#define A3G4250D_STATUS_REG          0x27
#define A3G4250D_OUT_XL_REG          0x28
#define A3G4250D_OUT_XH_REG          0x29
#define A3G4250D_OUT_YL_REG          0x2A
#define A3G4250D_OUT_YH_REG          0x2B
#define A3G4250D_OUT_ZL_REG          0x2C
#define A3G4250D_OUT_ZH_REG          0x2D
#define A3G4250D_FIFO_CTRL_REG       0x2E
#define A3G4250D_FIFO_SRC_REG        0x2F
#define A3G4250D_INT1_CFG_REG        0x30
#define A3G4250D_INT1_SRC_REG        0x31
#define A3G4250D_INT1_THS_XH_REG     0x32
#define A3G4250D_INT1_THS_XL_REG     0x33
#define A3G4250D_INT1_THS_YH_REG     0x34
#define A3G4250D_INT1_THS_YL_REG     0x35
#define A3G4250D_INT1_THS_ZH_REG     0x36
#define A3G4250D_INT1_THS_ZL_REG     0x37
#define A3G4250D_INT1_DURATION_REG   0x38


#define A3G4250D_CTRL_REG1_XEN
#define A3G4250D_CTRL_REG1_YEN
#define A3G4250D_CTRL_REG1_ZEN
#define A3G4250D_CTRL_REG1_PD
#define A3G4250D_CTRL_REG1_BW


/**
 *
 */
typedef enum a3g4250d_axis_state_type_tag
{
  A3G4250D_X_DISABLED  = 0x00,//!< A3G4250D_X_DISABLED
  A3G4250D_Y_DISABLED  = 0x00,//!< A3G4250D_Y_DISABLED
  A3G4250D_Z_DISABLED  = 0x00,//!< A3G4250D_Z_DISABLED
  A3G4250D_X_ENABLED   = 0x01,//!< A3G4250D_X_ENABLED
  A3G4250D_Y_ENABLED   = 0x02,//!< A3G4250D_Y_ENABLED
  A3G4250D_Z_ENABLED   = 0x04 //!< A3G4250D_Z_ENABLED
} a3g4250d_axis_state_t;

typedef enum a3g4250d_power_mode_type_tag
{
  A3G4250D_POWER_DOWN   = 0x00,
  A3G4250D_POWER_SLEEP  = 0x08,
  A3G4250D_POWER_NOMAL  = 0x08
} a3g4250d_power_mode_t;


typedef enum a3g4250d_odr_type_tag
{
  A3G4250D_ODR_100Hz   = 0x00,
  A3G4250D_ODR_200Hz   = 0x40,
  A3G4250D_ODR_400Hz   = 0x80,
  A3G4250D_ODR_800Hz   = 0xC0,
} a3g4250d_odr_t;

typedef enum a3g4250d_cutoff_type_tag
{
  A3G4250D_CUTOFF_12P5 = 0x00,
  A3G4250D_CUTOFF_20   = 0x00,
  A3G4250D_CUTOFF_25   = 0x10,
  A3G4250D_CUTOFF_30   = 0x00,
  A3G4250D_CUTOFF_35   = 0x10,
  A3G4250D_CUTOFF_50   = 0x20,
  A3G4250D_CUTOFF_70   = 0x30,
  A3G4250D_CUTOFF_110  = 0x30
} a3g4250d_cutoff_t;

typedef enum a3g4250d_highpass_filter_mode_type_tag
{
  A3G4250D_FILTER_MODE_RESET     = 0x00,
  A3G4250D_FILTER_MODE_REF       = 0x10,
  A3G4250D_FILTER_MODE_NORMAL    = 0x20,
  A3G4250D_FILTER_MODE_AUTORESET = 0x30
} a3g4250d_highpass_filter_mode_t;

typedef enum a3g4250d_highpass_filter_cutoff_type_tag
{
  A3G4250D_ODR800Hz_FILTER_CUTOFF_56Hz    =1,
  A3G4250D_ODR400Hz_FILTER_CUTOFF_30Hz    =2,
  A3G4250D_ODR200Hz_FILTER_CUTOFF_15Hz    =3,
  A3G4250D_ODR100Hz_FILTER_CUTOFF_8Hz     =4,
  A3G4250D_ODR100Hz_FILTER_CUTOFF_4Hz     =5,
  A3G4250D_ODR100Hz_FILTER_CUTOFF_2Hz     =6,
  A3G4250D_ODR100Hz_FILTER_CUTOFF_1Hz     =7,
  A3G4250D_ODR100Hz_FILTER_CUTOFF_0p5Hz   =8,
  A3G4250D_ODR100Hz_FILTER_CUTOFF_0p2Hz   =9,
  A3G4250D_ODR100Hz_FILTER_CUTOFF_0p1Hz   =10,
  A3G4250D_ODR100Hz_FILTER_CUTOFF_0p05Hz  =11,
  A3G4250D_ODR100Hz_FILTER_CUTOFF_0p02Hz  =12,
  A3G4250D_ODR100Hz_FILTER_CUTOFF_0p01Hz  =13
} a3g4250d_highpass_filter_cutoff_t;

typedef enum a3g4250d_self_test_config_type_tag
{
 A3G4250D_SELF_TEST_DISABLE = 0,
 A3G4250D_SELF_TEST_MODE0 = 2, //+
 A3G4250D_SELF_TEST_MODE1 = 6, //-
}a3g4250d_self_test_config_t;

typedef enum a3g4250d_int1_enable_type_tag
{
  A3G4250D_INT1_DISABLED = 0x00,
  A3G4250D_INT1_ENABLED  = 0x80
} a3g4250d_int1_enable_t;

typedef enum a3g4250d_boot_status_type_tag
{
  A3G4250D_BOOT_STATUS_DISABLED = 0x00,
  A3G4250D_BOOT_STATUS_ENABLED  = 0x40
} a3g4250d_boot_status_t;

typedef enum a3g4250d_int1_cfg_type_tag
{
  A3G4250D_INT1_ACTIVE_HIGH = 0x00,
  A3G4250D_INT1_ACTIVE_LOW  = 0x20
} a3g4250d_int1_cfg_type_t;

typedef enum a3g4250d_gpio_output_mode_type_tag
{
  A3G4250D_PUSH_PULL = 0x00,
  A3G4250D_OPEN_DRAIN = 0x10
} a3g4250d_gpio_output_mode_t;

typedef struct a3g4250d_status_type_tag
{
  uint8_t XDA   :1; //!< X-axis new data available. Default value: 0 (0: a new data for the X-axis is not yet available; 1: a new data for the X-axis is available)
  uint8_t YDA   :1; //!< Y-axis new data available. Default value: 0 (0: a new data for the Y-axis is not yet available;1: a new data for the Y-axis is available)
  uint8_t ZDA   :1; //!< Z-axis new data available. Default value: 0(0: a new data for the Z-axis is not yet available; 1: a new data for the Z-axis is available)
  uint8_t ZYXDA :1; //!< X, Y, Z-axis new data available. Default value: 0 (0: a new set of data is not yet available; 1: a new set of data is available)
  uint8_t XOR   :1; //!< X-axis data overrun. Default value: 0 (0: no overrun has occurred; 1: a new data for the X-axis has overwritten the previous one)
  uint8_t YOR   :1; //!< Y-axis data overrun. Default value: 0 (0: no overrun has occurred; 1: a new data for the Y-axis has overwritten the previous one)
  uint8_t ZOR   :1; //!< Z-axis data overrun. Default value: 0 (0: no overrun has occurred; 1: a new data for the Z-axis has overwritten the previous one)
  uint8_t ZYXOR :1; //!< X, Y, Z-axis data overrun. Default value: 0 (0: no overrun has occurred; 1: new data has overwritten the previous one before it was read)
} a3g4250d_status_t;

typedef enum a3g4250d_fifo_mode_type_tag
{
  A3G4250D_FIFO_BYPASS = 0x00, //!< Bypass mode
  A3G4250D_FIFO_NORMAL = 0x20, //!< FIFO mode
  A3G4250D_FIFO_STREAM = 0x40  //!< Stream mode
} a3g4250d_fifo_mode_t;

typedef uint8_t a3g4250d_fifo_watermark_t;

typedef  struct a3g4250d_fifo_status_type_tag
{
   uint8_t FSS  :5; //!< FIFO stored data level
   uint8_t EMPTY:1; //!< FIFO empty bit. (0: FIFO not empty; 1: FIFO empty)
   uint8_t OVRN :1; //!< Overrun bit status (0: FIFO is not completely filled; 1: FIFO is completely filled)
   uint8_t WTM  :1; //!< Watermark status. (0: FIFO filling is lower than WTM level; 1: FIFO filling is equal or higher than WTM level)
} a3g4250d_fifo_status_t;

typedef struct A3G4250D_ConfigTypeDef_tag
{
    a3g4250d_power_mode_t                    power;
    uint8_t                                   axis;
    a3g4250d_odr_t                             odr;
    a3g4250d_cutoff_t                       cutoff;
} A3G4250D_ConfigTypeDef; //CREG1

typedef struct A3G4250D_config4_tag
{
 uint8_t ble;
 uint8_t self_test;
 uint8_t sim;
}A3G4250D_config4; //CREG4

typedef struct A3G4250D_FilterConfigTypeDef_tag
{
    a3g4250d_highpass_filter_mode_t    filter_mode;
    a3g4250d_highpass_filter_cutoff_t filter_cutoff;
} A3G4250D_FilterConfigTypeDef;

typedef struct A3G4250D_FifoConfigTypeDef_tag
{
  a3g4250d_fifo_mode_t      fifo_mode;
  a3g4250d_fifo_watermark_t fifo_wm;
} A3G4250D_FifoConfigTypeDef;

/**
 * AND/OR combination of interrupt events. Default value: 0 (bit 8 of INT1_CFG Register)
 */
typedef enum a3g4250d_int1_event_combination_type_tag
{
  A3G4250D_INT1_OR  = 0,       //!< OR combination of interrupt events [ Default value ]
  A3G4250D_INT1_AND = 0x80     //!< AND combination of interrupt events
} a3g4250d_int1_event_combination_t;

/**
 * LIR  Latch interrupt request. Default value: 0 (bit 7 of INT1_CFG Register)
 * Cleared by reading the INT1_SRC reg.
 */
typedef enum a3g4250d_int1_latch_type_tag
{
  A3G4250D_INT1_NOT_LACHED  = 0,       //!< interrupt request not latched [ Default value ]
  A3G4250D_INT1_LACHED      = 0x40     //!< interrupt request latched
} a3g4250d_int1_latch_t;

/**
 * ZHIE Enable interrupt generation on Z high event. Default value: 0 (bit 6 of INT1_CFG Register)
 */
typedef enum a3g4250d_int1_zH_type_tag
{
  A3G4250D_INT1_ZH_DISABLED = 0,  //!< disable interrupt request
  A3G4250D_INT1_ZH_ENABLED  = 0x20 //!< enable interrupt request on measured rate value higher than preset threshold
}a3g4250d_int1_zh_t;
/**
 *  ZLIE   (bit 5 of INT1_CFG Register) Enable interrupt generation on Z low event. Default value: 0
 */
typedef enum a3g4250d_int1_zL_type_tag
{
  A3G4250D_INT1_ZL_DISABLED = 0,  //!< disable interrupt request
  A3G4250D_INT1_ZL_ENABLED  = 0x10 //!< enable interrupt request on measured rate value higher than preset threshold
}a3g4250d_int1_zl_t;
/**
 * YHIE Enable interrupt generation on Z high event. Default value: 0 (bit 4 of INT1_CFG Register)
 */
typedef enum a3g4250d_int1_yH_type_tag
{
  A3G4250D_INT1_YH_DISABLED = 0,  //!< disable interrupt request
  A3G4250D_INT1_YH_ENABLED  = 0x08 //!< enable interrupt request on measured rate value higher than preset threshold
}a3g4250d_int1_yh_t;

/**
 *  ZLIE   (bit 5 of INT1_CFG Register) Enable interrupt generation on Z low event. Default value: 0
 */
typedef enum a3g4250d_int1_yL_type_tag
{
  A3G4250D_INT1_YL_DISABLED = 0,  //!< disable interrupt request
  A3G4250D_INT1_YL_ENABLED  = 0x04 //!< enable interrupt request on measured rate value higher than preset threshold
}a3g4250d_int1_yl_t;

/**
 * XHIE Enable interrupt generation on X high event. Default value: 0 (bit 2 of INT1_CFG Register)
 */
typedef enum a3g4250d_int1_xH_type_tag
{
  A3G4250D_INT1_XH_DISABLED = 0,   //!< disable interrupt request
  A3G4250D_INT1_XH_ENABLED  = 0x02 //!< enable interrupt request on measured rate value higher than preset threshold
}a3g4250d_int1_xh_t;

/**
 *  XLIE   (bit 1 of INT1_CFG Register) Enable interrupt generation on X low event. Default value: 0
 */
typedef enum a3g4250d_int1_xL_type_tag
{
  A3G4250D_INT1_XL_DISABLED = 0,  //!< disable interrupt request
  A3G4250D_INT1_XL_ENABLED  = 0x01 //!< enable interrupt request on measured rate value higher than preset threshold
}a3g4250d_int1_xl_t;

typedef struct A3G4250D_IntConfigTypeDef_tag
{
    a3g4250d_int1_enable_t         isEnabled;
    a3g4250d_int1_cfg_type_t       ActiveLevel;
    a3g4250d_boot_status_t               Boot;
    a3g4250d_gpio_output_mode_t       OutMode;
    a3g4250d_int1_event_combination_t AndOr;
    a3g4250d_int1_latch_t             Latch;
    uint16_t                        THSZ;  //!< Interrupt threshold. Default value: 0000 0000
    a3g4250d_int1_zl_t                ZL;  //!< Enable Z low interrupt
    a3g4250d_int1_zh_t                ZH;  //!< Enable Z high interrupt
    uint16_t                        THSY;  //!< Interrupt threshold. Default value: 0000 0000
    a3g4250d_int1_yl_t                YL;  //!< Enable Z low interrupt
    a3g4250d_int1_yh_t                YH;  //!< Enable Z high interrupt
    uint16_t                        THSX;  //!< Interrupt threshold. Default value: 0000 0000
    a3g4250d_int1_xl_t                XL;  //!< Enable Z low interrupt
    a3g4250d_int1_xh_t                XH;  //!< Enable Z high interrupt
    uint8_t  Duration;    //!< Duration value. Default value: 000 0000
    bool     WaitEnabled; //!< WAIT enable : the interrupt falls immediately if signal crosses the selected threshold Default value: 0 (0: disable; 1: enable)
}A3G4250D_IntConfigTypeDef;

void A3G4250D_Config(A3G4250D_ConfigTypeDef *A3G4250D_Config, A3G4250D_config4 *A3G4250D_Cfg4);
void A3G4250D_FilterConfig(A3G4250D_FilterConfigTypeDef* A3G4250D_FilterConfig);
void A3G4250D_FifoConfig(A3G4250D_FifoConfigTypeDef* A3G4250D_FilterConfig);

bool A3G4250D_WriteReg(uint8_t reg, uint8_t data);
bool A3G4250D_ReadReg(uint8_t reg, uint8_t* result);

#endif /* A3G4250D_DRIVER_H_ */
