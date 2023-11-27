r_x = x - view_xview[0];
r_y = y - view_yview[0];
vx = camera_get_view_x(view_camera[0]);
vy = camera_get_view_y(view_camera[0]);
cw = global.config.camera_width/2;
ch = global.config.camera_height/2;
rx = view_xview[0];
ry = view_xview[0];
yfix = -5 ;

var button1 = instance_create_layer(object_viewport.x - 125,object_viewport.y - 100 - yfix,"Menu", button_configs);
button1.selfswitch = 1;
button1.config_bool = global.config.GPU.wobble

var button2 = instance_create_layer(object_viewport.x - 125,object_viewport.y - 75 - yfix,	"Menu", button_configs);
button2.selfswitch = 2;
button2.config_bool = global.config.GPU.floorlight

var button3 = instance_create_layer(object_viewport.x - 125,object_viewport.y - 50 - yfix, "Menu", button_configs);
button3.selfswitch = 3;
button3.config_bool = global.config.GPU.weather

var button4 = instance_create_layer(object_viewport.x - 125,object_viewport.y - 25 - yfix,	"Menu", button_configs);
button4.selfswitch = 4;
button4.config_bool = global.config.GPU.highFPS

var button5 = instance_create_layer(object_viewport.x - 125,object_viewport.y       - yfix,	"Menu", button_configs);
button5.selfswitch = 5;
button5.config_bool = global.config.GPU.lightFX

var button5 = instance_create_layer(object_viewport.x - 125,object_viewport.y  + 25  - yfix,"Menu", button_configs);
button5.selfswitch = 6;
button5.config_bool = global.config.dynamiccamera