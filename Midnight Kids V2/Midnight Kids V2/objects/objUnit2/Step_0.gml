/// @description Insert description here
// You can write your code in this editor

if kget_radius(self.id,270,false,true,true,global.player) {
	target_x = get_snapped(global.player.x, CELL_SIZE) + CELL_SIZE / 2;
	target_y = get_snapped(global.player.y, CELL_SIZE) + CELL_SIZE / 2;
	target = instance_position(target_x, target_y, CLICKABLE_CELL);
	event_user(0); 
}
if life <= 0
instance_destroy();





if(unit_state == UNIT_STATE.GATHER and alarm[1] < 0) {
		
	alarm[1] = room_speed*0.15;
}

	
