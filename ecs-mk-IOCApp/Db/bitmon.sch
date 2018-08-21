[schematic2]
uniq 1
[tools]
[detail]
w -328 11 100 0 SLNK inhier.SLNK.P -352 0 -256 0 -256 96 -160 96 embbid.embbid#0.SLNK
w -274 139 100 0 INP inhier.INP.P -352 128 -160 128 embbid.embbid#0.INP
s 288 256 100 0 individual bits in a word using DM screens
s 288 288 100 0 This record is intended to monitor
s 698 -474 100 0 bitmon.sch
s 528 -384 150 0 Bit Monitor
s 218 -474 100 0 28/Jul/99
s 202 -436 100 0 Pedro Gigoux
s 416 -320 150 0 Enclosure Control System
[cell use]
use ba200tr -640 -600 -100 0 frame
xform 0 160 24
use inhier -368 -41 100 0 SLNK
xform 0 -352 0
use inhier -368 87 100 0 INP
xform 0 -352 128
use embbid -160 -281 100 0 embbid#0
xform 0 0 80
p -32 -256 100 1024 -1 name:$(top)$(rec)Bits
[comments]
