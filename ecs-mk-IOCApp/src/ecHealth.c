
#include <sirRecord.h>
#include <genSubRecord.h>
#include <ecsMotor.h>
#include <ecs.h>

/* generic SIR record field definitions */
#define SIR_HEALTH        *(long *)psir->val
#define SIR_MESSAGE                psir->imss

/* generic combine GENSUB record output field definitions */
#define GENSUB_HEALTH     *(long *)psr->vala
#define GENSUB_MESSAGE             psr->valb

/* ecs combine GENSUB record input definitons */ 
#define ECS_SYSTEM_HEALTH *(long *)psr->a
#define ECS_SYSTEM_MESSAGE         psr->b
#define ECS_DOME_HEALTH   *(long *)psr->c
#define ECS_DOME_MESSAGE           psr->d
#define ECS_SHTR_HEALTH   *(long *)psr->e
#define ECS_SHTR_MESSAGE           psr->f
#define ECS_VGATE_HEALTH  *(long *)psr->g
#define ECS_VGATE_MESSAGE          psr->h

/* system combine GENSUB record input definitons */ 
#define SYS_ECS_HEART     *(long *)psr->a
#define SYS_CPLC_HEART    *(long *)psr->b
#define SYS_STATE         *(long *)psr->d

/* shutter combine GENSUB record input definitons */ 
#define TOP_SHUTTER_STATE *(long *)psr->a
#define TOP_SHUTTER_OLIM  *(long *)psr->b
#define TOP_SHUTTER_CLIM  *(long *)psr->c
#define BOT_SHUTTER_STATE *(long *)psr->d
#define BOT_SHUTTER_OLIM  *(long *)psr->e
#define BOT_SHUTTER_CLIM  *(long *)psr->f

/* ventgate combine GENSUB record input definitons */ 
#define EAST_GATE_OLIM    *(long *)psr->a
#define EAST_GATE_STATE   *(long *)psr->b
#define WEST_GATE_STATE   *(long *)psr->c
#define WEST_GATE_OLIM    *(long *)psr->d

long ecsHealthProcess (struct genSubRecord *psr);
long ecsSystemHealthProcess (struct genSubRecord *psir);
long ecsShutterHealthProcess (struct genSubRecord *psir);
long ecsVentGateHealthProcess (struct genSubRecord *psir);
long ecsDomeHealthProcess (struct sirRecord *psir);


long ecsHealthProcess (struct genSubRecord *psr) {
  int warning = FALSE;
  int invalid = FALSE;

  /* derive global health from individual component health */

  /* system components */
  switch (ECS_SYSTEM_HEALTH) {
  case GOOD_HEALTH:
    break;
  case WARNING_HEALTH:
    strcpy (GENSUB_MESSAGE, ECS_SYSTEM_MESSAGE);
    warning = TRUE;
    break;
  case BAD_HEALTH:
    strcpy (GENSUB_MESSAGE, ECS_SYSTEM_MESSAGE);
    GENSUB_HEALTH = BAD_HEALTH;
    return (0);
    break;
  case INVALID_HEALTH:
  default:
    strcpy (GENSUB_MESSAGE, "system bad health code");
    invalid = TRUE;
    break;
  } 

  /* dome */
  switch (ECS_DOME_HEALTH) {
  case GOOD_HEALTH:
    break;
  case WARNING_HEALTH:
    if (!invalid) {
      strcpy (GENSUB_MESSAGE, ECS_DOME_MESSAGE);
      warning = TRUE;
    }
    break;
  case BAD_HEALTH:
    strcpy (GENSUB_MESSAGE, ECS_DOME_MESSAGE);
    GENSUB_HEALTH = BAD_HEALTH;
    return (0);
    break;
  case INVALID_HEALTH:
    strcpy (GENSUB_MESSAGE, ECS_DOME_MESSAGE);
    invalid = TRUE;
    break;
  default:
    strcpy (GENSUB_MESSAGE, "dome bad health code");
    invalid = TRUE;
    break;
  } 
    
  /* shutters */
  switch (ECS_SHTR_HEALTH) {
  case GOOD_HEALTH:
    break;
  case WARNING_HEALTH:
    if (!invalid) {
      strcpy (GENSUB_MESSAGE, ECS_SHTR_MESSAGE);
      warning = TRUE;
    }
    break;
  case BAD_HEALTH:
    strcpy (GENSUB_MESSAGE, ECS_SHTR_MESSAGE);
    GENSUB_HEALTH = BAD_HEALTH;
    return (0);
    break;
  case INVALID_HEALTH:
    strcpy (GENSUB_MESSAGE, ECS_SHTR_MESSAGE);
    invalid = TRUE;
    break;
  default:
    strcpy (GENSUB_MESSAGE, "shutter system generated bad health code");
    invalid = TRUE;
    break;
  } 
    
   /* vent gates */
  switch (ECS_VGATE_HEALTH) {
  case GOOD_HEALTH:
    break;
  case WARNING_HEALTH:
  case BAD_HEALTH:
  case INVALID_HEALTH:
    if (!invalid) {
      strcpy (GENSUB_MESSAGE, ECS_VGATE_MESSAGE);
      warning = TRUE;
    }
    break;
  default:
    strcpy (GENSUB_MESSAGE, "ventgate system generated bad health code");
    invalid = TRUE;
    break;
  }
 
  /*
   * if health is invalid it may be bad so this takes precedence over
   * known warning conditions.
   */ 
  if (invalid) {
    GENSUB_HEALTH = INVALID_HEALTH;
  }
  else if (warning) {
    GENSUB_HEALTH = WARNING_HEALTH;
  }
  else {
    strcpy (GENSUB_MESSAGE, "");
    GENSUB_HEALTH = GOOD_HEALTH;
  }
    
  return(0);
}

long ecsSystemHealthProcess (struct genSubRecord *psr)
{

  if (SYS_STATE != RUNNING) {
    strcpy (GENSUB_MESSAGE, "system re-initializing!");
    GENSUB_HEALTH = BAD_HEALTH;
    return 0;
  }
  if (SYS_ECS_HEART) {
    strcpy (GENSUB_MESSAGE, "system heartbeat failed!");
    GENSUB_HEALTH = BAD_HEALTH;
    return 0;
  }
  if (SYS_CPLC_HEART) {
    strcpy (GENSUB_MESSAGE, "carousel PLC heartbeat failed!");
    GENSUB_HEALTH = BAD_HEALTH;
    return 0;
  }

  strcpy (GENSUB_MESSAGE, "");
  GENSUB_HEALTH = GOOD_HEALTH;

  return(0);
}

long ecsShutterHealthProcess (struct genSubRecord *psr)
{
  int bad = FALSE;
  int invalid = FALSE;
  int warning = FALSE;

  /* major errors first */
  if (TOP_SHUTTER_CLIM == ECS_OVER_LSW) {
    strcpy (GENSUB_MESSAGE, "top shutter overtravel closed");
    bad = TRUE;
  }
  if (BOT_SHUTTER_CLIM == ECS_OVER_LSW) {
    strcpy (GENSUB_MESSAGE, "bottom shutter overtravel closed");
    bad = TRUE;
  }
  if (TOP_SHUTTER_STATE == SIR_ERROR) {
    strcpy (GENSUB_MESSAGE, "top shutter major error");
    bad = TRUE;
  }
  if (BOT_SHUTTER_STATE == SIR_ERROR) {
    strcpy (GENSUB_MESSAGE, "bottom shutter major error");
    bad = TRUE;
  }
  if (bad) {
    GENSUB_HEALTH = BAD_HEALTH;
    return (0);
  }

  /* then offline states */
  if (TOP_SHUTTER_STATE == SIR_OFFLINE) {
    strcpy (GENSUB_MESSAGE, "top shutter is offline");
    invalid = TRUE;
  }
  if (BOT_SHUTTER_STATE == SIR_OFFLINE) {
    strcpy (GENSUB_MESSAGE, "bottom shutter is offline");
    invalid = TRUE;
  }
  if (invalid) {
    GENSUB_HEALTH = INVALID_HEALTH;
    return (0);
  }

  /* then warning states*/
  if (TOP_SHUTTER_OLIM == ECS_OVER_LSW) {
    strcpy (GENSUB_MESSAGE, "top shutter overtravel open");
    warning = TRUE;
  }
  if (BOT_SHUTTER_OLIM == ECS_OVER_LSW) {
    strcpy (GENSUB_MESSAGE, "bottom shutter overtravel open");
    warning = TRUE;
  }
  if (warning) {
    GENSUB_HEALTH = WARNING_HEALTH;
  }
  else {
    strcpy (GENSUB_MESSAGE, "");
    GENSUB_HEALTH = GOOD_HEALTH;
  }

  return(0);
}

long ecsVentGateHealthProcess (struct genSubRecord *psr)
{
  int invalid = FALSE;
  int bad = FALSE;

  /* major errors first */
  if (EAST_GATE_OLIM == ECS_OVER_LSW) {
    strcpy (GENSUB_MESSAGE, "east ventgate overtravel open");
    bad = TRUE;
  }
  if (WEST_GATE_OLIM == ECS_OVER_LSW) {
    strcpy (GENSUB_MESSAGE, "west ventgate overtravel open");
    bad = TRUE;
  }
  if (EAST_GATE_STATE == SIR_ERROR) {
    strcpy (GENSUB_MESSAGE, "east ventgate major error");
    bad = TRUE;
  }
  if (WEST_GATE_STATE == SIR_ERROR) {
    strcpy (GENSUB_MESSAGE, "west ventgate major error");
    bad = TRUE;
  }
  if (bad) {
    GENSUB_HEALTH = BAD_HEALTH;
    return (0);
  }

  /* then offline states */
  if (EAST_GATE_STATE == SIR_OFFLINE) {
    strcpy (GENSUB_MESSAGE, "east ventgate is offline");
    invalid = TRUE;
  }
  if (EAST_GATE_STATE == SIR_OFFLINE) {
    strcpy (GENSUB_MESSAGE, "west ventgate is offline");
    invalid = TRUE;
  }
  if (invalid) {
    GENSUB_HEALTH = INVALID_HEALTH;
  }
  else {
    strcpy (GENSUB_MESSAGE, "");
    GENSUB_HEALTH = GOOD_HEALTH;
  }

  return(0);
}


long ecsDomeHealthProcess (struct sirRecord *psir)
{
  if (SIR_HEALTH == SIR_OFFLINE) {
    strcpy (SIR_MESSAGE, "dome is offline");
    SIR_HEALTH = INVALID_HEALTH;
  }
  else if (SIR_HEALTH == SIR_ERROR) {
    strcpy (SIR_MESSAGE, "dome major error");
    SIR_HEALTH = BAD_HEALTH;
  }
  else {
    strcpy (SIR_MESSAGE, "");
    SIR_HEALTH = GOOD_HEALTH;
  }
  return(0);
}
epicsRegisterFunction(ecsHealthProcess);
epicsRegisterFunction(ecsDomeHealthProcess);
epicsRegisterFunction(ecsShutterHealthProcess);
epicsRegisterFunction(ecsSystemHealthProcess);
epicsRegisterFunction(ecsVentGateHealthProcess);

