if live_call() return live_result;

if to_gamepad_pressed("F") {
	refresh_equip_menu();
	instance_destroy(equip1); instance_destroy(equip2); instance_destroy(equip3);instance_destroy(equip4);instance_destroy(equip5);
	l_create_unequips()
}

draw_set_font(DayDream_pt11);
plus_text(810,190,global.player_stats[player].nome,c_white,12,250, fa_left, fa_top);
draw_sprite( global.player_stats[player].idlegraph, 0, 1000, 210);
yfix = 30;

function draw_equip_1(yy,equip_id,title,emptystring){
	draw_set_font(DayDream_pt8);
	if global.menu.equiphover == equip_id {
		plus_text(810,yy+yfix-20,title,color_green, 0, 300, fa_left, fa_top);		
		draw_set_font(Ruler);
		if global.player_stats[player].equip[equip_id] != -1 plus_text(810,yy+yfix,global.player_stats[player].equip[equip_id].nome,color_green,12,250, fa_left, fa_top) else plus_text(810,yy+yfix,emptystring,_color, 0, 300, fa_left, fa_top);
	}else{
		plus_text(810,yy+yfix-20,title,c_orange, 0, 300, fa_left, fa_top);		
		draw_set_font(Ruler);		
		if global.player_stats[player].equip[equip_id] != -1 plus_text(810,yy+yfix,global.player_stats[player].equip[equip_id].nome,_color,12,250, fa_left, fa_top) else plus_text(810,yy+yfix,emptystring,color_black, 0, 300, fa_left, fa_top);
	}
}

draw_equip_1(230,0,global.language.menu.elm,"[" + global.language.menu.elm + "]");

draw_equip_1(290,1,global.language.menu.armor,"[" + global.language.menu.armor + "]");

draw_equip_1(350,2,global.language.menu.weapon,"[" + global.language.menu.weapon + "]");

draw_equip_1(410,3,global.language.menu.acessory,"[" + global.language.menu.acessory + "]");

draw_equip_1(470,4,global.language.menu.acessory,"[" + global.language.menu.acessory + "]");



