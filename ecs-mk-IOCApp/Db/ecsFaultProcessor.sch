[schematic2]
uniq 33
[tools]
[detail]
w 2316 -533 100 0 n#1 egenSub.monitor.VALA 2720 -672 2816 -672 2816 -544 1888 -544 1888 160 2144 160 egenSubD.analyze.INPJ
w 1756 203 100 0 n#2 abWordRead.abWordRead#798.wordOut 1152 -1344 1440 -1344 1440 192 2144 192 egenSubD.analyze.INPI
w 1740 235 100 0 n#3 abWordRead.abWordRead#797.wordOut 1152 -1088 1408 -1088 1408 224 2144 224 egenSubD.analyze.INPH
w 1724 267 100 0 n#4 abWordRead.abWordRead#796.wordOut 1152 -832 1376 -832 1376 256 2144 256 egenSubD.analyze.INPG
w 1708 299 100 0 n#5 abWordRead.abWordRead#795.wordOut 1152 -576 1344 -576 1344 288 2144 288 egenSubD.analyze.INPF
w 1692 331 100 0 n#6 abWordRead.abWordRead#794.wordOut 1152 -320 1312 -320 1312 320 2144 320 egenSubD.analyze.INPE
w 1676 363 100 0 n#7 abWordRead.abWordRead#793.wordOut 1152 -64 1280 -64 1280 352 2144 352 egenSubD.analyze.INPD
w 1660 395 100 0 n#8 abWordRead.abWordRead#792.wordOut 1152 192 1248 192 1248 384 2144 384 egenSubD.analyze.INPC
w 1468 459 100 0 n#9 abWordRead.abWordRead#791.wordOut 1152 448 1856 448 1856 416 2144 416 egenSubD.analyze.INPB
w 1500 683 100 0 n#10 abWordRead.abWordRead#790.wordOut 1152 672 1920 672 1920 448 2144 448 egenSubD.analyze.INPA
w 2770 523 100 0 n#11 egenSubD.analyze.VALB 2432 384 2656 384 2656 512 2944 512 elongouts.domeBlock.SDIS
w 3298 -245 100 0 n#12 elongouts.bshBlock.OUT 3200 -256 3456 -256 outhier.bshFault.p
w 3298 -53 100 0 n#13 elongouts.tshBlock.OUT 3200 -64 3456 -64 outhier.tshFault.p
w 3298 139 100 0 n#14 elongouts.wvgBlock.OUT 3200 128 3456 128 outhier.wvgFault.p
w 3298 331 100 0 n#15 elongouts.evgBlock.OUT 3200 320 3456 320 outhier.evgFault.p
w 3298 523 100 0 n#16 elongouts.domeBlock.OUT 3200 512 3456 512 outhier.domeFault.p
w 2738 -253 100 0 n#17 egenSubD.analyze.VALJ 2432 -128 2592 -128 2592 -256 2944 -256 elongouts.bshBlock.SDIS
w 2770 -221 100 0 n#18 egenSubD.analyze.OUTI 2432 -96 2656 -96 2656 -224 2944 -224 elongouts.bshBlock.SLNK
w 2546 3 100 0 n#19 egenSubD.analyze.VALH 2432 0 2720 0 2720 -64 2944 -64 elongouts.tshBlock.SDIS
w 2578 35 100 0 n#20 egenSubD.analyze.OUTG 2432 32 2784 32 2784 -32 2944 -32 elongouts.tshBlock.SLNK
w 2658 131 100 0 n#21 egenSubD.analyze.VALF 2432 128 2944 128 elongouts.wvgBlock.SDIS
w 2658 163 100 0 n#22 egenSubD.analyze.OUTE 2432 160 2944 160 elongouts.wvgBlock.SLNK
w 2578 259 100 0 n#23 egenSubD.analyze.VALD 2432 256 2784 256 2784 320 2944 320 elongouts.evgBlock.SDIS
w 2546 291 100 0 n#24 egenSubD.analyze.OUTC 2432 288 2720 288 2720 352 2944 352 elongouts.evgBlock.SLNK
w 2738 547 100 0 n#25 egenSubD.analyze.OUTA 2432 416 2592 416 2592 544 2944 544 elongouts.domeBlock.SLNK
w 2876 -949 100 0 n#26 egenSub.monitor.FLNK 2720 -1408 2880 -1408 2880 -480 1952 -480 1952 -256 2144 -256 egenSubD.analyze.SLNK
w 2834 -789 100 0 n#27 egenSub.monitor.VALC 2720 -800 3008 -800 eaos.ecsHeartbeat.DOL
w 2994 -725 100 0 n#28 outhier.cardiacArrest.p 3328 -736 2720 -736 egenSub.monitor.VALB
w 2130 -853 100 0 n#29 inhier.Interlock.P 2016 -864 2304 -864 2304 -768 2432 -768 egenSub.monitor.INPB
w 2338 -693 100 0 n#30 eais.plcHeartbeat.VAL 2304 -704 2432 -704 egenSub.monitor.INPA
w 2018 -645 100 0 n#31 hwin.hwin#817.in 2048 -656 2048 -656 eais.plcHeartbeat.INP
w 3266 -853 100 0 n#32 eaos.ecsHeartbeat.OUT 3264 -864 3328 -864 hwout.hwout#749.outp
[cell use]
use ecsFaultReset 1760 -1401 100 0 ecsFaultReset#1016
xform 0 1920 -1312
p 1792 -1408 100 0 1 setWord:word $(galFlts)
use abWordRead 1792 -1113 100 0 abWordRead#1013
xform 0 1904 -1024
p 1792 -1152 100 0 1 setAb:
p 1792 -1120 100 0 1 setWord:word $(galFlts)
use abWordRead 928 -1433 100 0 abWordRead#798
xform 0 1040 -1344
p 928 -1472 100 0 1 setAb:
p 928 -1440 100 0 1 setWord:word $(encFlts)
use abWordRead 928 -1177 100 0 abWordRead#797
xform 0 1040 -1088
p 928 -1216 100 0 1 setAb:
p 928 -1184 100 0 1 setWord:word $(limFlts)
use abWordRead 928 -921 100 0 abWordRead#796
xform 0 1040 -832
p 928 -960 100 0 1 setAb:
p 928 -928 100 0 1 setWord:word $(swFlts)
use abWordRead 928 -665 100 0 abWordRead#795
xform 0 1040 -576
p 928 -704 100 0 1 setAb:
p 928 -672 100 0 1 setWord:word $(wvFlts)
use abWordRead 928 -409 100 0 abWordRead#794
xform 0 1040 -320
p 928 -448 100 0 1 setAb:
p 928 -416 100 0 1 setWord:word $(evFlts)
use abWordRead 928 -153 100 0 abWordRead#793
xform 0 1040 -64
p 928 -192 100 0 1 setAb:
p 928 -160 100 0 1 setWord:word $(dm2Flts)
use abWordRead 928 103 100 0 abWordRead#792
xform 0 1040 192
p 928 64 100 0 1 setAb:
p 928 96 100 0 1 setWord:word $(dm1Flts)
use abWordRead 928 359 100 0 abWordRead#791
xform 0 1040 448
p 928 320 100 0 1 setAb:
p 928 352 100 0 1 setWord:word $(bsFlts)
use abWordRead 928 583 100 0 abWordRead#790
xform 0 1040 672
p 928 544 100 0 1 setAb:
p 928 576 100 0 1 setWord:word $(tsFlts)
use egenSubD 2144 -345 100 0 analyze
xform 0 2288 80
p 1921 -571 100 0 0 FTA:LONG
p 1921 -571 100 0 0 FTB:LONG
p 1921 -603 100 0 0 FTC:LONG
p 1921 -635 100 0 0 FTD:LONG
p 1921 -667 100 0 0 FTE:LONG
p 1921 -731 100 0 0 FTF:LONG
p 1921 -731 100 0 0 FTG:LONG
p 1921 -763 100 0 0 FTH:LONG
p 1921 -795 100 0 0 FTI:LONG
p 1921 -827 100 0 0 FTJ:LONG
p 1921 -571 100 0 0 FTK:LONG
p 1921 -571 100 0 0 FTL:LONG
p 1921 -603 100 0 0 FTM:LONG
p 1921 -635 100 0 0 FTN:LONG
p 1921 -667 100 0 0 FTO:LONG
p 1921 -571 100 0 0 FTVA:LONG
p 1921 -571 100 0 0 FTVB:LONG
p 1921 -603 100 0 0 FTVC:LONG
p 1921 -635 100 0 0 FTVD:LONG
p 1921 -667 100 0 0 FTVE:LONG
p 1921 -731 100 0 0 FTVF:LONG
p 1921 -731 100 0 0 FTVG:LONG
p 1921 -763 100 0 0 FTVH:LONG
p 1921 -795 100 0 0 FTVI:LONG
p 1921 -827 100 0 0 FTVJ:LONG
p 1856 62 100 0 0 INAM:ecsFaultInit
p 1941 -1231 100 0 0 PV:$(top)$(dev)
p 1856 30 100 0 0 SNAM:ecsFaultProcess
p 2432 426 75 0 -1 pproc(OUTA):PP
p 2432 298 75 0 -1 pproc(OUTC):PP
p 2432 170 75 0 -1 pproc(OUTE):PP
p 2432 42 75 0 -1 pproc(OUTG):PP
p 2432 -86 75 0 -1 pproc(OUTI):PP
use eborderC 608 -1689 100 0 eborderC#1001
xform 0 2288 -384
p 3292 -1532 100 1024 -1 author:W.N. Rambold
p 3288 -1564 100 1024 -1 date:May 8, 1998
p 3688 -1564 80 768 -1 file:ecsFaultProcessor.sch
p 3680 -1536 100 0 0 page:
p 3792 -1536 100 0 0 pages:
p 3408 -1568 100 0 0 primitive:eborderC
p 3632 -1412 150 256 -1 project:Enclosure Control System
p 3456 -1536 100 0 0 revision:$Revision: 1.4 $
p 3408 -1424 150 768 0 system:
p 3636 -1476 200 256 -1 title:Motion Faults
use elongouts 2944 455 100 0 domeBlock
xform 0 3072 544
p 2784 462 100 0 0 OMSL:supervisory
p 2804 136 100 0 0 PV:$(top)$(dev)
p 3200 512 75 768 -1 pproc(OUT):PP
use elongouts 2944 263 100 0 evgBlock
xform 0 3072 352
p 2784 270 100 0 0 OMSL:supervisory
p 2804 -56 100 0 0 PV:$(top)$(dev)
p 3200 320 75 768 -1 pproc(OUT):PP
use elongouts 2944 71 100 0 wvgBlock
xform 0 3072 160
p 2804 -248 100 0 0 PV:$(top)$(dev)
p 3200 128 75 768 -1 pproc(OUT):PP
use elongouts 2944 -121 100 0 tshBlock
xform 0 3072 -32
p 2784 -114 100 0 0 OMSL:supervisory
p 2804 -440 100 0 0 PV:$(top)$(dev)
p 3200 -64 75 768 -1 pproc(OUT):PP
use elongouts 2944 -313 100 0 bshBlock
xform 0 3072 -224
p 2784 -306 100 0 0 OMSL:supervisory
p 2804 -632 100 0 0 PV:$(top)$(dev)
p 3200 -256 75 768 -1 pproc(OUT):PP
use inhier 1856 -864 100 0 Interlock
xform 0 2016 -864
use egenSub 2432 -1465 100 0 monitor
xform 0 2576 -1040
p 2209 -1691 100 0 0 FTA:LONG
p 2209 -1691 100 0 0 FTB:LONG
p 2209 -1691 100 0 0 FTVA:LONG
p 2209 -1691 100 0 0 FTVB:LONG
p 2209 -1723 100 0 0 FTVC:LONG
p 2144 -1058 100 0 0 INAM:ecsFaultHbInit
p 2496 -608 100 0 1 PV:$(top)$(dev)
p 2144 -770 100 0 0 SCAN:.5 second
p 2144 -1090 100 0 0 SNAM:ecsFaultHbProcess
use hwin 1856 -697 100 0 hwin#817
xform 0 1952 -656
p 1840 -624 100 0 -1 val(in):@$(ab) $(c2eHb)
use eais 2048 -761 100 0 plcHeartbeat
xform 0 2176 -688
p 1934 -568 100 0 0 DTYP:AB DF1 serial
p 1792 -818 100 0 0 LINR:NO CONVERSION
p 1812 -1304 100 0 0 PV:$(top)$(dev)
p 1792 -690 100 0 0 SCAN:.5 second
use outhier 3520 -256 100 0 bshFault
xform 0 3440 -256
use outhier 3520 -64 100 0 tshFault
xform 0 3440 -64
use outhier 3520 128 100 0 wvgFault
xform 0 3440 128
use outhier 3520 320 100 0 evgFault
xform 0 3440 320
use outhier 3520 512 100 0 domeFault
xform 0 3440 512
use outhier 3392 -736 100 0 cardiacArrest
xform 0 3312 -736
use hwout 3328 -905 100 0 hwout#749
xform 0 3424 -864
p 3440 -928 100 0 -1 val(outp):@$(ab) $(e2cHb)
use eaos 3008 -921 100 0 ecsHeartbeat
xform 0 3136 -832
p 2895 -598 100 0 0 DTYP:AB DF1 serial
p 2752 -850 100 0 0 OMSL:closed_loop
p 2772 -1414 100 0 0 PV:$(top)$(dev)
p 2752 -722 100 0 0 SCAN:1 second
[comments]
