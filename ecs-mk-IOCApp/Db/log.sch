[schematic2]
uniq 15
[tools]
[detail]
w 1880 603 -100 0 c ecars.$(top)logC.FLNK 1824 592 1984 592 outhier.flnk.p
w 1880 763 -100 0 c ecars.$(top)logC.OMSS 1824 752 1984 752 outhier.mess.p
w 1108 947 100 0 n#1 eseqs.$(top)logSeq.LNK2 960 784 1104 784 1104 1120 1184 1120 ebis.ebis#57.SLNK
w 1224 187 100 0 n#2 eseqs.eseqs#46.LNK1 1200 176 1296 176 junction
w 1300 475 100 0 n#2 eseqs.eseqs#46.LNK2 1200 144 1296 144 1296 816 junction
w 984 755 100 0 n#2 eseqs.$(top)logSeq.LNK3 960 752 1056 752 1056 816 junction
w 1208 819 100 0 n#2 eseqs.$(top)logSeq.LNK1 960 816 1504 816 ecars.$(top)logC.IVAL
w 816 155 100 0 n#3 hwin.hwin#53.in 800 144 880 144 eseqs.eseqs#46.DOL2
w 816 187 100 0 n#4 hwin.hwin#52.in 800 176 880 176 eseqs.eseqs#46.DOL1
w 464 155 100 0 n#5 efanouts.efanouts#42.LNK4 416 144 560 144 junction
w 464 187 100 0 n#5 efanouts.efanouts#42.LNK3 416 176 560 176 junction
w 556 27 100 0 n#5 efanouts.efanouts#42.LNK2 416 208 560 208 560 -144 880 -144 eseqs.eseqs#46.SLNK
w 500 363 100 0 n#6 efanouts.efanouts#42.LNK1 416 240 496 240 496 496 640 496 eseqs.$(top)logSeq.SLNK
w 140 347 100 0 n#7 ecad2.ecad2#59.STLK 48 544 144 544 144 160 176 160 efanouts.efanouts#42.SLNK
w 160 251 100 0 n#8 hwin.hwin#44.in 144 240 224 240 efanouts.efanouts#42.SELL
w -488 963 100 0 n#9 ebos.ebos#40.OUT -528 960 -400 960 -400 832 -272 832 ecad2.ecad2#59.A
w 1880 827 100 0 n#10 ecars.$(top)logC.VAL 1824 816 1984 816 outhier.car.p
w 576 763 100 0 n#11 hwin.hwin#23.in 560 752 640 752 eseqs.$(top)logSeq.DOL3
w 576 827 100 0 n#12 hwin.hwin#22.in 560 816 640 816 eseqs.$(top)logSeq.DOL1
w -336 747 100 0 n#13 hwin.hwin#20.in -352 736 -272 736 ecad2.ecad2#59.INPB
w 470 787 100 0 n#14 ecad2.ecad2#59.VALA 48 832 336 832 336 784 640 784 eseqs.$(top)logSeq.DOL2
s -720 624 100 0 log CAD inputs
s -704 592 100 0 A: log mode
s -720 512 100 0 log CAD outputs
s -704 464 100 0 A: validated log mode
s -704 560 100 0 B: Current debug level
[cell use]
use outhier 1920 544 100 0 flnk
xform 0 1968 592
p 1888 464 100 0 0 revision:2.2
use outhier 1920 704 100 0 mess
xform 0 1968 752
p 1888 624 100 0 0 revision:2.2
use ecad2 -272 455 100 0 ecad2#59
xform 0 -112 768
p -112 512 100 512 0 DISV:1
p -32 832 100 2048 -1 FTVA:LONG
p -112 704 100 256 1 SNAM:logCAD
p -224 480 100 512 0 def(SDIS):0.0
p -96 1072 100 1024 -1 name:$(top)log
use ebis 1184 1047 100 0 ebis#57
xform 0 1312 1120
p 1248 1008 100 0 1 ONAM:ON
p 1248 1040 100 0 1 ZNAM:OFF
p 1312 1184 100 1024 -1 name:$(top)logL
use hwin 608 103 100 0 hwin#53
xform 0 704 144
p 611 136 100 0 -1 val(in):$(IDLE)
use hwin 608 135 100 0 hwin#52
xform 0 704 176
p 611 168 100 0 -1 val(in):$(BUSY)
use hwin -48 199 100 0 hwin#44
xform 0 48 240
p -48 192 100 0 -1 val(in):$(top)simMask
use hwin -544 695 100 0 hwin#20
xform 0 -448 736
p -448 688 100 256 -1 val(in):$(top)debugL
use hwin 368 775 100 0 hwin#22
xform 0 464 816
p 371 808 100 0 -1 val(in):$(BUSY)
use hwin 368 711 100 0 hwin#23
xform 0 464 752
p 371 744 100 0 -1 val(in):$(IDLE)
use eseqs 912 272 -100 0 eseqs#46
xform 0 1040 16
p 992 -224 100 0 1 DLY1:0.0
p 992 -256 100 0 1 DLY2:$(W1)
p 1040 240 100 1024 -1 name:$(top)logSimNotNone
p 1216 176 75 1024 -1 pproc(LNK1):PP
p 1216 144 75 1024 -1 pproc(LNK2):PP
use eseqs 672 912 -100 0 $(top)logSeq
xform 0 800 656
p 800 464 100 256 1 DLY1:0.0
p 800 432 100 256 1 DLY2:0.0
p 800 400 100 256 1 DLY3:$(W2)
p 256 364 100 0 0 def(LNK1):0.0
p 1056 784 100 0 0 def(LNK2):0.0
p 800 880 100 1024 -1 name:$(top)logSimNone
p 976 816 75 1024 -1 pproc(LNK1):PP
p 976 784 75 1024 -1 pproc(LNK2):PP
p 976 752 75 1024 -1 pproc(LNK3):PP
use efanouts 176 23 100 0 efanouts#42
xform 0 296 176
p 304 272 100 512 1 SELM:Specified
p 336 304 100 1024 -1 name:$(top)logSimMask
use ebos -784 903 100 0 ebos#40
xform 0 -656 992
p -720 848 100 0 1 ONAM:ON
p -720 880 100 0 1 ZNAM:OFF
p -656 1072 100 1024 -1 name:$(top)logMode
use eborderC -1120 -857 100 0 eborderC#38
xform 0 560 448
p 1556 -700 100 1024 -1 author:Bob Wooff
p 1556 -736 100 1024 -1 date:April 8, 1998
p 1956 -736 80 768 -1 file:log.sch
p 1908 -580 150 256 -1 project:Enclosure Control System
p 1728 -704 100 0 0 revision:$Revision: 1.1.1.1 $
p 1912 -648 200 256 -1 title:Log Command
use outhier 1920 768 100 0 car
xform 0 1968 816
p 1888 688 100 0 0 revision:2.2
use ecars 1616 880 -100 0 $(top)logC
xform 0 1664 704
p 1664 880 100 1024 -1 name:$(top)logC
[comments]
