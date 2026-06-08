/*
 *    Gemini Enclosure Control System
 *
 *     Drive Power Control GENsub functions
 */


#include "ecs.h"

#include <dbDefs.h>
#include <genSubRecord.h>
#include <dbCommon.h>
#include <recSup.h>
#include <ecsMotor.h>


/*
 * Input power sequence steps and power command sequence steps from the PLC
 * This involves reading 10 step numbers from 3 PLC words.  It will be handled
 * by 3 gensubs as defined below.
 * 
 */


/* ecsPowSeqProc1
 * 
 * Status gensub pin definitions
 * psr->a = Top Shutter Power Sequence step number (LONG)
 * psr->b = Bottom Shutter Power Sequence step number (LONG)
 * psr->c = Dome Power Sequence step number (LONG)
 * psr->d = East Vent Gate Power Sequence step number (LONG)
 *
 * psr->vala = State of tsPowSeq step (STRING)
 * psr->valb = State of bsPowSeq step (STRING)
 * psr->valc = State of domePowSeq step (STRING)
 * psr->vald = State of evgPowSeq step (STRING)
 *
 */

#define ECS_WORD_1		*(long *)psr->a
#define ECS_WORD_2	        *(long *)psr->b
#define ECS_WORD_3		*(long *)psr->c
#define ECS_WORD_4		*(long *)psr->d

/*
 * FUNCTION ecsPowSeqProc1
 *
 */
long ecsPowSeqProc1 (struct genSubRecord *psr) {
  long status = 0;

/* Top Shutter power sequence */

  switch(ECS_WORD_1)
  {

   case 0:
    strcpy(psr->vala, "32 - Init ");
    break;

   case 1:
    strcpy(psr->vala, "33 - Powering ");
    break;

   case 2:
    strcpy(psr->vala, "34 - Power ON Operate");
    break;

   case 7:
    strcpy(psr->vala, "39 - Fault ");
    break;

  }

/* Bottom Shutter power sequence */

  switch(ECS_WORD_2)
  {

   case 0:
    strcpy(psr->valb, "48 - Init ");
    break;

   case 1:
    strcpy(psr->valb, "49 - Powering ");
    break;

   case 2:
    strcpy(psr->valb, "50 - Power ON Operate");
    break;

   case 7:
    strcpy(psr->valb, "55 - Fault ");
    break;

  }

/* Dome power sequence */

  switch(ECS_WORD_3)
  {

   case 0:
    strcpy(psr->valc, "64 - Init ");
    break;

   case 1:
    strcpy(psr->valc, "65 - Powering ");
    break;

   case 2:
    strcpy(psr->valc, "66 - Power ON Operate");
    break;

   case 7:
    strcpy(psr->valc, "71 - Fault ");
    break;

  }

/* East Vent Gate power sequence */

  switch(ECS_WORD_4)
  {

   case 0:
    strcpy(psr->vald, "80 - Init ");
    break;

   case 1:
    strcpy(psr->vald, "81 - Powering ");
    break;

   case 2:
    strcpy(psr->vald, "82 - Power ON Operate");
    break;

   case 7:
    strcpy(psr->vald, "87 - Fault ");
    break;

  }

  return status;
}


/*
 * FUNCTION ecsPowSeqProc2
 *
 */
long ecsPowSeqProc2 (struct genSubRecord *psr) {
  long status = 0;

/* West Vent Gate power sequence */

  switch(ECS_WORD_1)
  {

   case 0:
    strcpy(psr->vala, "96 - Init ");
    break;

   case 1:
    strcpy(psr->vala, "97 - Powering ");
    break;

   case 2:
    strcpy(psr->vala, "98 - Power ON Operate");
    break;

   case 7:
    strcpy(psr->vala, "103 - Fault ");
    break;

  }

/* Top Shutter power command sequence */

  switch(ECS_WORD_2)
  {

   case 0:
    strcpy(psr->valb, "240 - Init ");
    break;

   case 1:
    strcpy(psr->valb, "241 -Base Mode- Waiting for Cmd ");
    break;

   case 2:
    strcpy(psr->valb, "242 -Base Mode- Power Cmd ON ");
    break;

   case 3:
    strcpy(psr->valb, "243 -NonBase Mode- Waiting for Cmd ");
    break;

   case 4:
    strcpy(psr->valb, "244 -NonBase Mode- Power Cmd ON ");
    break;

   case 7:
    strcpy(psr->valb, "247 -Base Mode- FPS Power Cmd ON ");
    break;

  }

/* Bottom Shutter power command sequence */

  switch(ECS_WORD_3)
  {

   case 0:
    strcpy(psr->valc, "248 - Init ");
    break;

   case 1:
    strcpy(psr->valc, "249 -Base Mode- Waiting for Cmd ");
    break;

   case 2:
    strcpy(psr->valc, "250 -Base Mode- Power Cmd ON ");
    break;

   case 3:
    strcpy(psr->valc, "251 -NonBase Mode- Waiting for Cmd ");
    break;

   case 4:
    strcpy(psr->valc, "252 -NonBase Mode- Power Cmd ON ");
    break;

   case 7:
    strcpy(psr->valc, "255 -Base Mode- FPS Power Cmd ON ");
    break;

  }

/* Dome power command sequence */

  switch(ECS_WORD_4)
  {

   case 0:
    strcpy(psr->vald, "256 - Init ");
    break;

   case 1:
    strcpy(psr->vald, "257 -Base Mode- Waiting for Cmd ");
    break;

   case 2:
    strcpy(psr->vald, "258 -Base Mode- Power Cmd ON ");
    break;

   case 3:
    strcpy(psr->vald, "259 -NonBase Mode- Waiting for Cmd ");
    break;

   case 4:
    strcpy(psr->vald, "260 -NonBase Mode- Power Cmd ON ");
    break;

   case 7:
    strcpy(psr->vald, "263 -Base Mode- FPS Power Cmd ON ");
    break;

  }

  return status;
}


/*
 * FUNCTION ecsPowSeqProc3
 *
 */
long ecsPowSeqProc3 (struct genSubRecord *psr) {
  long status = 0;

/* East Vent Gate power command sequence */

  switch(ECS_WORD_1)
  {

   case 0:
    strcpy(psr->vala, "272 - Init ");
    break;

   case 1:
    strcpy(psr->vala, "273 -Base Mode- Waiting for Cmd ");
    break;

   case 2:
    strcpy(psr->vala, "274 -Base Mode- Power Cmd ON ");
    break;

   case 3:
    strcpy(psr->vala, "275 -NonBase Mode- Waiting for Cmd ");
    break;

   case 4:
    strcpy(psr->vala, "276 -NonBase Mode- Power Cmd ON ");
    break;

   case 7:
    strcpy(psr->vala, "279 -Base Mode- FPS Power Cmd ON ");
    break;

  }

/* West Vent Gate power command sequence */

  switch(ECS_WORD_2)
  {

   case 0:
    strcpy(psr->valb, "280 - Init ");
    break;

   case 1:
    strcpy(psr->valb, "281 -Base Mode- Waiting for Cmd ");
    break;

   case 2:
    strcpy(psr->valb, "282 -Base Mode- Power Cmd ON ");
    break;

   case 3:
    strcpy(psr->valb, "283 -NonBase Mode- Waiting for Cmd ");
    break;

   case 4:
    strcpy(psr->valb, "284 -NonBase Mode- Power Cmd ON ");
    break;

   case 7:
    strcpy(psr->valb, "287 -Base Mode- FPS Power Cmd ON ");
    break;

  }

/* Top Shutter Fault Auto Reset Sequence */

  switch(ECS_WORD_3)
  {

   case 0:
    strcpy(psr->valc, "112 - Init ");
    break;

   case 1:
    strcpy(psr->valc, "112 - Auto Reset Ready ");
    break;

   case 2:
    strcpy(psr->valc, "113 - Fault, Awaiting AutoRst ");
    break;

   case 3:
    strcpy(psr->valc, "114 - Auto Reset ");
    break;

  }

/* Bottom Shutter Fault Auto Reset Sequence */

  switch(ECS_WORD_4)
  {

   case 0:
    strcpy(psr->vald, "120 - Init ");
    break;

   case 1:
    strcpy(psr->vald, "120 - Auto Reset Ready ");
    break;

   case 2:
    strcpy(psr->vald, "121 - Fault, Awaiting AutoRst ");
    break;

   case 3:
    strcpy(psr->vald, "122 - Auto Reset ");
    break;

  }

  return status;
}

/*
 * FUNCTION ecsPowSeqProc4
 *
 */
long ecsPowSeqProc4 (struct genSubRecord *psr) {
  long status = 0;

/* Dome Fault Auto Reset Sequence */

  switch(ECS_WORD_1)
  {

   case 0:
    strcpy(psr->vala, "192 - Init ");
    break;

   case 1:
    strcpy(psr->vala, "192 - Auto Reset Ready ");
    break;

   case 2:
    strcpy(psr->vala, "193 - Fault, Awaiting AutoRst ");
    break;

   case 3:
    strcpy(psr->vala, "194 - Auto Reset ");
    break;

  }

/* East Vent Gate Fault Auto Reset Sequence */

  switch(ECS_WORD_2)
  {

   case 0:
    strcpy(psr->valb, "160 - Init ");
    break;

   case 1:
    strcpy(psr->valb, "160 - Auto Reset Ready ");
    break;

   case 2:
    strcpy(psr->valb, "161 - Fault, Awaiting Auto Reset ");
    break;

   case 3:
    strcpy(psr->valb, "162 - Auto Reset ");
    break;

  }

/* West Vent Gate Fault Auto Reset Sequence */

  switch(ECS_WORD_3)
  {

   case 0:
    strcpy(psr->valc, "168 - Init ");
    break;

   case 1:
    strcpy(psr->valc, "168 - Auto Reset Ready ");
    break;

   case 2:
    strcpy(psr->valc, "169 - Fault, Awaiting Auto Reset ");
    break;

   case 3:
    strcpy(psr->valc, "170 - Auto Reset ");
    break;

  }

/* Shutters Auto Close Sequence */

  switch(ECS_WORD_4)
  {

   case 0:
    strcpy(psr->vald, "16 - Init ");
    break;

   case 1:
    strcpy(psr->vald, "17 - Bottom Shutter Move#1 ");
    break;

   case 2:
    strcpy(psr->vald, "18 - Both Shutters moving ");
    break;

   case 3:
    strcpy(psr->vald, "19 - Top Shutter moving ");
    break;

   case 4:
    strcpy(psr->vald, "20 - Wait before Gap Closing ");
    break;

   case 5:
    strcpy(psr->vald, "21 - Bottom Sh close gap Move#2 ");
    break;

   case 6:
    strcpy(psr->vald, "22 - Close Sequence Done ");
    break;

   case 7:
    strcpy(psr->vald, "22 - Shtrs Not Fully Closed ");
    break;

  }

  return status;
}


/*
 * FUNCTION ecsPowSeqProc5
 *
 */
long ecsPowSeqProc5 (struct genSubRecord *psr) {
  long status = 0;

/* Top Shutter Auto Move Sequence */

  switch(ECS_WORD_1)
  {

   case 0:
    strcpy(psr->vala, "40 - Init ");
    break;

   case 1:
    strcpy(psr->vala, "41 - Load Position Setpoint ");
    break;

   case 2:
    strcpy(psr->vala, "42 - Activate Position Setpoint ");
    break;

   case 3:
    strcpy(psr->vala, "43 - Enable Galil Move Commands ");
    break;

   case 4:
    strcpy(psr->vala, "44 - Move Completed ");
    break;

   case 5:
    strcpy(psr->vala, "45 - Encoder Fault ");
    break;

   case 7:
    strcpy(psr->vala, "47 - Current Alarm ");
    break;

  }

/* Bottom Shutter Auto Move Sequence */

  switch(ECS_WORD_2)
  {

   case 0:
    strcpy(psr->valb, "56 - Init ");
    break;

   case 1:
    strcpy(psr->valb, "57 - Load Position Setpoint ");
    break;

   case 2:
    strcpy(psr->valb, "58 - Activate Position Setpoint ");
    break;

   case 3:
    strcpy(psr->valb, "59 - Enable Galil Move Commands ");
    break;

   case 4:
    strcpy(psr->valb, "60 - Move Completed ");
    break;

   case 5:
    strcpy(psr->valb, "61 - Encoder Fault ");
    break;

   case 6:
    strcpy(psr->valb, "62 - Skew Fault ");
    break;

   case 7:
    strcpy(psr->valb, "63 - Current Alarm ");
    break;

  }


/* East Vent Gate Auto Move Sequence */

  switch(ECS_WORD_3)
  {

   case 0:
    strcpy(psr->valc, "88 - Init ");
    break;

   case 1:
    strcpy(psr->valc, "89 - Load Position Setpoint ");
    break;

   case 2:
    strcpy(psr->valc, "90 - Activate Position Setpoint ");
    break;

   case 3:
    strcpy(psr->valc, "91 - Enable Galil Move Commands ");
    break;

   case 4:
    strcpy(psr->valc, "92 - Move Completed ");
    break;

   case 6:
    strcpy(psr->valc, "94 - Encoder Fault ");
    break;

  }

/* West Vent Gate Auto Move Sequence */

  switch(ECS_WORD_4)
  {

   case 0:
    strcpy(psr->vald, "104 - Init ");
    break;

   case 1:
    strcpy(psr->vald, "105 - Load Position Setpoint ");
    break;

   case 2:
    strcpy(psr->vald, "106 - Activate Position Setpoint ");
    break;

   case 3:
    strcpy(psr->vald, "107 - Enable Galil Move Commands ");
    break;

   case 4:
    strcpy(psr->vald, "108 - Move Completed ");
    break;

   case 6:
    strcpy(psr->vald, "110 - Encoder Fault ");
    break;

  }

  return status;
}

//TODO: Review why this functions aren't exported
epicsRegisterFunction(ecsPowSeqProc1);
epicsRegisterFunction(ecsPowSeqProc2);
epicsRegisterFunction(ecsPowSeqProc3);
epicsRegisterFunction(ecsPowSeqProc4);
epicsRegisterFunction(ecsPowSeqProc5);
