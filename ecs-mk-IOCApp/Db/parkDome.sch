[schematic2]
uniq 13
[tools]
[detail]
w -158 -373 100 0 n#1 hwin.hwin#522.in -384 -384 128 -384 128 320 256 320 ecad20.ecad20#467.INPJ
w 900 -21 100 0 n#2 ecad20.ecad20#467.STLK 576 -512 896 -512 896 480 1024 480 outhier.domeFlnk.p
w 658 843 100 0 n#3 ecad20.ecad20#467.OUTB 576 832 800 832 800 640 1024 640 outhier.domePos.p
w 722 907 100 0 n#4 ecad20.ecad20#467.OUTA 576 896 928 896 928 800 1024 800 outhier.domePark.p
w 68 91 100 0 n#5 eaos.eaos#479.OUT -192 -224 64 -224 64 416 256 416 ecad20.ecad20#467.I
w 36 203 100 0 n#6 eaos.eaos#478.OUT -384 -64 32 -64 32 480 256 480 ecad20.ecad20#467.H
w 4 315 100 0 n#7 eaos.eaos#477.OUT -192 96 0 96 0 544 256 544 ecad20.ecad20#467.G
w -254 267 100 0 n#8 eaos.eaos#468.OUT -416 256 -32 256 -32 608 256 608 ecad20.ecad20#467.F
w 50 683 100 0 n#9 eaos.eaos#476.OUT -192 416 -96 416 -96 672 256 672 ecad20.ecad20#467.E
w 2 747 100 0 n#10 eaos.eaos#475.OUT -416 576 -192 576 -192 736 256 736 ecad20.ecad20#467.D
w 82 811 100 0 n#11 embbos.embbos#229.OUT -192 832 -32 832 -32 800 256 800 ecad20.ecad20#467.C
w -206 1067 100 0 n#12 hwin.hwin#343.in -416 1056 64 1056 64 896 256 896 ecad20.ecad20#467.INPA
s 1024 -224 100 0 J: dome azimuth offset
s 1024 -96 100 0 F: dome park default position
s 1024 -64 100 0 E: dome park minimum limit
s 1024 0 100 0 C: dome park mode
s 1024 32 100 0 B: dome azimuth park position demand
s 1024 96 100 0 dome CAD inputs:
s 1024 64 100 0 A: current debug level
s 1536 96 100 0 dome CAD outputs:
s 1536 64 100 0 A: validated dome demand state
s 1536 32 100 0 B: validated park azimuth position
s 1024 -32 100 0 D: dome park maximum limit
s 1024 -128 100 0 G: dome park Access 1 position
s 1024 -160 100 0 H: dome park access 2 position
s 1024 -192 100 0 I: dome park Access 3 position
[cell use]
use hwin -576 -425 100 0 hwin#522
xform 0 -480 -384
p -816 -400 100 0 -1 val(in):$(top)domeAzOffset
use hwin -608 1015 100 0 hwin#343
xform 0 -512 1056
p -608 1040 100 512 -1 val(in):$(top)debugL
use outhier 992 439 100 0 domeFlnk
xform 0 1008 480
use outhier 992 599 100 0 domePos
xform 0 1008 640
use outhier 992 759 100 0 domePark
xform 0 1008 800
use eaos -672 199 100 0 eaos#468
xform 0 -544 288
p -544 256 100 256 1 PREC:4
p -528 352 100 1024 -1 name:$(top)domeParkDefPos
use eaos -672 519 100 0 eaos#475
xform 0 -544 608
p -544 560 100 256 1 PREC:4
p -528 672 100 1024 -1 name:$(top)domeParkMax
use eaos -448 359 100 0 eaos#476
xform 0 -320 448
p -320 416 100 256 1 PREC:4
p -304 512 100 1024 -1 name:$(top)domeParkMin
use eaos -448 39 100 0 eaos#477
xform 0 -320 128
p -320 96 100 256 1 PREC:4
p -304 192 100 1024 -1 name:$(top)domeParkA1
use eaos -640 -121 100 0 eaos#478
xform 0 -512 -32
p -512 -64 100 256 1 PREC:4
p -496 32 100 1024 -1 name:$(top)domeParkA2
use eaos -448 -281 100 0 eaos#479
xform 0 -320 -192
p -320 -224 100 256 1 PREC:4
p -304 -128 100 1024 -1 name:$(top)domeParkA3
use ecad20 256 -601 100 0 ecad20#467
xform 0 416 288
p 496 880 100 512 1 FTVA:LONG
p 496 848 100 512 1 FTVB:DOUBLE
p 496 816 100 512 0 FTVC:STRING
p 416 -416 100 256 1 PREC:2
p 416 -368 80 256 1 SNAM:parkDomeCad
p 432 1168 100 1024 -1 name:$(top)parkDome
use embbos -448 743 100 0 embbos#229
xform 0 -320 832
p -752 768 100 0 1 FRST:ACCESS3
p -576 768 100 0 1 FRVL:4
p -672 928 100 0 1 OMSL:supervisory
p -752 864 100 0 1 ONST:POSITION
p -576 864 100 0 1 ONVL:1
p -752 800 100 0 1 THST:ACCESS2
p -576 800 100 0 1 THVL:3
p -752 832 100 0 1 TWST:ACCESS1
p -576 832 100 0 1 TWVL:2
p -752 896 100 0 1 ZRST:DEFAULT
p -576 896 100 0 1 ZRVL:0
p -320 912 100 1024 -1 name:$(top)domeParkMode
use eborderC -1152 -857 100 0 eborderC#258
xform 0 528 448
p 1532 -700 100 1024 -1 author:Bob Wooff
p 1524 -736 100 1024 -1 date:March 24, 1998
p 1924 -736 80 768 -1 file:parkDome.sch
p 1876 -580 150 256 -1 project:Enclosure Control System
p 1696 -704 100 0 0 revision:$Revision: 1.1.1.1 $
p 1880 -648 200 256 -1 title:Park Dome Command
[comments]
