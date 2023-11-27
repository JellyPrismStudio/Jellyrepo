/// @description Insert description here
// You can write your code in this editor
if(target != noone) {
	arrived = true;
	alarm[0] = room_speed*0.1;	
}
if(path_exists(p)) {
path_delete(p);
}
target_x = -1;
target_y = -1;