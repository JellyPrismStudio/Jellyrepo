/// @description terrain_floor_get_z(x,y)
/// @param x
/// @param y
function terrain_floor_get_z(argument0, argument1) {
	if(!global.terrainfloor){
	    return BOTTOMLIMIT
	}
	argument0 = median(argument0,0,room_width)/GRIDSIZE_X
	argument1 = median(argument1,0,room_height)/GRIDSIZE_Y

	var x1, x2, y1, y2, zA, zB, z11, z12, z21, z22;
	x1 = floor(argument0)
	x2 = x1 + 1
	y1 = floor(argument1)
	y2 = y1 + 1

	z11 = ds_grid_get(FLOORGRID,x1,y1)
	z12 = ds_grid_get(FLOORGRID,x1,y2)
	z21 = ds_grid_get(FLOORGRID,x2,y1)
	z22 = ds_grid_get(FLOORGRID,x2,y2)

	zA = z11 + (z21 - z11)*(argument0 - x1)
	zB = z12 + (z22 - z12)*(argument0 - x1)

	return zA + (zB - zA)*(argument1 - y1)



}
