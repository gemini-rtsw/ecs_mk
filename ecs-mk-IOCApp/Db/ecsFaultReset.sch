[schematic2]
uniq 16
[tools]
[detail]
w 1580 -85 100 0 n#1 eseqs.bsReset.LNK1 1504 -96 1728 -96 hwout.hwout#1064.outp
w 1516 -117 100 0 n#1 eseqs.bsReset.LNK2 1504 -128 1600 -128 1600 -96 junction
w 3116 299 100 0 n#2 eseqs.egReset.LNK2 3104 288 3200 288 3200 320 junction
w 3180 331 100 0 n#2 eseqs.egReset.LNK1 3104 320 3328 320 hwout.hwout#1067.outp
w 3116 -405 100 0 n#3 eseqs.wgReset.LNK2 3104 -416 3200 -416 3200 -384 junction
w 3180 -373 100 0 n#3 eseqs.wgReset.LNK1 3104 -384 3328 -384 hwout.hwout#1066.outp
w 1516 -789 100 0 n#4 eseqs.dmReset.LNK2 1504 -800 1600 -800 1600 -768 junction
w 1580 -757 100 0 n#4 eseqs.dmReset.LNK1 1504 -768 1728 -768 hwout.hwout#1065.outp
w 2788 -389 100 2 n#5 hwin.hwin#1062.in 2784 -384 2784 -384 eseqs.wgReset.DOL1
w 2788 -421 100 2 n#6 hwin.hwin#1060.in 2784 -416 2784 -416 eseqs.wgReset.DOL2
w 2788 283 100 2 n#7 eseqs.egReset.DOL2 2784 288 2784 288 hwin.hwin#1047.in
w 2788 315 100 2 n#8 eseqs.egReset.DOL1 2784 320 2784 320 hwin.hwin#1045.in
w 1188 -773 100 2 n#9 hwin.hwin#1042.in 1184 -768 1184 -768 eseqs.dmReset.DOL1
w 1188 -805 100 2 n#10 hwin.hwin#1040.in 1184 -800 1184 -800 eseqs.dmReset.DOL2
w 1188 -133 100 2 n#11 eseqs.bsReset.DOL2 1184 -128 1184 -128 hwin.hwin#1027.in
w 1188 -101 100 2 n#12 eseqs.bsReset.DOL1 1184 -96 1184 -96 hwin.hwin#1025.in
w 1580 555 100 0 n#13 eseqs.tsReset.LNK1 1504 544 1728 544 hwout.hwout#1022.outp
w 1516 523 100 0 n#13 eseqs.tsReset.LNK2 1504 512 1600 512 1600 544 junction
w 1188 507 100 2 n#14 hwin.hwin#1018.in 1184 512 1184 512 eseqs.tsReset.DOL2
w 1188 539 100 2 n#15 hwin.hwin#1016.in 1184 544 1184 544 eseqs.tsReset.DOL1
[cell use]
use ecsAbWordWrite 2496 -1145 100 0 ecsAbWordWrite#1069
xform 0 2608 -1040
p 2496 -1152 100 0 1 setWord:word $(word)
use hwout 1728 503 100 0 hwout#1022
xform 0 1824 544
p 1808 496 100 0 -1 val(outp):$(top)$(dev)$(word):bit5 PP NMS
use hwout 1728 -137 100 0 hwout#1064
xform 0 1824 -96
p 1808 -144 100 0 -1 val(outp):$(top)$(dev)$(word):bit6 PP NMS
use hwout 1728 -809 100 0 hwout#1065
xform 0 1824 -768
p 1808 -816 100 0 -1 val(outp):$(top)$(dev)$(word):bit7 PP NMS
use hwout 3328 -425 100 0 hwout#1066
xform 0 3424 -384
p 3408 -432 100 0 -1 val(outp):$(top)$(dev)$(word):bit9 PP NMS
use hwout 3328 279 100 0 hwout#1067
xform 0 3424 320
p 3408 272 100 0 -1 val(outp):$(top)$(dev)$(word):bit8 PP NMS
use eseqs 1328 624 100 0 tsReset
xform 0 1344 384
p 800 -1796 100 0 0 DLY2:1.0e+00
p 1152 624 100 0 -1 PV:$(top)$(dev)
use eseqs 1328 -16 100 0 bsReset
xform 0 1344 -256
p 800 -2436 100 0 0 DLY2:1.0e+00
p 1152 -16 100 0 -1 PV:$(top)$(dev)
use eseqs 1328 -688 100 0 dmReset
xform 0 1344 -928
p 800 -3108 100 0 0 DLY2:1.0e+00
p 1152 -688 100 0 -1 PV:$(top)$(dev)
use eseqs 2928 400 100 0 egReset
xform 0 2944 160
p 2400 -2020 100 0 0 DLY2:1.0e+00
p 2752 400 100 0 -1 PV:$(top)$(dev)
use eseqs 2928 -304 100 0 wgReset
xform 0 2944 -544
p 2400 -2724 100 0 0 DLY2:1.0e+00
p 2752 -304 100 0 -1 PV:$(top)$(dev)
use hwin 992 503 100 0 hwin#1016
xform 0 1088 544
p 995 536 100 0 -1 val(in):1
use hwin 992 471 100 0 hwin#1018
xform 0 1088 512
p 995 504 100 0 -1 val(in):0
use hwin 992 -137 100 0 hwin#1025
xform 0 1088 -96
p 995 -104 100 0 -1 val(in):1
use hwin 992 -169 100 0 hwin#1027
xform 0 1088 -128
p 995 -136 100 0 -1 val(in):0
use hwin 992 -841 100 0 hwin#1040
xform 0 1088 -800
p 995 -808 100 0 -1 val(in):0
use hwin 992 -809 100 0 hwin#1042
xform 0 1088 -768
p 995 -776 100 0 -1 val(in):1
use hwin 2592 279 100 0 hwin#1045
xform 0 2688 320
p 2595 312 100 0 -1 val(in):1
use hwin 2592 247 100 0 hwin#1047
xform 0 2688 288
p 2595 280 100 0 -1 val(in):0
use hwin 2592 -457 100 0 hwin#1060
xform 0 2688 -416
p 2595 -424 100 0 -1 val(in):0
use hwin 2592 -425 100 0 hwin#1062
xform 0 2688 -384
p 2595 -392 100 0 -1 val(in):1
use eborderC 608 -1689 100 0 eborderC#1001
xform 0 2288 -384
p 3292 -1532 100 1024 -1 author:A.W. Ebbers
p 3288 -1564 100 1024 -1 date:Dec 13, 2004
p 3688 -1564 80 768 -1 file:ecsFaultReset.sch
p 3680 -1536 100 0 0 page:
p 3792 -1536 100 0 0 pages:
p 3408 -1568 100 0 0 primitive:eborderC
p 3632 -1412 150 256 -1 project:Enclosure Control System
p 3456 -1536 100 0 0 revision:$Revision: 1.1 $
p 3408 -1424 150 768 0 system:
p 3636 -1476 200 256 -1 title:Reset Motion Faults
[comments]
