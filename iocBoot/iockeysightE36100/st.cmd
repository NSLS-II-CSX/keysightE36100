#!../../bin/linux-x86_64/keysightE36100

## You may have to change keysightE36100 to something else
## everywhere it appears in this file

#< envPaths

## Register all support components
dbLoadDatabase("../../dbd/keysightE36100.dbd",0,0)
keysightE36100_registerRecordDeviceDriver(pdbbase) 

## Load record instances
dbLoadRecords("../../db/keysightE36100.db","user=swilkins")

iocInit()

## Start any sequence programs
#seq snckeysightE36100,"user=swilkins"
