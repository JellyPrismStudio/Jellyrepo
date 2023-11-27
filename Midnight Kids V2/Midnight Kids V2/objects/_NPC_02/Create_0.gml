event_inherited();
verify_x = x;
verify_y = y;
verify_timer = 5;
verify_pos = false;
range = 6;
image_speed = 0;
DirectionableIndexes = [0, 1, 2, 3, 4, 5, 6, 7, 8];

state_machine = -1;
alarm[0] = 10;
scene_info[0] = [
	[cutscene_move,"up",1,100,false,self],
	[cutscene_move,"left",1,100,false,self],
	[cutscene_move,"down",1,100,false,self],
	[cutscene_move,"right",1,100,false,self],
	[cutscene_reset],
]
scene_info[1] = [
	[cutscene_nothing],
	[cutscene_nothing],
]
scene_info[2] = [
	[cutscene_nothing],
]

