/// @description Insert description here
// You can write your code in this editor
arrived=false;

if instance_exists(target){
//if target != -4{
	switch(target.instance_family) {
		case INSTANCE_FAMILY.BLOCK:
			unit_state = UNIT_STATE.IDLE;
		break;
	
		case INSTANCE_FAMILY.RESOURCE:
			alarm[1] = room_speed * 0.65;
		break;	
	}
}
