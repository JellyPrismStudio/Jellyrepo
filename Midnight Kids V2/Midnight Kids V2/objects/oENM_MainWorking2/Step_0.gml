BattleRun();
if !spr_aux {
	if variable_instance_exists(self.id,"DirectionableIndexes") check_position();
	else check_position_axis();
}
kdepth_sort();

#region Functions

	function variables_update(){
		cww = _GLOBAL_CAMERA.camera_w;
		chh = _GLOBAL_CAMERA.camera_h;
		cxx = global.party.playersobj[battle_enemies_get_index()].x;
		cyy = global.party.playersobj[battle_enemies_get_index()].y;
		cxx = x; 
		cyy = y; 
		fxx1 = cxx - cww;
		fxx2 = cxx + cww;
		fyy1 = cyy - chh;
		fyy2 = cyy + chh;
	}

	function damage_functions(){
		if to_gamepad_pressed(mb_left)
		{
			var enemy_on_range = battle_complex_click();
				if enemy_on_range
				{
					global.player.enemy_ranged = true;
					if global.player.attack_cooldown <= 1 
					{
						if global.player_stats[global.party.players[0]].style != 1 
						{
							if mouse_radius(self, 20, (global.player_stats[global.party.players[0]].hitrate/2)) 
							{
								//Se clicar no inimigo e estiver no Range:
								var dmg = battle_calculate_damage(global.player, self, global.player_index);
								var yy = y - sprite_height;
								var dmg_inst = instance_create_depth(x,yy,global.intern.depths.msg,_BATTLE_DMG);
								dmg_inst.dmg = dmg;
								dmg_inst.super = global.player;
								hp -= dmg;	
								damaged = true;
								attacked = true;
								// === //
							}
						}
						else {
							//Se clicar no inimigo e estiver no Range:
							var dmg = battle_calculate_damage(global.player, self, global.player_index);
							var yy = y - sprite_height;
							var dmg_inst = instance_create_depth(x,yy,global.intern.depths.msg,_BATTLE_DMG);
							dmg_inst.dmg = dmg;
							dmg_inst.super = global.player;
							hp -= dmg;	
							damaged = true;
							attacked = true;
							// === //				
						}
					}
				
				}
				else{
				}
		}		
		
		if place_meeting(x,y,oDmgObject) {
			var object_skill = instance_place(x,y,oDmgObject);
			if object_skill.deal_damage and damageid != object_skill{
				
				BATTLE_RANGE = BATTLE_MAX_RANGE*2.5;
				attacked = true;
				var dmg = battle_calculate_object_damage(object_skill, self);
				sdm(dmg);
				var yy = y - sprite_height;
				var dmg_inst = instance_create_depth(x,yy,global.intern.depths.msg,_BATTLE_DMG);
				dmg_inst.dmg = dmg;
				dmg_inst.super = aim_target;
				hp -= dmg;	
				damaged = true;
				damageid = object_skill
				// === //
			}
		}

	
	}
	
	function look_for_player(){
		if !deactivate_range {
			
			on_view_range = battle_enemies_get_range();
			on_attack_range = battle_enemies_get_attack();
		
			if on_view_range {
				//aim_target = global.party.playersobj[battle_enemies_get_attack_id()];	
			}
	
			if on_view_range or attacked{
				if attacked {
					 BATTLE_RANGE = BATTLE_MAX_RANGE*2;
				}
				else BATTLE_RANGE = BATTLE_MAX_RANGE;		
			} /// < Main
			else{
				if range_alarm_aux == false {
					if BATTLE_RANGE > BATTLE_MAX_RANGE alarm_set(2,2320);
					else alarm_set(2,1120);
					range_alarm_aux = true;
				}		
			}
			
		}
	}
	
	function variable_handling(){
		if stages[0] > 0 and stages[1] > 0 and stages[3] > 0 and stages[4] > 0 {
			finished_skill = true;
			on_skill = true;
		}
		else {
			if finished_skill == true {
				// Reseta UMA vez depois da skill
				state_machine = "";
				alarm_set(0,3);		
				finished_skill = false;
			}
			on_skill = false;			
		}
		
		if !on_skill
		{
			force_pacify = false;
			
		}
		
		aim_target = global.party.playersobj[0];
		if new_attack_cooldown >= 1 new_attack_cooldown--;
		//else {
		//	new_attack_cooldown = 0;	
		//}
		if SkillFrequency >= 1 SkillFrequency--;
		
		// Verificando os stages.
		// Stage 0: Pre-animação
		// Stage 1: Estágio do dano, manter em 0 por enquanto
		// Stage 2: Pós animação (Ficar travado na anim, descanso, cooldown)
		// Nota: Stage 2 e skill cooldown são coisas diferentes. Após o fim do estágio 2
		// A Skill Cooldown ainda é executada. Stage 2 faz parte da skill, já o cooldown 'não'.
		if stageid == 0 {
			if stages[0] > 0 stages[0]--
			else stageid = 1;
		}
		else if stageid == 1 {
			if stages[1] > 0 stages[1]--
			else stageid = 2;
		}
		else if stageid == 2 {
			if stages[2] > 0 stages[2]--
			else stageid = 3;	
		}
		else if stageid == 3 {
			if stages[3] > 0 stages[3]--
			else stageid = 4;	
		}
		else if stageid == 4 {
			if stages[4] > 0 stages[4]--
			else {
				if SkillFrequency <= 0 SkillFrequency = irandom_range(0,800);
				clear_variables()
			}
		}
		else if stageid == -1 {
			if !grant_stop force_stop = false;	
			SkillUsed = 0;
		}
	
	}
	
	function clear_variables(){
		stageid = -1;
		choosedskill = -1;
		sort_skill = -1;
		spr_aux = false;	
		SkillUsed = 0;
	}
	
	function follow_player(){
			if !force_stop 
			{
				if on_attack_range 
				{
					if alarm_setted[1] == false BATTLE_ATACK = irandom_range(BATTLE_BASIC*1,BATTLE_BASIC*2.4);
					alarm_setted[1] = true;
					state_machine = "";	
				}
				else if on_view_range 
				{
					BATTLE_ATACK = BATTLE_BASIC;
					alarm_setted[1] = false;
					state_machine = "ON_RANGE";	
				}
				else
				{
					BATTLE_ATACK = BATTLE_BASIC;
					alarm_setted[1] = false;
				}
				
				
			}
			
			if alarm_setted[0] == false and (state_machine != "WALKING" and state_machine != "FINISHING")
			{
				alarm_set(0,3);
				alarm_setted[0] = true;		
			}
			else
			{
				if alarm_get(0)	<= 0 {
					alarm_setted[0] = false;	
				}
			}
		
			/*
			if on_view_range and !force_stop and !force_ignore and !on_attack_range{
				state_machine = "ON_RANGE";
				new_on_range = true;		
			}
			else if state_machine != "" and state_machine != "WALKING" {
				state_machine = "FINISHING";	
			}
			
			if (state_machine == "ON_RANGE" or state_machine == "ON_ATTACK") and alarm_setted[0] == false{
				alarm_set(0,3);
				alarm_setted[0] = true;			
			}
			
			if state_machine == "FINISHING" and alarm_setted[0] == false
			{
				alarm_set(0,3);
				alarm_setted[0] = true;
			}
			*/
	}

	function perform_attack(){
		if !force_pacify {
			if on_attack_range{
				if new_attack_cooldown < 1 { // or CustomAttack {
					event_user(0);
				}
			}
			else attack_aux = false;
		}
	}

	function walk_around(){
		if (!on_view_range and !on_attack_range and !force_stop) 
		{
				if state_machine == ""{
					state_machine = "WALKING";
					alarm_set(0,1);
				}
				else if x == path_get_x(path,1) and y == path_get_y(path,1){
					//Esperar?
					
					if !new_wait {
						alarm_set(1,irandom_range(new_wait_rangemin,new_wait_rangemax));
						new_wait = true;
					}
				}
		}
	}

	function get_skills()
	{
		if SkillFrequency <= 0 {
		
			// De 0% a 100%
			// Quanto menor o numero, mais rara a skill
			if on_view_range and !on_attack_range and (SkillUsed == 0 or SkillUsed == 2) {
				SkillUsed = 2
				// Ranged Skills
				if sort_skill == -1 sort_skill = irandom_range(0,100);
				// Primeiro, vamos sortear um numero de 0 a 100. Digamos que foi 70.
				// 70 significa o range de skills que vamos executar.
				// Ou seja, skills de 70% ou mais de chance, executam. Abaixo disso, não.
				var skills = GPT_array_find_less(SkillRangedChance, sort_skill);
				// Agora, rodamos o GPT function para encontrar na array variáveis
				// Que sejam pelo menos 70 ou mais.
				// As variaveis encontradas serão estocadas na var skills (array)
				var length = array_length(skills)-1;
				// Pegando o tamanho da array
				if length <= 0 length = 0;
				// O método acima são puramente para garantir que o valor seja válido.
				if choosedskill == -1 choosedskill = irandom_range(0,length);
				// Agora, da array com as skills no range, sorteamos uma skill para usar (RNG)
				if skills[0] != -1 skill_execute(SkillsRanged[skills[choosedskill]]);
				else clear_variables();
				// Executa a skill escolhida
			
			}
			else if on_view_range and on_attack_range and (SkillUsed == 0 or SkillUsed == 1) {
				SkillUsed = 1;
				// Melee
				// Basicamente o mesmo código que o do Ranged
				if sort_skill == -1 sort_skill = irandom_range(0,100);
				var skillm = GPT_array_find_less(SkillChance, choosedskill);
				var length = array_length(skillm)-1;
				if length <= 0 length = 0;
				if choosedskill == -1 choosedskill = irandom_range(0,length);
				if skillm[0] != -1 skill_execute(Skills[skillm[choosedskill]]);
				else clear_variables();
				//
			}		
		}
	}

	function skill_execute(skill) {
		if sprite_index != CustomAttackSprite {
			if skill.arg != "" {
				script_execute(skill.code, choosedskill.arg);
			}
			else {
				script_execute(skill.code);	
			}
			if stageid == 4 and stages[4] <= 0 {
				SkillFrequency = skill.cooldown;
			}
		}
		//SkillFrequency = skill.cooldown;
	}
	
	function skill_manager(){
		get_skills();
	}
	
	function post_skill_processing(){
	
	
	}
	
#endregion

if on_view() {
// Se estiver na Viewport: Renderiza e liga o objeto
	variables_update()
	// Atualiza variaveis de posição e player
	
	variable_handling();
	// Gerencia os timers
	
	if !on_skill damage_functions();
	// Fica em cargo do dano recebido pelo inimigo
	
	look_for_player();
	// Verifica se o player tá no range de visão
	
	walk_around();
	// Anda por ai (caso o player não esteja no range)
	
	perform_attack();
	// Ataca o player || Está acima do follow por questões de rotina
	
	follow_player();
	// Segue o player para atacar
	
	skill_manager();
	// 1 - Faz o levantamento, a computação e os calculos de skills
	// 2 - Lida com os efeitos da skill, como pré-load e pós-load
	
	post_skill_processing();
}