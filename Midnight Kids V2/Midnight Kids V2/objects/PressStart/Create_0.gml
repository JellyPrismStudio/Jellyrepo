/// @description Insert description here
// You can write your code in this editor
destroy = true;
soundover = false;
// Inherit the parent event
event_inherited();

scene_info[0] = [
	[cutscene_wait_for_input_on_collission,"m",mb_left,self.id,self.id],
	[cutscene_variable,self,"destroy",false],
	[cutscene_lock_menu],
	[cutscene_lock_movement, false],
	[perform_transfer, rJunkyard1, global.intern.firstx,  global.intern.firsty, global.player, true, false],
	[cutscene_delete_object, inst_49376BCA],

	[cutscene_lock_movement, true],
	[cutscene_unlock_menu],
	[instance_destroy],
]