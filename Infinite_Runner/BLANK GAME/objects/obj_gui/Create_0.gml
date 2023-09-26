#region timer
timer = 0;
f_tempo = function()
{
	timer++;
	plus_text_font(1, room_height-25, "TIMER: " + string(timer/60), c_black, fnt_DayDream, fa_left);
}
#endregion

#region speeda
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