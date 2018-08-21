[schematic2]
uniq 27
[tools]
[detail]
w 1258 587 100 0 n#1 egenSub.fake.VALD 992 736 1152 736 1152 576 1424 576 eaos.posOut.SDIS
w 1106 811 100 0 n#2 egenSub.fake.VALC 992 800 1280 800 1280 864 1424 864 eaos.hskOut.SDIS
w 1178 907 100 0 n#3 egenSub.fake.OUTA 992 896 1424 896 eaos.hskOut.SLNK
w 444 -245 100 0 n#4 elongins.offTime.VAL -192 -864 448 -864 448 384 704 384 egenSub.fake.INPI
w 316 11 100 0 n#5 elongins.chkTime.VAL -192 -480 320 -480 320 512 704 512 egenSub.fake.INPG
w 508 -373 100 0 n#6 elongins.defaultPos.VAL -192 -1056 512 -1056 512 320 704 320 egenSub.fake.INPJ
w 380 -117 100 0 n#7 elongins.staTime.VAL -192 -672 384 -672 384 448 704 448 egenSub.fake.INPH
w 252 139 100 0 n#8 elongins.pwrTime.VAL -192 -288 256 -288 256 576 704 576 egenSub.fake.INPF
w 188 267 100 0 n#9 elongins.maxVel.VAL -192 -96 192 -96 192 640 704 640 egenSub.fake.INPE
w 124 395 100 0 n#10 elongins.maxPos.VAL -192 96 128 96 128 704 704 704 egenSub.fake.INPD
w -478 -997 100 0 n#11 hwin.hwin#659.in -448 -1008 -448 -1008 elongins.defaultPos.INP
w -478 -805 100 0 n#12 elongins.offTime.INP -448 -816 -448 -816 hwin.hwin#656.in
w -478 -613 100 0 n#13 hwin.hwin#653.in -448 -624 -448 -624 elongins.staTime.INP
w -478 -421 100 0 n#14 elongins.chkTime.INP -448 -432 -448 -432 hwin.hwin#650.in
w -478 -229 100 0 n#15 hwin.hwin#647.in -448 -240 -448 -240 elongins.pwrTime.INP
w -478 -37 100 0 n#16 elongins.maxVel.INP -448 -48 -448 -48 hwin.hwin#644.in
w -478 155 100 0 n#17 hwin.hwin#641.in -448 144 -448 144 elongins.maxPos.INP
w 1074 835 100 0 n#18 egenSub.fake.OUTB 992 832 1216 832 1216 608 1424 608 eaos.posOut.SLNK
w 346 771 100 0 n#19 eais.velIn.VAL -192 384 48 384 48 768 704 768 egenSub.fake.INPC
w 314 835 100 0 n#20 eais.posIn.VAL -192 640 -16 640 -16 832 704 832 egenSub.fake.INPB
w 226 899 100 0 n#21 eais.hskIn.VAL -192 896 704 896 egenSub.fake.INPA
w 1650 587 100 0 n#22 eaos.posOut.OUT 1680 576 1680 576 hwout.hwout#631.outp
w -478 443 100 0 n#23 hwin.hwin#626.in -448 432 -448 432 eais.velIn.INP
w -478 699 100 0 n#24 eais.posIn.INP -448 688 -448 688 hwin.hwin#625.in
w -478 955 100 0 n#25 hwin.hwin#290.in -448 944 -448 944 eais.hskIn.INP
w 1650 875 100 0 n#26 hwout.hwout#549.outp 1680 864 1680 864 eaos.hskOut.OUT
[cell use]
use eborderC -1088 -1369 100 0 eborderC#679
xform 0 592 -64
p 1596 -1212 100 1024 -1 author:W.N. Rambold
p 1592 -1244 100 1024 -1 date:May 8, 1998
p 1992 -1244 80 768 -1 file:ecsPosVelDeviceSim.sch
p 1984 -1216 100 0 0 page:
p 2096 -1216 100 0 0 pages:
p 1712 -1248 100 0 0 primitive:eborderC
p 1936 -1092 150 256 -1 project:Enclosure Control System
p 1760 -1216 100 0 0 revision:$Revision: 1.1.1.1 $
p 1712 -1104 150 768 0 system:
p 1940 -1156 200 256 -1 title:Pos/Vel Device Sim
use elongins -448 39 100 0 maxPos
xform 0 -320 112
use elongins -448 -153 100 0 maxVel
xform 0 -320 -80
use elongins -448 -345 100 0 pwrTime
xform 0 -320 -272
use elongins -448 -537 100 0 chkTime
xform 0 -320 -464
use elongins -448 -729 100 0 staTime
xform 0 -320 -656
use elongins -448 -921 100 0 offTime
xform 0 -320 -848
use elongins -448 -1113 100 0 defaultPos
xform 0 -320 -1040
use hwin -640 391 100 0 hwin#626
xform 0 -544 432
p -784 432 100 0 -1 val(in):@$(vword)
use hwin -640 647 100 0 hwin#625
xform 0 -544 688
p -784 688 100 0 -1 val(in):@$(pword)
use hwin -640 903 100 0 hwin#290
xform 0 -544 944
p -784 944 100 0 -1 val(in):@$(hword)
use hwin -640 103 100 0 hwin#641
xform 0 -544 144
p -637 136 100 0 -1 val(in):36000
use hwin -640 -89 100 0 hwin#644
xform 0 -544 -48
p -637 -56 100 0 -1 val(in):300
use hwin -640 -281 100 0 hwin#647
xform 0 -544 -240
p -637 -248 100 0 -1 val(in):10
use hwin -640 -473 100 0 hwin#650
xform 0 -544 -432
p -637 -440 100 0 -1 val(in):5
use hwin -640 -665 100 0 hwin#653
xform 0 -544 -624
p -637 -632 100 0 -1 val(in):5
use hwin -640 -857 100 0 hwin#656
xform 0 -544 -816
p -637 -824 100 0 -1 val(in):5
use hwin -640 -1049 100 0 hwin#659
xform 0 -544 -1008
p -637 -1016 100 0 -1 val(in):50
use hwout 1680 535 100 0 hwout#631
xform 0 1776 576
p 1904 560 100 768 -1 val(outp):@$(eword)
use hwout 1680 823 100 0 hwout#549
xform 0 1776 864
p 1904 848 100 768 -1 val(outp):@$(hword)
use eaos 1424 519 100 0 posOut
xform 0 1552 608
p 1168 302 100 0 0 DISV:1
p 1488 480 100 0 1 DTYP:AB DF1 serial
p 1488 448 100 0 0 OMSL:supervisory
use eaos 1424 807 100 0 hskOut
xform 0 1552 896
p 1168 590 100 0 0 DISV:1
p 1488 768 100 0 1 DTYP:AB DF1 serial
p 1488 736 100 0 0 OMSL:supervisory
use eais -448 327 100 0 velIn
xform 0 -320 400
p -384 288 100 0 1 DTYP:AB DF1 serial
p -704 270 100 0 0 LINR:NO CONVERSION
p -376 256 100 0 1 SCAN:I/O Intr
use eais -448 583 100 0 posIn
xform 0 -320 656
p -384 544 100 0 1 DTYP:AB DF1 serial
p -704 526 100 0 0 LINR:NO CONVERSION
p -376 512 100 0 1 SCAN:I/O Intr
use eais -448 839 100 0 hskIn
xform 0 -320 912
p -384 800 100 0 1 DTYP:AB DF1 serial
p -704 782 100 0 0 LINR:NO CONVERSION
p -376 768 100 0 1 SCAN:I/O Intr
use egenSub 704 135 100 0 fake
xform 0 848 560
p 481 -91 100 0 0 FTA:LONG
p 481 -91 100 0 0 FTB:LONG
p 481 -123 100 0 0 FTC:LONG
p 481 -155 100 0 0 FTD:LONG
p 481 -187 100 0 0 FTE:LONG
p 481 -251 100 0 0 FTF:LONG
p 481 -251 100 0 0 FTG:LONG
p 481 -283 100 0 0 FTH:LONG
p 481 -315 100 0 0 FTI:LONG
p 481 -347 100 0 0 FTJ:LONG
p 481 -91 100 0 0 FTVA:LONG
p 481 -91 100 0 0 FTVB:LONG
p 481 -123 100 0 0 FTVC:LONG
p 481 -155 100 0 0 FTVD:LONG
p 481 -187 100 0 0 FTVE:LONG
p 481 -251 100 0 0 FTVF:LONG
p 481 -251 100 0 0 FTVG:LONG
p 481 -283 100 0 0 FTVH:LONG
p 481 -315 100 0 0 FTVI:LONG
p 481 -347 100 0 0 FTVJ:LONG
p 416 542 100 0 0 INAM:ecsPosVelDevInit
p 416 830 100 0 0 SCAN:.2 second
p 416 510 100 0 0 SNAM:ecsPosVelDevProcess
p 992 906 75 0 -1 pproc(OUTA):PP
p 992 842 75 0 -1 pproc(OUTB):PP
[comments]
