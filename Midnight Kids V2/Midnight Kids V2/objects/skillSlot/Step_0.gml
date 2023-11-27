learned = exists_on_array(global.player_stats[global.menu.skillpage].skillslearned, skill);

sprite_index = global.battle_player_skills[skill].imagem;

if  global.menu.skillclicked == self.id image_blend = c_blue;
else {
	if position_meeting(mouse_x,mouse_y,self) {
		image_blend = c_red;
		show_name = true;
	}else if learned 
	{
		image_blend = c_white;
	}
	 else {
		 image_blend = c_gray;
	}
}