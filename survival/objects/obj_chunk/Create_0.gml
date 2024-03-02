size = obj_seed.size;
frame = 0;
list = ds_list_create();
x1 = x-size*16/2;
y1 = y-size*16/2;
x2 = x+size*16/2;
y2 = y+size*16/2;

if (global.chunks[x1/size/16, y1/size/16] == noone)
{
	global.chunks[x1/size/16, y1/size/16] = ds_list_create();
}