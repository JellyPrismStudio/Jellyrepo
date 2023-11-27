function create_directions_variables(xx,yy,timer,_range,verify_position = false){
	verify_x = xx;
	verify_y = yy;
	last = 0;
	verify_timer = timer;
	verify_pos = verify_position;
	range = _range;
	path = path_add();	
	custom_images = false;
	images_trigger = true;
}

function create_pathfinding_variables(){
	state_machine = "";
	target_x = x;
	target_y = y;
	pathing = false;
}

function create_battle_basics_player(){
	damaged = false;
	BATTLE_D = 5;
}

