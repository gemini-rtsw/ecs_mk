[schematic2]
uniq 10
[tools]
[detail]
w 1170 107 100 0 n#1 hwin.hwin#299.in 1120 96 1280 96 esirs.esirs#300.INP
w 1170 427 100 0 n#2 hwin.hwin#298.in 1120 416 1280 416 esirs.esirs#297.INP
w 1170 747 100 0 n#3 hwin.hwin#293.in 1120 736 1280 736 esirs.esirs#294.INP
w 1170 1067 100 0 n#4 hwin.hwin#292.in 1120 1056 1280 1056 esirs.esirs#291.INP
w 242 -213 100 0 n#5 hwin.hwin#289.in 192 -224 352 -224 esirs.esirs#288.INP
w 242 1059 100 0 n#6 hwin.hwin#285.in 192 1056 352 1056 esirs.esirs#256.INP
w 242 107 100 0 n#7 hwin.hwin#273.in 192 96 352 96 esirs.esirs#241.INP
w 242 427 100 0 n#8 hwin.hwin#270.in 192 416 352 416 esirs.esirs#248.INP
w 242 747 100 0 n#9 hwin.hwin#268.in 192 736 352 736 esirs.esirs#261.INP
[cell use]
use esirs 352 -473 100 0 esirs#288
xform 0 560 -320
p 560 -400 100 256 1 FTVL:DOUBLE
p 560 -432 100 256 1 PREC:2
p 560 -336 100 256 1 SCAN:1 second
p 560 -192 100 1024 -1 name:$(sad)domeTol
use esirs 352 807 100 0 esirs#256
xform 0 560 960
p 560 880 100 256 1 FTVL:DOUBLE
p 560 848 100 256 1 PREC:2
p 480 912 100 0 1 SCAN:1 second
p 576 1088 100 1024 -1 name:$(sad)domeErr
use esirs 352 167 100 0 esirs#248
xform 0 560 320
p 560 240 100 256 1 FTVL:DOUBLE
p 560 208 100 256 1 PREC:2
p 560 304 100 256 1 SCAN:1 second
p 560 448 100 1024 -1 name:$(sad)domePos
use esirs 352 -153 100 0 esirs#241
xform 0 560 0
p 560 -80 100 256 1 FTVL:STRING
p 864 -96 100 0 0 HHSV:NO_ALARM
p 736 -32 100 0 0 HIGH:4
p 736 -96 100 0 0 HIHI:5
p 864 -32 100 0 0 HSV:NO_ALARM
p 560 -48 100 256 1 SCAN:1 second
p 560 -112 100 256 0 SNAM:
p 560 128 100 1024 -1 name:$(sad)domeState
use esirs 352 487 100 0 esirs#261
xform 0 560 640
p 560 560 100 256 1 FTVL:STRING
p 288 160 100 0 0 HHSV:NO_ALARM
p 736 608 100 0 0 HIGH:1
p 288 96 100 0 0 HIHI:0.0
p 736 544 100 0 0 HSV:NO_ALARM
p 560 592 100 256 1 SCAN:1 second
p 576 528 100 256 0 SNAM:
p 416 480 100 0 0 def(INP):0.0
p 576 768 100 1024 -1 name:$(sad)domeInPos
use esirs 1280 807 100 0 esirs#291
xform 0 1488 960
p 1488 880 100 256 1 FTVL:DOUBLE
p 1488 848 100 256 1 PREC:2
p 1488 944 100 256 1 SCAN:1 second
p 1488 1088 100 1024 -1 name:$(sad)domeMax
use esirs 1280 487 100 0 esirs#294
xform 0 1488 640
p 1488 560 100 256 1 FTVL:DOUBLE
p 1488 528 100 256 1 PREC:2
p 1488 624 100 256 1 SCAN:1 second
p 1488 768 100 1024 -1 name:$(sad)domeMin
use esirs 1280 167 100 0 esirs#297
xform 0 1488 320
p 1488 240 100 256 1 FTVL:DOUBLE
p 1488 208 100 256 1 PREC:2
p 1488 304 100 256 1 SCAN:1 second
p 1488 448 100 1024 -1 name:$(sad)domeParkMax
use esirs 1280 -153 100 0 esirs#300
xform 0 1488 0
p 1488 -80 100 256 1 FTVL:DOUBLE
p 1488 -112 100 256 1 PREC:2
p 1488 -16 100 256 1 SCAN:1 second
p 1488 128 100 1024 -1 name:$(sad)domeParkMin
use hwin 0 -265 100 0 hwin#289
xform 0 96 -224
p 0 -272 100 0 -1 val(in):$(ecs)domeTol
use hwin 0 55 100 0 hwin#273
xform 0 96 96
p 0 48 100 0 -1 val(in):$(ecs)domeState.OMSS
use hwin 0 375 100 0 hwin#270
xform 0 96 416
p 0 368 100 0 -1 val(in):$(ecs)domeCalcPos.VAL
use hwin 0 695 100 0 hwin#268
xform 0 96 736
p 0 688 100 0 -1 val(in):$(ecs)domeInPos.OMSS
use hwin 0 1015 100 0 hwin#285
xform 0 96 1056
p 0 1008 100 0 -1 val(in):$(ecs)domeErr
use hwin 928 1015 100 0 hwin#292
xform 0 1024 1056
p 928 1008 100 0 -1 val(in):$(ecs)domeMax
use hwin 928 695 100 0 hwin#293
xform 0 1024 736
p 928 688 100 0 -1 val(in):$(ecs)domeMin
use hwin 928 375 100 0 hwin#298
xform 0 1024 416
p 928 368 100 0 -1 val(in):$(ecs)domeParkMax
use hwin 928 55 100 0 hwin#299
xform 0 1024 96
p 928 48 100 0 -1 val(in):$(ecs)domeParkMin
use eborderC -1136 -857 100 0 eborderC#84
xform 0 544 448
p 1544 -700 100 1024 -1 author:Bob Wooff
p 1536 -736 100 1024 -1 date:March 24, 1998
p 1940 -736 80 768 -1 file:domeSAD.sch
p 1888 -580 150 256 -1 project:Enclosure Control System
p 1712 -704 100 0 0 revision:$Revision: 1.1.1.1 $
p 1892 -652 200 256 -1 title:Dome SAD
[comments]
