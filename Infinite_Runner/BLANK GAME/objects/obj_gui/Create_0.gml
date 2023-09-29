#region timer
timer = 0;
f_tempo = function()
{
	if (layer_get_vspeed("fundo") > 0) timer++;
	plus_text_font(1, room_height-25, "TIMER: " + string(timer/60), c_black, fnt_DayDream, fa_left);
}
#endregion

#region speed
start_speed = layer_get_vspeed("fundo");
f_speed = function()
{
	plus_text_font(1, room_height-10, "SPEED: " + string(layer_get_vspeed("fundo")/start_speed), c_black, fnt_DayDream, fa_left);
}
#endregion

#region vida
f_vida = function()
{
	for (var i = 0; i < 2; i++)
	{
		var _submig = obj_player.vida > i? 0 : 1;
		draw_sprite_ext(spr_coracao, _submig, room_width/2-56/2+i*56, 32, 3, 3, 0, c_white, 1);
	}
}
#endregion

#region moedas
f_moeda = function()
{
	draw_sprite_ext(spr_moeda, 0, 30, 30, 2, 2, 0, c_white, 1);
	plus_text_font(50, 30, ": " + string(obj_player.pontuacao), c_white, fnt_DayDream, fa_left, fa_middle);
}
#endregion

#region fundo
f_fundo = function()
{
	draw_set_alpha(.9);
	draw_set_color(c_dkgray);
	draw_rectangle(0, 0, room_width, 62, false);
	draw_set_color(c_white);
	draw_rectangle(1, 0, room_width-2, 62, true);
	draw_set_alpha(1);
}
#endregion