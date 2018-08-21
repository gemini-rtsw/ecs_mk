[schematic2]
uniq 7
[tools]
[detail]
w 1348 987 100 2 n#1 hwout.hwout#168.outp 1344 992 1344 992 ebos.ebos#166.OUT
w 846 1067 100 0 n#2 ecalcs.ecalcs#159.VAL 664 1056 1088 1056 ebos.ebos#166.DOL
w 146 1291 100 0 n#3 ebis.ebis#29.FLNK 80 1280 272 1280 272 864 376 864 ecalcs.ecalcs#159.SLNK
w 198 1259 100 0 n#4 ebis.ebis#29.VAL 80 1248 376 1248 ecalcs.ecalcs#159.INPA
w 75 718 100 2 n#5 hwin.hwin#71.in 64 688 64 688 ebis.ebis#72.INP
w -172 1291 100 2 n#6 hwin.hwin#19.in -176 1296 -176 1296 ebis.ebis#29.INP
s 912 800 100 0 disabling in non-BASE mode to simplify PLC programming
s 1248 192 200 0 Drive Power Control
s 1264 256 150 0 Enclosure Control System
s 1024 224 100 0 Angelic Ebbers
s 1024 192 100 0 17/March/2015
s 1024 112 100 0 drivePower.sch
s 928 832 100 0 set DISV to 0 to restrict command to Base Mode
[cell use]
use bb200tr -768 -24 -100 0 frame
xform 0 512 800
use hwin -128 647 100 0 hwin#71
xform 0 -32 688
p -208 736 100 0 -1 val(in):@$(ab) $(domeLightSt)
use hwin -368 1255 100 0 hwin#19
xform 0 -272 1296
p -472 1320 100 0 -1 val(in):@$(ab) $(domeLightCmd)
use hwout 1344 951 100 0 hwout#168
xform 0 1440 992
p 1392 944 100 0 -1 val(outp):@$(ab) $(domeLightCmd)
use ebos 1088 935 100 0 ebos#166
xform 0 1216 1024
p 1120 864 100 0 1 DISV:0
p 1120 928 100 0 1 DTYP:AB DF1 serial
p 1120 896 100 0 1 OMSL:closed_loop
p 768 878 100 0 0 ONAM:1
p 768 910 100 0 0 ZNAM:0
p 1184 1104 100 1024 -1 name:$(top)lightCmd
use ecalcs 376 775 100 0 ecalcs#159
xform 0 520 1040
p 584 864 100 0 1 CALC:!A
p 624 1232 100 1024 -1 name:$(top)calcToggle
use ebis 64 583 100 0 ebis#72
xform 0 192 656
p 64 576 100 0 1 DTYP:AB DF1 serial
p -160 494 100 0 0 ONAM:On
p 64 544 100 0 1 SCAN:.5 second
p -160 526 100 0 0 ZNAM:Off
p 160 720 100 1024 -1 name:$(top)lightState
use ebis -176 1191 100 0 ebis#29
xform 0 -48 1264
p -176 1184 100 0 1 DTYP:AB DF1 serial
p -400 1102 100 0 0 ONAM:On
p -176 1152 100 0 1 SCAN:.5 second
p -400 1134 100 0 0 ZNAM:Off
p -80 1328 100 1024 -1 name:$(top)lightCmdState
[comments]
