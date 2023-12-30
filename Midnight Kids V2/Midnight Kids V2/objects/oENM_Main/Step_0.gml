if is_on_view {
	//BattleRun();
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
			gplayer = global.player
			gplayeridx = global.player_index
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
						gplayer.enemy_ranged = true;
						if gplayer.attack_cooldown <= 1 
						{
							if global.player_stats[global.party.players[0]].style != 1 
							{
								if mouse_radius(self, 20, (global.player_stats[global.party.players[0]].hitrate/2)) 
								{
									//Se clicar no inimigo e estiver no Range:
									var dmg = battle_calculate_damage(gplayer, self, gplayeridx);
									var yy = y - sprite_height;
									var dmg_inst = instance_create_depth(x,yy,global.intern.depths.msg,_BATTLE_DMG);
									dmg_inst.dmg = dmg;
									dmg_inst.super = gplayer;
									hp -= dmg;	
									damaged = true;
									attacked = true;
									// === //
								}
							}
							else {
								//Se clicar no inimigo e estiver no Range:
								var dmg = battle_calculate_damage(gplayer, self, gplayeridx);
								var yy = y - sprite_height;
								var dmg_inst = instance_create_depth(x,yy,global.intern.depths.msg,_BATTLE_DMG);
								dmg_inst.dmg = dmg;
								dmg_inst.super = gplayer;
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
			if position_meeting(x,y,oDmgObject) {
				var object_skill = instance_place(x,y,oDmgObject);
				var dmgobj = find_value_on_array_bool(damageid, object_skill)
				if object_skill != -4 and instance_exists(object_skill)
				{
					if object_skill.deal_damage and !dmgobj
					{
					VIEW_RANGE = VIEW_BASIC * 1.5;
					if Dynamic_Range BATTLE_RANGE = BATTLE_MAX_RANGE*2.5;
					attacked = true;
					var dmg = battle_calculate_object_damage(object_skill, self);
					var yy = y - sprite_height;
					var dmg_inst = instance_create_depth(x,yy,global.intern.depths.msg,_BATTLE_DMG);
					dmg_inst.dmg = dmg;
					dmg_inst.super = gplayer;
					hp -= dmg;	
					damaged = true;
					array_push(damageid, object_skill)
					sdm(damageid);
					if variable_instance_exists(object_skill, "class")
					{
						if object_skill.class == 1 instance_destroy(object_skill);
					}
					// === //
					}
				}
			}	
		}
	
		function look_at_direction(){
			if !lock_direction {
				if force_stop == false {
					if x > gplayer.x image_xscale = -1
					else image_xscale = 1
				}
			}
		}
	
		function look_for_player(){
		
		
			if !deactivate_range {
			
				on_vision_range = battle_vision_range();
				on_view_range = battle_enemies_get_range();
				on_attack_range = battle_enemies_get_attack();
				get_player = battle_enemies_get_player();
		
				if !on_view_range and !on_attack_range and !on_vision_range and state_machine == "ON_RANGE" state_machine = "FINISHING"
				if on_view_range or attacked or on_vision_range{
					if attacked {
					
						 VIEW_RANGE = VIEW_BASIC * 1.4
						 if Dynamic_Range BATTLE_RANGE = BATTLE_MAX_RANGE*2;
					}
					else VIEW_RANGE = VIEW_BASIC
					if Dynamic_Range BATTLE_RANGE = BATTLE_MAX_RANGE;		
				} /// < Main
				else{
					if range_alarm_aux == false {
						if VIEW_RANGE > VIEW_RANGE*1.4 alarm_set(2,2320);
						if Dynamic_Range if BATTLE_RANGE > BATTLE_MAX_RANGE alarm_set(2,2320);
						else alarm_set(2,1120);
						range_alarm_aux = true;
					}		
				}
			
			}
		}
	
		function variable_handling(){	
			if (stageid == -1 and on_skill) or stages = [0,0,0,0,0] on_skill = false
		
			if get_player > -1 aim_target = global.party.playersobj[get_player];
			if new_attack_cooldown >= 1 new_attack_cooldown--;
			else remove_from_runonce("Attack")
		
		
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
					if SkillFrequency <= -1 SkillFrequency = irandom_range(0,SkillFrequencyMax);	
				}
			}
			else if stageid == -1 {
				if !grant_stop force_stop = false;	
				SkillUsed = 0;
			}
			if get_player == 0 basic_damage = battle_enemy_calculate_damage(self, self, global.party.players[get_player], 1);
			else if get_player == 1 basic_damage = battle_enemy_calculate_damage(self, self, global.party.players[get_player], 0.35);
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
						look_at_direction()
						if alarm_setted[1] == false BATTLE_ATACK = irandom_range(BATTLE_BASIC*1,BATTLE_BASIC*2.4);
						alarm_setted[1] = true;
						state_machine = "";	
					}
					else if on_view_range or on_vision_range
					{
						look_at_direction()
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
			
				if alarm_setted[0] == false and (state_machine != "WALKING" or state_machine != "FINISHING")
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
		
		}
		
		function allow_attack(){
			if !on_skill and on_attack_range
			{
				return true	
			}
			else return false
		}

		function perform_attack(){
			if allow_attack(){
				if run_once("Attack") 
				{
					if atacktype == "melee" 
					{
						if CustomAttack {
							change_graphic(CustomAttackSprite);
							spr_aux = true;
						}
						else {
							
							battle_deal_damage(basic_damage, get_player);	
						}
					}
					else
					{
						var ins = instance_create_depth(x,y,depth,atackprojectile);
						ins.dmg = global.enemy_stats[myid].atack;
						ins.target = get_player;
					}
					new_attack_cooldown = 102;
				}
			}
		}

		function walk_around(){
			if (!on_view_range and !on_attack_range and !on_vision_range and !force_stop) 
			{
					if run_once_timed("Walking", irandom_range(5,300))
					{
						target_x = random_range(x - BATTLE_RANGE*2, x + BATTLE_RANGE*2);
						target_y = random_range(y - BATTLE_RANGE*2, y + BATTLE_RANGE*2);
						while position_meeting(target_x, target_y, colisor){
							target_x = random_range(x - BATTLE_RANGE*2, x + BATTLE_RANGE*2);
							target_y = random_range(y - BATTLE_RANGE*2, y + BATTLE_RANGE*2);
						}
						sprite_index = spr_index;
						alarm_set(1,1)
					}
				
			}
		}

		function get_skills()
		{
	
		}

		function skill_execute() {
				 if useskill == 1 argskill = Skills[shrinkarray[choosedskill]]
			else if useskill == 2 argskill = SkillsRanged[shrinkarray[choosedskill]]
			if useskill == 1 or useskill == 2 or useskill == 3
			{
				if argskill.arg != "" 
				{
					script_execute(argskill.code, choosedskill.arg);
				}
				else {
					script_execute(argskill.code);	
				}
				///
		
				if stageid == 4 and stages[4] <= 0 {
					SkillFrequency = argskill.cooldown;
				}
			}		
		}
		
		function skill_choose(argskill){
			// Método para escolher qual skill usar
			var rng = irandom_range(0,100);
			if argskill == 1 
			{
				shrinkarray = GPT_array_find_less(SkillChance, rng);
				var length = array_length(shrinkarray)-1;
				if length <= 0 length = 0;
				choosedskill = irandom_range(0,length);
				on_skill = true;
			}
		
			if argskill == 2
			{
				shrinkarray = GPT_array_find_less(SkillRangedChance, rng);
				var length = array_length(shrinkarray)-1;
				if length <= 0 length = 0;
				choosedskill = irandom_range(0,length);
				on_skill = true;
			}
		
		}
	
		function skill_manager(){
			if !on_skill 
			{
				// Se não tiver em skill:
				if SkillFrequency <= 0 
				{
					// Se as skills não estiverem em cooldown
					useskill = 0
					// Define o uso de skill (0 = nada)
					if on_attack_range {
						var _srng = irandom_range(0,100)
						if _srng > 10 useskill = 1
						else useskill = 2
					}
					else if on_view_range useskill = 2
					if useskill != 0 {
						// Se estiver no range, roda a skill_choose
						skill_choose(useskill);
						if shrinkarray[0] != -1 {
							skill_execute();
							if useskill == 1 argskill = Skills[shrinkarray[choosedskill]]
							else if useskill == 2 argskill = SkillsRanged[shrinkarray[choosedskill]]
							SkillFrequency = argskill.cooldown + irandom_range(SkillFrequencyMax*.85,SkillFrequencyMax*1.15);
						}
						//stages[0] = 52;
					}
				
				
				}
			}
			else
			{
				// Se tiver em skill:
				if shrinkarray[0] != -1 skill_execute();
			}
		}
	
		function post_skill_processing(){
			battle_buff_timer();	
		}
	
	#endregion




// Se estiver na Viewport: Renderiza e liga o objeto
	variables_update()
	// Atualiza variaveis de posição e player
	
	variable_handling();
	// Gerencia os timers
	
	damage_functions();
	// Fica em cargo do dano recebido pelo inimigo
	
	look_for_player();
	// Verifica se o player tá no range de visão
	
	if !on_skill walk_around();
	// Anda por ai (caso o player não esteja no range)
	
	if !on_skill perform_attack();
	// Ataca o player || Está acima do follow por questões de rotina
	
	follow_player();
	// Segue o player para atacar
	
	skill_manager();
	// 1 - Faz o levantamento, a computação e os calculos de skills
	// 2 - Lida com os efeitos da skill, como pré-load e pós-load
	
	post_skill_processing();
	sdm(_BATTLE_BUFF)
}
else
{
	stages = [0,0,0,0,0];
	on_skill = false;
	skill_end_basic();
}