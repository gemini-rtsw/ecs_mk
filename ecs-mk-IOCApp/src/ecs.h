/*
 *+
 * Module Name:
 *	ecs.h
 *
 * Description:
 *	Header file for:
 *              ecCommands.c
 *              ecInterlocks.c
 *              ecMisc.c
 *
 *   09-JUL-97 Proto release
 *   15-AUG-97 Added VMOVE demand state
 *   20-AUG-97 Removed aperture, azimuth, azvel, ArrayS, TARRAYS, TLATE
 *             Remove FOLLOWING SIR state and FOLLOW demand state
 *             Added Wind Velocity Tolerance
 *   22-SEP-97 Added DEFAULT dome keyword to bottom of list and shifted up
 *   29-OCT-97 Added several mechanism demand states
 *   04-NOV-97 Minor cleanup in comments
 *   13-NOV-97 Reordered demand states to place VMOVE at the end
 *   26-NOV-97 Removed Mechanism Control States and Timeouts sections
 *   13-JAN-98 Added IOC states
 *   19-JAN-98 Added interlock types
 *   20-JAN-98 Added all includes for header files 
 *   18-FEB-98 Changed limits more vgates (from 0.0-1.0 to 0.0-100.0)
 *             and vgates tolerance (from 0.0-0.2 to 0.0-10.0)
 *             Changed demand initialise to reset to avoid confusion w/INIT
 *   02-MAR-98 Removed dome parameters from this file and implemented as nine
 *             additional ao records onto the dome CAD
 *             Removed shutter params (that were not actually being used)
 *             Removed vent gate parameters from this file and implemented as 
 *             six additional ao records onto the vent gate CADs
 *   03-MAR-98 Removed tolerance command parameters from this file and
 *             implemented as six additional ao records onto the tolerance CAD
 *             Removed time of day definitions
 *             Added TH_SHUTDOWN definition
 *   05-MAR-98 Removed INTRLK_GLOBAL and added INTRLK_NONE, 
 *             Changed definitions for INTRLK_MOTION & INTRLK_THERMAL
 *             
 */

#include <epicsStdioRedirect.h>
#include <epicsStdlib.h>
#include <errlog.h>

#include <registryFunction.h>
#include <epicsExport.h>
#include <string.h>

#ifndef INCecsH
#define INCecsH

#define SZ_EPICS_STRING	40
#define WF_TIMEOUT              -1      /* timeout   */
#define WF_ERROR                -2      /* I/O error */


/* Debugging Levels */

#define DBG_NONE 0 /* system operates normally                               */
#define DBG_MIN  1 /* commentary of actions without serious perf degredation */
#define DBG_FULL 2 /* full commmentary and extensive checks                  */

/*
 * Debug macros
 */

#define DEBUG_MIN       (debug > DBG_NONE)
#define DEBUG_FULL      (debug > DBG_MIN)

/*
 * Health values.
 */

#define HEALTH_GOOD     0
#define HEALTH_WARNING  1
#define HEALTH_BAD      2
#define HEALTH_INVALID  3

/* Misc */

#define OFF     0
#define ON      1
#define FALSE   0
#define TRUE    1
#define DISABLE 0
#define ENABLE  1


/* Simulation Levels */

#define SIMM_NONE 0   /* system operates normally                           */
#define SIMM_VSM  1   /* virtual, command parse but no actions              */
#define SIMM_FAST 2   /* command parse with actions but not realistic times */
#define SIMM_FULL 3   /* as FAST but with realistic response times          */

/* Dome */

#define DEFAULT   0              /* Park Dome default position keyword      */
#define POSITION  1              /* Park Dome position entry keyword        */
#define ACCESS1   2              /* park dome access number one keyword     */
#define ACCESS2   3              /* park dome access number two keyword     */
#define ACCESS3   4              /* park dome access number three keyword   */

/* Shutters */


/* Vent Gates */


/* Mechanism Demand States Accepted by the ECSMOTOR Record*/

#define STOP        0        /* abort the current park, move or vmove       */
#define PARK        1        /* park mechanism and take servo offline       */
#define MOVE        2        /* move mechanism to the supplied position     */
#define RESET       3        /* initialise the motor record after an error  */
#define PAUSE       4        /* pause the current motor action              */
#define RESUME      5        /* resume the previously paused motor action   */
#define VMOVE       6        /* move the dome at the supplied velocity      */

/* Mechanism SIR States */

#define STOPPED     0           /* mechanism is stationary                  */
#define STOPPING    1           /* currently aborting a park, move or vmove */
#define MOVING      2           /* currently in a position or velocity move */
#define PARKING     3           /* on its way to a park position            */
#define SIR_OFFLINE 4           /* usually in a parked state when offline   */
#define SIR_ERROR   5           /* a servo error has occurred               */

/* Data types for CAD input checking */

#define ALL_BLANKS     1       /* all white space                           */
#define SHORT_INTEGER  2       /* short integer                             */
#define LONG_INTEGER   3       /* long integer                              */
#define FLOAT_VALUE    4       /* floating number                           */
#define DOUBLE_VALUE   5       /* double precision number                   */
#define BAD_VALUE      6       /* not fit any of previous 5 classifications */
#define STRTOL_BASE    10      /* number base of 10 for conversion          */

/* IOC states */

#define BOOTING      0 
#define INITIALISING 1
#define RUNNING      2

/* Interlock types */

#define INTRLK_NONE    0      /* no interlocks and IOC is RUNNING           */
#define INTRLK_NORUN   1      /* ECS IOC is not RUNNING                     */
#define INTRLK_MOTION  2      /* ECS motion systems are interlocked         */
#define INTRLK_THERMAL 3      /* ECS thermal systems are interlocked        */
#define INTRLK_GLOBAL  4      /* ECS systems are all interlocked            */

/* Health states */

#define GOOD_HEALTH                0
#define WARNING_HEALTH             1
#define BAD_HEALTH                 2
#define INVALID_HEALTH             3

/* General status */

#define OK		0
#define ERROR 	-1

#endif
