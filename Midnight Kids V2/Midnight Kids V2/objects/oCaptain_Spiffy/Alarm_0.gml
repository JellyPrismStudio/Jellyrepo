function followup_captain()
{
	if on_radius
			{				
				if variable_instance_exists(self,"path") path_delete(path);
				path = path_add();
				target_x = x;
				target_y = y;
				mp_grid_path(GridSetup.grid, path, x,y, target_x, target_y, 1);
				path_start(path, obj_speed, path_action_stop, true);
				pathing = false;
			} 
			else 
			{
				if variable_instance_exists(self,"path") path_delete(path);
				path = path_add();
				//if global.player.x < x xx = random_range(player_range/4,player_range-1) else xx = random_range(-player_range/4,-player_range+1);
				//if global.player.y < y yy = random_range(player_range/4,player_range-1) else yy = random_range(-player_range/4,-player_range+1);
				target_x = global.player.x + xx;
				target_y = global.player.y + yy;
				mp_grid_path(GridSetup.grid, path, x,y, target_x, target_y, 1);
				path_start(path, obj_speed, path_action_stop, true);
				pathing = false;
			}	
}

function followenemy_captain(_enemy)
{
			if instance_exists(_enemy)
			{
				if _enemy == false or _enemy == -4 or _enemy == undefined 
				{
					if variable_instance_exists(self,"path") path_delete(path);
					path = path_add();
					target_x = global.player.x + xx;
					target_y = global.player.y + yy;
					mp_grid_path(GridSetup.grid, path, x,y, target_x, target_y, 1);
					path_start(path, obj_speed, path_action_stop, true);
					pathing = false;
				} 
				else if _enemy != false and _enemy != -4 and _enemy != undefined
				{
					if variable_instance_exists(self,"path") path_delete(path);
					path = path_add();					
					target_x = _enemy.x + xx;
					target_y = _enemy.y + yy;
					mp_grid_path(GridSetup.grid, path, x,y, target_x, target_y, 1);
					path_start(path, obj_speed, path_action_stop, true);
					pathing = false;
					if !attacking 
					{						
						sprite = 2;
						alarm_set(1,20);
						attacking = true;
					}
				}
			}
			else 
			{
				attacking = false;
				object = false;
				if variable_instance_exists(self,"path") path_delete(path);
				path = path_add();
				target_x = global.player.x + xx;
				target_y = global.player.y + yy;
				mp_grid_path(GridSetup.grid, path, x,y, target_x, target_y, 1);
				path_start(path, obj_speed, path_action_stop, true);
				pathing = false;				
			}
}
	
function follow_hiden(_object)
{
		if on_radius
		{				
				if variable_instance_exists(self,"path") path_delete(path);
				path = path_add();
				target_x = _object.x;
				target_y = _object.y;
				mp_grid_path(GridSetup.grid, path, x,y, target_x, target_y, 1);
				path_start(path, obj_speed, path_action_stop, true);
				pathing = false;
				sprite = 2;
			} 
			else 
			{
				if variable_instance_exists(self,"path") path_delete(path);
				path = path_add();
				target_x = _object.x;
				target_y = _object.y;
				mp_grid_path(GridSetup.grid, path, x,y, target_x, target_y, 1);
				path_start(path, obj_speed, path_action_stop, true);
				pathing = false;
			}	
		
}



if state_machine == "" 
{
	if  path_exists(path) path_delete(path);
	path = path_add();
}

if state_machine == "GOTO" 
{
	if  path_exists(path) path_delete(path);
		path = path_add();
		target_x = mousex;
		target_y = mousey;
		mp_grid_path(GridSetup.grid, path, x,y, target_x, target_y, 1);
		path_start(path, obj_speed, path_action_stop, true);
		pathing = false;
		if target_x == x and target_y == y and global.party.capagressive 
		{
			object = false;
			object = get_object_on_radius(self,RADIUS,true,true,false,oENM_Main);
			state_machine = "ATTACK";
			global.party.follow = true;
		}
}
if state_machine == "FOLLOW" or state_machine == "ATTACK" 
{
		
		if !on_radius and global.party.follow
		{			
			if global.party.capagressive
			{
				hide_obj = false;
				if !object 
				{
					object = get_object_on_radius(self,RADIUS,true,true,false,oENM_Main);					
					followup_captain();
				}
				else 
				{					
					followenemy_captain(object);	
					hide_obj = false;
				}		
			} 
			else 
			{
				followup_captain();
				object = false;
				attacking = false;
				
			}
			
		} // On Radius
		else
		{
			hide_obj = get_object_on_radius(self,RADIUS-30,true,true,false,_OBJ_HIDDEN);	
			
			if hide_obj != false 
			{
				follow_hiden(hide_obj);
			}
			else 
			{
				if  path_exists(path) path_delete(path);
					path = path_add();
					target_x = x;
					target_y = y;
					mp_grid_path(GridSetup.grid, path, x,y, target_x, target_y, 1);
					path_start(path, obj_speed, path_action_stop, true);
					pathing = false;
				}
			}
}

alarm_set(0,2);

