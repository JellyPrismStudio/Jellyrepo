/// @description Insert description here
// You can write your code in this editor
activated = false;

Room_Destiny = Room2;
fade_speed = 0.02;
obj = _SYS_OBJECT_NULL;
xx = 0;
yy = 0;
validate = false;
freemovement = false;

// Inherit the parent event
event_inherited();

scene_info[0] = [
	[cutscene_do_nothing],
	[cutscene_reset],
]
scene_info[1] = [
	[cutscene_lock_movement, freemovement],
	[cutscene_lock_menu],
	[clean_fade],
	[cutscene_object_fade,"in",fade_speed,1,0,self.id,true],
	[cutscene_skip_page, 2],
]	
scene_info[2] = [	
	[cutscene_change_room, Room_Destiny],
	[cutscene_change_coordinates, _GLOBAL_CAMERA, xx - 100, yy - 100, true],
	[cutscene_change_coordinates, obj, xx, yy, validate],
	[cutscene_lock_movement, true],
	[cutscene_object_fade,"out",fade_speed,0,1],	
	[cutscene_unlock_menu],
	[instance_destroy],
	[cutscene_goto_page_clean, 0, 0],	
]
