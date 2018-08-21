[schematic2]
uniq 3
[tools]
[detail]
w 804 619 100 2 n#1 ebis.ebis#141.INP 800 624 800 624 hwin.hwin#142.in
w 100 619 100 2 n#2 hwin.hwin#135.in 96 624 96 624 ebis.ebis#133.INP
s 1248 192 180 0 Power Control Detail
s 1264 256 150 0 Enclosure Control System
s 1024 224 100 0 Angelic Ebbers
s 1024 192 100 0 17/March/2015
s 1024 112 100 0 powerCtrl.sch
s -272 352 100 0 Set DISV to 0 to restrict command to base mode and timer bit
[cell use]
use bb200tr -768 -24 -100 0 frame
xform 0 512 800
use ecsPlcCmd -64 1159 100 0 ecsPlcCmd#143
xform 0 48 1248
p -44 1132 100 0 -1 seta:cmd $(dev)PowerOn
p -48 1104 100 0 -1 setb:address $(plc_addr_on)
use ecsPlcCmd 416 1159 100 0 ecsPlcCmd#144
xform 0 528 1248
p 436 1132 100 0 -1 seta:cmd $(dev)PowerOff
p 432 1104 100 0 -1 setb:address $(plc_addr_off)
use hwin 608 583 100 0 hwin#142
xform 0 704 624
p 560 656 100 0 -1 val(in):@$(ab) $(reset)
use hwin -96 583 100 0 hwin#135
xform 0 0 624
p -144 656 100 0 -1 val(in):@$(ab) $(loto)
use ebis 800 519 100 0 ebis#141
xform 0 928 592
p 816 512 100 0 1 DTYP:AB DF1 serial
p 576 430 100 0 0 ONAM:enabled
p 816 480 100 0 1 SCAN:.5 second
p 576 462 100 0 0 ZNAM:disabled
p 896 656 100 1024 -1 name:$(top)$(dev)AutoReset
use ebis 96 519 100 0 ebis#133
xform 0 224 592
p 112 512 100 0 1 DTYP:AB DF1 serial
p -128 430 100 0 0 ONAM:enabled
p 112 480 100 0 1 SCAN:.5 second
p -128 462 100 0 0 ZNAM:disabled
p 192 656 100 1024 -1 name:$(top)$(dev)Loto
[comments]
