event_inherited();
if position_meeting(mouse_x,mouse_y,self) and !instance_exists(TitleOptions) {
	image_blend = c_orange;
	if !soundover play_audio("SFX",global.sounddb.menupop1,0,0,global.config.sound_volume)
	soundover = true;
}
else {
	image_blend = c_white;
	soundover = false;
}
