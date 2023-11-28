	// Font Settings
	spr_res = 64;
	draw_set_font(DayDream);
	namefontsize = string_width(bubblename);
	draw_set_font(Ruler);
	textfontsize = string_width(text2);	
	
	// Variables
	var graphicpointer = pointergraph;
	sz = font_get_size(upHeave);
	xx = object.x;
	xpadding = 0;
	xpadding2 = (xpadding/spr_res)*4;
	ypadding = 0;
	ypadding2 = (ypadding/spr_res)*2;
	yy = object.y;
	ww = object.sprite_width;
	hh = object.sprite_height;
	nn = sprite_get_nineslice(graphic);
	nnt = nn.top;
	nnl = nn.left;
	
	if keyboard_check_pressed(vk_space){
		j = string_length(text);
		text2 = string_copy(text,1, string_length(text));
	}
	
	// Verificando se o nome da fonte é maior que o texto em si, para redimensionar a bubble
	if(namefontsize > textfontsize){
			draw_set_font(DayDream);
			tw = string_width(bubblename);
			th = string_height(bubblename);
			xs = (string_width(bubblename)			/ spr_res) + ((nnl*3)/spr_res);
			ys = ((string_height(bubblename)+ sz)	/ spr_res) + ((nnt*3)/spr_res);
			draw_set_font(Ruler);
	} else {
			tw = string_width(text2);
			th = string_height(text2);
			xs = (string_width(text2)		/ spr_res) + ((nnl*2)/spr_res);
			ys = (string_height(text2)		/ spr_res) + ((nnt*2)/spr_res);
	}
	if bubblename != "" ys = ((string_height(bubblename)+ string_height(text2))	/ spr_res) + ((nnt*2)/spr_res);
	// Contador de letras
	text_count++;
	if text_count > 1 and j <= string_length(text){
		text2 = string_copy(text, 1, j);
		j++;
		text_count = 0;
	}
	if j >= string_length(text) message_ended = true;
	
	/*if to_gamepad_click(mb_left) {
		j = string_width(text);
		text2 = string_copy(text, 1, j);
		text_count = 0;
	}*/
	
	// Draws
	//======================================//
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	//======================================//
	if bubblename == "" {
		draw_sprite_ext(graphic,0,xx, yy-hh-nnt+yfix, xs + xpadding2, ys, 0, c_white, 1);
		draw_sprite_ext(graphicpointer,0,xx-4, yy-hh-nnt+yfix+pointerfix, 1, 1, 0, c_white, 1);
		draw_text_color(xx,yy - hh - nnt*2+yfix,text2,colortext,colortext,colortext,colortext,0.9);}
	else		
		{
		draw_sprite_ext(graphic,0,xx, yy-hh-nnt+yfix+ypadding, xs + xpadding2, ys + ypadding2, 0, c_white, 1);
		draw_sprite_ext(graphicpointer,0,xx-4, yy-hh-nnt+yfix+pointerfix, 1, 1, 0, c_white, 1);
		draw_text_color(xx,yy - hh - nnt*2+yfix,text2,colortext,colortext,colortext,colortext,0.9);	
		
		// ====== //
		yyn = (yy - hh - nnt*2 - string_height(text2)+yfix)
		draw_set_font(DayDream);
		draw_text_color(xx,yyn,bubblename + ":",colorname,colorname,colorname,colorname,0.9);
		draw_set_font(Ruler);
	}