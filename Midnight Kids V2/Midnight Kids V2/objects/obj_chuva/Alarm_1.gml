if instance_exists(object_viewport){
	instance_create_depth(object_viewport.x,object_viewport.y,global.intern.depths.light--,obj_thunder);
	alarm_set(1,irandom_range(20000/(wspeed/3), 50000/(wspeed/3)));
}