draw_self();

if global.player_stats[global.menu.skillpage].shortcuts[identificator] != -1 {
	var skillattached = global.player_stats[global.menu.skillpage].shortcuts[identificator];
	sprite_index = global.battle_player_skills[skillattached].imagem;
}
else {
	sprite_index = sEmptySkill;	
}
//if global.player_index

draw_set_halign(fa_center);
draw_set_font(RulerBattle);
draw_text(x,y+25,key);