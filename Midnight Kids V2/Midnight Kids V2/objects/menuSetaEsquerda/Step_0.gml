if position_meeting(mouse_x,mouse_y,self){
	if super.page > super.page_min image_blend = c_orange;
	if to_gamepad_pressed(mb_left){
		if super.page > super.page_min  {
			if !soundover play_audio("SFX",global.sounddb.menupop2,0,0,global.config.sound_volume)
			soundover = true;
			pressed = true;
			//inventory_array_organize();
		}
		else image_blend = c_gray;
	}	
}
else {
	soundover = false;
	if super.page > super.page_min image_blend = c_white;
	else image_blend = c_gray;
}