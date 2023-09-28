randomize();

function plus_instance_create_layer(xx,yy,layername,object, layerdepth = depth){
	if !layer_exists(layername){
		show_debug_message("criou a layer: " + layername);
		layer_create(layerdepth, layername);
	}
	var returned = instance_create_layer(xx,yy,layername,object);
	return returned;
}

function plus_text(xx,yy,str,color, sep = 0, ww = 1200, hallign = fa_center, vallign = fa_middle){
	var ah = draw_get_halign();
	var vh = draw_get_valign();
	draw_set_halign(hallign);
	draw_set_valign(vallign);
	draw_text_color(xx,yy,str,color,color,color,color,1)
	//draw_text_ext_color(xx,yy,str,sep,ww,color,color,color,color,1);
	draw_set_halign(ah);
	draw_set_valign(vh);
}

function plus_text_font(xx,yy,str,color, font, hallign = fa_center, vallign = fa_middle){
	var ah = draw_get_halign();
	var vh = draw_get_valign();
	var ft = draw_get_font();
	draw_set_font(font);
	draw_set_halign(hallign);
	draw_set_valign(vallign);
	draw_text_color(xx,yy,str,color,color,color,color,1);
	//draw_text_ext_color(xx,yy,str,sep,ww,color,color,color,color,1);
	draw_set_font(ft);
	draw_set_halign(ah);
	draw_set_valign(vh);
}

function plus_text_font_ext(xx,yy,str,color, font, width=100, height=15, hallign = fa_center, vallign = fa_middle){
	var ah = draw_get_halign();
	var vh = draw_get_valign();
	var ft = draw_get_font();
	draw_set_font(font);
	draw_set_halign(hallign);
	draw_set_valign(vallign);
	draw_text_ext_color(xx,yy,str,height,width,color,color,color,color,1)
	//draw_text_ext_color(xx,yy,str,sep,ww,color,color,color,color,1);
	draw_set_font(ft);
	draw_set_halign(ah);
	draw_set_valign(vh);
}

function plus_debug_message(string1="",string2="",string3="",string4=""){
	intern_message(string1,string2,string3,string4);
}

function sdm(string1="",string2="",string3="",string4="", string5="", string6="", string7="", string8=""){
	intern_message(string1,string2,string3,string4,string5,string6,string7,string8);
}

function intern_message(string1="",string2="",string3="",string4="", string5="", string6="", string7="", string8=""){
	show_debug_message(string(get_timer() / 1000000) + "|||  " + string(string1) + "   " + string(string2) + "   " + string(string3) + "   " + string(string4)	+ "   " + string(string5)	+ "   " + string(string6)	+ "   " + string(string7)	+ "   " + string(string8)	)
}

function plus_draw_sprite(sprite_index, xx, yy, width, height)
{

	var scale_x = width / sprite_get_width(sprite_index);
	var scale_y = height / sprite_get_height(sprite_index);

	draw_sprite_ext(sprite_index, 0, xx, yy, scale_x, scale_y, 0, -1, 1);
}

