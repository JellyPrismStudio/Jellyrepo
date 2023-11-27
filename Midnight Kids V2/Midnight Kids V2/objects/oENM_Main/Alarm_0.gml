on_view_range = battle_enemies_get_range();
on_attack_range = battle_enemies_get_attack();

function forma_burra()
{
	pos = [-30,-15,0,15,30]
	ix = 0;
	iy = 0;
	if place_meeting(target_x, target_y, colisor){
		for(ix = 0; ix<5; ix++)
		{
			target_x = int64(aim_target.x + pos[ix]);
			if place_meeting(target_x, target_y, colisor)
			{
				for(iy = 0; iy<5; iy++)
				{
					target_y = int64(aim_target.y + pos[iy]);
					if place_meeting(target_x, target_y, colisor)
					{
						
					}
					else break
				}
			}
			else break
		}
	}
}


if state_machine == "TAUNTED" {
	if instance_exists(oTauntObject)
	{
		var _taunt = instance_nearest(x,y,oTauntObject)
		// O Target é definido no Run Once.
		if path_exists(path) path_delete(path);
		force_stop = false;
		path = path_add();
		mp_grid_path(GridSetupEnemy.grid, path, x,y, _taunt.x, _taunt.y, 1);
		path_start(path, obj_speed, path_action_stop, true);
		pathing = false;
	}
	else
	{
		state_machine = "WAITING"	
	}
}
else if state_machine == "DIRECT" {
	// Vai na direção do player, sem atualizar a cada step
	if _aux_alarm_unstopable == false
	{
		_aux_x = aim_target.x;
		_aux_y = aim_target.y;
		_aux_alarm_unstopable = true;
	}
	if path_exists(path) path_delete(path);
	path = path_add();
	mp_grid_path(GridSetupEnemy.grid, path, x,y, _aux_x, _aux_y, 1);
	path_start(path, obj_speed*1.25, path_action_stop, true);
	pathing = false;
	new_on_range = false;
}
else if state_machine == "" {
	if path_exists(path) path_delete(path);
	path = path_add();
}
else if state_machine == "WALKING" {
	// O Target é definido no Run Once.
	if path_exists(path) path_delete(path);
	force_stop = false;
	path = path_add();
	mp_grid_path(GridSetupEnemy.grid, path, x,y, target_x, target_y, 1);
	path_start(path, obj_speed, path_action_stop, true);
	pathing = false;
			
}
else if state_machine == "WAITING" {
	_aux_alarm_unstopable = false;
	if path_exists(path) path_delete(path);
	state_machine = "FOCUSED"
}
else if state_machine == "FOCUSED" {
	// Focused foca no personagem, independente do range 
		_aux_alarm_unstopable = false;
		if path_exists(path) {
			path_delete(path);
			_r = 0;
		}
		path = path_add();
		if !global.debug.ghosting{
			if new_on_range == true {
				target_x = int64(aim_target.x + irandom_range(-5,5));
				target_y = int64(aim_target.y + irandom_range(-5,5));
			}
			else {
				target_x = int64(aim_target.x);
				target_y = int64(aim_target.y);
			}
		}
		else
		{
			target_x = x;
			target_y = y;
		}
		mp_grid_path(GridSetupEnemy.grid, path, x,y, target_x, target_y, 1);
		path_start(path, obj_speed*1.25, path_action_stop, true);
		pathing = false;
		new_on_range = false;
}
else if state_machine == "ON_ATTACK"{
	_aux_alarm_unstopable = false;
	if path_exists(path) path_delete(path);
	path = path_add();
	mp_grid_path(GridSetupEnemy.grid, path, x,y, x, y, 1);
	path_start(path, obj_speed, path_action_stop, true);
}
else if state_machine == "ON_RANGE" {
		_aux_alarm_unstopable = false;
		if path_exists(path) {
			path_delete(path);
			_r = 0;
		}
		path = path_add();
		if new_on_range == true {
			target_x = int64(aim_target.x + irandom_range(-5,5));
			target_y = int64(aim_target.y + irandom_range(-5,5));
			
		}
		else {
			target_x = int64(aim_target.x);
			target_y = int64(aim_target.y);
		}
		
		forma_burra()
		
		
		mp_grid_path(GridSetupEnemy.grid, path, x,y, target_x, target_y, 1);
		path_start(path, obj_speed*1.25, path_action_stop, true);
		pathing = false;
		new_on_range = false;
}
else if state_machine == "FINISHING" {
	if x != OLD_X OLD_X = x
	if y != OLD_Y OLD_Y = y
	if GPT_compare_with_margin(x, target_x, 5) and GPT_compare_with_margin(y, target_y, 5) {
		state_machine = "";
	}
	alarm_setted[1] = false;
	
}
alarm_setted[0] = false;
force_stop = false;
new_on_range = false;