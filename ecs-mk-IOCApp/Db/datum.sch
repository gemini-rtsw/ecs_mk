[schematic2]
uniq 7
[tools]
[detail]
w 1400 363 -100 0 c ecars.$(top)datumC.FLNK 1344 352 1504 352 outhier.flnk.p
w 1400 523 -100 0 c ecars.$(top)datumC.OMSS 1344 512 1504 512 outhier.mess.p
w -456 435 100 0 n#1 hwin.hwin#42.in -528 432 -336 432 ecad2.ecad2#40.INPA
w 840 555 100 0 n#2 eseqs.$(top)datumSeq.LNK2 816 544 912 544 912 576 junction
w 896 579 100 0 n#2 eseqs.$(top)datumSeq.LNK1 816 576 1024 576 ecars.$(top)datumC.IVAL
w 328 523 100 0 n#3 hwin.hwin#23.in 304 512 400 512 400 544 496 544 eseqs.$(top)datumSeq.DOL2
w 1400 587 100 0 n#4 ecars.$(top)datumC.VAL 1344 576 1504 576 outhier.car.p
w 376 579 100 0 n#5 hwin.hwin#22.in 304 576 496 576 eseqs.$(top)datumSeq.DOL1
w 312 259 100 0 n#6 ecad2.ecad2#40.STLK -16 176 176 176 176 256 496 256 eseqs.$(top)datumSeq.SLNK
s -800 176 100 0 none
s -816 320 100 0 datum CAD inputs
s -800 288 100 0 A: current debug level
s -816 208 100 0 datum CAD outputs
[cell use]
use outhier 1504 368 100 0 flnk
xform 0 1488 352
p 1408 224 100 0 0 revision:2.2
use outhier 1504 528 100 0 mess
xform 0 1488 512
p 1408 384 100 0 0 revision:2.2
use hwin 112 535 100 0 hwin#22
xform 0 208 576
p 115 568 100 0 -1 val(in):$(BUSY)
use hwin 112 471 100 0 hwin#23
xform 0 208 512
p 115 504 100 0 -1 val(in):$(IDLE)
use hwin -720 391 100 0 hwin#42
xform 0 -624 432
p -720 384 100 0 -1 val(in):$(top)debugL
use ecad2 -336 87 100 0 ecad2#40
xform 0 -176 400
p -176 336 100 256 1 SNAM:datumCAD
p -176 688 100 1024 -1 name:$(top)datum
use eborderC -1152 -857 100 0 eborderC#39
xform 0 528 448
p 1536 -700 100 1024 -1 author:Bob Wooff
p 1524 -736 100 1024 -1 date:April 8, 1998
p 1924 -736 80 768 -1 file:datum.sch
p 1880 -584 150 256 -1 project:Enclosure Control System
p 1696 -704 100 0 0 revision:$Revision: 1.1.1.1 $
p 1888 -640 200 256 -1 title:Datum Command
use outhier 1504 592 100 0 car
xform 0 1488 576
p 1408 448 100 0 0 revision:2.2
use ecars 1136 640 -100 0 $(top)datumC
xform 0 1184 464
p 992 192 100 0 0 def(FLNK):0.0
p 1184 640 100 1024 -1 name:$(top)datumC
use eseqs 528 672 -100 0 $(top)datumSeq
xform 0 656 416
p 656 224 100 256 1 DLY1:0.0
p 656 192 100 256 1 DLY2:$(W1)
p 656 160 100 256 0 DLY3:$(W2)
p 112 124 100 0 0 def(LNK1):0.0
p 912 544 100 0 0 def(LNK2):0.0
p 656 672 100 1024 -1 name:$(top)datumSeq
p 832 576 75 1024 -1 pproc(LNK1):PP
p 832 544 75 1024 -1 pproc(LNK2):PP
p 832 512 75 1024 -1 pproc(LNK3):PP
[comments]
