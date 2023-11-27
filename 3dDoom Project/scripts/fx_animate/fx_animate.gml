/// @description fx_animate(sprite,speed,x,y,z)
/// @param sprite
/// @param speed
/// @param x
/// @param y
/// @param z
function fx_animate(argument0, argument1, argument2, argument3, argument4) {
	var n;
	n   = instance_create(argument2,argument3,obj_anifx)
	n.z = argument4
	n.sprite_index = argument0
	n.my_sprite    = argument0
	n.image_speed  = argument1



}
