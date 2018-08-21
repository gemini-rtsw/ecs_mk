[schematic2]
uniq 5
[tools]
[detail]
w 34 395 100 0 n#1 hwin.hwin#531.in -128 384 256 384 256 832 416 832 ecad20.ecad20#520.INPE
w 882 -309 100 0 domeFlnk ecad20.ecad20#520.STLK 736 -320 1088 -320 outhier.domeFlnk.p
w 962 971 100 0 domePos ecad20.ecad20#520.OUTB 736 1024 896 1024 896 960 1088 960 outhier.domePos.p
w 882 1099 100 0 domeMove ecad20.ecad20#520.OUTA 736 1088 1088 1088 outhier.domeMove.p
w 18 587 100 0 n#2 eaos.eaos#474.OUT -96 576 192 576 192 928 416 928 ecad20.ecad20#520.D
w -46 843 100 0 n#3 eaos.eaos#473.OUT -160 832 128 832 128 992 416 992 ecad20.ecad20#520.C
w 146 1099 100 0 n#4 hwin.hwin#343.in -64 1088 416 1088 ecad20.ecad20#520.INPA
s -352 -224 100 0 C: validated dome velocity
s -832 -224 100 0 C: dome azimuth maxiumum limit
s -832 -192 100 0 B: dome azimuth demand
s -832 -128 100 0 dome CAD inputs:
s -832 -160 100 0 A: current debug level
s -352 -128 100 0 dome CAD outputs:
s -352 -160 100 0 A: validated dome demand state
s -352 -192 100 0 B: validated park azimuth position
s -832 -256 100 0 D: dome azimuth minimum limit
s -832 -288 100 0 E: dome azimuth offset
s 1472 -464 150 0 Modified, 17/Mar/99, Pedro Gigoux
s 1520 -496 150 0 Added domeOffset
[cell use]
use hwin -256 1047 100 0 hwin#343
xform 0 -160 1088
p -256 1072 100 512 -1 val(in):$(top)debugL
use hwin -320 343 100 0 hwin#531
xform 0 -224 384
p -528 384 100 0 -1 val(in):$(top)domeAzOffset
use ecad20 416 -409 100 0 ecad20#520
xform 0 576 480
p 544 1088 100 0 1 FTVA:LONG
p 528 1056 100 0 1 FTVB:DOUBLE
p 544 -208 100 0 1 PREC:2
p 480 -32 100 0 0 SCAN:Passive
p 496 -176 80 0 1 SNAM:moveDomeCad
p 576 1360 100 1024 -1 name:$(top)moveDome
use outhier 1056 -361 100 0 domeFlnk
xform 0 1072 -320
use outhier 1056 919 100 0 domePos
xform 0 1072 960
use outhier 1056 1047 100 0 domeMove
xform 0 1072 1088
use eaos -416 775 100 0 eaos#473
xform 0 -288 864
p -288 832 100 256 1 PREC:4
p -272 928 100 1024 -1 name:$(top)domeMax
use eaos -352 519 100 0 eaos#474
xform 0 -224 608
p -224 576 100 256 1 PREC:4
p -208 672 100 1024 -1 name:$(top)domeMin
use eborderC -1152 -857 100 0 eborderC#258
xform 0 528 448
p 1532 -700 100 1024 -1 author:Bob Wooff
p 1524 -736 100 1024 -1 date:March 24, 1998
p 1924 -736 80 768 -1 file:moveDome.sch
p 1876 -580 150 256 -1 project:Enclosure Control System
p 1696 -704 100 0 0 revision:$Revision: 1.1.1.1 $
p 1880 -648 200 256 -1 title:Move Dome Command
[comments]
