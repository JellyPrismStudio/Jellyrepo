	player = global.party.players[global.menu.equippage];
	equip_size = array_last(equip);
	size = array_length(equip);

if position_meeting(mouse_x,mouse_y,equipSlot){
	var inst = instance_position(mouse_x, mouse_y, equipSlot);
	global.menu.equiphover = inst.equipid;	
} else {
	global.menu.equiphover = -1;
}