[schematic2]
uniq 16
[tools]
[detail]
w -14 443 100 0 n#1 ebis.ebis#404.FLNK 0 432 32 432 junction
w -14 699 100 0 n#1 ebis.ebis#403.FLNK 0 688 32 688 junction
w 36 555 100 0 n#1 ebis.ebis#402.FLNK 0 944 32 944 32 176 junction
w 130 187 100 0 n#1 ebis.ebis#405.FLNK 0 176 320 176 egenSub.egenSub#381.SLNK
w 114 -213 100 0 n#1 ebis.ebis#491.FLNK 0 -224 288 -224 288 176 junction
w 98 -245 100 0 n#2 egenSub.egenSub#381.INPI 320 336 256 336 256 -256 0 -256 ebis.ebis#491.VAL
w -252 -213 100 2 n#3 hwin.hwin#492.in -256 -208 -256 -208 ebis.ebis#491.INP
w 228 259 100 0 n#4 hwin.hwin#489.in 192 0 224 0 224 528 320 528 egenSub.egenSub#381.INPF
w 740 595 100 0 n#5 egenSub.egenSub#381.OUTB 608 784 736 784 736 416 928 416 ebos.ebos#385.SLNK
w 674 859 100 0 n#6 egenSub.egenSub#381.OUTA 608 848 800 848 800 736 928 736 ebos.ebos#384.SLNK
w 164 363 100 0 n#7 ebis.ebis#405.VAL 0 144 160 144 160 592 320 592 egenSub.egenSub#381.INPE
w 132 523 100 0 n#8 ebis.ebis#404.VAL 0 400 128 400 128 656 320 656 egenSub.egenSub#381.INPD
w 178 731 100 0 n#9 ebis.ebis#403.VAL 0 656 96 656 96 720 320 720 egenSub.egenSub#381.INPC
w 82 923 100 0 n#10 ebis.ebis#402.VAL 0 912 224 912 224 784 320 784 egenSub.egenSub#381.INPB
w -318 203 100 0 n#11 hwin.hwin#476.in -320 192 -256 192 ebis.ebis#405.INP
w -318 459 100 0 n#12 hwin.hwin#475.in -320 448 -256 448 ebis.ebis#404.INP
w -318 715 100 0 n#13 hwin.hwin#472.in -320 704 -256 704 ebis.ebis#403.INP
w -318 971 100 0 n#14 hwin.hwin#467.in -320 960 -256 960 ebis.ebis#402.INP
w 388 1035 100 0 n#15 hwin.hwin#420.in 352 1104 384 1104 384 976 288 976 288 848 320 848 egenSub.egenSub#381.INPA
[cell use]
use hwin -512 151 100 0 hwin#476
xform 0 -416 192
p -512 192 100 1536 -1 val(in):#C0 S27
use hwin -512 407 100 0 hwin#475
xform 0 -416 448
p -512 448 100 1536 -1 val(in):#C0 S26
use hwin -512 663 100 0 hwin#472
xform 0 -416 704
p -512 704 100 1536 -1 val(in):#C0 S25
use hwin -512 919 100 0 hwin#467
xform 0 -416 960
p -512 960 100 1536 -1 val(in):#C0 S24
use hwin 160 1063 100 0 hwin#420
xform 0 256 1104
p 160 1056 100 0 -1 val(in):$(top)debugL
use hwin 0 -41 100 0 hwin#489
xform 0 96 0
p 0 -48 100 0 -1 val(in):$(top)simulateL
use hwin -448 -249 100 0 hwin#492
xform 0 -352 -208
p -656 -176 100 0 -1 val(in):@$(abC) $(motionInterlock)
use ebis -256 87 100 0 ebis#405
xform 0 -128 160
p -208 64 100 0 1 DTYP:XYCOM-240
p -208 32 100 0 1 SCAN:.5 second
p -352 192 100 512 0 def(INP):
p -128 224 100 1024 -1 name:$(top)gisThermalNegDmd
use ebis -256 343 100 0 ebis#404
xform 0 -128 416
p -208 320 100 0 1 DTYP:XYCOM-240
p -208 288 100 0 1 SCAN:.5 second
p -352 448 100 512 0 def(INP):
p -128 480 100 1024 -1 name:$(top)gisThermalPosDmd
use ebis -256 599 100 0 ebis#403
xform 0 -128 672
p -208 576 100 0 1 DTYP:XYCOM-240
p -208 544 100 0 1 SCAN:.5 second
p -352 704 100 512 0 def(INP):
p -128 736 100 1024 -1 name:$(top)gisMotionNegDmd
use ebis -256 855 100 0 ebis#402
xform 0 -128 928
p -208 832 100 0 1 DTYP:XYCOM-240
p -208 800 100 0 1 SCAN:.5 second
p -352 960 100 512 0 def(INP):
p -128 992 100 1024 -1 name:$(top)gisMotionPosDmd
use ebis -256 -313 100 0 ebis#491
xform 0 -128 -240
p -272 -320 100 0 1 DTYP:AB DF1 serial
p -480 -402 100 0 0 ONAM:disabled
p -272 -352 100 0 1 SCAN:.5 second
p -480 -370 100 0 0 ZNAM:enabled
p -160 -176 100 1024 -1 name:$(top)prMotionInterlock
use ebos 928 327 100 0 ebos#385
xform 0 1056 416
p 928 272 100 0 1 ONAM:INTERLOCKED
p 1152 272 100 0 1 OSV:MAJOR
p 928 304 100 0 1 ZNAM:CLEAR
p 1152 304 100 0 1 ZSV:NO_ALARM
p 1056 496 100 1024 -1 name:$(top)gisThermalState
use ebos 928 647 100 0 ebos#384
xform 0 1056 736
p 928 592 100 0 1 ONAM:INTERLOCKED
p 1152 592 100 0 1 OSV:MAJOR
p 928 624 100 0 1 ZNAM:CLEAR
p 1152 624 100 0 1 ZSV:NO_ALARM
p 1056 816 100 1024 -1 name:$(top)gisMotionState
use egenSub 320 87 100 0 egenSub#381
xform 0 464 512
p 400 848 100 0 -1 FTA:LONG
p 400 784 100 0 -1 FTB:LONG
p 400 720 100 0 -1 FTC:LONG
p 400 656 100 0 -1 FTD:LONG
p 400 592 100 0 -1 FTE:LONG
p 400 528 100 0 -1 FTF:LONG
p 400 464 100 0 0 FTG:LONG
p 400 368 100 0 -1 FTI:LONG
p 528 848 100 512 -1 FTVA:LONG
p 528 784 100 512 -1 FTVB:LONG
p 528 720 100 512 -1 FTVC:LONG
p 384 48 100 0 1 SCAN:Passive
p 464 80 100 256 1 SNAM:ecsInterlocks
p 464 928 100 1024 -1 name:$(top)interlock
p 608 858 75 0 -1 pproc(OUTA):PP
p 608 794 75 0 -1 pproc(OUTB):PP
p 608 730 75 0 -1 pproc(OUTC):NPP
use eborderC -1152 -857 100 0 eborderC#258
xform 0 528 448
p 1532 -700 100 1024 -1 author:Bob Wooff
p 1524 -736 100 1024 -1 date:March 13, 1998
p 1928 -736 80 768 -1 file:ecGis.sch
p 1876 -584 150 256 -1 project:Enclosure Control System
p 1696 -704 100 0 0 revision:$Revision: 1.3 $
p 1892 -648 200 256 -1 title:GIS Interface
[comments]
