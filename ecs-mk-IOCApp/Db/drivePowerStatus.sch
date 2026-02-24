[schematic2]
uniq 19
[tools]
[detail]
w -64 483 100 0 n#1 ahuWordGet.ahuWordGet#1313.flnk -128 480 0 480 0 160 160 160 ecalcs.calcword1.SLNK
w 656 -1469 100 0 n#2 ecalcs.calcword4.FLNK 448 -1472 864 -1472 864 -320 944 -320 egenSub.proc.SLNK
w 496 -845 100 0 n#3 ecalcs.calcword3.FLNK 448 -848 544 -848 544 -1264 0 -1264 0 -1696 160 -1696 ecalcs.calcword4.SLNK
w 496 -221 100 0 n#4 ecalcs.calcword2.FLNK 448 -224 544 -224 544 -624 0 -624 0 -1072 160 -1072 ecalcs.calcword3.SLNK
w 496 387 100 0 n#5 ecalcs.calcword1.FLNK 448 384 544 384 544 -16 0 -16 0 -448 160 -448 ecalcs.calcword2.SLNK
w 624 -1501 100 0 n#6 ecalcs.calcword4.VAL 448 -1504 800 -1504 800 160 944 160 egenSub.proc.INPD
w 16 547 100 0 n#7 ahuWordGet.ahuWordGet#1313.wordOut -128 544 160 544 ecalcs.calcword1.INPA
w -61 240 100 0 n#7 junction -64 544 -64 -64 160 -64 ecalcs.calcword2.INPA
w -61 -376 100 0 n#7 junction -64 -64 -64 -688 160 -688 ecalcs.calcword3.INPA
w 48 -1309 100 0 n#7 ecalcs.calcword4.INPA 160 -1312 -64 -1312 -64 -688 junction
w 608 -877 100 0 n#8 ecalcs.calcword3.VAL 448 -880 768 -880 768 224 944 224 egenSub.proc.INPC
w 592 -253 100 0 n#9 ecalcs.calcword2.VAL 448 -256 736 -256 736 288 944 288 egenSub.proc.INPB
w 696 355 100 0 n#10 ecalcs.calcword1.VAL 448 352 944 352 egenSub.proc.INPA
w 1859 -149 100 0 n#11 hwout.hwout#1315.outp 1856 -152 1856 -152 ecalcouts.moveShtrAutoCalcBot.OUT
w 1859 -437 100 0 n#12 hwout.hwout#1314.outp 1856 -440 1856 -440 ecalcouts.moveShtrAutoCalcTop.OUT
w 1547 -21 100 0 n#13 hwin.hwin#1319.in 1544 -24 1544 -24 ecalcouts.moveShtrAutoCalcBot.INPA
w 1547 -53 100 0 n#14 hwin.hwin#1316.in 1544 -56 1544 -56 ecalcouts.moveShtrAutoCalcBot.INPB
w 1539 -309 100 0 n#15 hwin.hwin#1318.in 1536 -312 1536 -312 ecalcouts.moveShtrAutoCalcTop.INPA
w 1546 -334 -100 0 n#16 hwin.hwin#1317.in 1536 -344 1536 -344 ecalcouts.moveShtrAutoCalcTop.INPB
w 1234 -142 -100 0 n#17 egenSub.proc.OUTI 1232 -160 1416 -160 1416 -88 1544 -88 ecalcouts.moveShtrAutoCalcBot.INPC
w 1234 -214 -100 0 n#18 egenSub.proc.OUTJ 1232 -224 1328 -224 1328 -376 1536 -376 ecalcouts.moveShtrAutoCalcTop.INPC
s 2256 -2160 100 0 Angelic Ebbers
s 2912 -2048 150 0 Drive Powering Status sequences
s 2320 -2240 80 0 23/March/2015
s 2736 -2160 100 0 drivePowerStatus
[cell use]
use bd200tr -1504 -2392 -100 0 frame
xform 0 1136 -688
use ahuWordGet -352 423 100 0 ahuWordGet#1313
xform 0 -240 512
p -352 384 100 0 1 setAb:ab $(ab)
p -352 352 100 0 1 setDev:dev $(dev)
p -352 416 100 0 1 setWord:word $(word)
use ecalcs 160 71 100 0 calcword1
xform 0 304 336
p 160 16 100 0 1 CALC:A&15
p 128 254 100 0 0 HHSV:NO_ALARM
p 288 336 100 0 0 HIGH:0
p 128 382 100 0 0 HIHI:0
p 128 222 100 0 0 HSV:NO_ALARM
p -128 446 100 0 0 SCAN:1 second
p 496 448 100 1024 -1 name:$(top)$(dev)calcword1
use ecalcs 160 -537 100 0 calcword2
xform 0 304 -272
p 160 -608 100 0 1 CALC:(A&240)>>4
p 128 -290 100 0 0 HIGH:0
p 128 -226 100 0 0 HIHI:0
p 128 -386 100 0 0 HSV:NO_ALARM
p 496 -160 100 1024 -1 name:$(top)$(dev)calcword2
use ecalcs 160 -1161 100 0 calcword3
xform 0 304 -896
p 160 -1216 100 0 1 CALC:(A&3840)>>8
p 128 -914 100 0 0 HIGH:0
p 128 -850 100 0 0 HIHI:0
p 128 -1010 100 0 0 HSV:NO_ALARM
p 512 -800 100 1024 -1 name:$(top)$(dev)calcword3
use ecalcs 160 -1785 100 0 calcword4
xform 0 304 -1520
p 160 -1840 100 0 1 CALC:(A&61440)>>12
p 128 -1538 100 0 0 HIGH:0
p 128 -1474 100 0 0 HIHI:0
p 128 -1634 100 0 0 HSV:NO_ALARM
p 512 -1424 100 1024 -1 name:$(top)$(dev)calcword4
use egenSub 1056 -416 100 0 proc
xform 0 1088 16
p 1040 368 100 0 1 FTA:LONG
p 1040 336 100 0 1 FTB:LONG
p 1040 304 100 0 1 FTC:LONG
p 1040 256 100 0 1 FTD:LONG
p 1040 224 100 0 1 FTE:LONG
p 1024 -112 100 0 1 FTVA:STRING
p 1024 -144 100 0 1 FTVB:STRING
p 1024 -176 100 0 1 FTVC:STRING
p 1024 -208 100 0 1 FTVD:STRING
p 1024 -240 100 0 1 FTVE:STRING
p 1024 -272 100 0 1 FTVF:LONG
p 992 -464 100 0 1 SNAM:$(snam)
p 1088 432 100 1024 -1 name:$(top)$(dev)proc
use hwout 1856 -456 100 0 hwout#1314
xform 0 1952 -440
p 1616 -760 100 1024 0 name:$(top)$(I)
p 1952 -449 100 0 -1 val(outp):$(top)moveShtrs.VALB
use hwout 1856 -168 100 0 hwout#1315
xform 0 1952 -152
p 1954 -160 100 0 -1 val(outp):$(top)moveShtrs.VALD
use hwin 1352 -72 100 0 hwin#1316
xform 0 1448 -56
p 1355 -64 100 0 -1 val(in):$(top)botShtrPos
use hwin 1344 -360 100 0 hwin#1317
xform 0 1440 -344
p 1347 -352 100 0 -1 val(in):$(top)topShtrPos
use hwin 1344 -328 100 0 hwin#1318
xform 0 1440 -312
p 1347 -320 100 0 -1 val(in):$(top)topShtrOffset
use hwin 1352 -40 100 0 hwin#1319
xform 0 1448 -24
p 1355 -32 100 0 -1 val(in):$(top)botShtrOffset
use ecalcouts 1544 -184 100 0 moveShtrAutoCalcBot
xform 0 1704 -88
p 2376 374 100 0 1 OOPT:When Non-zero
p 1616 -176 100 0 1 CALC:C ? (B - A) : 0
use ecalcouts 1536 -472 100 0 moveShtrAutoCalcTop
xform 0 1696 -376
p 1608 -464 100 0 1 CALC:C ? (B-A) : 0
p 2368 86 100 0 1 OOPT:When Non-zero
[comments]
