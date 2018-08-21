[schematic2]
uniq 27
[tools]
[detail]
w 1074 555 100 0 n#1 egenSub.fake.VALD 816 704 960 704 960 544 1248 544 eaos.posOut.SDIS
w 1002 875 100 0 n#2 egenSub.fake.OUTA 816 864 1248 864 eaos.hskOut.SLNK
w 954 779 100 0 n#3 egenSub.fake.VALC 816 768 1152 768 1152 832 1248 832 eaos.hskOut.SDIS
w 420 -453 100 0 n#4 elongins.defaultPos.VAL -336 -1184 416 -1184 416 288 528 288 egenSub.fake.INPJ
w 356 -333 100 0 n#5 elongins.offTime.VAL -336 -1008 352 -1008 352 352 528 352 egenSub.fake.INPI
w 284 -213 100 0 n#6 elongins.staTime.VAL -352 -832 288 -832 288 416 528 416 egenSub.fake.INPH
w 228 -85 100 0 n#7 elongins.chkTime.VAL -352 -640 224 -640 224 480 528 480 egenSub.fake.INPG
w 164 43 100 0 n#8 elongins.pwrTime.VAL -352 -448 160 -448 160 544 528 544 egenSub.fake.INPF
w 100 171 100 0 n#9 elongins.maxVel.VAL -352 -256 96 -256 96 608 528 608 egenSub.fake.INPE
w 36 299 100 0 n#10 elongins.maxPos.VAL -352 -64 32 -64 32 672 528 672 egenSub.fake.INPD
w -28 411 100 0 n#11 elongins.vel.VAL -352 96 -32 96 -32 736 528 736 egenSub.fake.INPC
w -638 155 100 0 n#12 hwin.hwin#662.in -608 144 -608 144 elongins.vel.INP
w -638 -5 100 0 n#13 hwin.hwin#659.in -608 -16 -608 -16 elongins.maxPos.INP
w -622 -1125 100 0 n#14 elongins.defaultPos.INP -592 -1136 -592 -1136 hwin.hwin#656.in
w -622 -949 100 0 n#15 hwin.hwin#653.in -592 -960 -592 -960 elongins.offTime.INP
w -638 -773 100 0 n#16 elongins.staTime.INP -608 -784 -608 -784 hwin.hwin#650.in
w -638 -581 100 0 n#17 hwin.hwin#647.in -608 -592 -608 -592 elongins.chkTime.INP
w -638 -389 100 0 n#18 elongins.pwrTime.INP -608 -400 -608 -400 hwin.hwin#644.in
w -638 -197 100 0 n#19 hwin.hwin#641.in -608 -208 -608 -208 elongins.maxVel.INP
w 1020 683 100 0 n#20 egenSub.fake.OUTB 816 800 1024 800 1024 576 1248 576 eaos.posOut.SLNK
w 186 803 100 0 n#21 eais.posIn.VAL -320 608 -96 608 -96 800 528 800 egenSub.fake.INPB
w 74 867 100 0 n#22 eais.hskIn.VAL -320 864 528 864 egenSub.fake.INPA
w 1474 555 100 0 n#23 eaos.posOut.OUT 1504 544 1504 544 hwout.hwout#631.outp
w -606 667 100 0 n#24 eais.posIn.INP -576 656 -576 656 hwin.hwin#625.in
w -606 923 100 0 n#25 hwin.hwin#290.in -576 912 -576 912 eais.hskIn.INP
w 1474 843 100 0 n#26 hwout.hwout#549.outp 1504 832 1504 832 eaos.hskOut.OUT
[cell use]
use eborderC -1152 -1433 100 0 eborderC#679
xform 0 528 -128
p 1532 -1276 100 1024 -1 author:W.N. Rambold
p 1528 -1308 100 1024 -1 date:May 8, 1998
p 1928 -1308 80 768 -1 file:ecsPosDeviceSim.sch
p 1920 -1280 100 0 0 page:
p 2032 -1280 100 0 0 pages:
p 1648 -1312 100 0 0 primitive:eborderC
p 1872 -1156 150 256 -1 project:Enclosure Control System
p 1696 -1280 100 0 0 revision:$Revision: 1.1.1.1 $
p 1648 -1168 150 768 0 system:
p 1876 -1220 200 256 -1 title:Pos Device Sim
use elongins -608 39 100 0 vel
xform 0 -480 112
use elongins -608 -121 100 0 maxPos
xform 0 -480 -48
use elongins -592 -1241 100 0 defaultPos
xform 0 -464 -1168
use elongins -592 -1065 100 0 offTime
xform 0 -464 -992
use elongins -608 -889 100 0 staTime
xform 0 -480 -816
use elongins -608 -697 100 0 chkTime
xform 0 -480 -624
use elongins -608 -505 100 0 pwrTime
xform 0 -480 -432
use elongins -608 -313 100 0 maxVel
xform 0 -480 -240
use hwin -800 103 100 0 hwin#662
xform 0 -704 144
p -797 136 100 0 -1 val(in):100
use hwin -800 -57 100 0 hwin#659
xform 0 -704 -16
p -797 -24 100 0 -1 val(in):10000
use hwin -784 -1177 100 0 hwin#656
xform 0 -688 -1136
p -781 -1144 100 0 -1 val(in):50
use hwin -784 -1001 100 0 hwin#653
xform 0 -688 -960
p -781 -968 100 0 -1 val(in):10
use hwin -800 -825 100 0 hwin#650
xform 0 -704 -784
p -797 -792 100 0 -1 val(in):5
use hwin -800 -633 100 0 hwin#647
xform 0 -704 -592
p -797 -600 100 0 -1 val(in):5
use hwin -800 -441 100 0 hwin#644
xform 0 -704 -400
p -797 -408 100 0 -1 val(in):5
use hwin -800 -249 100 0 hwin#641
xform 0 -704 -208
p -797 -216 100 0 -1 val(in):1000
use hwin -768 871 100 0 hwin#290
xform 0 -672 912
p -912 912 100 0 -1 val(in):@$(hword)
use hwin -768 615 100 0 hwin#625
xform 0 -672 656
p -912 656 100 0 -1 val(in):@$(pword)
use hwout 1504 791 100 0 hwout#549
xform 0 1600 832
p 1728 816 100 768 -1 val(outp):@$(hword)
use hwout 1504 503 100 0 hwout#631
xform 0 1600 544
p 1728 528 100 768 -1 val(outp):@$(eword)
use eaos 1248 775 100 0 hskOut
xform 0 1376 864
p 992 558 100 0 0 DISV:1
p 1312 736 100 0 1 DTYP:AB DF1 serial
p 1312 704 100 0 0 OMSL:supervisory
use eaos 1248 487 100 0 posOut
xform 0 1376 576
p 992 270 100 0 0 DISV:1
p 1312 448 100 0 1 DTYP:AB DF1 serial
p 1312 416 100 0 0 OMSL:supervisory
use eais -576 807 100 0 hskIn
xform 0 -448 880
p -512 768 100 0 1 DTYP:AB DF1 serial
p -832 750 100 0 0 LINR:NO CONVERSION
p -504 736 100 0 1 SCAN:.5 second
use eais -576 551 100 0 posIn
xform 0 -448 624
p -512 512 100 0 1 DTYP:AB DF1 serial
p -832 494 100 0 0 LINR:NO CONVERSION
p -504 480 100 0 1 SCAN:.5 second
use egenSub 528 103 100 0 fake
xform 0 672 528
p 305 -123 100 0 0 FTA:LONG
p 305 -123 100 0 0 FTB:LONG
p 305 -155 100 0 0 FTC:LONG
p 305 -187 100 0 0 FTD:LONG
p 305 -219 100 0 0 FTE:LONG
p 305 -283 100 0 0 FTF:LONG
p 305 -283 100 0 0 FTG:LONG
p 305 -315 100 0 0 FTH:LONG
p 305 -347 100 0 0 FTI:LONG
p 305 -379 100 0 0 FTJ:LONG
p 305 -123 100 0 0 FTVA:LONG
p 305 -123 100 0 0 FTVB:LONG
p 305 -155 100 0 0 FTVC:LONG
p 305 -187 100 0 0 FTVD:LONG
p 305 -219 100 0 0 FTVE:LONG
p 305 -283 100 0 0 FTVF:LONG
p 305 -283 100 0 0 FTVG:LONG
p 305 -315 100 0 0 FTVH:LONG
p 305 -347 100 0 0 FTVI:LONG
p 305 -379 100 0 0 FTVJ:LONG
p 240 510 100 0 0 INAM:ecsPosDevInit
p 240 798 100 0 0 SCAN:.2 second
p 240 478 100 0 0 SNAM:ecsPosDevProcess
p 816 874 75 0 -1 pproc(OUTA):PP
p 816 810 75 0 -1 pproc(OUTB):PP
[comments]
