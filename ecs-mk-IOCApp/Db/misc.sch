[schematic2]
uniq 2
[tools]
[detail]
w 1508 747 100 2 n#1 hwin.hwin#58.in 1504 752 1504 752 ebis.ebis#57.INP
s 1552 416 200 0 Miscelaneous
s 1504 480 150 0 Enclosure Control System
s 1280 368 100 0 Pedro Gigoux
s 1296 320 100 0 16/Jul/99
s 1322 520 100 0 misc.sch
[cell use]
use bb200tr -512 200 -100 0 frame
xform 0 768 1024
use hwin 1312 711 100 0 hwin#58
xform 0 1408 752
p 1104 704 100 0 -1 val(in):@$(abC) $(autoCloseTimer)
use ebis 1504 647 100 0 ebis#57
xform 0 1632 720
p 1536 800 100 0 1 DTYP:AB DF1 serial
p 1568 544 100 0 1 ONAM:ON
p 1568 608 100 0 1 PINI:YES
p 1536 832 100 0 1 SCAN:.5 second
p 1568 576 100 0 1 ZNAM:OFF
p 1616 640 100 1024 -1 name:$(top)autocloseTimerState
use drivePowerStatus 1152 1447 100 0 drivePowerStatus#52
xform 0 1288 1536
p 1168 1488 100 0 -1 seta:dev powSeq1
p 1168 1440 100 0 -1 setb:word $(powSeqWd1)
p 1168 1408 100 0 -1 setc:snam ecsPowSeqProc1
p 1168 1376 100 0 -1 setd:ab $(abC)
use drivePowerStatus 1152 1191 100 0 drivePowerStatus#53
xform 0 1288 1280
p 1168 1232 100 0 -1 seta:dev powSeq2
p 1168 1184 100 0 -1 setb:word $(powSeqWd2)
p 1168 1152 100 0 -1 setc:snam ecsPowSeqProc2
p 1168 1120 100 0 -1 setd:ab $(abC)
use drivePowerStatus 1152 935 100 0 drivePowerStatus#54
xform 0 1288 1024
p 1168 976 100 0 -1 seta:dev powSeq3
p 1168 928 100 0 -1 setb:word $(powSeqWd3)
p 1168 896 100 0 -1 setc:snam ecsPowSeqProc3
p 1168 864 100 0 -1 setd:ab $(abC)
use drivePowerStatus 1536 1447 100 0 drivePowerStatus#55
xform 0 1672 1536
p 1552 1488 100 0 -1 seta:dev powSeq4
p 1552 1440 100 0 -1 setb:word $(powSeqWd4)
p 1552 1408 100 0 -1 setc:snam ecsPowSeqProc4
p 1552 1376 100 0 -1 setd:ab $(abC)
use drivePowerStatus 1536 1191 100 0 drivePowerStatus#56
xform 0 1672 1280
p 1552 1232 100 0 -1 seta:dev powSeq5
p 1552 1184 100 0 -1 setb:word $(powSeqWd5)
p 1552 1152 100 0 -1 setc:snam ecsPowSeqProc5
p 1552 1120 100 0 -1 setd:ab $(abC)
use lightControl 224 551 100 0 lightControl#51
xform 0 416 688
p 240 544 100 0 1 seta:top $(top)
p 240 512 100 0 1 setb:ab $(abC)
use obsMode 224 871 100 0 obsMode#50
xform 0 416 1008
p 240 872 100 0 1 seta:top $(top)
p 240 848 100 0 1 setb:ab $(abC)
use drivePower 704 839 100 0 drivePower#48
xform 0 848 992
p 720 832 100 0 1 seta:top $(top)
p 720 800 100 0 1 setb:ab $(abC)
use ecsPlcCmd 32 1511 100 0 ecsPlcCmd#33
xform 0 144 1600
p 64 1504 100 0 -1 seta:cmd closeSH
p 64 1472 100 0 -1 setb:address $(closeSH)
use ecsPlcCmd 32 1287 100 0 ecsPlcCmd#34
xform 0 144 1376
p 64 1280 100 0 -1 seta:cmd abortCloseSH
p 64 1248 100 0 -1 setb:address $(abortCloseSH)
use ecsPlcCmd 352 1511 100 0 ecsPlcCmd#35
xform 0 464 1600
p 384 1504 100 0 -1 seta:cmd closeEVG
p 384 1472 100 0 -1 setb:address $(closeEVG)
use ecsPlcCmd 672 1511 100 0 ecsPlcCmd#37
xform 0 784 1600
p 704 1504 100 0 -1 seta:cmd closeWVG
p 704 1472 100 0 -1 setb:address $(closeWVG)
use ecsPlcCmd 352 1287 100 0 ecsPlcCmd#40
xform 0 464 1376
p 384 1280 100 0 -1 seta:cmd abortCloseEVG
p 384 1248 100 0 -1 setb:address $(abortCloseEVG)
use ecsPlcCmd 672 1287 100 0 ecsPlcCmd#41
xform 0 784 1376
p 704 1280 100 0 -1 seta:cmd abortCloseWVG
p 704 1248 100 0 -1 setb:address $(abortCloseWVG)
use shutcurr -288 551 100 0 shutcurr#3
xform 0 -192 672
p -288 512 100 0 1 setAb:ab $(abC)
p -288 544 100 0 1 seta:top $(top)sh:
p -288 480 100 0 1 setc:calc (A>32767)?(A-65536)/10:A/10
use ventcurr -288 871 100 0 ventcurr#2
xform 0 -192 992
p -304 832 100 0 1 setAb:ab $(abC)
p -304 864 100 0 1 seta:top $(top)vg:
p -304 800 100 0 1 setc:calc (A>32767)?(A-65536)/10:A/10
use domecurr -352 1111 100 0 domecurr#1
xform 0 -192 1312
p -304 1152 100 0 1 setAb:ab $(abC)
p -304 1184 100 0 1 seta:top $(top)dc:
p -304 1120 100 0 1 setc:calc (A>32767)?(A-65536)/10:A/10
use abWordRead -288 1511 100 0 abWordRead#0
xform 0 -176 1600
p -288 1472 100 0 1 setAb:ab $(abC)
p -288 1504 100 0 1 setWord:word 7
p -288 1440 100 0 1 setd:dev misc:
[comments]
