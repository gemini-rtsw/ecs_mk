[schematic2]
uniq 5
[tools]
[detail]
w 1282 -197 100 0 n#1 eseqs.eseqs#201.LNK1 1168 -208 1456 -208 ebos.ebos#210.SLNK
w 1194 -229 100 0 n#1 eseqs.eseqs#201.LNK2 1168 -240 1280 -240 1280 -208 junction
w 1716 -245 100 2 n#2 hwout.hwout#211.outp 1712 -240 1712 -240 ebos.ebos#210.OUT
w 776 -237 100 0 n#3 hwin.hwin#202.in 752 -240 848 -240 eseqs.eseqs#201.DOL2
w 776 -205 100 0 n#4 hwin.hwin#203.in 752 -208 848 -208 eseqs.eseqs#201.DOL1
[cell use]
use bb200tr 128 -1208 -100 0 frame
xform 0 1408 -384
use hwout 1712 -281 100 0 hwout#211
xform 0 1808 -240
p 1792 -304 100 0 -1 val(outp):@$(abC) $(address)
use ebos 1456 -297 100 0 ebos#210
xform 0 1584 -208
p 1360 -130 100 0 0 DISS:NO_ALARM
p 1472 -320 100 0 1 DTYP:AB DF1 serial
p 1136 -258 100 0 0 OMSL:closed_loop
p 1600 -128 100 1024 -1 name:$(top)$(cmd)Out
use hwin 560 -249 100 0 hwin#203
xform 0 656 -208
p 563 -216 100 0 -1 val(in):1
use hwin 560 -281 100 0 hwin#202
xform 0 656 -240
p 563 -248 100 0 -1 val(in):0
use eseqs 880 -112 -100 0 eseqs#201
xform 0 1008 -368
p 768 -608 100 0 1 DISV:3
p 1008 -560 100 256 0 DLY1:0.0
p 1024 -608 100 256 1 DLY2:2.0
p 1008 -624 100 256 0 DLY3:0.0
p 960 -656 100 0 0 DLY4:0.0
p 960 -688 100 0 0 DLY5:0.0
p 464 -1268 100 0 0 def(DOL1):0.0
p 512 -240 100 0 0 def(DOL2):0.0
p 512 -304 100 0 0 def(DOL4):0.0
p 464 -660 100 0 0 def(LNK1):0.0
p 1264 -240 100 0 0 def(LNK2):0.0
p 1264 -272 100 0 0 def(LNK3):0.0
p 1264 -304 100 0 0 def(LNK4):0.0
p 1232 -336 100 0 0 def(LNK5):0.0
p 1024 -128 100 1024 -1 name:$(top)$(cmd)
p 1184 -208 75 1024 -1 pproc(LNK1):PP
p 1184 -240 75 1024 -1 pproc(LNK2):PP
p 1184 -272 75 1024 -1 pproc(LNK3):NPP
p 1184 -304 75 1024 -1 pproc(LNK4):NPP
p 1184 -336 75 1024 -1 pproc(LNK5):NPP
[comments]
