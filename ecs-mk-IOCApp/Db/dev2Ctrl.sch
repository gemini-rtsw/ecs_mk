[schematic2]
uniq 20
[tools]
[detail]
w 1496 83 100 0 flink efanouts.efanouts#367.LNK1 1392 80 1600 80 outhier.flink.p
w -144 259 100 0 n#1 ecalcs.ecalcs#377.INPA -96 256 -192 256 -192 320 224 320 224 64 192 64 ecalcs.ecalcs#377.VAL
w 256 99 100 0 n#2 ecalcs.ecalcs#377.FLNK 192 96 320 96 320 304 608 304 ecsMotorControl.ecsMotorControl#383.Slink
w 1024 307 100 0 n#3 ecsMotorControl.ecsMotorControl#383.Flink 992 304 1056 304 1056 0 1152 0 efanouts.efanouts#367.SLNK
w -308 -125 100 0 n#4 inhier.flnk.P -520 -128 -96 -128 ecalcs.ecalcs#377.SLNK
w 32 451 100 0 n#5 hwin.hwin#345.in -544 448 608 448 ecsMotorControl.ecsMotorControl#383.Simulation
w 32 403 100 0 n#6 hwin.hwin#343.in -544 400 608 400 ecsMotorControl.ecsMotorControl#383.Debug
w 8 595 100 0 n#7 inhier.state.P -592 592 608 592 ecsMotorControl.ecsMotorControl#383.Mode
w -176 787 100 0 n#8 hwin.hwin#385.in -272 784 -80 784 -80 640 608 640 ecsMotorControl.ecsMotorControl#383.Encoder
w -128 883 100 0 n#9 hwin.hwin#384.in -272 880 16 880 16 688 608 688 ecsMotorControl.ecsMotorControl#383.HandshakeInput
w -100 995 100 0 n#10 hwin.hwin#386.in -272 992 72 992 96 992 96 736 608 736 ecsMotorControl.ecsMotorControl#383.PositionFeedback
w -152 1203 100 0 n#11 inhier.pos.P -464 1200 160 1200 160 784 608 784 ecsMotorControl.ecsMotorControl#383.Position
w 1280 787 100 0 n#12 ecsMotorControl.ecsMotorControl#383.Response 992 784 1568 784 outhier.car.p
w 1280 691 100 0 n#13 ecsMotorControl.ecsMotorControl#383.Message 992 688 1568 688 outhier.carMess.p
w 1280 547 100 0 n#14 ecsMotorControl.ecsMotorControl#383.DevPosn 992 544 1568 544 outhier.curPos.p
w 1280 499 100 0 n#15 ecsMotorControl.ecsMotorControl#383.InPosn 992 496 1568 496 outhier.inPos.p
w 1280 451 100 0 n#16 ecsMotorControl.ecsMotorControl#383.Status 992 448 1568 448 outhier.curState.p
w 1264 643 100 0 n#17 ecsMotorControl.ecsMotorControl#383.PositionDemand 992 640 1536 640 hwout.hwout#388.outp
w 1264 595 100 0 n#18 hwout.hwout#391.outp 1536 592 992 592 ecsMotorControl.ecsMotorControl#383.DriveEnable
w 1264 739 100 0 n#19 hwout.hwout#387.outp 1536 736 992 736 ecsMotorControl.ecsMotorControl#383.NewPosition
s 1104 -688 100 0 Pedro Gigoux, 14/May/99
s 1104 -656 100 0 Added flink output
[cell use]
use outhier 1584 688 100 0 carMess
xform 0 1552 688
use outhier 1584 448 100 0 curState
xform 0 1552 448
use outhier 1584 544 100 0 curPos
xform 0 1552 544
use outhier 1584 784 100 0 car
xform 0 1552 784
use outhier 1584 496 100 0 inPos
xform 0 1552 496
use outhier 1568 39 100 0 flink
xform 0 1584 80
use ecalcs -96 -217 100 0 ecalcs#377
xform 0 48 48
p -16 64 100 0 1 CALC:A+1
p -16 336 100 1024 -1 name:$(top)$(dev)ProcCtr
use efanouts 1152 -137 100 0 efanouts#367
xform 0 1272 16
p 1264 160 100 1024 -1 name:$(top)$(dev)MotorFan
use inhier -608 592 100 0 state
xform 0 -592 592
use inhier -480 1200 100 0 pos
xform 0 -464 1200
p -505 1200 100 0 0 IO:input
use inhier -536 -128 100 0 flnk
xform 0 -520 -128
p -550 -131 100 0 0 IO:input
use hwin -736 407 100 0 hwin#345
xform 0 -640 448
p -911 443 100 0 -1 val(in):$(top)simulateL
use hwin -736 359 100 0 hwin#343
xform 0 -640 400
p -912 395 100 0 -1 val(in):$(top)debugM
use eborderC -712 -929 100 0 eborderC#258
xform 0 968 376
p 1972 -772 100 1024 -1 author:Bob Wooff
p 1964 -808 100 1024 -1 date:May 8, 1998
p 2368 -808 80 768 -1 file:dev2Ctrl.sch
p 2316 -656 150 256 -1 project:Enclosure Control System
p 2136 -776 100 0 0 revision:$Revision: 1.1.1.1 $
p 2312 -712 140 256 -1 title:Device Control w/o Velocity
use ecsMotorControl 608 288 100 0 ecsMotorControl#383
xform 0 800 560
p 712 686 100 0 -1 set1:dev $(dev)
p 712 656 100 0 -1 set4:motor $(motor)
p 712 626 100 0 -1 set2:dtyp AB DF1 serial
use hwin -464 864 100 0 hwin#384
xform 0 -368 880
p -592 874 100 0 -1 val(in):@$(abC) $(hs)
use hwin -464 768 100 0 hwin#385
xform 0 -368 784
p -605 779 100 0 -1 val(in):@$(abC) $(enc)
use hwin -464 976 100 0 hwin#386
xform 0 -368 992
p -643 985 100 0 -1 val(in):@$(abC) $(posdmd)
use hwout 1536 720 100 0 hwout#387
xform 0 1632 736
p 1743 730 100 0 -1 val(outp):@$(abC) $(hs) $(newpos)
use hwout 1536 624 100 0 hwout#388
xform 0 1632 640
p 1741 637 100 0 -1 val(outp):@$(abC) $(posdmd)
use hwout 1536 576 100 0 hwout#391
xform 0 1632 592
p 1747 587 100 0 -1 val(outp):@$(abC) $(hs) $(drvena)
[comments]
