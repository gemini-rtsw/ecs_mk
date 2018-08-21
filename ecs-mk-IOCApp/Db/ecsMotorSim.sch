[schematic2]
uniq 1
[tools]
[detail]
[cell use]
use eborderC -896 -569 100 0 eborderC#43
xform 0 784 736
p 1788 -412 100 1024 -1 author:W.N. Rambold
p 1784 -444 100 1024 -1 date:May 8, 1998
p 2184 -444 80 768 -1 file:ecsMotorSim.sch
p 2176 -416 100 0 0 page:
p 2288 -416 100 0 0 pages:
p 1904 -448 100 0 0 primitive:eborderC
p 2128 -292 150 256 -1 project:Enclosure Control System
p 1952 -416 100 0 0 revision:$Revision: 1.1.1.1 $
p 1904 -304 150 768 0 system:
p 2132 -356 200 256 -1 title:Motion Simulator
use ecsFaultSim 448 135 100 0 ecsFaultSim#42
xform 0 656 384
p 544 192 100 0 1 setAb:ab $(abC)
p 544 224 100 0 1 setDev:dev faultS
p 544 256 100 0 1 setTop:top $(top)
use ecsPosDeviceSim 1632 871 100 0 ecsPosDeviceSim#27
xform 0 1744 976
p 1632 736 100 0 1 setEword:eword $(abC) $(bsEnc)
p 1632 800 100 0 1 setHword:hword $(abC) $(bsHs)
p 1632 768 100 0 1 setPword:pword $(abC) $(bsPosDmd)
p 1632 832 100 0 1 setTop:top ecs:bshSim:
use ecsPosDeviceSim 1184 871 100 0 ecsPosDeviceSim#26
xform 0 1296 976
p 1184 736 100 0 1 setEword:eword $(abC) $(tsEnc)
p 1184 800 100 0 1 setHword:hword $(abC) $(tsHs)
p 1184 768 100 0 1 setPword:pword $(abC) $(tsPosDmd)
p 1184 832 100 0 1 setTop:top ecs:tshSim:
use ecsPosDeviceSim 736 871 100 0 ecsPosDeviceSim#25
xform 0 848 976
p 736 736 100 0 1 setEword:eword $(abC) $(wvEnc)
p 736 800 100 0 1 setHword:hword $(abC) $(wvHs)
p 736 768 100 0 1 setPword:pword $(abC) $(wvPosDmd)
p 736 832 100 0 1 setTop:top ecs:wvgSim:
use ecsPosDeviceSim 288 871 100 0 ecsPosDeviceSim#24
xform 0 400 976
p 288 736 100 0 1 setEword:eword $(abC) $(evEnc)
p 288 800 100 0 1 setHword:hword $(abC) $(evHs)
p 288 768 100 0 1 setPword:pword $(abC) $(evPosDmd)
p 288 832 100 0 1 setTop:top ecs:evgSim:
use ecsPosVelDeviceSim -160 871 100 0 ecsPosVelDeviceSim#23
xform 0 -48 976
p -160 736 100 0 1 setEword:eword $(abC) $(dmEnc)
p -160 800 100 0 1 setHword:hword $(abC) $(dmHs)
p -160 768 100 0 1 setPword:pword $(abC) $(dmPosDmd)
p -160 832 100 0 1 setTop:top ecs:domeSim:
p -160 704 100 0 1 setVword:vword $(abC) $(dmVelDmd)
[comments]
