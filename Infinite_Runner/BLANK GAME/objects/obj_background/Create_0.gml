y1 = -sprite_get_height(spr_background);
y2 = 0;
spr_antigo = 0;
spr_atual = 0;
spr = 0;

f_draw = function()
{
	y1 += layer_get_vspeed("fundo");
	y2 += layer_get_vspeed("fundo");
	if (y1 > -layer_get_vspeed("fundo"))
	{
		y1 = -sprite_get_height(spr_background);
		y2 = 0;
		
		spr_antigo = spr_atual;
		spr_atual = spr;
	}
	
	draw_sprite(spr_background, spr_atual, 0, y1);
	draw_sprite(spr_background, spr_antigo, 0, y2);
	
	if (keyboard_check_pressed(vk_enter)) spr++;
}