[schematic2]
uniq 2
[tools]
[detail]
w 130 1163 100 0 flnk eais.eais#842.FLNK 0 1056 64 1056 64 1152 256 1152 outhier.flnk.p
w 98 1035 100 0 wordOut eais.eais#842.VAL 0 1024 256 1024 outhier.wordOut.p
w -318 1075 100 0 n#1 hwin.hwin#767.in -320 1072 -256 1072 eais.eais#842.INP
s -95 458 100 0 29/Jul/02
s -114 493 100 0 Pedro Gigoux
s 208 544 100 0 A-B Word Get
s 160 608 100 0 Enclosure Control System
[cell use]
use ba200tr -960 328 -100 0 frame
xform 0 -160 952
use eais -256 967 100 0 eais#842
xform 0 -128 1040
p -208 928 100 0 1 DTYP:AB DF1 serial
p -208 864 100 0 1 LINR:NO CONVERSION
p -208 896 100 0 1 SCAN:.5 second
p -144 960 100 1024 -1 name:$(top)$(dev)
use outhier 224 1111 100 0 flnk
xform 0 240 1152
use outhier 224 983 100 0 wordOut
xform 0 240 1024
use hwin -512 1031 100 0 hwin#767
xform 0 -416 1072
p -720 1056 100 0 -1 val(in):@$(ab) $(word)
[comments]
