/*
 *   File Name:
 *      ecSIR.c
 * 
 *
 *   Routines called from SIR records.
 *
 *   Function Names:
 *      debugSUB       debug level choices
 *      healthSUB      health choices
 *      inPositionSUB  mechanism in position choices
 *      limitSUB       mechanism limit switch choices
 *      logicSUB       off or on
 *      mstateSUB      mechansim state choices
 *      shtrSealedSUB  open or closed
 *      simulateSUB    simulation level choices
 *      stateSUB       ???
 *   
 *   09-JUL-97 Proto release
 *   15-AUG-97 Remove apmodeSUB, arraySUB and azmodeSUB
 *             remove FOLLOWING mechanism state (long == 4)
 *             Added comments for alarm states
 *             Reversed InPosition states 0 is TRUE now
 *   19-JAN-98 Moved rawstateSUB to ecInterlocks.c and renamed to iocStateSUB 
 *             Added static variable for ecsIocState
 *   14-APR-98 Added SHUTDOWN state to thermalSUB and shifted ERROR up
 *   13-MAY-98 added shtrSealedSUB
 *   15-MAY-98 added include for ecs.h and its defines to assign values
 *              in debugSUB, healthSUB (also added INVALID), mstateSUB
 *             added include for ecsMotor.h and its defines to assign values
 *              to limitSUB
 */

#include "ecs.h"
#include "ecsMotor.h"

#include <string.h>
#include <sirRecord.h>

static long heartbeatValue;
static long missedBeats;

long debugSUB( struct sirRecord *psir )
{
  if( *(long *)psir->val == DBG_NONE )
    strcpy(psir->imss, "NONE");
  else if( *(long *)psir->val == DBG_MIN )
    strcpy(psir->imss, "MIN");
  else if( *(long *)psir->val == DBG_FULL )
    strcpy(psir->imss, "FULL");
  return(0);
}


long healthSUB( struct sirRecord *psir )
{
  if( *(long *)psir->val == GOOD_HEALTH )
    strcpy(psir->imss, "GOOD");
  else if( *(long *)psir->val == WARNING_HEALTH )
    strcpy(psir->imss, "WARNING");                      /* MINOR alarm state */
  else if( *(long *)psir->val == BAD_HEALTH )
    strcpy(psir->imss, "BAD");                          /* MAJOR alarm state */
  else if( *(long *)psir->val == INVALID_HEALTH )
    strcpy(psir->imss, "INVALID");                      /* MAJOR alarm state */
  return(0);
}


long heartbeatSUB( struct sirRecord *psir )
{
  if (*(long *)psir->val == heartbeatValue) {
    if (++missedBeats < 5) return (0);
    else {
      strcpy (psir->omss, "ECS heartbeat failure");
      *(long *)psir->val = 1;
      return (1);
    }
  }
  
  heartbeatValue = *(long *)psir->val;
  *(long *)psir->val = 0;
  missedBeats = 0;

  return(0);
}


long inPositionSUB( struct sirRecord *psir )
{
  if( *(long *)psir->val == 0 )
    strcpy(psir->imss, "FALSE");                        /* MINOR alarm state */
  else if( *(long *)psir->val == 1 )
    strcpy(psir->imss, "TRUE");
  return(0);
}


long limitSUB( struct sirRecord *psir )
{
  if( *(long *)psir->val == ECS_NO_LSW )
    strcpy(psir->imss, "NONE");
  else if( *(long *)psir->val == ECS_SLOW_LSW )
    strcpy(psir->imss, "SLOW");
  else if( *(long *)psir->val == ECS_END_LSW )
    strcpy(psir->imss, "ENDOFTRAVEL");                  /* MINOR alarm state */
  else if( *(long *)psir->val == ECS_OVER_LSW )
    strcpy(psir->imss, "OVERTRAVEL");                   /* MAJOR alarm state */
  return(0);
}


long logicSUB( struct sirRecord *psir )
{
  if( *(long *)psir->val == 0 )
    strcpy(psir->imss, "OFF");
  else if( *(long *)psir->val == 1 )
    strcpy(psir->imss, "ON");
  return(0);
}


long mstateSUB( struct sirRecord *psir )
{
  if( *(long *)psir->val == STOPPED )
    strcpy(psir->imss, "STOPPED");
  else if( *(long *)psir->val == STOPPING )
    strcpy(psir->imss, "STOPPING");
  else if( *(long *)psir->val == MOVING )
    strcpy(psir->imss, "MOVING");
  else if( *(long *)psir->val == PARKING )
    strcpy(psir->imss, "PARKING");
  else if( *(long *)psir->val == SIR_OFFLINE )
    strcpy(psir->imss, "OFFLINE");                      /* MINOR alarm state */
  else if( *(long *)psir->val == SIR_ERROR )
    strcpy(psir->imss, "ERROR");                        /* MAJOR alarm state */
  else
    strcpy(psir->imss, "INVALID");                      /* MAJOR alarm state */
  return(0);
}


long shtrSealedSUB( struct sirRecord *psir )
{
  if( *(long *)psir->val == 0 )
    strcpy(psir->imss, "OPEN");
  else if( *(long *)psir->val == 1 )
    strcpy(psir->imss, "CLOSED");
  return(0);
}


long simulateSUB( struct sirRecord *psir )
{
  if( *(long *)psir->val == 0 )
    strcpy(psir->imss, "NONE");
  else if( *(long *)psir->val == 1 )
    strcpy(psir->imss, "VSM");                          /* MINOR alarm state */
  else if( *(long *)psir->val == 2 )
    strcpy(psir->imss, "FAST");                         /* MINOR alarm state */
  else if( *(long *)psir->val == 3 )
    strcpy(psir->imss, "FULL");                         /* MINOR alarm state */
  return(0);
}


long stateSUB( struct sirRecord *psir )
{
  if( *(long *)psir->val == 0 )
    strcpy(psir->imss, "STOPPED");
  else if( *(long *)psir->val == 1 )
    strcpy(psir->imss, "ACTIVE");
  return(0);
}


long logSUB( struct sirRecord *psir )
{
  epicsTimeStamp ts;
  time_t ut;

  epicsTimeGetCurrent(&ts);       /* get current time in EPICS epoch */
  epicsTimeToTime_t(&ut, &ts);    /* convert it to "unix time"       */ 

  errlogSevPrintf(errlogInfo, "<%4ld> %s\n", ut%1000, (char *)psir->val);
  
  return(0);
}


epicsRegisterFunction(logSUB);
epicsRegisterFunction(debugSUB);
epicsRegisterFunction(healthSUB);
epicsRegisterFunction(heartbeatSUB);
epicsRegisterFunction(inPositionSUB);
epicsRegisterFunction(limitSUB);
epicsRegisterFunction(mstateSUB);
epicsRegisterFunction(shtrSealedSUB);
