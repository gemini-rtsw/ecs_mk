[schematic2]
uniq 4
[tools]
[detail]
w 528 259 100 0 n#1 ecad2.ecad2#510.STLK 352 256 704 256 outhier.domeFlnk.p
w 528 515 100 0 n#2 ecad2.ecad2#510.OUTA 352 512 704 512 outhier.domeStop.p
w -80 515 100 0 n#3 hwin.hwin#343.in -192 512 32 512 ecad2.ecad2#510.INPA
s 960 352 100 0 dome CAD inputs:
s 960 320 100 0 A: current debug level
s 960 256 100 0 dome CAD outputs:
s 960 224 100 0 A: validated dome demand state
[cell use]
use bb200tr -760 -320 100 0 bb200tr#512
xform 0 520 480
use ecad2 32 167 100 0 ecad2#510
xform 0 192 480
p 288 512 100 512 1 FTVA:LONG
p 192 352 100 256 1 PREC:2
p 208 416 80 256 1 SNAM:stopDomeCad
p 208 784 100 1024 -1 name:$(top)stopDome
use outhier 672 215 100 0 domeFlnk
xform 0 688 256
use outhier 672 471 100 0 domeStop
xform 0 688 512
use hwin -384 471 100 0 hwin#343
xform 0 -288 512
p -384 496 100 512 -1 val(in):$(top)debugL
[comments]
