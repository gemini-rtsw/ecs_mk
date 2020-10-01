[schematic2]
uniq 25
[tools]
[detail]
w 388 -965 100 2 n#1 hwin.hwin#83.in 384 -960 384 -960 ecalcs.ecalcs#76.INPA
w 388 -997 100 2 n#2 hwin.hwin#85.in 384 -992 384 -992 ecalcs.ecalcs#76.INPB
w 964 -965 100 2 n#3 hwin.hwin#87.in 960 -960 960 -960 ecalcs.ecalcs#77.INPA
w 964 -997 100 2 n#4 hwin.hwin#89.in 960 -992 960 -992 ecalcs.ecalcs#77.INPB
w 1508 -965 100 2 n#5 hwin.hwin#91.in 1504 -960 1504 -960 ecalcs.ecalcs#78.INPA
w 1508 -997 100 2 n#6 hwin.hwin#93.in 1504 -992 1504 -992 ecalcs.ecalcs#78.INPB
w -188 -965 100 2 n#7 hwin.hwin#79.in -192 -960 -192 -960 ecalcs.ecalcs#75.INPA
w -188 -997 100 2 n#8 hwin.hwin#81.in -192 -992 -192 -992 ecalcs.ecalcs#75.INPB
w 1508 -453 100 2 n#9 hwin.hwin#69.in 1504 -448 1504 -448 ecalcs.ecalcs#40.INPB
w 1508 -421 100 2 n#10 hwin.hwin#67.in 1504 -416 1504 -416 ecalcs.ecalcs#40.INPA
w 964 -453 100 2 n#11 hwin.hwin#61.in 960 -448 960 -448 ecalcs.ecalcs#39.INPB
w 964 -421 100 2 n#12 hwin.hwin#59.in 960 -416 960 -416 ecalcs.ecalcs#39.INPA
w 388 -453 100 2 n#13 hwin.hwin#49.in 384 -448 384 -448 ecalcs.ecalcs#36.INPB
w 388 -421 100 2 n#14 hwin.hwin#47.in 384 -416 384 -416 ecalcs.ecalcs#36.INPA
w -188 -453 100 2 n#15 hwin.hwin#45.in -192 -448 -192 -448 ecalcs.ecalcs#35.INPB
w -188 -421 100 2 n#16 hwin.hwin#43.in -192 -416 -192 -416 ecalcs.ecalcs#35.INPA
w 776 395 100 0 n#17 abWordGetScale.abWordGetScale#17.wordOut 32 192 96 192 96 384 1504 384 ecalcs.ecalcs#22.INPA
w 968 363 100 0 n#18 abWordGetScale.abWordGetScale#18.wordOut 416 192 480 192 480 352 1504 352 ecalcs.ecalcs#22.INPB
w 1160 331 100 0 n#19 abWordGetScale.abWordGetScale#19.wordOut 800 192 864 192 864 320 1504 320 ecalcs.ecalcs#22.INPC
w 1352 299 100 0 n#20 abWordGetScale.abWordGetScale#20.wordOut 1184 192 1248 192 1248 288 1504 288 ecalcs.ecalcs#22.INPD
w 776 971 100 0 n#21 abWordGetScale.abWordGetScale#13.wordOut 32 704 96 704 96 960 1504 960 ecalcs.ecalcs#21.INPA
w 968 939 100 0 n#22 abWordGetScale.abWordGetScale#14.wordOut 416 704 480 704 480 928 1504 928 ecalcs.ecalcs#21.INPB
w 1160 907 100 0 n#23 abWordGetScale.abWordGetScale#15.wordOut 800 704 864 704 864 896 1504 896 ecalcs.ecalcs#21.INPC
w 1352 875 100 0 n#24 abWordGetScale.abWordGetScale#16.wordOut 1184 704 1248 704 1248 864 1504 864 ecalcs.ecalcs#21.INPD
s 1283 -309 100 0 04/Apr/03
s 1264 -275 100 0 Pedro Gigoux
s 1520 -224 100 0 Shutter Drive Currents
s 1520 -160 100 0 Enclosure Control System
[cell use]
use bb200tr -544 -440 -100 0 frame
xform 0 736 384
use hwin -384 -457 100 0 hwin#43
xform 0 -288 -416
p -496 -416 100 0 -1 val(in):$(top)sh:t1w NPP NMS
use hwin -384 -489 100 0 hwin#45
xform 0 -288 -448
p -496 -448 100 0 -1 val(in):$(top)sh:t1z NPP NMS
use hwin 192 -457 100 0 hwin#47
xform 0 288 -416
p 80 -416 100 0 -1 val(in):$(top)sh:t1x NPP NMS
use hwin 192 -489 100 0 hwin#49
xform 0 288 -448
p 80 -448 100 0 -1 val(in):$(top)sh:t1y NPP NMS
use hwin 768 -457 100 0 hwin#59
xform 0 864 -416
p 656 -416 100 0 -1 val(in):$(top)sh:t1w NPP NMS
use hwin 768 -489 100 0 hwin#61
xform 0 864 -448
p 656 -448 100 0 -1 val(in):$(top)sh:t1x NPP NMS
use hwin 1312 -457 100 0 hwin#67
xform 0 1408 -416
p 1200 -416 100 0 -1 val(in):$(top)sh:t1z NPP NMS
use hwin 1312 -489 100 0 hwin#69
xform 0 1408 -448
p 1200 -448 100 0 -1 val(in):$(top)sh:t1y NPP NMS
use hwin -384 -1001 100 0 hwin#79
xform 0 -288 -960
p -496 -960 100 0 -1 val(in):$(top)sh:b2w NPP NMS
use hwin -384 -1033 100 0 hwin#81
xform 0 -288 -992
p -496 -992 100 0 -1 val(in):$(top)sh:b2z NPP NMS
use hwin 192 -1001 100 0 hwin#83
xform 0 288 -960
p 80 -960 100 0 -1 val(in):$(top)sh:b2x NPP NMS
use hwin 192 -1033 100 0 hwin#85
xform 0 288 -992
p 80 -992 100 0 -1 val(in):$(top)sh:b2y NPP NMS
use hwin 768 -1001 100 0 hwin#87
xform 0 864 -960
p 656 -960 100 0 -1 val(in):$(top)sh:b2w NPP NMS
use hwin 768 -1033 100 0 hwin#89
xform 0 864 -992
p 656 -992 100 0 -1 val(in):$(top)sh:b2x NPP NMS
use hwin 1312 -1001 100 0 hwin#91
xform 0 1408 -960
p 1200 -960 100 0 -1 val(in):$(top)sh:b2z NPP NMS
use hwin 1312 -1033 100 0 hwin#93
xform 0 1408 -992
p 1200 -992 100 0 -1 val(in):$(top)sh:b2y NPP NMS
use ecalcs 1504 -89 100 0 ecalcs#22
xform 0 1648 176
p 1664 0 100 0 -1 CALC:A+B+C+D
p 1664 -32 100 0 1 PREC:1
p 1664 -64 100 0 1 SCAN:.5 second
p 1696 352 100 1024 -1 name:$(top)bsum
use ecalcs 1504 487 100 0 ecalcs#21
xform 0 1648 752
p 1664 560 100 0 -1 CALC:A+B+C+D
p 1664 528 100 0 1 PREC:1
p 1664 496 100 0 1 SCAN:.5 second
p 1712 912 100 1024 -1 name:$(top)tsum
use ecalcs -192 -889 100 0 ecalcs#35
xform 0 -48 -624
p -32 -816 100 0 -1 CALC:A+B
p -32 -848 100 0 1 PREC:1
p -32 -880 100 0 1 SCAN:.5 second
p 64 -784 100 1024 -1 name:$(top)tleft
use ecalcs 384 -889 100 0 ecalcs#36
xform 0 528 -624
p 544 -816 100 0 -1 CALC:A+B
p 544 -848 100 0 1 PREC:1
p 544 -880 100 0 1 SCAN:.5 second
p 656 -784 100 1024 -1 name:$(top)tright
use ecalcs 960 -889 100 0 ecalcs#39
xform 0 1104 -624
p 1120 -816 100 0 -1 CALC:A+B
p 1120 -848 100 0 1 PREC:1
p 1120 -880 100 0 1 SCAN:.5 second
p 1216 -784 100 1024 -1 name:$(top)ttop
use ecalcs 1504 -889 100 0 ecalcs#40
xform 0 1648 -624
p 1664 -816 100 0 -1 CALC:A+B
p 1664 -848 100 0 1 PREC:1
p 1664 -880 100 0 1 SCAN:.5 second
p 1776 -784 100 1024 -1 name:$(top)tbottom
use ecalcs -192 -1433 100 0 ecalcs#75
xform 0 -48 -1168
p -32 -1360 100 0 -1 CALC:A+B
p -32 -1392 100 0 1 PREC:1
p -32 -1424 100 0 1 SCAN:.5 second
p 64 -1328 100 1024 -1 name:$(top)bleft
use ecalcs 384 -1433 100 0 ecalcs#76
xform 0 528 -1168
p 544 -1360 100 0 -1 CALC:A+B
p 544 -1392 100 0 1 PREC:1
p 544 -1424 100 0 1 SCAN:.5 second
p 656 -1328 100 1024 -1 name:$(top)bright
use ecalcs 960 -1433 100 0 ecalcs#77
xform 0 1104 -1168
p 1120 -1360 100 0 -1 CALC:A+B
p 1120 -1392 100 0 1 PREC:1
p 1120 -1424 100 0 1 SCAN:.5 second
p 1216 -1328 100 1024 -1 name:$(top)btop
use ecalcs 1504 -1433 100 0 ecalcs#78
xform 0 1648 -1168
p 1664 -1360 100 0 -1 CALC:A+B
p 1664 -1392 100 0 1 PREC:1
p 1664 -1424 100 0 1 SCAN:.5 second
p 1776 -1328 100 1024 -1 name:$(top)bbottom
use abWordGetScale 960 71 100 0 abWordGetScale#20
xform 0 1072 160
p 960 32 100 0 1 setAb:ab $(abC)
p 960 -32 100 0 1 setCalc:calc $(calc)
p 960 0 100 0 1 setDev:dev b2w
p 960 64 100 0 1 setWord:word $(bs2w)
use abWordGetScale 576 71 100 0 abWordGetScale#19
xform 0 688 160
p 576 32 100 0 1 setAb:ab $(abC)
p 576 -32 100 0 1 setCalc:calc $(calc)
p 576 0 100 0 1 setDev:dev b2z
p 576 64 100 0 1 setWord:word $(bs2z)
use abWordGetScale 192 71 100 0 abWordGetScale#18
xform 0 304 160
p 192 32 100 0 1 setAb:ab $(abC)
p 192 -32 100 0 1 setCalc:calc $(calc)
p 192 0 100 0 1 setDev:dev b2y
p 192 64 100 0 1 setWord:word $(bs2y)
use abWordGetScale -192 71 100 0 abWordGetScale#17
xform 0 -80 160
p -192 32 100 0 1 setAb:ab $(abC)
p -192 -32 100 0 1 setCalc:calc $(calc)
p -192 0 100 0 1 setDev:dev b2x
p -192 64 100 0 1 setWord:word $(bs2x)
use abWordGetScale 960 583 100 0 abWordGetScale#16
xform 0 1072 672
p 960 544 100 0 1 setAb:ab $(abC)
p 960 480 100 0 1 setCalc:calc $(calc)
p 960 512 100 0 1 setDev:dev t1w
p 960 576 100 0 1 setWord:word $(ts1w)
use abWordGetScale 576 583 100 0 abWordGetScale#15
xform 0 688 672
p 576 544 100 0 1 setAb:ab $(abC)
p 576 480 100 0 1 setCalc:calc $(calc)
p 576 512 100 0 1 setDev:dev t1z
p 576 576 100 0 1 setWord:word $(ts1z)
use abWordGetScale 192 583 100 0 abWordGetScale#14
xform 0 304 672
p 192 544 100 0 1 setAb:ab $(abC)
p 192 480 100 0 1 setCalc:calc $(calc)
p 192 512 100 0 1 setDev:dev t1y
p 192 576 100 0 1 setWord:word $(ts1y)
use abWordGetScale -192 583 100 0 abWordGetScale#13
xform 0 -80 672
p -192 544 100 0 1 setAb:ab $(abC)
p -192 480 100 0 1 setCalc:calc $(calc)
p -192 512 100 0 1 setDev:dev t1x
p -192 576 100 0 1 setWord:word $(ts1x)
[comments]
