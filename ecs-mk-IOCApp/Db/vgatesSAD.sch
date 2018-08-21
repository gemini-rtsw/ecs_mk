[schematic2]
uniq 20
[tools]
[detail]
w 386 299 100 0 n#1 esirs.esirs#385.INP 416 288 416 288 hwin.hwin#386.in
w -62 1131 100 0 n#2 hwin.hwin#365.in -32 1120 -32 1120 esirs.esirs#364.INP
w 1570 171 100 0 n#3 hwin.hwin#340.in 1600 160 1600 160 esirs.esirs#341.INP
w 1570 491 100 0 n#4 hwin.hwin#295.in 1600 480 1600 480 esirs.esirs#293.INP
w 1570 811 100 0 n#5 hwin.hwin#343.in 1600 800 1600 800 esirs.esirs#344.INP
w 1570 1131 100 0 n#6 hwin.hwin#346.in 1600 1120 1600 1120 esirs.esirs#347.INP
w 1570 1451 100 0 n#7 hwin.hwin#320.in 1600 1440 1600 1440 esirs.esirs#253.INP
w 834 811 100 0 n#8 hwin.hwin#353.in 864 800 864 800 esirs.esirs#354.INP
w -62 811 100 0 n#9 hwin.hwin#350.in -32 800 -32 800 esirs.esirs#351.INP
w 1570 -149 100 0 n#10 hwin.hwin#269.in 1600 -160 1600 -160 esirs.esirs#244.INP
w -798 -149 100 0 n#11 hwin.hwin#329.in -768 -160 -768 -160 esirs.esirs#330.INP
w 834 1131 100 0 n#12 hwin.hwin#359.in 864 1120 864 1120 esirs.esirs#358.INP
w 834 1451 100 0 n#13 hwin.hwin#362.in 864 1440 864 1440 esirs.esirs#363.INP
w -798 171 100 0 n#14 hwin.hwin#270.in -768 160 -768 160 esirs.esirs#251.INP
w -798 1131 100 0 n#15 hwin.hwin#274.in -768 1120 -768 1120 esirs.esirs#262.INP
w -798 811 100 0 n#16 hwin.hwin#298.in -768 800 -768 800 esirs.esirs#296.INP
w -798 1451 100 0 n#17 hwin.hwin#326.in -768 1440 -768 1440 esirs.esirs#327.INP
w -798 491 100 0 n#18 hwin.hwin#333.in -768 480 -768 480 esirs.esirs#334.INP
w -62 1451 100 0 n#19 hwin.hwin#356.in -32 1440 -32 1440 esirs.esirs#357.INP
[cell use]
use hwin -224 1079 100 0 hwin#365
xform 0 -128 1120
p -240 1168 100 0 -1 val(in):$(ecs)eastVentGateMin
use hwin 672 1399 100 0 hwin#362
xform 0 768 1440
p 656 1488 100 0 -1 val(in):$(ecs)westVentGateMax
use hwin 672 1079 100 0 hwin#359
xform 0 768 1120
p 656 1152 100 0 -1 val(in):$(ecs)westVentGateMin
use hwin -224 1399 100 0 hwin#356
xform 0 -128 1440
p -240 1488 100 0 -1 val(in):$(ecs)eastVentGateMax
use hwin 1408 1079 100 0 hwin#346
xform 0 1504 1120
p 1312 1168 100 0 -1 val(in):$(ecs)westVentGateInPos.OMSS
use hwin 1408 759 100 0 hwin#343
xform 0 1504 800
p 1296 864 100 0 -1 val(in):$(ecs)westVentGateLimClose.OMSS
use hwin 1408 119 100 0 hwin#340
xform 0 1504 160
p 1328 224 100 0 -1 val(in):$(ecs)westVentGatemotor.MPOS
use hwin -960 439 100 0 hwin#333
xform 0 -864 480
p -1072 528 100 0 -1 val(in):$(ecs)eastVentGateLimOpen.OMSS
use hwin -960 -201 100 0 hwin#329
xform 0 -864 -160
p -1040 -96 100 0 -1 val(in):$(ecs)eastVentGateState.OMSS
use hwin -960 1399 100 0 hwin#326
xform 0 -864 1440
p -976 1488 100 0 -1 val(in):$(ecs)eastVentGateErr
use hwin 1408 1399 100 0 hwin#320
xform 0 1504 1440
p 1392 1488 100 0 -1 val(in):$(ecs)westVentGateErr
use hwin -960 759 100 0 hwin#298
xform 0 -864 800
p -1056 848 100 0 -1 val(in):$(ecs)eastVentGateLimClose.OMSS
use hwin 1408 439 100 0 hwin#295
xform 0 1504 480
p 1296 528 100 0 -1 val(in):$(ecs)westVentGateLimOpen.OMSS
use hwin -960 1079 100 0 hwin#274
xform 0 -864 1120
p -1024 1184 100 0 -1 val(in):$(ecs)eastVentGateInPos.OMSS
use hwin -960 119 100 0 hwin#270
xform 0 -864 160
p -1040 208 100 0 -1 val(in):$(ecs)eastVentGatemotor.MPOS
use hwin 1408 -201 100 0 hwin#269
xform 0 1504 -160
p 1312 -112 100 0 -1 val(in):$(ecs)westVentGateState.OMSS
use hwin -224 759 100 0 hwin#350
xform 0 -128 800
p -240 848 100 0 -1 val(in):$(ecs)eastVentGateTol
use hwin 672 759 100 0 hwin#353
xform 0 768 800
p 656 848 100 0 -1 val(in):$(ecs)westVentGateTol
use hwin 224 247 100 0 hwin#386
xform 0 320 288
p 160 352 100 0 -1 val(in):$(ecs)vgateInPos.OMSS
use esirs -32 871 100 0 esirs#364
xform 0 176 1024
p 176 944 100 256 1 FTVL:DOUBLE
p 192 912 100 256 1 PREC:2
p 176 992 100 256 1 SCAN:1 second
p 176 1152 100 1024 -1 name:$(sad)eastVentGateMin
use esirs 864 1191 100 0 esirs#363
xform 0 1072 1344
p 1072 1264 100 256 1 FTVL:DOUBLE
p 1088 1232 100 256 1 PREC:2
p 1072 1312 100 256 1 SCAN:1 second
p 1072 1472 100 1024 -1 name:$(sad)westVentGateMax
use esirs 864 871 100 0 esirs#358
xform 0 1072 1024
p 1072 944 100 256 1 FTVL:DOUBLE
p 1088 912 100 256 1 PREC:2
p 1072 992 100 256 1 SCAN:1 second
p 1072 1152 100 1024 -1 name:$(sad)westVentGateMin
use esirs -32 1191 100 0 esirs#357
xform 0 176 1344
p 176 1264 100 256 1 FTVL:DOUBLE
p 192 1232 100 256 1 PREC:2
p 176 1312 100 256 1 SCAN:1 second
p 176 1472 100 1024 -1 name:$(sad)eastVentGateMax
use esirs 1600 871 100 0 esirs#347
xform 0 1808 1024
p 1808 944 100 256 1 FTVL:STRING
p 1808 912 100 256 1 SCAN:1 second
p 1824 912 100 256 0 SNAM:
p 1808 1152 100 1024 -1 name:$(sad)westVentGateInPos
use esirs 1600 551 100 0 esirs#344
xform 0 1808 704
p 1808 624 100 256 1 FTVL:STRING
p 1808 592 100 256 0 PREC:0
p 1808 592 100 256 1 SCAN:1 second
p 1824 592 100 256 0 SNAM:
p 1824 832 100 1024 -1 name:$(sad)westVentGateLimClose
use esirs 1600 -89 100 0 esirs#341
xform 0 1808 64
p 1808 -16 100 256 1 FTVL:DOUBLE
p 1824 -48 100 256 1 PREC:2
p 1808 32 100 256 1 SCAN:1 second
p 1808 192 100 1024 -1 name:$(sad)westVentGatePos
use esirs -768 231 100 0 esirs#334
xform 0 -560 384
p -560 304 100 256 1 FTVL:STRING
p -560 272 100 256 0 PREC:0
p -560 272 100 256 1 SCAN:1 second
p -544 272 100 256 0 SNAM:
p -544 512 100 1024 -1 name:$(sad)eastVentGateLimOpen
use esirs -768 -409 100 0 esirs#330
xform 0 -560 -256
p -624 -320 100 0 1 FTVL:STRING
p -544 -288 100 0 0 HHSV:NO_ALARM
p -672 -256 100 0 0 HIGH:4
p -672 -288 100 0 0 HIHI:5
p -544 -256 100 0 0 HSV:NO_ALARM
p -560 -368 100 256 1 SCAN:1 second
p -624 -368 100 0 0 SNAM:
p -560 -128 100 1024 -1 name:$(sad)eastVentGateState
use esirs -768 1191 100 0 esirs#327
xform 0 -560 1344
p -560 1264 100 256 1 FTVL:DOUBLE
p -560 1232 100 256 1 PREC:2
p -560 1296 100 256 1 SCAN:1 second
p -560 1472 100 1024 -1 name:$(sad)eastVentGateErr
use esirs 1600 1191 100 0 esirs#253
xform 0 1808 1344
p 1808 1264 100 256 1 FTVL:DOUBLE
p 1808 1232 100 256 1 PREC:2
p 1808 1296 100 256 1 SCAN:1 second
p 1808 1472 100 1024 -1 name:$(sad)westVentGateErr
use esirs -768 551 100 0 esirs#296
xform 0 -560 704
p -560 624 100 256 1 FTVL:STRING
p -560 592 100 256 0 PREC:0
p -560 592 100 256 1 SCAN:1 second
p -544 592 100 256 0 SNAM:
p -544 832 100 1024 -1 name:$(sad)eastVentGateLimClose
use esirs 1600 231 100 0 esirs#293
xform 0 1808 384
p 1808 304 100 256 1 FTVL:STRING
p 1808 272 100 256 0 PREC:0
p 1808 272 100 256 1 SCAN:1 second
p 1824 272 100 256 0 SNAM:
p 1824 512 100 1024 -1 name:$(sad)westVentGateLimOpen
use esirs 1600 -409 100 0 esirs#244
xform 0 1808 -256
p 1744 -320 100 0 1 FTVL:STRING
p 1824 -288 100 0 0 HHSV:NO_ALARM
p 1696 -256 100 0 0 HIGH:4
p 1696 -288 100 0 0 HIHI:5
p 1824 -256 100 0 0 HSV:NO_ALARM
p 1808 -368 100 256 1 SCAN:1 second
p 1744 -368 100 0 0 SNAM:
p 1808 -128 100 1024 -1 name:$(sad)westVentGateState
use esirs -768 -89 100 0 esirs#251
xform 0 -560 64
p -560 -16 100 256 1 FTVL:DOUBLE
p -544 -48 100 256 1 PREC:2
p -560 32 100 256 1 SCAN:1 second
p -560 192 100 1024 -1 name:$(sad)eastVentGatePos
use esirs -768 871 100 0 esirs#262
xform 0 -560 1024
p -560 944 100 256 1 FTVL:STRING
p -560 912 100 256 1 SCAN:1 second
p -544 912 100 256 0 SNAM:
p -560 1152 100 1024 -1 name:$(sad)eastVentGateInPos
use esirs -32 551 100 0 esirs#351
xform 0 176 704
p 176 624 100 256 1 FTVL:DOUBLE
p 176 592 100 256 1 PREC:2
p 176 656 100 256 1 SCAN:1 second
p 176 832 100 1024 -1 name:$(sad)eastVentGateTol
use esirs 864 551 100 0 esirs#354
xform 0 1072 704
p 1072 624 100 256 1 FTVL:DOUBLE
p 1072 592 100 256 1 PREC:2
p 1072 656 100 256 1 SCAN:1 second
p 1072 832 100 1024 -1 name:$(sad)westVentGateTol
use esirs 416 39 100 0 esirs#385
xform 0 624 192
p 624 112 100 256 1 FTVL:STRING
p 624 80 100 256 1 SCAN:1 second
p 640 80 100 256 0 SNAM:
p 624 320 100 1024 -1 name:$(sad)vgateInPos
use eborderC -1152 -825 100 0 eborderC#84
xform 0 528 480
p 1528 -668 100 1024 -1 author:Bob Wooff
p 1524 -704 100 1024 -1 date:March 24, 1998
p 1924 -704 80 768 -1 file:vgatesStatus.sch
p 1872 -548 150 256 -1 project:Enclosure Control System
p 1696 -672 100 0 0 revision:$Revision: 1.1.1.1 $
p 1876 -616 200 256 -1 title:Vent Gate SAD
[comments]
