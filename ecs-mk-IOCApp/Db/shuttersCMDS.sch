[schematic2]
uniq 25
[tools]
[detail]
w -320 803 100 0 n#1 stopShtrs.stopShtrs#564.bsFlnk -544 800 -96 800 junction
w -320 1187 100 0 n#1 moveShtrs.moveShtrs#563.bsFlnk -544 1184 -96 1184 -96 -480 -448 -480 parkNew1.parkNew1#681.bsFlnkOut
w -64 99 100 0 n#1 junction -96 96 -32 96 dev3Ctrl.dev3Ctrl#544.flnk
w -384 899 100 0 n#2 stopShtrs.stopShtrs#564.bsStop -544 896 -224 896 junction
w -128 227 100 0 n#2 junction -224 224 -32 224 dev3Ctrl.dev3Ctrl#544.state
w -384 1283 100 0 n#2 moveShtrs.moveShtrs#563.bsMove -544 1280 -224 1280 -224 -384 -448 -384 parkNew1.parkNew1#681.bsPark
w -384 -317 100 0 n#3 parkNew1.parkNew1#681.tsFlnkOut -448 -320 -320 -320 -320 544 junction
w -432 963 100 0 n#3 stopShtrs.stopShtrs#564.tsFlnk -544 960 -320 960 -320 544 -32 544 dev3Ctrl.dev3Ctrl#534.flnk
w -445 416 100 2 n#4 parkNew1.parkNew1#681.tsPark -448 -224 -448 1056 junction
w -496 1443 100 0 n#4 moveShtrs.moveShtrs#563.tsMove -544 1440 -448 1440 junction
w -592 1571 100 0 n#4 inhier.tsMode.P -736 1568 -448 1568 -448 1056 junction
w -288 1059 100 0 n#4 stopShtrs.stopShtrs#564.tsStop -544 1056 -32 1056 -32 672 dev3Ctrl.dev3Ctrl#534.state
w 480 547 100 0 n#5 dev3Ctrl.dev3Ctrl#534.flink 448 544 512 544 512 -736 -944 -736 -944 -416 -896 -416 parkNew1.parkNew1#681.tsFlnkIn
w 464 99 100 0 n#6 dev3Ctrl.dev3Ctrl#544.flink 448 96 480 96 480 -704 -928 -704 -928 -448 -896 -448 parkNew1.parkNew1#681.bsFlnkIn
w -1072 -445 100 0 bsProcess inhier.bsProcess.P -1152 -448 -992 -448 -992 -352 junction
w -1024 -349 100 0 bsProcess inhier.tsProcess.P -1152 -352 -896 -352 parkNew1.parkNew1#681.Flnk
w -1016 -189 100 0 tsPosition inhier.tsPosition.P -1136 -192 -896 -192 -896 -224 parkNew1.parkNew1#681.tsPosIn
w -1016 -253 100 0 bsPosition inhier.bsPosition.P -1136 -256 -896 -256 parkNew1.parkNew1#681.bsPosIn
w -416 -253 100 0 n#7 parkNew1.parkNew1#681.tsPosOut -448 -256 -384 -256 -384 1408 -544 1408 moveShtrs.moveShtrs#563.tsPos
w -208 643 100 0 n#7 junction -384 640 -32 640 dev3Ctrl.dev3Ctrl#534.pos
w -352 1251 100 0 n#8 moveShtrs.moveShtrs#563.bsPos -544 1248 -160 1248 -160 -416 -448 -416 parkNew1.parkNew1#681.bsPosOut
w -96 195 100 0 n#8 junction -160 192 -32 192 dev3Ctrl.dev3Ctrl#544.pos
w 1664 -477 100 0 n#9 egenSub.egenSub#628.FLNK 1568 -480 1760 -480 1760 544 1344 544 1344 800 1440 800 ecars.ecars#607.SLNK
w 1632 163 100 0 n#10 egenSub.egenSub#628.OUTB 1568 160 1696 160 1696 480 1280 480 1280 928 1440 928 ecars.ecars#607.IMSS
w 1616 227 100 0 n#11 egenSub.egenSub#628.OUTA 1568 224 1664 224 1664 448 1248 448 1248 992 1440 992 ecars.ecars#607.IVAL
w 944 35 100 0 n#12 ecars.ecars#458.FLNK 928 32 960 32 junction
w 944 483 100 0 n#12 ecars.ecars#328.FLNK 928 480 960 480 960 -448 1280 -448 egenSub.egenSub#628.SLNK
w 992 195 100 0 n#13 ecars.ecars#458.OMSS 928 192 1056 192 1056 32 1280 32 egenSub.egenSub#628.INPD
w 1008 259 100 0 n#14 ecars.ecars#458.VAL 928 256 1088 256 1088 96 1280 96 egenSub.egenSub#628.INPC
w 1216 163 100 0 n#15 egenSub.egenSub#628.INPB 1280 160 1152 160 1152 640 928 640 ecars.ecars#328.OMSS
w 1056 707 100 0 n#16 ecars.ecars#328.VAL 928 704 1184 704 1184 224 1280 224 egenSub.egenSub#628.INPA
w 1248 -285 100 0 n#17 egenSub.egenSub#628.INPI 1280 -288 1216 -288 hwin.hwin#627.in
w 1248 -157 100 0 n#18 egenSub.egenSub#628.INPG 1280 -160 1216 -160 hwin.hwin#626.in
w 1248 -29 100 0 n#19 egenSub.egenSub#628.INPE 1280 -32 1216 -32 hwin.hwin#625.in
w 1832 771 100 0 c ecars.ecars#607.FLNK 1760 768 1904 768 outhier.flnk.p
w 1832 931 100 0 c ecars.ecars#607.OMSS 1760 928 1904 928 outhier.mess.p
w 1832 995 100 0 n#20 ecars.ecars#607.VAL 1760 992 1904 992 outhier.car.p
w 480 227 100 0 n#21 dev3Ctrl.dev3Ctrl#544.carMess 448 224 512 224 512 192 608 192 ecars.ecars#458.IMSS
w 528 259 100 0 n#22 dev3Ctrl.dev3Ctrl#544.car 448 256 608 256 ecars.ecars#458.IVAL
w 480 675 100 0 n#23 dev3Ctrl.dev3Ctrl#534.carMess 448 672 512 672 512 640 608 640 ecars.ecars#328.IMSS
w 528 707 100 0 n#24 dev3Ctrl.dev3Ctrl#534.car 448 704 608 704 ecars.ecars#328.IVAL
w -432 1347 100 0 n#3 moveShtrs.moveShtrs#563.tsFlnk -544 1344 -320 1344 -320 960 junction
w -758 -622 -100 0 n#2 inhier.bsMode.P -768 -640 -224 -640 -224 -384 junction
s 816 -736 100 0 Completely rewritten
s 816 -704 100 0 Modified 09/Jul/99, Pedro Gigoux
s 816 -672 100 0 Added shutter offsets
s 816 -640 100 0 Modified 17/Mar/99, Pedro Gigoux
[cell use]
use parkNew1 -896 -537 100 0 parkNew1#681
xform 0 -672 -336
p -816 -544 100 0 1 seta:top $(top)
p -816 -576 100 0 1 setb:MARK 0
p -816 -608 100 0 1 setc:START 3
use inhier -1168 -489 100 0 bsProcess
xform 0 -1152 -448
use inhier -1152 -297 100 0 bsPosition
xform 0 -1136 -256
use inhier -784 -681 100 0 bsMode
xform 0 -768 -640
use inhier -1168 -393 100 0 tsProcess
xform 0 -1152 -352
use inhier -752 1527 100 0 tsMode
xform 0 -736 1568
use inhier -1152 -233 100 0 tsPosition
xform 0 -1136 -192
use eaos 64 1063 100 0 eaos#639
xform 0 192 1152
p 160 1120 100 0 1 PREC:2
p 192 1216 100 1024 -1 name:$(top)botShtrOffset
use eaos 64 1319 100 0 eaos#638
xform 0 192 1408
p 160 1376 100 0 1 PREC:2
p 208 1472 100 1024 -1 name:$(top)topShtrOffset
use egenSub 1280 -537 100 0 egenSub#628
xform 0 1424 -112
p 1360 144 80 0 1 FTA:LONG
p 1360 128 80 0 1 FTB:STRING
p 1360 112 80 0 1 FTC:LONG
p 1360 96 80 0 1 FTD:STRING
p 1360 80 80 0 1 FTE:LONG
p 1360 64 80 0 1 FTF:STRING
p 1360 48 80 0 1 FTG:LONG
p 1360 32 80 0 1 FTH:STRING
p 1360 16 80 0 1 FTI:LONG
p 1360 0 80 0 1 FTJ:STRING
p 1504 256 80 512 1 FTVA:LONG
p 1504 224 80 512 1 FTVB:STRING
p 1424 -384 80 256 1 SNAM:carCombine
p 1424 304 100 1024 -1 name:$(top)shtrComb
use hwin 1024 -329 100 0 hwin#627
xform 0 1120 -288
p 1027 -296 100 0 -1 val(in):$(IDLE)
use hwin 1024 -201 100 0 hwin#626
xform 0 1120 -160
p 1027 -168 100 0 -1 val(in):$(IDLE)
use hwin 1024 -73 100 0 hwin#625
xform 0 1120 -32
p 1027 -40 100 0 -1 val(in):$(IDLE)
use outhier 1872 727 100 0 flnk
xform 0 1888 768
use outhier 1872 887 100 0 mess
xform 0 1888 928
use outhier 1872 951 100 0 car
xform 0 1888 992
use ecars 1440 711 100 0 ecars#607
xform 0 1600 880
p 1584 1040 100 1024 -1 name:$(top)shtrC
use ecars 608 -25 100 0 ecars#458
xform 0 768 144
p 768 304 100 1024 -1 name:$(top)botShtrC
use ecars 608 423 100 0 ecars#328
xform 0 768 592
p 768 752 100 1024 -1 name:$(top)topShtrC
use stopShtrs -928 743 100 0 stopShtrs#564
xform 0 -736 944
use moveShtrs -928 1127 100 0 moveShtrs#563
xform 0 -736 1328
use dev3Ctrl -32 455 100 0 dev3Ctrl#534
xform 0 208 624
p 63 450 100 0 1 seta:dev ts
p 63 425 100 0 1 set0:motor topShtr
p 63 400 100 0 1 set1:hs $(tsHs)
p 63 375 100 0 1 set2:enc $(tsEnc)
p 63 350 100 0 1 set3:posdmd $(tsPosDmd)
use dev3Ctrl -32 7 100 0 dev3Ctrl#544
xform 0 208 176
p 63 0 100 0 1 seta:dev bs
p 63 -25 100 0 1 set0:motor botShtr
p 63 -50 100 0 1 set1:hs $(bsHs)
p 63 -75 100 0 1 set2:enc $(bsEnc)
p 63 -100 100 0 1 set3:posdmd $(bsPosDmd)
[comments]
