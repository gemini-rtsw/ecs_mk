[schematic2]
uniq 3
[tools]
[detail]
w 408 939 100 0 keys inhier.keys.P 160 928 704 928 ecad20.ecad20#72.INPG
w 472 1003 100 0 moveccw inhier.moveccw.P 288 992 704 992 ecad20.ecad20#72.INPF
w 408 1067 100 0 movecw inhier.movecw.P 160 1056 704 1056 ecad20.ecad20#72.INPE
w 536 107 100 0 n#1 hwin.hwin#66.in 416 96 704 96 ecad20.ecad20#72.INPT
w 1208 -85 100 0 flnk ecad20.ecad20#72.STLK 1024 -96 1440 -96 outhier.flnk.p
w 376 1323 100 0 n#2 embbis.embbis#49.VAL 96 1312 704 1312 ecad20.ecad20#72.INPA
w 466 1131 100 0 power inhier.power.P 288 1120 704 1120 ecad20.ecad20#72.INPD
w 408 1195 100 0 pcu2 inhier.pcu2.P 160 1184 704 1184 ecad20.ecad20#72.INPC
w 466 1259 100 0 login inhier.login.P 288 1248 704 1248 ecad20.ecad20#72.INPB
w 1208 1355 100 0 val ecad20.ecad20#72.VALA 1024 1344 1440 1344 outhier.val.p
w 1160 1515 100 0 carMess ecad20.ecad20#72.MESS 1024 1504 1344 1504 1344 1440 1440 1440 outhier.carMess.p
w 1208 1547 100 0 car ecad20.ecad20#72.VAL 1024 1536 1440 1536 outhier.car.p
s 256 640 100 0 Input links from H to S
s 256 608 100 0 are command specific
[cell use]
use bc200tr -768 -600 -100 0 frame
xform 0 912 704
use inhier 272 1079 100 0 power
xform 0 288 1120
use inhier 144 887 100 0 keys
xform 0 160 928
use inhier 272 1207 100 0 login
xform 0 288 1248
use inhier 144 1143 100 0 pcu2
xform 0 160 1184
use inhier 144 1015 100 0 movecw
xform 0 160 1056
use inhier 272 951 100 0 moveccw
xform 0 288 992
use ecad20 704 -185 100 0 ecad20#72
xform 0 864 704
p 800 1280 100 0 1 FTVA:LONG
p 688 -224 100 0 1 SNAM:$(snam)
p 816 -192 100 1024 -1 name:$(top)$(sys)$(cmd)Cad
use hwin 224 55 100 0 hwin#66
xform 0 320 96
p 67 87 100 0 -1 val(in):$(top)debugL
use embbis -160 1255 100 0 embbis#49
xform 0 -32 1328
p -32 1184 100 0 1 ONST:ON
p -144 1184 100 0 1 ONVL:1
p -32 1216 100 0 1 ZRST:OFF
p -144 1216 100 0 1 ZRVL:0
p -48 1248 100 1024 -1 name:$(top)$(sys)$(cmd)Mode
use outhier 1408 1303 100 0 val
xform 0 1424 1344
use outhier 1408 1495 100 0 car
xform 0 1424 1536
use outhier 1408 1399 100 0 carMess
xform 0 1424 1440
use outhier 1408 -137 100 0 flnk
xform 0 1424 -96
[comments]
