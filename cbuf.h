/**
 * @file cbuf.h
 * @date 07.12.2011
 * @brief Модуль cbuf циклический буфер.
 */

#ifndef CBUF_H_
#define CBUF_H_

/**
 * @defgroup __cbuf Модуль циклического буфера
 * @{
 */
#include "hal_types.h"

/**
 * @brief Структура управления циклическим буфером.
 */
typedef struct cbuf_struct
{
	uint8_t*  base;             /**!< адрес начала массива для хранения данных */
	uint32_t  size;             /**!< общий размер занимаемой памяти */
	volatile uint32_t  count;   /**!< число элементов в буфере */
	uint32_t  first;            /**!< индекс первого элемента в буфере */
	uint32_t  last;             /**!< индекс последнего элемента в буфере */
} cbuf_t;

/**
 * @brief Инициализация структуры управления буфером.
 * @param buf - указатель на инициализируемую структуру управления буфером.
 * @param mem - адрес начала массива для хранения данных.
 * @param mem_size - общий размер занимаемой памяти в байтах.
 */
void CbufInit(cbuf_t* const buf, uint8_t* mem, uint32_t mem_size);

/**
 * @brief Запись элементов в буфер.
 * @param buf       - указатель на структуру управления буфером.
 * @param data      - адрес источника данных (отсюда читаем)
 * @param data_count- размер записи.
 * @return false - недостаточно места в буфере, запись не выполнена.
 * @return true  - запись выполена успешно.
 */
bool CbufWrite(cbuf_t* const buf, const uint8_t* data, const uint32_t data_count);

/**
 * @brief Чтение и извлечение элементов из буфера.
 * @param  buf        - указатель на структуру управления буфером.
 * @param  data       - адрес назначения данных (сюда записаваем).
 * @param  data_count - количество элементов для чтения.
 * @return число прочитанных элементов.
 */
uint32_t CbufRead(cbuf_t* const buf, uint8_t* data, const uint32_t data_count);

/**
 * @brief Проверка значения элемента в буфере без изменения самого буфера.
 * @param buf    - указатель на структуру управления буфером.
 * @param index  - смещение относительно индекса чтения.
 * @return значение элемента.
 */
uint8_t CbufTestItem(cbuf_t* const buf, const uint32_t index);

/**
 * @brief Поместить один элемент в буфер.
 * @param buf  - указатель на структуру управления буфером.
 * @param item значение элемента.
 * @return false - недостаточно места в буфере, запись не выполнена.
 * @return true  - запись выполена успешно.
 */
bool CbufPut(cbuf_t* const  buf, const uint8_t item);

/**
 * @brief Чтение одного элемента и извлечение его из буфера.
 * @param buf  - указатель на структуру управления буфером.
 * @param destination  - указатель на место для записи считанного символа.
 * @return false - чтение не выполнено
 * @return true  - чтение выполено успешно.
 */
bool CbufGet(cbuf_t* const buf, uint8_t* destination);

/**
 * @brief Чтение количества элементов в буфере.
 * @param buf  - указатель на структуру управления буфером.
 * @return число элементов в буфере.
 */
uint32_t CbufGetItemCount(cbuf_t* const buf);

/**
 * @brief Чтение количества свободных ячеек в буфере.
 * @param buf - указатель на структуру управления буфером.
 * @return число свободных ячеек в буфере.
 */
uint32_t CbufGetFreeSize(cbuf_t* const buf);

/**
 * @brief Очистка буфера.
 * @param buf - указатель на структуру управления буфером.
 */
void CbufFlush(cbuf_t* const buf);

/**
 * @} __cbuf
 */
#endif /* CBUF_H_ */
