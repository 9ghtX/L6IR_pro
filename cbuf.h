/**
 * @file cbuf.h
 * @date 07.12.2011
 * @brief ������ cbuf ����������� �����.
 */

#ifndef CBUF_H_
#define CBUF_H_

/**
 * @defgroup __cbuf ������ ������������ ������
 * @{
 */
#include "hal_types.h"

/**
 * @brief ��������� ���������� ����������� �������.
 */
typedef struct cbuf_struct
{
	uint8_t*  base;             /**!< ����� ������ ������� ��� �������� ������ */
	uint32_t  size;             /**!< ����� ������ ���������� ������ */
	volatile uint32_t  count;   /**!< ����� ��������� � ������ */
	uint32_t  first;            /**!< ������ ������� �������� � ������ */
	uint32_t  last;             /**!< ������ ���������� �������� � ������ */
} cbuf_t;

/**
 * @brief ������������� ��������� ���������� �������.
 * @param buf - ��������� �� ���������������� ��������� ���������� �������.
 * @param mem - ����� ������ ������� ��� �������� ������.
 * @param mem_size - ����� ������ ���������� ������ � ������.
 */
void CbufInit(cbuf_t* const buf, uint8_t* mem, uint32_t mem_size);

/**
 * @brief ������ ��������� � �����.
 * @param buf       - ��������� �� ��������� ���������� �������.
 * @param data      - ����� ��������� ������ (������ ������)
 * @param data_count- ������ ������.
 * @return false - ������������ ����� � ������, ������ �� ���������.
 * @return true  - ������ �������� �������.
 */
bool CbufWrite(cbuf_t* const buf, const uint8_t* data, const uint32_t data_count);

/**
 * @brief ������ � ���������� ��������� �� ������.
 * @param  buf        - ��������� �� ��������� ���������� �������.
 * @param  data       - ����� ���������� ������ (���� ����������).
 * @param  data_count - ���������� ��������� ��� ������.
 * @return ����� ����������� ���������.
 */
uint32_t CbufRead(cbuf_t* const buf, uint8_t* data, const uint32_t data_count);

/**
 * @brief �������� �������� �������� � ������ ��� ��������� ������ ������.
 * @param buf    - ��������� �� ��������� ���������� �������.
 * @param index  - �������� ������������ ������� ������.
 * @return �������� ��������.
 */
uint8_t CbufTestItem(cbuf_t* const buf, const uint32_t index);

/**
 * @brief ��������� ���� ������� � �����.
 * @param buf  - ��������� �� ��������� ���������� �������.
 * @param item �������� ��������.
 * @return false - ������������ ����� � ������, ������ �� ���������.
 * @return true  - ������ �������� �������.
 */
bool CbufPut(cbuf_t* const  buf, const uint8_t item);

/**
 * @brief ������ ������ �������� � ���������� ��� �� ������.
 * @param buf  - ��������� �� ��������� ���������� �������.
 * @param destination  - ��������� �� ����� ��� ������ ���������� �������.
 * @return false - ������ �� ���������
 * @return true  - ������ �������� �������.
 */
bool CbufGet(cbuf_t* const buf, uint8_t* destination);

/**
 * @brief ������ ���������� ��������� � ������.
 * @param buf  - ��������� �� ��������� ���������� �������.
 * @return ����� ��������� � ������.
 */
uint32_t CbufGetItemCount(cbuf_t* const buf);

/**
 * @brief ������ ���������� ��������� ����� � ������.
 * @param buf - ��������� �� ��������� ���������� �������.
 * @return ����� ��������� ����� � ������.
 */
uint32_t CbufGetFreeSize(cbuf_t* const buf);

/**
 * @brief ������� ������.
 * @param buf - ��������� �� ��������� ���������� �������.
 */
void CbufFlush(cbuf_t* const buf);

/**
 * @} __cbuf
 */
#endif /* CBUF_H_ */
