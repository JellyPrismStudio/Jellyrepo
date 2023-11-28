/// @description shooting_posdir(length,speed)
/// @param length
/// @param speed
function shooting_posdir(argument0, argument1) {
	//Sets variables cx, cy, cz, xsp, ysp, zsp depending on player facing direction and arguments.
	//Used to know WHERE to create a bullet and in what vector to fire it.
	cx = argument0*lengthdir_x(1,direction)*lengthdir_x(1,ztilt)
	cy = argument0*lengthdir_y(1,direction)*lengthdir_x(1,ztilt)
	cz = argument0*lengthdir_y(1,ztilt)//GM's y axis is inverted to the z axis
	xsp= argument1*lengthdir_x(1,direction)*lengthdir_x(1,ztilt)
	ysp= argument1*lengthdir_y(1,direction)*lengthdir_x(1,ztilt)
	zsp= argument1*lengthdir_y(1,ztilt)//GM's y axis is inverted to the z axis



}
