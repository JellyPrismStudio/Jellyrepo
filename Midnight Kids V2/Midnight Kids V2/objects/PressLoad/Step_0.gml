/// @description Insert description here
// You can write your code in this editor



// Inherit the parent event
if fileexists {
	if position_meeting(mouse_x,mouse_y,self) and !instance_exists(TitleOptions){
		if !soundover play_audio("SFX",global.sounddb.menupop1,0,0,global.config.sound_volume)
		soundover = true;
		image_blend =c_orange;
		if to_gamepad_click(mb_left){
			load_encrypted();
			instance_destroy(PressStart);
		}
		}
		else  {
			image_blend = c_white;
			soundover = false;
		}
	}
	else
	{
		image_blend = c_gray;	
	}