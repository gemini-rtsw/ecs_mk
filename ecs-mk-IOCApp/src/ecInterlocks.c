/*
 *
 * File Name:
 *	ecInterlocks.c
 *
 * Description:
 *	ECS subroutines for Gemini Interlock System (GIS) interface.
 *
 * FUNCTION NAME(S)
 *      iocStateSUB      determines current state of IOC
 *      ecsInterlocks    determines interlock demands
 *      ecsInterlocked   returns flag to show if command should be locked out
 *
 *  13-JAN-98 Initial release
 *  19-JAN-98 Moved in iocStateSUB
 *            Created ecInterlocks.h header file
 *  20-JAN-98 cleanup includes and move to ecs.h
 *  27-JAN-98 added "or Global" to motion and thermal in ecsInterlocks
 *  05-MAR-98 Removed all references of Global Interlock
 *  13-MAR-98 Added check for simulation in ecsInterlocked
 *
 *
 ********************************************************************/

#include "ecs.h"

#include <genSubRecord.h>
#include <sirRecord.h>

#include "ecInterlocks.h"

static long ecsIocState;
static long gisMotion;
static long gisThermal;
static long prMotion;
static long simLevel;

/********************************************************************
 *+
 * Routine name:
 *	iocStateSUB
 *
 * Function:
 *      
 *
 *      
 * Invocation:
 *      status = iocStateSUB ();
 *
 * Parameters: (">" input, "!" modified, "<" output)  
 *	(>) psir  (struct sirRecord *)    Gemini Subroutine record
 *      (>) psir->val  current state of ECS IOC
 *      (>) psir->imss message to attach to current state
 *
 * Function value:
 *	status  (long)    Always returns zero.
 * 
 *-
 */


long iocStateSUB( struct sirRecord *psir )
{
  ecsIocState = *(long *)psir->val;

  if( ecsIocState == BOOTING )
    strcpy(psir->imss, "BOOTING");
  else if( ecsIocState == INITIALISING )
    strcpy(psir->imss, "INITIALISING");
  else if( ecsIocState == RUNNING )
    strcpy(psir->imss, "RUNNING");
  return(0);
}



/********************************************************************
 *+
 * Routine name:
 *	ecsInterlocks
 *
 * Function:
 *      The interface to the GIS is provided through a digital I/O board.  Four
 *      input lines are used to implement the two sets of interlock demands.
 *      Each set of inputs is comprised of two TTL signals, one being the
 *      complement of the other and thus operating in a double safe mode.
 *      The system should be interlocked when this subroutine reads any 
 *      combination of the two interlock signals other than a positive demand
 *      of "1" and a negative demand of "0".  That particular combination
 *      should clear the interlock.
 *
 *      AWE: Also including a new Plant Room Interlock to prevent generator overload.
 *  
 *      Demand  Demand   
 *      Bit  0  Bit  1  State
 *       Pos.    Neg.    Out   Comment
 *      ------  -----   -----  -------
 *        0       0       1    Complementary fault - interpret as INTERLOCKED
 *        0       1       1    INTERLOCKED
 *        1       0       0    CLEAR
 *        1       1       1    Complementary fault - interpret as INTERLOCKED
 *
 * Invocation:
 *      status = ecsInterlocks ();
 *
 * Parameters: (">" input, "!" modified, "<" output)  
 *	(>) pgsub  (struct genSubRecord *)    Gemini Subroutine record
 *      (>) pgsub->a    current debug level
 *      (>) pgsub->b    positive half of motion demand
 *      (>) pgsub->c    negative half of motion demand
 *      (>) pgsub->e    positive half of thermal demand
 *      (>) pgsub->f    negative half of thermal demand
 *      (>) pgsub->g    Ignore Motion interlock
 *      (>) pgsub->h    Ignore Thermal interlock
 *      (>) pgsub->i    Plant Room Motion Interlock
 *      (<) pgsub->vala output for motion state
 *      (<) pgsub->valb output for thermal state
 *
 * Function value:
 *	status  (long)    Always returns zero.
 * 
 *-
 */

long ecsInterlocks ( struct genSubRecord *pgsub )
{
  long debug;
  long motionPos;
  long motionNeg;
  long thermalPos;
  long thermalNeg;
  long prInput;

     /* read current debug level */
  debug      = *(long *)pgsub->a;

  /* PGX REVIEW: enabling debug mode floods the console with messages
   * if there's an interlock. We need a better way of doing this.
   */
  debug = 0;

     /* read current simulation level */
  simLevel   = *(long *)pgsub->f;

     /* read complementary interlock pairs */
  motionPos  = *(long *)pgsub->b;
  motionNeg  = *(long *)pgsub->c;
  thermalPos = *(long *)pgsub->d;
  thermalNeg = *(long *)pgsub->e;
  prInput    = *(long *)pgsub->i;

  /* read in the plant room interlock signal */


     /* determine Motion Interlock demand */
  if (motionPos == 1 && motionNeg == 0)
  {
    gisMotion = 0;                              /* CLEAR  (remove interlock) */
    if (debug)
      printf("ecsInterlocks: remove motion interlock\n");
  }
  else
  {
    gisMotion = 1;                              /* INTERLOCK (set interlock) */
    if (debug)
    {
      printf("ecsInterlocks: set motion interlock\n");
      if (motionPos == motionNeg)
        printf("ecsInterlocks: complementary fault\n");
    }
  }

     /* determine Thermal Interlock demand */
  if (thermalPos == 1 && thermalNeg == 0)
  {
    gisThermal = 0;                             /* CLEAR  (remove interlock) */
    if (debug)
      printf("ecsInterlocks: remove thermal interlock\n");
  }
  else
  {
    gisThermal = 1;                             /* INTERLOCK (set interlock) */
    if (debug)
    {
      printf("ecsInterlocks: set thermal interlock\n");
      if (thermalPos == thermalNeg)
        printf("ecsInterlocks: complementary fault\n");
    }
  }

  if (prInput == 1)
    {
      prMotion = 1;
      if (debug) printf("ecsInterlocks: set motion interlock from Plant Room\n");
    }
  else
    {
      prMotion = 0;
      if (debug) printf("ecsInterlocks: remove motion interlock from Plant Room\n");
    }


  if( *(long *)pgsub->g )
    gisMotion  = 0;
  if( *(long *)pgsub->h )
    gisThermal = 0;

    /* write interlock states */
  *(long *)pgsub->vala = (gisMotion||prMotion);
  *(long *)pgsub->valb = gisThermal;

  return(0);
}


/********************************************************************
 *+
 * Routine name:
 *	ecsInterlocked
 *
 * Function:
 *      The ECS is required to interlock out the appropriate commands whenever 
 *      the GIS has issued an interlock demand.  It is also necessary to 
 *      interlock out commands at boot up before the IOC has properly 
 *      initialised.  This routine returns a flag  that enables the calling 
 *      routine to determine which (if any) of these interlock conditions is 
 *      true.  Every CAD routine should call this routine.  A descriptive 
 *      message is also returned 
 *      
 * Invocation:
 *      status = ecsInterlocked (message);
 *
 * Parameters: (">" input, "!" modified, "<" output)  
 *	(>) mess  (char *)  message string
 *
 * Function value:
 *	status  (long)   0, no interlock
 *                       1, IOC is not in RUNNING state
 *                       2, ECS motion systems are interlocked by GIS
 *                       3, ECS thermal systems are interlocked by GIS
 * 
 *-
 */


long ecsInterlocked (char *message)
{

  if (ecsIocState != RUNNING)
  {
    strcpy (message, "ECS is not available unless RUNNING");
    return (INTRLK_NORUN);
  }

  if ((gisMotion == TRUE) && (gisThermal == TRUE) && (simLevel == SIMM_NONE))
  {
    strcpy (message, "ECS systems are all interlocked");
    return (INTRLK_GLOBAL);
  }

  if ((gisMotion == TRUE) && (simLevel == SIMM_NONE))
  {
    /* strcpy (message, "ECS motion systems are interlocked");*/
    /* changed the message to reflect actual possible causes of interrupt */
    strcpy (message, "ECS interlocked check airlift and crane");
    return (INTRLK_MOTION);
  }

  if ((gisThermal == TRUE) && (simLevel == SIMM_NONE))
  {
    strcpy (message, "ECS thermal systems are interlocked");
    return (INTRLK_THERMAL);
  }

  if ((prMotion == TRUE) && (simLevel == SIMM_NONE))
  {
    strcpy (message, "ECS interlocked on Generator Power");
    return (INTRLK_MOTION);
  }

  strcpy (message, " ");
  return (INTRLK_NONE);

}

epicsRegisterFunction(ecsInterlocks);
epicsRegisterFunction(iocStateSUB);
