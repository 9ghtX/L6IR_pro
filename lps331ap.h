/**
 * @file   lps331ap.h
 * @date   14 ���. 2013 �.
 * @author
 * @brief  lps331ap
 */

#ifndef LPS331AP_H_
#define LPS331AP_H_

#ifdef LPS331AP
void  lps331ap_init(void);
float lps331ap_get_temperature(void);
#else
#define lps331ap_init()
#define lps331ap_get_temperature() 0.0
#endif

#endif /* LPS331AP_H_ */
