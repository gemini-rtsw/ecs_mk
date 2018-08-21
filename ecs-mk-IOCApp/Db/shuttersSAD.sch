[schematic2]
uniq 21
[tools]
[detail]
w 322 -213 100 0 n#1 esirs.esirs#405.INP 352 -224 352 -224 hwin.hwin#406.in
w 322 171 100 0 n#2 esirs.esirs#401.INP 352 160 352 160 hwin.hwin#402.in
w 1570 747 100 0 n#3 hwin.hwin#311.in 1600 736 1600 736 esirs.esirs#309.INP
w 1570 427 100 0 n#4 hwin.hwin#308.in 1600 416 1600 416 esirs.esirs#306.INP
w 1570 1067 100 0 n#5 hwin.hwin#283.in 1600 1056 1600 1056 esirs.esirs#258.INP
w 1570 1387 100 0 n#6 hwin.hwin#360.in 1600 1376 1600 1376 esirs.esirs#266.INP
w 1570 -213 100 0 n#7 hwin.hwin#364.in 1600 -224 1600 -224 esirs.esirs#270.INP
w 1570 107 100 0 n#8 hwin.hwin#365.in 1600 96 1600 96 esirs.esirs#269.INP
w 866 1067 100 0 n#9 esirs.esirs#273.INP 896 1056 896 1056 hwin.hwin#279.in
w 866 1387 100 0 n#10 esirs.esirs#264.INP 896 1376 896 1376 hwin.hwin#280.in
w -94 1387 100 0 n#11 esirs.esirs#263.INP -64 1376 -64 1376 hwin.hwin#276.in
w -94 1067 100 0 n#12 esirs.esirs#242.INP -64 1056 -64 1056 hwin.hwin#274.in
w -94 747 100 0 n#13 esirs.esirs#378.INP -64 736 -64 736 hwin.hwin#379.in
w 866 747 100 0 n#14 esirs.esirs#381.INP 896 736 896 736 hwin.hwin#382.in
w -798 747 100 0 n#15 hwin.hwin#305.in -768 736 -768 736 esirs.esirs#303.INP
w -798 427 100 0 n#16 hwin.hwin#302.in -768 416 -768 416 esirs.esirs#259.INP
w -798 1067 100 0 n#17 hwin.hwin#284.in -768 1056 -768 1056 esirs.esirs#262.INP
w -798 1387 100 0 n#18 hwin.hwin#358.in -768 1376 -768 1376 esirs.esirs#265.INP
w -798 -213 100 0 n#19 hwin.hwin#368.in -768 -224 -768 -224 esirs.esirs#268.INP
w -798 107 100 0 n#20 hwin.hwin#369.in -768 96 -768 96 esirs.esirs#267.INP
[cell use]
use hwin 704 695 100 0 hwin#382
xform 0 800 736
p 704 768 100 0 -1 val(in):$(ecs)botShtrTol
use hwin -256 695 100 0 hwin#379
xform 0 -160 736
p -256 768 100 0 -1 val(in):$(ecs)topShtrTol
use hwin -960 55 100 0 hwin#369
xform 0 -864 96
p -960 128 100 0 -1 val(in):$(ecs)topShtrMax
use hwin -960 -265 100 0 hwin#368
xform 0 -864 -224
p -960 -192 100 0 -1 val(in):$(ecs)topShtrMin
use hwin 1408 55 100 0 hwin#365
xform 0 1504 96
p 1408 128 100 0 -1 val(in):$(ecs)botShtrMax
use hwin 1408 -265 100 0 hwin#364
xform 0 1504 -224
p 1408 -192 100 0 -1 val(in):$(ecs)botShtrMin
use hwin 1408 1335 100 0 hwin#360
xform 0 1504 1376
p 1392 1408 100 0 -1 val(in):$(ecs)botShtrErr
use hwin -960 1335 100 0 hwin#358
xform 0 -864 1376
p -960 1408 100 0 -1 val(in):$(ecs)topShtrErr
use hwin -960 1015 100 0 hwin#284
xform 0 -864 1056
p -976 1104 100 0 -1 val(in):$(ecs)topShtrInPos.OMSS
use hwin 1408 1015 100 0 hwin#283
xform 0 1504 1056
p 1376 1104 100 0 -1 val(in):$(ecs)botShtrInPos.OMSS
use hwin 704 1335 100 0 hwin#280
xform 0 800 1376
p 656 1424 100 0 -1 val(in):$(ecs)botShtrCalcPos.VAL
use hwin 704 1015 100 0 hwin#279
xform 0 800 1056
p 688 1104 100 0 -1 val(in):$(ecs)botShtrState.OMSS
use hwin -256 1335 100 0 hwin#276
xform 0 -160 1376
p -272 1424 100 0 -1 val(in):$(ecs)topShtrCalcPos.VAL
use hwin -256 1015 100 0 hwin#274
xform 0 -160 1056
p -272 1104 100 0 -1 val(in):$(ecs)topShtrState.OMSS
use hwin -960 375 100 0 hwin#302
xform 0 -864 416
p -992 464 100 0 -1 val(in):$(ecs)topShtrLimOpen.OMSS
use hwin -960 695 100 0 hwin#305
xform 0 -864 736
p -1024 784 100 0 -1 val(in):$(ecs)topShtrLimClose.OMSS
use hwin 1408 375 100 0 hwin#308
xform 0 1504 416
p 1360 464 100 0 -1 val(in):$(ecs)botShtrLimOpen.OMSS
use hwin 1408 695 100 0 hwin#311
xform 0 1504 736
p 1360 784 100 0 -1 val(in):$(ecs)botShtrLimClose.OMSS
use hwin 160 119 100 0 hwin#402
xform 0 256 160
p 144 208 100 0 -1 val(in):$(ecs)shtrInPos.OMSS
use hwin 160 -265 100 0 hwin#406
xform 0 256 -224
p 144 -176 100 0 -1 val(in):$(ecs)shtrSealed.OMSS
use esirs 896 487 100 0 esirs#381
xform 0 1104 640
p 1040 560 100 0 1 FTVL:DOUBLE
p 1120 608 100 0 0 HHSV:NO_ALARM
p 992 640 100 0 0 HIGH:5
p 992 608 100 0 0 HIHI:6
p 1120 640 100 0 0 HSV:NO_ALARM
p 1088 416 100 0 0 PREC:2
p 1088 528 100 256 1 SCAN:1 second
p 1104 528 100 256 0 SNAM:
p 1104 768 100 1024 -1 name:$(sad)botShtrTol
use esirs -64 487 100 0 esirs#378
xform 0 144 640
p 80 560 100 0 1 FTVL:DOUBLE
p 160 608 100 0 0 HHSV:NO_ALARM
p 32 640 100 0 0 HIGH:5
p 32 608 100 0 0 HIHI:6
p 160 640 100 0 0 HSV:NO_ALARM
p 128 416 100 0 0 PREC:2
p 128 528 100 256 1 SCAN:1 second
p 144 528 100 256 0 SNAM:
p 144 768 100 1024 -1 name:$(sad)topShtrTol
use esirs 1600 -473 100 0 esirs#270
xform 0 1808 -320
p 1824 -400 100 256 1 FTVL:DOUBLE
p 1824 -432 100 256 1 PREC:2
p 1808 -368 100 256 1 SCAN:1 second
p 1824 -192 100 1024 -1 name:$(sad)botShtrMin
use esirs 1600 -153 100 0 esirs#269
xform 0 1808 0
p 1808 -80 100 256 1 FTVL:DOUBLE
p 1808 -112 100 256 1 PREC:2
p 1808 -48 100 256 1 SCAN:1 second
p 1808 128 100 1024 -1 name:$(sad)botShtrMax
use esirs -768 -473 100 0 esirs#268
xform 0 -560 -320
p -560 -400 100 256 1 FTVL:DOUBLE
p -560 -432 100 256 1 PREC:2
p -560 -352 100 256 1 SCAN:1 second
p -560 -192 100 1024 -1 name:$(sad)topShtrMin
use esirs -768 -153 100 0 esirs#267
xform 0 -560 0
p -560 -80 100 256 1 FTVL:DOUBLE
p -560 -112 100 256 1 PREC:2
p -560 -48 100 256 1 SCAN:1 second
p -560 128 100 1024 -1 name:$(sad)topShtrMax
use esirs -768 807 100 0 esirs#262
xform 0 -560 960
p -560 848 100 256 1 FTVL:STRING
p -832 480 100 0 0 HHSV:NO_ALARM
p -672 960 100 0 0 HIGH:1
p -832 416 100 0 0 HIHI:0.0
p -544 960 100 0 0 HSV:NO_ALARM
p -560 880 100 256 1 SCAN:1 second
p -544 848 100 256 0 SNAM:
p -560 1088 100 1024 -1 name:$(sad)topShtrInPos
use esirs -768 167 100 0 esirs#259
xform 0 -560 320
p -560 240 100 256 1 FTVL:STRING
p -544 288 100 0 0 HHSV:NO_ALARM
p -672 320 100 0 0 HIGH:2
p -672 288 100 0 0 HIHI:3
p -544 320 100 0 0 HSV:NO_ALARM
p -560 208 100 256 1 SCAN:1 second
p -544 208 100 256 0 SNAM:
p -544 448 100 1024 -1 name:$(sad)topShtrLimOpen
use esirs 1600 807 100 0 esirs#258
xform 0 1808 960
p 1808 880 100 256 1 FTVL:STRING
p 1536 480 100 0 0 HHSV:NO_ALARM
p 1696 960 100 0 0 HIGH:1
p 1536 416 100 0 0 HIHI:0.0
p 1824 960 100 0 0 HSV:NO_ALARM
p 1808 848 100 256 1 SCAN:1 second
p 1824 848 100 256 0 SNAM:
p 1808 1088 100 1024 -1 name:$(sad)botShtrInPos
use esirs -64 807 100 0 esirs#242
xform 0 144 960
p 80 880 100 0 1 FTVL:STRING
p 160 928 100 0 0 HHSV:NO_ALARM
p 32 960 100 0 0 HIGH:5
p 32 928 100 0 0 HIHI:6
p 160 960 100 0 0 HSV:NO_ALARM
p 128 848 100 256 1 SCAN:1 second
p 144 848 100 256 0 SNAM:
p 144 1088 100 1024 -1 name:$(sad)topShtrState
use esirs -64 1127 100 0 esirs#263
xform 0 144 1280
p 144 1200 100 256 1 FTVL:DOUBLE
p 144 1168 100 256 1 PREC:2
p 144 1232 100 256 1 SCAN:1 second
p 144 1408 100 1024 -1 name:$(sad)topShtrPos
use esirs 896 1127 100 0 esirs#264
xform 0 1104 1280
p 1104 1200 100 256 1 FTVL:DOUBLE
p 1104 1168 100 256 1 PREC:2
p 1104 1232 100 256 1 SCAN:1 second
p 1104 1424 100 1024 -1 name:$(sad)botShtrPos
use esirs -768 1127 100 0 esirs#265
xform 0 -560 1280
p -544 1200 100 256 1 FTVL:DOUBLE
p -560 1168 100 256 1 PREC:2
p -560 1232 100 256 1 SCAN:1 second
p -544 1408 100 1024 -1 name:$(sad)topShtrErr
use esirs 1600 1127 100 0 esirs#266
xform 0 1808 1280
p 1808 1200 100 256 1 FTVL:DOUBLE
p 1808 1168 100 256 1 PREC:2
p 1808 1248 100 256 1 SCAN:1 second
p 1808 1408 100 1024 -1 name:$(sad)botShtrErr
use esirs 896 807 100 0 esirs#273
xform 0 1104 960
p 1104 880 100 256 1 FTVL:STRING
p 1120 928 100 0 0 HHSV:NO_ALARM
p 992 960 100 0 0 HIGH:4
p 992 928 100 0 0 HIHI:5
p 1120 960 100 0 0 HSV:NO_ALARM
p 1104 848 100 256 1 SCAN:1 second
p 1104 848 100 256 0 SNAM:
p 1104 1088 100 1024 -1 name:$(sad)botShtrState
use esirs -768 487 100 0 esirs#303
xform 0 -560 640
p -560 528 100 256 1 FTVL:STRING
p -544 608 100 0 0 HHSV:NO_ALARM
p -672 640 100 0 0 HIGH:2
p -672 608 100 0 0 HIHI:3
p -544 640 100 0 0 HSV:MINOR
p -544 576 100 256 1 SCAN:1 second
p -544 528 100 256 0 SNAM:
p -544 768 100 1024 -1 name:$(sad)topShtrLimClose
use esirs 1600 167 100 0 esirs#306
xform 0 1808 320
p 1808 240 100 256 1 FTVL:STRING
p 1824 288 100 0 0 HHSV:NO_ALARM
p 1696 320 100 0 0 HIGH:2
p 1696 288 100 0 0 HIHI:3
p 1824 320 100 0 0 HSV:NO_ALARM
p 1808 208 100 256 1 SCAN:1 second
p 1824 208 100 256 0 SNAM:
p 1824 448 100 1024 -1 name:$(sad)botShtrLimOpen
use esirs 1600 487 100 0 esirs#309
xform 0 1808 640
p 1808 560 100 256 1 FTVL:STRING
p 1824 608 100 0 0 HHSV:NO_ALARM
p 1696 640 100 0 0 HIGH:2
p 1696 608 100 0 0 HIHI:3
p 1824 640 100 0 0 HSV:NO_ALARM
p 1808 528 100 256 1 SCAN:1 second
p 1824 528 100 256 0 SNAM:
p 1824 768 100 1024 -1 name:$(sad)botShtrLimClose
use esirs 352 -89 100 0 esirs#401
xform 0 560 64
p 560 -48 100 256 1 FTVL:STRING
p 288 -416 100 0 0 HHSV:NO_ALARM
p 448 64 100 0 0 HIGH:1
p 288 -480 100 0 0 HIHI:0.0
p 576 64 100 0 0 HSV:NO_ALARM
p 560 -16 100 256 1 SCAN:1 second
p 576 -48 100 256 0 SNAM:
p 560 192 100 1024 -1 name:$(sad)shtrInPos
use esirs 352 -473 100 0 esirs#405
xform 0 560 -320
p 560 -432 100 256 1 FTVL:STRING
p 288 -800 100 0 0 HHSV:NO_ALARM
p 448 -320 100 0 0 HIGH:1
p 288 -864 100 0 0 HIHI:0.0
p 576 -320 100 0 0 HSV:NO_ALARM
p 560 -400 100 256 1 SCAN:1 second
p 576 -432 100 256 0 SNAM:
p 560 -192 100 1024 -1 name:$(sad)shtrSealed
use eborderC -1152 -857 100 0 eborderC#84
xform 0 528 448
p 1532 -700 100 1024 -1 author:Bob Wooff
p 1524 -736 100 1024 -1 date:May 13, 1998
p 1924 -736 80 768 -1 file:shuttersSAD.sch
p 1872 -576 100 256 -1 project:Gemini Enclosure Control System
p 1696 -696 100 0 0 revision:$Revision: 1.1.1.1 $
p 1872 -640 200 256 -1 title:Shutter SAD
[comments]
