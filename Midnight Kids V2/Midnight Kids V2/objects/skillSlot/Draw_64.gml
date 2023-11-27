/// @description Insert description here
// You can write your code in this editor

if position_meeting(mouse_x,mouse_y,self) or global.menu.skillclicked == self.id and global.menu.skillhovering == false{
	if to_gamepad_click(mb_left)  global.menu.skillclicked = self.id;
	draw_set_font(DayDream_pt11);
	draw_set_halign(fa_center);
	draw_text_ext(cw+480,ch-200,global.battle_player_skills[skill].nome,12,195);
	draw_set_halign(fa_left);
	draw_set_font(Ruler);
	draw_text_ext(cw+385,ch-150,global.battle_player_skills[skill].descricao,12,195);
	var request = global.battle_player_skills[skill].requisito;
	if request != noone draw_text_ext_color(cw+385,ch+75,"Requisito: " + string(global.battle_player_skills[request].nome),12,195,c_gray,c_gray,c_gray,c_gray,1);
	draw_text(cw+385,ch-65,"----------------------");
	draw_set_font(DayDream_pt8);
	draw_text_color(cw+385,ch-50,"Efeitos",c_orange,c_orange,c_orange,c_orange,1);
	draw_set_halign(fa_center);
	draw_text_ext(cw+480,ch+105,"Equipar em:",12,195);
	draw_set_halign(fa_left);
	draw_set_font(Ruler);
	draw_text_ext(cw+385,ch-20,global.battle_player_skills[skill].effect,10,195);
	
	
	// Esse é o IF para caso não tenha a skill.
	if !learned	{
		if request != noone {
			var have_skill = exists_on_array(global.player_stats[global.menu.skillpage].skillslearned, request)
			if have_skill {
				draw_text_ext(cw+385,ch+125,"Disponível",10,195);
					// TEM A SKILL E TA BLOQUEADO
			} else
			{
				draw_text_ext(cw+385,ch+125,"Você precisa requisito",10,195);
					// NAO TEM A SKILL E PRECISA
			}
		}
	}
	else {
		//draw_text_ext(cw+385,ch+125,"Já aprendeu",10,195);
		if !instanced{
			skillkeyboard1 = instance_create_layer(ocw + 203 + 12, och + 78, "Menu", SkillKeyboardQ);
			skillkeyboard1.skill = skill;
			skillkeyboard2 = instance_create_layer(ocw + 227 + 12, och + 78, "Menu", SkillKeyboardE);
			skillkeyboard2.skill = skill;
			skillkeyboard3 = instance_create_layer(ocw + 251 + 12, och + 78, "Menu", SkillKeyboardR);
			skillkeyboard3.skill = skill;
			//skillkeyboard4 = instance_create_layer(ocw + 275, och + 78, "Menu", SkillKeyboardF);
			//skillkeyboard4.skill = skill;
			instanced = true;
		}
	}
	// NAO TEM REQUISITO
}
else
{
	//430 156
	if instance_exists(skillkeyboard1) instance_destroy(skillkeyboard1);
	if instance_exists(skillkeyboard2) instance_destroy(skillkeyboard2);
	if instance_exists(skillkeyboard3) instance_destroy(skillkeyboard3);
	if instance_exists(skillkeyboard4) instance_destroy(skillkeyboard4);
	instanced = false;
}

