[schematic2]
uniq 3
[tools]
[detail]
w 888 491 100 0 n#1 hwin.hwin#68.in 768 480 1056 480 ecad20.ecad20#74.INPT
w 824 1387 100 0 moveccw inhier.moveccw.P 640 1376 1056 1376 ecad20.ecad20#74.INPF
w 760 1451 100 0 movecw inhier.movecw.P 512 1440 1056 1440 ecad20.ecad20#74.INPE
w 1496 1675 100 0 ccw ecad20.ecad20#74.VALB 1376 1664 1664 1664 1664 1632 1792 1632 outhier.ccw.p
w 1560 1739 100 0 cw ecad20.ecad20#74.VALA 1376 1728 1792 1728 outhier.cw.p
w 760 1323 100 0 keys inhier.keys.P 512 1312 1056 1312 ecad20.ecad20#74.INPG
w 728 1707 100 0 n#2 embbis.embbis#49.VAL 448 1696 1056 1696 ecad20.ecad20#74.INPA
w 818 1515 100 0 power inhier.power.P 640 1504 1056 1504 ecad20.ecad20#74.INPD
w 760 1579 100 0 pcu2 inhier.pcu2.P 512 1568 1056 1568 ecad20.ecad20#74.INPC
w 818 1643 100 0 login inhier.login.P 640 1632 1056 1632 ecad20.ecad20#74.INPB
w 1560 299 100 0 flnk ecad20.ecad20#74.STLK 1376 288 1792 288 outhier.flnk.p
w 1512 1899 100 0 carMess ecad20.ecad20#74.MESS 1376 1888 1696 1888 1696 1824 1792 1824 outhier.carMess.p
w 1560 1931 100 0 car ecad20.ecad20#74.VAL 1376 1920 1792 1920 outhier.car.p
[cell use]
use bc200tr -448 -216 -100 0 frame
xform 0 1232 1088
use ecad20 1056 199 100 0 ecad20#74
xform 0 1216 1088
p 1152 1664 100 0 1 FTVA:LONG
p 1152 1632 100 0 1 FTVB:LONG
p 1040 160 100 0 1 SNAM:$(snam)
p 1168 192 100 1024 -1 name:$(top)$(sys)$(cmd)Cad
use outhier 1760 1591 100 0 ccw
xform 0 1776 1632
use outhier 1760 1687 100 0 cw
xform 0 1776 1728
use outhier 1760 1879 100 0 car
xform 0 1776 1920
use outhier 1760 1783 100 0 carMess
xform 0 1776 1824
use outhier 1760 247 100 0 flnk
xform 0 1776 288
use hwin 576 439 100 0 hwin#68
xform 0 672 480
p 418 473 100 0 -1 val(in):$(top)debugL
use embbis 192 1639 100 0 embbis#49
xform 0 320 1712
p 320 1568 100 0 1 ONST:CW
p 208 1568 100 0 1 ONVL:1
p 208 1536 100 0 1 TVVL:2
p 320 1536 100 0 1 TWST:CCW
p 320 1600 100 0 1 ZRST:STOP
p 208 1600 100 0 1 ZRVL:0
p 304 1632 100 1024 -1 name:$(top)$(sys)$(cmd)Mode
use inhier 624 1463 100 0 power
xform 0 640 1504
use inhier 496 1271 100 0 keys
xform 0 512 1312
use inhier 624 1591 100 0 login
xform 0 640 1632
use inhier 496 1527 100 0 pcu2
xform 0 512 1568
use inhier 496 1399 100 0 movecw
xform 0 512 1440
use inhier 624 1335 100 0 moveccw
xform 0 640 1376
[comments]
