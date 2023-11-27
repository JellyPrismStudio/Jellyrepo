/// @description Insert description here
draw_set_font(Ruler);
//draw_set_halign(fa_left);
//draw_set_valign(fa_top);
itemcoord = [0, -95];
skillcoord = [30, -80];
statuscoord = [-30, -80];
equipcoord = [30, -5];
configcoord = [-30, -5];
bestcoord =	[0,	20];

if !notspawn {
	if !instance_exists(itemMenu){
		if layer_exists("Menu") item = instance_create_layer(r_x+itemcoord[0],r_y+itemcoord[1],"Menu",itemMenu);
		else {
			layer_create(global.intern.depths.menu, "Menu");
			item = instance_create_layer(r_x+itemcoord[0],r_y+itemcoord[1],"Menu",itemMenu);
		}
		item.super = self;
	}
	if !instance_exists(skillMenu){
		if layer_exists("Menu") skill = instance_create_layer(r_x+skillcoord[0],r_y+skillcoord[1],"Menu",skillMenu);
		else {
			layer_create(global.intern.depths.menu, "Menu");
			skill = instance_create_layer(r_x+skillcoord[0],r_y+skillcoord[1],"Menu",skillMenu);
		}
		skill.super = self;
	}
	if !instance_exists(statsMenu){
		if layer_exists("Menu") stats = instance_create_layer(r_x+statuscoord[0],r_y+statuscoord[1],"Menu",statsMenu);
		else {
			layer_create(global.intern.depths.menu, "Menu");
			stats = instance_create_layer(r_x+statuscoord[0],r_y+statuscoord[1],"Menu",statsMenu);
		}
		stats.super = self;
	}	
	if !instance_exists(equipMenu){
		if layer_exists("Menu") equip = instance_create_layer(r_x+equipcoord[0],r_y+equipcoord[1],"Menu",equipMenu);
		else {
			layer_create(global.intern.depths.menu, "Menu");
			equip = instance_create_layer(r_x+equipcoord[0],r_y+equipcoord[1],"Menu",equipMenu);
		}
		equip.super = self;
	}
	if !instance_exists(configMenu){
		if layer_exists("Menu") configs = instance_create_layer(r_x+configcoord[0],r_y+configcoord[1],"Menu",configMenu);
		else {
			layer_create(global.intern.depths.menu, "Menu");
			configs = instance_create_layer(r_x+configcoord[0],r_y+configcoord[1],"Menu",configMenu);
		}
		configs.super = self;
	}
	if !instance_exists(bestiaryMenu){
		if layer_exists("Menu") best = instance_create_layer(r_x+bestcoord[0],r_y+bestcoord[1],"Menu",bestiaryMenu);
		else {
			layer_create(global.intern.depths.menu, "Menu");
			best = instance_create_layer(r_x+bestcoord[0],r_y+bestcoord[1],"Menu",bestiaryMenu);
		}
		best.super = self;
	}
}

draw_text(r_x,r_y, str);

// You can write your code in this editor



