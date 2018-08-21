[schematic2]
uniq 6
[tools]
[detail]
w 420 -469 100 0 n#1 ebis.enable.VAL 256 -576 416 -576 416 -352 576 -352 ecalcs.ecalcs#684.SDIS
w 962 -53 100 0 n#2 eaos.hbOut.DOL 1056 -64 928 -64 junction
w 642 203 100 0 n#2 ecalcs.ecalcs#684.VAL 864 -128 928 -128 928 192 416 192 416 64 576 64 ecalcs.ecalcs#684.INPA
w 930 -85 100 0 n#3 ecalcs.ecalcs#684.FLNK 864 -96 1056 -96 eaos.hbOut.SLNK
w -230 179 100 0 n#4 hwin.hwin#290.in -256 176 -144 176 eais.hbIn.INP
w 1282 -117 100 0 n#5 hwout.hwout#549.outp 1312 -128 1312 -128 eaos.hbOut.OUT
[cell use]
use eborderC -1120 -1465 100 0 eborderC#689
xform 0 560 -160
p 1564 -1308 100 1024 -1 author:W.N. Rambold
p 1560 -1340 100 1024 -1 date:May 8, 1998
p 1960 -1340 80 768 -1 file:ecsHeartbeat.sch
p 1952 -1312 100 0 0 page:
p 2064 -1312 100 0 0 pages:
p 1680 -1344 100 0 0 primitive:eborderC
p 1904 -1188 150 256 -1 project:Enclosure Control System
p 1728 -1312 100 0 0 revision:$Revision: 1.1.1.1 $
p 1680 -1200 150 768 0 system:
p 1908 -1252 200 256 -1 title:A-B Heartbeat
use ecalcs 576 -409 100 0 ecalcs#684
xform 0 720 -144
p 483 72 100 0 0 CALC:(A%100)+1
p 373 -559 100 0 0 PV:$(top)$(dev)
p 288 -34 100 0 0 SCAN:1 second
use ebis 0 -633 100 0 enable
xform 0 128 -560
p -224 -722 100 0 0 ONAM:DEAD
p -204 -1188 100 0 0 PV:$(top)$(dev)
p -224 -690 100 0 0 ZNAM:ALIVE
use hwin -448 135 100 0 hwin#290
xform 0 -352 176
p -592 176 100 0 -1 val(in):@$(ab) $(ecsHb)
use hwout 1312 -169 100 0 hwout#549
xform 0 1408 -128
p 1536 -144 100 768 -1 val(outp):@$(ab) $(plcHb)
use eaos 1056 -185 100 0 hbOut
xform 0 1184 -96
p 800 -402 100 0 0 DISV:1
p 1120 -224 100 0 1 DTYP:AB DF1 serial
p 1120 -256 100 0 0 OMSL:closed_loop
p 820 -678 100 0 0 PV:$(top)$(dev)
use eais -144 71 100 0 hbIn
xform 0 -16 144
p -80 32 100 0 1 DTYP:AB DF1 serial
p -400 14 100 0 0 LINR:NO CONVERSION
p -380 -472 100 0 0 PV:$(top)$(dev)
p -72 0 100 0 1 SCAN:.5 second
[comments]
