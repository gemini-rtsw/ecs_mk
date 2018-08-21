[schematic2]
uniq 21
[tools]
[detail]
w 1380 203 100 0 n#1 egenSub.ecsCombine.OUTB 1280 320 1376 320 1376 96 1536 96 hwout.hwout#312.outp
w -574 875 100 0 n#2 hwin.hwin#305.in -576 864 -512 864 esirs.esirs#253.INP
w -4 955 100 0 n#3 esirs.esirs#256.FLNK -96 1312 0 1312 0 608 320 608 egenSub.sysCombine.SLNK
w 962 -53 100 0 n#4 hwin.hwin#297.in 992 -64 992 -64 egenSub.ecsCombine.INPH
w 962 11 100 0 n#5 hwin.hwin#295.in 992 0 992 0 egenSub.ecsCombine.INPG
w 962 75 100 0 n#6 hwin.hwin#293.in 992 64 992 64 egenSub.ecsCombine.INPF
w 962 139 100 0 n#7 hwin.hwin#291.in 992 128 992 128 egenSub.ecsCombine.INPE
w 962 203 100 0 n#8 hwin.hwin#289.in 992 192 992 192 egenSub.ecsCombine.INPD
w 962 267 100 0 n#9 hwin.hwin#287.in 992 256 992 256 egenSub.ecsCombine.INPC
w 1348 939 100 0 n#10 esirs.esirs#267.OMSS 1312 1248 1344 1248 1344 640 864 640 864 320 992 320 egenSub.ecsCombine.INPB
w 1412 -37 100 0 n#11 egenSub.ecsCombine.FLNK 1280 -320 1408 -320 1408 256 1536 256 esirs.esirs#239.SLNK
w 1378 427 100 0 n#12 egenSub.ecsCombine.VALA 1280 416 1536 416 esirs.esirs#239.INP
w 1404 923 100 0 n#13 esirs.esirs#267.VAL 1312 1280 1408 1280 1408 576 928 576 928 384 992 384 egenSub.ecsCombine.INPA
w 764 859 100 0 n#14 esirs.esirs#267.SLNK 896 1152 768 1152 768 576 608 576 egenSub.sysCombine.FLNK
w 658 1219 100 0 n#15 egenSub.sysCombine.OUTB 608 1216 768 1216 768 1280 896 1280 esirs.esirs#267.IMSS
w 722 1315 100 0 n#16 egenSub.sysCombine.VALA 608 1312 896 1312 esirs.esirs#267.INP
w 188 507 100 0 n#17 esirs.esirs#247.VAL -96 -64 192 -64 192 1088 320 1088 egenSub.sysCombine.INPD
w 60 1019 100 0 n#18 esirs.esirs#253.VAL -96 832 64 832 64 1216 320 1216 egenSub.sysCombine.INPB
w 82 1283 100 0 n#19 esirs.esirs#256.VAL -96 1280 320 1280 egenSub.sysCombine.INPA
w -604 1371 100 0 n#20 esirs.esirs#256.INP -512 1312 -608 1312 -608 1440 junction
w -862 1731 100 0 n#20 ecalcs.ecalcs#251.INPA -960 1632 -1056 1632 -1056 1728 -608 1728 -608 1440 -672 1440 ecalcs.ecalcs#251.VAL
s 2160 -832 200 0 Enclosure Control System
s 2224 -976 200 0 ECS General Status
s 1584 -1168 150 0 May 26, 2014
s 1600 -1088 150 0 C. Urrutia
[cell use]
use bd200tr -2144 -1320 -100 0 frame
xform 0 496 384
use ecalcs -960 1159 100 0 ecalcs#251
xform 0 -816 1424
p -800 1232 100 0 1 CALC:1+(A%100)
p -800 1200 100 0 1 SCAN:1 second
p -848 1664 100 1024 -1 name:$(top)present
use esirs 896 1063 100 0 esirs#267
xform 0 1104 1216
p 1056 1152 100 0 1 FTVL:LONG
p 1124 996 100 0 0 HHSV:NO_ALARM
p 996 1024 100 0 0 HIGH:0
p 996 996 100 0 0 HIHI:0
p 1120 1028 100 0 0 HSV:NO_ALARM
p 1024 1104 100 0 0 SNAM:
p 1104 1344 100 1024 -1 name:$(top)systemHealth
use esirs -512 1063 100 0 esirs#256
xform 0 -304 1216
p -384 992 100 0 0 BRSV:NO_ALARM
p -352 1184 100 0 1 FTVL:LONG
p -284 996 100 0 0 HHSV:NO_ALARM
p -412 1024 100 0 0 HIGH:0
p -412 996 100 0 0 HIHI:0
p -288 1028 100 0 0 HSV:NO_ALARM
p -384 1024 100 0 1 SCAN:1 second
p -416 1120 100 0 1 SNAM:heartbeatSUB
p -304 1344 100 1024 -1 name:$(top)ecsDead
use esirs -512 -281 100 0 esirs#247
xform 0 -304 -128
p -288 -208 100 256 1 FTVL:LONG
p -576 -608 100 0 0 HHSV:NO_ALARM
p -576 -640 100 0 0 HIGH:0.0
p -576 -672 100 0 0 HIHI:0.0
p -576 -704 100 0 0 HSV:NO_ALARM
p -304 -240 100 256 1 SNAM:iocStateSUB
p -304 0 100 1024 -1 name:$(top)state
use esirs 1536 167 100 0 esirs#239
xform 0 1744 320
p 1696 256 100 0 1 FTVL:LONG
p 1764 100 100 0 0 HHSV:NO_ALARM
p 1636 128 100 0 0 HIGH:0.0
p 1636 100 100 0 0 HIHI:0.0
p 1760 132 100 0 0 HSV:NO_ALARM
p 1664 208 100 0 1 SNAM:healthSUB
p 1744 448 100 1024 -1 name:$(top)health
use esirs -512 615 100 0 esirs#253
xform 0 -304 768
p -352 704 100 0 1 FTVL:LONG
p -284 548 100 0 0 HHSV:NO_ALARM
p -412 576 100 0 0 HIGH:0.0
p -412 548 100 0 0 HIHI:0.0
p -288 580 100 0 0 HSV:NO_ALARM
p -320 480 100 0 0 SCAN:1 second
p -384 656 100 0 1 SNAM:
p -304 896 100 1024 -1 name:$(top)carouselPlcDead
use esirs 1536 1063 100 0 esirs#311
xform 0 1744 1216
p 1680 1152 100 0 1 FTVL:STRING
p 1764 996 100 0 0 HHSV:NO_ALARM
p 1636 1024 100 0 0 HIGH:0
p 1636 996 100 0 0 HIHI:0
p 1760 1028 100 0 0 HSV:NO_ALARM
p 1680 1120 100 0 1 SNAM:logSUB
p 1744 1344 100 1024 -1 name:$(top)historyLog
use hwout 1536 55 100 0 hwout#312
xform 0 1632 96
p 1728 64 100 512 -1 val(outp):$(top)sad:health.IMSS
use hwin 800 -105 100 0 hwin#297
xform 0 896 -64
p 464 -64 100 0 -1 val(in):$(top)ventGateHealth.OMSS
use hwin 800 -41 100 0 hwin#295
xform 0 896 0
p 480 0 100 0 -1 val(in):$(top)ventGateHealth.VAL
use hwin 800 23 100 0 hwin#293
xform 0 896 64
p 480 64 100 0 -1 val(in):$(top)shutterHealth.OMSS
use hwin 800 87 100 0 hwin#291
xform 0 896 128
p 496 128 100 0 -1 val(in):$(top)shutterHealth.VAL
use hwin 800 151 100 0 hwin#289
xform 0 896 192
p 512 192 100 0 -1 val(in):$(top)domeHealth.OMSS
use hwin 800 215 100 0 hwin#287
xform 0 896 256
p 528 256 100 0 -1 val(in):$(top)domeHealth.VAL
use hwin -768 823 100 0 hwin#305
xform 0 -672 864
p -768 864 100 512 -1 val(in):$(top)fault:monitor.VALB
use egenSub 992 -377 100 0 ecsCombine
xform 0 1136 48
p 769 -603 100 0 0 FTA:LONG
p 769 -603 100 0 0 FTB:STRING
p 769 -635 100 0 0 FTC:LONG
p 769 -667 100 0 0 FTD:STRING
p 769 -699 100 0 0 FTE:LONG
p 769 -763 100 0 0 FTF:STRING
p 769 -763 100 0 0 FTG:LONG
p 769 -795 100 0 0 FTH:STRING
p 769 -827 100 0 0 FTI:LONG
p 769 -859 100 0 0 FTJ:STRING
p 769 -603 100 0 0 FTVA:LONG
p 769 -603 100 0 0 FTVB:STRING
p 1024 -480 100 0 1 SCAN:1 second
p 1024 -448 100 0 1 SNAM:ecsHealthProcess
use egenSub 320 519 100 0 sysCombine
xform 0 464 944
p 97 293 100 0 0 FTA:LONG
p 97 293 100 0 0 FTB:LONG
p 97 261 100 0 0 FTC:LONG
p 97 229 100 0 0 FTD:LONG
p 97 293 100 0 0 FTVA:LONG
p 97 293 100 0 0 FTVB:STRING
p 320 448 100 0 1 SCAN:Passive
p 320 480 100 0 1 SNAM:ecsSystemHealthProcess
[comments]
