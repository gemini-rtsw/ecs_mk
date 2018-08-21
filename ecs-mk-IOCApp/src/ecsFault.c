/*
 *    Gemini Enclosure Control System
 *
 *     Device fault system Gensub functions
 */

/*    version 1.0    wnr     gamma release             */

#include "ecs.h"
#include <epicsTime.h>

#include <dbDefs.h>
#include <genSubRecord.h>
#include <dbCommon.h>
#include <recSup.h>
#include <ecsMotor.h>


/*
 * Gemini enclosure control system 
 * 
 * Device fault status gensub pin definitions
 *
 */

#define ECS_WORD_0		*(long *)psr->a
#define ECS_WORD_1	        *(long *)psr->b
#define ECS_WORD_2		*(long *)psr->c
#define ECS_WORD_3		*(long *)psr->d
#define ECS_WORD_4	        *(long *)psr->e
#define ECS_WORD_5		*(long *)psr->f
#define ECS_WORD_6	        *(long *)psr->g
#define ECS_WORD_16		*(long *)psr->h
#define ECS_WORD_17		*(long *)psr->i
#define ECS_FAULT_IN		*(long *)psr->j

#define ECS_DOME_FAULT		*(long *)psr->vala
#define ECS_DOME_BLOCK		*(long *)psr->valb
#define ECS_EVG_FAULT		*(long *)psr->valc
#define ECS_EVG_BLOCK		*(long *)psr->vald
#define ECS_WVG_FAULT		*(long *)psr->vale
#define ECS_WVG_BLOCK		*(long *)psr->valf
#define ECS_TSH_FAULT		*(long *)psr->valg
#define ECS_TSH_BLOCK		*(long *)psr->valh
#define ECS_BSH_FAULT		*(long *)psr->vali
#define ECS_BSH_BLOCK		*(long *)psr->valj

/*
 * Gemini enclosure control system 
 * 
 * Interlock and heartbeat monitor gensub pin definitions
 *
 */
#define ECS_PLC_WATCHDOG       	*(long *)psr->a
#define ECS_INTERLOCK   	*(long *)psr->b

#define ECS_FAULT_OUT    	*(long *)psr->vala
#define ECS_CARDIAC_ARREST	*(long *)psr->valb
#define ECS_WATCHDOG    	*(long *)psr->valc


/* Top shutter.
 */
#define ECS_TSH_AMP_FAULT	        (ECS_WORD_0 & 0x000f)
#define ECS_TSH_REGEN_FAULT		(ECS_WORD_0 & 0x00f0)
#define ECS_TSH_CONTACTOR_FAULT		(ECS_WORD_0 & 0x0f00)
#define ECS_TSH_MOTOR_OVERLOAD		(ECS_WORD_0 & 0xf000)

#define ECS_TSH_CLOSE_SLOW_SW		(ECS_WORD_16 & 0x0001)
#define ECS_TSH_CLOSE_EOT_SW		(ECS_WORD_16 & 0x0002)
#define ECS_TSH_CLOSE_OVER_SW		(ECS_WORD_16 & 0x0004)
#define ECS_TSH_OPEN_SLOW_SW		(ECS_WORD_16 & 0x0008)
#define ECS_TSH_OPEN_EOT_SW  		(ECS_WORD_16 & 0x0010)
#define ECS_TSH_OPEN_OVER_SW		(ECS_WORD_16 & 0x0020)

#define ECS_TSH_ENCODER_FAULT		(ECS_WORD_17 & 0x0020)

/* Bottom shutter.
 */
#define ECS_BSH_AMP_FAULT		(ECS_WORD_1 & 0x000f)
#define ECS_BSH_REGEN_FAULT		(ECS_WORD_1 & 0x00f0)
#define ECS_BSH_CONTACTOR_FAULT		(ECS_WORD_1 & 0x0f00)
#define ECS_BSH_MOTOR_OVERLOAD		(ECS_WORD_1 & 0xf000)

#define ECS_BSH_CLOSE_SLOW_SW		(ECS_WORD_16 & 0x0040)
#define ECS_BSH_CLOSE_EOT_SW		(ECS_WORD_16 & 0x0080)
#define ECS_BSH_CLOSE_OVER_SW		(ECS_WORD_16 & 0x0100)
#define ECS_BSH_OPEN_SLOW_SW		(ECS_WORD_16 & 0x0200)
#define ECS_BSH_OPEN_EOT_SW		(ECS_WORD_16 & 0x0400)
#define ECS_BSH_OPEN_OVER_SW 		(ECS_WORD_16 & 0x0800)

#define ECS_BSH_ENCODER_FAULT		(ECS_WORD_17 & 0x0040)

#define	ECS_BSH_SKEWING 		(ECS_WORD_17 & 0x0800)
#define	ECS_BSH_SKW_ENCODER_FAULT	(ECS_WORD_17 & 0x1000)


/* Dome
 */
#define ECS_DOME_AMP_FAULT		(ECS_WORD_2 & 0x00ff)
#define ECS_DOME_BREAK_OVERLOAD		(ECS_WORD_2 & 0xff00)
#define ECS_DOME_MOTOR_OVERLOAD		(ECS_WORD_3 & 0x00ff)

#define ECS_DOME_ENCODER_FAULT		(ECS_WORD_17 & 0x0010)

/* East vent gate.
 */
#define ECS_EVG_AMP_FAULT		(ECS_WORD_4 & 0x000f)
#define ECS_EVG_BREAK_OVERLOAD		(ECS_WORD_4 & 0x00f0)
#define ECS_EVG_CONTACTOR_FAULT		(ECS_WORD_4 & 0x0f00)
#define ECS_EVG_MOTOR_OVERLOAD		(ECS_WORD_4 & 0xf000)

#define ECS_EVG_CLOSE_SLOW_SW	        (ECS_WORD_16 & 0x1000)
#define ECS_EVG_CLOSE_EOT_SW		(ECS_WORD_16 & 0x2000)
#define ECS_EVG_CLOSE_OVER_SW		(ECS_WORD_17 & 0x0200)
#define ECS_EVG_OPEN_SLOW_SW		(ECS_WORD_16 & 0x4000)
#define ECS_EVG_OPEN_EOT_SW		(ECS_WORD_16 & 0x8000)

#define ECS_EVG_ENCODER_FAULT	        (ECS_WORD_17 & 0x0080)

/* West vent gate.
 */
#define ECS_WVG_AMP_FAULT		(ECS_WORD_5 & 0x000f)
#define ECS_WVG_BREAK_OVERLOAD		(ECS_WORD_5 & 0x00f0)
#define ECS_WVG_CONTACTOR_FAULT		(ECS_WORD_5 & 0x0f00)
#define ECS_WVG_MOTOR_OVERLOAD		(ECS_WORD_5 & 0xf000)

#define ECS_WVG_CLOSE_SLOW_SW		(ECS_WORD_17 & 0x0001)
#define ECS_WVG_CLOSE_EOT_SW		(ECS_WORD_17 & 0x0002)
#define ECS_WVG_CLOSE_OVER_SW		(ECS_WORD_17 & 0x0400)
#define ECS_WVG_OPEN_SLOW_SW		(ECS_WORD_17 & 0x0004)
#define ECS_WVG_OPEN_EOT_SW		(ECS_WORD_17 & 0x0008)

#define ECS_WVG_ENCODER_FAULT		(ECS_WORD_17 & 0x0100)

/* PLC Control Modes */
#define ECS_PLC_OFF		        (ECS_WORD_6 & 0x0001)
#define ECS_PLC_ECS		        (ECS_WORD_6 & 0x0002)
#define ECS_PLC_PCU1		        (ECS_WORD_6 & 0x0004)
#define ECS_PLC_PCU2		        (ECS_WORD_6 & 0x0008)

/* Interprocess fault codes */
#define ECS_WATCHDOG_FAULT              0x0001
#define ECS_INTERLOCK_FAULT             0x0002

/* other definitions */
#define MAX_PLC_DEAD_TIME      20

#ifdef NODEBUG
#define Debug(l,FMT,V) ;
#else
#define Debug(l,FMT,V) errlogSevPrintf (l, FMT, (int)getSecondsOSI(), psr->name, (int)V);
#endif

/* local variables */
static long deadTime;
static long lastDomeFault;
static long lastEvgFault;
static long lastWvgFault;
static long lastTshFault;
static long lastBshFault;

/* function prototypes */
long ecsFaultInit (struct genSubRecord *psr);
long ecsFaultProcess (struct genSubRecord *psr);
long ecsFaultHskInit (struct genSubRecord *psr);
long ecsFaultHskProcess (struct genSubRecord *psr);



/*
 * FUNCTION getSecondsOSI()
 *
 * Replaces VxWorks tickGet() routine with OSI EPICs routine
 * It returns the epoch in seconds
 *
 */
long getSecondsOSI() //TODO: This function should be under ecsMisc.c
{
  epicsTimeStamp ts;
  time_t ut; 

  epicsTimeGetCurrent(&ts);       /* get current time in EPICS epoch */
  epicsTimeToTime_t(&ut, &ts);    /* convert it to "unix time"       */

  return ut;
}

/*
 * FUNCTION ecsFaultInit
 *
 * Initialize the ecs system fault decoder
 *
 */
long ecsFaultInit (struct genSubRecord *psr) {

  /* clear the device status words */
  ECS_DOME_FAULT = 0;
  ECS_EVG_FAULT = 0;
  ECS_WVG_FAULT = 0;
  ECS_TSH_FAULT = 0;
  ECS_BSH_FAULT = 0;

  return (0);
}

/*
 * FUNCTION ecsFaultHbInit
 *
 * Initialize the ecs system heartbeat and interlock monitor
 *
 */
long ecsFaultHbInit (struct genSubRecord *psr) {

  /* reset the heartbeat monitor */
  deadTime = 0;
  ECS_WATCHDOG = 0;
  ECS_CARDIAC_ARREST = FALSE;

  return (0);
}


/*
 * FUNCTION ecsFaultProcess
 *
 * Create individual status words from the PLC state information
 *
 */
long ecsFaultProcess (struct genSubRecord *psr) {
  long status = 0;

  /* save and then clear the device status words */
  lastDomeFault = ECS_DOME_FAULT; 
  ECS_DOME_FAULT = 0;
  lastEvgFault = ECS_EVG_FAULT; 
  ECS_EVG_FAULT = 0;
  lastWvgFault = ECS_WVG_FAULT; 
  ECS_WVG_FAULT = 0;
  lastTshFault = ECS_TSH_FAULT; 
  ECS_TSH_FAULT = 0;
  lastBshFault = ECS_BSH_FAULT; 
  ECS_BSH_FAULT = 0;

  /* Then do a device-by-device check of the system */

  /* Dome */
  if (ECS_FAULT_IN & ECS_INTERLOCK_FAULT) ECS_DOME_FAULT |= INTERLOCK;
  if (ECS_FAULT_IN & ECS_WATCHDOG_FAULT) ECS_DOME_FAULT |= SYSTEM_DEAD;
  if (!ECS_PLC_ECS) ECS_DOME_FAULT |= PLC_OFFLINE;

  if (ECS_DOME_AMP_FAULT || 
      ECS_DOME_BREAK_OVERLOAD || 
      ECS_DOME_MOTOR_OVERLOAD) ECS_DOME_FAULT |= DEVICE_FAILURE;
  
  if (ECS_DOME_ENCODER_FAULT) ECS_DOME_FAULT |= ENCODER_FAULT;

  /* East Ventgate */
  if (ECS_FAULT_IN & ECS_INTERLOCK_FAULT) ECS_EVG_FAULT |= INTERLOCK;
  if (ECS_FAULT_IN & ECS_WATCHDOG_FAULT) ECS_EVG_FAULT |= SYSTEM_DEAD;
  if (!ECS_PLC_ECS) ECS_EVG_FAULT |= PLC_OFFLINE;

  if (ECS_EVG_AMP_FAULT || 
      ECS_EVG_BREAK_OVERLOAD || 
      ECS_EVG_CONTACTOR_FAULT ||
      ECS_EVG_MOTOR_OVERLOAD) ECS_EVG_FAULT |= DEVICE_FAILURE;
  
  if (ECS_EVG_CLOSE_SLOW_SW) ECS_EVG_FAULT |= CLOSE_SLOW_LIMIT;
  if (ECS_EVG_CLOSE_EOT_SW) ECS_EVG_FAULT |= CLOSE_EOT_LIMIT;
  if (ECS_EVG_CLOSE_OVER_SW) ECS_EVG_FAULT |= CLOSE_OVER_LIMIT;
  if (ECS_EVG_OPEN_SLOW_SW) ECS_EVG_FAULT |= OPEN_SLOW_LIMIT;
  if (ECS_EVG_OPEN_EOT_SW) ECS_EVG_FAULT |= OPEN_EOT_LIMIT;

  if (ECS_EVG_ENCODER_FAULT) ECS_EVG_FAULT |= ENCODER_FAULT;

  /* West Ventgate */
  if (ECS_FAULT_IN & ECS_INTERLOCK_FAULT) ECS_WVG_FAULT |= INTERLOCK;
  if (ECS_FAULT_IN & ECS_WATCHDOG_FAULT) ECS_WVG_FAULT |= SYSTEM_DEAD;
  if (!ECS_PLC_ECS) ECS_WVG_FAULT |= PLC_OFFLINE;

  if (ECS_WVG_AMP_FAULT || 
      ECS_WVG_BREAK_OVERLOAD || 
      ECS_WVG_CONTACTOR_FAULT ||
      ECS_WVG_MOTOR_OVERLOAD) ECS_WVG_FAULT |= DEVICE_FAILURE;
  
  if (ECS_WVG_CLOSE_SLOW_SW) ECS_WVG_FAULT |= CLOSE_SLOW_LIMIT;
  if (ECS_WVG_CLOSE_EOT_SW) ECS_WVG_FAULT |= CLOSE_EOT_LIMIT;
  if (ECS_WVG_CLOSE_OVER_SW) ECS_WVG_FAULT |= CLOSE_OVER_LIMIT;
  if (ECS_WVG_OPEN_SLOW_SW) ECS_WVG_FAULT |= OPEN_SLOW_LIMIT;
  if (ECS_WVG_OPEN_EOT_SW) ECS_WVG_FAULT |= OPEN_EOT_LIMIT;

  if (ECS_WVG_ENCODER_FAULT) ECS_WVG_FAULT |= ENCODER_FAULT;

  /* Top Shutter */
  if (ECS_FAULT_IN & ECS_INTERLOCK_FAULT) ECS_TSH_FAULT |= INTERLOCK;
  if (ECS_FAULT_IN & ECS_WATCHDOG_FAULT) ECS_TSH_FAULT |= SYSTEM_DEAD;
  if (!ECS_PLC_ECS) ECS_TSH_FAULT |= PLC_OFFLINE;

  if (ECS_TSH_AMP_FAULT || 
      ECS_TSH_REGEN_FAULT || 
      ECS_TSH_CONTACTOR_FAULT ||
      ECS_TSH_MOTOR_OVERLOAD) ECS_TSH_FAULT |= DEVICE_FAILURE;
  
  if (ECS_TSH_CLOSE_SLOW_SW) ECS_TSH_FAULT |= CLOSE_SLOW_LIMIT;
  if (ECS_TSH_CLOSE_EOT_SW) ECS_TSH_FAULT |= CLOSE_EOT_LIMIT;
  if (ECS_TSH_CLOSE_OVER_SW) ECS_TSH_FAULT |= CLOSE_OVER_LIMIT;
  if (ECS_TSH_OPEN_SLOW_SW) ECS_TSH_FAULT |= OPEN_SLOW_LIMIT;
  if (ECS_TSH_OPEN_EOT_SW) ECS_TSH_FAULT |= OPEN_EOT_LIMIT;
  if (ECS_TSH_OPEN_OVER_SW) ECS_TSH_FAULT |= OPEN_OVER_LIMIT;

  if (ECS_TSH_ENCODER_FAULT) ECS_TSH_FAULT |= ENCODER_FAULT;

  /* Bottom Shutter */
  if (ECS_FAULT_IN & ECS_INTERLOCK_FAULT) ECS_BSH_FAULT |= INTERLOCK;
  if (ECS_FAULT_IN & ECS_WATCHDOG_FAULT) ECS_BSH_FAULT |= SYSTEM_DEAD;
  if (!ECS_PLC_ECS) ECS_BSH_FAULT |= PLC_OFFLINE;

  if (ECS_BSH_AMP_FAULT || 
      ECS_BSH_REGEN_FAULT || 
      ECS_BSH_CONTACTOR_FAULT ||
      ECS_BSH_MOTOR_OVERLOAD) ECS_BSH_FAULT |= DEVICE_FAILURE;
  
  if (ECS_BSH_CLOSE_SLOW_SW) ECS_BSH_FAULT |= OPEN_SLOW_LIMIT;
  if (ECS_BSH_CLOSE_EOT_SW) ECS_BSH_FAULT |= OPEN_EOT_LIMIT;
  if (ECS_BSH_CLOSE_OVER_SW) ECS_BSH_FAULT |= OPEN_OVER_LIMIT;
  if (ECS_BSH_OPEN_SLOW_SW) ECS_BSH_FAULT |= CLOSE_SLOW_LIMIT;
  if (ECS_BSH_OPEN_EOT_SW) ECS_BSH_FAULT |= CLOSE_EOT_LIMIT;
  if (ECS_BSH_OPEN_OVER_SW) ECS_BSH_FAULT |= CLOSE_OVER_LIMIT;

  if (ECS_BSH_ENCODER_FAULT) ECS_BSH_FAULT |= ENCODER_FAULT;

  if (ECS_BSH_SKEWING) ECS_BSH_FAULT |= SKEWING;

  if (ECS_BSH_SKW_ENCODER_FAULT) ECS_BSH_FAULT |= ENCODER_FAULT;

  /* Ignore errors? */

  if( *(long *)psr->k )
    ECS_DOME_FAULT = 0;
  if( *(long *)psr->l )
    ECS_EVG_FAULT = 0;
  if( *(long *)psr->m )
    ECS_WVG_FAULT = 0;
  if( *(long *)psr->n )
    ECS_TSH_FAULT = 0;
  if( *(long *)psr->o )
    ECS_BSH_FAULT = 0;

  /* Now enable only those fault words that have changed */
  ECS_DOME_BLOCK = ECS_EVG_BLOCK = ECS_WVG_BLOCK = ECS_TSH_BLOCK = ECS_BSH_BLOCK = TRUE;
  if (ECS_DOME_FAULT != lastDomeFault) {
    Debug (errlogInfo,"<%4d> %s:new dome fault word:%d\n", ECS_DOME_FAULT);
    ECS_DOME_BLOCK = FALSE;
  }

  if (ECS_EVG_FAULT != lastEvgFault) {
    Debug (errlogInfo,"<%4d> %s:new evg fault word:%d\n", ECS_EVG_FAULT);
    ECS_EVG_BLOCK = FALSE;
  }

  if (ECS_WVG_FAULT != lastWvgFault) {
    Debug (errlogInfo,"<%4d> %s:new wvg fault word:%d\n", ECS_WVG_FAULT);
    ECS_WVG_BLOCK = FALSE;
  }

  if (ECS_TSH_FAULT != lastTshFault) {
    Debug (errlogInfo,"<%4d> %s:new tsh fault:%d\n", ECS_TSH_FAULT);
    ECS_TSH_BLOCK = FALSE;
  }

  if (ECS_BSH_FAULT != lastBshFault) {
    Debug (errlogInfo,"<%4d> %s:new bsh fault:%d\n", ECS_BSH_FAULT);
    ECS_BSH_BLOCK = FALSE;
  }


  /* All done! */
  return status;
}

/*
 * FUNCTION ecsFaultHbProcess
 *
 * Monitor PLC heartbeat and system interlock lines
 *
 */
long ecsFaultHbProcess (struct genSubRecord *psr) {
  long status = 0;

  /* clear the device status words */
  ECS_CARDIAC_ARREST = FALSE;
  ECS_FAULT_OUT = 0;

  /* interlock line is most important */
  if (ECS_INTERLOCK) ECS_FAULT_OUT |= ECS_INTERLOCK_FAULT;

  /* Make sure that the PLC is alive */
  if ((ECS_PLC_WATCHDOG != ECS_WATCHDOG)) deadTime = 0;
  if (++deadTime > MAX_PLC_DEAD_TIME) {
    ECS_CARDIAC_ARREST = TRUE;
    ECS_FAULT_OUT |= ECS_WATCHDOG_FAULT;
  }
  ECS_WATCHDOG = ECS_PLC_WATCHDOG;

  return (status);
}
epicsRegisterFunction(ecsFaultProcess);
epicsRegisterFunction(ecsFaultHbInit);
epicsRegisterFunction(ecsFaultHbProcess);
epicsRegisterFunction(ecsFaultInit);


