/// @description Insert description here
//x = window_get_width()/2 - sprite_get_width(self.sprite_index)/2;
//y = window_get_height()/2 - sprite_get_height(self.sprite_index)/2;
//x = global.player.x;
//y = global.player.y;
//ww = window_get_width() / 64 + 1;
//wh = window_get_height() / 64 + 1;

ww = room_width;
wh = room_height;
x = 0
y = 0
fading = true;
delta = 0.01;
fadeeffect = 0;
timer = 10;
image_alpha = 0;
image_xscale = ww*2;
image_yscale = wh*2;
depth = global.intern.depths.over;

// You can write your code in this editor