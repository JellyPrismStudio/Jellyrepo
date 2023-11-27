depth_sort();
if global.player_index == self_index {
	/// VANILLA ///
	
	
	if keyboard_check(ord("A")) or keyboard_check(ord("D")) or keyboard_check(ord("W")) or keyboard_check(ord("S")){
		if !global.on_message sprite_index = global.player_stats[self_index].graphic;
		else sprite_index = global.player_stats[self_index].idlegraph;
		if keyboard_check(ord("A")) image_xscale = -1;
		else if keyboard_check(ord("D")) image_xscale = 1;
	} else sprite_index = global.player_stats[self_index].idlegraph;
	
	
	
	oSpeed = kdash_and_sneak(normal_speed, dash_speed, sneak_speed);
	kmove_input_multiple_collider(2, oSpeed, self, true, colisor, obj_wall, ColliderOne);
	call_skill_on_map();

	if keyboard_check_pressed(ord("X")) and !global.onmenu {
		if global.menuenabled == true call_menu();
	}
	if print show_debug_message("X:" + string(mouse_x) + " Y:" + string(mouse_y));


	if global.player_stats[global.player_index].hp > 0 and damaged
	{
		if BATTLE_D>0 {
			BATTLE_D--; // A função dessa variável é só pra dar um timerzinho no blendmode, e ficar mais visivel
			image_blend = c_red;
		}
		else {
			BATTLE_D = 6;
			damaged = false;
			image_blend = c_white;
		}
	}
	else if global.player_stats[global.player_index].hp <= 0 instance_destroy();
	/// VANILLA ///
}
else
{
	if global.player.x < x image_xscale = -1;
	else if global.player.x > x image_xscale = 1;
	if a0 == false {
		_arr = find_value_on_array(global.party.playersobj, playerA)
		if _arr == 1 {
			if !kget_radius(self,view_range,true,true,false,global.party.playersobj[0]){
				alarm_set(1,5);
				a0 = true;
			}
		}
		else if _arr == 2 {
			if !kget_radius(self,view_range,true,true,false,global.party.playersobj[1]){
				alarm_set(1,5);
				a0 = true;
			}
		}
	}
}




