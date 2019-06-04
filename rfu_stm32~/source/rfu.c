
/**
 * @file rfu.c
 */

#include <string.h>

#include "rfu_platform.h"

void rfu_start()
{
  uint8_t address = getDeviceAddress();
  onSystemUpdateStart();

  __disable_interrupt();
  char *targetAddr = RFU_RAM_LOCATION;
  char *sourceAddr = RFU_IMAGE_ADDRESS;
  size_t size = RFU_IMAGE_SIZE;
  memcpy(targetAddr, sourceAddr, size);
  RFU_MAIN(address);
}
