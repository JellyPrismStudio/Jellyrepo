/// @description Insert description here
dyy = y;
dxx = x;
//dyy = super.y - super.sprite_height - 2;

if super == global.party.players[0] or super == global.party.players[1] 
{
	draw_set_font(RulerBattle);
}
else draw_set_font(DayDream_pt6);
_ccolor = c_black;
draw_text_color(x-1,y,text,_ccolor,_ccolor,_ccolor,_ccolor,_alpha);
draw_text_color(x+1,y,text,_ccolor,_ccolor,_ccolor,_ccolor,_alpha);
draw_text_color(x,y-1,text,_ccolor,_ccolor,_ccolor,_ccolor,_alpha);
draw_text_color(x,y+1,text,_ccolor,_ccolor,_ccolor,_ccolor,_alpha);

draw_text_color(x,y,text,_color,_color,_color,_color,_alpha);
// You can write your code in this editor

if _color == c_green and _auxbol == false 
{
	
	if super == global.party.players[0] or super == global.party.players[1]{
		if global.player_stats[global.player_index].hp < global.player_stats[global.player_index].mhp
		{
			while count < text
			{
				global.player_stats[global.player_index].hp ++;
				count++;
			}		
		}
		_auxbol = true;	
	}
}