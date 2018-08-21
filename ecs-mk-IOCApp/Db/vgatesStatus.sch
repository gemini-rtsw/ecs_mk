[schematic2]
uniq 27
[tools]
[detail]
w -220 -117 100 2 n#1 hwin.hwin#329.in -224 -112 -224 -112 ecalcs.ecalcs#282.SDIS
w -284 603 100 2 n#2 hwin.hwin#327.in -288 608 -288 608 ecalcs.ecalcs#276.SDIS
w 1458 363 100 0 n#3 hwin.hwin#325.in 1408 416 1440 416 1440 352 1536 352 ecalcs.ecalcs#326.INPA
w 1410 331 100 0 n#4 hwin.hwin#324.in 1344 320 1536 320 ecalcs.ecalcs#326.INPB
w 1570 -125 100 0 n#5 ecalcs.ecalcs#326.VAL 1824 160 1888 160 1888 -128 1312 -128 1312 -224 1472 -224 esirs.esirs#323.INP
w 1444 923 100 0 n#6 egenSub.ventGateCombine.FLNK 1312 640 1440 640 1440 1216 1568 1216 esirs.esirs#315.SLNK
w 1346 1291 100 0 n#7 egenSub.ventGateCombine.OUTB 1312 1280 1440 1280 1440 1344 1568 1344 esirs.esirs#315.IMSS
w 1410 1387 100 0 n#8 egenSub.ventGateCombine.VALA 1312 1376 1568 1376 esirs.esirs#315.INP
w 924 683 100 0 n#9 esirs.esirs#293.VAL 608 -256 672 -256 672 224 928 224 928 1152 1024 1152 egenSub.ventGateCombine.INPD
w 860 747 100 0 n#10 esirs.esirs#244.VAL 608 288 864 288 864 1216 1024 1216 egenSub.ventGateCombine.INPC
w 796 1051 100 0 n#11 esirs.esirs#243.VAL 608 832 800 832 800 1280 1024 1280 egenSub.ventGateCombine.INPB
w 786 1347 100 0 n#12 esirs.esirs#259.VAL 608 1344 1024 1344 egenSub.ventGateCombine.INPA
w -318 1003 100 0 n#13 hwin.hwin#279.in -288 992 -288 992 ecalcs.ecalcs#276.INPB
w -318 1035 100 0 n#14 hwin.hwin#277.in -288 1024 -288 1024 ecalcs.ecalcs#276.INPA
w -918 235 100 0 n#15 hwin.hwin#298.in -800 288 -768 288 -768 224 -1008 224 -1008 128 -928 128 esirs.esirs#296.INP
w -902 763 100 0 n#16 hwin.hwin#292.in -784 816 -736 816 -736 752 -1008 752 -1008 672 -928 672 esirs.esirs#290.INP
w 186 -117 100 0 n#17 hwin.hwin#295.in 320 -64 320 -128 112 -128 112 -224 192 -224 esirs.esirs#293.INP
w 186 1483 100 0 n#18 hwin.hwin#289.in 320 1536 320 1472 112 1472 112 1376 192 1376 esirs.esirs#259.INP
w -254 283 100 0 n#19 ecalcs.ecalcs#282.INPB -224 272 -224 272 hwin.hwin#285.in
w -254 315 100 0 n#20 ecalcs.ecalcs#282.INPA -224 304 -224 304 hwin.hwin#283.in
w -390 -309 100 0 n#21 hwin.hwin#274.in -256 -256 -256 -320 -464 -320 -464 -416 -384 -416 esirs.esirs#262.INP
w -390 1515 100 0 n#22 hwin.hwin#273.in -256 1568 -256 1504 -464 1504 -464 1408 -384 1408 esirs.esirs#263.INP
w -934 -277 100 0 n#23 hwin.hwin#270.in -800 -224 -800 -288 -1008 -288 -1008 -384 -928 -384 esirs.esirs#251.INP
w 186 427 100 0 n#24 hwin.hwin#269.in 320 480 320 416 112 416 112 320 192 320 esirs.esirs#244.INP
w -934 1515 100 0 n#25 hwin.hwin#266.in -800 1568 -800 1504 -1008 1504 -1008 1408 -928 1408 esirs.esirs#250.INP
w 186 971 100 0 n#26 hwin.hwin#264.in 320 1024 320 960 112 960 112 864 192 864 esirs.esirs#243.INP
s 1744 -1088 100 0 March 18, 1998
s 1776 -1008 150 0 Bob Woof
s 2432 -880 200 0 Vent Gate Status
s 2352 -752 200 0 Enclosure Control System
[cell use]
use bd200tr -2000 -1240 -100 0 frame
xform 0 640 464
use esirs 1472 -473 100 0 esirs#323
xform 0 1680 -320
p 1680 -400 100 256 1 FTVL:LONG
p 1568 -320 100 0 0 HIGH:0
p 1696 -320 100 0 0 HSV:NO_ALARM
p 1680 -480 100 256 1 SCAN:1 second
p 1696 -432 100 256 1 SNAM:inPositionSUB
p 1680 -192 100 1024 -1 name:$(top)vgateInPos
use esirs -928 -121 100 0 esirs#296
xform 0 -720 32
p -720 -48 100 256 1 FTVL:LONG
p -720 -80 100 256 0 PREC:0
p -704 -128 100 256 1 SCAN:1 second
p -704 -80 100 256 1 SNAM:limitSUB
p -704 160 100 1024 -1 name:$(top)westVentGateLimClose
use esirs 192 -473 100 0 esirs#293
xform 0 400 -320
p 400 -400 100 256 1 FTVL:LONG
p 400 -432 100 256 0 PREC:0
p 416 -480 100 256 1 SCAN:1 second
p 416 -432 100 256 1 SNAM:limitSUB
p 416 -192 100 1024 -1 name:$(top)westVentGateLimOpen
use esirs -928 423 100 0 esirs#290
xform 0 -720 576
p -720 496 100 256 1 FTVL:LONG
p -720 464 100 256 0 PREC:0
p -704 416 100 256 1 SCAN:1 second
p -704 464 100 256 1 SNAM:limitSUB
p -704 704 100 1024 -1 name:$(top)eastVentGateLimClose
use esirs 192 615 100 0 esirs#243
xform 0 400 768
p 336 688 100 0 1 FTVL:LONG
p 416 736 100 0 0 HHSV:NO_ALARM
p 288 768 100 0 0 HIGH:0.0
p 288 736 100 0 0 HIHI:0.0
p 416 768 100 0 0 HSV:NO_ALARM
p 400 608 100 256 1 SCAN:1 second
p 320 656 100 0 1 SNAM:mstateSUB
p 400 896 100 1024 -1 name:$(top)eastVentGateState
use esirs 192 71 100 0 esirs#244
xform 0 400 224
p 336 160 100 0 1 FTVL:LONG
p 416 192 100 0 0 HHSV:NO_ALARM
p 288 224 100 0 0 HIGH:0.0
p 288 192 100 0 0 HIHI:0.0
p 416 224 100 0 0 HSV:NO_ALARM
p 400 64 100 256 1 SCAN:1 second
p 336 112 100 0 1 SNAM:mstateSUB
p 400 352 100 1024 -1 name:$(top)westVentGateState
use esirs -928 1159 100 0 esirs#250
xform 0 -720 1312
p -704 1232 100 256 1 FTVL:DOUBLE
p -720 1200 100 256 1 PREC:2
p -720 1152 100 256 1 SCAN:1 second
p -720 1440 100 1024 -1 name:$(top)eastVentGatePos
use esirs -928 -633 100 0 esirs#251
xform 0 -720 -480
p -720 -560 100 256 1 FTVL:DOUBLE
p -704 -592 100 256 1 PREC:2
p -704 -640 100 256 1 SCAN:1 second
p -720 -352 100 1024 -1 name:$(top)westVentGatePos
use esirs 192 1127 100 0 esirs#259
xform 0 400 1280
p 400 1200 100 256 1 FTVL:LONG
p 400 1168 100 256 0 PREC:0
p 416 1120 100 256 1 SCAN:1 second
p 416 1168 100 256 1 SNAM:limitSUB
p 416 1408 100 1024 -1 name:$(top)eastVentGateLimOpen
use esirs -384 -665 100 0 esirs#262
xform 0 -176 -512
p -176 -592 100 256 1 FTVL:LONG
p -192 -672 100 256 1 SCAN:1 second
p -160 -624 100 256 1 SNAM:inPositionSUB
p -16 -576 100 0 1 def(FLNK):$(top)vgateInPosAnd
p -176 -384 100 1024 -1 name:$(top)westVentGateInPos
use esirs -384 1159 100 0 esirs#263
xform 0 -176 1312
p -176 1232 100 256 1 FTVL:LONG
p -176 1200 100 256 0 PREC:0
p -176 1152 100 256 1 SCAN:1 second
p -160 1200 100 256 1 SNAM:inPositionSUB
p -336 1120 100 0 1 def(FLNK):$(top)vgateInPosAnd
p -160 1440 100 1024 -1 name:$(top)eastVentGateInPos
use esirs 1568 1127 100 0 esirs#315
xform 0 1776 1280
p 1776 1200 100 1792 1 FTVL:LONG
p 1776 1168 100 1792 0 PREC:0
p 1776 1408 100 1024 -1 name:$(top)ventGateHealth
use hwin -416 -153 100 0 hwin#329
xform 0 -320 -112
p -480 -160 100 0 -1 val(in):$(top)fault:word6:bits.B1
use hwin -480 567 100 0 hwin#327
xform 0 -384 608
p -544 560 100 0 -1 val(in):$(top)fault:word6:bits.B1
use hwin 1216 375 100 0 hwin#325
xform 0 1312 416
p 1216 448 100 0 -1 val(in):$(top)eastVentGateInPos
use hwin 1152 279 100 0 hwin#324
xform 0 1248 320
p 1152 352 100 0 -1 val(in):$(top)westVentGateInPos
use hwin -992 247 100 0 hwin#298
xform 0 -896 288
p -992 320 100 0 -1 val(in):$(top)westVentGatemotor.LLS
use hwin 128 -105 100 0 hwin#295
xform 0 224 -64
p 128 -32 100 0 -1 val(in):$(top)westVentGatemotor.HLS
use hwin -976 775 100 0 hwin#292
xform 0 -880 816
p -976 848 100 0 -1 val(in):$(top)eastVentGatemotor.LLS
use hwin 128 1495 100 0 hwin#289
xform 0 224 1536
p 128 1568 100 0 -1 val(in):$(top)eastVentGatemotor.HLS
use hwin -448 -297 100 0 hwin#274
xform 0 -352 -256
p -448 -224 100 0 -1 val(in):$(top)westVentGatemotor.DMOV
use hwin -448 1527 100 0 hwin#273
xform 0 -352 1568
p -448 1600 100 0 -1 val(in):$(top)eastVentGatemotor.DMOV
use hwin -992 -265 100 0 hwin#270
xform 0 -896 -224
p -992 -192 100 0 -1 val(in):$(top)westVentGatemotor.MPOS
use hwin 128 439 100 0 hwin#269
xform 0 224 480
p 128 512 100 0 -1 val(in):$(top)westVentGatemotor.MIP
use hwin -992 1527 100 0 hwin#266
xform 0 -896 1568
p -992 1600 100 0 -1 val(in):$(top)eastVentGatemotor.MPOS
use hwin 128 983 100 0 hwin#264
xform 0 224 1024
p 128 1056 100 0 -1 val(in):$(top)eastVentGatemotor.MIP
use hwin -480 983 100 0 hwin#277
xform 0 -384 1024
p -496 1024 100 512 -1 val(in):$(top)eastVentGatemotor.MPOS
use hwin -480 951 100 0 hwin#279
xform 0 -384 992
p -496 992 100 512 -1 val(in):$(top)eastVentGatemotor.VAL
use hwin -416 263 100 0 hwin#283
xform 0 -320 304
p -432 304 100 512 -1 val(in):$(top)westVentGatemotor.MPOS
use hwin -416 231 100 0 hwin#285
xform 0 -320 272
p -432 272 100 512 -1 val(in):$(top)westVentGatemotor.VAL
use ecalcs 1536 -121 100 0 ecalcs#326
xform 0 1680 144
p 1712 304 100 0 1 CALC:A && B
p 1648 384 100 1024 -1 name:$(top)vgateInPosAnd
use ecalcs -288 551 100 0 ecalcs#276
xform 0 -144 816
p -192 864 100 0 1 CALC:A-B
p -96 624 100 0 1 DISV:0
p -96 656 100 0 1 SCAN:1 second
p -176 1056 100 1024 -1 name:$(top)eastVentGateErr
use ecalcs -224 -169 100 0 ecalcs#282
xform 0 -80 96
p -128 144 100 0 1 CALC:A-B
p -48 -96 100 0 1 DISV:0
p -48 -64 100 0 1 SCAN:1 second
p -112 336 100 1024 -1 name:$(top)westVentGateErr
use egenSub 1024 583 100 0 ventGateCombine
xform 0 1168 1008
p 801 357 100 0 0 FTA:LONG
p 801 357 100 0 0 FTB:LONG
p 801 325 100 0 0 FTC:LONG
p 801 293 100 0 0 FTD:LONG
p 801 357 100 0 0 FTVA:LONG
p 801 357 100 0 0 FTVB:STRING
p 1088 512 100 0 1 SCAN:1 second
p 1088 544 100 0 1 SNAM:ecsVentGateHealthProcess
[comments]
