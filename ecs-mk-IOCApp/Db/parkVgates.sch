[schematic2]
uniq 15
[tools]
[detail]
w 100 75 100 0 n#1 eaos.eaos#557.OUT -320 -160 96 -160 96 320 256 320 ecad8.ecad8#371.G
w 68 187 100 0 n#2 eaos.eaos#558.OUT -96 0 64 0 64 384 256 384 ecad8.ecad8#371.F
w -174 171 100 0 n#3 eaos.eaos#547.OUT -320 160 32 160 32 448 256 448 ecad8.ecad8#371.E
w 98 523 100 0 n#4 eaos.eaos#548.OUT -96 320 0 320 0 512 256 512 ecad8.ecad8#371.D
w 34 587 100 0 n#5 eaos.eaos#583.OUT -320 480 -128 480 -128 576 256 576 ecad8.ecad8#371.C
w 50 651 100 0 n#6 eaos.eaos#582.OUT -96 640 256 640 ecad8.ecad8#371.B
w 658 43 100 0 n#7 ecad8.ecad8#371.STLK 576 32 800 32 800 -112 896 -112 efanouts.efanouts#574.SLNK
w 1276 91 100 0 n#8 efanouts.efanouts#574.LNK2 1136 -64 1280 -64 1280 256 1504 256 outhier.wvgFlnk.p
w 1212 267 100 0 n#9 efanouts.efanouts#574.LNK1 1136 -32 1216 -32 1216 576 1504 576 outhier.evgFlnk.p
w 1170 355 100 0 n#10 ecad8.ecad8#371.OUTD 576 480 896 480 896 352 1504 352 outhier.wvgPos.p
w 1202 451 100 0 n#11 ecad8.ecad8#371.OUTC 576 544 960 544 960 448 1504 448 outhier.wvgPark.p
w 1202 675 100 0 n#12 ecad8.ecad8#371.OUTB 576 608 960 608 960 672 1504 672 outhier.evgPos.p
w 1170 771 100 0 n#13 ecad8.ecad8#371.OUTA 576 672 896 672 896 768 1504 768 outhier.evgPark.p
w -110 843 100 0 n#14 hwin.hwin#335.in -224 832 64 832 64 672 256 672 ecad8.ecad8#371.INPA
s -32 -384 100 0 F: west vent gate minimum limit
s 528 -256 100 0 B: east vent gate position
s 528 -224 100 0 A: east vent gate demand state
s 512 -192 100 0 parkVgates CAD outputs:
s -32 -352 100 0 E: east vent gate minimum limit
s -32 -320 100 0 D: east vent gate maximum limit
s -32 -288 100 0 C: west vent gate elevation demand
s -32 -256 100 0 B: east vent gate elevation demand
s -32 -224 100 0 A: current debug level
s -48 -192 100 0 parkVgates CAD inputs:
s -32 -416 100 0 G: west vent gate minimum limit
s 528 -288 100 0 C: west vent gate demand state
s 528 -320 100 0 D: west vent gate position
[cell use]
use eaos -576 103 100 0 eaos#547
xform 0 -448 192
p -448 160 100 256 1 PREC:4
p -448 256 100 1024 -1 name:$(top)eastVentGateParkMin
use eaos -352 263 100 0 eaos#548
xform 0 -224 352
p -224 320 100 256 1 PREC:4
p -224 416 100 1024 -1 name:$(top)eastVentGateParkMax
use eaos -576 -217 100 0 eaos#557
xform 0 -448 -128
p -448 -160 100 256 1 PREC:4
p -448 -64 100 1024 -1 name:$(top)westVentGateParkMin
use eaos -352 -57 100 0 eaos#558
xform 0 -224 32
p -224 0 100 256 1 PREC:4
p -224 96 100 1024 -1 name:$(top)westVentGateParkMax
use eaos -352 583 100 0 eaos#582
xform 0 -224 672
p -224 640 100 256 1 PREC:4
p -224 736 100 1024 -1 name:$(top)eastVentGateParkDefPos
use eaos -576 423 100 0 eaos#583
xform 0 -448 512
p -448 480 100 256 1 PREC:4
p -448 576 100 1024 -1 name:$(top)westVentGateParkDefPos
use efanouts 896 -249 100 0 efanouts#574
xform 0 1016 -96
p 1040 48 100 1024 -1 name:$(top)parkVgatesFan
use outhier 1472 727 100 0 evgPark
xform 0 1488 768
use outhier 1472 631 100 0 evgPos
xform 0 1488 672
use outhier 1472 407 100 0 wvgPark
xform 0 1488 448
use outhier 1472 311 100 0 wvgPos
xform 0 1488 352
use outhier 1472 535 100 0 evgFlnk
xform 0 1488 576
use outhier 1472 215 100 0 wvgFlnk
xform 0 1488 256
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
p 416 160 100 256 1 PREC:2
p 416 192 80 256 1 SNAM:parkVgatesCad
p 416 928 100 1024 -1 name:$(top)parkVgates
p 576 672 75 768 -1 pproc(OUTA):NPP
p 576 608 75 768 -1 pproc(OUTB):NPP
p 576 544 75 768 -1 pproc(OUTC):NPP
p 576 480 75 768 -1 pproc(OUTD):NPP
use eborderC -1136 -857 100 0 eborderC#26
xform 0 544 448
p 1548 -700 100 1024 -1 author:Bob Wooff
p 1540 -732 100 1024 -1 date:March 24, 1998
p 1940 -732 80 768 -1 file:parkVgates.sch
p 1892 -580 150 256 -1 project:Enclosure Control System
p 1712 -704 100 0 0 revision:$Revision: 1.1.1.1 $
p 1904 -652 200 256 -1 title:Park Vent Gates Command
[comments]
