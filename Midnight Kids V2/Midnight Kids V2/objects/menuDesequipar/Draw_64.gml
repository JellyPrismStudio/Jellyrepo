if live_call() return live_result;

if global.player_stats[user].equip[tipe] != -1
{
	_color = c_white
	if position_meeting(mouse_x,mouse_y,self){
		plus_text_font(524,200,global.player_stats[user].equip[tipe].nome,#65313b,DayDream_pt8,fa_left, fa_top);
		plus_text_font(524,220,global.player_stats[user].equip[tipe].text,#4b4030, Ruler, fa_left, fa_top);
		plus_text_font(524,370,"Status", _color, DayDream_pt8, 0, 300, fa_left, fa_top);
		
		yy = 398
		status = [global.language.menu.atk, global.language.menu.def, global.language.menu.mag, global.language.menu.cri, global.language.menu.eva, global.language.menu.hit, global.language.menu.hp, global.language.menu.sp]
		for (j=0;j<8;j++)
		{
			
			if global.player_stats[user].equip[tipe].atribute[j] == 0
			{
				_color = c_white
				arrow = "==";
				
			}
			else if global.player_stats[user].equip[tipe].atribute[j] < 0
			{
				_color = #305f41;
				arrow = "=>";
			}
			else
			{
				_color = #65313b;
				arrow = "<=";
			}
			plus_text(524,yy,status[j], _color, 0, 300, fa_left, fa_top);
			plus_text(665,yy,global.player_stats[user].equip[tipe].atribute[j], _color, 0, 300, fa_left, fa_top);
			plus_text(700,yy,arrow, _color, 0, 300, fa_left, fa_top);
			plus_text(745,yy,"0", _color, 0, 300, fa_left, fa_top);
			yy += 18;
		}
	}
}