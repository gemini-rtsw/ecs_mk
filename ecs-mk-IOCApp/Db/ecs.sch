[schematic2]
uniq 1
[tools]
[detail]
s 896 -608 160 0 BFO Channels
s 880 -160 130 0 Drive Power Control
s 976 976 100 0 Auto Close Triggers
s 944 528 200 0 Dome deicing
s 880 160 150 0 LOTO Status
s 500 976 100 0 Position Demands
s 500 779 100 0 Handshake bits
[cell use]
use ecsTOP 610 -751 100 0 ecsTOP#2
xform 0 -8 392
p -316 -32 100 0 1 seta:top $(top)
p -320 0 100 0 1 setaa:prtop $(prtop):
p -320 -864 100 0 1 setab:pVent1 33
p -320 -896 100 0 1 setac:pVent2 34
p -320 -928 100 0 1 setad:lShell1 35
p -320 -960 100 0 1 setae:lShell2 36
p -32 -880 100 0 1 setaf:rVent1 37
p -32 -912 100 0 1 setag:rVent2 38
p -316 -64 100 0 1 setb:IDLE 0
p 888 -696 100 0 1 setbfo1:summitDriveEn 80 0
p 888 -728 100 0 1 setbfo2:standbyMode 80 1
p 896 -760 100 0 1 setbfo3:summitMode 80 2
p 896 -792 100 0 1 setbfo4:baseMode 80 3
p 896 -832 100 0 1 setbfo5:autoCloseTimer 80 14
p 256 -28 100 0 1 setbk:bsSkew 39
p 256 -832 100 0 1 setbke:bsSkewEnc 65
p 256 -796 100 0 1 setbs2w:bs2w 64
p 256 -700 100 0 1 setbs2x:bs2x 61
p 256 -732 100 0 1 setbs2y:bs2y 62
p 256 -764 100 0 1 setbs2z:bs2z 63
p 256 -960 100 0 1 setbsbrk2w:bsbrk2w 69
p 256 -864 100 0 1 setbsbrk2x:bsbrk2x 66
p 256 -896 100 0 1 setbsbrk2y:bsbrk2y 67
p 256 -928 100 0 1 setbsbrk2z:bsbrk2z 68
p -316 -96 100 0 1 setc:BUSY 2
p 976 944 100 0 1 setcl1:closeSH 23 7
p 976 912 100 0 1 setcl2:abortCloseSH 23 8
p 976 880 100 0 1 setcl3:closeEVG 23 9
p 976 848 100 0 1 setcl4:abortCloseEVG 23 10
p 976 816 100 0 1 setcl5:closeWVG 23 11
p 976 784 100 0 1 setcl6:abortCloseWVG 23 12
p -316 -128 100 0 1 setd:W1 0.5
p 256 -188 100 0 1 setd3e:dm3e 45
p 256 -220 100 0 1 setd3f:dm3f 46
p 256 -252 100 0 1 setd3g:dm3g 47
p 256 -284 100 0 1 setd3h:dm3h 48
p 256 -156 100 0 1 setd3w:dm3w 44
p 256 -60 100 0 1 setd3x:dm3x 41
p 256 -92 100 0 1 setd3y:dm3y 42
p 256 -124 100 0 1 setd3z:dm3z 43
p 944 336 100 0 1 setdicc:diCCWEna 7 9
p 944 384 100 0 1 setdicw:diCWEna 7 8
p 944 480 100 0 1 setdipc:diPcu2Ena 7 6
p 944 432 100 0 1 setdipw:diPwrEna 7 7
p -316 -160 100 0 1 sete:W2 1.0
p 256 -412 100 0 1 setev4w:evg4w 52
p 256 -316 100 0 1 setev4x:evg4x 49
p 256 -348 100 0 1 setev4y:evg4y 50
p 256 -380 100 0 1 setev4z:evg4z 51
p -316 -192 100 0 1 setf:W3 1.5
p -316 -224 100 0 1 setg:W4 2.0
p -316 -256 100 0 1 seth:W5 2.5
p -316 -288 100 0 1 seti:GOOD 0
p -316 -320 100 0 1 setj:WARNING 1
p -316 -352 100 0 1 setk:BAD 2
p -316 -380 100 0 1 setl:BOOTING 0
p 888 -664 100 0 1 setlights:domeLightCmd 31 4
p 896 -640 100 0 1 setlights2:domeLightSt 7 4
p 880 128 100 0 1 setloto1:tsLoto 80 4
p 880 96 100 0 1 setloto2:bsLoto 80 5
p 880 64 100 0 1 setloto3:domeLoto 80 6
p 880 32 100 0 1 setloto4:eVgLoto 80 7
p 880 0 100 0 1 setloto5:wVgLoto 80 8
p -316 -412 100 0 1 setm:INITIALISING 1
p -316 -444 100 0 1 setn:RUNNING 2
p -316 -476 100 0 1 seto:s sad:
p -320 -508 100 0 1 setp:DEFAULT 0
p -48 0 100 0 1 setprec:prec 1
p 1216 -208 100 0 1 setps1:powSeqWd1 72
p 1216 -496 100 0 1 setps10:wvgAutoReset 80 13
p 1216 -240 100 0 1 setps2:powSeqWd2 73
p 1216 -272 100 0 1 setps3:powSeqWd3 74
p 1216 -304 100 0 1 setps4:powSeqWd4 75
p 1216 -336 100 0 1 setps5:powSeqWd5 76
p 1216 -368 100 0 1 setps6:tsAutoReset 80 9
p 1216 -400 100 0 1 setps7:bsAutoReset 80 10
p 1216 -432 100 0 1 setps8:domeAutoReset 80 11
p 1216 -464 100 0 1 setps9:evgAutoReset 80 12
p 880 -208 100 0 1 setpw1:tsDrvPwOn 23 4
p 880 -496 100 0 1 setpw10:domeDrvSt 20 0
p 544 -208 100 0 1 setpw11:tsDrvPwOff 31 5
p 544 -240 100 0 1 setpw12:bsDrvPwOff 31 6
p 544 -272 100 0 1 setpw13:eVgDrvPwOff 31 8
p 544 -304 100 0 1 setpw14:wVgDrvPwOff 31 9
p 544 -336 100 0 1 setpw15:domeDrvPwOff 31 7
p 880 -240 100 0 1 setpw2:bsDrvPwOn 25 4
p 880 -272 100 0 1 setpw3:eVgDrvPwOn 27 4
p 880 -304 100 0 1 setpw4:wVgDrvPwOn 29 4
p 880 -336 100 0 1 setpw5:domeDrvPwOn 20 5
p 880 -368 100 0 1 setpw6:tsDrvSt 23 0
p 880 -400 100 0 1 setpw7:bsDrvSt 25 0
p 880 -432 100 0 1 setpw8:eVgDrvSt 27 0
p 880 -464 100 0 1 setpw9:wVgDrvSt 29 0
p -320 -540 100 0 1 setq:OK 0
p -320 -572 100 0 1 setr:m1 m1:
p -320 -604 100 0 1 sets:gis gis:
p 536 -919 100 0 1 setsv:shbrkpsv 86
p -320 -636 100 0 1 sett:gws ws:
p -320 -1024 100 0 1 settr1:motionInterlock 80 15
p 256 -668 100 0 1 setts1w:ts1w 60
p 256 -572 100 0 1 setts1x:ts1x 57
p 256 -604 100 0 1 setts1y:ts1y 58
p 256 -636 100 0 1 setts1z:ts1z 59
p 256 -1088 100 0 1 settsbrk1w:tsbrk1w 84
p 256 -992 100 0 1 settsbrk1x:tsbrk1x 81
p 256 -1024 100 0 1 settsbrk1y:tsbrk1y 82
p 256 -1056 100 0 1 settsbrk1z:tsbrk1z 83
p 528 -816 100 0 1 settsbrkcmd:tsbrkcmd 85 0
p 496 -720 100 0 1 settsbrkflt1w:tsbrkflt1w 85 4
p 496 -624 100 0 1 settsbrkflt1x:tsbrkflt1x 85 1
p 496 -656 100 0 1 settsbrkflt1y:tsbrkflt1y 85 2
p 496 -688 100 0 1 settsbrkflt1z:tsbrkflt1z 85 3
p -320 -668 100 0 1 setu:abC $(port)
p -320 -732 100 0 1 setw:dm1Flts 2
p 256 -540 100 0 1 setwv5w:wvg5w 56
p 256 -444 100 0 1 setwv5x:wvg5x 53
p 256 -476 100 0 1 setwv5y:wvg5y 54
p 256 -508 100 0 1 setwv5z:wvg5z 55
p -320 -764 100 0 1 setx:dm2Flts 3
p -320 -796 100 0 1 sety:tsFlts 0
p -320 -828 100 0 1 setz:bsFlts 1
p -32 -28 100 0 1 setza:evFlts 4
p -32 -60 100 0 1 setzb:wvFlts 5
p -32 -92 100 0 1 setzc:swFlts 6
p -32 -124 100 0 1 setzd:limFlts 16
p -32 -156 100 0 1 setze:encFlts 17
p -32 -188 100 0 1 setzf:c2eHb 19
p -32 -220 100 0 1 setzg:e2cHb 32
p -32 -252 100 0 1 setzh:p2eHb 4
p -32 -284 100 0 1 setzi:e2pHb 5
p -32 -316 100 0 1 setzj:dmHs 20
p -32 -348 100 0 1 setzk:dmEnc 11
p -32 -380 100 0 1 setzl:tsHs 23
p -32 -412 100 0 1 setzm:tsEnc 12
p -32 -444 100 0 1 setzn:bsHs 25
p -32 -476 100 0 1 setzo:bsEnc 13
p -32 -508 100 0 1 setzp:evHs 27
p -32 -540 100 0 1 setzq:evEnc 14
p -32 -572 100 0 1 setzr:wvHs 29
p -32 -604 100 0 1 setzs:wvEnc 15
p -32 -636 100 0 1 setzt:carStat 18
p -32 -668 100 0 1 setzu:carDmds 31
p -32 -848 100 0 1 setzz:galFlts 40
p 500 950 100 0 1 setpd0:dmPosDmd 22
p 500 930 100 0 1 setpd1:tsPosDmd 24
p 500 910 100 0 1 setpd2:bsPosDmd 26
p 500 890 100 0 1 setpd3:evPosDmd 28
p 500 870 100 0 1 setpd4:wvPosDmd 30
p 500 750 100 0 1 sethsb0:vnewpos 6
p 500 730 100 0 1 sethsb1:vdrvena 7
p 500 710 100 0 1 sethsb2:newpos 6
p 500 690 100 0 1 sethsb3:drvena 5
use eborderC 511 532 100 0 eborderC#1
xform 0 48 136
p 1048 -1012 100 1024 -1 author:Bob Wooff
p 1048 -1048 100 1024 -1 date:May 8, 1998
p 1444 -1044 80 768 -1 file:ecs.sch
p 1404 -892 150 256 -1 project:Gemini Telescopes
p 1216 -1016 100 0 0 revision:$Revision: 1.26 $
p 1396 -960 160 256 -1 title:Enclosure Control System
[comments]
