#ifndef RFU_PLATFORM_H
#define RFU_PLATFORM_H

#ifdef __cplusplus
extern "C" {
#endif

/* Include standard types */
#include <stdint.h>
#include <rfu_config.h>

#if defined(__ICCARM__)
#include <intrinsics.h> /* IAR Intrinsics   */
#define RFU_CODE(x) _Pragma("location=\"RFU_CODE\"") x
#pragma section = "RFU_CODE"
#pragma section = "RfuOverlay"
#pragma section = "RFU_CODE_init"
#define RFU_RAM_LOCATION  __section_begin("RfuOverlay")
#define RFU_IMAGE_ADDRESS __section_begin("RFU_CODE_init")
#define RFU_IMAGE_SIZE    __section_size("RFU_CODE_init")

#define RFU_Restart()                                                         \
  do{ __DSB(); SCB->AIRCR = ((0x5FA << SCB_AIRCR_VECTKEY_Pos) |               \
                            (SCB->AIRCR & SCB_AIRCR_PRIGROUP_Msk) |           \
                            SCB_AIRCR_SYSRESETREQ_Msk);                       \
     __DSB(); while (1); } while(0)

#define RFU_MAIN(ADDRESS) rfu_main(ADDRESS);

#else // GCC ?
#error "Unsupported compiler used - please implement link tied loacations for ram running functions"
#endif

// common declarations:        
extern void rfu_main(uint8_t address);

#if defined(STM32F10X_XL)||\
    defined(STM32F10X_HD)||\
    defined(STM32F10X_MD)||\
    defined(STM32F10X_LD)||\
    defined(STM32F10X_HD_VL)||\
    defined(STM32F10X_LD_VL)||\
    defined(STM32F10X_MD_VL)

#include <stm32f10x_usart.h>
#include <stm32f10x_flash.h>
      
#include "stm32f_old_peripheral_lib_support.h"      
      


RFU_CODE(void RFU_FLASH_SetLatency(uint32_t FLASH_Latency);)
RFU_CODE(void RFU_FLASH_HalfCycleAccessCmd(uint32_t FLASH_HalfCycleAccess);)
RFU_CODE(void RFU_FLASH_PrefetchBufferCmd(uint32_t FLASH_PrefetchBuffer);)
RFU_CODE(void RFU_FLASH_Unlock(void);)
RFU_CODE(void RFU_FLASH_UnlockBank1(void);)
RFU_CODE(void RFU_FLASH_UnlockBank2(void);)
RFU_CODE(void RFU_FLASH_Lock(void);)
RFU_CODE(void RFU_FLASH_LockBank1(void);)
RFU_CODE(void RFU_FLASH_LockBank2(void);)
RFU_CODE(FLASH_Status RFU_FLASH_EraseAllPages(void);)
RFU_CODE(FLASH_Status RFU_FLASH_ErasePage(uint32_t Page_Address);)
RFU_CODE(FLASH_Status RFU_FLASH_EraseAllBank1Pages(void);)
RFU_CODE(FLASH_Status RFU_FLASH_EraseAllBank2Pages(void);)
RFU_CODE(FLASH_Status RFU_FLASH_EraseOptionBytes(void);)
RFU_CODE(FLASH_Status RFU_FLASH_ProgramWord(uint32_t Address, uint32_t Data);)
RFU_CODE(FLASH_Status RFU_FLASH_ProgramHalfWord(uint32_t Address,
                                                uint16_t Data);)
RFU_CODE(FLASH_Status RFU_FLASH_ProgramOptionByteData(uint32_t Address,
                                                      uint8_t Data);)
RFU_CODE(FLASH_Status RFU_FLASH_EnableWriteProtection(uint32_t FLASH_Pages);)
RFU_CODE(FLASH_Status RFU_FLASH_ReadOutProtection(FunctionalState NewState);)
RFU_CODE(FLASH_Status RFU_FLASH_UserOptionByteConfig(uint16_t OB_IWDG,
                                                     uint16_t OB_STOP,
                                                     uint16_t OB_STDBY);)

RFU_CODE(FLASH_Status RFU_FLASH_BootConfig(uint16_t FLASH_BOOT);)
RFU_CODE(uint32_t RFU_FLASH_GetUserOptionByte(void);)
RFU_CODE(uint32_t RFU_FLASH_GetWriteProtectionOptionByte(void);)
RFU_CODE(FlagStatus RFU_FLASH_GetReadOutProtectionStatus(void);)
RFU_CODE(FlagStatus RFU_FLASH_GetPrefetchBufferStatus(void);)
RFU_CODE(void RFU_FLASH_ITConfig(uint32_t FLASH_IT, FunctionalState NewState);)
RFU_CODE(FlagStatus RFU_FLASH_GetFlagStatus(uint32_t FLASH_FLAG);)
RFU_CODE(void RFU_FLASH_ClearFlag(uint32_t FLASH_FLAG);)
RFU_CODE(FLASH_Status RFU_FLASH_GetStatus(void);)
RFU_CODE(FLASH_Status RFU_FLASH_GetBank1Status(void);)
RFU_CODE(FLASH_Status RFU_FLASH_GetBank2Status(void);)
RFU_CODE(FLASH_Status RFU_FLASH_WaitForLastOperation(uint32_t Timeout);)
RFU_CODE(FLASH_Status RFU_FLASH_WaitForLastBank1Operation(uint32_t Timeout);)
RFU_CODE(FLASH_Status RFU_FLASH_WaitForLastBank2Operation(uint32_t Timeout);)


#elif defined (STM32L1XX_HD) || defined (STM32L1XX_MDP) || defined (STM32L1XX_XL) || defined (STM32L1XX_MD)

#include <stm32L1xx.h>
#include <stm32L1xx_flash.h>

#ifndef IS_FLASH_ADDRESS
#define IS_FLASH_ADDRESS IS_FLASH_PROGRAM_ADDRESS
#endif

#if 0
RFU_CODE(FLASH_Status RFU_DATA_EEPROM_EraseByte(uint32_t Address);)
RFU_CODE(FLASH_Status RFU_DATA_EEPROM_EraseHalfWord(uint32_t Address);)
RFU_CODE(FLASH_Status RFU_DATA_EEPROM_EraseWord(uint32_t Address);)
RFU_CODE(FLASH_Status RFU_DATA_EEPROM_FastProgramByte(uint32_t Address, uint8_t Data);)
RFU_CODE(FLASH_Status RFU_DATA_EEPROM_FastProgramHalfWord(uint32_t Address, uint16_t Data);)
RFU_CODE(FLASH_Status RFU_DATA_EEPROM_FastProgramWord(uint32_t Address, uint32_t Data);)
RFU_CODE(FLASH_Status RFU_DATA_EEPROM_FixedTimeProgramCmd(FunctionalState NewState);)
RFU_CODE(void RFU_DATA_EEPROM_Lock(void);)
RFU_CODE(FLASH_Status RFU_DATA_EEPROM_ProgramByte(uint32_t Address, uint8_t Data);)
RFU_CODE(FLASH_Status RFU_DATA_EEPROM_ProgramHalfWord(uint32_t Address, uint16_t Data);)
RFU_CODE(FLASH_Status RFU_DATA_EEPROM_ProgramWord(uint32_t Address, uint32_t Data);)
RFU_CODE(void RFU_DATA_EEPROM_Unlock(void);)
#endif

RFU_CODE(void RFU_FLASH_ClearFlag(uint32_t FLASH_FLAG);)
RFU_CODE(FLASH_Status RFU_FLASH_ErasePage(uint32_t Page_Address);)
RFU_CODE(FLASH_Status RFU_FLASH_EraseAllPages(void);)

#define RFU_FLASH_ProgramWord RFU_FLASH_FastProgramWord
RFU_CODE(FLASH_Status RFU_FLASH_FastProgramWord(uint32_t Address, uint32_t Data);)

RFU_CODE(FlagStatus RFU_FLASH_GetFlagStatus(uint32_t FLASH_FLAG));
RFU_CODE(FLASH_Status RFU_FLASH_GetStatus(void);)
RFU_CODE(void RFU_FLASH_ITConfig(uint32_t FLASH_IT, FunctionalState NewState);)
RFU_CODE(void RFU_FLASH_Lock(void);)
RFU_CODE(FLASH_Status RFU_FLASH_OB_BORConfig(uint8_t OB_BOR);)
RFU_CODE(void RFU_FLASH_OB_BootConfig(uint8_t OB_BOOT);)
RFU_CODE(uint8_t RFU_FLASH_OB_GetBOR(void);)
RFU_CODE(FlagStatus RFU_FLASH_OB_GetRDP(void);)
RFU_CODE(FlagStatus RFU_FLASH_OB_GetSPRMOD(void);)
RFU_CODE(uint8_t  RFU_FLASH_OB_GetUser(void);)
RFU_CODE(uint32_t RFU_FLASH_OB_GetWRP(void);)
RFU_CODE(uint32_t RFU_FLASH_OB_GetWRP1(void);)
RFU_CODE(uint32_t RFU_FLASH_OB_GetWRP2(void);)
RFU_CODE(void RFU_FLASH_OB_Launch(void);)
RFU_CODE(void RFU_FLASH_OB_Lock(void);)
RFU_CODE(FLASH_Status RFU_FLASH_OB_PCROP1Config(uint32_t OB_WRP1, FunctionalState NewState);)
RFU_CODE(FLASH_Status RFU_FLASH_OB_PCROPConfig(uint32_t OB_WRP, FunctionalState NewState);)
RFU_CODE(FLASH_Status RFU_FLASH_OB_PCROPSelectionConfig(uint16_t OB_PcROP);)
RFU_CODE(FLASH_Status RFU_FLASH_OB_RDPConfig(uint8_t OB_RDP);)
RFU_CODE(void RFU_FLASH_OB_Unlock(void);)
RFU_CODE(FLASH_Status RFU_FLASH_OB_UserConfig(uint8_t OB_IWDG, uint8_t OB_STOP, uint8_t OB_STDBY);)
RFU_CODE(FLASH_Status RFU_FLASH_OB_WRP1Config(uint32_t OB_WRP1, FunctionalState NewState);)
RFU_CODE(FLASH_Status RFU_FLASH_OB_WRP2Config(uint32_t OB_WRP2, FunctionalState NewState);)
RFU_CODE(FLASH_Status RFU_FLASH_OB_WRPConfig(uint32_t OB_WRP, FunctionalState NewState);)
RFU_CODE(void RFU_FLASH_PrefetchBufferCmd(FunctionalState NewState);)
RFU_CODE(void RFU_FLASH_ReadAccess64Cmd(FunctionalState NewState);)
RFU_CODE(void RFU_FLASH_SLEEPPowerDownCmd(FunctionalState NewState);)
RFU_CODE(void RFU_FLASH_SetLatency(uint32_t FLASH_Latency);)
RFU_CODE(void RFU_FLASH_Unlock(void);)
RFU_CODE(FLASH_Status RFU_FLASH_WaitForLastOperation(uint32_t Timeout);)

#else
#error "Platform Support not implemented"
#endif

#ifdef __cplusplus
}
#endif

#endif

