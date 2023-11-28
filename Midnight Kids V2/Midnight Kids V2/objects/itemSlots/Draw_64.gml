if live_call() return live_result;

if show_name == true {
	draw_set_font(DayDream_pt11);
	draw_set_halign(fa_middle);
	draw_set_valign(fa_top);
	var textname = draw_text_color(850,265+yyfix,nome,color,color,color,color,1);
	draw_set_halign(fa_right);
	var textqtty = draw_text_color(925,350+yyfix,"x"+string(quantity),color,color,color,color,1);
	var spriteim = draw_sprite_ext(sprite_index,image_index,850,330+yyfix,3,3,rot,c_white,1);
	draw_set_halign(fa_left);
	draw_set_font(Ruler);
	var textdesc = draw_text_ext_color(740,380+yyfix,description,14,220,color,color,color,color,1);
	var separator = draw_text_ext_color(740,434+yyfix,"----------------",14,220,color,color,color,color,1);
	var effects = draw_text_ext_color(740,448+yyfix,effect_text,14,220,color,color,color,color,1);
	//var textdesc = draw_text(740,380,description);
}
draw_set_halign(fa_left);