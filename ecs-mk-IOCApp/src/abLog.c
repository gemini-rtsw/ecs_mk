/* Routines for logging Allen Bradley serial communications traffic */

#include <epicsStdlib.h>
#include <epicsThread.h>
#include <errlog.h>
#include <stdlib.h>
#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>



#define AB_DEBUG_ON  2
#define AB_DEBUG_OFF 0
#define FILE_MODE    0644

#ifndef STATUS
#define STATUS int
#endif

/* global AB debug control variable */
extern long drvAbDf1Debug;


static int fd;

/* turn on AB logging */
STATUS abLogOn (void) {
  long status;

  /* remove old log file */
  errlogSevPrintf(errlogInfo, "deleting old log file......");
  status = remove ("./data/ecs.log");
  if (status) {
    errlogSevPrintf(errlogInfo, "can not delete old log file\n");
    return status;
  }

  /* create a new log file */
  errlogSevPrintf(errlogInfo, "creating new log file......\n");
  fd = creat ("./data/ecs.log", O_WRONLY);
  if (!fd) {
    errlogSevPrintf(errlogInfo, "can not create new log file\n");
    return status;
  }

  /* point the logging system to this file */
  //logFdSet (fd); //TODO: This is not writing to a file yet, different logging system

  /* set AB debugging level */
  drvAbDf1Debug = AB_DEBUG_ON;

  errlogSevPrintf(errlogInfo, "Allen Bradley communications monitor active\n");

  /* and return */
  return (0);
}


/* turn off AB logging */
STATUS abLogOff (void) {
  long status = 0;

  /* clear debugging flag and reset log destination */
  drvAbDf1Debug = AB_DEBUG_OFF;
  //logFdSet(1);
  
  errlogSevPrintf(errlogInfo, "Allen Bradley communications monitor terminated\n");
 
  /* then close the log file */
  status = close (fd);
  if (status) errlogSevPrintf(errlogInfo, "can not close log file\n");

  /* and return */
  return status;
}


/* log AB traffic for a set time */
STATUS abSnapshot (float time) {
  long status;

  /* remove old log file */
  errlogSevPrintf(errlogInfo, "deleting old log file....../n");
  status = remove ("./data/ecs.log");
  if (status) {
    errlogSevPrintf(errlogInfo, "can not delete old log file\n");
    return status;
  }

  /* create a new log file */
  errlogSevPrintf(errlogInfo, "creating new log file......\n");
  fd = creat ("./data/ecs.log", O_WRONLY);
  if (!fd) {
    errlogSevPrintf(errlogInfo, "can not create new log file\n");
    return status;
  }

  /* point the logging system to this file */
  //logFdSet (fd);

  /* set AB debugging level */
  drvAbDf1Debug = AB_DEBUG_ON;

  errlogSevPrintf(errlogInfo, "Allen Bradley communications monitor active\n");

  /* wait the set length of time */
  epicsThreadSleep(time);

  /* clear debugging flag and reset log destination */
  drvAbDf1Debug = AB_DEBUG_OFF;
  //logFdSet(1);
  
  errlogSevPrintf(errlogInfo, "Allen Bradley communications monitor terminated\n");
 
  /* then close the log file */
  status = close (fd);
  if (status) errlogSevPrintf(errlogInfo, "can not close log file\n");

  /* and return */
  return status;
}
//TODO: Export this to shell, if it work under VxWorks

