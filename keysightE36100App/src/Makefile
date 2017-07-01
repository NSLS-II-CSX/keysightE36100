TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = keysightE36100
# keysightE36100.dbd will be created and installed
DBD += keysightE36100.dbd

# keysightE36100.dbd will be made up from these files:
keysightE36100_DBD += base.dbd

# Include dbd files from all support applications:
keysightE36100_DBD += caPutLog.dbd
keysightE36100_DBD += asyn.dbd
keysightE36100_DBD += stream.dbd
keysightE36100_DBD += drvAsynIPPort.dbd
keysightE36100_DBD += drvAsynSerialPort.dbd
keysightE36100_DBD += system.dbd
keysightE36100_DBD += asSupport.dbd
keysightE36100_DBD += devIocStats.dbd

# Add all the support libraries needed by this IOC
keysightE36100_LIBS += caPutLog
keysightE36100_LIBS += stream
keysightE36100_LIBS += asyn
keysightE36100_LIBS += devIocStats
keysightE36100_LIBS += autosave

# keysightE36100_registerRecordDeviceDriver.cpp derives from keysightE36100.dbd
keysightE36100_SRCS += keysightE36100_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
keysightE36100_SRCS_DEFAULT += keysightE36100Main.cpp
keysightE36100_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#keysightE36100_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
keysightE36100_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

