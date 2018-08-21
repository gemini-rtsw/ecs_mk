[schematic2]
uniq 18
[tools]
[detail]
w -78 107 100 0 n#1 hwin.hwin#594.in -256 96 160 96 160 704 256 704 ecad20.ecad20#592.INPI
w -70 11 100 0 n#2 hwin.hwin#595.in -256 0 176 0 176 640 256 640 ecad20.ecad20#592.INPJ
w 770 443 100 0 n#3 ecad20.ecad20#592.STLK 576 -192 704 -192 704 432 896 432 efanouts.efanouts#574.SLNK
w 132 507 100 0 n#4 eaos.eaos#590.OUT -96 224 128 224 128 800 256 800 ecad20.ecad20#592.H
w 100 619 100 0 n#5 eaos.eaos#557.OUT -320 384 96 384 96 864 256 864 ecad20.ecad20#592.G
w 68 731 100 0 n#6 eaos.eaos#558.OUT -96 544 64 544 64 928 256 928 ecad20.ecad20#592.F
w -174 715 100 0 n#7 eaos.eaos#547.OUT -320 704 32 704 32 992 256 992 ecad20.ecad20#592.E
w 98 1067 100 0 n#8 eaos.eaos#548.OUT -96 864 0 864 0 1056 256 1056 ecad20.ecad20#592.D
w 50 1131 100 0 n#9 eaos.eaos#583.OUT -320 1024 -96 1024 -96 1120 256 1120 ecad20.ecad20#592.C
w 50 1195 100 0 n#10 eaos.eaos#582.OUT -96 1184 256 1184 ecad20.ecad20#592.B
w 1276 635 100 0 n#11 efanouts.efanouts#574.LNK2 1136 480 1280 480 1280 800 1472 800 outhier.bsFlnk.p
w 1212 811 100 0 n#12 efanouts.efanouts#574.LNK1 1136 512 1216 512 1216 1120 1472 1120 outhier.tsFlnk.p
w 1154 899 100 0 n#13 ecad20.ecad20#592.OUTD 576 1024 896 1024 896 896 1472 896 outhier.bsPos.p
w 1186 995 100 0 n#14 ecad20.ecad20#592.OUTC 576 1088 960 1088 960 992 1472 992 outhier.bsPark.p
w 1186 1219 100 0 n#15 ecad20.ecad20#592.OUTB 576 1152 960 1152 960 1216 1472 1216 outhier.tsPos.p
w 1154 1315 100 0 n#16 ecad20.ecad20#592.OUTA 576 1216 896 1216 896 1312 1472 1312 outhier.tsPark.p
w -110 1387 100 0 n#17 hwin.hwin#335.in -224 1376 64 1376 64 1216 256 1216 ecad20.ecad20#592.INPA
s 1504 -512 100 0 Added shutter offsets
s 1504 -480 100 0 Modified 30/Apr/99, Pedro Gigoux
s -880 -528 100 0 F: bottom shutter minimum limit
s -416 -400 100 0 B: top shutter position
s -416 -368 100 0 A: top shutter demand state
s -432 -336 100 0 parkShtrs CAD outputs
s -880 -496 100 0 E: top shutter minimum limit
s -880 -464 100 0 D: top shutter maximum limit
s -880 -432 100 0 C: bottom shutter elevation demand
s -880 -400 100 0 B: top shutter elevation demand
s -880 -368 100 0 A: current debug level
s -896 -336 100 0 parkShtrs CAD inputs;
s -880 -560 100 0 G: bottom shutter minimum limit
s -416 -432 100 0 C: bottom shutter demand state
s -416 -464 100 0 D: bottom shutter position
s -880 -592 100 0 H: shutter overlap value
[cell use]
use hwin -416 1335 100 0 hwin#335
xform 0 -320 1376
p -432 1376 100 2048 -1 val(in):$(top)debugL
use hwin -448 55 100 0 hwin#594
xform 0 -352 96
p -688 96 100 0 -1 val(in):$(top)topShtrOffset
use hwin -448 -41 100 0 hwin#595
xform 0 -352 0
p -688 0 100 0 -1 val(in):$(top)botShtrOffset
use ecad20 256 -281 100 0 ecad20#592
xform 0 416 608
p 400 1248 100 0 1 FTVA:LONG
p 368 1184 100 0 1 FTVB:DOUBLE
p 400 1120 100 0 1 FTVC:LONG
p 368 1056 100 0 1 FTVD:DOUBLE
p 400 992 100 0 1 FTVE:LONG
p 384 -128 100 0 1 PREC:2
p 336 -64 80 0 1 SNAM:parkShtrsCad
p 432 1472 100 1024 -1 name:$(top)parkShtrs
use eaos -576 647 100 0 eaos#547
xform 0 -448 736
p -448 704 100 256 1 PREC:4
p -448 800 100 1024 -1 name:$(top)topShtrParkMin
use eaos -352 807 100 0 eaos#548
xform 0 -224 896
p -224 864 100 256 1 PREC:4
p -224 960 100 1024 -1 name:$(top)topShtrParkMax
use eaos -576 327 100 0 eaos#557
xform 0 -448 416
p -448 384 100 256 1 PREC:4
p -448 480 100 1024 -1 name:$(top)botShtrParkMin
use eaos -352 487 100 0 eaos#558
xform 0 -224 576
p -224 544 100 256 1 PREC:4
p -224 640 100 1024 -1 name:$(top)botShtrParkMax
use eaos -352 1127 100 0 eaos#582
xform 0 -224 1216
p -224 1184 100 256 1 PREC:4
p -224 1280 100 1024 -1 name:$(top)topShtrParkDefPos
use eaos -576 967 100 0 eaos#583
xform 0 -448 1056
p -448 1024 100 256 1 PREC:4
p -448 1120 100 1024 -1 name:$(top)botShtrParkDefPos
use eaos -352 167 100 0 eaos#590
xform 0 -224 256
p -224 224 100 256 1 PREC:4
p -224 320 100 1024 -1 name:$(top)shtrOverlap
use efanouts 896 295 100 0 efanouts#574
xform 0 1016 448
p 1040 592 100 1024 -1 name:$(top)parkShtrsFan
use outhier 1440 1271 100 0 tsPark
xform 0 1456 1312
use outhier 1440 1175 100 0 tsPos
xform 0 1456 1216
use outhier 1440 951 100 0 bsPark
xform 0 1456 992
use outhier 1440 855 100 0 bsPos
xform 0 1456 896
use outhier 1440 1079 100 0 tsFlnk
xform 0 1456 1120
use outhier 1440 759 100 0 bsFlnk
xform 0 1456 800
use eborderC -1136 -857 100 0 eborderC#26
xform 0 544 448
p 1548 -700 100 1024 -1 author:Bob Wooff
p 1540 -732 100 1024 -1 date:May 13, 1998
p 1940 -732 80 768 -1 file:parkShtrs.sch
p 1892 -580 150 256 -1 project:Enclosure Control System
p 1712 -704 100 0 0 revision:$Revision: 1.1.1.1 $
p 1904 -652 200 256 -1 title:Park Shutter Command
[comments]
