/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
atack = 100;
alarm_set(0,500);
ending = false;
start = true;
image_blend = c_red;

fglow = plus_instance_create_layer(x, y,"BottomLight",obj_light_lamp2);
fglow.image_blend = #D67C00;
fglow.image_initial_alpha = 0.2;
fglow.light_initial_radius = 6;

glow = plus_instance_create_layer(x, y,"Light",obj_light_soft_torch);
glow.image_blend = #FFAB1A;
glow.image_initial_alpha = 0.2;
glow.light_initial_radius = 2;