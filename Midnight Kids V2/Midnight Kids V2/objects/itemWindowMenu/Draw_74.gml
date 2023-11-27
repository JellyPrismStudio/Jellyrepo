if live_call() return live_result;
draw_set_valign(fa_bottom);
function get_item_type(tipo)
{
	var vcolor = c_white
	if tipo == "misc"		vcolor = c_red;
	if tipo == "usable"		vcolor = #1d752c;
	if tipo == "material"	vcolor = #517474;
	if tipo == "craftable"	vcolor = #826058;
	if tipo == "key"		vcolor = #ad5e54;
	if tipo == "weapon"		vcolor = #9d355c;
	
	if tipo == "helmet" or tipo == "armor" or tipo == "acessories" or tipo == "equip" vcolor = #505093;
	return vcolor
	
}

/////////////////////////////////////
/// * CREATE
/////////////////////////////////////

for(f=0;f<array_length(filters);f++)
{
	if gui_image_hitbox(320 + f*20, 500, sFilter1, 1.4)
	{
		draw_sprite_ext(sFilter1, 1, 320 + f*20, 500, 1, 1, 0, c_white, 1)
		if to_gamepad_click(mb_left) {
			filter = f;
			page = 0;
			filtered_inv();			
		}
		plus_text_font(320 + f*20, 540, filters[f], c_white, Varnished, fa_left)
	}
	else draw_sprite_ext(sFilter1, 1, 320 + f*20, 500, 0.8, 0.8, 0, c_gray, 1)
}

//////////////
sdm(pages);
draw_set_halign(fa_left)
draw_text(320, 495, global.language.menu.filter + string(filters[filter]))

draw_sprite_ext(InvBackground,0,global.camera.width - 200 , global.camera.height, 2,2,0,c_white,1);
draw_sprite_ext(InvBackground,0,global.camera.width + 200 , global.camera.height, 2,2,0,c_white,1);
	
//page = 0;
if page > 0  {
	if gui_image_hitbox(290, 370, sMenuArrowRight, 4) {
		draw_sprite_ext(sMenuArrowRight, 1, 290, 370,1,1,180,c_white,2);
		if  to_gamepad_click(mb_left){
			page--
			filtered_inv();
		}
	}
	else
	{
		draw_sprite_ext(sMenuArrowRight, 1, 290, 370,1,1,180,c_gray,1.8);
	}
	
	if  keyboard_check_pressed(vk_left){
		page--
		filtered_inv();
	}
}
if page < array_length(pages) - 1 {
	
	if gui_image_hitbox(590, 370, sMenuArrowRight, 4) {
		draw_sprite_ext(sMenuArrowRight, 1, 590, 370,1,1,0,c_white,2);
		if  to_gamepad_click(mb_left){
			page++
			filtered_inv();
		}
	}
	else
	{
		draw_sprite_ext(sMenuArrowRight, 1, 590, 370,1,1,0,c_gray,1.8);
	}	
	
	if keyboard_check_pressed(vk_right)  {
		page++
		filtered_inv();
	}
}
draw_sprite_ext(global.player_stats[global.player_index].idlegraph, 0, 640, 450,2,2,0,c_white,1)
if page == 0 last_i = 0;
hover = false;
for(i=pages[page];k<=pagelimit;i++){
	// Chegou ao fim do inventário
	if i == array_length(global.inventory) break
	if i==last_i k = 0;
	////////////////////////////////////
	
	var row = k % columnlimit;
	var col = floor(k / columnlimit);
	
	//// CUSTOMIZE
	var color = #bb7033
	// Cor da quantidade de itens (circulo)
	
	var _spacing = [3,0];
	// Espaçamento entre itens
	
	

	if (filter == 0 and global.inventory[i].tipo != "hidden") or (filter > 0 and global.inventory[i].tipo == filters[filter])
	{		
		
			var item_color = get_item_type(global.inventory[i].tipo);
			if run_funct[1] = i		draw_circle_color(360 + row*(50 + _spacing[0]), 300 + col*(60 + _spacing[1]), 20, c_red, c_red, false)
			else					draw_circle_color(360 + row*(50 + _spacing[0]), 300 + col*(60 + _spacing[1]), 20, item_color, item_color, false)
			if gui_image_hitbox(360 + row*(50 + _spacing[0]), 300 + col*(60 + _spacing[1]), global.inventory[i].icon, 2.1)  
			{	
				hover = true;
				draw_sprite_ext(global.inventory[i].icon, global.inventory[i].iconid, 360 + row*(50 + _spacing[0]), 300 + col*(60 + _spacing[1]), global.camera.ratio, global.camera.ratio, 0, #faaf5a, 1);
				plus_text_font_ext(840, 260, global.inventory[i].nome, #782326, DayDream_pt11, 180, 20, fa_center, fa_top)
				
				draw_circle_color(960,280,24, item_color, item_color, false)
				draw_sprite_ext(global.inventory[i].icon, global.inventory[i].iconid, 961, 280, 2, 2, 0, c_white, 1);
				
				if global.inventory[i].effect_text != "" plus_text_font(740,420, global.language.menu.effects, item_color, DayDream_pt8, fa_left, fa_top);
				plus_text_font(740,440, global.inventory[i].effect_text, #664432, Ruler, fa_left, fa_top);
				plus_text_font_ext(740, 330, "[" + string_upper(global.inventory[i].tipo) + "]", item_color, Varnished, 200, 15, fa_left, fa_top);
				plus_text_font(810,330,string(global.inventoryunit[i]) + global.language.menu.itemqt, #664432, Varnished, fa_left, fa_top);
				plus_text_font_ext(740, 340, global.inventory[i].text, #664432, Ruler, 200, 15, fa_left, fa_top);
				draw_circle_color(380 + row*(50+ _spacing[0]), 315 + col*(60 + _spacing[1]), 12, item_color, item_color, false)
				
				if mouse_check_button_pressed(mb_left) and global.inventory[i].tipo == "usable"
				{					
					run_funct = [true, i, global.inventory[i].effect, global.inventory[i].arg0, global.inventory[i].arg1, false]
					//break;
				}
				
			}
			else {
				
				draw_sprite_ext(global.inventory[i].icon, global.inventory[i].iconid, 360 + row*(50 + _spacing[0]), 300 + col*(60 + _spacing[1]), global.camera.ratio - 0.1, global.camera.ratio - 0.1, 0, c_white, 1);
				draw_circle_color(380 + row*(50+ _spacing[0]), 315 + col*(60 + _spacing[1]), 10, color, color, false)
			}
			
			
			draw_set_halign(fa_center);
			draw_text(380 + 1 + row*(50 + _spacing[0]), 320 + 2 + col*(60 + _spacing[1]), global.inventoryunit[i])
			draw_set_halign(fa_left);
			if k == pagelimit {
				last_i = i+1;
				break;
				//k = 0;
			}
			else k++;			
	}
	
}


if run_funct[0] == true
{
	
		if !hover
		{
			var item_color = get_item_type(global.inventory[run_funct[1]].tipo);
			sdm(item_color);
			//draw_sprite_ext(global.inventory[run_funct[1]].icon, global.inventory[run_funct[1]].iconid, 360 + row*(50 + _spacing[0]), 300 + col*(60 + _spacing[1]), global.camera.ratio, global.camera.ratio, 0, #ffc078, 1);
			plus_text_font_ext(840, 260, global.inventory[run_funct[1]].nome, #782326, DayDream_pt11, 180, 20, fa_center, fa_top)
			draw_circle_color(960,280,24, item_color, item_color, false)
			draw_sprite_ext(global.inventory[run_funct[1]].icon, global.inventory[run_funct[1]].iconid, 961, 280, 2, 2, 0, c_white, 1);
				
			if global.inventory[run_funct[1]].effect_text != "" plus_text_font(740,420, global.language.menu.effects, item_color, DayDream_pt8, fa_left, fa_top);
			plus_text_font(740,440, global.inventory[run_funct[1]].effect_text, #664432, Ruler, fa_left, fa_top);
			plus_text_font_ext(740, 330, "[" + string_upper(global.inventory[run_funct[1]].tipo) + "]", item_color, Varnished, 200, 15, fa_left, fa_top);
			plus_text_font(810,330,string(global.inventoryunit[run_funct[1]]) + global.language.menu.itemqt, #664432, Varnished, fa_left, fa_top);
			plus_text_font_ext(740, 340, global.inventory[run_funct[1]].text, #664432, Ruler, 200, 15, fa_left, fa_top);
			//draw_circle_color(380 + row*(50+ _spacing[0]), 315 + col*(60 + _spacing[1]), 12, item_color, item_color, false)
		}
		if run_funct[1] != -4 {
			if script_exists(global.inventory[run_funct[1]].effect) 
			{
				script_execute(global.inventory[run_funct[1]].effect, global.inventory[run_funct[1]].arg0, global.inventory[run_funct[1]].arg1);
			}
			else {
				run_funct[0] = false;
				run_funct[1] = -4;
			}
		}
		
}