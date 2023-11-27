// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function kstarter(lglobal_variable){
	if lglobal_variable == "jump"			{		//if !variable_global_exists("jump_cooldown") global.jump_cooldown = 1;	
													if !variable_global_exists("jump_time") global.jump_time = 5;
													if !variable_global_exists("jumping") global.jumping = false;								
													if !variable_global_exists("falling") global.falling = false;}
	if lglobal_variable == "self_position"	{		if !variable_global_exists("xSelf") global.xSelf = self.x;
													if !variable_global_exists("ySelf") global.ySelf = self.y;									}
	if lglobal_variable == "moving?"		{		if !variable_global_exists("can_move") global.can_move = true;								}
}

// Armazenar na DS List: Inventário, Gold e XP.
// Switches e etc podem ser armazenadas no ini.
function validate_object(object){
	if !instance_exists(object){
		var obj = instance_create_depth(0,0,depth+1,object);
		return obj.id;
	} else {
		return instance_find(object,0);
	}
}



function check_object_and_validate(object, xx = 0, yy = 0, onlayer = false, layername = "Instances", specialtext = ""){
	if !onlayer{
		if !instance_exists(object) 
			{
				var obj = instance_create_depth(xx,yy,0,object);
				var file;	
				file = file_text_open_append("G:/Meu Drive/- PROJETOS/Midnight Kids Game/Midnight Kids/data/" + "SystemManagementLog.ini");
				file_text_write_string(file, "O objeto: " + string(object_get_name(object)) + " foi instanciado em: X=" + string(xx) + " | Y=" + string(yy)+ "\n");
				file_text_close(file);
				return obj;
			}
			else {
				add_text_to_log(specialtext + "[✓] O objeto: " + string(object_get_name(object)) + " foi validado com sucesso" , "SystemManagementLog.ini");
				return false;
			}
		}//On Layer instanciating
	else{
		if !instance_exists(object) 
		{
			var obj = plus_instance_create_layer(xx,yy,layername,object);
			var file;	
			file = file_text_open_append("G:/Meu Drive/- PROJETOS/Midnight Kids Game/Midnight Kids/data/" + "SystemManagementLog.ini");
			file_text_write_string(file, "[᎕] O objeto: " + string(object_get_name(object)) + " foi instanciado em: X=" + string(xx) + " | Y=" + string(yy)+ "\n");
			file_text_close(file);
			return obj;
		}
		else {
			add_text_to_log(specialtext + "[✓] O objeto: " + string(object_get_name(object)) + " foi validado com sucesso" , "SystemManagementLog.ini");
			return false;
		}
	}
}


function add_text_to_log(text, filename){
	var file = file_text_open_append("G:/Meu Drive/- PROJETOS/Midnight Kids Game/Midnight Kids/data/" + filename);
	file_text_write_string(file, text + "\n");
	file_text_close(file);	
}

function validate_variable(variable, object = self){
	if !variable_instance_exists(object, variable) variable_instance_set(object,variable, 0);
	
}