TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC_RTEMS = ecs-mk-IOC

# ecs-mk-IOC.dbd will be created and installed
DBD += ecs-mk-IOC.dbd

# ecs-mk-IOC.dbd will be made up from these files:
# Include dbd files from all support modules
ecs-mk-IOC_DBD += base.dbd
# ecs-mk-IOC_DBD += iocAdmin.dbd
ecs-mk-IOC_DBD += geminiRecords.dbd
ecs-mk-IOC_DBD += pvload.dbd
ecs-mk-IOC_DBD += xy240.dbd
ecs-mk-IOC_DBD += listAlarmRecords.dbd
ecs-mk-IOC_DBD += systemTickTools.dbd
ecs-mk-IOC_DBD += initTrace.dbd
ecs-mk-IOC_DBD += menuScan.dbd
ecs-mk-IOC_DBD += AbDf1.dbd
ecs-mk-IOC_DBD += ecsMotorRecord.dbd
ecs-mk-IOC_DBD += ecsFunc.dbd

# Add all the support libraries used by this IOC
ecs-mk-IOC_LIBS += AbDf1
ecs-mk-IOC_LIBS += drvSerial
ecs-mk-IOC_LIBS += geminiRecords
ecs-mk-IOC_LIBS += pvload
ecs-mk-IOC_LIBS += xy240
ecs-mk-IOC_LIBS += seq pv
ecs-mk-IOC_LIBS += listAlarmRecords
ecs-mk-IOC_LIBS += systemTickTools
ecs-mk-IOC_LIBS += initTrace
# ecs-mk-IOC_LIBS += devIocStats
ecs-mk-IOC_LIBS += ecsMotorRecord

# Source files
ecs-mk-IOC_SRCS += ecs-mk-IOC_registerRecordDeviceDriver.cpp
ecs-mk-IOC_SRCS += abLog.c	# tgagg this should be included in the ab driver
ecs-mk-IOC_SRCS += ecCommands.c
ecs-mk-IOC_SRCS += ecHealth.c
ecs-mk-IOC_SRCS += ecInterlocks.c
ecs-mk-IOC_SRCS += ecMisc.c
ecs-mk-IOC_SRCS += ecsDriveStatus.c
ecs-mk-IOC_SRCS += ecsFault.c
ecs-mk-IOC_SRCS += ecSIR.c
ecs-mk-IOC_SRCS += fakeDevice.c
ecs-mk-IOC_SRCS += shutGalil.c	# PGX: temporary solution for GS

# Build the main IOC entry point on workstation OSs.
ecs-mk-IOC_SRCS_DEFAULT += ecs-mk-IOCMain.cpp

# Finally link to the EPICS Base libraries
ecs-mk-IOC_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE
# ---------------------------------------------------



