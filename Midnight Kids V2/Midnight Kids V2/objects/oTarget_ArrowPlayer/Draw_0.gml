/// @description Insert description here
draw_self();

if !global.onmenu and !global.on_popup and !global.on_message{
	if global.config.targetname{
		image_alpha = 1;
		draw_set_halign(fa_center);
		draw_set_font(DayDream);
		
		draw_text_ext_color(x,y-25, name,1,300,#e8ff82,#e8ff82,#e8ff82,#e8ff82,1);
		// bdd551
	}
}
else image_alpha = 0;