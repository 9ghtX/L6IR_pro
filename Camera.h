
//############## STATUS REGISTER TESTs BITs #################################### 


#define MARK0_READY_BIT   0x00000001
#define MARK1_READY_BIT   0x00000002
#define MARK2_READY_BIT   0x00000004
#define MARK3_READY_BIT   0x00000008
#define MARK4_READY_BIT   0x00000010
#define MARK5_READY_BIT   0x00000020
#define MARK6_READY_BIT   0x00000040
#define MARK7_READY_BIT   0x00000080
#define MARK8_READY_BIT   0x00000100
#define MARK9_READY_BIT   0x00000200
#define MARK10_READY_BIT  0x00000400
#define MARK11_READY_BIT  0x00000800
#define MARK12_READY_BIT  0x00001000
#define MARK13_READY_BIT  0x00002000
#define MARK14_READY_BIT  0x00004000
#define MARK15_READY_BIT  0x00008000
#define MARK16_READY_BIT  0x00010000

#define FLASH_READY_BIT       0x00020000 //17
#define CAM_STATE_READY_BIT   0x00040000 //18
#define MARKS_BLOCK_READY_BIT 0x00080000 //19  wright only
#define TEMP_REED_READY_BIT   0x00080000 // 19 read only
#define DIST_READY_BIT        0x00100000 // 20
#define TEMP_WRIGHT_READY_BIT 0x00200000 // 21
#define PRESS_READY_BIT       0x00400000 // 22
#define INCL_READY_BIT        0x00800000 // 23

#define COMMAND_READY_BIT     0x40000000 // 30

//########################### FUNCTIONS  #######################################
void battle_receive(u32);
void no_data_receive(u32);
bool battle_transmit_find();
