/// @description Insert description here
// You can write your code in this editor

if position_meeting(mouse_x,mouse_y,self) {
	image_blend = c_orange;
	if !soundover play_audio("SFX",global.sounddb.menupop1,0,0,global.config.sound_volume)
	soundover = true;
	if to_gamepad_pressed(mb_left) and !instance_exists(TitleOptions)
	{
		instance_create_depth(x,y,depth,TitleOptions)	
	}
}
else {
	image_blend = c_white;
	soundover = false;
}
