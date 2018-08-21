[schematic2]
uniq 15
[tools]
[detail]
w 988 -141 100 0 n#1 efanouts.efanouts#574.LNK3 944 -48 992 -48 992 -224 1024 -224 efanouts.efanouts#583.SLNK
w 1380 35 100 0 n#2 efanouts.efanouts#583.LNK2 1264 -176 1376 -176 1376 256 junction
w 1082 -13 100 0 n#2 efanouts.efanouts#574.LNK2 944 -16 1280 -16 1280 256 1536 256 outhier.wvgFlnk.p
w 1348 211 100 0 n#3 efanouts.efanouts#583.LNK1 1264 -144 1344 -144 1344 576 junction
w 1212 291 100 0 n#3 efanouts.efanouts#574.LNK1 944 16 1216 16 1216 576 1536 576 outhier.evgFlnk.p
w 612 -21 100 0 n#4 ecad8.ecad8#371.STLK 576 32 608 32 608 -64 704 -64 efanouts.efanouts#574.SLNK
w 676 227 100 0 n#5 ecad8.ecad8#371.VALE 576 448 672 448 672 16 752 16 efanouts.efanouts#574.SELL
w 1186 355 100 0 n#6 ecad8.ecad8#371.OUTD 576 480 896 480 896 352 1536 352 outhier.wvgPos.p
w 1218 451 100 0 n#7 ecad8.ecad8#371.OUTC 576 544 960 544 960 448 1536 448 outhier.wvgMove.p
w 1218 675 100 0 n#8 ecad8.ecad8#371.OUTB 576 608 960 608 960 672 1536 672 outhier.evgPos.p
w 1186 771 100 0 n#9 ecad8.ecad8#371.OUTA 576 672 896 672 896 768 1536 768 outhier.evgMove.p
w -142 171 100 0 n#10 eaos.eaos#557.OUT -320 160 96 160 96 320 256 320 ecad8.ecad8#371.G
w 114 395 100 0 n#11 eaos.eaos#558.OUT -96 320 32 320 32 384 256 384 ecad8.ecad8#371.F
w -142 491 100 0 n#12 eaos.eaos#547.OUT -320 480 96 480 96 448 256 448 ecad8.ecad8#371.E
w -14 651 100 0 n#13 eaos.eaos#548.OUT -96 640 128 640 128 512 256 512 ecad8.ecad8#371.D
w -110 843 100 0 n#14 hwin.hwin#335.in -224 832 64 832 64 672 256 672 ecad8.ecad8#371.INPA
s -656 -320 100 0 F: west vent gate minimum limit
s -96 -192 100 0 B: east vent gate position
s -96 -160 100 0 A: east vent gate demand state
s -112 -128 100 0 moveVgates CAD outputs:
s -656 -288 100 0 E: east vent gate minimum limit
s -656 -256 100 0 D: east vent gate maximum limit
s -656 -224 100 0 C: west vent gate elevation demand
s -656 -192 100 0 B: east vent gate elevation demand
s -656 -160 100 0 A: current debug level
s -672 -128 100 0 moveVgates CAD inputs:
s -656 -352 100 0 G: west vent gate minimum limit
s -96 -224 100 0 C: west vent gate demand state
s -96 -256 100 0 D: west vent gate position
s -96 -288 100 0 E: flnk fanout select
[cell use]
use efanouts 1024 -361 100 0 efanouts#583
xform 0 1144 -208
p 944 -288 100 0 1 SELM:All
p 1168 -64 100 1024 -1 name:$(top)moveVgatesFan2
use efanouts 704 -201 100 0 efanouts#574
xform 0 824 -48
p 624 -128 100 0 1 SELM:Specified
p 848 96 100 1024 -1 name:$(top)moveVgatesFan
use outhier 1504 727 100 0 evgMove
xform 0 1520 768
use outhier 1504 631 100 0 evgPos
xform 0 1520 672
use outhier 1504 407 100 0 wvgMove
xform 0 1520 448
use outhier 1504 311 100 0 wvgPos
xform 0 1520 352
use outhier 1504 535 100 0 evgFlnk
xform 0 1520 576
use outhier 1504 215 100 0 wvgFlnk
xform 0 1520 256
use eaos -576 423 100 0 eaos#547
xform 0 -448 512
p -448 480 100 256 1 PREC:4
p -448 576 100 1024 -1 name:$(top)eastVentGateMin
use eaos -352 583 100 0 eaos#548
xform 0 -224 672
p -224 640 100 256 1 PREC:4
p -224 736 100 1024 -1 name:$(top)eastVentGateMax
use eaos -576 103 100 0 eaos#557
xform 0 -448 192
p -448 160 100 256 1 PREC:4
p -448 256 100 1024 -1 name:$(top)westVentGateMin
use eaos -352 263 100 0 eaos#558
xform 0 -224 352
p -224 320 100 256 1 PREC:4
p -224 416 100 1024 -1 name:$(top)westVentGateMax
use hwin -416 791 100 0 hwin#335
xform 0 -320 832
p -432 832 100 2048 -1 val(in):$(top)debugL
use ecad8 256 -57 100 0 ecad8#371
xform 0 416 448
p 512 688 80 2048 1 FTVA:LONG
p 512 624 80 2048 1 FTVB:DOUBLE
p 512 560 80 2048 1 FTVC:LONG
p 496 480 80 512 1 FTVD:DOUBLE
p 496 432 80 512 1 FTVE:LONG
p 432 144 100 256 1 PREC:2
p 416 192 80 256 1 SNAM:moveVgatesCad
p 416 928 100 1024 -1 name:$(top)moveVgates
p 576 672 75 768 -1 pproc(OUTA):NPP
p 576 608 75 768 -1 pproc(OUTB):NPP
p 576 544 75 768 -1 pproc(OUTC):NPP
p 576 480 75 768 -1 pproc(OUTD):NPP
use eborderC -1136 -857 100 0 eborderC#26
xform 0 544 448
p 1548 -700 100 1024 -1 author:Bob Wooff
p 1540 -732 100 1024 -1 date:March 24, 1998
p 1940 -732 80 768 -1 file:moveVgates.sch
p 1892 -580 150 256 -1 project:Enclosure Control System
p 1712 -704 100 0 0 revision:$Revision: 1.1.1.1 $
p 1904 -652 200 256 -1 title:Move Vent Gates Command
[comments]
