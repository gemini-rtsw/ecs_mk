[schematic2]
uniq 20
[tools]
[detail]
w -144 259 100 0 n#1 ecalcs.ecalcs#377.INPA -96 256 -192 256 -192 320 224 320 224 64 192 64 ecalcs.ecalcs#377.VAL
w 256 99 100 0 n#2 ecalcs.ecalcs#377.FLNK 192 96 320 96 320 304 560 304 ecsMotorControl.ecsMotorControl#383.Slink
w 1184 307 100 0 n#3 ecsMotorControl.ecsMotorControl#383.Flink 944 304 1424 304 1424 88 1520 88 efanouts.efanouts#367.SLNK
w -336 -125 100 0 n#4 inhier.flnk.P -576 -128 -96 -128 ecalcs.ecalcs#377.SLNK
w 1232 691 100 0 n#5 ecsMotorControl.ecsMotorControl#383.Message 944 688 1520 688 outhier.carMess.p
w 72 451 100 0 n#6 hwin.hwin#345.in -416 448 560 448 ecsMotorControl.ecsMotorControl#383.Simulation
w 72 403 100 0 n#7 hwin.hwin#343.in -416 400 560 400 ecsMotorControl.ecsMotorControl#383.Debug
w 1232 499 100 0 n#8 ecsMotorControl.ecsMotorControl#383.InPosn 944 496 1520 496 outhier.inPos.p
w 1232 547 100 0 n#9 ecsMotorControl.ecsMotorControl#383.DevPosn 944 544 1520 544 outhier.curPos.p
w 1232 451 100 0 n#10 ecsMotorControl.ecsMotorControl#383.Status 944 448 1520 448 outhier.curState.p
w -272 1203 100 0 n#11 inhier.pos.P -560 1200 16 1200 16 784 560 784 ecsMotorControl.ecsMotorControl#383.Position
w -92 595 100 0 n#12 inhier.state.P -744 592 560 592 ecsMotorControl.ecsMotorControl#383.Mode
w -296 915 100 0 n#13 hwin.hwin#379.in -480 912 -112 912 -112 688 560 688 ecsMotorControl.ecsMotorControl#383.HandshakeInput
w -336 787 100 0 n#14 hwin.hwin#380.in -480 784 -192 784 -192 640 560 640 ecsMotorControl.ecsMotorControl#383.Encoder
w 1232 787 100 0 n#15 ecsMotorControl.ecsMotorControl#383.Response 944 784 1520 784 outhier.car.p
w 1220 643 100 0 n#16 ecsMotorControl.ecsMotorControl#383.PositionDemand 944 640 1488 640 hwout.hwout#381.outp
w -264 1043 100 0 n#17 hwin.hwin#384.in -480 1040 -48 1040 -48 736 560 736 ecsMotorControl.ecsMotorControl#383.PositionFeedback
w 1216 739 100 0 n#18 hwout.hwout#382.outp 1488 736 944 736 ecsMotorControl.ecsMotorControl#383.NewPosition
w 1498 594 -100 0 n#19 hwout.hwout#385.outp 1488 592 944 592 ecsMotorControl.ecsMotorControl#383.DriveEnable
[cell use]
use outhier 1536 496 100 0 inPos
xform 0 1504 496
use outhier 1536 784 100 0 car
xform 0 1504 784
use outhier 1536 544 100 0 curPos
xform 0 1504 544
use outhier 1536 448 100 0 curState
xform 0 1504 448
use outhier 1536 688 100 0 carMess
xform 0 1504 688
use ecalcs -96 -217 100 0 ecalcs#377
xform 0 48 48
p -16 64 100 0 1 CALC:A+1
p -16 336 100 1024 -1 name:$(top)$(dev)ProcCtr
use efanouts 1520 -49 100 0 efanouts#367
xform 0 1640 104
p 1632 248 100 1024 -1 name:$(top)$(dev)MotorFan
use inhier -600 -128 100 0 flnk
xform 0 -584 -128
use inhier -621 1194 100 0 pos
xform 0 -560 1200
use inhier -816 584 100 0 state
xform 0 -744 592
p -847 596 100 0 0 IO:input
use hwin -608 359 100 0 hwin#343
xform 0 -512 400
p -755 389 100 0 -1 val(in):$(top)debugM
use hwin -608 407 100 0 hwin#345
xform 0 -512 448
p -768 441 100 0 -1 val(in):$(top)simulateL
use eborderC -1152 -849 100 0 eborderC#258
xform 0 528 456
p 1532 -692 100 1024 -1 author:Bob Wooff
p 1524 -728 100 1024 -1 date:May 8, 1998
p 1928 -728 80 768 -1 file:devCtrl.sch
p 1876 -576 150 256 -1 project:Enclosure Control System
p 1696 -696 100 0 0 revision:$Revision: 1.1.1.1 $
p 1892 -640 200 256 -1 title:Device Control
use hwin -672 896 100 0 hwin#379
xform 0 -576 912
p -832 903 100 0 -1 val(in):@$(abC) $(dmHs)
use hwin -672 768 100 0 hwin#380
xform 0 -576 784
p -842 776 100 0 -1 val(in):@$(abC) $(dmEnc)
use hwout 1694 632 100 0 hwout#381
xform 0 1584 640
p 1691 635 100 0 -1 val(outp):@$(abC) $(dmPosDmd)
use hwout 1488 720 100 0 hwout#382
xform 0 1584 736
p 1695 729 100 0 -1 val(outp):@$(abC) $(dmHs) $(vnewpos)
use ecsMotorControl 560 288 100 0 ecsMotorControl#383
xform 0 752 560
p 664 686 100 0 -1 set1:dev $(dev)
p 664 626 100 0 -1 set2:dtyp AB DF1 serial
p 664 596 100 0 -1 set3:vms 1
p 664 656 100 0 -1 set4:motor $(motor)
use hwin -672 1024 100 0 hwin#384
xform 0 -576 1040
p -881 1035 100 0 -1 val(in):@$(abC) $(dmPosDmd)
use hwout 1488 576 100 0 hwout#385
xform 0 1584 592
p 1696 586 100 0 -1 val(outp):@$(abC) $(dmHs) $(vdrvena)
[comments]
