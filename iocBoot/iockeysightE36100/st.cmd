#!../../bin/linux-x86_64/keysightE36100

## You may have to change keysightE36100 to something else
## everywhere it appears in this file

< envPaths
< /epics/common/xf23id1-ioc2-netsetup.cmd

cd ${TOP}

## Register all support components
dbLoadDatabase("dbd/keysightE36100.dbd",0,0)
keysightE36100_registerRecordDeviceDriver(pdbbase) 

epicsEnvSet("STREAM_PROTOCOL_PATH"    , "$(TOP)/protocols")

drvAsynIPPortConfigure("KS1", "xf23id1-dvm1.nsls2.bnl.local:5025")
#asynSetTraceMask("KS1", 0, 0x9)
#asynSetTraceIOMask("KS1", 0, 0x2)

## Load record instances
dbLoadRecords("db/keysightE36100.db","Sys=XF:23ID1-ES,Dev={FCCD-PSU:FO},PORT=KS1")

#asSetFilename("/epics/xf/23id/xf23id.acf")

system("install -m 777 -d $(TOP)/as/save") 
system("install -m 777 -d $(TOP)/as/req")

set_savefile_path("${TOP}/as","/save")
set_requestfile_path("${TOP}/as","/req")
set_pass0_restoreFile("info_positions.sav")
set_pass1_restoreFile("info_settings.sav")

iocInit()

caPutLogInit("xf23id-ca.cs.nsls2.local:7004", 0)

cd ${TOP}/as/req
makeAutosaveFiles()
create_monitor_set("info_positions.req", 5 , "")
create_monitor_set("info_settings.req", 15 , "")

dbl > ${TOP}/records.dbl
system("cp ${TOP}/records.dbl /cf-update/xf23id1-ioc2.es-keysightE36100.dbl")

