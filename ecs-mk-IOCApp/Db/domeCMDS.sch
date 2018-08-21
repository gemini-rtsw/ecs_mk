[schematic2]
uniq 7
[tools]
[detail]
w 210 651 100 0 n#1 stopDome.stopDome#509.domeStop 96 640 384 640 devCtrl.devCtrl#464.state
w 324 971 100 0 n#1 inhier.Mode.P -256 1312 320 1312 320 640 junction
w 178 331 100 0 n#1 parkDome.parkDome#510.domePark 96 320 320 320 320 640 junction
w 178 971 100 0 n#1 moveDome.moveDome#508.domeMove 96 960 320 960 junction
w 226 523 100 0 n#2 stopDome.stopDome#509.domeFlnk 96 544 128 544 128 512 384 512 devCtrl.devCtrl#464.flnk
w 196 843 100 0 n#2 inhier.Process.P -256 1184 192 1184 192 512 junction
w 114 235 100 0 n#2 parkDome.parkDome#510.domeFlnk 96 224 192 224 192 512 junction
w 114 875 100 0 n#2 moveDome.moveDome#508.domeFlnk 96 864 192 864 junction
w 994 619 100 0 n#3 devCtrl.devCtrl#464.carMess 864 640 960 640 960 608 1088 608 ecars.ecars#375.IMSS
w 946 683 100 0 n#4 devCtrl.devCtrl#464.car 864 672 1088 672 ecars.ecars#375.IVAL
w 1442 459 -100 0 c ecars.ecars#375.FLNK 1408 448 1536 448 outhier.flnk.p
w 1442 619 -100 0 c ecars.ecars#375.OMSS 1408 608 1536 608 outhier.mess.p
w 290 619 100 0 n#5 inhier.Position.P -256 1248 256 1248 256 608 384 608 devCtrl.devCtrl#464.pos
w 146 299 100 0 n#5 parkDome.parkDome#510.domePos 96 288 256 288 256 608 junction
w 146 939 100 0 n#5 moveDome.moveDome#508.domePos 96 928 256 928 junction
w 1442 683 100 0 n#6 ecars.ecars#375.VAL 1408 672 1536 672 outhier.car.p
s 1104 -608 100 0 Added dome offset
s 1104 -640 100 0 Pedro Gigoux (Mar/99)
[cell use]
use deiceDome -288 -585 100 0 deiceDome#541
xform 0 -96 -448
p -288 -592 100 0 1 sets:sys di:
use eaos -800 487 100 0 eaos#538
xform 0 -672 576
p -704 528 100 0 1 PREC:2
p -640 656 100 1024 -1 name:$(top)domeAzOffset
use outhier 1504 407 100 0 flnk
xform 0 1520 448
use outhier 1504 567 100 0 mess
xform 0 1520 608
use outhier 1504 631 100 0 car
xform 0 1520 672
use parkDome -288 135 100 0 parkDome#510
xform 0 -96 272
use stopDome -288 455 100 0 stopDome#509
xform 0 -96 592
use moveDome -256 743 100 0 moveDome#508
xform 0 -96 912
use devCtrl 384 423 100 0 devCtrl#464
xform 0 624 592
p 480 420 100 0 1 seta:dev dm
p 480 400 100 0 1 set0:motor dome
p 480 380 100 0 1 set1:hs $(dmHs)
p 480 360 100 0 1 set2:enc $(dmEnc)
p 480 340 100 0 1 set3:posdmd $(dmPosDmd)
use inhier -272 1143 100 0 Process
xform 0 -256 1184
use inhier -272 1207 100 0 Position
xform 0 -256 1248
use inhier -272 1271 100 0 Mode
xform 0 -256 1312
use ecars 1088 391 100 0 ecars#375
xform 0 1248 560
p 1248 704 100 1024 -1 name:$(top)domeC
use eborderC -1152 -857 100 0 eborderC#258
xform 0 528 448
p 1532 -700 100 1024 -1 author:Bob Wooff
p 1524 -736 100 1024 -1 date:May 8, 1998
p 1924 -736 80 768 -1 file:domeCMDS.sch
p 1876 -580 150 256 -1 project:Enclosure Control System
p 1696 -704 100 0 0 revision:$Revision: 1.5 $
p 1880 -648 200 256 -1 title:Dome Commands
[comments]
