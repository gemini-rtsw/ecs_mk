[schematic2]
uniq 1
[tools]
[detail]
[cell use]
use eborderC -968 -505 100 0 eborderC#93
xform 0 712 800
p 1716 -348 100 1024 -1 author:W.N. Rambold
p 1712 -380 100 1024 -1 date:May 8, 1998
p 2112 -380 80 768 -1 file:ecsPVdev.sch
p 2104 -352 100 0 0 page:
p 2216 -352 100 0 0 pages:
p 1832 -384 100 0 0 primitive:eborderC
p 2056 -228 150 256 -1 project:Enclosure Control System
p 1880 -352 100 0 0 revision:$Revision: 1.1.1.1 $
p 1832 -240 150 768 0 system:
p 2060 -292 200 256 -1 title:Pos/Vel Device
use inhier -640 872 100 0 Fault
xform 0 -528 872
use inhier -640 1000 100 0 Mode
xform 0 -528 1000
use inhier -672 936 100 0 Tolerance
xform 0 -528 936
use inhier -672 808 100 0 Simulation
xform 0 -528 808
use inhier -640 680 100 0 Slink
xform 0 -528 680
use inhier -640 744 100 0 Debug
xform 0 -528 744
use inhier -672 1128 100 0 Position
xform 0 -528 1128
use inhier -672 1064 100 0 Velocity
xform 0 -528 1064
use outhier 1088 1088 100 0 Response
xform 0 1040 1088
use outhier 1088 960 100 0 DevPosn
xform 0 1040 960
use outhier 1088 832 100 0 Status
xform 0 1040 832
use outhier 1088 896 100 0 InPosn
xform 0 1040 896
use outhier 1088 1024 100 0 Message
xform 0 1040 1024
use outhier 1088 640 100 0 Flink
xform 0 1040 640
use outhier 1088 768 100 0 ULimit
xform 0 1040 768
use outhier 1088 704 100 0 LLimit
xform 0 1040 704
use hwout 768 1175 100 0 hwout#32
xform 0 864 1216
p 992 1216 100 0 -1 val(outp):@$(hword)
[comments]
