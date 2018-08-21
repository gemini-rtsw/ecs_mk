[schematic2]
uniq 1
[tools]
[detail]
s 1328 -336 100 0 Pedro Gigoux
s 1616 -288 150 0 Vent Status
s 1568 -224 130 0 Enclosure Control System
s 1344 -368 80 0 20/May/99
s 1840 -376 50 0 ventStat.sch
[cell use]
use ba200tr 480 -504 -100 0 frame
xform 0 1280 120
use abWordRead 1504 -25 100 0 abWordRead#1230
xform 0 1616 64
p 1504 -64 100 0 1 setAb:ab $(abC)
p 1504 -32 100 0 1 setWord:word $(lShell2)
use abWordRead 1504 231 100 0 abWordRead#1229
xform 0 1616 320
p 1504 192 100 0 1 setAb:ab $(abC)
p 1504 224 100 0 1 setWord:word $(lShell1)
use abWordRead 1152 -25 100 0 abWordRead#1228
xform 0 1264 64
p 1152 -64 100 0 1 setAb:ab $(abC)
p 1152 -32 100 0 1 setWord:word $(rVent2)
use abWordRead 1152 231 100 0 abWordRead#1225
xform 0 1264 320
p 1152 192 100 0 1 setAb:ab $(abC)
p 1152 224 100 0 1 setWord:word $(rVent1)
use abWordRead 800 -25 100 0 abWordRead#1224
xform 0 912 64
p 800 -64 100 0 1 setAb:ab $(abC)
p 800 -32 100 0 1 setWord:word $(pVent2)
use abWordRead 800 231 100 0 abWordRead#1107
xform 0 912 320
p 800 192 100 0 1 setAb:ab $(abC)
p 800 224 100 0 1 setWord:word $(pVent1)
[comments]
