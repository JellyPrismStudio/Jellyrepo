if live_call() return live_result;
/// @description Insert description here
if global.config.fullscreen display_set_gui_maximize(1,1)
itens = [0];
itens = array_concat(itens, global.inventory);
prices = [0];
prices = array_concat(prices, global.inventoryunit);

mousex = window_mouse_get_x()
mousey = window_mouse_get_y()
draw_set_font(DayDream_pt6);
draw_sprite_ext(Sprite102,0,0,0,2*_ggratio[0],2*_ggratio[1],0,c_white,1);



function click_to_buy()
{
	//selected[i].worlditem
	if i2 > array_length(selected) - 1 sdm("Nada");
	else {
		if selected[i2].sellable
		{
			play_audio("SFX", Coin_Drop, 1, false, 1);
			remove_from_inv(selected[i2], 1, selected[i2].code);
			global.gold += int64(selected[i2].value/2);
		}
		//add_item("glob", 2);
	}
}

for (i2=0;i2<slots;i2++)
{
	ratio = [1,1];
	
	rinit_x = base_x * ratio[0];
	rinit_y = base_y * ratio[1];
	sdm(mousex, mousey, ratio, rinit_x, rinit_y);
	rwidth = base_width * ratio[0];
	rheight = base_height * ratio[1];
	rspacing = spacing * ratio[1];
	if point_in_rectangle(mousex, mousey, rinit_x, rinit_y + (i2*rspacing), rinit_x + (rwidth), rinit_y + (i2*rspacing) + (rheight))
	{
		if to_gamepad_pressed(mb_left)
		{
			if i2 == 0 or i2 == slots - 1
			{
				selected = []
				if i2 == 0 and page > pagemin page--;
				if i2 == slots - 1 and page < pagemax page++;
				
				for(a = 0; a<slots-1; a++)
				{
					if a + page*(slots-2) < array_length(itens)	array_push(selected, itens[a + page*(slots-2)])
				}
			}
			else
			{
				 sdm("bought");
				click_to_buy();
			}
		}
	}
	if i2 == 0 or i2 == slots - 1
	{
		
		//draw_sprite_stretched(spr_BubbleSpeech,0,0,0,1280,20);
		//draw_rectangle(init_x, init_y + (i*spacing), init_x + width, init_y + (i*spacing) + height, true)	
		draw_set_valign(fa_middle);
		draw_set_halign(fa_center);
		if point_in_rectangle(mousex, mousey, rinit_x, rinit_y + (i2*rspacing), rinit_x + rwidth, rinit_y + (i2*rspacing) + rheight)
		{	

			sdm("myi:", i2);
			if (i2 == 0 and page == pagemin)
			{
				draw_sprite_stretched(spr_BubbleSpeechGray,0,init_x + width/4, init_y + (i2*spacing),width/2,height);
				plus_text_font(init_x + width/2, init_y + (i2*spacing) + height/2, global.language.shop.page, c_black, DayDream_pt8, fa_center, fa_middle)
			}
			else if i2 == slots - 1 and page == pagemax
			{
				draw_sprite_stretched(spr_BubbleSpeechGray,0,init_x + width/4, init_y + (i2*spacing),width/2,height);
				plus_text_font(init_x + width/2, init_y + (i2*spacing) + height/2, global.language.shop.page, c_black, DayDream_pt8, fa_center, fa_middle)
			}
			else {
				draw_sprite_stretched(spr_BubbleSpeech,0,init_x + width/4, init_y + (i2*spacing),width/2,height);
				plus_text_font(init_x + width/2, init_y + (i2*spacing) + height/2, global.language.shop.page, c_orange, DayDream_pt8, fa_center, fa_middle)
			}
		}
		else
		{
			draw_sprite_stretched(spr_BubbleSpeech,0,init_x + width/4, init_y + (i2*spacing),width/2,height);
			if i2 == 0 and page == pagemin
			{
				draw_sprite_stretched(spr_BubbleSpeechGray,0,init_x + width/4, init_y + (i2*spacing),width/2,height);
				plus_text_font(init_x + width/2, init_y + (i2*spacing) + height/2, global.language.shop.page, c_black, DayDream_pt8, fa_center, fa_middle)
			}
			else if i2 == slots - 1 and page == pagemax
			{
				draw_sprite_stretched(spr_BubbleSpeechGray,0,init_x + width/4, init_y + (i2*spacing),width/2,height);
				plus_text_font(init_x + width/2, init_y + (i2*spacing) + height/2, global.language.shop.page, c_black, DayDream_pt8, fa_center, fa_middle)
			}
			else plus_text_font(init_x + width/2, init_y + (i2*spacing) + height/2, global.language.shop.page, c_white, DayDream_pt8, fa_center, fa_middle)
		}
		draw_set_valign(fa_top);
	}
	else
	{
		
		if i2 < array_length(selected)
		{
			
			//draw_rectangle(init_x, init_y + (i*spacing), init_x + width, init_y + (i*spacing) + height, true)	
			draw_set_valign(fa_middle);
			if point_in_rectangle(mousex, mousey, rinit_x, rinit_y + (i2*rspacing), rinit_x + rwidth, rinit_y + (i2*rspacing) + rheight)
			{
				draw_sprite(selected[i2].icon, selected[i2].iconid, init_x + 15, init_y + (i2*spacing) + height/2)
				plus_text_font(init_x + 40, init_y + (i2*spacing) + height*0.8, selected[i2].text, c_white, Varnished, fa_left, fa_middle);
				plus_text_font(init_x + 30, init_y + (i2*spacing) + height/2, selected[i2].nome, c_orange, DayDream_pt8, fa_left, fa_middle);
				highlited = i2;
			}
			else
			{
				if selected[i2].sellable draw_sprite_stretched(spr_BubbleSpeech5,0,init_x, init_y + (i2*spacing),width,height);
				else draw_sprite_stretched(spr_BubbleSpeechGray,0,init_x, init_y + (i2*spacing),width,height);
				draw_sprite(selected[i2].icon, selected[i2].iconid, init_x + 20, init_y + (i2*spacing) + height/2)
				plus_text_font(init_x + 30, init_y + (i2*spacing) + height/2, selected[i2].nome, c_white, DayDream_pt8, fa_left, fa_middle);
			
			}
		
				draw_set_halign(fa_right)
				var qtd = quantity[i2];
				if string(selectedprices[i2]) > 1 {
					
					if point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(),	init_x + width +5,		init_y + (i2*spacing) + height/2 - 10,	init_x + width +15,		init_y + (i2*spacing) + height/2 + 20) {
						plus_text(init_x + width +10, init_y + (i2*spacing) + height/2,">",c_orange);
						if mouse_check_button_pressed(mb_left) quantity[i2]+=1;
					}
					else
					{
						plus_text(init_x + width +10, init_y + (i2*spacing) + height/2,">",c_white);	
					}
				}
				if qtd > 1 {					
					if point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(),init_x + width - 610,init_y + (i2*spacing) + height/2 - 5,init_x + width - 600,init_y + (i2*spacing) + height/2 + 15) {
						plus_text(init_x + width - 605, init_y + (i2*spacing) + height/2,"<", c_orange);
						if mouse_check_button_pressed(mb_left) if quantity[i2] > 0 quantity[i2]-=1;
					}
					else
					{
						draw_text(init_x + width - 605, init_y + (i2*spacing) + height/2,"<");	
					}
				}
				//point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(),200,620,220,640)
				if selected[i2].sellable plus_text(init_x + width -130, init_y + (i2*spacing) + height/2, global.language.shop.amount + string(qtd), c_white, 1, fa_left, fa_middle);
				else  plus_text(init_x + width -130, init_y + (i2*spacing) + height/2, "Cannot Sell", c_white, 1, fa_left, fa_middle);
				plus_text(init_x + width - 30, init_y + (i2*spacing) + height/2, int64(selected[i2].value/2), c_yellow, 1, fa_left, fa_middle);
				draw_set_halign(fa_left)
		}
	}
	
}
draw_set_halign(fa_right)
draw_set_font(DayDream_pt8);
plus_text_font(init_x + 30, init_y + ((slots)*spacing), global.gold, c_orange, DayDream_pt8, fa_left, fa_top);
draw_text(init_x + width, init_y + ((slots)*spacing), (global.language.shop.page + string(page+1) + "/" + string(pagemax + 1)));
draw_set_halign(fa_left)
if to_gamepad_pressed("X") {
	if cutscene == true {
		with (super) cutscene_end_action();
	}
	unpause_game();
	global.onmenu = false;
	instance_destroy();
}
// You can write your code in this editor
reset_display_GUI()