[schematic2]
uniq 1
[tools]
[detail]
s 1520 -160 100 0 Enclosure Control System
s 1520 -224 100 0 Vent Gate Drive Currents
s 1264 -275 100 0 Pedro Gigoux
s 1283 -309 100 0 19/Dec/02
[cell use]
use bb200tr -544 -440 -100 0 frame
xform 0 736 384
use abWordGetScale -192 807 100 0 abWordGetScale#13
xform 0 -80 896
p -192 768 100 0 1 setAb:ab $(abC)
p -192 704 100 0 1 setCalc:calc $(calc)
p -192 736 100 0 1 setDev:dev ev4x
p -192 800 100 0 1 setWord:word $(evg4x)
use abWordGetScale 192 807 100 0 abWordGetScale#14
xform 0 304 896
p 192 768 100 0 1 setAb:ab $(abC)
p 192 704 100 0 1 setCalc:calc $(calc)
p 192 736 100 0 1 setDev:dev ev4y
p 192 800 100 0 1 setWord:word $(evg4y)
use abWordGetScale 576 807 100 0 abWordGetScale#15
xform 0 688 896
p 576 768 100 0 1 setAb:ab $(abC)
p 576 704 100 0 1 setCalc:calc $(calc)
p 576 736 100 0 1 setDev:dev ev4z
p 576 800 100 0 1 setWord:word $(evg4z)
use abWordGetScale 960 807 100 0 abWordGetScale#16
xform 0 1072 896
p 960 768 100 0 1 setAb:ab $(abC)
p 960 704 100 0 1 setCalc:calc $(calc)
p 960 736 100 0 1 setDev:dev ev4w
p 960 800 100 0 1 setWord:word $(evg4w)
use abWordGetScale -192 455 100 0 abWordGetScale#17
xform 0 -80 544
p -192 416 100 0 1 setAb:ab $(abC)
p -192 352 100 0 1 setCalc:calc $(calc)
p -192 384 100 0 1 setDev:dev wv5x
p -192 448 100 0 1 setWord:word $(wvg5x)
use abWordGetScale 192 455 100 0 abWordGetScale#18
xform 0 304 544
p 192 416 100 0 1 setAb:ab $(abC)
p 192 352 100 0 1 setCalc:calc $(calc)
p 192 384 100 0 1 setDev:dev wv5y
p 192 448 100 0 1 setWord:word $(wvg5y)
use abWordGetScale 576 455 100 0 abWordGetScale#19
xform 0 688 544
p 576 416 100 0 1 setAb:ab $(abC)
p 576 352 100 0 1 setCalc:calc $(calc)
p 576 384 100 0 1 setDev:dev wv5z
p 576 448 100 0 1 setWord:word $(wvg5z)
use abWordGetScale 960 455 100 0 abWordGetScale#20
xform 0 1072 544
p 960 416 100 0 1 setAb:ab $(abC)
p 960 352 100 0 1 setCalc:calc $(calc)
p 960 384 100 0 1 setDev:dev wv5w
p 960 448 100 0 1 setWord:word $(wvg5w)
[comments]
