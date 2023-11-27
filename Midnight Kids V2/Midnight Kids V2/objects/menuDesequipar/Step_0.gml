if live_call() return live_result;

if global.player_stats[user].equip[tipe] != -1
{
	if position_meeting(mouse_x,mouse_y,self){

		if !soundover play_audio("SFX",global.sounddb.menupop2,0,0,global.config.sound_volume)
		soundover = true;
		image_blend = c_orange;
		if to_gamepad_pressed(mb_left){
			 unequip_equipment();
			 add_equip_to_inv(global.player_stats[user].equip[tipe]);
			 global.player_stats[user].equip[tipe] = -1;
			 refresh_equip_menu();
		}
	}
	else {
		soundover = false;
		image_blend = c_white;
	}
} else image_blend = c_gray;