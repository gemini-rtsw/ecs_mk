
/*   Gemini Enclosure Control System
 *
 *   PLC moving device simulator 
 */

/*   version 1.0    wnr     gamma release       */

#include <epicsStdlib.h>
#include <epicsStdioRedirect.h>
#include <errlog.h>

#include <dbDefs.h>
#include <genSubRecord.h>
#include <dbCommon.h>
#include <recSup.h>
#include <registryFunction.h>
#include <epicsExport.h>


#define HSK_IN          *(long *)psr->a
#define POS_IN          *(long *)psr->b
#define VEL_IN          *(long *)psr->c
#define MAX_POS         *(long *)psr->d
#define MAX_VEL         *(long *)psr->e
#define PWR_TIME        *(long *)psr->f
#define CHK_TIME        *(long *)psr->g
#define STA_TIME        *(long *)psr->h
#define OFF_TIME        *(long *)psr->i
#define INITIAL_POS     *(long *)psr->j

#define HSK_OUT         *(long *)psr->vala
#define POS_OUT         *(long *)psr->valb
#define HSK_DISA        *(long *)psr->valc
#define POS_DISA        *(long *)psr->vald

#define PV_PWR_ACK      0x0001
#define PV_VEL_ACK      0x0002
#define PV_DRV_ACK      0x0004
#define PV_POS_ACK      0x0008
#define PV_IN_POS       0x0010
#define PV_PWR          0x0020
#define PV_NEW_POS      0x0040
#define PV_DRV          0x0080
#define PV_NEW_VEL      0x0100

#define P_PWR_ACK       0x0001
#define P_DRV_ACK       0x0002
#define P_POS_ACK       0x0004
#define P_IN_POS        0x0008
#define P_PWR           0x0010
#define P_DRV           0x0020
#define P_NEW_POS       0x0040

#define POS_MODE_VEL    100
#define SCAN_RATE       5
#define POS_MODE        0
#define VEL_MODE        1
#define INIT_MODE       2


long ecsPosDevInit (struct genSubRecord *psr);
long ecsPosVelDevInit (struct genSubRecord *psr);
long ecsPosDevProcess (struct genSubRecord *psr);
long ecsPosVelDevProcess (struct genSubRecord *psr);
static long writeHandshake (struct genSubRecord *psr, long pattern);
extern long getSecondsOSI();

typedef struct {
  int mode;
  long target;
  long velocity;
  int powering;
  int checking;
  int starting;
  int stopping;
  int depowering;
} ecsDevStruct;


#ifdef NODEBUG
#define Debug(l,FMT,V) ;
#else
#define Debug(l,FMT,V) errlogSevPrintf (l, FMT, (int)getSecondsOSI(), psr->name, (int)V);

#endif

/*
 * FUNCTION ecsPosDevInit
 *
 * Initialize the ecs device simulator subroutine record for
 * position mode only devices.
 *
 */
long ecsPosDevInit (struct genSubRecord *psr) {
  ecsDevStruct *pPriv = (ecsDevStruct *) psr->dpvt;

  /* allocate and initialize the device control structure */
  pPriv = malloc (sizeof (ecsDevStruct));
  if (!pPriv) {
    printf ("can't create private structure");
    return (1);
  }
  psr->dpvt = (void *) pPriv;

  pPriv->mode = INIT_MODE;
  pPriv->target = 0;
  pPriv->powering = 0;
  pPriv->checking = 0;
  pPriv->starting = 0;
  pPriv->stopping = 0;
  pPriv->depowering = 0;

  return (0);
}


/*
 * FUNCTION ecsPosVelDevInit
 *
 * Initialize the ecs device simulator subroutine record for
 * position and velocity mode devices.
 *
 */
long ecsPosVelDevInit (struct genSubRecord *psr){
  ecsDevStruct *pPriv;

  /* allocate and initialize the device control structure */
  pPriv = malloc (sizeof (ecsDevStruct));
  if (!pPriv) {
    printf ("can't create private structure");
    return (1);
  }
  psr->dpvt = (void *) pPriv;

  pPriv->mode = INIT_MODE;
  pPriv->target = 0;
  pPriv->velocity = POS_MODE_VEL / SCAN_RATE;
  pPriv->powering = 0;
  pPriv->checking = 0;
  pPriv->starting = 0;
  pPriv->stopping = 0;
  pPriv->depowering = 0;

  return (0);
}

/*
 * FUNCTION ecsPosDevProcess
 *
 * Simulates an allen-bradley plc position mode device.
 *
 */
long ecsPosDevProcess (struct genSubRecord *psr) {
  ecsDevStruct *pPriv = (ecsDevStruct *) psr->dpvt;


  /* disable the output records to minimize traffic */
  HSK_DISA = TRUE;
  POS_DISA = TRUE;

  /* first time through  initialize handshake pattern and device position */
  if (pPriv->mode == INIT_MODE) {
    writeHandshake(psr, 0);
    HSK_DISA = FALSE;
    POS_OUT = INITIAL_POS;
    POS_DISA = FALSE;
    pPriv->mode = POS_MODE;
    pPriv->target = INITIAL_POS;
    return (0);
  }

  /* restore read-only bits then update output pattern */ 
  HSK_IN &= ~(P_PWR_ACK | P_DRV_ACK | P_POS_ACK | P_IN_POS);
  HSK_IN |= HSK_OUT & (P_PWR_ACK | P_DRV_ACK | P_POS_ACK | P_IN_POS);
  if (HSK_IN != HSK_OUT) {
    Debug(errlogMinor, "<%d> %s:handshake change %x\n", HSK_IN);
    writeHandshake (psr, HSK_IN);
  }
 
  /* simulate the power up sequence */
  if (HSK_IN & P_PWR) {
    if (!(HSK_OUT & P_PWR_ACK)) {
      if (!(pPriv->powering)) {
	pPriv->depowering = 0;
	pPriv->powering = PWR_TIME;
	return (0);
      }
      pPriv->powering -= 1;
      if (pPriv->powering) {
	return (0);
      }
      writeHandshake (psr, HSK_IN | P_PWR_ACK | P_IN_POS);
      return(0);
    }
  }

  /* simulate the power down sequence */
  else {
    pPriv->powering = 0;
    if (HSK_OUT & P_PWR_ACK) {
      if (!(pPriv->depowering)) {
	pPriv->checking = 0;
	pPriv->starting = 0;
	pPriv->depowering = OFF_TIME;
	return (0);
      }
      pPriv->depowering -= 1;
      if (!(pPriv->depowering)) {
	writeHandshake (psr, 0);
      }
    }
    return (0);
  }

  /* power must be on to get this far */

  /* simulate the position validation sequence */
  if (HSK_IN & P_NEW_POS) {
    if (!(HSK_OUT & P_POS_ACK)) {
      if (!(pPriv->checking)) {
	Debug(errlogMinor, "<%d> %s:Pos1 %d\n", POS_IN);

	/* if the value is outside range, do not accept */
	if (POS_IN < 0 || POS_IN > MAX_POS) {
	  return (0);
	}
	pPriv->checking = CHK_TIME;
	return(0);
      }
      pPriv->checking -= 1;

      /* otherwise acknowledge that it is ok */
      if (!(pPriv->checking)) {
	Debug(errlogMinor, "<%d> %s:Pos2 %d\n", POS_IN);
	pPriv->mode = POS_MODE;
	pPriv->target = POS_IN;
	pPriv->velocity = POS_MODE_VEL / SCAN_RATE;
	writeHandshake(psr, HSK_IN | P_POS_ACK);
	if (POS_IN != POS_OUT)
	  writeHandshake (psr,HSK_OUT & ~P_IN_POS);
	return (0);
      }
    }
  }
  else if (HSK_OUT & P_POS_ACK) {
    pPriv->checking = 0;
    writeHandshake (psr, HSK_IN & ~P_POS_ACK);
    return (0);
  }

  /* simulate the drive enable sequence */
  if (HSK_IN & P_DRV) {
    if (!(HSK_OUT & P_DRV_ACK)) {
      if (!(pPriv->starting)) {
	pPriv->stopping = 0;
	pPriv->starting = STA_TIME;
	return (0);
      }
      pPriv->starting -= 1;
      if (pPriv->starting) {
	return (0);
      }
      writeHandshake (psr, HSK_IN | P_DRV_ACK);
      return (0);
    }
  }

  /* simulate the drive disable sequence */
  else {
    pPriv->starting = 0;
    if (HSK_OUT & P_DRV_ACK) {
      if (!(pPriv->stopping)) {
	pPriv->stopping = STA_TIME;
	return (0);
      }
      pPriv->stopping -= 1;
      if (!(pPriv->stopping)){
	writeHandshake (psr, HSK_IN & ~P_DRV_ACK);
      }
    }
   return (0);
  }

  /* drive must be powered and enabled to get this far */

  /* simulate device motion */

  /* are we at the target position? */
  if (POS_OUT == pPriv->target){
    if (!(HSK_OUT & P_IN_POS)) { 
      writeHandshake (psr, HSK_IN | P_IN_POS);
    }
  }
  /* less than one step away is good enough */
  else if (abs(POS_OUT - pPriv->target) < pPriv->velocity) {
    POS_DISA = FALSE;
    POS_OUT = pPriv->target;
    Debug(errlogInfo, "<%d> %s:Position write %d\n", POS_OUT);
  }
  /* no, simulate another motion of the device */
  else {
    POS_DISA = FALSE;
    POS_OUT += (POS_OUT < pPriv->target) ?  pPriv->velocity : -(pPriv->velocity);
    Debug(errlogInfo, "<%d> %s:Position write %d\n", POS_OUT);
  }

  /* all done, return */
  return (0);
  }


/*
 * FUNCTION ecsPosVelDevProcess
 *
 * Simulates an allen-bradley plc position and velocity mode device.
 *
 */
long ecsPosVelDevProcess (struct genSubRecord *psr) {
  ecsDevStruct *pPriv = (ecsDevStruct *) psr->dpvt;

  /* disable the output records to minimize traffic */
  HSK_DISA = TRUE;
  POS_DISA = TRUE;

  /* first time through  initialize handshake pattern and device position */
  if (pPriv->mode == INIT_MODE) {
    writeHandshake(psr, 0);
    HSK_DISA = FALSE;
    POS_OUT = INITIAL_POS;
    POS_DISA = FALSE;
    pPriv->mode = POS_MODE;
    pPriv->target = INITIAL_POS;
    return (0);
  }

  /* transfer input pattern and restore read-only bits */    
  HSK_IN &= ~(PV_PWR_ACK | PV_DRV_ACK | PV_POS_ACK | PV_VEL_ACK | PV_IN_POS);
  HSK_IN |= HSK_OUT & (PV_PWR_ACK | PV_DRV_ACK | PV_POS_ACK | PV_VEL_ACK | PV_IN_POS);
  if (HSK_IN != HSK_OUT) {
    Debug(errlogMinor, "<%d> %s:handshake change %x\n", HSK_IN);
    writeHandshake (psr, HSK_IN);
  }
 
  /* simulate the power up sequence */
  if (HSK_IN & PV_PWR) {
    if (!(HSK_OUT & PV_PWR_ACK)) {
      if (!(pPriv->powering)) {
	pPriv->depowering = 0;
	pPriv->powering = PWR_TIME;
	return (0);
      }
      pPriv->powering -= 1;
      if (pPriv->powering) {
	return (0);
      }
      writeHandshake (psr, HSK_IN | PV_PWR_ACK | PV_IN_POS);
      return(0);
    }
  }

  /* simulate the power down sequence */
  else {
    pPriv->powering = 0;
    if (HSK_OUT & PV_PWR_ACK) {
      if (!(pPriv->depowering)) {
	pPriv->checking = 0;
	pPriv->starting = 0;
	pPriv->depowering = OFF_TIME;
	return (0);
      }
      pPriv->depowering -= 1;
      if (!(pPriv->depowering)) {
	writeHandshake (psr, 0);
      }
    }
    return (0);
  }

  /* power must be on to get this far */

  /* simulate the position validation sequence */
  if (HSK_IN & PV_NEW_POS) {
    if (HSK_IN & PV_NEW_VEL)
      return (0);
    if (!(HSK_OUT & PV_POS_ACK)) {
      if (!(pPriv->checking)) {
	Debug(errlogMinor, "<%d> %s:Pos1 %d\n", POS_IN);

	/* if the value is outside range, do not accept */
	if (POS_IN < 0 || POS_IN > MAX_POS) {
	  return (0);
	}
	pPriv->checking = CHK_TIME;
	return(0);
      }
      pPriv->checking -= 1;

      /* otherwise acknowledge that it is ok */
      if (!(pPriv->checking)) {
	Debug(errlogMinor, "<%d> %s:Pos2 %d\n", POS_IN);
	pPriv->mode = POS_MODE;
	pPriv->target = POS_IN;
	pPriv->velocity = POS_MODE_VEL / SCAN_RATE;
	writeHandshake(psr, HSK_IN | PV_POS_ACK);
	if (POS_IN != POS_OUT)
	  writeHandshake (psr,HSK_OUT & ~PV_IN_POS);
	return (0);
      }
    }
  }
  else if (HSK_OUT & PV_POS_ACK) {
    pPriv->checking = 0;
    writeHandshake (psr, HSK_IN & ~PV_POS_ACK);
    return (0);
  }

  /* simulate the velocity validation sequence */
  if (HSK_IN & PV_NEW_VEL) {
    if (HSK_IN & PV_NEW_POS)
      return (0);
    if (!(HSK_OUT & PV_VEL_ACK)) {
      if (!(pPriv->checking)) {
	Debug(errlogMinor, "<%d> %s:Vel1 %d\n", VEL_IN);

	/* if the value is outside range, do not accept */
	if (VEL_IN > 0x7fff) 
	  VEL_IN = 0x10000 - VEL_IN;
	if (VEL_IN > MAX_VEL) {
	  return (0);
	}
	pPriv->checking = CHK_TIME;
	return(0);
      }
      pPriv->checking -= 1;

      /* otherwise acknowledge that it is ok */
      if (!(pPriv->checking)) {
	if (VEL_IN > 0x7fff) 
	  VEL_IN = -(0x10000 - VEL_IN);
	Debug(errlogMinor, "<%d> %s:Vel2 %d\n", VEL_IN);
      	pPriv->velocity = VEL_IN / SCAN_RATE;
	pPriv->mode = VEL_MODE;
	writeHandshake(psr, HSK_IN | PV_VEL_ACK);
	writeHandshake (psr,HSK_OUT & ~PV_IN_POS);
	return (0);
      }
    }
  }
  else if (HSK_OUT & PV_VEL_ACK) {
    pPriv->checking = 0;
    writeHandshake (psr, HSK_IN & ~PV_VEL_ACK);
    return (0);
  }

  /* simulate the drive enable sequence */
  if (HSK_IN & PV_DRV) {
    if (!(HSK_OUT & PV_DRV_ACK)) {
      if (!(pPriv->starting)) {
	pPriv->stopping = 0;
	pPriv->starting = STA_TIME;
	return (0);
      }
      pPriv->starting -= 1;
      if (pPriv->starting) {
	return (0);
      }
      writeHandshake (psr, HSK_IN | PV_DRV_ACK);
      return (0);
    }
  }

  /* simulate the drive disable sequence */
  else {
    pPriv->starting = 0;
    if (HSK_OUT & PV_DRV_ACK) {
      if (!(pPriv->stopping)) {
	pPriv->stopping = STA_TIME;
	return (0);
      }
      pPriv->stopping -= 1;
      if (!(pPriv->stopping)){
	writeHandshake (psr, HSK_IN & ~PV_DRV_ACK);
      }
    }
   return (0);
  }


  /* drive must be powered and enabled to get this far */

  /* simulate device motion */

  if (pPriv->mode == POS_MODE) {
    /* are we at the target position? */
    if (POS_OUT == pPriv->target){
      if (!(HSK_OUT & PV_IN_POS)) { 
	writeHandshake (psr, HSK_IN | PV_IN_POS);
      }
    }
    /* less than one step away is good enough */
    else if (abs(POS_OUT - pPriv->target) < pPriv->velocity) {
      POS_DISA = FALSE;
      POS_OUT = pPriv->target;
      Debug(errlogInfo, "<%d> %s:Position write %d\n", POS_OUT);
    }
    /* no, simulate another motion of the device */
    else {
      POS_DISA = FALSE;
      POS_OUT += (POS_OUT < pPriv->target) ?  pPriv->velocity : -(pPriv->velocity);
      Debug(errlogInfo, "<%d> %s:Position write %d\n", POS_OUT);
    }
  }
  else {
    POS_DISA = FALSE;
    POS_OUT += pPriv->velocity;
    if (POS_OUT > MAX_POS) POS_OUT -= MAX_POS;
    if (POS_OUT < 0) POS_OUT += MAX_POS;
    Debug(errlogInfo, "<%d> %s:Position write %d\n", POS_OUT);
  }
    

  /* all done, return */
  return (0);
  }
    

/*
 * FUNCTION writeHandshake
 *
 * Enable the hanshake writing record and output a
 * new bit pattern
 *
 */

long writeHandshake (struct genSubRecord *psr, long pattern) {

  HSK_DISA = FALSE;
  Debug(errlogMinor, "<%d> %s:Handshake write %x\n", pattern);
  HSK_OUT = pattern;

  return (0);
}
epicsRegisterFunction(ecsPosDevProcess);
epicsRegisterFunction(ecsPosVelDevProcess);

