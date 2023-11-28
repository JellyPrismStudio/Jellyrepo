if position_meeting(mouse_x,mouse_y,self){
	sprite_index = spr_BubbleSpeech4;
	if to_gamepad_click(mb_left){
		clicked = true;
		super.parid = myid;
		instance_destroy();
	}
}
else 
{
	sprite_index = spr_BubbleSpeech;
}