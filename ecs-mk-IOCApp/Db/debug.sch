[schematic2]
uniq 22
[tools]
[detail]
w -768 482 100 0 n#1 embbos.mbbo.FLNK -624 736 -528 736 -528 480 -960 480 -960 384 -880 384 estringouts.debugStr.SLNK
w -768 466 100 0 n#2 embbos.mbbo.VAL -624 672 -544 672 -544 464 -944 464 -944 416 -880 416 estringouts.debugStr.DOL
w -536 370 100 0 n#3 estringouts.debugStr.OUT -624 368 -400 368 ecad2.ecad2#64.A
w 1728 139 -100 0 c ecars.$(top)debugC.FLNK 1696 128 1808 128 outhier.flnk.p
w 1728 299 -100 0 c ecars.$(top)debugC.OMSS 1696 288 1808 288 outhier.mess.p
w 804 1043 100 0 n#4 esirs.esirs#67.VAL 704 816 800 816 800 1280 928 1280 ecalcs.ecalcs#71.INPB
w 772 883 100 0 n#5 esirs.esirs#67.FLNK 704 848 768 848 768 928 junction
w 772 1147 100 0 n#5 embbos.embbos#69.FLNK 704 1376 768 1376 768 928 928 928 ecalcs.ecalcs#71.SLNK
w 472 523 100 0 n#6 eseqs.$(top)debugSeq.LNK2 752 320 832 320 832 512 160 512 160 688 288 688 esirs.esirs#67.SLNK
w 1288 1195 100 0 n#7 ecalcs.ecalcs#71.FLNK 1216 1152 1248 1152 1248 1184 1376 1184 esirs.esirs#68.SLNK
w 1284 1227 100 0 n#8 ecalcs.ecalcs#71.VAL 1216 1120 1280 1120 1280 1344 1376 1344 esirs.esirs#68.INP
w 792 1315 100 0 n#9 embbos.embbos#69.VAL 704 1312 928 1312 ecalcs.ecalcs#71.INPA
w -56 -213 100 0 n#10 hwin.hwin#63.in -144 -224 80 -224 efanouts.efanouts#47.SELL
w 1164 43 100 0 n#11 eseqs.eseqs#50.LNK2 1040 -256 1168 -256 1168 352 junction
w 1080 -221 100 0 n#11 eseqs.eseqs#50.LNK1 1040 -224 1168 -224 junction
w 792 291 100 0 n#11 eseqs.$(top)debugSeq.LNK3 752 288 880 288 880 352 junction
w 1040 355 100 0 n#11 eseqs.$(top)debugSeq.LNK1 752 352 1376 352 ecars.$(top)debugC.IVAL
w 656 -245 100 0 n#12 hwin.hwin#58.in 640 -256 720 -256 eseqs.eseqs#50.DOL2
w 656 -213 100 0 n#13 hwin.hwin#57.in 640 -224 720 -224 eseqs.eseqs#50.DOL1
w 312 -309 100 0 n#14 efanouts.efanouts#47.LNK4 272 -320 400 -320 junction
w 312 -277 100 0 n#14 efanouts.efanouts#47.LNK3 272 -288 400 -288 junction
w 536 -541 100 0 n#14 efanouts.efanouts#47.LNK2 272 -256 400 -256 400 -544 720 -544 eseqs.eseqs#50.SLNK
w 340 -101 100 0 n#15 efanouts.efanouts#47.LNK1 272 -224 336 -224 336 32 432 32 eseqs.$(top)debugSeq.SLNK
w -20 -117 100 0 n#16 ecad2.ecad2#64.STLK -80 80 -16 80 -16 -304 32 -304 efanouts.efanouts#47.SLNK
w -536 283 100 0 n#17 hwin.hwin#44.in -624 272 -400 272 ecad2.ecad2#64.INPB
w 1728 363 100 0 n#18 ecars.$(top)debugC.VAL 1696 352 1808 352 outhier.car.p
w 368 299 100 0 n#19 hwin.hwin#23.in 352 288 432 288 eseqs.$(top)debugSeq.DOL3
w 368 363 100 0 n#20 hwin.hwin#22.in 352 352 432 352 eseqs.$(top)debugSeq.DOL1
w 254 323 100 0 n#21 ecad2.ecad2#64.VALA -80 368 112 368 112 320 432 320 eseqs.$(top)debugSeq.DOL2
s 1440 1616 100 0 $Id: debug.sch,v 1.1.1.1 2001/06/20 16:32:20 pedro Exp $
s -880 0 100 0 B: current debug level
s -896 64 100 0 debug CAD inputs
s -880 32 100 0 A: requested debug level
s -896 -48 100 0 debug CAD outputs
s -880 -80 100 0 A: validated debug level
[cell use]
use estringouts -856 312 100 0 debugStr
xform 0 -752 384
p -944 190 100 0 0 OMSL:closed_loop
p -944 350 100 0 0 VAL:None
p -853 424 100 0 0 DESC:Debug level as string
use outhier 1776 311 100 0 car
xform 0 1792 352
use outhier 1776 247 100 0 mess
xform 0 1792 288
use outhier 1776 87 100 0 flnk
xform 0 1792 128
use ecalcs 928 839 100 0 ecalcs#71
xform 0 1072 1104
p 1232 880 100 512 1 CALC:(A=3)?B:A
p 1072 1344 100 1024 -1 name:$(top)debugMotorCalc
use embbos -848 800 -100 0 mbbo
xform 0 -752 704
p -880 560 100 0 1 ONST:MIN
p -720 560 100 0 1 ONVL:1
p -912 414 100 0 0 TVVL:2
p -880 528 100 0 1 TWST:FULL
p -720 528 100 0 1 TWVL:2
p -880 592 100 0 1 ZRST:NONE
p -720 592 100 0 1 ZRVL:0
p -1071 288 100 0 0 def(OUT):0.0
p -752 816 100 3328 -1 name:$(top)debugMode
use embbos 480 1440 -100 0 embbos#69
xform 0 576 1344
p 448 1200 100 0 1 ONST:MIN
p 608 1200 100 0 1 ONVL:1
p 448 1136 100 0 1 THST:SYSTEM
p 608 1136 100 0 1 THVL:3
p 416 1054 100 0 0 TVVL:2
p 448 1168 100 0 1 TWST:FULL
p 608 1168 100 0 1 TWVL:2
p 448 1232 100 0 1 ZRST:NONE
p 608 1232 100 0 1 ZRVL:0
p 257 928 100 0 0 def(OUT):0.0
p 576 1456 100 3328 -1 name:$(top)debugMotorMode
p 704 1344 75 768 -1 pproc(OUT):PP
use esirs 288 599 100 0 esirs#67
xform 0 496 752
p 496 672 100 1792 1 FTVL:LONG
p 496 640 100 1792 1 SNAM:debugSUB
p 496 880 100 1024 -1 name:$(top)debugL
use esirs 1376 1095 100 0 esirs#68
xform 0 1584 1248
p 1584 1168 100 1792 1 FTVL:LONG
p 1584 1136 100 1792 1 SNAM:debugSUB
p 1584 1376 100 1024 -1 name:$(top)debugM
use ecad2 -400 -9 100 0 ecad2#64
xform 0 -240 304
p -320 48 100 0 1 DISV:1
p -176 368 100 1792 -1 FTVA:LONG
p -224 240 100 256 1 SNAM:debugCAD
p -352 16 100 512 0 def(SDIS):0.0
p -224 608 100 1024 -1 name:$(top)debug
use hwin -336 -265 100 0 hwin#63
xform 0 -240 -224
p -336 -272 100 0 -1 val(in):$(top)simMask
use hwin 448 -297 100 0 hwin#58
xform 0 544 -256
p 451 -264 100 0 -1 val(in):$(IDLE)
use hwin 448 -265 100 0 hwin#57
xform 0 544 -224
p 451 -232 100 0 -1 val(in):$(BUSY)
use hwin 160 311 100 0 hwin#22
xform 0 256 352
p 163 344 100 0 -1 val(in):$(BUSY)
use hwin 160 247 100 0 hwin#23
xform 0 256 288
p 163 280 100 0 -1 val(in):$(IDLE)
use hwin -816 231 100 0 hwin#44
xform 0 -720 272
p -816 224 100 0 -1 val(in):$(top)debugL
use eseqs 752 -128 -100 0 eseqs#50
xform 0 880 -384
p 816 -640 100 0 1 DLY1:0.0
p 816 -672 100 0 1 DLY2:$(W1)
p 880 -160 100 1024 -1 name:$(top)debugSimNotNone
p 688 -224 75 1280 -1 pproc(DOL1):NPP
p 688 -256 75 1280 -1 pproc(DOL2):NPP
p 1056 -224 75 1024 -1 pproc(LNK1):PP
p 1056 -256 75 1024 -1 pproc(LNK2):PP
use eseqs 464 448 -100 0 $(top)debugSeq
xform 0 592 192
p 480 -32 100 512 0 DISV:1
p 592 0 100 256 1 DLY1:0.0
p 592 -32 100 256 1 DLY2:$(W1)
p 592 -64 100 256 1 DLY3:$(W2)
p 48 -100 100 0 0 def(LNK1):0.0
p 848 320 100 0 0 def(LNK2):0.0
p 592 416 100 1024 -1 name:$(top)debugSimNone
p 768 352 75 1024 -1 pproc(LNK1):PP
p 768 320 75 1024 -1 pproc(LNK2):PP
p 768 288 75 1024 -1 pproc(LNK3):PP
use efanouts 32 -441 100 0 efanouts#47
xform 0 152 -288
p 0 -192 100 0 1 SELM:Specified
p 192 -160 100 1024 -1 name:$(top)debugSimMask
use eborderC -1136 -857 100 0 eborderC#26
xform 0 544 448
p 1544 -700 100 1024 -1 author:Bob Wooff
p 1540 -736 100 1024 -1 date:April 8, 1998
p 1940 -736 80 768 -1 file:debug.sch
p 1888 -588 150 256 -1 project:Enclosure Control System
p 1712 -704 100 0 0 revision:$Revision: 1.1.1.1 $
p 1896 -648 200 256 -1 title:Debug Command
use ecars 1488 416 -100 0 $(top)debugC
xform 0 1536 240
p 1344 -32 100 0 0 def(FLNK):0.0
p 1536 416 100 1024 -1 name:$(top)debugC
[comments]
