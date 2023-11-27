r_x = x - view_xview[0];
r_y = y - view_yview[0];
vx = camera_get_view_x(view_camera[0]);
vy = camera_get_view_y(view_camera[0]);
cw = global.config.camera_width/2;
ch = global.config.camera_height/2;
rx = view_xview[0];
ry = view_xview[0];
ymp = 0;
yfix = 0;
yyfix = -40;

inventory_array_organize();
inventory_resize();

start_i = 0;
end_i = start_i + 8;
invsize = array_length(global.inventory);
lastnum = 0;
lastnumpages = [-1,0,0,0];
page = 1;
pagestart = 1;
value_i = 1;

page_max = (array_length(global.inventoryunit)/9);
	if (frac(page_max) > 0)
	{
	    page_max = floor(page_max);
		page_max++;
	}	

page_min = 1;

j = 0;
k = 0;
run_event = false;
event_user(0);

bf = instance_create_layer(object_viewport.x - 85,object_viewport.y+70+yyfix,"Menu", object_change_player) 

bl = instance_create_layer(object_viewport.x - 85,object_viewport.y+70+yyfix,"Menu", menuSetaDireita);
bl.super = self;

br = instance_create_layer(object_viewport.x - 125,object_viewport.y+70+yyfix,"Menu", menuSetaEsquerda);
br.super = self;


//bc = instance_create_layer(object_viewport.x + 175,object_viewport.y-85,"Menu", menuClose);
