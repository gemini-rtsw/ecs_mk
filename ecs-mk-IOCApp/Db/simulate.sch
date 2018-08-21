[schematic2]
uniq 20
[tools]
[detail]
w 2282 1147 100 0 n#1 embbis.embbis#176.FLNK 2272 1136 2352 1136 efanouts.efanouts#193.SLNK
w 2594 1067 100 0 n#2 efanouts.efanouts#193.LNK6 2592 1056 2656 1056 hwout.hwout#204.outp
w 2594 1099 100 0 n#3 efanouts.efanouts#193.LNK5 2592 1088 2656 1088 hwout.hwout#201.outp
w 2594 1131 100 0 n#4 efanouts.efanouts#193.LNK4 2592 1120 2656 1120 hwout.hwout#200.outp
w 2594 1163 100 0 n#5 efanouts.efanouts#193.LNK3 2592 1152 2656 1152 hwout.hwout#197.outp
w 2594 1195 100 0 n#6 efanouts.efanouts#193.LNK2 2592 1184 2656 1184 hwout.hwout#196.outp
w 2594 1227 100 0 n#7 efanouts.efanouts#193.LNK1 2592 1216 2656 1216 hwout.hwout#184.outp
w 2370 459 -100 0 c ecars.simulateC.FLNK 2336 448 2464 448 outhier.flnk.p
w 2370 619 -100 0 c ecars.simulateC.OMSS 2336 608 2464 608 outhier.mess.p
w 594 1643 100 0 n#8 hwin.hwin#187.in 512 1600 576 1600 576 1632 672 1632 ecad4.ecad4#186.INPC
w 578 1707 100 0 n#9 hwin.hwin#180.in 544 1696 672 1696 ecad4.ecad4#186.INPB
w 1954 1771 100 0 n#10 hwin.hwin#178.in 1920 1760 2048 1760 esubs.esubs#175.INPB
w 1858 1123 100 0 n#11 eseqs.eseqs#74.LNK3 1760 1120 2016 1120 embbis.embbis#176.SLNK
w 572 1899 100 0 n#12 embbos.simulateMode.OUT 448 2016 576 2016 576 1792 672 1792 ecad4.ecad4#186.A
w 2370 683 100 0 n#13 ecars.simulateC.VAL 2336 672 2464 672 outhier.car.p
w 1922 910 100 0 n#14 eseqs.eseqs#74.LNK4 1760 1088 1920 1088 1920 672 2016 672 ecars.simulateC.IVAL
w 1778 1186 100 0 n#14 eseqs.eseqs#74.LNK1 1760 1184 1856 1184 1856 1088 junction
w 1378 1090 100 0 n#15 hwin.hwin#76.in 1376 1088 1440 1088 eseqs.eseqs#74.DOL4
w 1490 1795 100 0 n#16 ecad4.ecad4#186.VALA 992 1792 2048 1792 esubs.esubs#175.INPA
w 1148 1451 100 0 n#16 junction 1152 1792 1152 1120 1440 1120 eseqs.eseqs#74.DOL3
w 1916 1275 100 0 n#17 eseqs.eseqs#74.LNK2 1760 1152 1920 1152 1920 1408 2048 1408 esubs.esubs#175.SLNK
w 1116 1115 100 0 n#18 eseqs.eseqs#74.SLNK 1440 864 1120 864 1120 1376 992 1376 ecad4.ecad4#186.STLK
w 1384 1187 100 0 n#19 hwin.hwin#75.in 1376 1184 1440 1184 eseqs.eseqs#74.DOL1
s 2432 1664 100 0 Level Link
s 2432 1520 100 0 None 1
s 2432 1552 100 0 VSM 2
s 2432 1584 100 0 Fast 3
s 2432 1616 100 0 Full 4
s 160 1312 100 0 simulate CAD inputs:
s 160 1136 100 0 simulate CAD outputs;
s 208 1280 100 0 A: Requested simulation level
s 208 1104 100 0 A: Validated simulation level
s 208 1248 100 0 B: Current debug level
s 208 1216 100 0 C: activeC state
[cell use]
use hwout 2656 1015 100 0 hwout#204
xform 0 2752 1056
p 2864 1056 80 0 -1 val(outp):$(top)westVentGatemotor
use hwout 2656 1047 100 0 hwout#201
xform 0 2752 1088
p 2864 1088 80 0 -1 val(outp):$(top)eastVentGatemotor
use hwout 2656 1079 100 0 hwout#200
xform 0 2752 1120
p 2864 1120 80 0 -1 val(outp):$(top)botShtrmotor
use hwout 2656 1111 100 0 hwout#197
xform 0 2752 1152
p 2864 1152 80 0 -1 val(outp):$(top)topShtrmotor
use hwout 2656 1143 100 0 hwout#196
xform 0 2752 1184
p 2864 1184 80 0 -1 val(outp):$(top)domemotor
use efanouts 2352 999 100 0 efanouts#193
xform 0 2472 1152
p 2336 1088 100 0 1 SELM:All
p 2496 1280 100 1024 -1 name:$(top)simulateFan
use outhier 2432 407 100 0 flnk
xform 0 2448 448
use outhier 2432 567 100 0 mess
xform 0 2448 608
use outhier 2432 631 100 0 car
xform 0 2448 672
use hwin 1184 1047 100 0 hwin#76
xform 0 1280 1088
p 1187 1080 100 0 -1 val(in):$(IDLE)
use hwin 1184 1143 100 0 hwin#75
xform 0 1280 1184
p 1187 1176 100 0 -1 val(in):$(BUSY)
use hwin 1728 1719 100 0 hwin#178
xform 0 1824 1760
p 1728 1712 100 0 -1 val(in):$(top)debugL
use hwin 352 1655 100 0 hwin#180
xform 0 448 1696
p 352 1648 100 0 -1 val(in):$(top)debugL
use hwin 320 1559 100 0 hwin#187
xform 0 416 1600
p 320 1552 100 0 -1 val(in):$(top)activeComb.VALA
use ecad4 672 1287 100 0 ecad4#186
xform 0 832 1664
p 912 1760 80 512 1 FTVA:LONG
p 848 1536 80 256 1 SNAM:simulateCAD
p 832 2032 100 1024 -1 name:$(top)simulate
p 640 1632 75 1280 -1 pproc(INPC):NPP
use hwout 2656 1175 100 0 hwout#184
xform 0 2752 1216
p 2864 1216 80 0 -1 val(outp):$(top)interlock
use embbis 2016 1047 100 0 embbis#176
xform 0 2144 1120
p 2096 992 100 0 1 ONST:VSM
p 2240 992 100 0 1 ONSV:MINOR
p 2000 992 100 0 1 ONVL:1
p 2096 928 100 0 1 THST:FULL
p 2240 928 100 0 1 THSV:MINOR
p 2000 928 100 0 1 THVL:3
p 2096 960 100 0 1 TWST:FAST
p 2240 960 100 0 1 TWSV:MINOR
p 2000 960 100 0 1 TWVL:2
p 2096 1024 100 0 1 ZRST:NONE
p 2240 1024 100 0 1 ZRSV:NO_ALARM
p 2000 1024 100 0 1 ZRVL:0
p 2128 1184 100 1024 -1 name:$(top)simulateL
use esubs 2048 1319 100 0 esubs#175
xform 0 2192 1584
p 2224 1408 100 0 1 INAM:nullSub
p 2224 1360 100 0 1 SNAM:simMask
p 2144 1840 100 1024 -1 name:$(top)simMask
use eborderC -64 -217 100 0 eborderC#162
xform 0 1616 1088
p 2620 -60 100 1024 -1 author:Bob Wooff
p 2612 -92 100 1024 -1 date:April 15, 1998
p 3016 -92 80 768 -1 file:simulate.sch
p 2960 60 150 256 -1 project:Enclosure Control System
p 2784 -64 100 0 0 revision:$Revision: 1.1.1.1 $
p 2960 -4 200 256 -1 title:Simulate Command
use embbos 216 1928 -100 0 simulateMode
xform 0 320 2016
p 128 2235 100 0 0 DESC:Simulate valid modes
p 192 1856 100 0 1 ONST:VSM
p 352 1856 100 0 1 ONVL:1
p 192 1792 100 0 1 THST:FULL
p 352 1792 100 0 1 THVL:3
p 192 1824 100 0 1 TWST:FAST
p 352 1824 100 0 1 TWVL:2
p 192 1888 100 0 1 ZRST:NONE
p 352 1888 100 0 1 ZRVL:0
p 1 1605 100 0 0 def(FLNK):0.000000000000000e+00
p 1 1600 100 0 0 def(OUT):0.000000000000000e+00
p 224 2094 100 0 -1 name:$(top)simulateMode
use eseqs 1440 775 100 0 eseqs#74
xform 0 1600 1024
p 1086 1321 100 0 0 DESC:CAR Time sequencing
p 1568 816 100 0 1 DLY1:0.0
p 1552 784 100 0 1 DLY2:$(W1)
p 1552 752 100 0 1 DLY3:$(W2)
p 1552 704 100 0 1 DLY4:$(W3)
p 1888 1120 100 0 0 def(LNK3):0.0
p 1440 1264 100 0 -1 name:$(top)simulateSeq
p 1440 1184 75 1280 -1 palrm(DOL1):NMS
p 1792 1184 75 768 -1 palrm(LNK1):NMS
p 1792 1152 75 768 -1 palrm(LNK2):NMS
p 1792 1120 75 768 -1 palrm(LNK3):NMS
p 1760 1184 75 768 -1 pproc(LNK1):PP
p 1760 1152 75 768 -1 pproc(LNK2):PP
p 1760 1120 75 768 -1 pproc(LNK3):PP
p 1760 1098 75 0 -1 pproc(LNK4):PP
use ecars 2128 400 100 0 simulateC
xform 0 2176 560
p 2007 -360 100 0 0 PV:$(top)
p 1984 160 100 0 0 def(SIOL):0.0
p 2176 720 100 1024 -1 name:$(top)simulateC
[comments]
