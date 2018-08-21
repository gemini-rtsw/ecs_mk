[schematic2]
uniq 22
[tools]
[detail]
w -574 811 100 0 n#1 stopVgates.stopVgates#564.wvgFlnk -768 928 -768 800 -320 800 junction
w -574 1339 100 0 n#1 moveVgates.moveVgates#563.wvgFlnk -768 1328 -320 1328 -320 384 junction
w -654 523 100 0 n#1 parkVgates.parkVgates#565.wvgFlnk -768 512 -480 512 -480 384 -320 384 junction
w -670 -917 100 0 n#1 inhier.wvgProcess.P -960 -928 -320 -928 -320 384 -256 384 dev2Ctrl.dev2Ctrl#544.flnk
w -638 1027 100 0 n#2 stopVgates.stopVgates#564.wvgStop -768 1024 -448 1024 junction
w -734 -725 100 0 n#2 inhier.wvgMode.P -960 -736 -448 -736 -448 608 junction
w -382 619 100 0 n#2 junction -448 608 -256 608 -256 512 dev2Ctrl.dev2Ctrl#544.state
w -638 1435 100 0 n#2 moveVgates.moveVgates#563.wvgMove -768 1424 -448 1424 -448 608 -768 608 parkVgates.parkVgates#565.wvgPark
w -430 843 100 0 n#-1 junction -544 832 -256 832 dev2Ctrl.dev2Ctrl#534.flnk
w -686 1099 100 0 n#-1 stopVgates.stopVgates#564.evgFlnk -768 1088 -544 1088 junction
w -686 683 100 0 n#-1 parkVgates.parkVgates#565.evgFlnk -768 672 -544 672 -544 832 junction
w -686 1491 100 0 n#-1 moveVgates.moveVgates#563.evgFlnk -768 1488 -544 1488 junction
w -790 1723 100 0 n#-1 inhier.evgProcess.P -976 1712 -544 1712 -544 832 junction
w -750 779 100 0 n#3 parkVgates.parkVgates#565.evgPark -768 768 -672 768 -672 1184 junction
w -750 1587 100 0 n#3 moveVgates.moveVgates#563.evgMove -768 1584 -672 1584 junction
w -854 1915 100 0 n#3 inhier.evgMode.P -976 1904 -672 1904 -672 1184 junction
w -542 1195 100 0 n#3 stopVgates.stopVgates#564.evgStop -768 1184 -256 1184 -256 960 dev2Ctrl.dev2Ctrl#534.state
w 1482 907 -100 0 c ecars.ecars#612.FLNK 1408 896 1616 896 outhier.flnk.p
w 1482 1067 -100 0 c ecars.ecars#612.OMSS 1408 1056 1616 1056 outhier.mess.p
w 1508 283 100 0 n#4 egenSub.egenSub#630.FLNK 1344 -160 1504 -160 1504 736 960 736 960 928 1088 928 ecars.ecars#612.SLNK
w 1170 715 100 0 n#5 egenSub.egenSub#630.OUTB 1344 480 1472 480 1472 704 928 704 928 1056 1088 1056 ecars.ecars#612.IMSS
w 1138 683 100 0 n#6 egenSub.egenSub#630.OUTA 1344 544 1440 544 1440 672 896 672 896 1120 1088 1120 ecars.ecars#612.IVAL
w 690 331 100 0 n#7 ecars.ecars#458.FLNK 704 320 736 320 junction
w 740 315 100 0 n#7 ecars.ecars#328.FLNK 704 768 736 768 736 -128 1056 -128 egenSub.egenSub#630.SLNK
w 882 363 100 0 n#8 ecars.ecars#458.OMSS 704 480 768 480 768 352 1056 352 egenSub.egenSub#630.INPD
w 898 427 100 0 n#9 ecars.ecars#458.VAL 704 544 800 544 800 416 1056 416 egenSub.egenSub#630.INPC
w 836 699 100 0 n#10 ecars.ecars#328.OMSS 704 928 832 928 832 480 1056 480 egenSub.egenSub#630.INPB
w 868 763 100 0 n#11 ecars.ecars#328.VAL 704 992 864 992 864 544 1056 544 egenSub.egenSub#630.INPA
w 994 43 100 0 n#12 egenSub.egenSub#630.INPI 1056 32 992 32 hwin.hwin#629.in
w 994 171 100 0 n#13 egenSub.egenSub#630.INPG 1056 160 992 160 hwin.hwin#628.in
w 994 299 100 0 n#14 egenSub.egenSub#630.INPE 1056 288 992 288 hwin.hwin#627.in
w 1482 1131 100 0 n#15 ecars.ecars#612.VAL 1408 1120 1616 1120 outhier.car.p
w 306 491 100 0 n#16 dev2Ctrl.dev2Ctrl#544.carMess 224 512 288 512 288 480 384 480 ecars.ecars#458.IMSS
w 274 555 100 0 n#17 dev2Ctrl.dev2Ctrl#544.car 224 544 384 544 ecars.ecars#458.IVAL
w 306 939 100 0 n#18 dev2Ctrl.dev2Ctrl#534.carMess 224 960 288 960 288 928 384 928 ecars.ecars#328.IMSS
w 274 1003 100 0 n#19 dev2Ctrl.dev2Ctrl#534.car 224 992 384 992 ecars.ecars#328.IVAL
w -606 1403 100 0 n#20 moveVgates.moveVgates#563.wvgPos -768 1392 -384 1392 -384 480 junction
w -606 579 100 0 n#20 parkVgates.parkVgates#565.wvgPos -768 576 -384 576 junction
w -702 -821 100 0 n#20 inhier.wvgPosition.P -960 -832 -384 -832 -384 480 -256 480 dev2Ctrl.dev2Ctrl#544.pos
w -718 747 100 0 n#21 parkVgates.parkVgates#565.evgPos -768 736 -608 736 -608 928 junction
w -718 1555 100 0 n#21 moveVgates.moveVgates#563.evgPos -768 1552 -608 1552 junction
w -822 1819 100 0 n#21 inhier.evgPosition.P -976 1808 -608 1808 -608 928 -256 928 dev2Ctrl.dev2Ctrl#534.pos
s 2608 -1152 100 0 vgatesCMD.sch
s 1520 -1136 100 0 May 8, 1998
s 1536 -1056 100 0 Bob Wooff
s 2192 -944 200 0 Vent Gate Commands
s 2128 -800 200 0 Enclosure Control System
[cell use]
use bd200tr -2240 -1288 -100 0 frame
xform 0 400 416
use outhier 1584 855 100 0 flnk
xform 0 1600 896
use outhier 1584 1015 100 0 mess
xform 0 1600 1056
use outhier 1584 1079 100 0 car
xform 0 1600 1120
use egenSub 1056 -217 100 0 egenSub#630
xform 0 1200 208
p 1136 464 80 0 1 FTA:LONG
p 1136 448 80 0 1 FTB:STRING
p 1136 432 80 0 1 FTC:LONG
p 1136 416 80 0 1 FTD:STRING
p 1136 400 80 0 1 FTE:LONG
p 1136 384 80 0 1 FTF:STRING
p 1136 368 80 0 1 FTG:LONG
p 1136 352 80 0 1 FTH:STRING
p 1136 336 80 0 1 FTI:LONG
p 1136 320 80 0 1 FTJ:STRING
p 1280 576 80 512 1 FTVA:LONG
p 1280 544 80 512 1 FTVB:STRING
p 1200 -64 80 256 1 SNAM:carCombine
p 1200 624 100 1024 -1 name:$(top)vgateComb
use hwin 800 -9 100 0 hwin#629
xform 0 896 32
p 803 24 100 0 -1 val(in):$(IDLE)
use hwin 800 119 100 0 hwin#628
xform 0 896 160
p 803 152 100 0 -1 val(in):$(IDLE)
use hwin 800 247 100 0 hwin#627
xform 0 896 288
p 803 280 100 0 -1 val(in):$(IDLE)
use ecars 1088 839 100 0 ecars#612
xform 0 1248 1008
p 1232 1168 100 1024 -1 name:$(top)vgateC
use ecars 384 263 100 0 ecars#458
xform 0 544 432
p 544 592 100 1024 -1 name:$(top)westVentGateC
use ecars 384 711 100 0 ecars#328
xform 0 544 880
p 544 1040 100 1024 -1 name:$(top)eastVentGateC
use parkVgates -1152 455 100 0 parkVgates#565
xform 0 -960 656
use stopVgates -1152 871 100 0 stopVgates#564
xform 0 -960 1072
use moveVgates -1152 1271 100 0 moveVgates#563
xform 0 -960 1472
use dev2Ctrl -256 743 100 0 dev2Ctrl#534
xform 0 -16 912
p -160 740 100 0 1 seta:dev ev
p -160 715 100 0 1 set0:motor eastVentGate
p -160 690 100 0 1 set1:hs $(evHs)
p -160 665 100 0 1 set2:enc $(evEnc)
p -160 640 100 0 1 set3:posdmd $(evPosDmd)
use dev2Ctrl -256 295 100 0 dev2Ctrl#544
xform 0 -16 464
p -160 290 100 0 1 seta:dev wv
p -160 265 100 0 1 set0:motor westVentGate
p -160 240 100 0 1 set1:hs $(wvHs)
p -160 215 100 0 1 set2:enc $(wvEnc)
p -160 190 100 0 1 set3:posdmd $(wvPosDmd)
use inhier -976 -969 100 0 wvgProcess
xform 0 -960 -928
use inhier -976 -873 100 0 wvgPosition
xform 0 -960 -832
use inhier -976 -777 100 0 wvgMode
xform 0 -960 -736
use inhier -992 1671 100 0 evgProcess
xform 0 -976 1712
use inhier -992 1767 100 0 evgPosition
xform 0 -976 1808
use inhier -992 1863 100 0 evgMode
xform 0 -976 1904
[comments]
