
/// @description Insert description here
y += _yspd;
x -= _xspd;

var cam = view_camera[1];
var x1 = camera_get_view_x(cam);
var y1 = camera_get_view_y(cam);
var x2 = x1 + camera_get_view_width(cam);
var y2 = y1 + camera_get_view_height(cam);
if( !point_in_rectangle( x, y, x1, y1, x2, y2)) instance_destroy();
/*
cww = _GLOBAL_CAMERA.camera_w;
chh = _GLOBAL_CAMERA.camera_h;
cxx = global.player.x;
cyy = global.player.y;
fxx1 = cxx - cww*2 - 150;
fxx2 = cxx + cww*2 + 150;
fyy1 = cyy - chh*2 - 250;
fyy2 = cyy + chh*2 + 150;


if (x > fxx1 and x < fxx2) and (y > fyy1 and y < fyy2) {


	//if (x > fxx1 and x < fxx2) and (y > fyy1 and y < fyy2) {
		if x<0 or y>=room_height or image_alpha < 0.1 instance_destroy(id, true);
	
		if drip <= y
		{
			instance_create_layer(x,y,"Instances",_SYS_drip_floor);	
			instance_destroy(self);
		}
	}else instance_destroy(id, true);
	
	//}
	//else instance_destroy();

	if (bbox_right < -10 || bbox_left > room_width + 90 || bbox_bottom < -(global.config.camera_height/2) || bbox_top > room_height)
	{
	    instance_destroy(id, true);
	}

	if (x < -10 || x > room_width + 90 || y < -(global.config.camera_height/2) || y > room_height)
	{
	    instance_destroy(id, true);
	}


// You can write your code in this editor

