[schematic2]
uniq 7
[tools]
[detail]
w 708 83 100 0 n#1 ecad4.ecad4#582.STLK 576 288 704 288 704 -112 896 -112 efanouts.efanouts#574.SLNK
w 1202 451 100 0 n#2 ecad4.ecad4#582.OUTB 576 608 992 608 992 448 1472 448 outhier.bsStop.p
w 1276 91 100 0 n#3 efanouts.efanouts#574.LNK2 1136 -64 1280 -64 1280 256 1472 256 outhier.bsFlnk.p
w 1212 267 100 0 n#4 efanouts.efanouts#574.LNK1 1136 -32 1216 -32 1216 576 1472 576 outhier.tsFlnk.p
w 1154 771 100 0 n#5 ecad4.ecad4#582.OUTA 576 672 896 672 896 768 1472 768 outhier.tsStop.p
w -110 843 100 0 n#6 hwin.hwin#335.in -224 832 64 832 64 672 256 672 ecad4.ecad4#582.INPA
s -96 -160 100 0 A: top shutter demand state
s -112 -128 100 0 botShtr CAD outputs:
s -96 -80 100 0 A: current debug level
s -112 -48 100 0 botShtr CAD inputs:
s -96 -192 100 0 B: bottom shutter demand state
[cell use]
use outhier 1440 407 100 0 bsStop
xform 0 1456 448
use outhier 1440 727 100 0 tsStop
xform 0 1456 768
use outhier 1440 535 100 0 tsFlnk
xform 0 1456 576
use outhier 1440 215 100 0 bsFlnk
xform 0 1456 256
use ecad4 256 199 100 0 ecad4#582
xform 0 416 576
p 480 640 80 512 1 FTVA:LONG
p 480 608 80 512 1 FTVB:LONG
p 480 576 80 512 1 FTVC:LONG
p 432 400 100 256 1 PREC:2
p 416 448 80 256 1 SNAM:stopShtrsCad
p 432 928 100 1024 -1 name:$(top)stopShtrs
use efanouts 896 -249 100 0 efanouts#574
xform 0 1016 -96
p 1040 48 100 1024 -1 name:$(top)stopShtrsFan
use hwin -416 791 100 0 hwin#335
xform 0 -320 832
p -432 832 100 2048 -1 val(in):$(top)debugL
use eborderC -1136 -857 100 0 eborderC#26
xform 0 544 448
p 1548 -700 100 1024 -1 author:Bob Wooff
p 1540 -732 100 1024 -1 date:March 24, 1998
p 1940 -732 80 768 -1 file:stopShtrs.sch
p 1892 -580 150 256 -1 project:Enclosure Control System
p 1712 -704 100 0 0 revision:$Revision: 1.4 $
p 1904 -652 200 256 -1 title:Stop Shutter Command
[comments]
