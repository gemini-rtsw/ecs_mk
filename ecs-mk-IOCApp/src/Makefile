TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = ecs-mk-IOC
# ecs-mk-IOC.dbd will be created and installed
DBD += ecs-mk-IOC.dbd

# ecs-mk-IOC.dbd will be made up from these files:
ecs-mk-IOC_DBD += base.dbd

# Include dbd files from all support modules:
#ecs-mk-IOC_DBD += xxx.dbd

# Add all the support libraries used by this IOC
# ecs-mk-IOC_LIBS += xxx
# ecs-mk-IOC_LIBS += seq pv seqDev

# ecs-mk-IOC_registerRecordDeviceDriver.cpp derives from ecs-mk-IOC.dbd
ecs-mk-IOC_SRCS += ecs-mk-IOC_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
ecs-mk-IOC_SRCS_DEFAULT += ecs-mk-IOCMain.cpp

# Finally link to the EPICS Base libraries
ecs-mk-IOC_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

