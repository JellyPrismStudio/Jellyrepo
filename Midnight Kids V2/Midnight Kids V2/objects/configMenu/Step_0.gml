/// @description Insert description here
if position_meeting(mouse_x,mouse_y,self){
	image_blend = c_orange;
	if !soundover play_audio("SFX",Popup1,0,0,global.config.sound_volume)
	soundover = true;
	if to_gamepad_pressed(mb_left) {
		MENU.notspawn = true;
		instance_create_depth(x,y,-51,Options);
		close_itens_menu();
	}
}
else {
	soundover = false;
	image_blend = c_white;
}
// You can write your code in this editor



