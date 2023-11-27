draw_self();
var s_color = c_orange;

var _cur_font = draw_get_font();
var _cur_allign = draw_get_halign();

draw_set_halign(fa_center);
draw_set_font(DayDream_pt8);
draw_text_ext_color(x,y-20, "S",1,200,s_color,s_color,s_color,s_color,1);

draw_set_font(_cur_font);
draw_set_halign(_cur_allign);
