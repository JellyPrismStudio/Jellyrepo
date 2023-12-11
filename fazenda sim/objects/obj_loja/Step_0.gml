if (place_meeting(x, y, obj_player) and keyboard_check_released(ord("E")) and !existe)
{
	instance_create_depth(0, 0, 0, obj_compras);
	
	if (instance_exists(obj_inventario)) instance_destroy(obj_inventario);
	instance_create_depth(0, 0, 0, obj_inventario);
}
if (keyboard_check_pressed(ord("E"))) existe = instance_exists(obj_compras);