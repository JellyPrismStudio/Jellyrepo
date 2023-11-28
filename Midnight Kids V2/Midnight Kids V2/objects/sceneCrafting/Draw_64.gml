if live_call() return live_result;



/////////////////////////////

function draw_loading_bar(x, y, actual_value, max_value, bar_color, backgroundcolor, bar_width, bar_height, corner_radius)
{
   var percentage = actual_value / max_value;
    
	// Calculate the position of the loading bar to center it
	var bar_x = x - (bar_width / 2);
	var bar_y = y - bar_height;
    
	// Draw the background
	draw_roundrect_color_ext(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, corner_radius, corner_radius, backgroundcolor, backgroundcolor, false)
    
	// Draw the loading bar
	var bar_length = bar_width * percentage;
	//draw_roundrect_color(bar_x, bar_y, bar_x + bar_length, bar_y + bar_height, bar_color, bar_color, false);
	draw_roundrect_color_ext(bar_x, bar_y, bar_x + bar_length, bar_y + bar_height, corner_radius, corner_radius, bar_color, bar_color, false)

}

function create_background(){
	// Filtros
	draw_sprite_ext(spr_BubbleSpeech3, 1, 55, 280, 0.8, 0.6, 0, c_white, 1);
	draw_sprite_ext(spr_BubbleSpeech4, 1, 55, 320, 0.8, 0.6, 0, c_white, 1);
	draw_sprite_ext(spr_BubbleSpeech3, 1, 55, 360, 0.8, 0.6, 0, c_white, 1);
	draw_sprite_ext(spr_BubbleSpeech3, 1, 55, 400, 0.8, 0.6, 0, c_white, 1);
	draw_sprite_ext(spr_BubbleSpeech3, 1, 55, 440, 0.8, 0.6, 0, c_white, 1);	
	
	draw_sprite_ext(spr_BubbleSpeech4, 1, 155, 140, 2.3, 1, 0, c_white, 1);
	draw_sprite_ext(spr_BubbleSpeech3, 1, 305, 140, 2.3, 1, 0, c_white, 1);
	draw_sprite_ext(spr_BubbleSpeech4, 1, 230, 530, 5, 6.5, 0, c_white, 1);
	
	draw_sprite_ext(spr_BubbleSpeech4, 1, 230, 640, 4.8, 1.7, 0, c_white, 1);
	
	/////
	
	draw_sprite_ext(spr_BubbleSpeech4, 1, 535, 140, 3.6, 1, 0, #c7b9b9, 1);
	draw_sprite_ext(spr_BubbleSpeech4, 1, 755, 365, 2.4, 3.7, 0,c_white, 1);
	draw_sprite_ext(spr_BubbleSpeech4, 1, 535, 365, 4.3, 3.9, 0, c_white, 1);		
	draw_sprite_ext(spr_BubbleSpeech4, 1, 615, 595, 5.8, 3.0, 0, c_white, 1);
	
	//////
	
	draw_sprite_ext(spr_BubbleSpeech4, 1, 1015, 140, 3.3, 1, 0, #c7b9b9, 1);
	draw_sprite_ext(spr_BubbleSpeech4, 1, 1030, 645, 6, 8.26, 0, c_white, 1);
}

var font_color = #4C301E;
var font_small = Gelatin;


function crafting_inv_refresh()
{
	materialtag = "material";
	craftinginv = [[-1,-1]];
	for(k=0;k<array_length(global.inventory);k++)
	{
		if global.inventory[k].tipo == materialtag {
			array_push(craftinginv, [global.inventory[k], global.inventoryunit[k]])
			//array_push(craftinginv[k][1], global.inventoryunit[k])
		}
		
	}
}

function get_fx(i)
{
	if i == 0 return "atk"
	if i == 1 return "def"
	if i == 2 return "mag"
	if i == 3 return "crit"
	if i == 4 return "eva"
	if i == 5 return "hit"
	if i == 6 return "hp"
	if i == 7 return "sp"	
}

/////////////////////////////



iscale = 2;
craftingXp = 19;
craftinglvl = 1;
craftingrqr = [40, 100, 250, 650, 1500];


//draw_sprite_ext(sketchtest, 0, 0, -20, 1, 1, 0, c_white, 0.4);

draw_set_alpha(0.6);
bg_color = c_dkgrey;
draw_rectangle_color(0,0,1500,1200,bg_color,bg_color,bg_color,bg_color,false)
draw_set_alpha(1);


create_background();

if over_image(sMenuArrowClose, 1205, 70) {
	draw_sprite_ext(sMenuArrowClose, 0, 1205,70, 1, 1, 0, c_red, 1)
	if to_gamepad_click(mb_left)
	{
		instance_destroy();	
	}
}
else draw_sprite_ext(sMenuArrowClose, 0, 1205,70, 1, 1, 0, c_white, 1)

txt1 = "Equipment";
txt2 = "Costume";
txt4 = "Inventory";
txt3font = DayDream_pt8;
fontstatus = DayDream_pt8;

//Equipment text
plus_text_font(155,105, txt1, font_color, DayDream_pt8, fa_middle, fa_bottom);

//Costume
plus_text_font(305,105, txt2, font_color, DayDream_pt8, fa_middle, fa_bottom);

//Inventory
plus_text_font(1015,105, txt4, font_color, DayDream_pt8, fa_middle, fa_bottom);

icn_x = 115;
icn_y = 160; 
spacex = 0;
spacey = 0;
button = 60;
buttoncolor		= c_olive;
buttoncolor2	= c_orange;
//selection		= [8, 3, 1, 1, 9, 33, 26, 19, 55, 76, 88, 63, 2, 17, 21];
selection		= [-1,global.equipment.CRAFTARMOR1, global.equipment.CRAFTARMOR2, global.equipment.CRAFTARMOR3, global.equipment.CRAFTARMOR4, global.equipment.CRAFTARMOR2];
//selection = [-1, global.itens.HERB1, global.itens.HERB1];

///

if equipselected > -1
{
	
	txt3 = selection[equipselected].nome;
	

	//Equip Name
	plus_text_font(535,105, txt3, font_color, txt3font, fa_center, fa_bottom);
}


////

invx = 880;
invy = 175;
inv_sx = 0;
inv_sy = 0;


for(i=1;i<array_length(selection);i++)
{
	if  i <= craftinglvl * 4 draw_circle_color(icn_x + 75*spacex, icn_y + spacey*100, 20, #99816E, #99816E, false)
	else draw_circle_color(icn_x + 75*spacex, icn_y + spacey*100, 20, #ffa495, #ffa495, false)
	if equipselected == i {
		if  i <= craftinglvl * 4 draw_circle_color(icn_x + 75*spacex, icn_y + spacey*100, 28, #7CC576, #7CC576, false)
		else draw_circle_color(icn_x + 75*spacex, icn_y + spacey*100, 28, #ff655c, #ff655c, false)
	}
	var above = plus_point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), icn_x + 75*spacex - button/2, icn_y + spacey*100 - button/2 ,icn_x + 75*spacex + button/2, icn_y + spacey*100 + button/2)
	if plus_point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), icn_x + 75*spacex - button/2, icn_y + spacey*100 - button/2 ,icn_x + 75*spacex + button/2, icn_y + spacey*100 + button/2) or equipselected == i
	{
		if mouse_check_button(mb_left) and above 
		{
			equipselected = i;
			plus_text_font_ext(icn_x+75*spacex, icn_y + spacey*100 + 45, selection[i].nome,c_green,font_small, 70, 10, fa_center, fa_top);
		}
		else
		{
			plus_text_font_ext(icn_x+75*spacex, icn_y + spacey*100 + 45, selection[i].nome,c_green,font_small, 70, 10, fa_center, fa_top);	
		}
		if i<= craftinglvl * 4 draw_sprite_ext(selection[i].icon, selection[i].iconid, icn_x + 75*spacex, icn_y + spacey*100, iscale, iscale, 0, c_white, 1);
		else draw_sprite_ext(selection[i].icon, selection[i].iconid, icn_x + 75*spacex, icn_y + spacey*100, iscale, iscale, 0, #ffa495, 1);
		
	}
	else
	{
		if i<= craftinglvl * 4 draw_sprite_ext(selection[i].icon, selection[i].iconid, icn_x + 75*spacex, icn_y + spacey*100, iscale, iscale, 0, c_gray, 1);
		else draw_sprite_ext(selection[i].icon, selection[i].iconid, icn_x + 75*spacex, icn_y + spacey*100, iscale, iscale, 0, #ff655c, 1);
		plus_text_font_ext(icn_x+75*spacex, icn_y + spacey*100 + 45, selection[i].nome,c_dkgray,font_small, 70, 10, fa_center, fa_top);
	}
	plus_text_font( icn_x + 75*spacex, icn_y + spacey*100 + 34,"Lv."+string(spacey+1), c_dkgray, DayDream_pt5)
	spacex++;
	
	if i % 4 == 0 
	{
		spacey++;
		spacex = 0;
	}
	
	
	if i >= craftinglvl * 8 break
}

crafting_inv_refresh()

for(j = 1; j<array_length(craftinginv); j++)
{
	var b2 = 40;
	
	if plus_point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), invx + 75*inv_sx - b2/2, invy + inv_sy*100 -b2/2,invx + 75*inv_sx + b2/2, invy + inv_sy*100 + b2/2)
	{
		draw_circle_color(invx + 75*inv_sx, invy + inv_sy*100, 20, c_orange, c_orange, false);
		plus_draw_sprite(spr_BubbleBaloon, invx + 75*inv_sx - 18 + 18, invy + inv_sy*100+39, string_width(craftinginv[j][0].nome)/2+16, 20);
		plus_text_font(invx + 75*inv_sx, invy + inv_sy*100+39,craftinginv[j][0].nome, font_color, font_small)
	}
	else
	{
		draw_circle_color(invx + 75*inv_sx, invy + inv_sy*100, 19, c_gray, c_gray, false);
	}
	draw_sprite_ext(craftinginv[j][0].icon, craftinginv[j][0].iconid, invx + 75*inv_sx, invy + inv_sy*100, iscale, iscale, 0, c_white, 1);
	draw_circle_color(invx + 75*inv_sx + 14, invy + inv_sy*100 + 20, 7, c_orange, c_orange, false);
	plus_text_font(invx + 75*inv_sx + 15, invy + inv_sy*100 + 21, craftinginv[j][1], font_color, font_small);
	inv_sx++;
	if j % 5 == 0 
	{
		inv_sy++;
		inv_sx = 0;
	}
	
}

////////
// * Effects
///////

effectsi = 0
if equipselected > -1
{
	draw_sprite_ext(selection[equipselected].icon,selection[equipselected].iconid,530,230,4,4,0,c_white,1)
	plus_text_font(730,150,"Bonus:", font_color, DayDream_pt8, fa_center, fa_middle);
	plus_text_font_ext(420,340,selection[equipselected].text, font_color, font_small, 237, 12, fa_left, fa_middle);
	for(i2=0;i2<8;i2++)
	{
		if selection[equipselected].atribute[i2] > 0
		{
			var stringfx = get_fx(i2);
			plus_text_font(695,180 + 20*effectsi,string(selection[equipselected].atribute[i2]), c_green, DayDream_pt8, fa_left, fa_middle);
			plus_text_font(750,180 + 20*effectsi,"  " + stringfx, c_maroon, DayDream_pt6, fa_left, fa_middle);
			effectsi++;
		}
	}
}


if equipselected > - 1
{
	var inbag = 0;
	
	if find_value_on_array(global.inventory, selection[equipselected]) > -1
	{
		inbag = global.inventoryunit[find_value_on_array(global.inventory, selection[equipselected])]
	}
	plus_text_font(705,420,"In Bag: " + string(inbag), font_color, DayDream_pt6, fa_left);
	plus_text_font(640,380,"Recipe: ", c_white, DayDream_pt6, fa_right);
	
	var rxx1 = 550;
	var rxx2 = 675;
	var ryy = 485;
	if find_value_on_array(global.inventory, selection[equipselected].recipe[0][0]) > - 1 
	{
		
		plus_text_font((rxx2 - rxx1)/2 + rxx1, ryy, "+", c_gray, txt3font)
		
		inbag2 = find_value_on_array(global.inventory, selection[equipselected].recipe[0][0]);
		if global.inventoryunit[inbag2] >= selection[equipselected].recipe[0][1]
		{
			draw_circle_color(rxx1,ryy,30,#7CC576, #7CC576, false)
			draw_sprite_ext(selection[equipselected].recipe[0][0].icon,selection[equipselected].recipe[0][0].iconid,rxx1,ryy, 2, 2, 0, c_white, 1)
			plus_text_font(rxx1,ryy + 40,global.inventoryunit[inbag2], c_green, DayDream_pt8);
			plus_text_font(rxx1 + 15,ryy + 40,"/"+string(selection[equipselected].recipe[0][1]), c_gray, font_small);
			plus_text_font_ext(rxx1,ryy - 35,selection[equipselected].recipe[0][0].nome, c_green, font_small);
		}
		else
		{
			draw_circle_color(rxx1,ryy,30,#B29781, #B29781, false)
			draw_sprite_ext(selection[equipselected].recipe[0][0].icon,selection[equipselected].recipe[0][0].iconid,rxx1,ryy, 2, 2, 0, c_gray, 1)
			plus_text_font(rxx1,ryy + 40,global.inventoryunit[inbag2], c_red, DayDream_pt8);
			plus_text_font(rxx1 + 15,ryy + 40,"/"+string(selection[equipselected].recipe[0][1])+"", c_gray, font_small);
			plus_text_font(rxx1,ryy - 35,selection[equipselected].recipe[0][0].nome, c_gray, font_small);
		}
	}
	else
	{
		draw_circle_color(rxx1,ryy,30,#99816E, #99816E, false)
		draw_sprite_ext(selection[equipselected].recipe[0][0].icon,selection[equipselected].recipe[0][0].iconid,rxx1,ryy, 2, 2, 0, c_gray, 1)
		plus_text_font(rxx1,ryy + 40,0, c_gray, DayDream_pt6);
	}
	
	if find_value_on_array(global.inventory, selection[equipselected].recipe[1][0]) > - 1 
	{
		draw_circle_color(rxx2,ryy,30,#B29781, #B29781, false)
		inbag3 = find_value_on_array(global.inventory, selection[equipselected].recipe[1][0]);
		if global.inventoryunit[inbag3] >= selection[equipselected].recipe[1][1]
		{
			draw_circle_color(rxx2,ryy,30,#7CC576, #7CC576, false)
			draw_sprite_ext(selection[equipselected].recipe[1][0].icon,selection[equipselected].recipe[1][0].iconid,rxx2,ryy, 2, 2, 0, c_white, 1)
			plus_text_font(rxx2,ryy + 40,string(global.inventoryunit[inbag3])+"", c_green, DayDream_pt8);
			plus_text_font(rxx2,ryy - 35,selection[equipselected].recipe[1][0].nome, c_gray, font_small);
			plus_text_font(rxx2 + 15,ryy + 40,"/"+string(selection[equipselected].recipe[1][1]), c_green, font_small);
		}
		else
		{
			draw_circle_color(rxx2,ryy,30,#B29781, #B29781, false)
			
			draw_sprite_ext(selection[equipselected].recipe[1][0].icon, selection[equipselected].recipe[1][0].iconid,rxx2,ryy, 2, 2, 0, c_gray, 1)
			plus_text_font(rxx2,ryy + 40,global.inventoryunit[inbag3], c_red, DayDream_pt8);
			plus_text_font(rxx2,ryy - 35,selection[equipselected].recipe[1][0].nome, c_gray, font_small);
			plus_text_font(rxx2 + 15,ryy + 40,"/"+string(selection[equipselected].recipe[1][1])+"", c_gray, font_small);
		}
	}
	else
	{
		draw_circle_color(rxx2,ryy,30,#99816E, #99816E, false)
		plus_text_font(rxx2 + 15,ryy + 40,"/"+string(global.inventoryunit[inbag3])+"", c_red, font_small);
		draw_sprite_ext(selection[equipselected].recipe[1][0].icon,selection[equipselected].recipe[1][0].iconid,rxx2,ryy, 2, 2, 0, c_gray, 1)
		plus_text_font(rxx2,ryy + 40,0, c_red, DayDream_pt6);
	}
	
	if global.inventoryunit[inbag3] >= selection[equipselected].recipe[1][1] and global.inventoryunit[inbag2] >= selection[equipselected].recipe[0][1] and equipselected <= craftinglvl * 4
	{
		plus_text_font(455,420,"Level  Needed: " + string(floor((equipselected - 1) / 4 + 1)), c_green, DayDream_pt6, fa_left);
		plus_text_font((rxx2 - rxx1)/2 + rxx1,555, "CRAFT!", c_green, DayDream_pt8, fa_center);
		plus_text_font((rxx2 - rxx1)/2 + rxx1,570, "Click here to craft the item", font_color, font_small, fa_center);
	}
	else
	{
		plus_text_font(455,420,"Level  Needed: " + string(floor((equipselected - 1) / 4 + 1)), #ff655c, DayDream_pt6, fa_left);
		if equipselected <= craftinglvl * 4	plus_text_font((rxx2 - rxx1)/2 + rxx1,565, "Need more materials", c_gray, DayDream_pt6, fa_center);
		else plus_text_font((rxx2 - rxx1)/2 + rxx1,565, "Need more level!", #ff655c, DayDream_pt6, fa_center);
		plus_text_font((rxx2 - rxx1)/2 + rxx1,580, string(craftingrqr[craftinglvl] - craftingXp) + "xp required to next level", font_color, font_small, fa_center);
	}
}
else
{
	inbag2 = 0;
	inbag3 = 0;
}


draw_text(400, 20, (string(window_mouse_get_x()) + " | " + string(window_mouse_get_y())));

plus_text_font(220, 570, "Crafting Level:", font_color, DayDream_pt8);
plus_text_font(225, 620, string(craftingXp) + "/" + string(craftingrqr[craftinglvl]), font_color, font_small, fa_center);

plus_text_font(350, 600, "Lv." + string(craftinglvl+1), font_color, DayDream_pt5);
plus_text_font(320, 570, craftinglvl, c_maroon, DayDream_pt8);
draw_loading_bar(230,605,craftingXp,craftingrqr[craftinglvl], #7CC576, #99816E, 200, 20, 21);