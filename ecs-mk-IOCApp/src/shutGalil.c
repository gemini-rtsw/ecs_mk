/*
 * Copyright 1996 Association of Universities for Research in Astronomy, Inc.
 * See the file COPYRIGHT for more details.
 *
 * FILENAME
 * shutGalil.c
 *
 * FUNCTION NAME(S)
 * Subroutine		- Brief description
 *
 *INDENT-OFF*
 * $Log: shutGalil.c,v $
 * Revision 1.3  2014/12/09 00:42:21  gemvx
 * Add VX_FP_TASK bit to the Galil task.
 *
 * Revision 1.2  2014/08/26 18:40:11  gemvx
 * Found a problem in galilRead.
 *
 * Revision 1.1  2014/08/22 02:10:12  gemvx
 * Added reading out Galil.
 *
 *INDENT-ON*
 */

#include "ecs.h"
#include "genSubRecord.h"
#include "epicsStdlib.h"
#include "epicsThread.h"
#include "dbFldTypes.h"
#include "dbEvent.h"
#include "dbScan.h"
#include "recSup.h"
#include "arpa/inet.h"
#include "sys/errno.h"
#include "sys/socket.h"
#include "unistd.h"
#include "strings.h"
#include "caeventmask.h"
#include "sys/types.h"
#include "netinet/in.h"
#include "netdb.h"
#include "signal.h"
#include "stdio.h"
#include "string.h"
#include "fcntl.h"
#include "errno.h"
#include "sys/time.h"
#include "stdlib.h"
#include "memory.h"
#include "ifaddrs.h"
#include "net/if.h"
#include "stdarg.h"
#include "recGbl.h"

/*
 * 
 * Decode output from Galil controller in the form of:
 * 
 * _RPX{F8},_TEX{F4},_TEY,_TEZ,_TEW,_TI{F3},C1{F8},_TTX{F1.1},_TTY,_TTZ,_TTW
 * 
 * Where:
 *  
 * _RPX                    = loop position setpoint, sign+ 8 characters 
 * _TEX, _TEY, TEZ, TEW    = axis position errors, sign+ 4 characters each 
 * _TI                     = command input 3 char 
 * C1                      = galil internal clock 8 char 
 * _TTX,  _TTY, _TTZ, _TTW =  torque setpoints of individual axis, format sign+ x.x
 * 
 * Some sample lines:
 * 
 * RPX......TEX..TEY..TEZ..TEW..TI..C1......TTX.TTY.TTZ.TTW.
 * 00000000 0000 0000 0000 0001 254 02655258 0.0 0.0 0.0 0.0 
 * -00003869-0022-0064 0007 0007 254 02656312-0.3-0.8 0.1 0.1 
 * -00014045-0034-0090 0009 0009 254 02657366-0.4-1.1 0.0 0.1
 * 
 * Note that the lines are field width delimited. The first character
 * is " " or "-" of each field, EXCEPT for the first field!!!
 * 
 */


/*
 * Input and output fields in the shutGalilProc routine.
 */

#define	IN_BUFFER		((char   *) (pgsub->a))
#define	IN_NBYTES		((long   *) (pgsub->f))
#define	IN_DISABLED		((long   *) (pgsub->l))
#define	IN_DEBUG		((long   *) (pgsub->u))
#define	OUT_RPX			((long   *) (pgsub->vala))	/* Loop position setpoint	*/
#define	OUT_TEX			((long   *) (pgsub->valb))	/* Axis position error in X	*/
#define	OUT_TEY			((long   *) (pgsub->valc))	/* Axis position error in Y	*/
#define	OUT_TEZ			((long   *) (pgsub->vald))	/* Axis position error in Z	*/
#define	OUT_TEW			((long   *) (pgsub->vale))	/* Axis position error in W	*/
#define	OUT_TI			((long   *) (pgsub->valf))	/* Command input		*/
#define	OUT_C1			((long   *) (pgsub->valg))	/* Galil internal clock		*/
#define	OUT_TTX			((double *) (pgsub->valh))	/* Torque setpoint in X		*/
#define	OUT_TTY			((double *) (pgsub->vali))	/* Torque setpoint in Y		*/
#define	OUT_TTZ			((double *) (pgsub->valj))	/* Torque setpoint in Z		*/
#define	OUT_TTW			((double *) (pgsub->valk))	/* Torque setpoint in W		*/ 
#define	OUT_ERRMSG		((char   *) (pgsub->vall))	/* Error message		*/
#define	OUT_HEALTH		((long   *) (pgsub->valm))	/* Error number			*/


/*
 *+
 * FUNCTION NAME:
 * shutGalilInit
 *
 * INVOCATION:
 * shutGalilInit (pgsub)
 *
 * PARAMETERS: (">" input, "!" modified, "<" output)
 * (>) pgsub (struct genSubRecord *)	gensub record pointer
 * 
 * FUNCTION VALUE:
 * (long)       Always zero
 *
 * PURPOSE:
 * Gather and process Galil data.
 *
 * DESCRIPTION:
 * This routine will process 
 *
 * EXTERNAL VARIABLES:
 * None
 *
 * PRIOR REQUIREMENTS:
 * God created the universe.
 *
 * DEFICIENCIES:
 * HA! You kidding?
 *-
 */

#define GALIL_TASK_PRI	3
// #define GALIL_TASK_OPT	(VX_SUPERVISOR_MODE | VX_UNBREAKABLE | VX_STDIO | VX_FP_TASK)

#define IPPORT_RESERVED		1024

//static int shutGalilTask(int ipaddr, int port, int fakeGenSubPointer);
static long shutGalilInit(struct genSubRecord *pgsub, int which);

typedef struct{ int ipaddr; int port; int pgsub; } thread_args;

static int shutGalilTask(thread_args *targs);
//static struct thread_args *targs; // = {int ipaddr, int port, int pgsub};


#define GALIL_TOP	1
#define GALIL_BOT	2

long shutGalilTopInit(struct genSubRecord *pgSub) { return shutGalilInit(pgSub, GALIL_TOP); } 
long shutGalilBotInit(struct genSubRecord *pgSub) { return shutGalilInit(pgSub, GALIL_BOT); }

static long shutGalilInit (struct genSubRecord *pgsub, int which)
{
    epicsThreadId tid;
    int ipaddr;
    int port;
    char *hostname;
    char *galiltask;
    thread_args *targs = malloc(sizeof(thread_args));

    switch(which) {
        case GALIL_BOT: port = atoi(getenv("shutGalilBotPort")), hostname = getenv("shutGalilBotHost"), galiltask = "GalilBot"; break;
        case GALIL_TOP: port = atoi(getenv("shutGalilTopPort")), hostname = getenv("shutGalilTopHost"), galiltask = "GalilTop"; break;
        default: printf("shutGalil init badly broke.\n"); return ERROR;
    }

    if (hostname == NULL || port < IPPORT_RESERVED) {
        printf("shutGalilInit: Hostname or port not defined for task \"%s\". Galil support disabled.\n", galiltask);
        return ERROR;
    }

    printf("shutGalil task %s using %s:%d\n", galiltask, hostname, port);

    if ((ipaddr = inet_addr(hostname)) == 0) {
     //   if ((ipaddr =  (int)gethostbyname(hostname)) == ERROR) {
            printf("shutGalil: Unknown host \"%s\"\n", hostname);
            return ERROR;
     //   }
    }

    targs->ipaddr = ipaddr;
    targs->port = port;
    targs->pgsub = (int)pgsub;
    if (!(tid = epicsThreadCreate( galiltask, GALIL_TASK_PRI, 10000,
	 (EPICSTHREADFUNC)shutGalilTask, (void *) targs))) {
        printf("shutGalil: Unable to spawn %s\n", galiltask);
        return ERROR;
    }

    return OK;

}

/*
 * Task to pull lines from Galil and pass them up to shutGalilProc and kick off
 * processing.
 */

static void galilRead(int *psd, int ipaddr, int port, char *buf);
static char *fmt = "%9ld%5ld%5ld%5ld%5ld%4ld%9ld%4lf%4lf%4lf%4lf";

#define NORM_LINE_LEN	58
#define MAX_LINE_LEN	124

//static int shutGalilTask(int ipaddr, int port, int p) {
static int shutGalilTask(thread_args *targs) {
    struct genSubRecord *pgsub = (genSubRecord *)targs->pgsub;
    int    sd = 0xdeadbeaf;	/* Make sure it starts out w/ garbage value */
    char   buf[MAX_LINE_LEN];
    int ipaddr = targs->ipaddr;
    int port = targs->port;

    if (!targs->pgsub) {
        printf("shutGalilTask genSubRecord pointer is NULL\n");
        return ERROR;
    }

    memset(buf, 0, sizeof(buf));

    while (1) {
        galilRead(&sd, ipaddr, port, buf);	/* Worries forever on sd, ipaddr, port until it gets data */ 
 
        recGblGetTimeStamp(pgsub);		/* Set timestamp.					  */

        if (*IN_DEBUG) {
            printf("shutGalil line: \"%s\"\n", buf);
        }

        if (sscanf(buf, fmt, OUT_RPX, OUT_TEX, OUT_TEY, OUT_TEZ,
            OUT_TEW, OUT_TI, OUT_C1, OUT_TTX, OUT_TTY, OUT_TTZ, OUT_TTW) == 11) {

            if (*IN_DEBUG) {
                printf("shutGalil values: %ld %ld %ld %ld %ld %ld %ld %f %f %f %f\n",
                    *OUT_RPX, *OUT_TEX, *OUT_TEY, *OUT_TEZ, *OUT_TEW,
                    *OUT_TI, *OUT_C1, *OUT_TTX, *OUT_TTY, *OUT_TTZ, *OUT_TTW);
            }

            *OUT_HEALTH = HEALTH_GOOD;
            strncpy (OUT_ERRMSG, "OK", SZ_EPICS_STRING);


            db_post_events(pgsub, OUT_RPX,    DBE_VALUE|DBE_LOG);
            db_post_events(pgsub, OUT_TEX,    DBE_VALUE|DBE_LOG);
            db_post_events(pgsub, OUT_TEY,    DBE_VALUE|DBE_LOG);
            db_post_events(pgsub, OUT_TEZ,    DBE_VALUE|DBE_LOG);
            db_post_events(pgsub, OUT_TEW,    DBE_VALUE|DBE_LOG);
            db_post_events(pgsub, OUT_TI,     DBE_VALUE|DBE_LOG);
            db_post_events(pgsub, OUT_C1,     DBE_VALUE|DBE_LOG);
            db_post_events(pgsub, OUT_TTX,    DBE_VALUE|DBE_LOG);
            db_post_events(pgsub, OUT_TTY,    DBE_VALUE|DBE_LOG);
            db_post_events(pgsub, OUT_TTZ,    DBE_VALUE|DBE_LOG);
            db_post_events(pgsub, OUT_TTW,    DBE_VALUE|DBE_LOG);
            db_post_events(pgsub, OUT_ERRMSG, DBE_VALUE|DBE_LOG);
            db_post_events(pgsub, OUT_HEALTH, DBE_VALUE|DBE_LOG);
        } else {
            *OUT_HEALTH = HEALTH_BAD;
            printf("shutGalil: parse error \"%s\"\n", buf);
            strncpy (OUT_ERRMSG, "Parse error", SZ_EPICS_STRING);
            db_post_events(pgsub, OUT_ERRMSG, DBE_VALUE|DBE_LOG);
            db_post_events(pgsub, OUT_HEALTH, DBE_VALUE|DBE_LOG);
        }
    }
}

/*
 * Reads from galil until it gets a "\n" terminated line. If it gets an error
 * it closes the socket and tries to open a new one. It will do this forever
 * until it gets a line.
 */

static void galilRead(int *psd, int ipaddr, int port, char *buf) {
    struct sockaddr_in sin;
    int sd = *psd;
    int len;


    if ((len = read(sd, buf, NORM_LINE_LEN - 2)) < 0) len = 0;
    buf[len] = '\0';

    while(len < (MAX_LINE_LEN - 1)) {
        /* Read in our line. If there is an error (such as the
         * first time this is run and sd is 0xdeadbeaf) reopen the socket.
         */
        if (read(sd, buf + len, 1) <= 0) {
            if (sd != 0xdeadbeaf)
                printf("shutGalilTask: read failed: 0x%x %d\n", ipaddr, port); 
            while(1) {
                int one = 1;
                close(sd); /* Ignore the error returned */
		rtems_task_wake_after( rtems_clock_get_ticks_per_second() * 5); /* Retry every 10 seconds */
                if ((*psd = sd = socket (AF_INET, SOCK_STREAM, 0)) == ERROR) continue; 
                setsockopt (sd, SOL_SOCKET, SO_KEEPALIVE, (char *) &one, sizeof (one)); 
                bzero ((char *) &sin, sizeof (sin));
                sin.sin_family      = AF_INET;
                sin.sin_addr.s_addr = htonl(ipaddr);
                sin.sin_port        = htons(port);

                if (connect (sd, (struct sockaddr *) &sin, sizeof (sin)) == ERROR) {
                    printf("shutGalil: Cannot connect to 0x%x %d\n", ipaddr, port);
                    continue;
                }
                break;
            }
            continue;
        }

        if (buf[len] == '\r') continue;
        if (buf[len] == '\n') break;
        buf[++len]   = '\0';
    }
}
epicsRegisterFunction(shutGalilTopInit);
epicsRegisterFunction(shutGalilBotInit);
