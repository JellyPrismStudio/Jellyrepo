var _x1 = floor(obj_player.x/16/size)*16*size;
var _x2 = floor(obj_player.x/16/size)*16*size+16*size;
var _y1 = floor(obj_player.y/16/size)*16*size;
var _y2 = floor(obj_player.y/16/size)*16*size+16*size;

if (!collision_rectangle(_x1, _y1, _x2, _y2, Object8, false, false) and frame == 0)
{
	instance_create_depth(_x1+size, _y1+size, 0, Object8);
}
if (!collision_rectangle(_x1-16*size, _y1, _x2-16*size, _y2, Object8, false, false) and frame == 16)
{
	instance_create_depth(_x1+size-16*size, _y1+size, 0, Object8);
}
if (!collision_rectangle(_x1+16*size, _y1, _x2+16*size, _y2, Object8, false, false) and frame == 32)
{
	instance_create_depth(_x1+size+16*size, _y1+size, 0, Object8);
}
if (!collision_rectangle(_x1, _y1+16*size, _x2, _y2+16*size, Object8, false, false) and frame == 48)
{
	instance_create_depth(_x1+size, _y1+size+16*size, 0, Object8);
}
if (!collision_rectangle(_x1, _y1-16*size, _x2, _y2-16*size, Object8, false, false) and frame == 64)
{
	instance_create_depth(_x1+size, _y1+size-16*size, 0, Object8);
}
if (!collision_rectangle(_x1-16*size, _y1-16*size, _x2-16*size, _y2-16*size, Object8, false, false) and frame == 80)
{
	instance_create_depth(_x1+size-16*size, _y1+size-16*size, 0, Object8);
}
if (!collision_rectangle(_x1-16*size, _y1+16*size, _x2-16*size, _y2+16*size, Object8, false, false) and frame == 96)
{
	instance_create_depth(_x1+size-16*size, _y1+size+16*size, 0, Object8);
}
if (!collision_rectangle(_x1+16*size, _y1-16*size, _x2+16*size, _y2-16*size, Object8, false, false) and frame == 112)
{
	instance_create_depth(_x1+size+16*size, _y1+size-16*size, 0, Object8);
}
if (!collision_rectangle(_x1+16*size, _y1+16*size, _x2+16*size, _y2+16*size, Object8, false, false) and frame == 128)
{
	instance_create_depth(_x1+size+16*size, _y1+size+16*size, 0, Object8);
}

frame++;
if (frame == 129) frame = 0;
if (floor(obj_player.x/16/size) != floor(x_/16/size) or floor(obj_player.y/16/size) != floor(y_/16/size))
{
	frame = 0;
}
x_ = obj_player.x;
y_ = obj_player.y;