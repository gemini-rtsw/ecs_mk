/*
 *  File Name:
 *   ecCommands.c
 *
 *  Description:
 *   ECS Command Subroutines for CADs
 *
 *  FUNCTION NAME(S)
 *   datumCAD        Dummy holder for unnecessary encoder datum routine
 *   debugCAD        Change the system debug level
 *   initCAD         Initialise to startup values
 *   logCAD          Enable command/response logging
 *   moveDomeCad     Move the dome
 *   moveShtrsCad    Move the shutters
 *   moveVgatesCad   Move the vent gates
 *   parkCAD         Park the dome, shutters & vent gates at default positions
 *   parkDomeCad     Park the dome
 *   parkShtrsCad    Park the shutters
 *   parkVgatesCad   Park the vent gates
 *   rebootCAD       Reboot the IOC
 *   simulateCAD     Change the simulation level
 *   stopDomeCad     Stop the dome
 *   stopShtrsCad    Stop the shutters
 *   stopVgatesCad   Stop the vent gates
 *   testCAD         Test system health
 *   toleranceCAD    Change the in position tolerance for dome, Shutters, etc.
 *
 *   23-MAR-98 Initial release, combining individual files
 *   24-MAR-98 thermalCAD, check for global interlocks
 *   26-MAR-98 all move, stop & park CADs, check for global interlocks
 *   01-APR-98 parkCAD check park limits
 *   07-APR-98 moveShtrsCad recover old values if blank
 *   14-APR-98 thermalCAD, add SHUTDOWN state
 *   13-MAY-98 parkCAD and parkShtrsCad add overlap value
 *   
 *             
 *
 *INDENT-OFF*
 * $Log: ecCommands.c,v $
 * Revision 1.7  2015/01/22 03:25:27  gemvx
 * REL-2021 Move Plant Room channels to new db, remove thermal subroutine
 *
 * Revision 1.6  2012/06/15 20:21:08  gemvx
 * Make it impossible to enter a correct password.
 *
 * Revision 1.5  2012/06/08 23:40:52  gemvx
 * Change deice password.
 *
 * Revision 1.4  2008/03/06 21:39:32  gemvx
 * added Dome Deicing Mode
 *
 * Revision 1.3  2002/06/21 15:48:56  pedro
 * Port to EPICS 3.13.4.
 *
 * Revision 1.2  2001/06/21 16:31:25  pedro
 * Removed debug printErr() statements.
 *
 * Revision 1.3  1999/04/29 22:03:24  pedro
 * Added reference to dome and shutter offsets
 *
 * Revision 1.2  1998/07/13 21:13:34  Gemini
 * cjm: Check for strings NONE, MIN or FULL in CAD debug inputs
 *
 * Revision 1.1.1.1  1998/06/30 03:43:22  ajf
 * Initial creation of the Gemini ECS Repository
 *
 *INDENT-ON*
 */


#include "ecs.h"

#include <dbEvent.h>
#include <dbScan.h>

#include <cadRecord.h>
#include <cad.h>
#include <menuCarstates.h>

#include "ecInterlocks.h"
#include "ecMisc.h"

/* Deice dome input links
 */
#define DEICE_MODE	(pcad->a)	/* command mode */
#define DEICE_LOGIN	(pcad->b)	/* login status at PLC side */
#define DEICE_PCU2	(pcad->c)	/* PCU2 on status at PLC side */
#define DEICE_POWER	(pcad->d)	/* power on status at PLC side */
#define DEICE_CW	(pcad->e)	/* move cw status at PLC side */
#define DEICE_CCW	(pcad->f)	/* move ccw status at PLC side */
#define DEICE_KEY	(pcad->g)	/* PCU2 key position (bitmap) */
#define DEICE_PASSWORD	(pcad->h)	/* login password */
#define DEICE_DEBUG	(pcad->t)	/* debug level */

/* Deice dome output links
 */
#define DEICE_OUT1	(*(long *) pcad->vala)
#define DEICE_OUT2	(*(long *) pcad->valb)

/* Handy macros for deice code
 */
#define DEICE_MODE_ON	    (strcmp (DEICE_MODE,  "ON")   == 0)
#define DEICE_MODE_OFF	    (strcmp (DEICE_MODE,  "OFF")  == 0)
#define DEICE_MODE_LOGIN    (strcmp (DEICE_MODE,  "ON")   == 0)
#define DEICE_MODE_LOGOUT   (strcmp (DEICE_MODE,  "OFF")  == 0)
#define DEICE_MODE_CW	    (strcmp (DEICE_MODE,  "CW")   == 0)
#define DEICE_MODE_CCW	    (strcmp (DEICE_MODE,  "CCW")  == 0)
#define DEICE_MODE_STOP     (strcmp (DEICE_MODE,  "STOP") == 0)
#define DEICE_LOGIN_ON	    (strcmp (DEICE_LOGIN, "ON")   == 0)
#define DEICE_LOGIN_OFF	    (strcmp (DEICE_LOGIN, "OFF")  == 0)
#define DEICE_PCU2_ON	    (strcmp (DEICE_PCU2,  "ON")   == 0)
#define DEICE_PCU2_OFF	    (strcmp (DEICE_PCU2,  "OFF")  == 0)
#define DEICE_POWER_ON	    (strcmp (DEICE_POWER, "ON")   == 0)
#define DEICE_POWER_OFF	    (strcmp (DEICE_POWER, "OFF")  == 0)
#define DEICE_KEY_ON	    (strcmp (DEICE_KEY,   "0")    != 0)
#define DEICE_KEY_OFF	    (strcmp (DEICE_KEY,   "0")    == 0)
#define DEICE_MOVING	    (strcmp (DEICE_CW, "ON") == 0 || strcmp (DEICE_CCW, "ON") == 0)

static void deiceDumpArgs (struct cadRecord *);

/* *INDENT-OFF* */
/*+
 *   Function name:
 *   datumCAD
 *
 *   Purpose:
 *   Run datum in ECS
 *
 *   Description:
 *   This routine is tied to the datum CAD record. It is included
 *   only for conformity to ICD 7b.  The ECS mechanisms all use  
 *   absolute encoders. 
 *
 *   Invocation:
 *   datumCAD (pcad)
 *
 *   Parameters: (">" input, "!" modified, "<" output)  
 *      (!)   pcad   (struct cadRecord*)  Pointer to cad record structure
 *
 *   EPICS Input fields :
 *
 *   a => Current ECS debug level 
 *
 *   EPICS Output fields :
 *
 *   n/a
 *
 *   Function value:
 *   (<)  status  (long) Return status, 0 = OK (command accepted)
 * 
 *   External functions:
 *
 *
 *-
 */
/* *INDENT-ON* */



long datumCAD( struct cadRecord *pcad )
{
  long ret;
  long debug;
  long interlockType;
  char interlockMess[40];

  debug = atoi(pcad->a);

      /* Check for interlocks */
  if (pcad->dir != menuDirectiveCLEAR)
  {
    interlockType = ecsInterlocked (interlockMess);
      if (interlockType == INTRLK_NORUN)
      {
        strcpy (pcad->mess, interlockMess);
        return CAD_REJECT ;
      }
  }

  switch( pcad->dir )
  {
    case menuDirectiveMARK:
      ret = CAD_ACCEPT;
      break;

    case menuDirectiveCLEAR:
      ret = CAD_ACCEPT;
      break;

    case menuDirectivePRESET:
      ret = CAD_ACCEPT;
      break;

    case menuDirectiveSTART:
      if (debug)
        errlogSevPrintf(errlogInfo, "datumCAD: ACCEPTED\n");
      ret = CAD_ACCEPT;
      break;

    case menuDirectiveSTOP:
      ret = CAD_ACCEPT;
      break;

    default:
      if (debug)
        errlogSevPrintf(errlogInfo, "datumCAD: invalid CAD directive\n");
      ret = CAD_REJECT;
      break;
  }
  return ret;
}


/* *INDENT-OFF* */
/*+
 *   Function name:
 *   debugCAD
 *
 *   Purpose:
 *   Set debug level in ECS
 *
 *   Description:
 *   This routine is tied to the debug CAD record. It checks the
 *   debug level argument specified and if it is valid, presents 
 *   it as an output value. 
 *
 *   Invocation:
 *   debugCAD (pcad)
 *
 *   Parameters: (">" input, "!" modified, "<" output)  
 *      (!)   pcad   (struct cadRecord*)  Pointer to cad record structure
 *
 *   EPICS Input fields :
 *
 *   a => Requested ECS debug level
 *   b => Current ECS debug level
 *
 *   EPICS Output fields :
 *
 *   vala => validated ECS debug level
 *
 *   Function value:
 *   (<)  status  (long) Return status, 0 = OK (command accepted)
 * 
 *   External functions:
 *
 *
 *-
 */
/* *INDENT-ON* */


long debugCAD( struct cadRecord *pcad )
{
  long ret;          /* CAD return status               */
  long dmdState;     /* requested debug level input     */
  long debug;        /* current debug level             */
  long interlockType;
  char interlockMess[40];
  int  index , matched ;
  static char *debugOpts[]= {"NONE", "MIN", "FULL", NULL} ;

  debug = atoi(pcad->b);                /* read current debug level argument */

      /* Check for interlocks */
  if (pcad->dir != menuDirectiveCLEAR)
  {
    interlockType = ecsInterlocked (interlockMess);
      if (interlockType == INTRLK_NORUN)
      {
        strcpy (pcad->mess, interlockMess);
        return CAD_REJECT ;
      }
  }

  switch( pcad->dir )                                  /* read CAD directive */
  {
    case menuDirectiveMARK:
      ret = CAD_ACCEPT;
      break;

    case menuDirectiveCLEAR:
      strcpy(pcad->a, " ");
      db_post_events( pcad, &pcad->a, 1 );        /* clear debug level input */
      ret = CAD_ACCEPT;
      break;

    case menuDirectivePRESET:

      matched = 0;
      for ( index = 0 ; index < 3; index++) {
        if (!strcmp (pcad->a, debugOpts[index])) {
           matched = 1 ;
           dmdState = (long)index ;
           break ;
        }
      }
            
      if (!matched) {
        sprintf(pcad->mess, "Argument must be NONE, MIN or FULL");
        ret = CAD_REJECT;
      }
      else
      {                                /* argument is valid, write to output */
        *(long *)pcad->vala = dmdState;
        if (debug)
          errlogSevPrintf(errlogInfo, "debugCAD: ACCEPTED debuglevel = %d\n", (int) dmdState );
        ret = CAD_ACCEPT;
      }
      break;

    case menuDirectiveSTART:
      ret = CAD_ACCEPT;
      break;

    case menuDirectiveSTOP:
      ret = CAD_ACCEPT;
      break;

    default:
      if (debug)
        errlogSevPrintf(errlogInfo, "debugCAD: invalid CAD directive\n");
      ret = CAD_REJECT;
      break;
  }
  return ret;
}


/* *INDENT-OFF* */
/*+
 *   Function name:
 *   initCAD
 *
 *   Purpose:
 *   Initialise the ECS IOC and database.
 *
 *   Description:
 *   This routine is tied to the init CAD record. There are no arguments.
 *    
 *    
 *
 *   Invocation:
 *   initCAD (pcad)
 *
 *   Parameters: (">" input, "!" modified, "<" output)  
 *      (!)   pcad   (struct cadRecord*)  Pointer to cad record structure
 *
 *   EPICS Input fields :
 *
 *   a => Current ECS debug level 
 *
 *   EPICS Output fields :
 *
 *   n/a
 *
 *   Function value:
 *   (<)  status  (long) Return status, 0 = OK (command accepted)
 * 
 *   External functions:
 *
 *
 *-
 */
/* *INDENT-ON* */

long initCAD( struct cadRecord *pcad )
{
  long ret;
  long debug;
  long interlockType;
  char interlockMess[40];


printf("In initCad\n");


  debug = atoi(pcad->a);

      /* Check for interlocks */
  if (pcad->dir != menuDirectiveCLEAR)
  {
    interlockType = ecsInterlocked (interlockMess);
      if (interlockType == INTRLK_NORUN)
      {
        strcpy (pcad->mess, interlockMess);
        return CAD_REJECT ;
      }
  }

  switch( pcad->dir )
  {
    case menuDirectiveMARK:
      ret = CAD_ACCEPT;
      break;

    case menuDirectiveCLEAR:
      ret = CAD_ACCEPT;
      break;

    case menuDirectivePRESET:
      ret = CAD_ACCEPT;
      break;

    case menuDirectiveSTART:
      if( debug )
        errlogSevPrintf(errlogInfo, "initCAD: Accepted\n");
      ret = CAD_ACCEPT;
      break;

    case menuDirectiveSTOP:
      ret = CAD_ACCEPT;
      break;

    default:
      if (debug)
        errlogSevPrintf(errlogInfo, "initCAD: invalid CAD directive\n");
      ret = CAD_REJECT;
      break;
  }
  return ret;
}


/* *INDENT-OFF* */
/*+
 *   Function name:
 *   logCAD
 *
 *   Purpose:
 *   Turns the data logging in the ECS ON or OFF.
 *
 *   Description:
 *   This routine is tied to the log CAD record. It  checks the
 *   argument specified and if it is valid, presents it as an output
 *   value. 
 *
 *   Invocation:
 *   logCAD (pcad)
 *
 *   Parameters: (">" input, "!" modified, "<" output)  
 *      (!)   pcad   (struct cadRecord*)  Pointer to cad record structure
 *
 *   EPICS Input fields :
 *
 *   a => ECS logging request
 *   b => Current debug level
 *
 *   EPICS Output fields :
 *
 *   vala => ECS logging request
 *
 *   Function value:
 *   (<)  status  (long) Return status, 0 = OK (command accepted)
 * 
 *   External functions:
 *
 *
 *-
 */
/* *INDENT-ON* */

long logCAD( struct cadRecord *pcad )
{
  long ret;          /* CAD return status               */
  long dataType;     /* returned value from checkBuffer */
  long dmdState;     /* requested log mode input        */
  long debug;        /* current debug level             */
  long interlockType;
  char interlockMess[40];

  debug = atoi(pcad->b);                /* read current debug level argument */

      /* Check for interlocks */
  if (pcad->dir != menuDirectiveCLEAR)
  {
    interlockType = ecsInterlocked (interlockMess);
      if (interlockType == INTRLK_NORUN)
      {
        strcpy (pcad->mess, interlockMess);
        return CAD_REJECT ;
      }
  }

  switch( pcad->dir )                                  /* read CAD directive */
  {
    case menuDirectiveMARK:
      ret = CAD_ACCEPT;
      break;

    case menuDirectiveCLEAR:
      strcpy(pcad->a, " ");
      db_post_events( pcad, &pcad->a, 1 );           /* clear log mode input */
      ret = CAD_ACCEPT;
      break;

    case menuDirectivePRESET:
      dmdState = atoi(pcad->a);                    /* read log mode argument */
      dataType = checkBuffer (pcad->a);
      if (dataType != SHORT_INTEGER)
      {                                           /* argument is not integer */
        if (debug)
          errlogSevPrintf(errlogInfo, "logCAD: invalid data type from checkBuffer (%d)\n",
                                   (int) dataType);
        sprintf(pcad->mess,"Mode data type invalid: %d", (int) dataType);
        ret = CAD_REJECT;
      }
      else if (dmdState < OFF || dmdState > ON)
      {                                         /* argument is out of limits */
        sprintf(pcad->mess, "Argument must be OFF or ON");
        ret = CAD_REJECT;
      }
      else
      {                                /* argument is valid, write to output */
        *(long *)pcad->vala = dmdState;
        if (debug)
          errlogSevPrintf(errlogInfo, "logCAD: ACCEPTED logging mode = %d\n", (int) dmdState );
        ret = CAD_ACCEPT;
      }
      break;

    case menuDirectiveSTART:
      ret = CAD_ACCEPT;
      break;

    case menuDirectiveSTOP:
      ret = CAD_ACCEPT;
      break;

    default:
      if (debug)
        errlogSevPrintf(errlogInfo, "logCAD: invalid CAD directive\n");
      ret = CAD_REJECT;
      break;
  }
  return ret;
}


/* *INDENT-OFF* */
/*+
 *   Function name:
 *   moveDomeCad
 *
 *   Purpose:
 *   Implement the moveDome CAD for controlling motion of the dome in the ECS.
 *
 *   Description:
 *   This routine is tied to the moveDome CAD record. It checks the
 *   azimuth argument specified and if it is valid, presents it 
 *   as an output value. 
 *
 *   Invocation:
 *   moveDomeCad (pcad)
 *
 *   Parameters: (">" input, "!" modified, "<" output)  
 *      (!)   pcad   (struct cadRecord*)  Pointer to cad record structure
 *
 *   EPICS Input fields :
 *
 *   a => Current debug level
 *   b => azimuth demand
 *   c => maximum limit
 *   d => minimum limit
 *   e => azimuth offset
 *
 *   EPICS Output fields :
 *
 *   vala => move dome demand state
 *   valb => validated azimuth demand
 *
 *   Function value:
 *   (<)  status  (long) Return status, 0 = OK (command accepted)
 * 
 *   External functions:
 *
 *   Deficiencies:
 *   - debug only uses two levels (debugging off for NONE and
 *     on for MIN or FULL
 *
 *-
 */
/* *INDENT-ON* */

long moveDomeCad( struct cadRecord *pcad )
{
  long   ret;           /* CAD return status                */
  long   dataType;      /* passed parameter for checkBuffer */
  double dmdPos;        /* demand position                  */
  double dmdOff;        /* dome position offset             */
  double domeMax;       /* max position limit               */
  double domeMin;       /* min position limit               */

  long   debug;         /* debug level                      */
  long interlockType;
  char interlockMess[40];

        
  debug   = atoi(pcad->a);             /* read current debug level argument */

      /* Check for interlocks */
  if (pcad->dir != menuDirectiveCLEAR)
  {
    interlockType = ecsInterlocked (interlockMess);
    if (interlockType == INTRLK_MOTION || 
            interlockType == INTRLK_GLOBAL ||
                  interlockType == INTRLK_NORUN)
    {
      strcpy (pcad->mess, interlockMess);
      return CAD_REJECT ;
    }
  }
  switch( pcad->dir )                                 /* read CAD directive */
  {
    case menuDirectiveMARK:
      ret = CAD_ACCEPT;
      break;

    case menuDirectiveCLEAR:
      ret = CAD_ACCEPT;
      break;

    case menuDirectivePRESET:
      domeMax = strtod (pcad->c, NULL);     /* read maximum limit argument  */
      domeMin = strtod (pcad->d, NULL);     /* read minimum limit argument  */
      dmdPos  = strtod (pcad->b, NULL);     /* read dome position argument  */
      dmdOff  = strtod (pcad->e, NULL);     /* read azimuth offset argument */

      dmdPos -= dmdOff;
      if (dmdPos < 0)
	dmdPos += 360;

      dataType = checkBuffer (pcad->b);     /* check for valid data         */
      if (dataType == ALL_BLANKS || dataType == BAD_VALUE)
      {                                                /* data type invalid */
        if (debug)
          errlogSevPrintf(errlogInfo, "moveDomeCad: invalid data type from checkBuffer (%d)\n",
                              (int) dataType);
        sprintf(pcad->mess,"azimuth data type invalid: %d", (int) dataType);
        ret = CAD_REJECT;
      }
      else if( dmdPos < domeMin || dmdPos > domeMax )
      {                                           /* argument out of limits */
        if (debug)
          errlogSevPrintf(errlogInfo, "moveDomeCad: Position argument out of limits\n");
        sprintf(pcad->mess, "Az. out of range: %3.1f - %3.1f",domeMin, domeMax);
        ret = CAD_REJECT;
      }
      else             
      {                                            /* valid position demand */
        ret = CAD_ACCEPT;
	if (*(long *)pcad->vala == MOVE)
	{
		*(long *)pcad->vala = STOP;     /* if dome is already moving, we need to stop it so it can process the new demand */
		errlogSevPrintf(errlogInfo, "moveDome: dome still moving, applying stop before next move\n");
        }
	*(long *)pcad->vala = MOVE;       /* Write MOVE demand state out */
        *(double *)pcad->valb = dmdPos;     /* Write current demand pos out */
        if (debug)
          errlogSevPrintf(errlogInfo, "moveDomeCad: ACCEPTED azimuth position = %f\n", dmdPos );
      }
      break;

    case menuDirectiveSTART:
      if (debug)
        errlogSevPrintf(errlogInfo, "moveDomeCad: ACCEPTED moveDome command\n");
      ret = CAD_ACCEPT;
      break;

    case menuDirectiveSTOP:
      ret = CAD_ACCEPT;
      break;

    default:
      if (debug)
        errlogSevPrintf(errlogInfo, "moveDomeCad: invalid CAD directive\n");
      sprintf(pcad->mess, "invalid CAD directive");
      ret = CAD_REJECT;
      break;
  }

  return ret;
}


/* *INDENT-OFF* */
/*+
 *   Function name:
 *   moveShtrsCad
 *
 *   Purpose:
 *   Implement the moveShtrs CAD for controlling motion of the shutters.
 *
 *   Description:
 *   This routine is tied to the moveShtrs CAD record. It checks the
 *   position arguments specified and if valid, presents them as output
 *   values. A single value is accepted, but with two blank arguments the
 *   command is rejected
 *
 *   Invocation:
 *   moveShtrsCad (pcad)
 *
 *   Parameters: (">" input, "!" modified, "<" output)  
 *      (!)   pcad   (struct cadRecord*)  Pointer to cad record structure
 *
 *   EPICS Input fields :
 *
 *   a => Current debug level
 *   b => ts demand
 *   c => bs demand
 *   d => ts maximum limit
 *   e => ts minimum limit
 *   f => bs maximum limit
 *   g => bs minimum limit
 *
 *   EPICS Output fields :
 *
 *   vala => move top shutter demand state
 *   valb => validated top shutter elevation demand
 *   valc => move bottom shutter demand state
 *   vald => validated bottom elevation demand
 *   vale => fanout select to limit processing downstream:
 *                0 none
 *                1 to allow tsh flnk only 
 *                2 to allow bsh flnk only
 *                3 to allow both

 *
 *   Function value:
 *   (<)  status  (long) Return status, 0 = OK (command accepted)
 * 
 *   External functions:
 *
 *   Deficiencies:
 *   - debug only uses two levels (debugging off for NONE and
 *     on for MIN or FULL)
 *   
 *-
 */
/* *INDENT-ON* */

static int moveShtrsPending = 0;

long moveShtrsCad( struct cadRecord *pcad )
{
  long   ret;                        /* CAD return status                   */
  long   tsType;                     /* top shutter data type               */
  long   bsType;                     /* bottom shutter data type            */
  double tsDmdPos;                   /* top shutter demand position         */
  double bsDmdPos;                   /* bottom shutter demand position      */
  double tsMax;                      /* max top shutter position limit      */
  double tsMin;                      /* min top shutter position limit      */
  double bsMax;                      /* max bottom shutter position limit   */
  double bsMin;                      /* min bottom shutter position limit   */
  double tsOff;			     /* top shutter offset                  */
  double bsOff;			     /* top shutter offset                  */
  long   fanSel = 0;                 /* flnk fanout select                  */
  long   debug;                      /* debug level                         */
  long interlockType;
  char interlockMess[40];
        
  debug   = atoi(pcad->a);             /* read current debug level argument */

  printf("DEBUG: moveShtrsCad: Entering function, directive = %d\n", pcad->dir);

  /* Check for interlocks */
  if (pcad->dir != menuDirectiveCLEAR)
  {
    printf("DEBUG: moveShtrsCad: Checking interlocks\n");
    interlockType = ecsInterlocked (interlockMess);
    if (interlockType == INTRLK_MOTION || 
           interlockType == INTRLK_GLOBAL ||
                  interlockType == INTRLK_NORUN)
    {
      printf("DEBUG: moveShtrsCad: INTERLOCK REJECT - type %ld\n", interlockType);
      if (moveShtrsPending)
      {
        printf("DEBUG: moveShtrsCad: Clearing pending move due to interlock\n");
        moveShtrsPending = 0;
      }
      strcpy (pcad->mess, interlockMess);
      return CAD_REJECT ;
    }
    printf("DEBUG: moveShtrsCad: No interlocks blocking\n");
  }

  switch( pcad->dir )                                 /* read CAD directive */
  {
    case menuDirectiveMARK:
      printf("DEBUG: moveShtrsCad: MARK directive\n");
      ret = CAD_ACCEPT;
      break;

    case menuDirectiveCLEAR:
      printf("DEBUG: moveShtrsCad: CLEAR directive\n");
      ret = CAD_ACCEPT;
      break;

    case menuDirectivePRESET:
      printf("DEBUG: moveShtrsCad: PRESET directive - starting validation\n");
      tsDmdPos = strtod(pcad->b, NULL);  /*     read tsh position argument  */
      bsDmdPos = strtod(pcad->c, NULL);  /*     read bsh position argument  */
      tsMax = strtod( pcad->d, NULL);   /* read maximum tsh limit argument  */
      tsMin = strtod( pcad->e, NULL);   /* read minimum tsh limit argument  */
      bsMax = strtod( pcad->f, NULL);   /* read maximum bsh limit argument  */
      bsMin = strtod( pcad->g, NULL);   /* read minimum bsh limit argument  */
      tsOff   = strtod (pcad->i, NULL); /* read tsh offset */
      bsOff   = strtod (pcad->j, NULL); /* read bsh offset */

errlogSevPrintf (errlogInfo, "moveShtrs: b=(%s), c=(%s), tsDmdPos=%g, bsDmdPos=%g\n", pcad->b, pcad->c, tsDmdPos, bsDmdPos);

      tsType = checkBuffer (pcad->b);         /* check for valid tsh data   */
      bsType = checkBuffer (pcad->c);         /* check for valid bsh data   */
errlogSevPrintf (errlogInfo, "moveShtrs: tsType=%ld, bsType=%ld\n", tsType, bsType);

      printf("DEBUG: moveShtrsCad: Input validation - tsType=%ld, bsType=%ld\n", tsType, bsType);

      if (tsType == BAD_VALUE)
      {                                           /* tsh data type invalid  */
        printf("DEBUG: moveShtrsCad: PATH - TSH BAD_VALUE rejection\n");
        if (debug)
          errlogSevPrintf(errlogInfo, "moveShtrsCad: tsh demand has invalid data type from checkBuffer (%d)\n", (int) tsType);
        sprintf(pcad->mess,"tsh data type invalid: %d", (int) tsType);
        ret = CAD_REJECT;
      }
      else if (bsType == BAD_VALUE)
      {                                           /* bsh data type invalid  */
        printf("DEBUG: moveShtrsCad: PATH - BSH BAD_VALUE rejection\n");
        if (debug)
          errlogSevPrintf (errlogInfo, "moveShtrsCad: checkBuffer: bsh data type invalid: (%d)\n",
                                   (int) bsType);
        sprintf(pcad->mess,"bsh data type invalid: %d", (int) bsType);
        ret = CAD_REJECT;
      }
      else if (tsType == ALL_BLANKS && bsType == ALL_BLANKS)
      {                                         /* tsh & bsh are both blank */
        printf("DEBUG: moveShtrsCad: PATH - Both arguments blank rejection\n");
        if (debug)
          errlogSevPrintf(errlogInfo, "moveShtrsCad: both arguments are blank\n");
        sprintf(pcad->mess,"Both arguments are blank");
        ret = CAD_REJECT;
      }
      else
      {
        printf("DEBUG: moveShtrsCad: PATH - Initial validation passed\n");
        ret = CAD_ACCEPT;
      }

      if (ret != CAD_REJECT)
      {
        printf("DEBUG: moveShtrsCad: Checking TSH limits and blanks\n");
        if (tsType != ALL_BLANKS)
        {
          printf("DEBUG: moveShtrsCad: TSH not blank, checking limits\n");
          if( tsDmdPos < tsMin || tsDmdPos > tsMax )
          {                                   /* tsh argument out of limits */
            printf("DEBUG: moveShtrsCad: PATH - TSH out of limits rejection\n");
            if (debug)
              errlogSevPrintf(errlogInfo, "moveShtrsCad: tsh argument out of limits\n");
            sprintf(pcad->mess, "tsh out of range: %3.1f - %3.1f",
                            tsMin, tsMax);
            ret = CAD_REJECT;
          }
          else             
          {                            /* valid top shutter position demand */
            printf("DEBUG: moveShtrsCad: PATH - TSH limits OK\n");
            ret = CAD_ACCEPT;
          }
        }
        else
        {                                              /* argument is blank */
          printf("DEBUG: moveShtrsCad: PATH - TSH is blank, accepting\n");
          if (debug)
            errlogSevPrintf(errlogInfo, "moveShtrsCad: tsh demand is blank\n");
          ret = CAD_ACCEPT;
        }
      }

      if (ret != CAD_REJECT)
      {
        printf("DEBUG: moveShtrsCad: Checking BSH limits and blanks\n");
        if (bsType != ALL_BLANKS)
        {
          printf("DEBUG: moveShtrsCad: BSH not blank, checking limits\n");
          if( bsDmdPos < bsMin || bsDmdPos > bsMax )
          {                                   /* bsh argument out of limits */
            printf("DEBUG: moveShtrsCad: PATH - BSH out of limits rejection\n");
            if (debug)
              errlogSevPrintf(errlogInfo, "moveShtrsCad: bsh argument out of limits\n");
            sprintf(pcad->mess, "bsh out of range: %3.1f - %3.1f",
                            bsMin, bsMax);
            ret = CAD_REJECT;
          }
          else             
          {                         /* valid bottom shutter position demand */
            printf("DEBUG: moveShtrsCad: PATH - BSH limits OK\n");
            ret = CAD_ACCEPT;
          }
        }
        else
        {                                              /* argument is blank */
          printf("DEBUG: moveShtrsCad: PATH - BSH is blank, accepting\n");
          if (debug)
            errlogSevPrintf(errlogInfo, "moveShtrsCad: bsh demand is blank\n");
          ret = CAD_ACCEPT;
        }
      }

      if (ret == CAD_ACCEPT)
      {
        printf("DEBUG: moveShtrsCad: All validations passed, processing demands\n");
        if (tsType == ALL_BLANKS)          /* if blank - recover old values */
        {
          printf("DEBUG: moveShtrsCad: PATH - Recovering old TSH value\n");
          tsDmdPos = *(double *)pcad->valb + tsOff;
        }
        if (bsType == ALL_BLANKS)
        {
          printf("DEBUG: moveShtrsCad: PATH - Recovering old BSH value\n");
          bsDmdPos = *(double *)pcad->valc + bsOff;
        }

errlogSevPrintf(errlogInfo, "moveShtrs: tsDmdPos=%g, bsDmdPos=%g, tsOff=%g, bsOff=%g\n", tsDmdPos, bsDmdPos, tsOff, bsOff);

        if (tsDmdPos < bsDmdPos)            /* check if bottom is above top */
        {                                            /* bottom is above top */
          printf("DEBUG: moveShtrsCad: PATH - Bottom above top rejection\n");
          if (debug)
            errlogSevPrintf(errlogInfo, "moveShtrsCad: Tsh (%3.1f) must be above Bsh (%3.1f)\n",
                             tsDmdPos, bsDmdPos);
          sprintf(pcad->mess, "Tsh (%3.1f) must be above Bsh (%3.1f)\n",
                             tsDmdPos, bsDmdPos);
          ret = CAD_REJECT;
        }
        else
        {                                            /* bottom is below top */
          int tsMoving = 0;
          int bsMoving = 0;
          int stopOnly = 0;

          printf("DEBUG: moveShtrsCad: PATH - Position relationship OK, writing outputs\n");
          tsMoving = (tsType != ALL_BLANKS && *(long *)pcad->vala == MOVE);
          bsMoving = (bsType != ALL_BLANKS && *(long *)pcad->valc == MOVE);

          if (!moveShtrsPending && (tsMoving || bsMoving))
          {
            if (tsMoving)
            {
              printf("DEBUG: moveShtrsCad: TSH moving, issuing STOP before new demand\n");
              *(long *)pcad->vala = STOP;
            }
            if (bsMoving)
            {
              printf("DEBUG: moveShtrsCad: BSH moving, issuing STOP before new demand\n");
              *(long *)pcad->valc = STOP;
            }
            fanSel = (tsMoving ? 1 : 0) + (bsMoving ? 2 : 0);
            *(long *)pcad->vale = fanSel;
            moveShtrsPending = 1;
            printf("DEBUG: moveShtrsCad: STOP issued, scheduling reprocess for new demand\n");
            scanOnce((dbCommon *)pcad);
            stopOnly = 1;
          }

          if (!stopOnly)
          {
            if (moveShtrsPending)
            {
              printf("DEBUG: moveShtrsCad: Applying pending move after stop\n");
              moveShtrsPending = 0;
            }
            if (tsType != ALL_BLANKS)
            {                                         /* don't write if blank */
              printf("DEBUG: moveShtrsCad: Writing TSH MOVE command\n");
	      if (*(long *)pcad->vala == MOVE)
	      {
                  printf("DEBUG: moveShtrsCad: TSH already moving, stopping first\n");
		  *(long *)pcad->vala = STOP;         /* if it is already moving, we need to stop it so it can process the new demand */ 
	          errlogSevPrintf(errlogInfo, "moveShtrs: top shutter still moving, applying stop before next move\n");
	      }
              fanSel = (fanSel + 1);                        /* enable ts FLNK */
              *(long *)pcad->vala = MOVE;  /* Write tsh MOVE demand state out */
              *(double *)pcad->valb = tsDmdPos - tsOff; /* Write tsh demand pos out */
            }
            if (bsType != ALL_BLANKS)
            {                                         /* don't write if blank */
              printf("DEBUG: moveShtrsCad: Writing BSH MOVE command\n");
	      if (*(long *)pcad->valc == MOVE)
	      {
                  printf("DEBUG: moveShtrsCad: BSH already moving, stopping first\n");
		  *(long *)pcad->valc = STOP; /* if it is already moving, we need to stop it so it can process the new demand */
	          errlogSevPrintf(errlogInfo, "moveShtrs: bottom shutter still moving, applying stop before next move\n");
	      }
              fanSel = (fanSel + 2);                        /* enable bs FLNK */
              *(long *)pcad->valc = MOVE;  /* Write bsh MOVE demand state out */
              *(double *)pcad->vald = bsDmdPos - bsOff; /* Write bsh demand pos out */
            }
            if (debug)
              errlogSevPrintf(errlogInfo, "moveShtrsCad: ACCEPTED el. demands: tsh = %f, bsh = %f\n",
                            tsDmdPos, bsDmdPos );
          }
        }
      }
      if (ret == CAD_REJECT && moveShtrsPending)
      {
        printf("DEBUG: moveShtrsCad: Clearing pending move due to rejection\n");
        moveShtrsPending = 0;
      }
      *(long *)pcad->vale = fanSel;          /* Write fanout select integer */
      printf("DEBUG: moveShtrsCad: PRESET complete, fanSel=%ld, ret=%ld\n", fanSel, ret);
      break;

    case menuDirectiveSTART:
      printf("DEBUG: moveShtrsCad: START directive\n");
      if (debug)
        errlogSevPrintf(errlogInfo, "moveShtrsCad: ACCEPTED moveShtrs command\n");
      ret = CAD_ACCEPT;
      break;

    case menuDirectiveSTOP:
      printf("DEBUG: moveShtrsCad: STOP directive\n");
      ret = CAD_ACCEPT;
      break;

    default:
      printf("DEBUG: moveShtrsCad: Invalid directive\n");
      if (debug)
        errlogSevPrintf(errlogInfo, "moveShtrsCad: invalid CAD directive\n");
      sprintf(pcad->mess, "invalid CAD directive");
      ret = CAD_REJECT;
      break;
  }
  printf("DEBUG: moveShtrsCad: Exiting function, returning %ld\n", ret);
  return ret;
}


/* *INDENT-OFF* */
/*+
 *   Function name:
 *   moveVgatesCad
 *
 *   Purpose:
 *   Implement the moveVgates CAD for controlling motion of the vent gates.
 *
 *   Description:
 *   This routine is tied to the moveVgates CAD record. It checks the
 *   position arguments specified and if valid, presents them as output
 *   values. A single value is accepted, but with two blank arguments
 *   the command is rejected
 *
 *   Invocation:
 *   moveVgatesCad (pcad)
 *
 *   Parameters: (">" input, "!" modified, "<" output)  
 *      (!)   pcad   (struct cadRecord*)  Pointer to cad record structure
 *
 *   EPICS Input fields :
 *
 *   a => Current debug level
 *   b => east vent gate demand
 *   c => east vent gate demand
 *   d => evg maximum limit
 *   e => evg minimum limit
 *   f => wvg maximum limit
 *   g => wvg minimum limit
 *
 *   EPICS Output fields :
 *
 *   vala => move east vent gate demand state
 *   valb => validated east vent gate elevation demand
 *   valc => move west vent gate demand state
 *   vald => validated west vent gate elevation demand
 *   vale => fanout select to limit processing downstream:
 *                0 none
 *                1 to allow evg flnk only 
 *                2 to allow wvg flnk only
 *                3 to allow both
 *
 *   Function value:
 *   (<)  status  (long) Return status, 0 = OK (command accepted)
 * 
 *   External functions:
 *
 *   Deficiencies:
 *   - debug only uses two levels (debugging off for NONE and
 *     on for MIN or FULL)
 *   
 *-
 */
/* *INDENT-ON* */

long moveVgatesCad( struct cadRecord *pcad )
{
  long   ret;                         /* CAD return status                  */
  long   evgType;                     /* east vent gate data type           */
  long   wvgType;                     /* west vent gate data type           */
  double evgDmdPos;                   /* east vent gate demand position     */
  double wvgDmdPos;                   /* west vent gate demand position     */
  double evgMax;                      /* max east vent gate position limit  */
  double evgMin;                      /* min east vent gate position limit  */
  double wvgMax;                      /* max west vent gate position limit  */
  double wvgMin;                      /* min west vent gate position limit  */
  long   fanSel = 0;                  /* flnk fanout select                 */

  long   debug;                       /* debug level                        */
  long interlockType;
  char interlockMess[40];
        
  debug   = atoi(pcad->a);             /* read current debug level argument */

      /* Check for interlocks */
  if (pcad->dir != menuDirectiveCLEAR)
  {
    interlockType = ecsInterlocked (interlockMess);
    if (interlockType == INTRLK_MOTION || 
            interlockType == INTRLK_GLOBAL ||
                  interlockType == INTRLK_NORUN)
    {
      strcpy (pcad->mess, interlockMess);
      return CAD_REJECT ;
    }
  }
  switch( pcad->dir )                                 /* read CAD directive */
  {
    case menuDirectiveMARK:
      ret = CAD_ACCEPT;
      break;

    case menuDirectiveCLEAR:
      ret = CAD_ACCEPT;
      break;

    case menuDirectivePRESET:
      evgDmdPos = strtod(pcad->b, NULL); /*     read evg position argument  */
      wvgDmdPos = strtod(pcad->c, NULL); /*     read wvg position argument  */
      evgMax = strtod( pcad->d, NULL);  /* read maximum evg limit argument  */
      evgMin = strtod( pcad->e, NULL);  /* read minimum evg limit argument  */
      wvgMax = strtod( pcad->f, NULL);  /* read maximum wvg limit argument  */
      wvgMin = strtod( pcad->g, NULL);  /* read minimum wvg limit argument  */

      evgType = checkBuffer (pcad->b);        /* check for valid evg data   */
      wvgType = checkBuffer (pcad->c);        /* check for valid wvg data   */

      if (evgType == BAD_VALUE)
      {                                           /* evg data type invalid  */
        if (debug)
          errlogSevPrintf(errlogInfo, "moveVgatesCad: checkBuffer: evg data type invalid: (%d)\n",
                               (int) evgType);
        sprintf(pcad->mess,"evg data type invalid: %d", (int) evgType);
        ret = CAD_REJECT;
      }
      else if (wvgType == BAD_VALUE)
      {                                           /* wvg data type invalid  */
        if (debug)
          errlogSevPrintf(errlogInfo, "moveVgatesCad: wvg demand has invalid data type from checkBuffer (%d)\n", (int) wvgType);
        sprintf(pcad->mess,"wvg data type invalid: %d", (int) wvgType);
        ret = CAD_REJECT;
      }
      else if (evgType == ALL_BLANKS && wvgType == ALL_BLANKS)
      {                                         /* evg & wvg are both blank */
        if (debug)
          errlogSevPrintf(errlogInfo, "moveVgatesCad: both arguments are blank\n");
        sprintf(pcad->mess,"Both arguments are blank");
        ret = CAD_REJECT;
      }
      else
        ret = CAD_ACCEPT;

      if (ret != CAD_REJECT)
      {
        if (evgType != ALL_BLANKS)
        {
          if( evgDmdPos < evgMin || evgDmdPos > evgMax )
          {                                   /* evg argument out of limits */
            if (debug)
              errlogSevPrintf(errlogInfo, "moveVgatesCad: evg argument out of limits\n");
            sprintf(pcad->mess, "evg out of range: %3.1f - %3.1f",
                            evgMin, evgMax);
            ret = CAD_REJECT;
          }
          else             
          {                         /* valid east vent gate position demand */
            ret = CAD_ACCEPT;
          }
        }
        else
        {                                              /* argument is blank */
          if (debug)
            errlogSevPrintf(errlogInfo, "moveVgatesCad: evg demand is blank\n");
          ret = CAD_ACCEPT;
        }
      }

      if (ret != CAD_REJECT)
      {
        if (wvgType != ALL_BLANKS)
        {
          if( wvgDmdPos < wvgMin || wvgDmdPos > wvgMax )
          {                                   /* wvg argument out of limits */
            if (debug)
              errlogSevPrintf(errlogInfo, "moveVgatesCad: wvg argument out of limits\n");
            sprintf(pcad->mess, "wvg out of range: %3.1f - %3.1f",
                            wvgMin, wvgMax);
            ret = CAD_REJECT;
          }
          else             
          {                         /* valid west vent gate position demand */
            ret = CAD_ACCEPT;
          }
        }
        else
        {                                              /* argument is blank */
          if (debug)
            errlogSevPrintf(errlogInfo, "moveVgatesCad: wvg demand is blank\n");
          ret = CAD_ACCEPT;
        }
      }

      if (ret == CAD_ACCEPT)
      {  
        if (evgType != ALL_BLANKS)
        {                                           /* don't write if blank */
	  if (*(long *)pcad->vala == MOVE)
	  {
		*(long *)pcad->vala = STOP;     /* if vent gate is already moving, we need to stop it so it can process the new demand */
	  }
          fanSel = (fanSel + 1);                         /* enable evg FLNK */
          *(long *)pcad->vala = MOVE;    /* Write evg MOVE demand state out */
          *(double *)pcad->valb = evgDmdPos;    /* Write evg demand pos out */
        }
        if (wvgType != ALL_BLANKS)
        {                                           /* don't write if blank */
	  if (*(long *)pcad->valc == MOVE)
          {     
                *(long *)pcad->valc = STOP;     /* if vent gate is already moving, we need to stop it so it can process the new demand */
	  }
          fanSel = (fanSel + 2);                         /* enable wvg FLNK */
          *(long *)pcad->valc = MOVE;    /* Write wvg MOVE demand state out */
          *(double *)pcad->vald = wvgDmdPos;    /* Write wvg demand pos out */
        }
          if (debug)
            errlogSevPrintf(errlogInfo, "moveVgatesCad: ACCEPTED percent open: evg = %f, wvg = %f\n",
                          evgDmdPos, wvgDmdPos );
      }
      *(long *)pcad->vale = fanSel;          /* Write fanout select integer */
      break;

    case menuDirectiveSTART:
      if (debug)
        errlogSevPrintf(errlogInfo, "moveVgatesCad: ACCEPTED moveVgates command\n");
      ret = CAD_ACCEPT;
      break;

    case menuDirectiveSTOP:
      ret = CAD_ACCEPT;
      break;

    default:
      if (debug)
        errlogSevPrintf(errlogInfo, "moveVgatesCad: invalid CAD directive\n");
      sprintf(pcad->mess, "invalid CAD directive");
      ret = CAD_REJECT;
      break;
  }
  return ret;
}



/* *INDENT-OFF* */
/*+
 *   Function name:
 *   parkCAD
 *
 *   Purpose:
 *   Implement the CAD for parking the dome, shutters and vent gates at
 *   their default positions.
 *   
 *
 *   Description:
 *   This routine is tied to the park CAD record. It has arguments
 *   for default parking positions, park limits and for current debug level.
 *
 *   Invocation:
 *   parkCAD (pcad)
 *
 *   Parameters: (">" input, "!" modified, "<" output)  
 *      (!)   pcad   (struct cadRecord*)  Pointer to cad record structure
 *
 *   EPICS Input fields :
 *
 *   a => Current ECS debug level
 *   b => dome default parking position
 *   c => dome maximum parking position
 *   d => dome minimum parking position
 *   e => top shutter default parking position
 *   f => top shutter maximum parking position
 *   g => top shutter minimum parking position
 *   h => bottom shutter default parking position
 *   i => bottom shutter maximum parking position
 *   j => bottom shutter minimum parking position
 *   k => east vent gate default parking position
 *   l => east vent gate maximum parking position
 *   m => east vent gate minimum parking position
 *   n => west vent gate default parking position
 *   o => west vent gate maximum parking position
 *   p => west vent gate minimum parking position
 *   q => shutter overlap value
 *
 *   EPICS Output fields :
 *
 *   vala => PARK demand state for all mechanisms
 *   valb => validated dome parking position
 *   valc => validated top shutter parking position
 *   vald => validated bottom shutter parking position
 *   vale => validated east vent gate parking position
 *   valf => validated west vent gate parking position
 *
 *   Function value:
 *   (<)  status  (long) Return status, 0 = OK (command accepted)
 * 
 *   External functions:
 *
 *   Deficiencies:
 *-
 */
/* *INDENT-ON* */



long parkCAD( struct cadRecord *pcad )
{
  long ret;              /* CAD return status                                */
  long debug;            /* current debug level                              */
  double dmdPos;         /* park position before validation                  */
  double domeParkDef;    /* default dome parking position argument           */
  double tsParkDef;      /* default top shutter parking position argument    */
  double bsParkDef;      /* default bottom shutter parking position argument */
  double evgParkDef;     /* default east vent gate parking position argument */
  double wvgParkDef;     /* default west vent gate parking position argument */
  double overlap;        /* shutter overlap to seal                          */
  double parkMax;        /* max position limit                               */
  double parkMin;        /* min position limit                               */
  long interlockType;
  char interlockMess[40];

  debug       = atoi(pcad->a);          /* read current debug level argument */

      /* Check for interlocks */
  if (pcad->dir != menuDirectiveCLEAR)
  {
    interlockType = ecsInterlocked (interlockMess);
    if (interlockType == INTRLK_MOTION || 
            interlockType == INTRLK_GLOBAL ||
                  interlockType == INTRLK_NORUN)
    {
      strcpy (pcad->mess, interlockMess);
      return CAD_REJECT ;
    }
  }


  switch( pcad->dir )                                  /* read CAD directive */
  {
    case menuDirectiveMARK:
      ret = CAD_ACCEPT;
      break;

    case menuDirectiveCLEAR:
      ret = CAD_ACCEPT;
      break;

    case menuDirectivePRESET:
                                              /* validate dome park position */
      dmdPos = strtod(pcad->b, NULL);        /* read park position argument  */
      parkMax = strtod( pcad->c, NULL);      /* read park max limit argument */
      parkMin = strtod( pcad->d, NULL);      /* read park min limit argument */

      if ( dmdPos < parkMin || dmdPos > parkMax )            /* check limits */
      {                                            /* argument out of limits */
        if (debug)
          errlogSevPrintf(errlogInfo, "parkCAD: Dome argument: %3.1f out of limits: %3.1f - %3.1f\n",
                               dmdPos, parkMin, parkMax);
        sprintf(pcad->mess, "Dome: %3.1f out of range: %3.1f - %3.1f",
                               dmdPos, parkMin, parkMax);
        ret = CAD_REJECT;
      }
      else
      {                                               /* valid park position */
        domeParkDef = dmdPos;
        ret = CAD_ACCEPT;
      }

      if (ret == CAD_ACCEPT)
      {                                /* validate top shutter park position */
        dmdPos = strtod(pcad->e, NULL);      /* read park position argument  */
        parkMax = strtod( pcad->f, NULL);    /* read park max limit argument */
        parkMin = strtod( pcad->g, NULL);    /* read park min limit argument */

        if ( dmdPos < parkMin || dmdPos > parkMax )          /* check limits */
        {                                          /* argument out of limits */
          if (debug)
            errlogSevPrintf(errlogInfo, "parkCAD: Tsh argument: %3.1f out of limits: %3.1f - %3.1f\n", dmdPos, parkMin, parkMax);
          sprintf(pcad->mess, "Tsh: %3.1f out of range: %3.1f - %3.1f",
                                dmdPos, parkMin, parkMax);
          ret = CAD_REJECT;
        }
        else
        {                                             /* valid park position */
          tsParkDef = dmdPos;
          ret = CAD_ACCEPT;
        }
      }

      if (ret == CAD_ACCEPT)
      {                             /* validate bottom shutter park position */
        dmdPos = strtod(pcad->h, NULL);      /* read park position argument  */
        parkMax = strtod( pcad->i, NULL);    /* read park max limit argument */
        parkMin = strtod( pcad->j, NULL);    /* read park min limit argument */

        if ( dmdPos < parkMin || dmdPos > parkMax )          /* check limits */
        {                                          /* argument out of limits */
          if (debug)
            errlogSevPrintf(errlogInfo, "parkCAD: Bsh argument: %3.1f out of limits: %3.1f - %3.1f\n", dmdPos, parkMin, parkMax);
          sprintf(pcad->mess, "Bsh: %3.1f out of range: %3.1f - %3.1f",
                               dmdPos, parkMin, parkMax);
          ret = CAD_REJECT;
        }
        else
        {                                             /* valid park position */
          bsParkDef = dmdPos;
          overlap = strtod( pcad->q, NULL); /* read shutter overlap argument */

          if ((tsParkDef + overlap) < bsParkDef) /* check if bottom is above */
                                                 /* top plus overlap         */
          {                                           /* bottom is above top */
            if (debug)
              errlogSevPrintf(errlogInfo, "parkCAD: Tsh(%3.1f) + ovrlp(%3.1f) must be <= Bsh (%3.1f)\n", tsParkDef, overlap, bsParkDef);
            sprintf(pcad->mess, "Tsh(%3.1f) + ovrlp(%3.1f) must be above Bsh(%3.1f)\n", tsParkDef, overlap, bsParkDef);
            ret = CAD_REJECT;
          }
          else ret = CAD_ACCEPT;
        }
      }

      if (ret == CAD_ACCEPT)
      {                             /* validate east vent gate park position */
        dmdPos = strtod(pcad->k, NULL);      /* read park position argument  */
        parkMax = strtod( pcad->l, NULL);    /* read park max limit argument */
        parkMin = strtod( pcad->m, NULL);    /* read park min limit argument */

        if ( dmdPos < parkMin || dmdPos > parkMax )          /* check limits */
        {                                          /* argument out of limits */
          if (debug)
            errlogSevPrintf(errlogInfo, "parkCAD: Evg argument: %3.1f out of limits: %3.1f - %3.1f\n", dmdPos, parkMin, parkMax);
          sprintf(pcad->mess, "Evg: %3.1f out of range: %3.1f - %3.1f",
                              dmdPos, parkMin, parkMax);
          ret = CAD_REJECT;
        }
        else
        {                                             /* valid park position */
          evgParkDef = dmdPos;
          ret = CAD_ACCEPT;
        }
      }

      if (ret == CAD_ACCEPT)
      {                             /* validate west vent gate park position */
        dmdPos = strtod(pcad->n, NULL);      /* read park position argument  */
        parkMax = strtod( pcad->o, NULL);    /* read park max limit argument */
        parkMin = strtod( pcad->p, NULL);    /* read park min limit argument */

        if ( dmdPos < parkMin || dmdPos > parkMax )          /* check limits */
        {                                          /* argument out of limits */
          if (debug)
            errlogSevPrintf(errlogInfo, "parkCAD: Wvg argument: %3.1f out of limits: %3.1f - %3.1f\n", dmdPos, parkMin, parkMax);
          sprintf(pcad->mess, "Wvg: %3.1f out of range: %3.1f - %3.1f",
                                dmdPos, parkMin, parkMax);
          ret = CAD_REJECT;
        }
        else
        {                                             /* valid park position */
          wvgParkDef = dmdPos;
          ret = CAD_ACCEPT;
        }
      }

      if (ret == CAD_ACCEPT)
      {
        *(double *)pcad->valb = domeParkDef;  /*           write dome output */
        *(double *)pcad->valc = tsParkDef;    /*    write top shutter output */
        *(double *)pcad->vald = bsParkDef;    /* write bottom shutter output */
        *(double *)pcad->vale = evgParkDef;   /* write west vent gate output */
        *(double *)pcad->valf = wvgParkDef;   /* write west vent gate output */
        *(long *)pcad->vala = PARK;           /* mechanism demand state PARK */
        if (debug)
          errlogSevPrintf(errlogInfo, "parkCAD: ACCEPTED park positions, dome: %3.1f, tsh: %3.1f, bsh: %3.1f, evg: %3.1f, wvg: %3.1f\n", domeParkDef, tsParkDef, bsParkDef, evgParkDef, wvgParkDef);
      }

      break;

    case menuDirectiveSTART:
      if (debug)
        errlogSevPrintf(errlogInfo, "parkCAD: ACCEPTED park command\n");
      ret = CAD_ACCEPT;
      break;

    case menuDirectiveSTOP:
      ret = CAD_ACCEPT;
      break;

    default:
      if (debug)
        errlogSevPrintf(errlogInfo, "parkCAD: invalid CAD directive\n");
      sprintf(pcad->mess, "invalid CAD directive");
      ret = CAD_REJECT;
      break;
  }
  return ret;
}


/* *INDENT-OFF* */
/*+
 *   Function name:
 *   parkDomeCad
 *
 *   Purpose:
 *   Implement the parkDome CAD for controlling parking of the dome in the ECS.
 *
 *   Description:
 *   This routine is tied to the parkDome CAD record. It checks the
 *   park mode and based on that value either checks for a valid:
 *       1. default park position
 *       2. Access 1
 *       3. Access 2
 *       4. Access 3
 *       5. position entered from user interface
 *   If a vaild azimuth argument is specified, it is presented 
 *   as an output value. 
 *
 *   Invocation:
 *   parkDomeCad (pcad)
 *
 *   Parameters: (">" input, "!" modified, "<" output)  
 *      (!)   pcad   (struct cadRecord*)  Pointer to cad record structure
 *
 *   EPICS Input fields :
 *
 *   a => Current debug level
 *   b => azimuth demand
 *   c => park dome mode
 *   d => park maximum limit
 *   e => park minimum limit
 *   f => dome default park position
 *   g => park ACCESS 1 position
 *   h => park ACCESS 2 position
 *   i => park ACCESS 3 position
 *
 *   EPICS Output fields :
 *
 *   vala => park dome demand state
 *   valb => validated azimuth demand
 *
 *   Function value:
 *   (<)  status  (long) Return status, 0 = OK (command accepted)
 * 
 *   External functions:
 *
 *   Deficiencies:
 *   - debug only uses two levels (debugging off for NONE and
 *     on for MIN or FULL
 *
 *-
 */
/* *INDENT-ON* */

long parkDomeCad( struct cadRecord *pcad )
{
  long   ret;           /* CAD return status                */
  long   dataType;      /* passed parameter for checkBuffer */
  double dmdPos;        /* demand position                  */
  double dmdOff;        /* position offset                  */
  double parkMax;       /* max park limit                   */
  double parkMin;       /* min park limit                   */
  double parkA1;        /* Access 1 park position           */
  double parkA2;        /* Access 2 park position           */
  double parkA3;        /* Access 3 park position           */
  long   parkMode;      /* dome park keyword                */
  long   debug;         /* debug level                      */
  long interlockType;
  char interlockMess[40];

        
  debug   = atoi(pcad->a);             /* read current debug level argument */

      /* Check for interlocks */
  if (pcad->dir != menuDirectiveCLEAR)
  {
    interlockType = ecsInterlocked (interlockMess);
    if (interlockType == INTRLK_MOTION || 
            interlockType == INTRLK_GLOBAL ||
                  interlockType == INTRLK_NORUN)
    {
      strcpy (pcad->mess, interlockMess);
      return CAD_REJECT ;
    }
  }

  switch( pcad->dir )                                 /* read CAD directive */
  {
    case menuDirectiveMARK:
      ret = CAD_ACCEPT;
      break;

    case menuDirectiveCLEAR:
      ret = CAD_ACCEPT;
      break;

    case menuDirectivePRESET:

      parkMax = strtod( pcad->d, NULL);     /* read park max limit argument */
      parkMin = strtod( pcad->e, NULL);     /* read park min limit argument */
      dmdOff  = strtod( pcad->j, NULL);     /* read dome azimuth offset */
      parkMode = atoi(pcad->c);             /* read park dome mode argument */
      dataType = checkBuffer (pcad->c);        /* check for valid data type */
      if (dataType != SHORT_INTEGER)
      {                                                /* data type invalid */
        if (debug)
          errlogSevPrintf(errlogInfo, "parkDomeCad:invalid data type from checkBuffer (%d) \n",
                              (int) dataType);
        sprintf(pcad->mess,"Park mode data type invalid: %d", (int) dataType);
        ret = CAD_REJECT;
      }
      else if( parkMode < DEFAULT || parkMode > ACCESS3 )
      {                                     /* argument out of limits */
        if (debug)
          errlogSevPrintf(errlogInfo, "parkDomeCad: Park mode argument out of limits\n");
        sprintf(pcad->mess,"Argument must be DEFAULT, POSITION, or ACCESSn");
        ret = CAD_REJECT;
      }
      else
      {                                         /* valid park mode */
        switch (parkMode)
        {  

          case DEFAULT:
                                
          dmdPos =  strtod(pcad->f, NULL);    /* read park default position */
          dataType = checkBuffer (pcad->f);
          if (debug)
            errlogSevPrintf(errlogInfo, "parkDomeCad: checking DEFAULT position demand\n");
          ret = CAD_ACCEPT;
          break;


          case POSITION:
                                             /* read dome position argument */
          dmdPos = strtod(pcad->b, NULL);
          dataType = checkBuffer (pcad->b);
          if (debug)
            errlogSevPrintf(errlogInfo, "parkDomeCad: checking POSITION demand\n");
          ret = CAD_ACCEPT;
          break;

          case ACCESS1:
                                          
          parkA1 = strtod( pcad->g, NULL);  /* read Access 1 park argument  */
          dmdPos = parkA1;          /* position is predefined at Access One */
          if (debug)
            errlogSevPrintf(errlogInfo, "parkDomeCad: checking ACCESS1 position demand\n");
          ret = CAD_ACCEPT;
          break;

          case ACCESS2:
                    
          parkA2 = strtod( pcad->h, NULL);  /* read Access 2 park argument  */
          dmdPos = parkA2;          /* position is predefined at Access Two */
          if (debug)
            errlogSevPrintf(errlogInfo, "parkDomeCad: checking ACCESS2 position demand\n");
          ret = CAD_ACCEPT;
          break;

          case ACCESS3:
                   
          parkA3 = strtod( pcad->i, NULL);  /* read Access 3 park argument  */
          dmdPos = parkA3;        /* position is predefined at Access Three */
          if (debug)
            errlogSevPrintf(errlogInfo, "parkDomeCad: checking ACCESS3 position demand\n");
          ret = CAD_ACCEPT;
          break;

          default:
          if (debug)
            errlogSevPrintf(errlogInfo, "parkDomeCad: invalid park keyword\n");
          sprintf(pcad->mess, "invalid park keyword");
          ret = CAD_REJECT;
          break;
        }

	dmdPos -= dmdOff;
	if (dmdPos < 0)
	  dmdPos += 360;

        if (ret == CAD_ACCEPT)
        {                         /* Check validity of park position demand */
          if (dataType == ALL_BLANKS || dataType == BAD_VALUE)
          {                                              /* data type invalid */
            if (debug)
              errlogSevPrintf(errlogInfo, "parkDomeCad:invalid datatype fm checkBuffer (%d) \n",
                                     (int) dataType);
            sprintf(pcad->mess,"Park position data type invalid: %d",
                                   (int) dataType);
            ret = CAD_REJECT;
          }
          else if( dmdPos < parkMin || dmdPos > parkMax )
          {                                         /* argument out of limits */
            if (debug)
              errlogSevPrintf(errlogInfo, "parkDomeCad: Dome: %3.1f out of limits: %3.1f - %3.1f\n", dmdPos, parkMin, parkMax);
            sprintf(pcad->mess, "Park az. out of range: %3.1f - %3.1f",
                                     parkMin, parkMax);
            ret = CAD_REJECT;
          }
          else
          {                                            /* valid park position */
            *(long *)pcad->vala = PARK;        /* Write PARK demand state out */
            *(double *)pcad->valb = dmdPos;   /* Write current demand pos out */
            if (debug)
              errlogSevPrintf(errlogInfo, "parkDomeCad: ACCEPTED azimuth position = %f\n", dmdPos );
          }
        }
      }
      break;

    case menuDirectiveSTART:
      if (debug)
        errlogSevPrintf(errlogInfo, "parkDomeCad: ACCEPTED parkDome command\n");
      ret = CAD_ACCEPT;
      break;

    case menuDirectiveSTOP:
      ret = CAD_ACCEPT;
      break;

    default:
      if (debug)
        errlogSevPrintf(errlogInfo, "parkDomeCad: invalid CAD directive\n");
      sprintf(pcad->mess, "invalid CAD directive");
      ret = CAD_REJECT;
      break;
  }

  return ret;
}


/* *INDENT-OFF* */
/*+
 *   Function name:
 *   parkShtrsCad
 *
 *   Purpose:
 *   Implement the parkShtrs CAD for parking of the shutters.
 *
 *   Description:
 *   This routine is tied to the parkShtrs CAD record. It checks the
 *   elevation arguments specified and if valid, presents them 
 *   as output values. 
 *
 *   Invocation:
 *   parkShtrsCad (pcad)
 *
 *   Parameters: (">" input, "!" modified, "<" output)  
 *      (!)   pcad   (struct cadRecord*)  Pointer to cad record structure
 *
 *   EPICS Input fields :
 *
 *   a => Current debug level
 *   b => top elevation demand
 *   c => bottom elevation demand
 *   d => top park maximum limit
 *   e => top park minimum limit
 *   f => bottom park maximum limit
 *   g => bottom park minimum limit
 *   h => shutter overlap value
 *
 *   EPICS Output fields :
 *
 *   vala => park top shutter demand state
 *   valb => validated top shutter elevation demand
 *   valc => park bottom shutter demand state
 *   vald => validated bottom shutter elevation demand
 *
 *   Function value:
 *   (<)  status  (long) Return status, 0 = OK (command accepted)
 * 
 *   External functions:
 *
 *   Deficiencies:
 *   - debug only uses two levels (debugging off for NONE and
 *     on for MIN or FULL)
 *   
 *-
 */
/* *INDENT-ON* */

long parkShtrsCad( struct cadRecord *pcad )
{
  long   ret;                           /* CAD return status                */
  long   dataType;                      /* passed parameter for checkBuffer */
  double dmdPos;                        /* demand position                  */
  double dmdPosTs;                      /* top shutter demand position      */
  double dmdPosBs;                      /* bottom shutter demand position   */
  double tsMax;                         /* max top shutter position limit   */
  double tsMin;                         /* min top shutter position limit   */
  double bsMax;                         /* max top shutter position limit   */
  double bsMin;                         /* min top shutter position limit   */
  double tsOff;                         /* top shutter offset               */
  double bsOff;                         /* bottom shutter offset            */
  double overlap;                       /* shutter overlap to seal          */

  long   debug;                         /* debug level                      */
  long interlockType;
  char interlockMess[40];
        
  debug   = atoi(pcad->a);             /* read current debug level argument */

      /* Check for interlocks */
  if (pcad->dir != menuDirectiveCLEAR)
  {
    interlockType = ecsInterlocked (interlockMess);
    if (interlockType == INTRLK_MOTION || 
            interlockType == INTRLK_GLOBAL ||
                  interlockType == INTRLK_NORUN)
    {
      strcpy (pcad->mess, interlockMess);
      return CAD_REJECT ;
    }
  }

  switch( pcad->dir )                                 /* read CAD directive */
  {
    case menuDirectiveMARK:
      ret = CAD_ACCEPT;
      break;

    case menuDirectiveCLEAR:
      ret = CAD_ACCEPT;
      break;

    case menuDirectivePRESET:
      tsMax = strtod( pcad->d, NULL);    /* read maximum ts limit argument  */
      tsMin = strtod( pcad->e, NULL);    /* read minimum ts limit argument  */
      bsMax = strtod( pcad->f, NULL);    /* read maximum bs limit argument  */
      bsMin = strtod( pcad->g, NULL);    /* read minimum bs limit argument  */
      tsOff = strtod( pcad->i, NULL);    /* read top shutter offset         */
      bsOff = strtod( pcad->j, NULL);    /* read bottom shutter offset      */
      overlap = strtod( pcad->h, NULL);  /* read shutter overlap argument   */

      dmdPos = strtod(pcad->b, NULL);         /* read ts position argument  */
      dataType = checkBuffer (pcad->b);           /* check for valid data   */
      if (dataType == ALL_BLANKS || dataType == BAD_VALUE)
      {                                               /* data type invalid  */
        if (debug)
          errlogSevPrintf(errlogInfo, "parkShtrsCad: top shtr demand has invalid data type from checkBuffer (%d)\n", (int) dataType);
        sprintf(pcad->mess,"Tsh el data type invalid: %d", (int) dataType);
        ret = CAD_REJECT;
      }
      else if( dmdPos < tsMin || dmdPos > tsMax )
      {                                           /* argument out of limits */
        if (debug)
          errlogSevPrintf(errlogInfo, "parkShtrsCad: Tsh el argument out of limits\n");
        sprintf(pcad->mess, "Tsh El out of range: %3.1f - %3.1f",
                              tsMin, tsMax);
        ret = CAD_REJECT;
      }
      else             
      {                                /* valid top shutter position demand */
        dmdPosTs = dmdPos;
        ret = CAD_ACCEPT;
      }

      if (ret == CAD_ACCEPT)
      {
        dmdPos = strtod(pcad->c, NULL);       /* read bs position argument  */
        dataType = checkBuffer (pcad->c);         /* check for valid data   */
        if (dataType == ALL_BLANKS || dataType == BAD_VALUE)
        {                                             /* data type invalid  */
          if (debug)
            errlogSevPrintf(errlogInfo, "parkShtrsCad: bot shtr has invalid data type from checkBuffer (%d)\n", (int) dataType);
          sprintf(pcad->mess,"Bsh el data type invalid: %d", (int) dataType);
          ret = CAD_REJECT;
        }
        else if( dmdPos < bsMin || dmdPos > bsMax )
        {                                         /* argument out of limits */
          if (debug)
            errlogSevPrintf(errlogInfo, "parkShtrsCad: Bsh el argument out of limits\n");
          sprintf(pcad->mess, "Bsh El out of range: %3.1f - %3.1f",
                               bsMin, bsMax);
          ret = CAD_REJECT;
        }
        else             
        {                           /* valid bottom shutter position demand */
          dmdPosBs = dmdPos;
          if ((dmdPosTs + overlap) < dmdPosBs)  /* check if bottom is above */
                                                /* top plus overlap         */
          {                                          /* bottom is above top */
            if (debug)
              errlogSevPrintf(errlogInfo, "parkShtrsCad: Tsh(%3.1f) + ovrlp(%3.1f) must be <= Bsh (%3.1f)\n", dmdPosTs, overlap, dmdPosBs);
            sprintf(pcad->mess, "Tsh(%3.1f) + ovrlp(%3.1f) must be above Bsh(%3.1f)\n", dmdPosTs, overlap, dmdPosBs);
            ret = CAD_REJECT;
          }
          else
          {                                   /* bottom is below top - good */
            *(long *)pcad->vala = PARK;   /* Write ts PARK demand state out */
            *(long *)pcad->valc = PARK;   /* Write bs PARK demand state out */
            *(double *)pcad->valb = dmdPosTs - tsOff; /* Write ts demand pos out */
            *(double *)pcad->vald = dmdPosBs - bsOff; /* Write bs demand pos out */
            if (debug)
              errlogSevPrintf(errlogInfo, "parkShtrsCad: ACCEPTED elevations: top = %f, bot = %f\n",
                            dmdPosTs, dmdPosBs );
            ret = CAD_ACCEPT;
          }
        }
      }
      break;

    case menuDirectiveSTART:
      if (debug)
        errlogSevPrintf(errlogInfo, "parkShtrsCad: ACCEPTED parkShtrs command\n");
      ret = CAD_ACCEPT;
      break;

    case menuDirectiveSTOP:
      ret = CAD_ACCEPT;
      break;

    default:
      if (debug)
        errlogSevPrintf(errlogInfo, "parkShtrsCad: invalid CAD directive\n");
      sprintf(pcad->mess, "invalid CAD directive");
      ret = CAD_REJECT;
      break;
  }

  return ret;
}


/* *INDENT-OFF* */
/*+
 *   Function name:
 *   parkVgatesCad
 *
 *   Purpose:
 *   Implement the parkVgates CAD for parking the vent gates.
 *
 *   Description:
 *   This routine is tied to the parkVgates CAD record. It checks the
 *   position arguments specified and if valid, presents them 
 *   as output values. 
 *
 *   Invocation:
 *   parkVgatesCad (pcad)
 *
 *   Parameters: (">" input, "!" modified, "<" output)  
 *      (!)   pcad   (struct cadRecord*)  Pointer to cad record structure
 *
 *   EPICS Input fields :
 *
 *   a => Current debug level
 *   b => east vent gate demand
 *   c => east vent gate demand
 *   d => evg maximum limit
 *   e => evg minimum limit
 *   f => wvg maximum limit
 *   g => wvg minimum limit
 *
 *   EPICS Output fields :
 *
 *   vala => park east vent gate demand state
 *   valb => validated east vent gate elevation demand
 *   valc => park west vent gate demand state
 *   vald => validated west vent gate elevation demand
 *
 *   Function value:
 *   (<)  status  (long) Return status, 0 = OK (command accepted)
 * 
 *   External functions:
 *
 *   Deficiencies:
 *   - debug only uses two levels (debugging off for NONE and
 *     on for MIN or FULL)
 *   
 *-
 */
/* *INDENT-ON* */

long parkVgatesCad( struct cadRecord *pcad )
{
  long   ret;                         /* CAD return status                  */
  long   dataType;                    /* passed parameter for checkBuffer   */
  double dmdPos;                      /* demand position                    */
  double dmdPosEvg;                   /* east vent gate demand position     */
  double dmdPosWvg;                   /* west vent gate demand position     */
  double evgMax;                      /* max east vent gate position limit  */
  double evgMin;                      /* min east vent gate position limit  */
  double wvgMax;                      /* max west vent gate position limit  */
  double wvgMin;                      /* min west vent gate position limit  */

  long   debug;                       /* debug level                        */
  long interlockType;
  char interlockMess[40];
        
  debug   = atoi(pcad->a);             /* read current debug level argument */

      /* Check for interlocks */
  if (pcad->dir != menuDirectiveCLEAR)
  {
    interlockType = ecsInterlocked (interlockMess);
    if (interlockType == INTRLK_MOTION || 
            interlockType == INTRLK_GLOBAL ||
                  interlockType == INTRLK_NORUN)
    {
      strcpy (pcad->mess, interlockMess);
      return CAD_REJECT ;
    }
  }
  switch( pcad->dir )                                 /* read CAD directive */
  {
    case menuDirectiveMARK:
      ret = CAD_ACCEPT;
      break;

    case menuDirectiveCLEAR:
      ret = CAD_ACCEPT;
      break;

    case menuDirectivePRESET:
      evgMax = strtod( pcad->d, NULL);  /* read maximum evg limit argument  */
      evgMin = strtod( pcad->e, NULL);  /* read minimum evg limit argument  */
      wvgMax = strtod( pcad->f, NULL);  /* read maximum wvg limit argument  */
      wvgMin = strtod( pcad->g, NULL);  /* read minimum wvg limit argument  */

      dmdPos = strtod(pcad->b, NULL);        /* read evg position argument  */
      dataType = checkBuffer (pcad->b);           /* check for valid data   */
      if (dataType == ALL_BLANKS || dataType == BAD_VALUE)
      {                                               /* data type invalid  */
        if (debug)
          errlogSevPrintf(errlogInfo, "parkVgatesCad: evg demand has invalid data type from checkBuffer (%d)\n", (int) dataType);
        sprintf(pcad->mess,"evg data type invalid: %d", (int) dataType);
        ret = CAD_REJECT;
      }
      else if( dmdPos < evgMin || dmdPos > evgMax )
      {                                           /* argument out of limits */
        if (debug)
          errlogSevPrintf(errlogInfo, "parkVgatesCad: evg argument out of limits\n");
        sprintf(pcad->mess, "evg out of range: %3.1f - %3.1f",
                              evgMin, evgMax);
        ret = CAD_REJECT;
      }
      else             
      {                             /* valid east vent gate position demand */
        dmdPosEvg = dmdPos;
        ret = CAD_ACCEPT;
      }

      if (ret == CAD_ACCEPT)
      {
        dmdPos = strtod(pcad->c, NULL);       /* read wvg position argument  */
        dataType = checkBuffer (pcad->c);         /* check for valid data   */
        if (dataType == ALL_BLANKS || dataType == BAD_VALUE)
        {                                             /* data type invalid  */
          if (debug)
            errlogSevPrintf(errlogInfo, "parkVgatesCad: wvg has invalid data type from checkBuffer (%d)\n", (int) dataType);
          sprintf(pcad->mess,"wvg data type invalid: %d", (int) dataType);
          ret = CAD_REJECT;
        }
        else if( dmdPos < wvgMin || dmdPos > wvgMax )
        {                                         /* argument out of limits */
          if (debug)
            errlogSevPrintf(errlogInfo, "parkVgatesCad: wvg argument out of limits\n");
          sprintf(pcad->mess, "wvg out of range: %3.1f - %3.1f",
                               wvgMin, wvgMax);
          ret = CAD_REJECT;
        }
        else             
        {                           /* valid west vent gate position demand */
          dmdPosWvg = dmdPos;
          *(long *)pcad->vala = PARK;   /* Write evg PARK demand state out */
          *(long *)pcad->valc = PARK;   /* Write wvg PARK demand state out */
          *(double *)pcad->valb = dmdPosEvg;    /* Write evg demand pos out */
          *(double *)pcad->vald = dmdPosWvg;    /* Write wvg demand pos out */
          if (debug)
            errlogSevPrintf(errlogInfo, "parkVgatesCad: ACCEPTED percent open: evg = %f, wvg = %f\n",
                          dmdPosEvg, dmdPosWvg );
          ret = CAD_ACCEPT;
        }
      }
      break;

    case menuDirectiveSTART:
      if (debug)
        errlogSevPrintf(errlogInfo, "parkVgatesCad: ACCEPTED parkVgates command\n");
      ret = CAD_ACCEPT;
      break;

    case menuDirectiveSTOP:
      ret = CAD_ACCEPT;
      break;

    default:
      if (debug)
        errlogSevPrintf(errlogInfo, "parkVgatesCad: invalid CAD directive\n");
      sprintf(pcad->mess, "invalid CAD directive");
      ret = CAD_REJECT;
      break;
  }

  return ret;
}


/* *INDENT-OFF* */
/*+
 *   Function name:
 *   rebootCAD
 *
 *   Purpose:
 *   Reboot the ECS IOC and thereby also initialise the database.
 *
 *   Description:
 *   This routine is tied to the reboot CAD record. It has no arguments.
 *    
 *    
 *
 *   Invocation:
 *   rebootCAD (pcad)
 *
 *   Parameters: (">" input, "!" modified, "<" output)  
 *      (!)   pcad   (struct cadRecord*)  Pointer to cad record structure
 *
 *   EPICS Input fields :
 *
 *   a => Current ECS debug level
 *
 *   EPICS Output fields :
 *
 *   n/a
 *
 *   Function value:
 *   (<)  status  (long) Return status, 0 = OK (command accepted)
 * 
 *   External functions:
 *
 *
 *-
 */
/* *INDENT-ON* */



long rebootCAD( struct cadRecord *pcad )
{
  long ret = CAD_ACCEPT;
  long debug;
  long interlockType;
  char interlockMess[40];

  debug = atoi(pcad->a);

      /* Check for interlocks */
  if (pcad->dir != menuDirectiveCLEAR)
  {
    interlockType = ecsInterlocked (interlockMess);
      if (interlockType == INTRLK_NORUN)
      {
        strcpy (pcad->mess, interlockMess);
        return CAD_REJECT ;
      }
  }

  switch( pcad->dir )
  {
    case menuDirectiveMARK:
      ret = CAD_ACCEPT;
      break;

    case menuDirectiveCLEAR:
      ret = CAD_ACCEPT;
      break;

    case menuDirectivePRESET:
      ret = CAD_ACCEPT;
      break;

    case menuDirectiveSTART:
      if( debug )
        errlogSevPrintf(errlogInfo, "rebootCAD: Accepted\n");
      ret = CAD_ACCEPT;
      break;

    case menuDirectiveSTOP:
      ret = CAD_ACCEPT;
      break;

    default:
      if (debug)
        errlogSevPrintf(errlogInfo, "rebootCAD: invalid CAD directive\n");
      ret = CAD_REJECT;
      break;
  }
  return ret;
}



/* *INDENT-OFF* */
/*+
 *   Function name:
 *   simulateCAD
 *
 *   Purpose:
 *   Set simulation level in ECS
 *
 *   Description:
 *   This routine is tied to the simulate CAD record. It checks the
 *   simulate level argument specified and if it is valid, presents 
 *   it as an output value. 
 *
 *   Invocation:
 *   simulateCAD (pcad)
 *
 *   Parameters: (">" input, "!" modified, "<" output)  
 *      (!)   pcad   (struct cadRecord*)  Pointer to cad record structure
 *
 *   EPICS Input fields :
 *
 *   a => ECS simulate level
 *   b => Current ECS debug level 
 *   c => Current activeC CAR state 
 *
 *   EPICS Output fields :
 *
 *   vala => ECS simulate level
 *
 *   Function value:
 *   (<)  status  (long) Return status, 0 = OK (command accepted)
 * 
 *   External functions:
 *
 *
 *-
 */
/* *INDENT-ON* */


long simulateCAD( struct cadRecord *pcad )
{
  long ret;              /* CAD return status                */
  long dataType;         /* returned value from checkBuffer  */
  long dmdState;         /* requested simulation level input */
  long debug;            /* current debug level              */
  long activeCAR;        /* current activeC CAR state        */
  long interlockType;
  char interlockMess[40];

  debug = atoi(pcad->b);                /* read current debug level argument */
  activeCAR = atoi(pcad->c);            /* read current activeC CAR state    */

  if (pcad->dir != menuDirectiveCLEAR)
  {
    interlockType = ecsInterlocked (interlockMess);
    if (interlockType == INTRLK_NORUN)               /* Check for interlocks */
    {
      strcpy (pcad->mess, interlockMess);
      return CAD_REJECT ;
    }
    else if (activeCAR == menuCarstatesBUSY)             /* Check for BUSY mechanisms */
    {
      if (debug)
        errlogSevPrintf(errlogInfo, "simulateCAD: Cannot change sim level with devices in motion");
      strcpy (pcad->mess, "Cannot change sim while activeC BUSY");
      return CAD_REJECT ;
    }
  }

  switch( pcad->dir )                                  /* read CAD directive */
  {
    case menuDirectiveMARK:
      ret = CAD_ACCEPT;
      break;

    case menuDirectiveCLEAR:
      strcpy(pcad->a, " ");
      db_post_events( pcad, &pcad->a, 1 );   /* clear simulation level input */
      ret = CAD_ACCEPT;
      break;

    case menuDirectivePRESET:
      dmdState = atoi(pcad->a);            /* read simulation level argument */
      dataType = checkBuffer (pcad->a);
      if (dataType != SHORT_INTEGER)
      {                                           /* argument is not integer */
        if (debug)
          errlogSevPrintf(errlogInfo, "simulateCAD: data type from checkBuffer invalid - type %d \n",
                               (int) dataType);
        sprintf(pcad->mess,"Mode data type invalid: %d", (int) dataType);
        ret = CAD_REJECT;
      }
      else if (dmdState < SIMM_NONE || dmdState > SIMM_FULL)
      {                                         /* argument is out of limits */
        sprintf(pcad->mess, "Argument not NONE, VSM, FAST or FULL");
        ret = CAD_REJECT;
      }
      else
      {                                /* argument is valid, write to output */
        *(long *)pcad->vala = dmdState;
        if (debug)
          errlogSevPrintf(errlogInfo, "simulateCAD: ACCEPTED sim level = %d\n", (int) dmdState );
        ret = CAD_ACCEPT;
      }
      break;

    case menuDirectiveSTART:
      ret = CAD_ACCEPT;
      break;

    case menuDirectiveSTOP:
      ret = CAD_ACCEPT;
      break;

    default:
      if (debug)
        errlogSevPrintf(errlogInfo, "simulateCAD: invalid CAD directive\n");
      ret = CAD_REJECT;
      break;
  }
  return ret;
}



/* *INDENT-OFF* */
/*+
 *   Function name:
 *   stopDomeCad
 *
 *   Purpose:
 *   Implement the stopDome CAD for stopping motion of the dome in the ECS.
 *
 *   Description:
 *   This routine is tied to the stopDome CAD record. It has no arguments
 *   other than the current debug level. If it receives a vaild directive
 *   it presents the STOP demand state as an output value. 
 *
 *   Invocation:
 *   stopDomeCad (pcad)
 *
 *   Parameters: (">" input, "!" modified, "<" output)  
 *      (!)   pcad   (struct cadRecord*)  Pointer to cad record structure
 *
 *   EPICS Input fields :
 *
 *   a => Current debug level
 *   b => azimuth demand
 *
 *   EPICS Output fields :
 *
 *   vala => move dome demand state
 *
 *   Function value:
 *   (<)  status  (long) Return status, 0 = OK (command accepted)
 * 
 *   External functions:
 *
 *   Deficiencies:
 *   - debug only uses two levels (debugging off for NONE and
 *     on for MIN or FULL
 *
 *-
 */
/* *INDENT-ON* */

long stopDomeCad( struct cadRecord *pcad )
{
  long   ret;           /* CAD return status                */
  long   debug;         /* debug level                      */
  long interlockType;
  char interlockMess[40];

        
  debug   = atoi(pcad->a);             /* read current debug level argument */


      /* Check for interlocks */
  if (pcad->dir != menuDirectiveCLEAR)
  {
    interlockType = ecsInterlocked (interlockMess);
    if (interlockType == INTRLK_MOTION || 
            interlockType == INTRLK_GLOBAL ||
                  interlockType == INTRLK_NORUN)
    {
      strcpy (pcad->mess, interlockMess);
      return CAD_REJECT ;
    }
  }
  switch( pcad->dir )                                 /* read CAD directive */
  {
    case menuDirectiveMARK:
      ret = CAD_ACCEPT;
      break;

    case menuDirectiveCLEAR:
      ret = CAD_ACCEPT;
      break;

    case menuDirectivePRESET:
      *(long *)pcad->vala = STOP;            /* Write STOP demand state out */
      ret = CAD_ACCEPT;
      break;

    case menuDirectiveSTART:
      if (debug)
        errlogSevPrintf(errlogInfo, "stopDomeCad: ACCEPTED stopDome Command\n");
      ret = CAD_ACCEPT;
      break;

    case menuDirectiveSTOP:
      ret = CAD_ACCEPT;
      break;

    default:
      if (debug)
        errlogSevPrintf(errlogInfo, "stopDomeCad: invalid CAD directive\n");
      sprintf(pcad->mess, "invalid CAD directive");
      ret = CAD_REJECT;
      break;
  }

  return ret;
}



/* *INDENT-OFF* */
/*+
 *   Function name:
 *   stopShtrsCad
 *
 *   Purpose:
 *   Implement the stopShtrs CAD for stopping the shutters.
 *
 *   Description:
 *   This routine is tied to the stopShtrs CAD record. It has no arguments
 *   other than the current debug level. If it receives a valid directive
 *   it presents the STOP demand states as an output values. 
 *
 *   Invocation:
 *   stopShtrsCad (pcad)
 *
 *   Parameters: (">" input, "!" modified, "<" output)  
 *      (!)   pcad   (struct cadRecord*)  Pointer to cad record structure
 *
 *   EPICS Input fields :
 *
 *   a => Current debug level
 *
 *   EPICS Output fields :
 *
 *   vala => stop top shutter demand state
 *   valb => stop bottom shutter demand state
 *
 *   Function value:
 *   (<)  status  (long) Return status, 0 = OK (command accepted)
 * 
 *   External functions:
 *
 *   Deficiencies:
 *   - debug only uses two levels (debugging off for NONE and
 *     on for MIN or FULL)
 *-
 */
/* *INDENT-ON* */

long stopShtrsCad( struct cadRecord *pcad )
{
  long   ret;                           /* CAD return status                */
  long   debug;                         /* debug level                      */
  long interlockType;
  char interlockMess[40];
        
  debug   = atoi(pcad->a);             /* read current debug level argument */

      /* Check for interlocks */
  if (pcad->dir != menuDirectiveCLEAR)
  {
    interlockType = ecsInterlocked (interlockMess);
    if (interlockType == INTRLK_MOTION || 
            interlockType == INTRLK_GLOBAL ||
                  interlockType == INTRLK_NORUN)
    {
      strcpy (pcad->mess, interlockMess);
      return CAD_REJECT ;
    }
  }
  switch( pcad->dir )                                 /* read CAD directive */
  {
    case menuDirectiveMARK:
      ret = CAD_ACCEPT;
      break;

    case menuDirectiveCLEAR:
      ret = CAD_ACCEPT;
      break;

    case menuDirectivePRESET:
       *(long *)pcad->vala = STOP;        /* Write ts STOP demand state out */
       *(long *)pcad->valc = STOP;        /* Write bs STOP demand state out */
       ret = CAD_ACCEPT;
       break;

    case menuDirectiveSTART:
      if (debug)
        errlogSevPrintf(errlogInfo, "stopShtrsCad: ACCEPTED stopShtrs command\n");
      ret = CAD_ACCEPT;
      break;

    case menuDirectiveSTOP:
      ret = CAD_ACCEPT;
      break;

    default:
      if (debug)
        errlogSevPrintf(errlogInfo, "stopShtrsCad: invalid CAD directive\n");
      sprintf(pcad->mess, "invalid CAD directive");
      ret = CAD_REJECT;
      break;
  }

  return ret;
}


/* *INDENT-OFF* */
/*+
 *   Function name:
 *   stopVgatesCad
 *
 *   Purpose:
 *   Implement the stopVgates CAD for stopping the vent gates.
 *
 *   Description:
 *   This routine is tied to the stopVgates CAD record. It has no arguments
 *   other than the current debug level. If it receives a valid directive
 *   it presents the STOP demand states as an output values. 
 *
 *   Invocation:
 *   stopVgatesCad (pcad)
 *
 *   Parameters: (">" input, "!" modified, "<" output)  
 *      (!)   pcad   (struct cadRecord*)  Pointer to cad record structure
 *
 *   EPICS Input fields :
 *
 *   a => Current debug level
 *
 *   EPICS Output fields :
 *
 *   vala => move east vent gate demand state
 *   valb => move west vent gate demand state
 *
 *   Function value:
 *   (<)  status  (long) Return status, 0 = OK (command accepted)
 * 
 *   External functions:
 *
 *   Deficiencies:
 *   - debug only uses two levels (debugging off for NONE and
 *     on for MIN or FULL)
 *   
 *-
 */
/* *INDENT-ON* */

long stopVgatesCad( struct cadRecord *pcad )
{
  long   ret;                         /* CAD return status                  */
  long   debug;                       /* debug level                        */
  long interlockType;
  char interlockMess[40];
        
  debug   = atoi(pcad->a);             /* read current debug level argument */

      /* Check for interlocks */
  if (pcad->dir != menuDirectiveCLEAR)
  {
    interlockType = ecsInterlocked (interlockMess);
    if (interlockType == INTRLK_MOTION || 
            interlockType == INTRLK_GLOBAL ||
                  interlockType == INTRLK_NORUN)
    {
      strcpy (pcad->mess, interlockMess);
      return CAD_REJECT ;
    }
  }
  switch( pcad->dir )                                 /* read CAD directive */
  {
    case menuDirectiveMARK:
      ret = CAD_ACCEPT;
      break;

    case menuDirectiveCLEAR:
      ret = CAD_ACCEPT;
      break;

    case menuDirectivePRESET:
      *(long *)pcad->vala = STOP;   /* Write evg STOP demand state out */
      *(long *)pcad->valc = STOP;   /* Write wvg STOP demand state out */
      ret = CAD_ACCEPT;
      break;

    case menuDirectiveSTART:
      if (debug)
        errlogSevPrintf(errlogInfo, "stopVgatesCad: ACCEPTED stopVgates command\n");
      ret = CAD_ACCEPT;
      break;

    case menuDirectiveSTOP:
      ret = CAD_ACCEPT;
      break;

    default:
      if (debug)
        errlogSevPrintf(errlogInfo, "stopVgatesCad: invalid CAD directive\n");
      sprintf(pcad->mess, "invalid CAD directive");
      ret = CAD_REJECT;
      break;
  }

  return ret;
}


/* *INDENT-OFF* */
/*+
 *   Function name:
 *   testCAD
 *
 *   Purpose:
 *   Test the ECS hardware and software.
 *
 *   Description:
 *   This routine is tied to the test CAD record. 
 *    
 *    
 *
 *   Invocation:
 *   testCAD (pcad)
 *
 *   Parameters: (">" input, "!" modified, "<" output)  
 *      (!)   pcad   (struct cadRecord*)  Pointer to cad record structure
 *
 *   EPICS Input fields :
 *
 *   a => Current ECS debug level 
 *
 *   EPICS Output fields :
 *
 *   n/a
 *
 *   Function value:
 *   (<)  status  (long) Return status, 0 = OK (command accepted)
 * 
 *   External functions:
 *
 *
 *-
 */
/* *INDENT-ON* */



long testCAD( struct cadRecord *pcad )
{
  long ret = CAD_ACCEPT;
  long debug;
  long interlockType;
  char interlockMess[40];

  debug = atoi(pcad->a);

      /* Check for interlocks */
  if (pcad->dir != menuDirectiveCLEAR)
  {
    interlockType = ecsInterlocked (interlockMess);
      if (interlockType == INTRLK_NORUN)
      {
        strcpy (pcad->mess, interlockMess);
        return CAD_REJECT ;
      }
  }

  switch( pcad->dir )
  {
    case menuDirectiveMARK:
      ret = CAD_ACCEPT;
      break;

    case menuDirectiveCLEAR:
      ret = CAD_ACCEPT;
      break;

    case menuDirectivePRESET:
      ret = CAD_ACCEPT;
      break;

    case menuDirectiveSTART:
      if( debug )
        errlogSevPrintf(errlogInfo, "testCAD: ACCEPTED\n");
      ret = CAD_ACCEPT;
      break;

    case menuDirectiveSTOP:
      ret = CAD_ACCEPT;
      break;

    default:
      if (debug)
        errlogSevPrintf(errlogInfo, "testCAD: invalid CAD directive\n");
      ret = CAD_REJECT;
      break;
  }
  return ret;
}

/* *INDENT-OFF* */
/*+
 *   Function name:
 *   toleranceCAD
 *
 *   Purpose:
 *   Set error tolerance for azimuth and elevation demands in ECS.
 *
 *   Description:
 *   This routine is tied to the tolerance CAD record. It  checks the
 *   tolerance arguments specified for the ECS and if valid, presents
 *   them as output values. 
 *
 *   Invocation:
 *   toleranceCAD (pcad)
 *
 *   Parameters: (">" input, "!" modified, "<" output)  
 *      (!)   pcad   (struct cadRecord*)  Pointer to cad record structure
 *
 *   EPICS Input fields :
 *
 *   a => azimuth tolerance for dome positioning
 *   b => elevation tolerance for shutter positioning
 *   c => size tolerance for vent gate positioning
 *   d => Current ECS debug level 
 *   e => azimuth tolerance max limit
 *   f => azimuth tolerance min limit
 *   g => elevation tolerance max limit
 *   h => elevation tolerance min limit
 *   i => vent gate size tolerance max limit
 *   j => vent gate size tolerance min limit
 *
 *   EPICS Output fields :
 *
 *   vala => ECS azimuth tolerance
 *   valb => ECS elevation tolerance
 *   valc => ECS size tolerance
 *
 *   Function value:
 *   (<)  status  (long) Return status, 0 = OK (command accepted)
 * 
 *   External functions:
 *
 *
 *-
 */
/* *INDENT-ON* */

long toleranceCAD( struct cadRecord *pcad )
{
  long ret;           /* CAD return status                   */
  long dataTypeA;     /* 1st returned value from checkBuffer */
  long dataTypeB;     /* 2nd returned value from checkBuffer */
  long dataTypeC;     /* 3rd returned value from checkBuffer */
  double domeTol;     /* requested dome tolerance input      */
  double azTolMax;    /* azimuth tolerance max limit         */
  double azTolMin;    /* azimuth tolerance min limit         */
  double shtrsTol;    /* requested shutter tolerance input   */
  double elTolMax;    /* elevation tolerance max limit       */
  double elTolMin;    /* elevation tolerance min limit       */
  double vgTol;       /* requested vent gate tolerance input */
  double vgTolMax;    /* vent gate tolerance max limit       */
  double vgTolMin;    /* vent gate tolerance min limit       */
  long debug;         /* current debug level                 */
  long interlockType;
  char interlockMess[40];

  debug = atoi(pcad->d);                /* read current debug level argument */

      /* Check for interlocks */
  if (pcad->dir != menuDirectiveCLEAR)
  {
    interlockType = ecsInterlocked (interlockMess);
      if (interlockType == INTRLK_NORUN)
      {
        strcpy (pcad->mess, interlockMess);
        return CAD_REJECT ;
      }
  }

  switch( pcad->dir )                                  /* read CAD directive */
  {
    case menuDirectiveMARK:
      ret = CAD_ACCEPT;
      break;

    case menuDirectiveCLEAR:
      strcpy(pcad->a, " ");
      db_post_events( pcad, &pcad->a, 1 );
      strcpy(pcad->b, " ");
      db_post_events( pcad, &pcad->b, 1 );
      strcpy(pcad->c, " ");
      db_post_events( pcad, &pcad->c, 1 );
      ret = CAD_ACCEPT;
      break;

    case menuDirectivePRESET:
      azTolMax = strtod(pcad->e, NULL);      /* read dome tolerance max lim  */
      azTolMin = strtod(pcad->f, NULL);      /* read dome tolerance min lim  */
      domeTol = strtod(pcad->a, NULL);       /* read dome tolerance argument */
      dataTypeA = checkBuffer (pcad->a);
      if (dataTypeA == BAD_VALUE)
      {                                               /* argument is invalid */
        if (debug)
          errlogSevPrintf(errlogInfo, "toleranceCAD: invalid data type from checkBuffer (%d) \n",
                                 (int) dataTypeA);
        sprintf(pcad->mess,"domeTol data type invalid: %d", (int) dataTypeA);
        ret = CAD_REJECT;
      }
      else if (domeTol < azTolMin || domeTol > azTolMax )
      {                                  /* dome argument is out of limits */
        sprintf(pcad->mess,
                          "Az.Tol. out of range: %3.1f - %3.1f",
                          azTolMin, azTolMax);
        ret = CAD_REJECT;
      }
      else
      {
        if (dataTypeA == ALL_BLANKS)
        {                                               /* argument is blank */
          if (debug)
            errlogSevPrintf(errlogInfo, "toleranceCAD: domeTol argument blank\n");
        }
        else
        {                                               /* argument is valid */
          *(double *)pcad->vala = domeTol;
          if (debug)
            errlogSevPrintf(errlogInfo, "toleranceCAD: ACCEPTED domeTol = %f\n", domeTol );
        }
        ret = CAD_ACCEPT;
      }

      if (ret == CAD_ACCEPT)
      {               /* first argument is either a valid tolerance or blank */
        elTolMax = strtod(pcad->g, NULL); /* read shutter tolerance max lim  */
        elTolMin = strtod(pcad->h, NULL); /* read shutter tolerance min lim  */
        shtrsTol = strtod(pcad->b, NULL); /* read shutter tolerance argument */
        dataTypeB = checkBuffer (pcad->b);                /* check data type */
        if (dataTypeB == BAD_VALUE)
        {                                            /* data type is invalid */
          if (debug)
            errlogSevPrintf(errlogInfo, "toleranceCAD: invalid data type from checkBuffer (%d)\n",
                                    (int) dataTypeB);
          sprintf(pcad->mess,"shtrsTol data type invalid: %d", (int) dataTypeB);
          ret = CAD_REJECT;
        }
        else if (shtrsTol < elTolMin || shtrsTol > elTolMax )
        {                              /* shutters argument is out of limits */
          sprintf(pcad->mess, "El.Tol. out of range: %3.1f - %3.1f", elTolMin,
                                    elTolMax);
          ret = CAD_REJECT;
        }
        else
        {
          if (dataTypeB == ALL_BLANKS)
          {                                             /* argument is blank */
            if (debug)
              errlogSevPrintf(errlogInfo, "toleranceCAD: shtrsTol argument blank\n");
          }
          else
          {                                             /* argument is valid */
            *(double *)pcad->valb = shtrsTol;
            if (debug)
              errlogSevPrintf(errlogInfo, "toleranceCAD: ACCEPTED shtrsTol = %f\n", shtrsTol );
          }
          ret = CAD_ACCEPT;
        }
      }

      if (ret == CAD_ACCEPT)
      {            /* first two arguments either a valid tolerances or blank */
        vgTolMax = strtod(pcad->i, NULL);    /* read vent gate tol. max lim  */
        vgTolMin = strtod(pcad->j, NULL);    /* read vent gate tol. min lim  */
        vgTol = strtod(pcad->c, NULL);  /* read vent gate tolerance argument */
        dataTypeC = checkBuffer (pcad->c);                /* check data type */
        if (dataTypeC == BAD_VALUE)
        {                                            /* data type is invalid */
          if (debug)
            errlogSevPrintf(errlogInfo, "toleranceCAD: invalid data type from checkBuffer (%d)\n",
                                    (int) dataTypeC);
          sprintf(pcad->mess,"vgTol data type invalid: %d", (int) dataTypeC);
          ret = CAD_REJECT;
        }
        else if (vgTol < vgTolMin || vgTol > vgTolMax )
        {                             /* vent gate argument is out of limits */
          sprintf(pcad->mess, "Size Tol. out of range: %3.1f - %3.1f",
                           vgTolMin, vgTolMax);
          ret = CAD_REJECT;
        }
        else
        {
          if (dataTypeC == ALL_BLANKS)
          {                                             /* argument is blank */
            if (debug)
              errlogSevPrintf(errlogInfo, "toleranceCAD: vgTol argument blank\n");
          }
          else
          {                                             /* argument is valid */
            *(double *)pcad->valc = vgTol;
            if (debug)
              errlogSevPrintf(errlogInfo, "toleranceCAD: ACCEPTED sztol = %f\n", vgTol );
          }
          ret = CAD_ACCEPT;
        }
      }

      if (ret == CAD_ACCEPT && dataTypeA == ALL_BLANKS &&
                               dataTypeB == ALL_BLANKS && 
                               dataTypeC == ALL_BLANKS)
      {                                            /* all argument are blank */
        if (debug)
            errlogSevPrintf(errlogInfo, "toleranceCAD: requires at least one argument\n");
        sprintf(pcad->mess,"Requires at least one tolerance argument");
        ret = CAD_REJECT;
      }

      break;

    case menuDirectiveSTART:
      ret = CAD_ACCEPT;
      break;

    case menuDirectiveSTOP:
      ret = CAD_ACCEPT;
      break;

    default:
      if (debug)
        errlogSevPrintf(errlogInfo, "toleranceCAD: invalid CAD directive\n");
      ret = CAD_REJECT;
      break;
  }
  return ret;
}

/* *INDENT-OFF* */
/*+
 *   Function name:
 *   deiceLoginCad
 *
 *   Purpose:
 *
 *   Description:
 *
 *   Deficiencies:
 *
 *   Invocation:
 *   deiceLoginCad (pcad)
 *
 *   Parameters: (">" input, "!" modified, "<" output)  
 *   (!) pcad (struct cadRecord*)   Pointer to cad record structure
 *
 *   EPICS Input fields :
 *   b => login flag (not used)
 *   c => pcu2 on flag (not used)
 *   d => power on flag (not used)
 *   e => move cw flag (not used)
 *   f => move ccw flag (not used)
 *   g => pcu2 key word
 *   h => login pasword
 *
 *   EPICS Output fields :
 *   vala => login flag (long)
 *
 *   Function value:
 *   (<)  status  (long) Return status, 0 = OK (command accepted)
 * 
 *   External functions:
 *-
 */
/* *INDENT-ON* */

long deiceLoginCad (struct cadRecord *pcad)
{
    long	debug, ret;
    static long login = 0;	/* log out */

    debug = atoi (DEICE_DEBUG);

    switch (pcad->dir) {

	case menuDirectiveCLEAR:
	    strcpy (DEICE_MODE,     "");
	    strcpy (DEICE_PCU2,     "");
	    strcpy (DEICE_POWER,    "");
	    strcpy (DEICE_CW,       "");
	    strcpy (DEICE_CCW,      "");
	    strcpy (DEICE_KEY,      "");
	    strcpy (DEICE_PASSWORD, "");
	    ret = CAD_ACCEPT;
	    break;

	case menuDirectiveMARK:
	    ret = CAD_ACCEPT;
	    break;

	case menuDirectivePRESET:
	    if (debug)
		deiceDumpArgs (pcad);

	    if (DEICE_MODE_ON) {	/* log in */
	        if (DEICE_KEY_ON) {
		    strcpy (pcad->mess, "PCU2 key not in off position");
		    ret = CAD_REJECT;
		} else if (/* strcmp (DEICE_PASSWORD, "gemini") != 0 */ 1) {
		    strcpy (pcad->mess, "Illegal password");
		    ret = CAD_REJECT;
		} else {
		    login = 1;
		    ret = CAD_ACCEPT;
		}
	    } else {			/* logout */
		if (DEICE_MOVING) {
		    strcpy (pcad->mess,
			"Must stop motion first");
		    ret = CAD_REJECT;
		} else if (DEICE_POWER_ON) {
		    strcpy (pcad->mess,
			"Must turn power off first");
		    ret = CAD_REJECT;
		} else if (DEICE_PCU2_ON) {
		    strcpy (pcad->mess,
			"Must turn PCU off first");
		    ret = CAD_REJECT;
		} else {
		    login = 0;
		    ret = CAD_ACCEPT;
		}
	    }
	    break;

	case menuDirectiveSTART:
	    DEICE_OUT1 = login;
	    ret = CAD_ACCEPT;
	    break;

	case menuDirectiveSTOP:
	    ret = CAD_ACCEPT;
	    break;

	default:
	    if (debug)
		errlogSevPrintf(errlogInfo, "deiceLoginCad: invalid CAD directive\n");
	    ret = CAD_REJECT;
	    break;
    }

    return ret;
}

/* *INDENT-OFF* */
/*+
 *   Function name:
 *   deicePcu2Cad
 *
 *   Purpose:
 *
 *   Description:
 *
 *   Deficiencies:
 *
 *   Invocation:
 *   deicePcu2Cad (pcad)
 *
 *   Parameters: (">" input, "!" modified, "<" output)  
 *   (!) pcad (struct cadRecord*)   Pointer to cad record structure
 *
 *   EPICS Input fields :
 *   b => login flag (not used)
 *   c => pcu2 on flag (not used)
 *   d => power on flag (not used)
 *   e => move cw flag (not used)
 *   f => move ccw flag (not used)
 *   g => pcu2 key word
 *
 *   EPICS Output fields :
 *   vala => login flag (long)
 *
 *   Function value:
 *   (<)  status  (long) Return status, 0 = OK (command accepted)
 * 
 *   External functions:
 *-
 */
/* *INDENT-ON* */

long deicePcu2Cad (struct cadRecord *pcad)
{
    long debug, ret;
    static long pcu2 = 0;	/* off */

    debug = atoi (DEICE_DEBUG);

    switch (pcad->dir) {

	case menuDirectiveCLEAR:
	    strcpy (DEICE_MODE,     "");
	    strcpy (DEICE_PCU2,     "");
	    strcpy (DEICE_POWER,    "");
	    strcpy (DEICE_CW,       "");
	    strcpy (DEICE_CCW,      "");
	    strcpy (DEICE_KEY,      "");
	    strcpy (DEICE_PASSWORD, "");
	    ret = CAD_ACCEPT;
	    break;

	case menuDirectiveMARK:
	    ret = CAD_ACCEPT;
	    break;

	case menuDirectivePRESET:
	    if (debug)
		deiceDumpArgs (pcad);

	    if (DEICE_MODE_ON) {
	        if (DEICE_KEY_ON) {
		    strcpy (pcad->mess, "PCU2 key not in off position");
		    ret = CAD_REJECT;
		} else if (DEICE_LOGIN_OFF) {
		    strcpy (pcad->mess, "Must log in first");
		    ret = CAD_REJECT;
		} else {
		    pcu2 = 1;
		    ret = CAD_ACCEPT;
		}
	    } else {
		if (DEICE_LOGIN_OFF) {
		    strcpy (pcad->mess, "Must log in first");
		    ret = CAD_REJECT;
		} else if (DEICE_MOVING) {
		    strcpy (pcad->mess,
			"Must stop motion first");
		    ret = CAD_REJECT;
		} else if (DEICE_POWER_ON) {
		    strcpy (pcad->mess,
			"Must turn power off first");
		    ret = CAD_REJECT;
		} else {
		    pcu2 = 0;
		    ret = CAD_ACCEPT;
		}
	    }
	    break;

	case menuDirectiveSTART:
	    DEICE_OUT1 = pcu2;
	    ret = CAD_ACCEPT;
	    break;

	case menuDirectiveSTOP:
	    ret = CAD_ACCEPT;
	    break;

	default:
	    if (debug)
		errlogSevPrintf(errlogInfo, "deicePcu2Cad: invalid CAD directive\n");
	    ret = CAD_REJECT;
	    break;
    }

    return ret;
}

/* *INDENT-OFF* */
/*+
 *   Function name:
 *   deicePowerCad
 *
 *   Purpose:
 *
 *   Description:
 *
 *   Deficiencies:
 *
 *   Invocation:
 *   deicePowerCad (pcad)
 *
 *   Parameters: (">" input, "!" modified, "<" output)  
 *   (!) pcad (struct cadRecord*)   Pointer to cad record structure
 *
 *   EPICS Input fields :
 *   a => login flag (not used)
 *   b => pcu2 on flag (not used)
 *   c => power on flag (not used)
 *   d => move cw flag (not used)
 *   f => move ccw flag (not used)
 *   g => pcu2 key word
 *
 *   EPICS Output fields :
 *   vala => login flag (long)
 *
 *   Function value:
 *   (<)  status  (long) Return status, 0 = OK (command accepted)
 * 
 *   External functions:
 *-
 */
/* *INDENT-ON* */

long deicePowerCad (struct cadRecord *pcad)
{
    long	debug, ret;
    static long	power = 0;	/* off */

    debug = atoi (DEICE_DEBUG);

    switch (pcad->dir) {

	case menuDirectiveCLEAR:
	    strcpy (DEICE_MODE,     "");
	    strcpy (DEICE_PCU2,     "");
	    strcpy (DEICE_POWER,    "");
	    strcpy (DEICE_CW,       "");
	    strcpy (DEICE_CCW,      "");
	    strcpy (DEICE_KEY,      "");
	    strcpy (DEICE_PASSWORD, "");
	    ret = CAD_ACCEPT;
	    break;

	case menuDirectiveMARK:
	    ret = CAD_ACCEPT;
	    break;

	case menuDirectivePRESET:
	    if (debug)
		deiceDumpArgs (pcad);

	    if (DEICE_MODE_ON) {
	        if (DEICE_KEY_ON) {
		    strcpy (pcad->mess, "PCU2 key not in off position");
		    ret = CAD_REJECT;
		} else if (DEICE_LOGIN_OFF) {
		    strcpy (pcad->mess, "Must log in first");
		    ret = CAD_REJECT;
		} else if (DEICE_PCU2_OFF) {
		    strcpy (pcad->mess, "PCU must be enabled first");
		    ret = CAD_REJECT;
		} else {
		    power = 1;
		    ret   = CAD_ACCEPT;
		}
	    } else {
		if (DEICE_LOGIN_OFF) {
		    strcpy (pcad->mess, "Must log in first");
		    ret = CAD_REJECT;
		} else if (DEICE_MOVING) {
		    strcpy (pcad->mess, "Must stop motion first");
		    ret = CAD_REJECT;
		} else {
		    power = 0;
		    ret   = CAD_ACCEPT;
		}
	    }
	    break;

	case menuDirectiveSTART:
	    DEICE_OUT1 = power;
	    ret = CAD_ACCEPT;
	    break;

	case menuDirectiveSTOP:
	    ret = CAD_ACCEPT;
	    break;

	default:
	    if (debug)
		errlogSevPrintf(errlogInfo, "deicePowerCad: invalid CAD directive\n");
	    ret = CAD_REJECT;
	    break;
    }

    return ret;
}

/* *INDENT-OFF* */
/*+
 *   Function name:
 *   deiceMoveCad
 *
 *   Purpose:
 *
 *   Description:
 *
 *   Deficiencies:
 *
 *   Invocation:
 *   deiceMoveCad (pcad)
 *
 *   Parameters: (">" input, "!" modified, "<" output)  
 *   (!) pcad (struct cadRecord*)   Pointer to cad record structure
 *
 *   EPICS Input fields :
 *   a => login flag (not used)
 *   b => pcu2 on flag (not used)
 *   c => power on flag (not used)
 *   d => move cw flag (not used)
 *   f => move ccw flag (not used)
 *   g => pcu2 key word
 *
 *   EPICS Output fields :
 *   vala => login flag (long)
 *
 *   Function value:
 *   (<)  status  (long) Return status, 0 = OK (command accepted)
 * 
 *   External functions:
 *-
 */
/* *INDENT-ON* */

long deiceMoveCad (struct cadRecord *pcad)
{
    long	debug, ret;
    static long	cw  = 0;
    static long	ccw = 0;

    debug = atoi (DEICE_DEBUG);

    switch (pcad->dir) {

	case menuDirectiveCLEAR:
	    strcpy (DEICE_MODE,     "");
	    strcpy (DEICE_PCU2,     "");
	    strcpy (DEICE_POWER,    "");
	    strcpy (DEICE_CW,       "");
	    strcpy (DEICE_CCW,      "");
	    strcpy (DEICE_KEY,      "");
	    strcpy (DEICE_PASSWORD, "");
	    ret = CAD_ACCEPT;
	    break;

	case menuDirectiveMARK:
	    ret = CAD_ACCEPT;
	    break;

	case menuDirectivePRESET:
	    if (debug)
		deiceDumpArgs (pcad);

	    if (DEICE_MODE_CW || DEICE_MODE_CCW) {    /* move */
printf ("move\n");
	        if (DEICE_KEY_ON) {
		    strcpy (pcad->mess, "PCU2 key not in off position");
		    ret = CAD_REJECT;
		} else if (DEICE_LOGIN_OFF) {
		    strcpy (pcad->mess, "Must log in first");
		    ret = CAD_REJECT;
		} else if (DEICE_PCU2_OFF) {
		    strcpy (pcad->mess, "PCU must be enabled first");
		    ret = CAD_REJECT;
		} else if (DEICE_POWER_OFF) {
		    strcpy (pcad->mess, "Power must be on first");
		    ret = CAD_REJECT;
		} else
		    ret = CAD_ACCEPT;
	    } else {			/* stop */
		if (DEICE_LOGIN_OFF) {
		    strcpy (pcad->mess, "Must log in first");
		    ret = CAD_REJECT;
		} else
		    ret = CAD_ACCEPT;
	    }
	    if (ret == CAD_ACCEPT) {
		if (DEICE_MODE_CW) {
printf ("cw\n");
		    cw  = 1;
		    ccw = 0;
		} else if (DEICE_MODE_CCW) {
printf ("ccw\n");
		    cw  = 0;
		    ccw = 1;
		} else {	/* stop */
printf ("stop\n");
		    cw  = 0;
		    ccw = 0;
		}
	    }
	    break;

	case menuDirectiveSTART:
	    DEICE_OUT1 = cw;
	    DEICE_OUT2 = ccw;
	    ret = CAD_ACCEPT;
	    break;

	case menuDirectiveSTOP:
	    ret = CAD_ACCEPT;
	    break;

	default:
	    if (debug)
		errlogSevPrintf(errlogInfo, "deiceMoveCad: invalid CAD directive\n");
	    ret = CAD_REJECT;
	    break;
    }

    return ret;
}

static void deiceDumpArgs (struct cadRecord *pcad)
{
    printf ("------------------------------------------------\n");
    printf ("a=(%s), b=(%s), c=(%s), d=(%s), e=(%s)\n",
	    pcad->a, pcad->b, pcad->c, pcad->d, pcad->e);
    printf ("f=(%s), g=(%s), h=(%s), t=(%s)\n",
	    pcad->f, pcad->g, pcad->h, pcad->t);
    printf ("------------------------------------------------\n");
}
epicsRegisterFunction(datumCAD);
epicsRegisterFunction(debugCAD);
epicsRegisterFunction(initCAD);
epicsRegisterFunction(logCAD);
epicsRegisterFunction(moveDomeCad);
epicsRegisterFunction(moveShtrsCad);
epicsRegisterFunction(moveVgatesCad);
epicsRegisterFunction(parkCAD);
epicsRegisterFunction(parkDomeCad);
epicsRegisterFunction(parkShtrsCad);
epicsRegisterFunction(parkVgatesCad);
epicsRegisterFunction(rebootCAD);
epicsRegisterFunction(simulateCAD);
epicsRegisterFunction(stopDomeCad);
epicsRegisterFunction(stopShtrsCad);
epicsRegisterFunction(stopVgatesCad);
epicsRegisterFunction(testCAD);
epicsRegisterFunction(toleranceCAD);
epicsRegisterFunction(deiceLoginCad);
epicsRegisterFunction(deiceMoveCad);
epicsRegisterFunction(deicePcu2Cad);
epicsRegisterFunction(deicePowerCad);
