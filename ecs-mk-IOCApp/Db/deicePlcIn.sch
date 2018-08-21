[schematic2]
uniq 2
[tools]
[detail]
w 932 1979 100 2 n#1 hwin.hwin#49.in 928 1984 928 1984 egenSub.egenSub#67.INPA
w 1400 1291 100 0 flnk egenSub.egenSub#67.FLNK 1216 1280 1632 1280 outhier.flnk.p
w 1320 1899 100 0 power egenSub.egenSub#67.VALC 1216 1888 1472 1888 1472 1824 1632 1824 outhier.power.p
w 1336 1963 100 0 skeys egenSub.egenSub#67.VALB 1216 1952 1504 1952 1504 1920 1632 1920 outhier.skeys.p
w 1400 2027 100 0 keys egenSub.egenSub#67.VALA 1216 2016 1632 2016 outhier.keys.p
[cell use]
use bb200tr 64 872 -100 0 frame
xform 0 1344 1696
use outhier 1600 1239 100 0 flnk
xform 0 1616 1280
use outhier 1600 1783 100 0 power
xform 0 1616 1824
use outhier 1600 1879 100 0 skeys
xform 0 1616 1920
use outhier 1600 1975 100 0 keys
xform 0 1616 2016
use egenSub 928 1223 100 0 egenSub#67
xform 0 1072 1648
p 1024 1984 100 0 1 FTA:LONG
p 1008 1824 100 0 1 FTVA:LONG
p 1008 1792 100 0 1 FTVB:STRING
p 1008 1760 100 0 1 FTVC:LONG
p 976 1152 100 0 1 SCAN:1 second
p 976 1184 100 0 1 SNAM:deicePlcInput
p 1040 1216 100 1024 -1 name:$(top)$(sys)plcIn
use hwin 736 1943 100 0 hwin#49
xform 0 832 1984
p 336 1984 100 0 -1 val(in):$(top)fault:word$(swFlts):word
[comments]
