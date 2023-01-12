/*
 *
 *   File Name:
 *	ecMisc.c
 *
 *   Description:
 *	Miscellaneous ECS subroutines.
 *
 *   FUNCTION NAME(S)
 *      carCombine     OR the CAR outputs for highest priority
 *      checkBuffer    Checks arg to determine if int, double or all blanks
 *      initialiseSub  Initialize ECS using pvload
 *      nullSub        Does nothing
 *      maskSub    
 *      rebootSub      Calls the reboot vxworks function
 *      simDemux       Demultiplex the Simulation mode
 *                        to produce six logical values
 *      simMask        Converts the simulation level to 
 *                        a mask for SELL field use.
 *      testSub        Subroutine that will test the ECS 
 *
 *   09-JUL-97 Proto release
 *   19-AUG-97 Remove followDisSub routine
 *   24-SEP-97 Remove simNot* outputs and added simNone
 *             Added simMask routine
 *   01-OCT-97 Added debug level input to rebootSub
 *             Added testSub and initialiseSub
 *   09-OCT-97 Added checkBuffer
 *   10-OCT-97 Moved checkBuffer to ecCommands.c
 *   06-NOV-97 Moved checkBuffer over from ecCommands.c
 *   14-NOV-97 Added pvload stuff to initialiseSub
 *   19-JAN-98 Added error printf to initialiseSub
 *   20-JAN-98 cleanup includes and move to ecs.h
 *   22-JAN-98 Disabled initialiseSub pvload call
 *   12-FEB-98 New pvload version (enable initialiseSub pvload call)
 *   20-FEB-98 Changed init file for pvload to ecsInit.data
 *   23-FEB-98 Disabled initialiseSub pvload call
 *   04-MAR-98 Added testSub code to check health
 *   05-MAR-98 Added error message to testSub code
 *   08-APR-98 Renamed carOR to carCombine and changed function to match TCS
 *
 ********************************************************************/

#include "ecs.h"

#include <epicsExit.h>
#include <iocsh.h>



#include <ctype.h>
#include <float.h> 
#include <limits.h>
#include <string.h>
#include <epicsThread.h>
#include <epicsEvent.h>


#include <subRecord.h>
#include <genSubRecord.h>
#include <menuCarstates.h>

#include "ecInterlocks.h"
#include "ecMisc.h"

extern int pvload (char *file, char *macros, int flags) ;
int ecsPvload ();

static epicsThreadId	ecsInitTaskId = 0;
static epicsEventId 	ecsInitSemId = NULL;
static char		ecsInitFileName[100];
static char		ecsInitArgs[100];

/********************************************************************
 *+
 * Routine name:
 *	carCombine
 *
 * Function:
 *      This routine is called from a "genSub" and combines the status and 
 *      message values from up to five CAR records into an output CAR state 
 *      and message.
 *      Priority is BUSY then ERR and finally IDLE state.  If any CAR submits
 *      a BUSY state, the output is set to BUSY.  If no BUSY states are found, 
 *      the check is for ERR states in which case the message associated with
 *      the FIRST ERR encountered is output.  Therefore, if there are multiple
 *      CARs submitting ERR states only one message will be passed through
 *      and that will be the one nearest input A.
 *
 * Invocation:
 *      status = carCombine ();
 *
 * Parameters: (">" input, "!" modified, "<" output)  
 *	(>) pgsub  (struct genSubRecord *)    Pointer to gensub record structure
 *  INPUTS:
 *          pgsub->a:  The VAL  field from CAR 1.
 *          pgsub->b:  The OMSS field from CAR 1.
 *          pgsub->c:  The VAL  field from CAR 2.
 *          pgsub->d:  The OMSS field from CAR 2.
 *          pgsub->e:  The VAL  field from CAR 3.
 *          pgsub->f:  The OMSS field from CAR 3.
 *          pgsub->g:  The VAL  field from CAR 4.
 *          pgsub->h:  The OMSS field from CAR 4.
 *          pgsub->i:  The VAL  field from CAR 5.
 *          pgsub->j:  The OMSS field from CAR 5.
 *
 *  OUTPUTS:
 *          pgsub->vala: The resultant output CAR value.
 *          pgsub->valb: The resultant output CAR message.
 *
 * Function value:
 *	status  (long)    Always returns zero.
 * 
 *-
 */
long carCombine( struct genSubRecord *pgsub )
{
  long cVal1;
  long cVal2;
  long cVal3;
  long cVal4;
  long cVal5;
  long outVal;

  cVal1 = *((long *)(pgsub->a));
  cVal2 = *((long *)(pgsub->c));
  cVal3 = *((long *)(pgsub->e));
  cVal4 = *((long *)(pgsub->g));
  cVal5 = *((long *)(pgsub->i));

  outVal = menuCarstatesIDLE ;                       /* Default output value is IDLE */

                              /* check if any subsystems are in ERROR state */
  if ( cVal1 == menuCarstatesERROR || cVal2 == menuCarstatesERROR || cVal3 == menuCarstatesERROR 
         || cVal4 == menuCarstatesERROR || cVal5 == menuCarstatesERROR)
  {           /* if any subsystems are in ERR state copy first message over */
    if ( cVal1 == menuCarstatesERROR )
      strcpy( (char *)(pgsub->valb), (char *)(pgsub->b) );
    else if( cVal2 == menuCarstatesERROR )
      strcpy( (char *)(pgsub->valb), (char *)(pgsub->d) );
    else if( cVal3 == menuCarstatesERROR )
      strcpy( (char *)(pgsub->valb), (char *)(pgsub->f) );
    else if( cVal4 == menuCarstatesERROR )
      strcpy( (char *)(pgsub->valb), (char *)(pgsub->h) );
    else
      strcpy( (char *)(pgsub->valb), (char *)(pgsub->j) );

    outVal = menuCarstatesERROR;                          /* set output to ERR state */
  }

                           /* overwrite if any subsystems are in BUSY state */
  if ( cVal1 == menuCarstatesBUSY || cVal2 == menuCarstatesBUSY || cVal3 == menuCarstatesBUSY 
         || cVal4 == menuCarstatesBUSY || cVal5 == menuCarstatesBUSY)
    outVal = menuCarstatesBUSY;                          /* set output to BUSY state */


  *(long *)pgsub->vala = outVal ;                     /* Output the value */

  return 0;

}



/********************************************************************
 *+
 * Routine name:
 *	checkBuffer
 *
 * Function:
 *      Checks the contents of the character buffer passed to see if it
 *      holds an integer, double, real, string or is blank.
 *
 * Invocation:
 *      status = checkBuffer ();
 *
 * Parameters: (">" input, "!" modified, "<" output)  
 *	(>) null terminated string to check
 *      
 *
 * Function value:
 *	status  (long) 
 *                      ALL_BLANKS, if all white space
 *                      SHORT_INTEGER
 *                      LONG_INTEGER
 *                      FLOAT_VALUE
 *                      DOUBLE_VALUE
 *                      BAD_VALUE, if cannot be converted
 * 
 * Deficiencies:
 *      .
 *-
 */

long checkBuffer( char *buf )
{
  char   *startP;
  char   *endP;
  long   lval;
  double dval;

  startP = buf;

  while (isspace((int)*startP) )
    startP++;             /* startP refers to first non-whitespace character */
  if (*startP == '\0')
    return ALL_BLANKS;              /* Nothing in the buffer but whitespace  */
  else
  {
    lval = strtol(startP, &endP, STRTOL_BASE);

    if (lval > -LONG_MAX && lval < LONG_MAX && *endP == '\0')
    {
      if (lval >= -INT_MAX  && lval <= INT_MAX)
        return SHORT_INTEGER;                  /* buffer holds short integer */
      else
        return LONG_INTEGER;                    /* buffer holds long integer */
    }
    else
    {
      dval = strtod (startP, &endP);
      if (dval >= -DBL_MAX && dval <= DBL_MAX && *endP == '\0')
      {
        if (dval >= -FLT_MAX && dval <= FLT_MAX)
          return FLOAT_VALUE;            /* buffer holds floating-point real */
        else
          return DOUBLE_VALUE;                        /* buffer holds double */
      }
      else
        return BAD_VALUE;            /* buffer does not hold integer or real */
    }
  }
}

/********************************************************************
 *+
 * Routine name:
 *	ecsSystemInitializeTask
 *
 * Function:
 *      initialize ECS by running pvload
 *
 *
 * Parameters: (">" input, "!" modified, "<" output)  
 *
 * Function value:
 *	status  (long)    Always returns zero.
 * 
 * Deficiencies:
 *      
 *-
 */

void ecsSystemInitializeTask (void *p)
{
printf("in ecsSystemInitializeTask\n");
	while (TRUE) {
printf("before epicsEventMustWait\n");
      epicsEventMustWait(ecsInitSemId); 
printf("after epicsEventMustWait\n");
      errlogPrintf ("Initializing ECS (%s) (%s)\n",
        ecsInitFileName, ecsInitArgs);

	    ecsPvload ();
  }

  return;
}

/********************************************************************
 *+
 * Routine name:
 *	initInitialise
 *
 * Function:
 *      Spawn the initialization task
 *
 * Invocation:
 *      status = initInitialise ();
 *
 * Parameters: (">" input, "!" modified, "<" output)  
 *
 * Function value:
 *	status  (long)    Always returns zero.
 * 
 * Deficiencies:
 *      
 *-
 */

long initInitialise( struct subRecord *psub )
{

printf("In inintInitialise\n");



  /* create an initialization task for pvLoad .. lower than AB and ECS tasks */
  ecsInitTaskId = epicsThreadCreate (
			     "ecsInitTask",
			     epicsThreadPriorityLow,
           epicsThreadGetStackSize(epicsThreadStackMedium),
			     ecsSystemInitializeTask,
                             NULL);

  if (!ecsInitTaskId) printf ("can not spawn initialization task\n");
                        
  ecsInitSemId = epicsEventMustCreate(epicsEventEmpty); 

  if (!ecsInitSemId) printf ("can not create initialization task semaphore\n");

  return(0);

}

/********************************************************************
 *+
 * Routine name:
 *	initialiseSub
 *
 * Function:
 *      initialize ECS by running pvload
 *
 * Invocation:
 *      status = initialiseSub ();
 *
 * Parameters: (">" input, "!" modified, "<" output)  
 *	(>) psub  (struct subRecord *)    Subroutine record
 *      (>) psub->a     (long)  Debug Level, 0 to 2
 *
 * Function value:
 *	status  (long)    Always returns zero.
 * 
 * Deficiencies:
 *      
 *-
 */

long initialiseSub( struct subRecord *psub )
{
printf("initialiseSub: reloading initializing data\n");
  long debug = (long)psub->a;

  if (debug)
    printf("initialiseSub: reloading initializing data\n");

  if (ecsInitSemId)
    epicsEventSignal(ecsInitSemId);
  else
    errlogSevPrintf(errlogFatal,"FATAL ERROR: ecsInitSemId semaphore not yet created.");

  return(0);
}



/*
 *+
 * FUNCTION NAME:
 * initSetParameters
 *
 * INVOCATION:
 * initSetParameters (fname, args)
 *
 * PARAMETERS: (">" input, "!" modified, "<" output)
 * (>) fname (char *)	initializaton file name
 * (>) args (char *)	pvload arguments
 * 
 * FUNCTION VALUE:
 * (int)       always zero
 *
 * PURPOSE:
 * Set initialization file name and database pvload arguments
 *
 * DESCRIPTION:
 * This routine is used to initialize the initialization file name
 * and database pvload arguments from vxWorks.
 *
 * EPICS INPUT FIELDS:
 * None
 *
 * EPICS OUTPUT FIELDS:
 * None
 *
 * EXTERNAL VARIABLES:
 * ecsInitFileName
 * ecsInitArgs
 *
 * PRIOR REQUIREMENTS:
 * None
 *
 * DEFICIENCIES:
 * None
 *-
 */
int initSetParameters (char *fname, char *args)
{
	strncpy (ecsInitArgs, args, 99);
	ecsInitArgs[99] = '\0';

	strncpy (ecsInitFileName, fname, 99);
	ecsInitFileName[99] = '\0';

	return (0);
}

/********************************************************************
 *+
 * Routine name:
 *	maskSub
 *
 * Function:
 *      ??
 *
 * Invocation:
 *      status = maskSub ();
 *
 * Parameters: (">" input, "!" modified, "<" output)  
 *	(>) psub  (struct subRecord *)    Subroutine record
 *      (>) psub->a    ??
 *      (<) psub->val  ??
 *
 * Function value:
 *	status  (long)    Always returns zero.
 * 
 * Deficiencies:
 *      Where is this used?
 *-
 */

long maskSub( struct subRecord *psub )
{
  if( psub->a == 0 )
    psub->val = 19;
  if( psub->a == 1 )
    psub->val = 21;
  if( psub->a == 2 )
    psub->val = 25;

  return(0);
}



/********************************************************************
 *+
 * Routine name:
 *	nullSub
 *
 * Function:
 *	Does absolutely nothing
 *	when you call it.  This routine is used as the initialisation 
 *	subroutine for any subroutine or mosub records where nothing 
 *	needs to be done then.
 *
 * Invocation:
 *	status = nullSub ();
 *
 * Parameters:   
 *	None.
 *
 * Function value:
 *	status  (long)    Always returns zero.
 *
 * Deficiencies: 
 *	Actually when called from a subroutine or mosub record there 
 *	is a pointer passed into the routine, but this is not used. 
 *	In some CPU types not using the input parameters might be a 
 *	violation of the calling convention, but in the 68k family 
 *	under vxWorks we can do this.  To do this "by the book" would 
 *	need a nullMosub defined as well.
 *
 *-
 */

long nullSub(void) {
    return 0;
}



/********************************************************************
 *+
 * Routine name:
 *	rebootSub
 *
 * Function:
 *      Issues the vxworks reboot command.
 *
 * Invocation:
 *      status = rebootSub ();
 *
 * Parameters: (">" input, "!" modified, "<" output)  
 *	(>) psub  (struct subRecord *)    Subroutine record
 *      (>) psub->a     (long)  Debug Level, 0 to 2
 *
 * Function value:
 *	status  (long)    Always returns zero.
 * 
 *-
 */

long rebootSub( struct subRecord *psub )
{
  errlogPrintf("Rebooting not ported, no longer supported, use iocStats!");
  return(0);
} 


#if 0
/********************************************************************
 *+
 * Routine name:
 *	simDemux
 *
 * Function:
 *	Demultiplex the Simulation mode
 *	to produce six logical values, one for each valid simulation 
 *	mode, plus their inversions.  These values can be read by any 
 *	ECS subsystem which needs to set .SIML fields on any records.
 *
 * Invocation:
 *	status = simDemux (psub);
 *
 * Parameters: (">" input, "!" modified, "<" output)  
 *	(>) psub  (struct mosubRecord *)    Multi-output subroutine record
 *	(>) psub->a     (double)  Simulation mode value, 0 to 3
 *	(<) psub->vala  (double)  simNone logical value
 *	(<) psub->valb  (double)  simVSM logical value
 *	(<) psub->valc  (double)  simFast logical value
 *	(<) psub->vald  (double)  simFull logical value
 *
 * Function value:
 *	status  (long)    Always returns zero.
 * 
 *-
 */
 
long simDemux(struct mosubRecord *psub) {
    switch ((int) psub->a) {
    	case SIMM_VSM:
    	    psub->vala = 0.0;
    	    psub->valb = 1.0;
    	    psub->valc = 0.0;
    	    psub->vald = 0.0;
    	    break;
    	    
    	case SIMM_FAST:
    	    psub->vala = 0.0;
    	    psub->valb = 0.0;
    	    psub->valc = 1.0;
    	    psub->vald = 0.0;
    	    break;
    	    
    	case SIMM_FULL:
    	    psub->vala = 0.0;
    	    psub->valb = 0.0;
    	    psub->valc = 0.0;
    	    psub->vald = 1.0;
    	    break;
    	    
    	default:
    	case SIMM_NONE:
    	    psub->vala = 1.0;
    	    psub->valb = 0.0;
    	    psub->valc = 0.0;
    	    psub->vald = 0.0;
    }
        
    return 0;
}
#endif



/********************************************************************
 *+
 * Routine name:
 *	simMask
 *
 * Function:
 *      Converts the simulation level to a mask for SELL field use.
 *      All it really does is convert the four simulation values to
 *      one to four.  This allows specific links to be processed based
 *      on this value.  It cannot use the value zero.
 *
 *      When used with the fanout record and the select mechanism (SELM)
 *      set to 'Specified',  the value specified by SELN determines which
 *      link to process.  If SELN=1, then LNK1 is processed.  If SELN=2,
 *      then LNK2 is processed, etc.
 *
 *      SELN reads its value from SELL, which in this case will be a 
 *      database link.
 *      
 *
 * Invocation:
 *      status = simMask ();
 *
 * Parameters: (">" input, "!" modified, "<" output)  
 *	(>) psub  (struct subRecord *)    Subroutine record
 *	(>) psub->a     (long)  Simulation mode value, 0 to 3
 *      (>) psub->b     (long)  Debug Level, 0 to 2
 *	(<) psub->val   (long)  Mask (see table below)
 *
 *				        Links
 *		  Simulation Level   1  2  3  4
 *                -----------------------------
 *			    NONE     0  0  0  1  = 1
 *			    VSM      1  0  0  0  = 2
 *			    FAST     0  1  0  0  = 3
 *			    FULL     0  0  1  0  = 4
 *
 * Function value:
 *	status  (long)    Always returns zero.
 * 
 *-
 */

long simMask( struct subRecord *psub )
{
  long simmLevel;
  long debug;

  simmLevel = (long)psub->a;
  debug     = (long)psub->b;
  switch( simmLevel )
  {
    case SIMM_NONE:
      psub->val = 1;
      break; 

    case SIMM_VSM:
      psub->val = 2;
      break; 

    case SIMM_FAST:
      psub->val = 3;
      break; 

    case SIMM_FULL:
      psub->val = 4;
      break; 

    default:
      if (debug)
        printf("simMask: Unknown simulation level %d - Assuming NONE\n", (int) simmLevel);
      psub->val = 1;
      break;
  }
  if( debug )
    printf("simMask: Simulation Mode %d, setting mask for Link number %d\n", 
            (int) simmLevel, (int)psub->val );

  return(0);
}



/********************************************************************
 *+
 * Routine name:
 *	testSub
 *
 * Function:
 *      Checks the health record and updates the testC CAR.
 *      The record is first set BUSY, then if the health is
 *      GOOD it sends an IDLE.  If not it sends an ERR.
 *
 * Invocation:
 *      status = testSub ();
 *
 * Parameters: (">" input, "!" modified, "<" output)  
 *	(>) pgsub  (struct genSubRecord *)    Pointer to gensub record structure
 *      (>) pgsub->a     (long)  current Debug Level
 *      (>) pgsub->b     (long)  current ECS health
 *      (<) pgsub->vala  (string)  test error message
 *      (<) pgsub->valb  (long)  test CAR value
 *
 * Function value:
 *	(<) status       (long)  return status, 0 = OK
 * 
 * Deficiencies:
 *     
 *-
 */

long testSub( struct genSubRecord *pgsub )
{
  long debug;
  long health;
  char errMess[40] = "ECS health is not good";

  *(long *)pgsub->vala = menuCarstatesBUSY;               /* set CAR to BUSY      */

  debug  = *(long *)pgsub->a;                    /* read debug level     */
  health = *(long *)pgsub->b;                    /* read current health  */

  if (health != GOOD_HEALTH)
  {                                              /* test has failed      */
    if (debug)
    {
      printf("testSub: health is not GOOD!\n");
    }
    strcpy (pgsub->vala, errMess);               /* error message to CAR */
    *(long *)pgsub->valb = menuCarstatesERROR;            /* set CAR to ERR       */
    return 1;
  }
  else
  {                                              /* test has passed      */
    if (debug)
    {
      printf("testSub: health is GOOD!\n");
    }
    *(long *)pgsub->valb = menuCarstatesIDLE;             /* set CAR to IDLE      */
    return 0;
  } 
}

long deicePlcInput (struct genSubRecord *pgsub)
{
    long	keys;
    long	power_ack;

    keys =      (*((long *) pgsub->a)) & 0xE;
    power_ack = ((*((long *) pgsub->a)) & 0x10) >> 4; 

    *(long *) pgsub->vala = keys;
    sprintf (pgsub->valb, "%ld", keys);
    *(long *) pgsub->valc = power_ack;

    return 0L;
}

int ecsPvload ()
{
  int pstat = pvload (ecsInitFileName, ecsInitArgs, 0) ;
  if (pstat)
    errlogSevPrintf (errlogFatal, "*** pvload failed with status %d  probably"\
            " wrong syntax ***\n Halting process to avoid unnoticed errors.",
            pstat);
  assert(pstat==OK);

  return pstat ;
}

void testTim() //TODO: This shoud get removed in a final version
{
  errlogSevPrintf(errlogInfo, "Hello test function - testing pvload \n");
  
  ecsPvload();

  errlogSevPrintf(errlogInfo, "Test END\n");
}

epicsRegisterFunction(carCombine);
epicsRegisterFunction(deicePlcInput);
epicsRegisterFunction(initInitialise);
epicsRegisterFunction(initialiseSub);
epicsRegisterFunction(rebootSub);
epicsRegisterFunction(nullSub);
epicsRegisterFunction(simMask);
epicsRegisterFunction(testSub);

static const iocshArg initSetParametersArg0 = {"File name", iocshArgString };
static const iocshArg initSetParametersArg1 = {"Macros", iocshArgString };

static const iocshArg *initSetParametersArgs[] = { &initSetParametersArg0,
						   &initSetParametersArg1 };

static const iocshFuncDef initSetParametersFuncDef =
         {"initSetParameters", 2, initSetParametersArgs};
static void initSetParametersCallFunc(const iocshArgBuf *args)
{
   initSetParameters(args[0].sval, args[1].sval);
}

static const iocshFuncDef ecsPvloadFuncDef = {"ecsPvload", 0, NULL};   
static void ecsPvloadCallFunc(const iocshArgBuf *args)
{
   ecsPvload();
}

static const iocshFuncDef testTimFuncDef = {"testTim", 0, NULL};
static void testTimCallFunc(const iocshArgBuf *args)
{
  testTim();
}

static void registerMiscCommands(void)
{
      iocshRegister(&initSetParametersFuncDef, initSetParametersCallFunc);
      iocshRegister(&ecsPvloadFuncDef, ecsPvloadCallFunc);
      iocshRegister(&testTimFuncDef, testTimCallFunc);
}
epicsExportRegistrar(registerMiscCommands);


