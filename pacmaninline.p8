pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
#include utilities.lua
#include main.lua
#include object.lua

#include scenes/game.lua
#include scenes/title.lua
#include scenes/game_over.lua

#include entities/pac.lua
#include entities/enemies/red.lua
#include entities/enemies/pinky.lua
#include entities/pill.lua
#include entities/magicpill.lua
#include entities/empty.lua
#include entities/pattern.lua
#include entities/level.lua
#include entities/road.lua
__gfx__
0000000000aaa00000aaaa0000000000000000000088880000888800000000000000000000000000000000000000000000000000000000000000000000000000
000000000aaaaa000aaaaaa000aaaa000a0000a00888888008888880000000000000000000000000000000000000000000000000000000000000000000000000
00700700aaaa0aa0aaaa0a000aaaaaa0aaa000aa8778877887788778000000000000000000000000000000000000000000000000000000000000000000000000
00077000aaaaaaa0aaaaa000aa0aaaaaaa0a0aaa8078807880788078000000000000000000000000000000000000000000000000000000000000000000000000
00077000aaaaaaa0aaaa0000aaaaaaaaaaaaaaaa8888888888888888000000000000000000000000000000000000000000000000000000000000000000000000
00700700aaaaaaa0aaaaa000aaaaaaaaaaaaaaaa8888888888888888000000000000000000000000000000000000000000000000000000000000000000000000
000000000aaaaa000aaaaaa00aaaaaa00aaaaaa08888888888888888000000000000000000000000000000000aa0000000000000000000000000000000000000
0000000000aaa00000aaaa0000aaaa0000aaaa00080808088080808000000000000aaaaaaaaaaaa0000000000aa000000000000000000aa00000000000000000
000000001111111100000000000000000000000000eeee0000eeee0000000000000aaaaaaaaaaaaa0000000aaaaa000000000000000aaaa00000000000000000
00000000000000000000000000000000000000000eeeeee00eeeeee000000000000aa000000000aa0000000aa0aa0000000000000aaaaa000000000000000000
0000000011111111000000000006600000000000e77ee77ee77ee77e00000000000aa000000000aa0000000aa0aaa0000000000aaaaaa0000000000000000000
0000000000000000000660000066660000000000e07ee07ee07ee07e00000000000aa000000000aaa000000aa0aaa0000000aaaaaa0000000000000000000000
0000000000000000000660000066660000000000eeeeeeeeeeeeeeee00000000000aa0000000000aa000000aa00aaa000000aaaa000000000000000000000000
1111111100000000000000000006600000000000eeeeeeeeeeeeeeee00000000000aa0000000000aa00000aaa00aaa000000aa00000000000000000000000000
0000000000000000000000000000000000000000eeeeeeeeeeeeeeee00000000000aa0aaaaaaaaaaa00000aa0000aaa00000aa00000000000000000000000000
11111111000000000000000000000000000000000e0e0e0ee0e0e0e000000000000aaaaaaaaaaaaaa0000aaa0000aaaa0000aaa0000000000000000000000000
00cccc0000cccc0000000000000000000000000000eeee0000eeee0000000000000aaaaa0000000aa0000aaaaaaaaaaaaa000aa0000000000000000000000000
0cccccc00cccccc00000000000000000000000000eeeeee00eeeeee000000000000aaa00000000000000aaaaaaaaaaaaaa000aa0000000000000000000000000
cc7cc7cccc7cc7cc000000000000000000000000e07ee07ee07ee07e00000000000aaa00000000000000aa000000000aa0000aa0000000000000000000000000
cccccccccccccccc000000000000000000000000e77ee77ee77ee77e000000000000aa0000000000000aaa000000000aa0000aaa000000000000000000000000
cccccccccccccccc000000000000000000000000eeeeeeeeeeeeeeee000000000000aa000000000000aaa0000000000aaa0000aa000000000000000000000000
cc7c7c7ccc7c7c7c000000000000000000000000eeeeeeeeeeeeeeee000000000000aa000000000000aaa00000000000aa0000aa000000000000000000000000
c7c7c7ccc7c7c7cc000000000000000000000000eeeeeeeeeeeeeeee000000000000aa00000000000aaa000000000000aa0000aa000000000000000000000000
0c0c0c0cc0c0c0c00000000000000000000000000e0e0e0ee0e0e0e00000000000000000000000000aa0000000000000aa0000aa000000aaa000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000aa0000000000000000000aaaaaaaaaaa000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000aaaaaaaaa00000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000aaaa00000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000aaaaaaaaaaaaaaaaaaaa00aaa000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000aaaaaaaaaaaaaaaaa0aa00aaa0000000000000aa000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000aa00000000000000aaa000000000000aa000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000aa00000000000000aaaa0000000000aaa000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000aa00000000000000aaaaa000000000aa0000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000aaa0000000000000aaaaaa0000000aaa0000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000aaa0000000000000aa0aaaa000000aa00000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000aa0000000000000aa000aaaa000aaa00000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000aa000000aaa0000aa000aaaaa0aaa000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000aaaaaaaaaaa0000aa00000aaaaaaa000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000aaaaaaaaaaaaaaaa00000aa000000aaaaa0000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000aaaaaaaaa000000000000aa00000000aaa0000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000aa0000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000aa0000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000aa0000000000000000000000aa0000000000000000000aaaaa0000000000000
0000000000000000000000000000000000000000000000000000000000000000aaa0000000000000000000000aaa0000000aa0000aaaaaaaaaa0000000000000
0000000000000000000000000000000000000000000000000000000000000000aa00000000000000000aa0000aaaa000000aa0000aaaaaaa0000000000000000
000000000000000000000000000000000000000000000000000000000000000aaa0000000000000000aaa0000aaaa000000aa0000aaaa0000000000000000000
000000000000000000000000000000000000000000000000000000000000000aaa0000000000000000aaa0000aaaaa00000aa0000aa000000000000000000000
00000000000000000000000000000000000000000000000000000000000000aaa0000000000000000aaa00000aaaaa00000aa0000aa0000000aaa00000000000
0000000000000000000000000000000000000000000000000000000000000aaa0000000000000000aaa00000aaa0aaa0000aa0000aaa0000aaaaa00000000000
0000000000000000000000000000000000000000000000000000000000000aaa000000000000000aaa000000aaa0aaaa000aa00000aa0aaaaaaa000000000000
0000000000000000000000000000000000000000000000000000000000000aaaa0000000000000aaaa000000aa000aaaa00aa00000aaaaaaa000000000000000
0000000000000000000000000000000000000000000000000000000000000aaaaaaaaaaaa0000aaaa0000000aa0000aaaa0aa00000aaaaa00000000000000000
0000000000000000000000000000000000000000000000000000000000000aaaaaaaaaaaa000aaaa0000000aaa00000aaaaaa00000aaa0000000000000000000
0000000000000000000000000000000000000000000000000000000000000aaaaaaaaaaaa000aaa00000000aaa000000aaaaa00000aa00000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000aa0000a0000000000000000000aaaa0000aaa00000aaa000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000aaa0000aaa00aaaaaa000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000aa0000aaaaaaaaaa0000000000000
__map__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
0003000a06030080300a0300d030100301303014030170301e0302003006500075000850000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000400001c520145201c520107001a000050000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00060000210501d0501905014050100500b0500705003050000500c00007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000400001b520185201b5201d5302054022550235002e200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000400000c0500c0500c0500c0500c050140501705019050000000000000000000000000000000000000000000000000003000000000000000000000000000000000000000000000000000000000000000000000
