if position_meeting(mouse_x,mouse_y,self){
	if !soundover play_audio("SFX",global.sounddb.menupop2,0,0,global.config.sound_volume)
	soundover = true;
	image_blend = c_orange;
	if to_gamepad_pressed(mb_left){
		play_audio("SFX",global.sounddb.menuclose1,0,0,global.config.sound_volume)
		global.onmenu = false;
		global.can_move = true;
		back_main_menu();
		//close_itens_main_menu();
		//unpause_game();
		//instance_destroy(MENU);
		//instance_destroy();
	}	
} else {
	image_blend = c_white;
	soundover = false;
}



