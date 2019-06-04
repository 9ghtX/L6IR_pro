#include "L6IR.h"
#include "Ball.h"
#include "hal_critical_section.h"
#include "net.h"
#include "Camera.h"

extern spi_def spi_sets;
extern bool flash_is_read;

u32 mask_for_waiting;
typedef enum
{
  start_waiting =0,
  flash_reading,
  battle_tasks
}tasks_m;

tasks_m tasks_mode;

bool silar_spi_tasks()
{
  bool task_make_status = false;
  spi_sets.silar_status = spi_silar_read(STATUS_REG_ADDR); 
  /*READING RESTERS*/
  if((spi_sets.read_sichro_count==0))//&&spi_sets.stat_read_enable)
     {
      switch(tasks_mode) 
      {

           case start_waiting:
        
            tasks_mode++;
            break;
        
           case flash_reading:
            if(spi_sets.silar_status&FLASH_READY_BIT) flash_reading_process(); 
            if(flash_is_read)tasks_mode++;  
           break;
        
            case battle_tasks:
              if(spi_sets.silar_status&mask_for_waiting)battle_receive(mask_for_waiting);
              else  no_data_receive(mask_for_waiting);
            break;
        
           default:
           tasks_mode = start_waiting;
           break;
         }
     }
  /*WRIGHTING REGISTERS*/
       else// if()
        {
          switch(tasks_mode)
          {
            case start_waiting:
        
            break;
        
            case flash_reading:

            break;
        
            case battle_tasks:
              battle_transmit_find();
            break;
        
           default:
           tasks_mode = start_waiting;
           break;       
        
        }
      }
  return task_make_status;
}

void battle_receive(u32 task_mask)
{
switch(task_mask)
{
  case TEMP_REED_READY_BIT:
  
  break;
  
  default:
  
  break;
}

}

void no_data_receive(u32 task_mask)
{


}

bool battle_transmit_find()
{


}

