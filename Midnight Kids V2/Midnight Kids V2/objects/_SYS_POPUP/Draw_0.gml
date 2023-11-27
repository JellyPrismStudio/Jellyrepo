if !global.onmenu and !global.on_message{
	spr_res = 64;
	draw_set_font(DayDream);
	namefontsize = string_width(bubblename);
	textfontsize = string_width(text);	
	
	var graphicpointer = NullSprite;
	sz = font_get_size(upHeave);
	xx = object.x;
	yy = object.y;
	ww = object.sprite_width;
	hh = object.sprite_height;
	nn = sprite_get_nineslice(graphic);
	nnt = nn.top;
	nnl = nn.left;
	
	if(namefontsize > textfontsize){
			draw_set_font(DayDream);
			tw = string_width(bubblename);
			th = string_height(bubblename);
			xs = (string_width(bubblename)			/ spr_res) + ((nnl*2)/spr_res);
			ys = ((string_height(bubblename)+ sz)	/ spr_res) + ((nnt*2)/spr_res);
	} else {
			tw = string_width(text);
			th = string_height(text);
			xs = (string_width(text)		/ spr_res) + ((nnl*2)/spr_res);
			ys = (string_height(text)		/ spr_res) + ((nnt*2)/spr_res);
	}
	if bubblename != "" ys = ((string_height(bubblename)+ string_height(text))	/ spr_res) + ((nnt*2)/spr_res);
	
	//show_debug_message("bn: " + string(string_width(bubblename)) + " gph: " + string(spr_res));
	//show_debug_message("tw: " + string(tw) + " th: " + string(th) + " length: " + string(string_length(text)));
	//show_debug_message("XS: " + string(xs) + " YS: " + string(ys) + " length: " + string(string_length(text)));
	//show_debug_message("nnl: " + string(nnl) + " nnt: " + string(nnt) + " MbSprite:   " + string(spr_res));
	
	//======================================//
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	//======================================//
	if bubblename == "" {
		draw_sprite_ext(graphic,0,xx, yy-hh-nnt+yfix, xs, ys, 0, c_white, 1);
		draw_sprite_ext(sprPopupBG2,0,xx,(yy - hh - nnt/2 -th - 5) +yfix,tw/8 + 3,th/2,0,c_white,1)
		draw_sprite_ext(graphicpointer,0,xx-4, yy-hh-nnt+yfix+pointerfix, 1, 1, 0, c_white, 1);
//		draw_text_color(xx,yy - hh - nnt*2+yfix+3,text,c_black,c_black,c_black,c_black,0.5);
//		draw_text_color(xx,yy - hh - nnt*2+yfix-1,text,c_black,c_black,c_black,c_black,0.7);
		draw_text_color(xx,yy - hh - (nnt*2)+yfix,text,colortext1,colortext2,colortext3,colortext4,0.9);
		}
	else		
		{
		draw_sprite_ext(graphic,0,xx, yy-hh-nnt+yfix, xs, ys, 0, c_white, 1);
		draw_sprite_ext(graphicpointer,0,xx-4, yy-hh-nnt+yfix+pointerfix, 1, 1, 0, c_white, 1);
//		draw_text_color(xx,yy - hh - nnt*2+yfix+3,text,c_black,c_black,c_black,c_black,0.5);
//		draw_text_color(xx,yy - hh - nnt*2+yfix-1,text,c_black,c_black,c_black,c_black,0.7);
		draw_text_color(xx,yy - hh - (nnt*2)+yfix,text,colortext1,colortext2,colortext3,colortext4,0.9);
		// ====== //
		yyn = (yy - hh - nnt*2 - string_height(text)+yfix)
		draw_set_font(DayDream);
//		draw_text_color(xx,yy - hh - nnt*2+yfix+3,text,c_black,c_black,c_black,c_black,0.5);
//		draw_text_color(xx,yy - hh - nnt*2+yfix-1,text,c_black,c_black,c_black,c_black,0.7);
		draw_text_color(xx,yy - hh - nnt*2+yfix,text,colortext1,colortext2,colortext3,colortext4,0.9);
		
	}
}