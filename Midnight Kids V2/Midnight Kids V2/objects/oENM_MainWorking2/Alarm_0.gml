on_view_range = battle_enemies_get_range();
on_attack_range = battle_enemies_get_attack();
sdm("Alarm");
if state_machine == "DIRECT" {
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
else if state_machine == "WAITING" {
	_aux_alarm_unstopable = false;
	if path_exists(path) path_delete(path);
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
		mp_grid_path(GridSetupEnemy.grid, path, x,y, target_x, target_y, 1);
		path_start(path, obj_speed*1.25, path_action_stop, true);
		pathing = false;
		new_on_range = false;
}
else if state_machine == "WALKING" {
	if x != OLD_X OLD_X = x
	if y != OLD_Y OLD_Y = y
	if x == OLD_X and y == OLD_Y {
		if path_exists(path) path_delete(path);
		force_stop = false;
		sprite_index = spr_index;
		path = path_add();
		
		target_x = random_range(x - BATTLE_RANGE, x + BATTLE_RANGE);
		target_y = random_range(y - BATTLE_RANGE, y + BATTLE_RANGE);
		while position_meeting(target_x, target_y, colisor){
			target_x = random_range(x - BATTLE_RANGE, x + BATTLE_RANGE);
			target_y = random_range(y - BATTLE_RANGE, y + BATTLE_RANGE);
		}
		
		mp_grid_path(GridSetupEnemy.grid, path, x,y, target_x, target_y, 1);
		path_start(path, obj_speed, path_action_stop, true);
		pathing = false;
	}
}
else if state_machine == "FINISHING" {
	if x != OLD_X OLD_X = x
	if y != OLD_Y OLD_Y = y
	if x == OLD_X and y == OLD_Y {
		state_machine = "";
	}
	alarm_setted[1] = false;
	
}
alarm_setted[0] = false;
force_stop = false;
new_on_range = false;