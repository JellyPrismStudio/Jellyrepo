draw_set_halign(fa_center);
draw_text(room_width/2, room_height/2, "aperte J para entrar como Jogador, e S para ser o servidor");
draw_set_halign(-1);

if (keyboard_check_pressed(ord("S")))
{
	instance_create_layer(x, y, layer, obj_servidor);
	room_goto(scn_server);
}
if (keyboard_check_pressed(ord("J"))) room_goto(scn_jogo);