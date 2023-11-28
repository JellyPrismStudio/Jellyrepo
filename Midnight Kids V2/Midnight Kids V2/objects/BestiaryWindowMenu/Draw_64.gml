draw_set_font(DayDream_pt8);
draw_set_valign(fa_top);
spacing = 70;
color_1 = c_red;
color_2 = #94ba2c;
color_3 = #77B6D1;
h_text = 0;
xxpos = 545
yypos = 305
drawingname = "";
page_color1 =  #3b2d1e;
page_color2 =  #655038;
outline_color = #3b2d1e;
outline_size = 4;

function local_draw_sprite_at(sprite, iconid, xx, yy, alpha, xscale, yscale, spritename = "")
{
	var spritewidth = 0;
	var spriteheight = 0;
    var spritewidth = sprite_get_width(sprite)*xscale;
    var spriteheight = sprite_get_height(sprite)*yscale;
	
    draw_sprite_pos(sprite, iconid, xx, yy, xx + spritewidth, yy, xx + spritewidth, yy + spriteheight, xx, yy + spriteheight, alpha);
	
	itens[i][0] = xx;
	itens[i][1] = xx + spritewidth;
	itens[i][3] = yy + spriteheight;
	itens[i][2] = yy;
	name[i] = spritename;
}

draw_sprite_ext(BestiaryBG1,0,0,0,2,2,0,c_white,1);
draw_set_halign(fa_left)
draw_sprite_ext(global.enemy_stats[global.menu.bestiary[enemy_page]].sprite, 1, 660,230,2,2,0,c_white,1);

draw_text_with_title(770,  85, enemy_page+1, "/" + string(enemies_known), 15, page_color2, DayDream_pt8, page_color1)

draw_text_with_title(560, 260, "", global.enemy_stats[global.menu.bestiary[enemy_page]].nome, 0, color_1, DayDream_pt8); h_text++;
draw_text_with_title(xxpos, yypos + 20*h_text, "MHP:",   global.enemy_stats[global.menu.bestiary[enemy_page]].mhp, spacing, color_3, DayDream_pt8);
draw_text_with_title(xxpos + spacing*2, yypos + 20*h_text, "MSP:", global.enemy_stats[global.menu.bestiary[enemy_page]].msp, spacing, color_3, DayDream_pt8); h_text++;
draw_text_with_title(xxpos, yypos + 20*h_text, "ATK:", global.enemy_stats[global.menu.bestiary[enemy_page]].atack, spacing, color_2, DayDream_pt8); h_text++;
draw_text_with_title(xxpos, yypos + 20*h_text, "DEF:", global.enemy_stats[global.menu.bestiary[enemy_page]].def, spacing, color_2, DayDream_pt8); h_text++;
draw_text_with_title(xxpos, yypos + 20*h_text, "MGC:", global.enemy_stats[global.menu.bestiary[enemy_page]].magic, spacing, color_2, DayDream_pt8); h_text++;
draw_text_with_title(xxpos, yypos + 20*h_text, "CRT:", global.enemy_stats[global.menu.bestiary[enemy_page]].crit, spacing, color_2, DayDream_pt8); h_text++;
draw_text_with_title(xxpos, yypos + 20*h_text, "HIT:", global.enemy_stats[global.menu.bestiary[enemy_page]].hitrate, spacing, color_2, DayDream_pt8); h_text++;
draw_text_with_title(xxpos, yypos + 20*h_text, "EVA:", global.enemy_stats[global.menu.bestiary[enemy_page]].evasion, spacing, color_2, DayDream_pt8); h_text++;
draw_text_with_title(xxpos + spacing*2, yypos+5+20*h_text, "EXP:", global.enemy_stats[global.menu.bestiary[enemy_page]].xp, spacing, #4b3325, DayDream_pt8); h_text++;
draw_text_with_title(855, 285,global.language.menu.notes, "", spacing, #4b3325, DayDream_pt8);
draw_text_ext_color(855, 305, global.enemy_stats[global.menu.bestiary[enemy_page]].desc,16, 270,#6f5941,#6f5941,#6f5941,#6f5941,1);

draw_set_font(DayDream_pt11);
draw_text_with_title(xxpos, yypos + 15 + 20*h_text, "Drop List:", "", spacing, c_orange, DayDream_pt8); h_text++;


lootsize = array_length(global.enemy_stats[global.menu.bestiary[enemy_page]].loot);

loot_x = 546; //734
loot_y = 540; //180
column = 0
for(i=0;i<lootsize;i++){
	if i == 3 column++
	local_draw_sprite_at(global.enemy_stats[global.menu.bestiary[enemy_page]].loot[i].icon,global.enemy_stats[global.menu.bestiary[enemy_page]].loot[i].iconid, loot_x + i*63,loot_y + 63*column,1,2,2, global.enemy_stats[global.menu.bestiary[enemy_page]].loot[i].nome);
	draw_set_font(DayDream);
	draw_set_halign(fa_center)
	draw_text(loot_x + i*63 + 24,loot_y + 63*column+35,string(global.enemy_stats[global.menu.bestiary[enemy_page]].lootchances[i]) + "%")
	draw_set_font(DayDream_pt11);
	draw_set_halign(fa_left)
}
for(j=0;j<array_length(name);j++){
	var mousex = window_mouse_x();
    var mousey = window_mouse_y();
	
	if name[j] != "" and name[j] != noone {
	sdm(mousex, mousey, itens[j][0], itens[j][1]);
	if (mousex > itens[j][0] && mousex < itens[j][1] && mousey > itens[j][2] && mousey < itens[j][3])
    {
		//draw_text_color(mousex + 20 + outline_size, mousey, name[j],outline_color,outline_color,outline_color,outline_color,1);
		//draw_text_color(mousex + 20 - outline_size, mousey, name[j],outline_color,outline_color,outline_color,outline_color,1);
		draw_text_color(mousex + 20, mousey+outline_size, name[j],outline_color,outline_color,outline_color,outline_color,0.75);
		//draw_text_color(mousex + 20, mousey-outline_size, name[j],outline_color,outline_color,outline_color,outline_color,1);
        draw_text(mousex + 20, mousey, name[j]);
		
		
    }
	}
}