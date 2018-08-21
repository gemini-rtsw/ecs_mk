[schematic2]
uniq 8
[tools]
[detail]
w 802 75 100 0 n#1 hwin.hwin#330.in 768 64 896 64 esirs.esirs#334.INP
w 802 715 100 0 n#2 hwin.hwin#329.in 768 704 896 704 esirs.esirs#325.INP
w 802 1035 100 0 n#3 hwin.hwin#326.in 768 1024 896 1024 esirs.esirs#324.INP
w -158 75 100 0 n#4 hwin.hwin#323.in -192 64 -64 64 esirs.esirs#239.INP
w -158 395 100 0 n#5 hwin.hwin#320.in -192 384 -64 384 esirs.esirs#311.INP
w -158 715 100 0 n#6 hwin.hwin#314.in -192 704 -64 704 esirs.esirs#247.INP
w -158 1035 100 0 n#7 hwin.hwin#312.in -192 1024 -64 1024 esirs.esirs#256.INP
[cell use]
use esirs 896 135 100 0 esirs#335
xform 0 1104 288
p 832 -128 100 0 0 FDSC:Enclosure Control System (ECS)
p 1040 224 100 0 1 FTVL:STRING
p 1124 68 100 0 0 HHSV:NO_ALARM
p 996 96 100 0 0 HIGH:0
p 996 68 100 0 0 HIHI:0
p 1120 100 100 0 0 HSV:NO_ALARM
p 1104 176 100 256 1 SCAN:1 second
p 1040 192 100 0 0 SNAM:
p 1104 416 100 1024 -1 name:$(sad)name
use esirs 896 -185 100 0 esirs#334
xform 0 1104 -32
p 1056 -96 100 0 1 FTVL:STRING
p 1124 -252 100 0 0 HHSV:NO_ALARM
p 996 -224 100 0 0 HIGH:1
p 996 -252 100 0 0 HIHI:2
p 1120 -220 100 0 0 HSV:NO_ALARM
p 1104 -144 100 256 1 SCAN:1 second
p 1024 -144 100 0 0 SNAM:
p 1104 96 100 1024 -1 name:$(sad)simulate
use esirs 896 455 100 0 esirs#325
xform 0 1104 608
p 1056 544 100 0 1 FTVL:STRING
p 1124 388 100 0 0 HHSV:NO_ALARM
p 996 416 100 0 0 HIGH:1
p 996 388 100 0 0 HIHI:2
p 1120 420 100 0 0 HSV:NO_ALARM
p 1104 496 100 256 1 SCAN:1 second
p 1024 496 100 0 0 SNAM:
p 1104 736 100 1024 -1 name:$(sad)debug
use esirs 896 775 100 0 esirs#324
xform 0 1104 928
p 1040 864 100 0 1 FTVL:STRING
p 1124 708 100 0 0 HHSV:NO_ALARM
p 996 736 100 0 0 HIGH:0
p 996 708 100 0 0 HIHI:0
p 1120 740 100 0 0 HSV:NO_ALARM
p 1104 816 100 256 1 SCAN:1 second
p 1040 832 100 0 0 SNAM:
p 1104 1056 100 1024 -1 name:$(sad)log
use esirs -64 775 100 0 esirs#256
xform 0 144 928
p 64 704 100 0 0 BRSV:NO_ALARM
p 96 848 100 0 1 FTVL:LONG
p 164 708 100 0 0 HHSV:NO_ALARM
p 36 736 100 0 0 HIGH:0
p 36 708 100 0 0 HIHI:0
p 160 740 100 0 0 HSV:NO_ALARM
p 80 816 100 0 1 SCAN:1 second
p 32 832 100 0 0 SNAM:
p 144 1056 100 1024 -1 name:$(sad)heartbeat
use esirs -64 455 100 0 esirs#247
xform 0 144 608
p 160 528 100 256 1 FTVL:STRING
p -128 128 100 0 0 HHSV:NO_ALARM
p -128 96 100 0 0 HIGH:0.0
p -128 64 100 0 0 HIHI:0.0
p -128 32 100 0 0 HSV:NO_ALARM
p 160 496 100 256 1 SCAN:1 second
p 144 496 100 256 0 SNAM:
p 144 736 100 1024 -1 name:$(sad)state
use esirs -64 -185 100 0 esirs#239
xform 0 144 -32
p 96 -96 100 0 1 FTVL:STRING
p 164 -252 100 0 0 HHSV:NO_ALARM
p 36 -224 100 0 0 HIGH:1
p 36 -252 100 0 0 HIHI:2
p 160 -220 100 0 0 HSV:NO_ALARM
p 144 -144 100 256 1 SCAN:1 second
p 64 -144 100 0 0 SNAM:
p 144 96 100 1024 -1 name:$(sad)health
use esirs -64 135 100 0 esirs#311
xform 0 144 288
p 80 224 100 0 1 FTVL:STRING
p 164 68 100 0 0 HHSV:NO_ALARM
p 36 96 100 0 0 HIGH:0
p 36 68 100 0 0 HIHI:0
p 160 100 100 0 0 HSV:NO_ALARM
p 144 176 100 256 1 SCAN:1 second
p 80 192 100 0 0 SNAM:
p 144 416 100 1024 -1 name:$(sad)historyLog
use hwin 576 23 100 0 hwin#330
xform 0 672 64
p 576 96 100 0 -1 val(in):$(ecs)simulateL
use hwin 576 663 100 0 hwin#329
xform 0 672 704
p 576 736 100 0 -1 val(in):$(ecs)debugL.OMSS
use hwin 576 983 100 0 hwin#326
xform 0 672 1024
p 576 1056 100 0 -1 val(in):$(ecs)logL
use hwin -384 23 100 0 hwin#323
xform 0 -288 64
p -384 96 100 0 -1 val(in):$(ecs)health.OMSS
use hwin -384 343 100 0 hwin#320
xform 0 -288 384
p -384 416 100 0 -1 val(in):$(ecs)historyLog.VAL
use hwin -384 663 100 0 hwin#314
xform 0 -288 704
p -384 736 100 0 -1 val(in):$(ecs)state.OMSS
use hwin -384 983 100 0 hwin#312
xform 0 -288 1024
p -384 1056 100 0 -1 val(in):$(ecs)present
use eborderC -1136 -857 100 0 eborderC#84
xform 0 544 448
p 1544 -700 100 1024 -1 author:Bob Wooff
p 1540 -736 100 1024 -1 date:March 27, 1998
p 1940 -732 80 768 -1 file:generalSAD.sch
p 1892 -584 150 256 -1 project:Enclosure Control System
p 1712 -704 100 0 0 revision:$Revision: 1.1.1.1 $
p 1900 -656 200 256 -1 title:ECS General SAD
[comments]
