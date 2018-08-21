[schematic2]
uniq 11
[tools]
[detail]
w -38 -21 100 0 n#1 ebos.ebos#453.VAL -80 -32 64 -32 ecalcs.ecalcs#444.SDIS
w 226 -69 100 0 n#1 junction 64 -32 64 -80 448 -80 448 128 embbos.embbos#447.SDIS
w 570 -69 100 0 n#1 junction 448 -80 752 -80 752 -32 embbos.embbos#481.SDIS
w -38 555 100 0 n#2 ebos.ebos#450.VAL -80 544 64 544 ecalcs.ecalcs#437.SDIS
w 226 507 100 0 n#2 junction 64 544 64 496 448 496 448 704 embbos.embbos#434.SDIS
w 570 507 100 0 n#2 junction 448 496 752 496 752 544 embbos.embbos#480.SDIS
w 1010 11 100 0 n#3 embbos.embbos#481.OUT 1008 0 1072 0 hwout.hwout#473.outp
w 1010 587 100 0 n#4 embbos.embbos#480.OUT 1008 576 1072 576 hwout.hwout#472.outp
w 706 171 100 0 n#5 embbos.embbos#447.OUT 704 160 768 160 hwout.hwout#446.outp
w 386 203 100 0 n#6 junction 384 192 448 192 embbos.embbos#447.DOL
w 146 459 100 0 n#6 ecalcs.ecalcs#444.INPA 64 384 -32 384 -32 448 384 448 384 192 352 192 ecalcs.ecalcs#444.VAL
w 354 235 100 0 n#7 ecalcs.ecalcs#444.FLNK 352 224 416 224 416 160 448 160 embbos.embbos#447.SLNK
w 354 811 100 0 n#8 ecalcs.ecalcs#437.FLNK 352 800 416 800 416 736 448 736 embbos.embbos#434.SLNK
w 146 1035 100 0 n#9 ecalcs.ecalcs#437.INPA 64 960 -32 960 -32 1024 384 1024 384 768 352 768 ecalcs.ecalcs#437.VAL
w 386 779 100 0 n#9 junction 384 768 448 768 embbos.embbos#434.DOL
w 706 747 100 0 n#10 embbos.embbos#434.OUT 704 736 768 736 hwout.hwout#435.outp
[cell use]
use hwout 768 695 100 0 hwout#435
xform 0 864 736
p 864 727 100 0 -1 val(outp):#C0 S24
use hwout 768 119 100 0 hwout#446
xform 0 864 160
p 864 151 100 0 -1 val(outp):#C0 S26
use hwout 1072 535 100 0 hwout#472
xform 0 1168 576
p 1168 567 100 0 -1 val(outp):#C0 S24
use hwout 1072 -41 100 0 hwout#473
xform 0 1168 0
p 1168 -9 100 0 -1 val(outp):#C0 S26
use ebos -336 455 100 0 ebos#450
xform 0 -208 544
p -656 398 100 0 0 ONAM:MANUAL
p -656 430 100 0 0 ZNAM:AUTOSCAN
p -224 608 100 1024 -1 name:$(gis)ecMotionSimEn
use ebos -336 -121 100 0 ebos#453
xform 0 -208 -32
p -656 -178 100 0 0 ONAM:MANUAL
p -656 -146 100 0 0 ZNAM:AUTOSCAN
p -224 32 100 1024 -1 name:$(gis)ecThermalSimEn
use embbos 448 647 100 0 embbos#434
xform 0 576 736
p 512 640 100 0 1 DTYP:XYCOM-240
p 512 448 100 0 1 NOBT:2
p 512 480 100 0 1 OMSL:closed_loop
p 512 576 100 0 1 ONVL:1
p 512 512 100 0 1 THVL:3
p 512 544 100 0 1 TWVL:2
p 512 608 100 0 1 ZRVL:0
p 576 816 100 1024 -1 name:$(gis)ecMotionSimScan
use embbos 448 71 100 0 embbos#447
xform 0 576 160
p 512 64 100 0 1 DTYP:XYCOM-240
p 512 -128 100 0 1 NOBT:2
p 512 -96 100 0 1 OMSL:closed_loop
p 512 0 100 0 1 ONVL:1
p 512 -64 100 0 1 THVL:3
p 512 -32 100 0 1 TWVL:2
p 512 32 100 0 1 ZRVL:0
p 576 240 100 1024 -1 name:$(gis)ecThermalSimScan
use embbos 752 487 100 0 embbos#480
xform 0 880 576
p 816 320 100 0 1 DISV:0
p 816 480 100 0 1 DTYP:XYCOM-240
p 816 352 100 0 1 NOBT:2
p 816 384 100 0 1 OMSL:supervisory
p 912 416 100 0 1 ONST:CLEAR
p 816 416 100 0 1 ONVL:1
p 912 574 100 0 0 THST:
p 816 352 100 0 0 THVL:
p 912 606 100 0 0 TWST:
p 816 384 100 0 0 TWVL:
p 912 448 100 0 1 ZRST:INTERLOCK
p 816 448 100 0 1 ZRVL:2
p 880 656 100 1024 -1 name:$(gis)ecMotionSim
use embbos 752 -89 100 0 embbos#481
xform 0 880 0
p 816 -256 100 0 1 DISV:0
p 816 -96 100 0 1 DTYP:XYCOM-240
p 816 -224 100 0 1 NOBT:2
p 816 -192 100 0 1 OMSL:supervisory
p 912 -160 100 0 1 ONST:CLEAR
p 816 -160 100 0 1 ONVL:1
p 912 -2 100 0 0 THST:
p 816 -224 100 0 0 THVL:
p 912 30 100 0 0 TWST:
p 816 -192 100 0 0 TWVL:
p 912 -128 100 0 1 ZRST:INTERLOCK
p 816 -128 100 0 1 ZRVL:2
p 880 80 100 1024 -1 name:$(gis)ecThermalSim
use ecalcs 64 487 100 0 ecalcs#437
xform 0 208 752
p 288 640 100 0 1 CALC:(A+1)%4
p 288 608 100 0 1 SCAN:1 second
p 176 1024 100 1024 -1 name:$(gis)ecMotionSimIncr
use ecalcs 64 -89 100 0 ecalcs#444
xform 0 208 176
p 288 64 100 0 1 CALC:(A+1)%4
p 288 32 100 0 1 SCAN:1 second
p 176 448 100 1024 -1 name:$(gis)ecThermalSimIncr
use eborderC -1152 -857 100 0 eborderC#258
xform 0 528 448
p 1532 -700 100 1024 -1 author:Bob Wooff
p 1524 -736 100 1024 -1 date:March 5, 1998
p 1928 -736 80 768 -1 file:gisSim.sch
p 1876 -584 150 256 -1 project:Enclosure Control System
p 1696 -704 100 0 0 revision:$Revision: 1.1.1.1 $
p 1892 -648 200 256 -1 title:GIS Simulator
[comments]
