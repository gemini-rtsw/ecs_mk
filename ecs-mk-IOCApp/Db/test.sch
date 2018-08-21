[schematic2]
uniq 15
[tools]
[detail]
w 1640 171 -100 0 c ecars.$(top)testC.FLNK 1568 160 1760 160 outhier.flnk.p
w 1640 331 -100 0 c ecars.$(top)testC.OMSS 1568 320 1760 320 outhier.mess.p
w 932 683 100 0 n#1 eseqs.eseqs#76.LNK1 832 992 928 992 928 384 junction
w 856 363 100 0 n#1 eseqs.eseqs#40.LNK2 832 352 928 352 928 384 junction
w 1016 395 100 0 n#1 eseqs.eseqs#40.LNK1 832 384 1248 384 ecars.$(top)testC.IVAL
w 1668 883 100 0 n#1 egenSub.egenSub#60.OUTB 1552 1248 1664 1248 1664 528 1120 528 1120 384 junction
w 1700 899 100 0 n#2 egenSub.egenSub#60.OUTA 1552 1312 1696 1312 1696 496 1152 496 1152 320 1248 320 ecars.$(top)testC.IMSS
w 996 795 100 0 n#3 eseqs.eseqs#76.LNK2 832 960 992 960 992 640 1264 640 egenSub.egenSub#60.SLNK
w 228 395 100 0 n#4 efanouts.efanouts#35.LNK1 160 128 224 128 224 672 512 672 eseqs.eseqs#76.SLNK
w 448 1003 100 0 n#5 hwin.hwin#78.in 432 992 512 992 eseqs.eseqs#76.DOL1
w 1224 1259 100 0 n#6 hwin.hwin#62.in 1232 1248 1264 1248 egenSub.egenSub#60.INPB
w 1224 1323 100 0 n#7 hwin.hwin#53.in 1232 1312 1264 1312 egenSub.egenSub#60.INPA
w 152 107 100 0 n#8 efanouts.efanouts#35.LNK2 160 96 192 96 192 64 junction
w 152 43 100 0 n#8 efanouts.efanouts#35.LNK4 160 32 192 32 192 64 junction
w 312 75 100 0 n#8 efanouts.efanouts#35.LNK3 160 64 512 64 eseqs.eseqs#40.SLNK
w 448 355 100 0 n#9 hwin.hwin#42.in 432 352 512 352 eseqs.eseqs#40.DOL2
w 448 395 100 0 n#10 hwin.hwin#41.in 432 384 512 384 eseqs.eseqs#40.DOL1
w -132 195 100 0 n#11 ecad2.ecad2#32.STLK -224 352 -128 352 -128 48 -80 48 efanouts.efanouts#35.SLNK
w -608 619 100 0 n#12 hwin.hwin#34.in -624 608 -544 608 ecad2.ecad2#32.INPA
w 1640 395 100 0 n#13 ecars.$(top)testC.VAL 1568 384 1760 384 outhier.car.p
w -96 139 100 0 n#14 hwin.hwin#20.in -112 128 -32 128 efanouts.efanouts#35.SELL
s -912 320 100 0 n/a
s -928 352 100 0 test CAD outputs:
s -912 416 100 0 A: current debug level
s -928 448 100 0 test CAD inputs:
[cell use]
use outhier 1728 119 100 0 flnk
xform 0 1744 160
use outhier 1728 279 100 0 mess
xform 0 1744 320
use hwin 240 951 100 0 hwin#78
xform 0 336 992
p 243 984 100 0 -1 val(in):$(BUSY)
use hwin 1040 1207 100 0 hwin#62
xform 0 1136 1248
p 1040 1280 100 0 -1 val(in):$(top)health
use hwin 240 311 100 0 hwin#42
xform 0 336 352
p 243 344 100 0 -1 val(in):$(IDLE)
use hwin 240 343 100 0 hwin#41
xform 0 336 384
p 243 376 100 0 -1 val(in):$(BUSY)
use hwin -816 567 100 0 hwin#34
xform 0 -720 608
p -816 560 100 0 -1 val(in):$(top)debugL
use hwin -304 87 100 0 hwin#20
xform 0 -208 128
p -208 80 100 256 -1 val(in):$(top)simMask
use hwin 1040 1271 100 0 hwin#53
xform 0 1136 1312
p 1040 1344 100 0 -1 val(in):$(top)debugL
use eseqs 544 1088 -100 0 eseqs#76
xform 0 672 832
p 672 592 100 256 1 DLY1:0.0
p 672 560 100 256 1 DLY2:1.0
p 672 1056 100 1024 -1 name:$(top)testSimNone
p 848 992 75 1024 -1 pproc(LNK1):PP
p 848 960 75 1024 -1 pproc(LNK2):PP
use eseqs 544 480 -100 0 eseqs#40
xform 0 672 224
p 672 -16 100 256 1 DLY1:0.0
p 672 -48 100 256 1 DLY2:$(W1)
p 672 448 100 1024 -1 name:$(top)testSimNotNone
p 848 384 75 1024 -1 pproc(LNK1):PP
p 848 352 75 1024 -1 pproc(LNK2):PP
use egenSub 1264 551 100 0 egenSub#60
xform 0 1408 976
p 1344 1312 60 0 1 FTA:LONG
p 1344 1248 60 0 1 FTB:LONG
p 1472 1344 60 512 1 FTVA:STRING
p 1472 1280 60 512 1 FTVB:LONG
p 1408 704 100 256 1 SNAM:testSub
p 1408 1376 100 1024 -1 name:$(top)testSub
p 1552 1322 75 0 -1 pproc(OUTA):PP
p 1552 1258 75 0 -1 pproc(OUTB):PP
use efanouts -80 -89 100 0 efanouts#35
xform 0 40 64
p 48 160 100 512 1 SELM:Specified
p 80 192 100 1024 -1 name:$(top)testSimMask
use ecad2 -544 263 100 0 ecad2#32
xform 0 -384 576
p -368 512 100 256 1 SNAM:testCAD
p -384 880 100 1024 -1 name:$(top)test
use outhier 1728 343 100 0 car
xform 0 1744 384
use eborderC -1136 -857 100 0 eborderC#28
xform 0 544 448
p 1540 -700 100 1024 -1 author:Bob Wooff
p 1540 -736 100 1024 -1 date:April 8, 1998
p 1940 -736 80 768 -1 file:test.sch
p 1896 -584 150 256 -1 project:Enclosure Control System
p 1712 -704 100 0 0 revision:$Revision: 1.1.1.1 $
p 1896 -648 200 256 -1 title:Test Command
use ecars 1360 448 -100 0 $(top)testC
xform 0 1408 272
p 1408 448 100 1024 -1 name:$(top)testC
[comments]
