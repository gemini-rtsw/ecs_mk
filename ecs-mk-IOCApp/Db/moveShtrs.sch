[schematic2]
uniq 17
[tools]
[detail]
w -46 267 100 0 n#1 hwin.hwin#650.in -192 256 160 256 160 576 256 576 ecad20.ecad20#638.INPJ
w -62 363 100 0 n#2 hwin.hwin#645.in -192 352 128 352 128 640 256 640 ecad20.ecad20#638.INPI
w 594 -245 100 0 n#3 ecad20.ecad20#638.STLK 576 -256 672 -256 672 352 efanouts.efanouts#574.SLNK
w 1066 403 100 0 n#4 efanouts.efanouts#574.LNK2 912 400 1280 400 1280 736 1536 736 outhier.bsFlnk.p
w 1412 467 100 0 n#4 efanouts.efanouts#583.LNK2 1264 208 1408 208 1408 736 junction
w 1212 739 100 0 n#5 efanouts.efanouts#574.LNK1 912 432 1216 432 1216 1056 1536 1056 outhier.tsFlnk.p
w 1348 643 100 0 n#5 efanouts.efanouts#583.LNK1 1264 240 1344 240 1344 1056 junction
w 996 259 100 0 n#6 efanouts.efanouts#574.LNK3 912 368 992 368 992 160 1024 160 efanouts.efanouts#583.SLNK
w 676 675 100 0 n#7 ecad20.ecad20#638.VALE 576 928 672 928 672 432 720 432 efanouts.efanouts#574.SELL
w 1186 835 100 0 n#8 ecad20.ecad20#638.OUTD 576 960 896 960 896 832 1536 832 outhier.bsPos.p
w 1218 931 100 0 n#9 ecad20.ecad20#638.OUTC 576 1024 960 1024 960 928 1536 928 outhier.bsMove.p
w 1218 1155 100 0 n#10 ecad20.ecad20#638.OUTB 576 1088 960 1088 960 1152 1536 1152 outhier.tsPos.p
w 1186 1251 100 0 n#11 ecad20.ecad20#638.OUTA 576 1152 896 1152 896 1248 1536 1248 outhier.tsMove.p
w -142 651 100 0 n#12 eaos.eaos#557.OUT -320 640 96 640 96 800 256 800 ecad20.ecad20#638.G
w 114 875 100 0 n#13 eaos.eaos#558.OUT -96 800 32 800 32 864 256 864 ecad20.ecad20#638.F
w -142 971 100 0 n#14 eaos.eaos#547.OUT -320 960 96 960 96 928 256 928 ecad20.ecad20#638.E
w -14 1131 100 0 n#15 eaos.eaos#548.OUT -96 1120 128 1120 128 992 256 992 ecad20.ecad20#638.D
w -110 1323 100 0 n#16 hwin.hwin#335.in -224 1312 64 1312 64 1152 256 1152 ecad20.ecad20#638.INPA
s 1376 -720 80 0 Bob Woof
s 1616 -608 100 0 Enclosure Control System
s -880 -608 100 0 F: bottom shutter minimum limit
s -320 -480 100 0 B: top shutter position
s -320 -448 100 0 A: top shutter demand state
s -336 -416 100 0 botShtr CAD outputs:
s -880 -576 100 0 E: top shutter minimum limit
s -880 -544 100 0 D: top shutter maximum limit
s -880 -512 100 0 C: bottom shutter elevation demand
s -880 -480 100 0 B: top shutter elevation demand
s -880 -448 100 0 A: current debug level
s -896 -416 100 0 botShtr CAD inputs:
s -880 -640 100 0 G: bottom shutter minimum limit
s -320 -512 100 0 C: bottom shutter demand state
s -320 -544 100 0 D: bottom shutter position
s -320 -576 100 0 E: flnk fanout select
s 1568 -672 170 0 Move Shutters Command
s 1360 -752 100 0 May 8, 1998
s 1843 -764 100 0 moveShtrs.sch
s 1456 -512 100 0 Modified, 16/May/99, Pedro Gigoux
s 1456 -544 100 0 Added shutter offsets
[cell use]
use bc200tr -1248 -888 -100 0 frame
xform 0 432 416
p -1248 -840 100 0 0 revision:2.2
use hwin -384 215 100 0 hwin#650
xform 0 -288 256
p -640 256 100 0 -1 val(in):$(top)botShtrOffset
use hwin -384 311 100 0 hwin#645
xform 0 -288 352
p -640 352 100 0 -1 val(in):$(top)topShtrOffset
use hwin -416 1271 100 0 hwin#335
xform 0 -320 1312
p -432 1312 100 2048 -1 val(in):$(top)debugL
use ecad20 256 -345 100 0 ecad20#638
xform 0 416 544
p 400 1184 100 0 1 FTVA:LONG
p 368 1120 100 0 1 FTVB:DOUBLE
p 400 1056 100 0 1 FTVC:LONG
p 368 992 100 0 1 FTVD:DOUBLE
p 400 928 100 0 1 FTVE:LONG
p 384 -192 100 0 1 PREC:2
p 336 -112 80 0 1 SNAM:moveShtrsCad
p 432 1408 100 1024 -1 name:$(top)moveShtrs
use efanouts 672 215 100 0 efanouts#574
xform 0 792 368
p 704 224 100 0 1 SELM:Specified
p 816 512 100 1024 -1 name:$(top)moveShtrsFan
use efanouts 1024 23 100 0 efanouts#583
xform 0 1144 176
p 928 112 100 0 1 SELM:All
p 1168 320 100 1024 -1 name:$(top)moveShtrsFan2
use outhier 1504 1207 100 0 tsMove
xform 0 1520 1248
use outhier 1504 1111 100 0 tsPos
xform 0 1520 1152
use outhier 1504 887 100 0 bsMove
xform 0 1520 928
use outhier 1504 791 100 0 bsPos
xform 0 1520 832
use outhier 1504 1015 100 0 tsFlnk
xform 0 1520 1056
use outhier 1504 695 100 0 bsFlnk
xform 0 1520 736
use eaos -576 903 100 0 eaos#547
xform 0 -448 992
p -448 960 100 256 1 PREC:4
p -448 1056 100 1024 -1 name:$(top)topShtrMin
use eaos -352 1063 100 0 eaos#548
xform 0 -224 1152
p -224 1120 100 256 1 PREC:4
p -224 1216 100 1024 -1 name:$(top)topShtrMax
use eaos -576 583 100 0 eaos#557
xform 0 -448 672
p -448 640 100 256 1 PREC:4
p -448 736 100 1024 -1 name:$(top)botShtrMin
use eaos -352 743 100 0 eaos#558
xform 0 -224 832
p -224 800 100 256 1 PREC:4
p -224 896 100 1024 -1 name:$(top)botShtrMax
[comments]
