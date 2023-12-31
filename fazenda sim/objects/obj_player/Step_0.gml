depth = -(y+sprite_height/2);

var w, a, s, d, velh, velv;
w = keyboard_check(ord("W"));
a = keyboard_check(ord("A"));
s = keyboard_check(ord("S"));
d = keyboard_check(ord("D"));
velh = (d-a)*vl;
velv = (s-w)*vl;

vlh = lerp(vlh, velh, .3);
vlv = lerp(vlv, velv, .3);
x += vlh;
y += vlv;

if (mouse_wheel_down()) slot++;
if (mouse_wheel_up()) slot--;
if (slot == -1) slot = 6;
if (slot == 7) slot = 0;

if (keyboard_check_released(ord("E")) and !instance_exists(obj_inventario)) instance_create_depth(0, 0, 0, obj_inventario);

if (keyboard_check_pressed(vk_shift) and inventario[0, slot] == spr_animais and inventario[1, slot] == 0 and !instance_exists(obj_posicao))
{
	var _obj = instance_create_depth(0, 0, 0, obj_posicao);
	_obj.obj = obj_casa;
	inventario[2, slot]--;
	if (inventario[2, slot] == 0)
	{
		inventario[0, slot] = noone;
		inventario[1, slot] = 0;
	}
}