[schematic2]
uniq 13
[tools]
[detail]
w 1410 443 100 0 n#1 hwin.hwin#301.in 1360 432 1520 432 ecalcs.ecalcs#274.SDIS
w -478 1131 100 0 n#2 hwin.hwin#299.in -512 1120 -384 1120 ecalcs.ecalcs#294.INPB
w -478 1163 100 0 n#3 hwin.hwin#270.in -512 1152 -384 1152 ecalcs.ecalcs#294.INPA
w 82 971 100 0 n#4 ecalcs.ecalcs#294.VAL -96 960 320 960 esirs.esirs#248.INP
w 194 -53 100 0 n#5 hwin.hwin#268.in 128 -64 320 -64 esirs.esirs#261.INP
w 194 299 100 0 n#6 hwin.hwin#287.in 128 288 320 288 esirs.esirs#285.INP
w 194 651 100 0 n#7 hwin.hwin#288.in 128 640 320 640 esirs.esirs#286.INP
w 194 1291 100 0 n#8 hwin.hwin#273.in 128 1280 320 1280 esirs.esirs#241.INP
w 834 1291 100 0 n#9 esirs.esirs#241.FLNK 736 1280 992 1280 992 1088 1088 1088 esirs.esirs#280.SLNK
w 882 1259 100 0 n#10 esirs.esirs#241.VAL 736 1248 1088 1248 esirs.esirs#280.INP
w 1410 827 100 0 n#11 hwin.hwin#278.in 1360 816 1520 816 ecalcs.ecalcs#274.INPB
w 1410 859 100 0 n#12 hwin.hwin#276.in 1360 848 1520 848 ecalcs.ecalcs#274.INPA
s 864 464 100 0 only update domeErr when in ECS mode
[cell use]
use esirs 320 711 100 0 esirs#248
xform 0 528 864
p 528 784 100 256 1 FTVL:DOUBLE
p 528 752 100 256 1 PREC:2
p 528 848 100 256 1 SCAN:1 second
p 528 992 100 1024 -1 name:$(top)domePos
p 272 960 75 1024 -1 pproc(INP):PP
use esirs 320 1031 100 0 esirs#241
xform 0 528 1184
p 528 1104 100 256 1 FTVL:LONG
p 832 1088 100 0 0 HHSV:NO_ALARM
p 704 1152 100 0 0 HIGH:0.0
p 704 1088 100 0 0 HIHI:0.0
p 832 1152 100 0 0 HSV:NO_ALARM
p 528 1136 100 256 1 SCAN:1 second
p 528 1072 100 256 1 SNAM:mstateSUB
p 528 1312 100 1024 -1 name:$(top)domeState
use esirs 320 -313 100 0 esirs#261
xform 0 528 -160
p 528 -240 100 256 1 FTVL:LONG
p 256 -640 100 0 0 HHSV:NO_ALARM
p 704 -192 100 0 0 HIGH:0.0
p 256 -704 100 0 0 HIHI:0.0
p 704 -256 100 0 0 HSV:NO_ALARM
p 528 -208 100 256 1 SCAN:1 second
p 544 -272 100 256 1 SNAM:inPositionSUB
p 384 -320 100 0 0 def(INP):0.0
p 544 -32 100 1024 -1 name:$(top)domeInPos
use esirs 1088 999 100 0 esirs#280
xform 0 1296 1152
p 1296 1072 100 1792 1 FTVL:LONG
p 1296 1040 100 1792 0 PREC:0
p 1152 960 100 0 1 SNAM:ecsDomeHealthProcess
p 1296 1280 100 1024 -1 name:$(top)domeHealth
use esirs 320 39 100 0 esirs#285
xform 0 528 192
p 528 112 100 256 1 FTVL:LONG
p 544 160 100 0 0 HHSV:NO_ALARM
p 416 192 100 0 0 HIGH:0.0
p 416 160 100 0 0 HIHI:0.0
p 544 192 100 0 0 HSV:NO_ALARM
p 528 32 100 256 1 SCAN:1 second
p 544 80 100 256 1 SNAM:limitSUB
p 544 320 100 1024 -1 name:$(top)domeLimClose
use esirs 320 391 100 0 esirs#286
xform 0 528 544
p 528 464 100 256 1 FTVL:LONG
p 544 512 100 0 0 HHSV:NO_ALARM
p 416 544 100 0 0 HIGH:0.0
p 416 512 100 0 0 HIHI:0.0
p 544 544 100 0 0 HSV:NO_ALARM
p 544 384 100 256 1 SCAN:1 second
p 544 432 100 256 1 SNAM:limitSUB
p 544 672 100 1024 -1 name:$(top)domeLimOpen
use hwin 1168 391 100 0 hwin#301
xform 0 1264 432
p 864 416 100 0 -1 val(in):$(top)fault:word6:bits.B1
use hwin -704 1079 100 0 hwin#299
xform 0 -608 1120
p -960 1120 100 0 -1 val(in):$(top)domeAzOffset
use hwin 1168 775 100 0 hwin#278
xform 0 1264 816
p 1152 800 100 512 -1 val(in):$(top)domemotor.VAL
use hwin 1168 807 100 0 hwin#276
xform 0 1264 848
p 1152 832 100 512 -1 val(in):$(top)domemotor.MPOS
use hwin -64 1239 100 0 hwin#273
xform 0 32 1280
p -64 1232 100 0 -1 val(in):$(top)domemotor.MIP
use hwin -704 1111 100 0 hwin#270
xform 0 -608 1152
p -960 1152 100 0 -1 val(in):$(top)domemotor.MPOS
use hwin -64 -105 100 0 hwin#268
xform 0 32 -64
p -64 -112 100 0 -1 val(in):$(top)domemotor.DMOV
use hwin -64 247 100 0 hwin#287
xform 0 32 288
p -64 320 100 0 -1 val(in):$(top)domemotor.LLS
use hwin -64 599 100 0 hwin#288
xform 0 32 640
p -64 672 100 0 -1 val(in):$(top)domemotor.HLS
use ecalcs -384 679 100 0 ecalcs#294
xform 0 -240 944
p -480 640 100 0 1 CALC:(A+B<360)?(A+B):(A+B-360)
p -672 830 100 0 0 EGU:units
p 1800 -572 100 1024 -1 author:Bob Wooff
p 1792 -608 100 1024 -1 date:April 21, 1998
p 2196 -608 80 768 -1 file:domeStatus.sch
p -352 672 100 1024 1 name:$(top)domeCalcPos
p 2144 -452 150 256 -1 project:Enclosure Control System
p 1968 -576 100 0 0 revision:$Revision: 1.6 $
p 2148 -524 200 256 -1 title:Dome Status
use ecalcs 1520 375 100 0 ecalcs#274
xform 0 1664 640
p 1616 720 100 0 1 CALC:A-B
p 1552 304 100 0 1 DISV:0
p 1552 336 100 0 1 PREC:1
p 1552 368 100 0 1 SCAN:1 second
p 1616 880 100 1024 -1 name:$(top)domeErr
use eborderC -1136 -857 100 0 eborderC#84
xform 0 544 448
[comments]
