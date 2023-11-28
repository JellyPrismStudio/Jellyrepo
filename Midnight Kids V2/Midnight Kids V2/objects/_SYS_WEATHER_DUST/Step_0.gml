/// @description Insert description here

camera_x = camera_get_view_x(view_camera[0]) - _padding;
camera_x_width = camera_x + camera_get_view_width(view_camera[0]) + _padding;
get_camera_x = irandom_range(camera_x, camera_x_width);
get_camera_y = camera_get_view_y(view_camera[0]);// - _padding;
xx = irandom_range(0,room_width+90);
yy = irandom_range(0,room_height);


_delay--;
if _delay<=0{
	for(i=0;i<_strength;i++){
		instance_create_depth(xx, yy, -10000,_WEA_dust);
		xx = irandom_range(0,room_width+90);
		_delay = irandom_range(0,_delay_max);
	}
	i=0
//instance_create_depth(get_camera_x, get_camera_y, -10000,_SYS_raindrop);
}




// You can write your code in this editor

