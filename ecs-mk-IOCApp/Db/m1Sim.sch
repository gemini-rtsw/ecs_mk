[schematic2]
uniq 3
[tools]
[detail]
w 264 491 100 0 n#1 ecalcs.ecalcs#63.INPA 160 384 64 384 64 480 512 480 512 192 448 192 ecalcs.ecalcs#63.VAL
w 56 -21 100 0 n#2 ebis.ebis#62.VAL 0 -32 160 -32 ecalcs.ecalcs#63.SDIS
[cell use]
use ecalcs 160 -89 100 0 ecalcs#63
xform 0 304 176
p 352 0 100 0 1 CALC:1+(A%100)
p 352 -64 100 0 1 DISV:0
p 352 -32 100 0 1 SCAN:1 second
p 288 416 100 1024 -1 name:$(m1)heartbeat
use ebis -256 -89 100 0 ebis#62
xform 0 -128 -16
p -192 -128 100 0 1 ONAM:TRUE
p -48 -128 100 0 1 OSV:NO_ALARM
p -192 -96 100 0 1 ZNAM:FALSE
p -256 -82 100 0 0 ZSV:MINOR
p -128 48 100 1024 -1 name:$(m1)present
use eais 400 695 100 0 eais#56
xform 0 528 768
p 144 510 100 0 0 EGU:degrees C
p 464 688 100 0 1 PREC:2
p 544 848 100 1024 -1 name:$(m1)chillerSetPoint
use eborderC -1120 -857 100 0 eborderC#29
xform 0 560 448
p 1560 -700 100 1024 -1 author:Bob Wooff
p 1556 -736 100 1024 -1 date:February 17, 1998
p 1956 -736 80 768 -1 file:m1Sim.sch
p 1908 -584 150 256 -1 project:Enclosure Control System
p 1728 -704 100 0 0 revision:$Revision: 1.1.1.1 $
p 1908 -644 200 256 -1 title:M1 Simulator
[comments]
