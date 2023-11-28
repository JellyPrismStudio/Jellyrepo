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
run_funct = [false, noone];
hover = false;

//////////////////

k = 0;
pagelimit = 11;
columnlimit = 4;

filter = 0;
//			0		1		2			3			4			5		 6		 7			8		9		  10		11
filters = [global.language.menu.ic1, global.language.menu.ic2, global.language.menu.ic3, global.language.menu.ic4, global.language.menu.ic5, global.language.menu.ic6, global.language.menu.ic7, global.language.menu.ic8, global.language.menu.ic9, global.language.menu.ic10, global.language.menu.ic11];


// Paginação


function filtered_inv(){
	scounter = 0;
	pages = [0];
	for(s=0;s<array_length(global.inventory);s++)
	{
		if (filter == 0 and global.inventory[s].tipo != "hidden") or (filter > 0 and global.inventory[s].tipo == filters[filter])
		{
			 if scounter == pagelimit
			 {
				 array_push(pages, s+1);
				 scounter = 0;
			 }
			 else scounter++
		}
	}
}

/////////////////////


filtered_inv();
inventory_array_organize();
inventory_resize();

start_i = 0;
end_i = start_i + 8;
invsize = array_length(global.inventory);
lastnum = 0;
lastnumpages = [-1,0,0,0];
last_i = 0
page = 0;
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
page = 0;
run_event = false;

