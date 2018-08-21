[schematic2]
uniq 1
[tools]
[detail]
[cell use]
use eborderC -256 -905 100 0 eborderC#92
xform 0 1424 400
p 2428 -748 100 1024 -1 author:W.N. Rambold
p 2424 -780 100 1024 -1 date:May 8, 1998
p 2824 -780 80 768 -1 file:ecsPdev.sch
p 2816 -752 100 0 0 page:
p 2928 -752 100 0 0 pages:
p 2544 -784 100 0 0 primitive:eborderC
p 2768 -628 150 256 -1 project:Enclosure Control System
p 2592 -752 100 0 0 revision:$Revision: 1.1.1.1 $
p 2544 -640 150 768 0 system:
p 2772 -692 200 256 -1 title:Position Device
use inhier -16 960 100 0 Simulation
xform 0 144 960
use inhier 32 832 100 0 Slink
xform 0 144 832
use inhier 32 896 100 0 Debug
xform 0 144 896
use inhier 48 1024 100 0 Fault
xform 0 144 1024
use inhier 0 1088 100 0 Tolerance
xform 0 144 1088
use inhier 0 1216 100 0 Position
xform 0 144 1216
use inhier 48 1152 100 0 Mode
xform 0 144 1152
use outhier 1472 864 100 0 LLimit
xform 0 1424 864
use outhier 1472 928 100 0 ULimit
xform 0 1424 928
use outhier 1472 800 100 0 Flink
xform 0 1424 800
use outhier 1472 1184 100 0 Message
xform 0 1424 1184
use outhier 1472 1056 100 0 InPosn
xform 0 1424 1056
use outhier 1472 992 100 0 Status
xform 0 1424 992
use outhier 1472 1120 100 0 DevPosn
xform 0 1424 1120
use outhier 1472 1248 100 0 Response
xform 0 1424 1248
use hwout 1152 1271 100 0 hwout#32
xform 0 1248 1312
p 1248 1303 100 0 -1 val(outp):@$(hword)
[comments]
