text_count++;
draw_set_font(font);
draw_set_halign(align);
if text_count > textspeed and j < string_width(texto){
	text2 = string_copy(texto, 1, j);
	j++;
	text_count = 0;
}
if destroy {
	colortext = c_red;
	font = RulerName;
}
plus_text(xx,yy,text2,colortext);