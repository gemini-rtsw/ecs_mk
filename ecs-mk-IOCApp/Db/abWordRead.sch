[schematic2]
uniq 840
[tools]
[detail]
w -350 979 100 0 n#766 hwin.hwin#767.in -352 976 -288 976 eais.word.INP
w 124 1179 -100 0 wordOut junction 128 992 128 1376 272 1376 outhier.wordOut.p
w 18 939 -100 0 wordOut eais.word.VAL -32 928 128 928 128 992 256 992 embbid.bits.INP
w 82 971 100 0 n#763 eais.word.FLNK -32 960 256 960 embbid.bits.SLNK
[cell use]
use eborderC -1440 -121 100 0 eborderC#839
xform 0 240 1184
p 1244 36 100 1024 -1 author:W.N. Rambold
p 1240 4 100 1024 -1 date:May 8, 1998
p 1640 4 80 768 -1 file:abWordRead.sch
p 1632 32 100 0 0 page:
p 1744 32 100 0 0 pages:
p 1360 0 100 0 0 primitive:eborderC
p 1584 156 150 256 -1 project:Enclosure Control System
p 1408 32 100 0 0 revision:$Revision: 1.1.1.1 $
p 1360 144 150 768 0 system:
p 1588 92 200 256 -1 title:A-B Read by Word
use outhier 240 1335 100 0 wordOut
xform 0 256 1376
use hwin -544 935 100 0 hwin#767
xform 0 -448 976
p -752 960 100 0 -1 val(in):@$(ab) $(word)
use eais -288 871 100 0 word
xform 0 -160 944
p -224 832 100 0 1 DTYP:AB DF1 serial
p -544 814 100 0 0 LINR:NO CONVERSION
p -224 768 100 0 1 PV:$(top)$(dev)word$(word):
p -216 800 100 0 1 SCAN:.5 second
use embbid 320 672 100 0 bits
xform 0 416 944
p 276 588 100 0 1 PV:$(top)$(dev)word$(word):
p 256 1294 100 0 0 SCAN:Passive
p 256 796 100 0 0 typ(INP):path
[comments]
