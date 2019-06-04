/**
 * @file   hal_types.h
 * @date   23 июля 2013 г.
 * @author 
 * @brief  hal_types
 */

#ifndef HAL_TYPES_H_
#define HAL_TYPES_H_

#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>

#define st(x)      do { x } while (__LINE__ == -1)

typedef unsigned char   u8t;      ///< range: 0 .. 255
typedef signed char     i8t;      ///< range: -128 .. +127
typedef unsigned short  u16t;     ///< range: 0 .. 65535
typedef signed short    i16t;     ///< range: -32768 .. +32767
typedef unsigned long   u32t;     ///< range: 0 .. 4'294'967'295
typedef signed long     i32t;     ///< range: -2'147'483'648 .. +2'147'483'647
typedef float           ft;       ///< range: +-1.18E-38 .. +-3.39E+38
typedef double          dt;       ///< range:            .. +-1.79E+308
typedef bool            bt;       ///< values: 0, 1 (real bool used)

#endif /* HAL_TYPES_H_ */
