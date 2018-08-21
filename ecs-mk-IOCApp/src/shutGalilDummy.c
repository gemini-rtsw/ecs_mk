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

#define GALIL_TOP	1
#define GALIL_BOT	2

static long shutGalilInit(struct genSubRecord *pgsub, int which);

long shutGalilTopInit(struct genSubRecord *pgSub) { return shutGalilInit(pgSub, GALIL_TOP); } 
long shutGalilBotInit(struct genSubRecord *pgSub) { return shutGalilInit(pgSub, GALIL_BOT); }

static long shutGalilInit (struct genSubRecord *pgsub, int which)
{
    return OK;
}

epicsRegisterFunction(shutGalilTopInit);
epicsRegisterFunction(shutGalilBotInit);
