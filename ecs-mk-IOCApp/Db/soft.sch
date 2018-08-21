[schematic2]
uniq 31
[tools]
[detail]
w 1668 219 100 0 n#1 egenSub.egenSub#209.FLNK 1504 -32 1664 -32 1664 480 1792 480 ecars.ecars#21.SLNK
w 836 -229 100 0 n#2 egenSub.egenSub#192.FLNK 576 -448 832 -448 832 0 junction
w 836 299 100 0 n#2 egenSub.egenSub#172.FLNK 576 608 832 608 832 0 1216 0 egenSub.egenSub#209.SLNK
w 1618 619 100 0 n#3 egenSub.egenSub#209.OUTB 1504 608 1792 608 ecars.ecars#21.IMSS
w 1618 683 100 0 n#4 egenSub.egenSub#209.OUTA 1504 672 1792 672 ecars.ecars#21.IVAL
w 930 491 100 0 n#5 egenSub.egenSub#209.INPD 1216 480 704 480 704 224 576 224 egenSub.egenSub#192.VALB
w 914 555 100 0 n#6 egenSub.egenSub#192.VALA 576 288 672 288 672 544 1216 544 egenSub.egenSub#209.INPC
w 996 939 100 0 n#7 egenSub.egenSub#172.VALB 576 1280 992 1280 992 608 1216 608 egenSub.egenSub#209.INPB
w 1028 1003 100 0 n#8 egenSub.egenSub#172.VALA 576 1344 1024 1344 1024 672 1216 672 egenSub.egenSub#209.INPA
w 1154 427 100 0 n#9 egenSub.egenSub#209.INPE 1216 416 1152 416 hwin.hwin#215.in
w 1154 299 100 0 n#10 egenSub.egenSub#209.INPG 1216 288 1152 288 hwin.hwin#212.in
w 1154 171 100 0 n#11 egenSub.egenSub#209.INPI 1216 160 1152 160 hwin.hwin#211.in
w 162 -181 100 0 n#12 datum.datum#116.mess -32 -224 96 -224 96 -192 288 -192 egenSub.egenSub#192.INPH
w 146 -117 100 0 n#13 datum.datum#116.car -32 -192 64 -192 64 -128 288 -128 egenSub.egenSub#192.INPG
w -46 -245 100 0 n#14 datum.datum#116.flnk -32 -256 0 -256 junction
w -46 -53 100 0 n#14 debug.debug#51.flnk -32 -64 0 -64 junction
w -46 139 100 0 n#14 log.log#8.flnk -32 128 0 128 junction
w 4 -53 100 0 n#14 simulate.simulate#19.flnk -32 320 0 320 0 -416 288 -416 egenSub.egenSub#192.SLNK
w 226 -245 100 0 n#15 egenSub.egenSub#192.INPI 288 -256 224 -256 hwin.hwin#204.in
w 50 -21 100 0 n#16 debug.debug#51.mess -32 -32 192 -32 192 -64 288 -64 egenSub.egenSub#192.INPF
w 98 11 100 0 n#17 debug.debug#51.car -32 0 288 0 egenSub.egenSub#192.INPE
w 162 75 100 0 n#18 log.log#8.mess -32 160 96 160 96 64 288 64 egenSub.egenSub#192.INPD
w 18 203 100 0 n#19 log.log#8.car -32 192 128 192 128 128 288 128 egenSub.egenSub#192.INPC
w 34 363 100 0 n#20 simulate.simulate#19.mess -32 352 160 352 160 192 288 192 egenSub.egenSub#192.INPB
w 50 395 100 0 n#21 simulate.simulate#19.car -32 384 192 384 192 256 288 256 egenSub.egenSub#192.INPA
w 226 811 100 0 n#22 egenSub.egenSub#172.INPI 288 800 224 800 hwin.hwin#190.in
w 226 939 100 0 n#23 egenSub.egenSub#172.INPG 288 928 224 928 hwin.hwin#188.in
w -46 1003 100 0 n#24 init.init#7.flnk -32 992 0 992 junction
w -46 1195 100 0 n#24 reboot.reboot#9.flnk -32 1184 0 1184 junction
w 4 1003 100 0 n#24 test.test#11.flnk -32 1376 0 1376 0 640 288 640 egenSub.egenSub#172.SLNK
w 50 1035 100 0 n#25 init.init#7.mess -32 1024 192 1024 192 992 288 992 egenSub.egenSub#172.INPF
w 98 1067 100 0 n#26 init.init#7.car -32 1056 288 1056 egenSub.egenSub#172.INPE
w 162 1131 100 0 n#27 reboot.reboot#9.mess -32 1216 96 1216 96 1120 288 1120 egenSub.egenSub#172.INPD
w 18 1259 100 0 n#28 reboot.reboot#9.car -32 1248 128 1248 128 1184 288 1184 egenSub.egenSub#172.INPC
w 34 1419 100 0 n#29 test.test#11.mess -32 1408 160 1408 160 1248 288 1248 egenSub.egenSub#172.INPB
w 50 1451 100 0 n#30 test.test#11.car -32 1440 192 1440 192 1312 288 1312 egenSub.egenSub#172.INPA
s 752 1424 500 0 TCS/ECS SOFTWARE COMMANDS
[cell use]
use hwin 960 375 100 0 hwin#215
xform 0 1056 416
p 963 408 100 0 -1 val(in):$(IDLE)
use hwin 960 247 100 0 hwin#212
xform 0 1056 288
p 963 280 100 0 -1 val(in):$(IDLE)
use hwin 960 119 100 0 hwin#211
xform 0 1056 160
p 963 152 100 0 -1 val(in):$(IDLE)
use hwin 32 -297 100 0 hwin#204
xform 0 128 -256
p 35 -264 100 0 -1 val(in):$(IDLE)
use hwin 32 759 100 0 hwin#190
xform 0 128 800
p 35 792 100 0 -1 val(in):$(IDLE)
use hwin 32 887 100 0 hwin#188
xform 0 128 928
p 35 920 100 0 -1 val(in):$(IDLE)
use egenSub 1216 -89 100 0 egenSub#209
xform 0 1360 336
p 1296 592 80 0 1 FTA:LONG
p 1296 576 80 0 1 FTB:STRING
p 1296 560 80 0 1 FTC:LONG
p 1296 544 80 0 1 FTD:STRING
p 1296 528 80 0 1 FTE:LONG
p 1296 512 80 0 1 FTF:STRING
p 1296 496 80 0 1 FTG:LONG
p 1296 480 80 0 1 FTH:STRING
p 1296 464 80 0 1 FTI:LONG
p 1296 448 80 0 1 FTJ:STRING
p 1440 704 80 512 1 FTVA:LONG
p 1440 672 80 512 1 FTVB:STRING
p 1360 64 80 256 1 SNAM:carCombine
p 1360 752 100 1024 -1 name:$(top)softComb
use egenSub 288 -505 100 0 egenSub#192
xform 0 432 -80
p 368 176 80 0 1 FTA:LONG
p 368 160 80 0 1 FTB:STRING
p 368 144 80 0 1 FTC:LONG
p 368 128 80 0 1 FTD:STRING
p 368 112 80 0 1 FTE:LONG
p 368 96 80 0 1 FTF:STRING
p 368 80 80 0 1 FTG:LONG
p 368 64 80 0 1 FTH:STRING
p 368 48 80 0 1 FTI:LONG
p 368 32 80 0 1 FTJ:STRING
p 512 288 80 512 1 FTVA:LONG
p 512 256 80 512 1 FTVB:STRING
p 432 -352 80 256 1 SNAM:carCombine
p 432 336 100 1024 -1 name:$(top)softComb2
use egenSub 288 551 100 0 egenSub#172
xform 0 432 976
p 368 1232 80 0 1 FTA:LONG
p 368 1216 80 0 1 FTB:STRING
p 368 1200 80 0 1 FTC:LONG
p 368 1184 80 0 1 FTD:STRING
p 368 1168 80 0 1 FTE:LONG
p 368 1152 80 0 1 FTF:STRING
p 368 1136 80 0 1 FTG:LONG
p 368 1120 80 0 1 FTH:STRING
p 368 1104 80 0 1 FTI:LONG
p 368 1088 80 0 1 FTJ:STRING
p 512 1344 80 512 1 FTVA:LONG
p 512 1312 80 512 1 FTVB:STRING
p 432 704 80 256 1 SNAM:carCombine
p 432 1392 100 1024 -1 name:$(top)softComb1
use eborderC -800 -729 100 0 eborderC#58
xform 0 880 576
p 1884 -568 100 1024 -1 author:Bob Wooff
p 1876 -608 100 1024 -1 date:April 8, 1998
p 2276 -608 80 768 -1 file:soft.sch
p 2224 -456 150 256 -1 project:Enclosure Control System
p 2048 -576 100 0 0 revision:$Revision: 1.1.1.1 $
p 2228 -520 180 256 -1 title:ECS Software Commands
use datum -224 -313 100 0 datum#116
xform 0 -128 -208
use ecars 1792 391 100 0 ecars#21
xform 0 1952 560
p 1952 720 100 1024 -1 name:$(top)softC
use debug -224 -185 100 0 debug#51
xform 0 -128 -16
use simulate -224 199 100 0 simulate#19
xform 0 -128 368
use test -224 1255 100 0 test#11
xform 0 -128 1424
use reboot -224 1063 100 0 reboot#9
xform 0 -128 1232
use log -224 7 100 0 log#8
xform 0 -128 176
use init -224 871 100 0 init#7
xform 0 -128 1040
[comments]
