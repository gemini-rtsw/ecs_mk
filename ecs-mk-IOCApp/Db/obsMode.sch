[schematic2]
uniq 19
[tools]
[detail]
w 932 1019 100 2 n#1 edfans.edfans#166.OUTD 928 1024 928 1024 hwout.hwout#191.outp
w 932 1051 100 2 n#2 hwout.hwout#189.outp 928 1056 928 1056 edfans.edfans#166.OUTC
w 932 1083 100 2 n#3 hwout.hwout#173.outp 928 1088 928 1088 edfans.edfans#166.OUTB
w 1892 1067 100 2 n#4 hwout.hwout#195.outp 1888 1072 1888 1072 edfans.edfans#187.OUTB
w 74 1259 100 0 n#5 ebis.ebis#72.VAL -96 416 8 416 8 1248 200 1248 ecalcs.ecalcs#159.INPB
w 310 587 100 0 n#5 edfans.edfans#207.DOL 672 576 8 576 junction
w 932 603 100 2 n#6 hwout.hwout#205.outp 928 608 928 608 edfans.edfans#207.OUTA
w 1186 715 100 0 n#7 edfans.edfans#207.FLNK 928 704 1504 704 1504 1040 1632 1040 edfans.edfans#187.SLNK
w 986 795 100 0 n#8 edfans.edfans#166.FLNK 928 1216 1424 1216 1424 784 608 784 608 544 672 544 edfans.edfans#207.SLNK
w 550 1099 100 0 n#9 edfans.edfans#166.DOL 672 1088 488 1088 ecalcs.ecalcs#159.VAL
w 1018 1371 100 0 n#9 edfans.edfans#187.DOL 1632 1072 1504 1072 1504 1360 592 1360 592 1088 junction
w 1892 1099 100 2 n#10 hwout.hwout#193.outp 1888 1104 1888 1104 edfans.edfans#187.OUTA
w 586 1067 100 0 n#11 ecalcs.ecalcs#159.FLNK 488 1120 560 1120 560 1056 672 1056 edfans.edfans#166.SLNK
w 932 1115 100 2 n#12 hwout.hwout#169.outp 928 1120 928 1120 edfans.edfans#166.OUTA
w -26 1323 100 0 n#13 ebis.ebis#29.FLNK -96 1312 104 1312 104 896 200 896 ecalcs.ecalcs#159.SLNK
w -26 459 100 0 n#13 ebis.ebis#72.FLNK -96 448 104 448 104 896 junction
w 22 1291 100 0 n#14 ebis.ebis#29.VAL -96 1280 200 1280 ecalcs.ecalcs#159.INPA
w -348 971 100 2 n#15 hwin.hwin#67.in -352 976 -352 976 ebis.ebis#66.INP
w -348 715 100 2 n#16 hwin.hwin#68.in -352 720 -352 720 ebis.ebis#69.INP
w -348 459 100 2 n#17 hwin.hwin#71.in -352 464 -352 464 ebis.ebis#72.INP
w -348 1323 100 2 n#18 hwin.hwin#19.in -352 1328 -352 1328 ebis.ebis#29.INP
s 1024 112 100 0 drivePower.sch
s 1024 192 100 0 17/March/2015
s 1024 224 100 0 Angelic Ebbers
s 1264 256 150 0 Enclosure Control System
s 1248 192 200 0 Drive Power Control
s 656 1312 100 0 Must fanout to DISA field of controls to update immediately
[cell use]
use bb200tr -768 -24 -100 0 frame
xform 0 512 800
use edfans 1632 823 100 0 edfans#187
xform 0 1760 1040
p 1696 816 100 768 1 OMSL:closed_loop
p 1792 1248 100 1024 -1 name:$(top)disableControls2
use edfans 672 839 100 0 edfans#166
xform 0 800 1056
p 736 832 100 768 1 OMSL:closed_loop
p 832 1264 100 1024 -1 name:$(top)disableControls1
use edfans 672 327 100 0 edfans#207
xform 0 800 544
p 736 320 100 768 1 OMSL:closed_loop
p 832 752 100 1024 -1 name:$(top)disableControls3
use hwout 1888 1031 100 0 hwout#195
xform 0 1984 1072
p 2096 1072 100 0 -1 val(outp):$(top)wvgPowerOn.DISA
use hwout 1888 1063 100 0 hwout#193
xform 0 1984 1104
p 2096 1104 100 0 -1 val(outp):$(top)evgPowerOn.DISA
use hwout 928 983 100 0 hwout#191
xform 0 1024 1024
p 1136 1024 100 0 -1 val(outp):$(top)domePowerOn.DISA
use hwout 928 1015 100 0 hwout#189
xform 0 1024 1056
p 1136 1056 100 0 -1 val(outp):$(top)bsPowerOn.DISA
use hwout 928 1047 100 0 hwout#173
xform 0 1024 1088
p 1136 1088 100 0 -1 val(outp):$(top)tsPowerOn.DISA
use hwout 928 1079 100 0 hwout#169
xform 0 1024 1120
p 1136 1120 100 0 -1 val(outp):$(top)allDrivesOn.DISA
use hwout 928 567 100 0 hwout#205
xform 0 1024 608
p 1136 608 100 0 -1 val(outp):$(top)lightCmd.DISA
use ecalcs 200 807 100 0 ecalcs#159
xform 0 344 1072
p 408 896 100 0 1 CALC:A||B
p 448 1264 100 1024 -1 name:$(top)powerCtrlEn
use hwin -544 1287 100 0 hwin#19
xform 0 -448 1328
p -648 1352 100 0 -1 val(in):@$(ab) $(summitDriveEn)
use hwin -544 935 100 0 hwin#67
xform 0 -448 976
p -624 1024 100 0 -1 val(in):@$(ab) $(standbyMode)
use hwin -544 679 100 0 hwin#68
xform 0 -448 720
p -624 768 100 0 -1 val(in):@$(ab) $(summitMode)
use hwin -544 423 100 0 hwin#71
xform 0 -448 464
p -624 512 100 0 -1 val(in):@$(ab) $(baseMode)
use ebis -352 1223 100 0 ebis#29
xform 0 -224 1296
p -352 1216 100 0 1 DTYP:AB DF1 serial
p -576 1134 100 0 0 ONAM:enabled
p -352 1184 100 0 1 SCAN:.5 second
p -576 1166 100 0 0 ZNAM:disabled
p -256 1360 100 1024 -1 name:$(top)driveEnable
use ebis -352 871 100 0 ebis#66
xform 0 -224 944
p -352 864 100 0 1 DTYP:AB DF1 serial
p -576 782 100 0 0 ONAM:1
p -352 832 100 0 1 SCAN:.5 second
p -576 814 100 0 0 ZNAM:0
p -256 1008 100 1024 -1 name:$(top)standbyMode
use ebis -352 615 100 0 ebis#69
xform 0 -224 688
p -352 608 100 0 1 DTYP:AB DF1 serial
p -576 526 100 0 0 ONAM:1
p -352 576 100 0 1 SCAN:.5 second
p -576 558 100 0 0 ZNAM:0
p -256 752 100 1024 -1 name:$(top)summitMode
use ebis -352 359 100 0 ebis#72
xform 0 -224 432
p -352 352 100 0 1 DTYP:AB DF1 serial
p -576 270 100 0 0 ONAM:1
p -352 320 100 0 1 SCAN:.5 second
p -576 302 100 0 0 ZNAM:0
p -256 496 100 1024 -1 name:$(top)baseMode
[comments]
