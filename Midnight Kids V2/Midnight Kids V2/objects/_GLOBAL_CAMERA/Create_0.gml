camera_destroy(view_camera[0]);
instance_create_depth(x,y,depth,object_viewport);
target = global.player;
cameraspeed = 0.03;
camera = 0;	
cameraspeedrush = cameraspeed * 3;
cameraspeedmegarush = cameraspeedrush*3;
camera_w = 640;
camera_h = 320;
customtarget = false;
targetobj = noone;
padding = 350;
mouse_priority = false;
reset = false;
entered_menu = false;
mb_delay = 100;	
lerpspeed = 0.02;
lerpy = 0;
lerpx = 0;
_WS = false;
_AD = false;
mouse_cooldown = 10;
depth = global.intern.depths.over;



view_camera[0] = camera_create_view(0, 0, camera_w, camera_h, 0, self, -1, -1, camera_w/2, camera_h/2);
