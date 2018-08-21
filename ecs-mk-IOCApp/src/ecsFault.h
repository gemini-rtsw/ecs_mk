/* ecsFault.h */
/* Public definitions for ecs fault processing interface */

/* Define the fault output word bit map */
#define OPEN_SLOW_LIMIT   	        0x0001
#define OPEN_EOT_LIMIT 		        0x0002
#define OPEN_OVER_LIMIT		        0x0004
#define CLOSE_SLOW_LIMIT   	        0x0008
#define CLOSE_EOT_LIMIT 		0x0010
#define CLOSE_OVER_LIMIT		0x0020
#define DEVICE_WARNING		        0x0040
#define DEVICE_FAILURE 	  	        0x0080
#define ENCODER_FAULT	  	        0x0100
#define PLC_OFFLINE		        0x0200
#define SYSTEM_DEAD   		        0x0400
#define INTERLOCK                       0x0800



