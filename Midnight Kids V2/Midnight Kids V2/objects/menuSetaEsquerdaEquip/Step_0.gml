if position_meeting(mouse_x,mouse_y,self){
	if !soundover play_audio("SFX",global.sounddb.menupop2,0,0,global.config.sound_volume)
	soundover = true;
	image_blend = c_orange;
	if to_gamepad_pressed(mb_left){
		 previous_page(global.menu.equippage);
		 refresh_equip_menu();
	}
}
else {
	soundover = false;
	image_blend = c_white;
}