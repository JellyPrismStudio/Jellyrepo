if live_call() return live_result;

// Font Settings
	spr_res = 64;
	draw_set_font(DayDream);
	namefontsize = string_width(bubblename);
	draw_set_font(Ruler);
	textfontsize = string_width(text2);	
	
		keepbigger = true
		var strsize1 = string_width(opt1);
		var strsize2 = string_width(opt2);
		if keepbigger
		{
			if strsize1 > strsize2 strsize2 = strsize1
			else strsize1 = strsize2			
		}
	
	horz = true
	// Variables
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
		draw_text_color(xx,yy - hh - nnt*2+yfix,text2,colortext,colortext,colortext,colortext,0.9);}
	else	
		{
		draw_sprite_ext(graphic,0,xx, yy-hh-nnt+yfix+ypadding, xs + xpadding2, ys + ypadding2, 0, c_white, 1);
		draw_text_color(xx,yy - hh - nnt*2+yfix,text2,colortext,colortext,colortext,colortext,0.9);	
		
		// ====== //
		yyn = (yy - hh - nnt*2 - string_height(text2)+yfix)
		draw_set_font(DayDream);
		draw_text_color(xx,yyn,bubblename + ":",colorname,colorname,colorname,colorname,0.9);
		draw_set_font(Ruler);
	}
	
	function over_image_ext2(sprite, xx, yy, width, height, padding = 50, ongui = true)
	{	
		if ongui == true
		{
			if plus_point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), xx - sprite_get_xoffset(sprite), yy - sprite_get_yoffset(sprite), xx + sprite_get_width(sprite) + width, yy + sprite_get_height(sprite)+height) return true
			else return false	
		}
		else
		{
			if plus_point_in_rectangle(mouse_x, mouse_y, xx - width/2,
														 yy - height/2, 
														 xx + width/2 - padding, 
														 yy + height/2 - padding) return true
			else return false	
		}
	}
	
	
	if message_ended
	{
		ycom =  (-hh)
		
		
		if !horz
		{
			if over_image_ext2(spr_BubbleSpeech2, xx, yy + 11 +ycom, strsize1 + 50,40, 10, false) {
			plus_draw_sprite(spr_BubbleSpeech2,xx,yy + 23 +ycom, (strsize1 + 50), 40)
				if to_gamepad_click(mb_left) {				
					super.scene_indexer = page1;
					super.scene[self.scene_indexer] = -1;
					choice = 1;
				}
				}
			else plus_draw_sprite(spr_BubbleSpeech3,xx,yy + 23+ycom, (strsize1 + 50), 40)
			plus_text_font(xx,yy + 11+ycom,opt1,#2a1c05,DayDream_pt5, fa_center, fa_bottom);
	
			if over_image_ext2(spr_BubbleSpeech2, xx, yy + 50+ycom, strsize2 + 50,40, 10, false) {
				plus_draw_sprite(spr_BubbleSpeech2,xx,yy + 62+ycom, (strsize2 + 50), 40)
				if to_gamepad_click(mb_left) {
					super.scene_indexer = page2;
					super.scene[self.scene_indexer] = -1;
					choice = 2;
				}
			}
			else plus_draw_sprite(spr_BubbleSpeech3,xx,yy + 62 + ycom, (strsize2 + 50), 40)
			plus_text_font(xx,yy + 50 + ycom,opt2,#2a1c05,DayDream_pt5, fa_center, fa_bottom);		
			
		}
		else
		{
			xcom1 = strsize1/2;
			xcom2 = strsize2/2;
			xpad = 40;
			if over_image_ext2(spr_BubbleSpeech2, xx - xcom1 - xpad, yy + 11 +ycom, strsize2 + 50,40, 10, false) {
			plus_draw_sprite(spr_BubbleSpeech2,xx - xcom1 -xpad,yy + 23 +ycom, (strsize1 + 50), 40)
				if to_gamepad_click(mb_left) {				
					super.scene_indexer = page1;
					super.scene[self.scene_indexer] = -1;
					choice = 1;
				}
			}
			else plus_draw_sprite(spr_BubbleSpeech3,xx - xcom1 -xpad,yy + 23+ycom, (strsize1 + 50), 40)
			plus_text_font(xx - xcom1 -xpad,yy + 11+ycom,opt1,#2a1c05,DayDream_pt5, fa_center, fa_bottom);
	
			if over_image_ext2(spr_BubbleSpeech2, xx + xcom2 +xpad, yy + 11+ycom, strsize2 + 50,40, 10, false) {
				plus_draw_sprite(spr_BubbleSpeech2,xx + xcom2+xpad,yy + 23+ycom, (strsize2 + 50), 40)
				if to_gamepad_click(mb_left) {
					super.scene_indexer = page2;
					super.scene[self.scene_indexer] = -1;
					choice = 2;
				}
			}
			else plus_draw_sprite(spr_BubbleSpeech3,xx + xcom2+xpad,yy + 23 + ycom, (strsize2 + 50), 40)
			plus_text_font(xx + xcom2+xpad,yy + 11 + ycom,opt2,#2a1c05,DayDream_pt5, fa_center, fa_bottom);	
			
		}
		
		
		
	}
	
	
	