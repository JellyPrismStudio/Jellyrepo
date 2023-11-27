if position_meeting(mouse_x,mouse_y,self){
	if !soundover play_audio("SFX",global.sounddb.menupop2,0,0,global.config.sound_volume)
	soundover = true;
	if to_gamepad_pressed(mb_left){
		var on_array = find_value_on_array(global.player_stats[global.menu.skillpage].shortcuts, skill);
		if on_array != undefined{
			global.player_stats[global.menu.skillpage].shortcuts[on_array] = -1;
			global.player_stats[global.menu.skillpage].shortcuts[key] = skill;
		} else {
			global.player_stats[global.menu.skillpage].shortcuts[key] = skill;
		}
	}	
}
else soundover = false;