/// @description Insert description here
dyy = y;
dxx = x;
//dyy = super.y - super.sprite_height - 2;
	
if super != global.player draw_set_font(RulerBattle);
else draw_set_font(DayDream_pt8);
draw_text_color(x-1,y,text,_out_color,_out_color,_out_color,_out_color,_alpha);
draw_text_color(x+1,y,text,_out_color,_out_color,_out_color,_out_color,_alpha);
draw_text_color(x,y-1,text,_out_color,_out_color,_out_color,_out_color,_alpha);
draw_text_color(x,y+1,text,_out_color,_out_color,_out_color,_out_color,_alpha);

draw_text_color(x,y,text,_color,_color,_color,_color,_alpha);
// You can write your code in this editor

if _color == c_green and _auxbol == false 
{
	if super == global.player {
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