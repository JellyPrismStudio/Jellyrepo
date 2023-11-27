r_x = x - view_xview[0];
r_y = y - view_yview[0];
vx = camera_get_view_x(view_camera[0]);
vy = camera_get_view_y(view_camera[0]);
obx = object_viewport.x;
oby = object_viewport.y;
cw = global.config.camera_width/2;
ch = global.config.camera_height/2;
rx = view_xview[0];
ry = view_xview[0];

equipWindow = plus_instance_create_layer(0,0,"Menu",equipInvWindow);