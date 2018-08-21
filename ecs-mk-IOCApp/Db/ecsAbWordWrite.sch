[schematic2]
uniq 21
[tools]
[detail]
w 754 -1045 100 0 n#1 ebos.bit15.FLNK 416 -1056 1152 -1056 1152 -416 1312 -416 embbod.bits.SLNK
w 996 -725 100 0 n#2 ebos.bit15.OUT 416 -1120 992 -1120 992 -320 1312 -320 embbod.bits.BF
w 964 -597 100 0 n#3 ebos.bit14.OUT 416 -896 960 -896 960 -288 1312 -288 embbod.bits.BE
w 642 -669 100 0 n#4 ebos.bit13.OUT 416 -672 928 -672 928 -256 1312 -256 embbod.bits.BD
w 626 -437 100 0 n#5 ebos.bit12.OUT 416 -448 896 -448 896 -224 1312 -224 embbod.bits.BC
w 578 -93 100 0 n#6 ebos.bit8.OUT -384 -448 -96 -448 -96 -96 1312 -96 embbod.bits.B8
w 594 -117 100 0 n#7 ebos.bit9.OUT -384 -672 -64 -672 -64 -128 1312 -128 embbod.bits.B9
w 610 -149 100 0 n#8 ebos.bit10.OUT -384 -896 -32 -896 -32 -160 1312 -160 embbod.bits.BA
w 626 -181 100 0 n#9 ebos.bit11.OUT -384 -1120 0 -1120 0 -192 1312 -192 embbod.bits.BB
w 578 -53 100 0 n#10 ebos.bit7.OUT -384 256 -96 256 -96 -64 1312 -64 embbod.bits.B7
w 594 -21 100 0 n#11 ebos.bit6.OUT -384 480 -64 480 -64 -32 1312 -32 embbod.bits.B6
w 610 11 100 0 n#12 ebos.bit5.OUT -384 704 -32 704 -32 0 1312 0 embbod.bits.B5
w 626 43 100 0 n#13 ebos.bit4.OUT -384 928 0 928 0 32 1312 32 embbod.bits.B4
w 626 267 100 0 n#14 ebos.bit3.OUT 416 256 896 256 896 64 1312 64 embbod.bits.B3
w 642 491 100 0 n#15 ebos.bit2.OUT 416 480 928 480 928 96 1312 96 embbod.bits.B2
w 964 411 100 0 n#16 ebos.bit1.OUT 416 704 960 704 960 128 1312 128 embbod.bits.B1
w 996 539 100 0 n#17 ebos.bit0.OUT 416 928 992 928 992 160 1312 160 embbod.bits.B0
w 1954 -85 100 0 n#18 hwout.hwout#549.outp 1984 -96 1984 -96 eaos.word.OUT
w 1668 -149 100 0 n#19 embbod.bits.FLNK 1632 -224 1664 -224 1664 -64 1728 -64 eaos.word.SLNK
w 1650 -21 100 0 n#20 embbod.bits.VAL 1632 -32 1728 -32 eaos.word.DOL
[cell use]
use eborderC -928 -1401 100 0 eborderC#631
xform 0 752 -96
p 1756 -1244 100 1024 -1 author:W.N. Rambold
p 1752 -1276 100 1024 -1 date:May 8, 1998
p 2152 -1276 80 768 -1 file:ecsAbWordWrite.sch
p 2144 -1248 100 0 0 page:
p 2256 -1248 100 0 0 pages:
p 1872 -1280 100 0 0 primitive:eborderC
p 2096 -1124 150 256 -1 project:Enclosure Control System
p 1920 -1248 100 0 0 revision:$Revision: 1.1.1.1 $
p 1872 -1136 150 768 0 system:
p 2100 -1188 200 256 -1 title:A-B Write by Bit
use ebos -640 -953 100 0 bit10
xform 0 -512 -864
p -960 -1010 100 0 0 ONAM:SET
p -544 -976 100 0 1 PV:$(top)$(dev)$(word):
p -960 -978 100 0 0 ZNAM:CLEAR
p -384 -896 75 768 -1 pproc(OUT):PP
use ebos -640 -729 100 0 bit9
xform 0 -512 -640
p -960 -786 100 0 0 ONAM:SET
p -544 -752 100 0 1 PV:$(top)$(dev)$(word):
p -960 -754 100 0 0 ZNAM:CLEAR
p -384 -672 75 768 -1 pproc(OUT):PP
use ebos -640 -505 100 0 bit8
xform 0 -512 -416
p -960 -562 100 0 0 ONAM:SET
p -560 -528 100 0 1 PV:$(top)$(dev)$(word):
p -960 -530 100 0 0 ZNAM:CLEAR
p -384 -448 75 768 -1 pproc(OUT):PP
use ebos -640 199 100 0 bit7
xform 0 -512 288
p -960 142 100 0 0 ONAM:SET
p -544 176 100 0 1 PV:$(top)$(dev)$(word):
p -960 174 100 0 0 ZNAM:CLEAR
p -384 256 75 768 -1 pproc(OUT):PP
use ebos -640 423 100 0 bit6
xform 0 -512 512
p -960 366 100 0 0 ONAM:SET
p -544 400 100 0 1 PV:$(top)$(dev)$(word):
p -960 398 100 0 0 ZNAM:CLEAR
p -384 480 75 768 -1 pproc(OUT):PP
use ebos -640 647 100 0 bit5
xform 0 -512 736
p -960 590 100 0 0 ONAM:SET
p -544 624 100 0 1 PV:$(top)$(dev)$(word):
p -960 622 100 0 0 ZNAM:CLEAR
p -384 704 75 768 -1 pproc(OUT):PP
use ebos -640 871 100 0 bit4
xform 0 -512 960
p -960 814 100 0 0 ONAM:SET
p -544 848 100 0 1 PV:$(top)$(dev)$(word):
p -960 846 100 0 0 ZNAM:CLEAR
p -384 928 75 768 -1 pproc(OUT):PP
use ebos -640 -1177 100 0 bit11
xform 0 -512 -1088
p -960 -1234 100 0 0 ONAM:SET
p -560 -1200 100 0 1 PV:$(top)$(dev)$(word):
p -960 -1202 100 0 0 ZNAM:CLEAR
p -384 -1120 75 768 -1 pproc(OUT):PP
use ebos 160 -953 100 0 bit14
xform 0 288 -864
p -160 -1010 100 0 0 ONAM:SET
p 256 -992 100 0 1 PV:$(top)$(dev)$(word):
p -160 -978 100 0 0 ZNAM:CLEAR
p 416 -896 75 768 -1 pproc(OUT):PP
use ebos 160 -729 100 0 bit13
xform 0 288 -640
p -160 -786 100 0 0 ONAM:SET
p 256 -768 100 0 1 PV:$(top)$(dev)$(word):
p -160 -754 100 0 0 ZNAM:CLEAR
p 416 -672 75 768 -1 pproc(OUT):PP
use ebos 160 -505 100 0 bit12
xform 0 288 -416
p -160 -562 100 0 0 ONAM:SET
p 256 -544 100 0 1 PV:$(top)$(dev)$(word):
p -160 -530 100 0 0 ZNAM:CLEAR
p 416 -448 75 768 -1 pproc(OUT):PP
use ebos 160 199 100 0 bit3
xform 0 288 288
p -160 142 100 0 0 ONAM:SET
p 256 160 100 0 1 PV:$(top)$(dev)$(word):
p -160 174 100 0 0 ZNAM:CLEAR
p 416 256 75 768 -1 pproc(OUT):PP
use ebos 160 423 100 0 bit2
xform 0 288 512
p -160 366 100 0 0 ONAM:SET
p 256 384 100 0 1 PV:$(top)$(dev)$(word):
p -160 398 100 0 0 ZNAM:CLEAR
p 416 480 75 768 -1 pproc(OUT):PP
use ebos 160 647 100 0 bit1
xform 0 288 736
p -160 590 100 0 0 ONAM:SET
p 256 608 100 0 1 PV:$(top)$(dev)$(word):
p -160 622 100 0 0 ZNAM:CLEAR
p 416 704 75 768 -1 pproc(OUT):PP
use ebos 160 871 100 0 bit0
xform 0 288 960
p -160 814 100 0 0 ONAM:SET
p 256 832 100 0 1 PV:$(top)$(dev)$(word):
p -160 846 100 0 0 ZNAM:CLEAR
p 416 928 75 768 -1 pproc(OUT):PP
use ebos 160 -1177 100 0 bit15
xform 0 288 -1088
p -160 -1234 100 0 0 ONAM:SET
p 272 -1216 100 0 1 PV:$(top)$(dev)$(word):
p -160 -1202 100 0 0 ZNAM:CLEAR
p 416 -1120 75 768 -1 pproc(OUT):PP
use embbod 1312 -505 100 0 bits
xform 0 1472 -128
p 1440 -560 100 0 1 PV:$(top)$(dev)$(word):
p 1440 142 100 0 0 SCAN:Passive
use hwout 1984 -137 100 0 hwout#549
xform 0 2080 -96
p 2080 -160 100 768 -1 val(outp):@$(ab) $(word)
use eaos 1728 -153 100 0 word
xform 0 1856 -64
p 1472 -370 100 0 0 DISV:1
p 1792 -192 100 0 1 DTYP:AB DF1 serial
p 1792 -224 100 0 1 OMSL:closed_loop
p 1792 -272 100 0 1 PV:$(top)$(dev)$(word):
[comments]
