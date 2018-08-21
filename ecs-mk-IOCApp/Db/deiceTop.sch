[schematic2]
uniq 5
[tools]
[detail]
w -604 -229 100 2 n#1 hwin.hwin#11.in -608 -224 -608 -224 eaos.eaos#6.DOL
w -290 -213 100 0 n#2 eaos.eaos#6.FLNK -352 -224 -192 -224 embbids.embbids#7.SLNK
w -290 -245 100 0 n#3 eaos.eaos#6.VAL -352 -256 -192 -256 embbids.embbids#7.INP
w -604 59 100 2 n#4 hwin.hwin#4.in -608 64 -608 64 elongouts.elongouts#3.DOL
s -624 -176 100 0 Software faults (word6)
s -560 112 100 0 Debug Level
s -560 336 100 0 Dome position
[cell use]
use hwin -800 -265 100 0 hwin#11
xform 0 -704 -224
p -797 -232 100 0 -1 val(in):1
use eaos -608 -345 100 0 eaos#6
xform 0 -480 -256
p -864 -274 100 0 0 OMSL:closed_loop
p -544 -368 100 0 1 PINI:YES
p -496 -352 100 1024 -1 name:pg:fault:word6:word
use eaos -608 167 100 0 eaos#10
xform 0 -480 256
p -496 160 100 1024 -1 name:pg:domePos
use embbids -192 -39 100 0 embbids#7
xform 6 -32 -208
p -96 -368 100 1024 -1 name:pg:fault:word6:bits
use hwin -800 23 100 0 hwin#4
xform 0 -704 64
p -797 56 100 0 -1 val(in):1
use elongouts -608 -57 100 0 elongouts#3
xform 0 -480 32
p -768 -50 100 0 0 OMSL:closed_loop
p -544 -96 100 0 1 PINI:YES
p -496 -64 100 1024 -1 name:pg:debugL
use deiceDome -64 327 100 0 deiceDome#0
xform 0 128 464
p -64 320 100 0 1 seta:top pg:
p -64 256 100 0 1 setab:abC 41
p 32 416 100 0 1 setd:sys di:
p 192 320 100 0 1 setp1:diPcu2Ena 7 2
p 192 288 100 0 1 setp2:diPower 7 3
p 192 256 100 0 1 setp3:diCWEna 7 3
p 192 224 100 0 1 setp4:diCCWEna 7 3
p 192 192 100 0 1 setp5:swFlts 6
[comments]
