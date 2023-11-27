if !global.onmenu and !global.on_message and global.debug.debugshow {
	/*
	var _on_radius = kget_radius(global.player, (global.player.AIM_RANGE + (global.player_stats[global.party.players[0]].hitrate)/4),false,true,false,self)
	var _radius_direction = point_direction(global.player.x,global.player.y,mouse_x,mouse_y);
		//
	var _distance = point_distance(global.player.x,global.player.y,mouse_x,mouse_y);
	var _distance = clamp(_distance, 0, global.player.AIM_RANGE);
	var new_x = global.player.x + lengthdir_x(_distance, _radius_direction);
	var new_y = global.player.y + lengthdir_y(_distance, _radius_direction);
	
	if global.player_index == self_index and global.debug.debugshow {
		draw_set_color(c_blue);
		draw_circle(new_x,new_y,AIM_RANGE,true);
		draw_set_color(c_white);
	}
	
	
	
	if global.player_index == self_index and to_gamepad_click(mb_left) and attack_cooldown <= 0{
		rangecircle = 10;
	}

	if rangecircle >= 0 {
		rangecircle--;
		draw_set_alpha(0.03 * rangecircle);
		if rangecircle > 0 draw_circle_color(new_x,new_y,global.player_stats[self_index].aimrange, c_red, c_red, false);
		draw_set_alpha(1);
	}
	*/
	if attack_cooldown > 3 {
		GPT_drawLoadingBar(self.x, self.y + 9, attack_cooldown, DPS, #FFB40F, c_black);	
	}
}

draw_self();