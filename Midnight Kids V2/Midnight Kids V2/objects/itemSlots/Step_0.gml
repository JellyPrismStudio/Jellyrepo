if position_meeting(mouse_x,mouse_y,self) {
	image_blend = c_red;
	show_name = true;
	if !soundover play_audio("SFX",global.sounddb.menupop2,0,0,global.config.sound_volume)
	soundover = true;
	if to_gamepad_pressed(mb_left) and effect != noone{
		script_execute(effect, arg0, arg1);
		
		//inventory_array_organize();
		get_pages();
	}
}
else {
	soundover = false;
	image_blend = c_white;
	show_name = false;
}

if quantity < 1 {
	instance_destroy();
	inventory_array_organize();
	inventory_resize();
	refresh_item_menu();
}