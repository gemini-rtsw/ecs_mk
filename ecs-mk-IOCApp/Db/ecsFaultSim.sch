[schematic2]
uniq 1
[tools]
[detail]
[cell use]
use eborderC -832 -601 100 0 eborderC#54
xform 0 848 704
p 1852 -444 100 1024 -1 author:W.N. Rambold
p 1848 -476 100 1024 -1 date:May 8, 1998
p 2248 -476 80 768 -1 file:ecsFaultSim.sch
p 2240 -448 100 0 0 page:
p 2352 -448 100 0 0 pages:
p 1968 -480 100 0 0 primitive:eborderC
p 2192 -324 150 256 -1 project:Enclosure Control System
p 2016 -448 100 0 0 revision:$Revision: 1.1.1.1 $
p 1968 -336 150 768 0 system:
p 2196 -388 200 256 -1 title:Motion Fault Sim
use ecsHeartbeat 1120 343 100 0 ecsHeartbeat#53
xform 0 1232 448
p 1120 320 100 0 1 setEhb:ecsHb $(e2cHb)
p 1120 288 100 0 1 setPhb:plcHb $(c2eHb)
use ecsAbWordWrite 224 983 100 0 ecsAbWordWrite#42
xform 0 336 1072
p 224 960 100 0 1 setWord:word $(tsFlts)
use ecsAbWordWrite 224 727 100 0 ecsAbWordWrite#43
xform 0 336 816
p 224 704 100 0 1 setWord:word $(bsFlts)
use ecsAbWordWrite 224 471 100 0 ecsAbWordWrite#44
xform 0 336 560
p 224 448 100 0 1 setWord:word $(dm1Flts)
use ecsAbWordWrite 224 215 100 0 ecsAbWordWrite#45
xform 0 336 304
p 224 192 100 0 1 setWord:word $(dm2Flts)
use ecsAbWordWrite 672 983 100 0 ecsAbWordWrite#47
xform 0 784 1072
p 672 960 100 0 1 setWord:word $(evFlts)
use ecsAbWordWrite 672 727 100 0 ecsAbWordWrite#48
xform 0 784 816
p 672 704 100 0 1 setWord:word $(wvFlts)
use ecsAbWordWrite 672 471 100 0 ecsAbWordWrite#49
xform 0 784 560
p 672 448 100 0 1 setWord:word $(swFlts)
use ecsAbWordWrite 672 215 100 0 ecsAbWordWrite#50
xform 0 784 304
p 672 192 100 0 1 setWord:word $(limFlts)
use ecsAbWordWrite 1120 983 100 0 ecsAbWordWrite#51
xform 0 1232 1072
p 1120 960 100 0 1 setWord:word $(encFlts)
[comments]
