[schematic2]
uniq 16
[tools]
[detail]
w 580 331 100 2 n#1 efanouts.efanouts#157.LNK5 576 336 576 336 hwout.hwout#151.outp
w 580 363 100 2 n#2 efanouts.efanouts#157.LNK4 576 368 576 368 hwout.hwout#149.outp
w 580 395 100 2 n#3 efanouts.efanouts#157.LNK3 576 400 576 400 hwout.hwout#147.outp
w 580 427 100 2 n#4 efanouts.efanouts#157.LNK2 576 432 576 432 hwout.hwout#145.outp
w 580 459 100 2 n#5 efanouts.efanouts#157.LNK1 576 464 576 464 hwout.hwout#144.outp
w 580 683 100 2 n#6 hwout.hwout#138.outp 576 688 576 688 efanouts.efanouts#155.LNK5
w 580 715 100 2 n#7 hwout.hwout#136.outp 576 720 576 720 efanouts.efanouts#155.LNK4
w 580 747 100 2 n#8 hwout.hwout#134.outp 576 752 576 752 efanouts.efanouts#155.LNK3
w 580 779 100 2 n#9 hwout.hwout#132.outp 576 784 576 784 efanouts.efanouts#155.LNK2
w 580 811 100 2 n#10 hwout.hwout#130.outp 576 816 576 816 efanouts.efanouts#155.LNK1
w -364 1099 100 2 n#11 hwin.hwin#67.in -368 1104 -368 1104 ebis.ebis#66.INP
w -364 843 100 2 n#12 hwin.hwin#68.in -368 848 -368 848 ebis.ebis#69.INP
w -364 587 100 2 n#13 hwin.hwin#71.in -368 592 -368 592 ebis.ebis#72.INP
w -364 331 100 2 n#14 hwin.hwin#76.in -368 336 -368 336 ebis.ebis#75.INP
w -364 1355 100 2 n#15 hwin.hwin#19.in -368 1360 -368 1360 ebis.ebis#29.INP
s 1248 192 200 0 Drive Power Control
s 1264 256 150 0 Enclosure Control System
s 1024 224 100 0 Angelic Ebbers
s 1024 192 100 0 16/March/2015
s 1024 112 100 0 drivePower.sch
s 224 608 100 0 set DISV to 0 in order Lock out in non Base mode
[cell use]
use bb200tr -768 -24 -100 0 frame
xform 0 512 800
use efanouts 336 599 100 0 efanouts#155
xform 0 456 752
p 336 672 100 0 1 DISV:3
p 360 856 100 1024 -1 name:$(top)allDrivesOn
p 608 816 75 1280 -1 pproc(LNK1):PP
p 608 784 75 1280 -1 pproc(LNK2):PP
p 608 752 75 1280 -1 pproc(LNK3):PP
p 608 720 75 1280 -1 pproc(LNK4):PP
p 608 688 75 1280 -1 pproc(LNK5):PP
use efanouts 336 247 100 0 efanouts#157
xform 0 456 400
p 352 304 100 0 1 DISV:3
p 360 504 100 1024 -1 name:$(top)allDrivesOff
p 608 464 75 1280 -1 pproc(LNK1):NPP
p 608 432 75 1280 -1 pproc(LNK2):NPP
p 608 400 75 1280 -1 pproc(LNK3):PP
p 608 368 75 1280 -1 pproc(LNK4):PP
p 608 336 75 1280 -1 pproc(LNK5):PP
use hwout 576 295 100 0 hwout#151
xform 0 672 336
p 696 328 100 0 -1 val(outp):$(top)domePowerOff
use hwout 576 327 100 0 hwout#149
xform 0 672 368
p 696 360 100 0 -1 val(outp):$(top)wvgPowerOff
use hwout 576 359 100 0 hwout#147
xform 0 672 400
p 696 392 100 0 -1 val(outp):$(top)evgPowerOff
use hwout 576 391 100 0 hwout#145
xform 0 672 432
p 696 424 100 0 -1 val(outp):$(top)bsPowerOff
use hwout 576 423 100 0 hwout#144
xform 0 672 464
p 696 456 100 0 -1 val(outp):$(top)tsPowerOff
use hwout 576 647 100 0 hwout#138
xform 0 672 688
p 696 680 100 0 -1 val(outp):$(top)domePowerOn
use hwout 576 679 100 0 hwout#136
xform 0 672 720
p 696 712 100 0 -1 val(outp):$(top)wvgPowerOn
use hwout 576 711 100 0 hwout#134
xform 0 672 752
p 696 744 100 0 -1 val(outp):$(top)evgPowerOn
use hwout 576 743 100 0 hwout#132
xform 0 672 784
p 696 776 100 0 -1 val(outp):$(top)bsPowerOn
use hwout 576 775 100 0 hwout#130
xform 0 672 816
p 696 808 100 0 -1 val(outp):$(top)tsPowerOn
use powerCtrl -64 1127 100 0 powerCtrl#123
xform 0 80 1280
p 0 1120 100 0 -1 seta:top $(top)
p 0 1088 100 0 -1 setb:dev ts
p 0 1056 100 0 -1 setc:plc_addr_on $(tsDrvPwOn)
p 0 1024 100 0 -1 setd:loto $(tsLoto)
p 0 992 100 0 -1 sete:reset $(tsAutoReset)
p 0 960 100 0 -1 setf:plc_addr_off $(tsDrvPwOff)
use powerCtrl 288 1127 100 0 powerCtrl#124
xform 0 432 1280
p 352 1120 100 0 -1 seta:top $(top)
p 352 1088 100 0 -1 setb:dev bs
p 352 1056 100 0 -1 setc:plc_addr_on $(bsDrvPwOn)
p 352 1024 100 0 -1 setd:loto $(bsLoto)
p 352 992 100 0 -1 sete:reset $(bsAutoReset)
p 352 960 100 0 -1 setf:plc_addr_off $(bsDrvPwOff)
use powerCtrl 640 1127 100 0 powerCtrl#125
xform 0 784 1280
p 704 1120 100 0 -1 seta:top $(top)
p 704 1088 100 0 -1 setb:dev evg
p 704 1056 100 0 -1 setc:plc_addr_on $(eVgDrvPwOn)
p 704 1024 100 0 -1 setd:loto $(eVgLoto)
p 704 992 100 0 -1 sete:reset $(evgAutoReset)
p 704 960 100 0 -1 setf:plc_addr_off $(eVgDrvPwOff)
use powerCtrl 992 1127 100 0 powerCtrl#126
xform 0 1136 1280
p 1056 1120 100 0 -1 seta:top $(top)
p 1056 1088 100 0 -1 setb:dev wvg
p 1056 1056 100 0 -1 setc:plc_addr_on $(wVgDrvPwOn)
p 1056 1024 100 0 -1 setd:loto $(wVgLoto)
p 1056 992 100 0 -1 sete:reset $(wvgAutoReset)
p 1056 960 100 0 -1 setf:plc_addr_off $(wVgDrvPwOff)
use powerCtrl 1344 1127 100 0 powerCtrl#127
xform 0 1488 1280
p 1408 1120 100 0 -1 seta:top $(top)
p 1408 1088 100 0 -1 setb:dev dome
p 1408 1056 100 0 -1 setc:plc_addr_on $(domeDrvPwOn)
p 1408 1024 100 0 -1 setd:loto $(domeLoto)
p 1408 992 100 0 -1 sete:reset $(domeAutoReset)
p 1408 960 100 0 -1 setf:plc_addr_off $(domeDrvPwOff)
use hwin -560 295 100 0 hwin#76
xform 0 -464 336
p -640 384 100 0 -1 val(in):@$(ab) $(domeDrvSt)
use hwin -560 551 100 0 hwin#71
xform 0 -464 592
p -640 640 100 0 -1 val(in):@$(ab) $(wVgDrvSt)
use hwin -560 807 100 0 hwin#68
xform 0 -464 848
p -640 896 100 0 -1 val(in):@$(ab) $(eVgDrvSt)
use hwin -560 1063 100 0 hwin#67
xform 0 -464 1104
p -640 1152 100 0 -1 val(in):@$(ab) $(bsDrvSt)
use hwin -560 1319 100 0 hwin#19
xform 0 -464 1360
p -640 1408 100 0 -1 val(in):@$(ab) $(tsDrvSt)
use ebis -368 231 100 0 ebis#75
xform 0 -240 304
p -368 224 100 0 1 DTYP:AB DF1 serial
p -592 142 100 0 0 ONAM:1
p -368 192 100 0 1 SCAN:.5 second
p -592 174 100 0 0 ZNAM:0
p -272 368 100 1024 -1 name:$(top)domeDriveStat
use ebis -368 487 100 0 ebis#72
xform 0 -240 560
p -368 480 100 0 1 DTYP:AB DF1 serial
p -592 398 100 0 0 ONAM:1
p -368 448 100 0 1 SCAN:.5 second
p -592 430 100 0 0 ZNAM:0
p -272 624 100 1024 -1 name:$(top)wvgDriveStat
use ebis -368 743 100 0 ebis#69
xform 0 -240 816
p -368 736 100 0 1 DTYP:AB DF1 serial
p -592 654 100 0 0 ONAM:1
p -368 704 100 0 1 SCAN:.5 second
p -592 686 100 0 0 ZNAM:0
p -272 880 100 1024 -1 name:$(top)evgDriveStat
use ebis -368 999 100 0 ebis#66
xform 0 -240 1072
p -368 992 100 0 1 DTYP:AB DF1 serial
p -592 910 100 0 0 ONAM:1
p -368 960 100 0 1 SCAN:.5 second
p -592 942 100 0 0 ZNAM:0
p -272 1136 100 1024 -1 name:$(top)bsDriveStat
use ebis -368 1255 100 0 ebis#29
xform 0 -240 1328
p -368 1248 100 0 1 DTYP:AB DF1 serial
p -592 1166 100 0 0 ONAM:1
p -368 1216 100 0 1 SCAN:.5 second
p -592 1198 100 0 0 ZNAM:0
p -272 1392 100 1024 -1 name:$(top)tsDriveStat
[comments]
