/// @description Insert description here
draw_self();
if !global.onmenu and !global.on_popup and !global.on_message{
	if global.config.targetname{
		image_alpha = 1;
		draw_set_halign(fa_center);
		draw_set_font(DayDream_pt5);
		
		draw_text_ext_color(x,y-25, name,1,300,#d3c0ae,#d3c0ae,#d3c0ae,#d3c0ae,0.8);
		// bdd551
	}
}
else image_alpha = 0;
// You can write your code in this editor



