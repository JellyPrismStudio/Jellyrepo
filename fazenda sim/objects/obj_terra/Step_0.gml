randomize();
depth = -(y-sprite_height/2);

if (place_meeting(x, y, obj_player))
{
	if (keyboard_check(vk_space) and !space_press and planta > 0)
	{
		var _spr = sprite[spr];
		if (planta == 4)
		{
			if !(_spr == spr_macieira or _spr == spr_pessegueiro or _spr == spr_limoeiro)
			{
				planta = 0;
				if (sprite[spr] == spr_cafe) obj_player.inventario[0] += 2;
				if (sprite[spr] == spr_cenoura) obj_player.dinheiro += 4;
				if (sprite[spr] == spr_tomate) dinheiro += 6;
				if (sprite[spr] == spr_milho)
				{
					planta = 2;
					obj_player.dinheiro += 4;
				}
			}
			
		}
		else if (molhado == false)
		{
			molhado = true;
			timer = timer_max;
		}
		space_press = true;
	}
	if (keyboard_check(vk_shift) and !shift_press and obj_player.inventario[obj_player.slot] > 0)
	{
		if (obj_player.slot != ADUBO)
		{
			if (planta == 0)
			{
				planta = 1;
				obj_player.inventario[obj_player.slot]--;
				spr = obj_player.slot;
			}
			shift_press = true;
		}
		else if (!adubado)
		{
			timer_max = 300;
			adubado += 10;
			obj_player.inventario[obj_player.slot]--;
		}
	}
}
if (keyboard_check_released(vk_space) or !place_meeting(x, y, obj_player)) space_press = false;
if (keyboard_check_released(vk_shift) or !place_meeting(x, y, obj_player)) shift_press = false;
if (!keyboard_check(vk_space)) vida = 100;

var _spr = sprite[spr];
if ((_spr == spr_macieira or _spr == spr_pessegueiro or _spr == spr_limoeiro) and keyboard_check(vk_space) and planta == 4 and place_meeting(x, y, obj_player))
{
	vida--;
	if (vida == 0)
	{
		planta = 0;
		obj_player.dinheiro += 10;
		vida = 100;
	}
}

image_blend = c_white;
if (molhado)
{
	image_blend = c_maroon;
	timer--;
	if (timer == 0) 
	{
		molhado = false;
		planta++;
		if (adubado > 0)
		{
			adubado--;
			if (adubado == 0) timer_max = 600;
		}
	}
}

if (adubado > 0) image_blend = image_blend == c_white? c_gray : c_black;

var _spr = sprite[spr];
if ((_spr == spr_macieira or _spr == spr_pessegueiro or _spr == spr_limoeiro) and planta == 4)
{
	var _chance = irandom(600);
	if (_chance == 1)
	{
		var _x = irandom_range(x-sprite_width/2, x+sprite_width/2);
		var _y = irandom_range(y-sprite_height/2, y+sprite_height/2);
		var _obj = instance_create_depth(_x, _y, depth-1, obj_fruta);
		
		if (_spr == spr_pessegueiro) _obj.image_index = 1;
		if (_spr == spr_limoeiro) _obj.image_index = 2;
	}
}