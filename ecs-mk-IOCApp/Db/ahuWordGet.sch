[schematic2]
uniq 2
[tools]
[detail]
w 226 971 100 0 flnk eais.word.FLNK 192 960 320 960 320 1024 400 1024 outhier.flnk.p
w 254 939 100 0 wordOut eais.word.VAL 192 928 400 928 outhier.wordOut.p
w -126 979 100 0 n#1 hwin.hwin#767.in -128 976 -64 976 eais.word.INP
[cell use]
use bb200tr -1008 104 -100 0 frame
xform 0 272 928
use outhier 368 1056 100 0 flnk
xform 0 384 1024
use outhier 368 887 100 0 wordOut
xform 0 384 928
use hwin -320 935 100 0 hwin#767
xform 0 -224 976
p -528 960 100 0 -1 val(in):@$(ab) $(word)
use eais -64 871 100 0 word
xform 0 64 944
p 0 832 100 0 1 DTYP:AB DF1 serial
p -320 814 100 0 0 LINR:NO CONVERSION
p -320 846 100 0 0 PINI:YES
p 0 768 100 0 1 PV:$(top)$(dev)word$(word):
p 8 800 100 0 1 SCAN:.5 second
[comments]
