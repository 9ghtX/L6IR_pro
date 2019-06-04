/**
 * @file cbuf.c
 * @date 07.12.2011
 * @brief Модуль cbuf 
 */

/**
 * @addtogroup __cbuf
 * @{
 */


#include "cbuf.h"
/* ------------------------------------------------------------------ */
/*Локальные функции*/
/* ------------------------------------------------------------------ */
/**
 * CbufPush
 * @brief Запись в конец буфера.
 * @param buf указатель на структуру управления буфером
 * @param item элемент для записи в буфер
 */

static void  CbufPush(cbuf_t* const buf, const uint8_t item)
{
  buf->base[buf->last] = item;
  buf->last++;
  buf->count++;
  buf->last = buf->last % buf->size; /*wrap*/
//  if (buf->last = buf->size)
//  {
//    buf->last = 0;
//  }
}

/* ------------------------------------------------------------------ */
/**
 * CbufPop
 * @brief Извлечь из начала буфера
 * @param buf указатель на структуру управления буфером
 * @return элемент из начала буфера
 */

static uint8_t CbufPop(cbuf_t* const buf)
{
  uint8_t item = buf->base[buf->first];
  buf->count--;
  buf->first++;
  buf->first = buf->first % buf->size;
//  if (buf->first == buf->size)
//  {
//    buf->first = 0;
//  }
  return item;
}
/* ------------------------------------------------------------------ */

/* ------------------------------------------------------------------ */
void CbufInit(cbuf_t* const buf, uint8_t* mem, uint32_t mem_size)
{
  buf->base  = mem;
  buf->size  = mem_size;
  buf->first = 0;
  buf->last  = 0;
  buf->count = 0;
}

/* ------------------------------------------------------------------ */
bool CbufWrite(cbuf_t* const buf, const uint8_t* data, const uint32_t data_count)
{
  uint8_t i;
  bool ret_value = false;
  if ( data_count <= (buf->size - buf->count) )
  {
    for (i = 0; i < data_count; i++)
    {
      CbufPush(buf, *(data++));
    }
    ret_value = true;
  }
  return (ret_value);
}
/* ------------------------------------------------------------------ */
uint32_t CbufRead(cbuf_t* const buf, uint8_t* data, const uint32_t data_count)
{
  uint32_t i;
  uint32_t len;
  len = (data_count < buf->count) ? data_count : buf->count;
  for (i = 0; i < len; i++)
  {
    data[i] = CbufPop(buf);
  }
  return (i);
}
/* ------------------------------------------------------------------ */
uint8_t CbufTestItem(cbuf_t* const buf, const uint32_t index)
{
  uint32_t pos;
  uint8_t item;
  pos = buf->first + index;
  if (pos < buf->size)
  {
    item = buf->base[pos];
  }
  else
  {
    item = buf->base[pos - buf->size];
  }
  return (item);
}
/* ------------------------------------------------------------------ */
bool CbufPut(cbuf_t* const buf, const uint8_t item)
{
  bool ret_value = false;
  if (buf->count < buf->size)
  {
    CbufPush(buf, item);
    ret_value = true;
  }
  return ret_value;
}
/* ------------------------------------------------------------------ */
bool CbufGet(cbuf_t* const buf, uint8_t* destination)
{
  bool ret_value = false;
  if (0UL != buf->count)
  {
    *destination = CbufPop(buf);
    ret_value = true;
  }
  return ret_value;
}
/* ------------------------------------------------------------------ */
uint32_t CbufGetItemCount(cbuf_t* const buf)
{
  return buf->count;
}
/* ------------------------------------------------------------------ */
uint32_t CbufGetFreeSize(cbuf_t* const buf)
{
  return buf->size - buf->count;
}
/* ------------------------------------------------------------------ */
void CbufFlush(cbuf_t* const buf)
{
  buf->count = 0;
  buf->first = buf->last;
}
/* ------------------------------------------------------------------ */

/**
 * @} __cbuf
 */
