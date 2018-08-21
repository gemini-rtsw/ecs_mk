[schematic2]
uniq 849
[tools]
[detail]
w 322 939 100 0 flnk ecalcs.ecalcs#844.FLNK 224 1024 288 1024 288 928 416 928 outhier.flnk.p
w 278 1067 100 0 wordOut ecalcs.ecalcs#844.VAL 224 1056 416 1056 outhier.wordOut.p
w -142 1259 100 0 n#846 eais.eais#842.FLNK -224 896 -160 896 -160 1248 -64 1248 ecalcs.ecalcs#844.SLNK
w -174 875 100 0 n#845 eais.eais#842.VAL -224 864 -64 864 ecalcs.ecalcs#844.INPA
w -542 915 100 0 n#766 hwin.hwin#767.in -544 912 -480 912 eais.eais#842.INP
s 160 608 100 0 Enclosure Control System
s 208 544 100 0 A-B Word Get Scale
s -114 493 100 0 Pedro Gigoux
s -95 458 100 0 29/Jul/02
[cell use]
use ecalcs -64 1337 100 0 ecalcs#844
xform 6 80 1072
p -32 768 100 0 1 CALC:$(calc)
p -32 736 100 0 1 PREC:$(prec)
p 32 800 100 1024 -1 name:$(top)$(dev)
use eais -480 807 100 0 eais#842
xform 0 -352 880
p -432 768 100 0 1 DTYP:AB DF1 serial
p -432 704 100 0 1 LINR:NO CONVERSION
p -432 736 100 0 1 SCAN:.5 second
p -368 800 100 1024 -1 name:$(top)$(dev)Raw
use outhier 384 1015 100 0 wordOut
xform 0 400 1056
use outhier 384 887 100 0 flnk
xform 0 400 928
use ba200tr -960 328 -100 0 frame
xform 0 -160 952
use hwin -736 871 100 0 hwin#767
xform 0 -640 912
p -784 944 100 0 -1 val(in):@$(ab) $(word)
[comments]
