#region ------------ PLAYER SKILLS FUNCTIONS --------	

function call_skill_on_map(){
	/*if keyboard_check_pressed(ord("Q")){
		if global.player_stats[global.player_index].shortcuts[0] != -1
		{
			var skill = global.player_stats[global.player_index].shortcuts[0];
			
				if !find_value_on_array_bool(global.player_stats[global.player_index].skillid,skill){
					common_skill_use(skill);
				}
				else
				{
				
				}
			//Execute
		}
	}*/
	if keyboard_check_pressed(ord("Q")){
		instance_create_depth(x,y,depth,SkillTaunt);
	}
	if keyboard_check_pressed(ord("E")){
		if global.player_stats[global.player_index].shortcuts[1] != -1
		{
			var skill = global.player_stats[global.player_index].shortcuts[1];
			if !find_value_on_array_bool(global.player_stats[global.player_index].skillid,skill){
				common_skill_use(skill);				
			}
			else
			{
				
			}
		}
	}
	if keyboard_check_pressed(ord("R")){
		if global.player_stats[global.player_index].shortcuts[2] != -1
		{
			var skill = global.player_stats[global.player_index].shortcuts[2];
			if !find_value_on_array_bool(global.player_stats[global.player_index].skillid,skill){
				common_skill_use(skill);
				
			}
			else
			{
				
			}
		}
	}	
}

function common_skill_use(skill){
	if global.player_stats[global.player_index].sp >= global.battle_player_skills[skill].custo {
		global.player_stats[global.player_index].sp -= global.battle_player_skills[skill].custo;
		check_skill_args(skill);
		var sindex = find_value_on_array(global.player_stats[global.player_index].skillid,-1);
		global.player_stats[global.player_index].skillid[sindex] = global.battle_player_skills[skill].skillid;
		global.player_stats[global.player_index].skillcooldown[sindex] = global.battle_player_skills[skill].cooldown;	
	}
}

function check_skill_args(skill){
	var args = global.battle_player_skills[skill].arguments;
	switch (args) {
		case 0:
			script_execute(global.battle_player_skills[skill].funct);	
		break;	
		
		case 1:
			script_execute(global.battle_player_skills[skill].funct, global.battle_player_skills[skill].arg1);	
		break;
		
		case 2:
			script_execute(global.battle_player_skills[skill].funct, global.battle_player_skills[skill].arg1, global.battle_player_skills[skill].arg2);	
		break;
		
		case 3:
			script_execute(global.battle_player_skills[skill].funct, global.battle_player_skills[skill].arg1, global.battle_player_skills[skill].arg2, global.battle_player_skills[skill].arg3);	
		break;
	}
}



function create_player_skills(){
	global.battle_player_skills = [
		////
		// 0
		////
		{
			skillid:		0,
			nome:			"Vulcão",
			custo:			5,
			descricao:		"Uma habilidade que invoca um fogo no chão",
			effect:			"400 de dano fisico ao inimigo",
			requisito:		noone,
			imagem:			sSkill2,
			learned:		false,
			funct:			player_skill_01,
			arguments:		0,
			cooldown:		130,
			
			
			//requisito: global.battle_player_skills.SKILL_02,
			damage_a:		0,
			damage_m:		0,
			damage_hit:		0,
			damage_crit:	0,
			damage_eva:		0,
			damage_def:		0,
			damage_hp:		0,	// Pode ser colocado a fórmula do dano aqui no HP
			damage_sp:		0,
			
			buff_a:			0,
			buff_m:			0,
			buff_hit:		0,
			buff_crit:		0,
			buff_eva:		0,
			buff_def:		0,
			buff_hp:		0,
			buff_sp:		0,			
		},
		
		////
		// 1
		////
		{
			skillid:		1,
			nome:			"Skill Média",
			custo:			5,
			descricao:		"Skill aleatória",
			effect:			"400 de dano fisico ao inimigo",
			requisito:		noone,	
			imagem:			sSkill1,
			learned:		false,
			funct:			player_skill_02,
			arguments:		0,
			cooldown:		500,
		},
		
		
		////
		// 2
		////
		{
			skillid:		2,
			nome:			"Skill Alta",
			custo:			5,
			descricao:		"Skill aleatória",
			effect:			"400 de dano fisico ao inimigo",
			requisito:		0,	
			imagem:			sSkill3,
			learned:		false,
			funct:			player_skill_03,
			arguments:		0,
		}
	];
}
	
#endregion

#region ------------ SKILL TREE ---------------------

function build_skill_tree(){
	
	if global.party.players[global.menu.skillpage] == 0{
		var skill1 = instance_create_layer(ocw - 100,och - 32,"Menu",skillSlot);
		skill1.skill = 0;
		var skill2 = instance_create_layer(ocw - 100,och,"Menu",skillSlot);
		skill2.skill = 1;
		var skill3 = instance_create_layer(ocw - 100,och + 32,"Menu",skillSlot);
		skill3.skill = 2;	
	}
	else if global.party.players[global.menu.skillpage] == 1{
		var skill1 = instance_create_layer(ocw + 100,och - 50,"Menu",skillSlot);
		skill1.skill = 0;
	}
	else if global.party.players[global.menu.skillpage] == 2{
		var skill1 = instance_create_layer(ocw + 200,och - 50,"Menu",skillSlot);
		skill1.skill = 2;
	}
	else if global.party.players[global.menu.skillpage] == 3{
		var skill1 = instance_create_layer(ocw + 130,och - 30,"Menu",skillSlot);
		skill1.skill = 2;
	}
	
	
	
	
	
	
}
#endregion


#region ------------ PLAYER SKILLS FUNCTIONS --------

function player_skill_01(){
	var inst = instance_create_depth(global.player.x,global.player.y+1,global.player.depth,SkillOne);
	inst.atack = global.player_stats[global.player_index].magic*2;
}

function player_skill_02(){
	var inst = instance_create_depth(global.player.x,global.player.y+1,global.player.depth,SkillOneB);
	inst.atack = global.player_stats[global.player_index].magic*2;
}

function player_skill_03(){
	show_message("Skill 3");	
}




#endregion