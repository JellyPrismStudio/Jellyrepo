/// @description Insert description here

if timing > 0 timing--

mouse_to_gamepad();

if mouse_check_button_pressed(mb_middle)
{
	if position_meeting(mouse_x,mouse_y,cage)
	{
		instance_destroy(instance_nearest(mouse_x,mouse_y,cage))
	}
	else instance_create_depth(mouse_x, mouse_y, depth, cage)
}

if keyboard_check_pressed(vk_f4) global.debug.ghosting = !global.debug.ghosting;
if keyboard_check_pressed(vk_f3) global.debug.noclip = !global.debug.noclip;
if keyboard_check(vk_f5) game_restart();
if keyboard_check_pressed(vk_insert) save_encrypted();
if keyboard_check_pressed(vk_end) game_restart();

if keyboard_check_pressed(vk_printscreen){
	// Criar uma surface temporária do tamanho da room
	var surface = surface_create(room_width, room_height);

	// Desenhar a room na surface
	draw_surface(surface, 0, 0);

	// Salvar a surface como uma imagem
	surface_save(surface, global.config.directory);

	// Destruir a surface temporária
	surface_free(surface);	
}
if (to_gamepad_pressed("F")) and !global.on_message and !global.intern.blockall
{
	change_player();
}

if to_gamepad_click(mb_left)
{
	cursor_sprite = sprite_cursor2click;	
}
else
{
	cursor_sprite = sprite_cursor2	
}


