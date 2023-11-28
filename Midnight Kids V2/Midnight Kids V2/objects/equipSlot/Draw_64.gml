if live_call() return live_result;

if position_meeting(mouse_x,mouse_y,self){
	image_blend = c_red;
	draw_set_font(DayDream_pt8);
	draw_text_color(524,200,global.inventory[index].nome,#65313b,#65313b,#65313b,#65313b,1);
	draw_set_font(Ruler);
	draw_text_ext_color(524,220,global.inventory[index].text,12,250,#4b4030,#4b4030,#4b4030,#4b4030,1);
	//draw_set_font(DayDream_pt8);
	
	function show_status_hud_equip(atrib){
		if global.player_stats[user].equip[equipid] != -1
		{
			if global.player_stats[user].equip[equipid].atribute[atrib] > global.inventory[index].atribute[atrib]		{	_color = #65313b;		_arrow = "<="		}
			else if global.player_stats[user].equip[equipid].atribute[atrib] == global.inventory[index].atribute[atrib]	{	_color = c_white;	_arrow = " ="			}
			else																				{	_color = #305f41;	_arrow = " =>"		}
		}else	{	
			if 0 > global.inventory[index].atribute[atrib]			{	_color = #65313b;		_arrow = "<="		}
			else if 0 == global.inventory[index].atribute[atrib]	{	_color = c_white;	_arrow = " ="			}
			else													{	_color = #305f41;	_arrow = "=>"		}	
		} // 305f41
		draw_set_font(DayDream_pt8);
		plus_text(540,370,"Status", _color, 0, 300, fa_left, fa_top);
		draw_set_font(Ruler);
			switch(atrib){
			case 6:
				var yy = 398;
				var name = global.language.menu.hp;
			break;
			case 7:
				var yy = 416;
				var name = global.language.menu.sp;
			break;
			case 0:
				var yy = 434;
				var name = global.language.menu.atk;
			break;
			case 1:
				var yy = 452;
				var name = global.language.menu.def;
			break;
			case 2:
				var yy = 470;
				var name = global.language.menu.mag;
			break;
			case 3:
				var yy = 486;
				var name = global.language.menu.cri;
			break;
			case 4:
				var yy = 506;
				var name = global.language.menu.eva;
			break;
			case 5:
				var yy = 524;
				var name = global.language.menu.hit;
			break;			
			}
			plus_text(524,yy,name, _color, 0, 300, fa_left, fa_top);
			if global.player_stats[user].equip[equipid] != -1 plus_text(665,yy,global.player_stats[user].equip[equipid].atribute[atrib], _color, 0, 300, fa_left, fa_top);
			else plus_text(665,yy,"0", _color, 0, 300, fa_left, fa_top);
			plus_text(700,yy,_arrow, _color, 0, 300, fa_left, fa_top);
			draw_set_halign(fa_right);
			plus_text(745,yy,global.inventory[index].atribute[atrib], _color, 0, 300, fa_left, fa_top);
			draw_set_halign(fa_left);
				
	}
	
	
	show_status_hud_equip(0);
	show_status_hud_equip(1);
	show_status_hud_equip(2);
	show_status_hud_equip(3);
	show_status_hud_equip(4);
	show_status_hud_equip(5);
	show_status_hud_equip(6);
	show_status_hud_equip(7);
}
else image_blend = c_white;