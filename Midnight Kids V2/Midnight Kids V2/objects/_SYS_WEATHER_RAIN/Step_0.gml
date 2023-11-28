/// @description Insert description here

cww = _GLOBAL_CAMERA.camera_w;
chh = _GLOBAL_CAMERA.camera_h;
cxx = global.player.x;
cyy = global.player.y;
fxx1 = cxx - cww;
fxx2 = cxx + cww;
fyy1 = cyy - chh;
fyy2 = cyy + chh;




camera_x = camera_get_view_x(view_camera[0]) - _padding;
camera_x_width = camera_x + camera_get_view_width(view_camera[0]) + _padding;
get_camera_x = irandom_range(camera_x, camera_x_width);
get_camera_y = camera_get_view_y(view_camera[0]);// - _padding;
xx = irandom_range(0,room_width+90);


_delay--;
if _delay<=0{
	for(i=0;i<_strength;i++){
		instance_create_depth(xx, fyy1, -10000,_SYS_raindrop);
		xx = irandom_range(0,room_width+90);
		_delay = irandom_range(0,_delay_max);
	}
}




// You can write your code in this editor

