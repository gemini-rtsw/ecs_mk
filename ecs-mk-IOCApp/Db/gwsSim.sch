[schematic2]
uniq 3
[tools]
[detail]
w 192 -21 100 0 n#1 ebis.ebis#62.VAL 80 -32 352 -32 ecalcs.ecalcs#65.SDIS
w 450 483 100 0 n#2 ecalcs.ecalcs#65.INPA 352 384 256 384 256 480 704 480 704 192 640 192 ecalcs.ecalcs#65.VAL
[cell use]
use ecalcs 352 -89 100 0 ecalcs#65
xform 0 496 176
p 512 -16 100 0 1 CALC:1+(A%100)
p 64 158 100 0 0 DISV:0
p 512 -48 100 0 1 SCAN:1 second
p 464 416 100 1024 -1 name:$(gws)heartbeat
use ebis -176 -89 100 0 ebis#62
xform 0 -48 -16
p -112 -128 100 0 1 ONAM:TRUE
p 32 -128 100 0 1 OSV:NO_ALARM
p -112 -96 100 0 1 ZNAM:FALSE
p -176 -82 100 0 0 ZSV:MINOR
p -48 48 100 1024 -1 name:$(gws)present
use eais 400 695 100 0 eais#56
xform 0 528 768
p 144 510 100 0 0 EGU:degrees C
p 464 688 100 0 1 PREC:2
p 544 848 100 1024 -1 name:$(gws)ahuSetPoint
use eais 928 695 100 0 eais#58
xform 0 1056 768
p 672 510 100 0 0 EGU:
p 1008 688 100 0 1 PREC:2
p 1072 848 100 1024 -1 name:$(gws)windVel
use eborderC -1120 -857 100 0 eborderC#29
xform 0 560 448
p 1560 -700 100 1024 -1 author:Bob Wooff
p 1556 -736 100 1024 -1 date:January 21, 1998
p 1956 -736 80 768 -1 file:gwsSim.sch
p 1908 -584 150 256 -1 project:Enclosure Control System
p 1728 -704 100 0 0 revision:$Revision: 1.1.1.1 $
p 1908 -644 200 256 -1 title:GWS Simulator
[comments]
