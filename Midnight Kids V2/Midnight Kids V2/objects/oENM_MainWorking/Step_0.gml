BattleRun();
if !RUNNING_SKILL check_position();
kdepth_sort();

function run_skill(){
	RUNNING_SKILL = true;
	if !SKILL_COOLDOWNLING {
		if choosedskill.arg != ""{
			script_execute(choosedskill.code, choosedskill.arg);
		}
		else script_execute(choosedskill.code);
	}
}
	
function check_lock_status(){
	if !pathing and ANIMATION_COOLDOWN <= 0 return true
	else return false
}
	
//====================================================================//
//
//
//
//
//
//====================================================================//

if RUNNING_SKILL {
	if sprite_index != spr_index {
		if image_index >= sprite_get_number(sprite_index){
			
		}		
	}	
}

if SKILL_COOLDOWNLING {
	if SKILL_COOLDOWN > 0 SKILL_COOLDOWN--
	else {
		SKILL_COOLDOWNLING = false;
		SKILL_COOLDOWN = 5;
	}
	
}

if on_view() {
// Se estiver na Viewport:
	

#region Variables
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
#endregion

if (x > fxx1 and x < fxx2) and (y > fyy1 and y < fyy2) {
///// IF ACIMA É PARA VERIFICAR SE ESTObÁ NA TELA

/// Range, Attack and Idle
/////////////////////////////////////////////////////////////
	if battle_enemies_get_range() and !global.debug.ghosting{
		// ON RANGE EVENT
		// Se o Player estiver no range, executa:
		if global.debug.colors image_blend = c_red;
		var rdmrg = irandom_range(0,10000);
		// rdmrg é a chance de usar uma skill.
		if rdmrg < 9972 {
			// Se for menor que 9972, ataca normalmente.
			if check_lock_status(){
				if PATHING_TRIGGER == true	pathing = false;
				else pathing = true;
				state_machine = "ON_RANGE";
				alarm_set(0,10);
			}
		}
		else
		{
			////////////////
			if PATHING_COOLDOWN <= 0{
				if global.debug.colors image_blend = c_purple;
				var skill = irandom_range(0,(_SKILL_MAX-1));
				choosedskill = SKILLS_RANGED[skill];
				run_skill();
			}
			////////////////
		}
	}
	else if !battle_enemies_get_range() or global.debug.ghosting
	{		
		// Se não estiver no range, ou estiver em ghosting:
		if !battle_enemies_get_range(1.3){
			if global.debug.colors image_blend = c_green;
			ANIMATION_COOLDOWN = 0;
			PATHING_COOLDOWN = 0;
		}else if global.debug.colors image_blend = c_blue;
			
			//var rr = 0;
			var rr = random_range(0,1000);
			if rr > 993{
				if check_lock_status(){
					if PATHING_TRIGGER == true	pathing = false;
					else pathing = true;
					state_machine = "WALKING";
					alarm_set(0,10);
				}
			}
		
	}




/// Hit e calculo de dano
/////////////////////////////////////////////////////////////

	if to_gamepad_pressed(mb_left) or keyboard_check_pressed(vk_space){
		if kget_radius(global.player, (global.player.AIM_RANGE + (global.player_stats[global.party.players[0]].hitrate)/4),false,true,false,self){
			if global.player_stats[global.party.players[0]].style != 1 {
				if mouse_radius(self, 0, (global.player_stats[global.party.players[0]].hitrate/2)) {
					//Se clicar no inimigo e estiver no Range:
					var dmg = battle_calculate_damage(global.player, self, global.player_index);
					var yy = y - sprite_height;
					var dmg_inst = instance_create_depth(x,yy,global.intern.depths.msg,_BATTLE_DMG);
					dmg_inst.dmg = dmg;
					dmg_inst.super = global.player;
					hp -= dmg;	
					damaged = true;
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
				// === //				
			}
		}
		else{
		}
	}
		
		
	if place_meeting(x,y,oDmgObject) {
		var object_skill = instance_place(x,y,oDmgObject);
		if object_skill.deal_damage {
		//Se clicar no inimigo e estiver no Range:
		var dmg = battle_calculate_object_damage(object_skill, self);
		var yy = y - sprite_height;
		var dmg_inst = instance_create_depth(x,yy,global.intern.depths.msg,_BATTLE_DMG);
		dmg_inst.dmg = dmg;
		dmg_inst.super = global.player;
		hp -= dmg;	
		damaged = true;
		// === //
		}
	}

	



	/// Verificando se o player está no range de ataque, se estiver, roda o alarm pro ataque
	if battle_enemies_get_attack() and !global.debug.ghosting{
		// Verifica se o player tá no range de ATAQUE, baseado na var BATTLE_ATACK
		// PS: Não confundir o range de VISÃO com o de ATAQUE. São dois ranges diferentes.
		
		if PATHING_COOLDOWN <= 0 and ANIMATION_COOLDOWN <= 0 and !RUNNING_SKILL{
			// Verificando o random_range pra usar skill
			randomize();
			var rdm = irandom_range(0,100);
			if rdm >= 60 and !RUNNING_SKILL{
				if global.debug.colors image_blend = c_purple;
				var skill = irandom_range(0,(_SKILL_MAX-1));
				choosedskill = SKILLS[skill];
				run_skill();
				///
			}
			else{
				BATTLE_RANGE = BATTLE_AUX1;
				BATTLE_ATACK = BATTLE_AUX2;
				ANIMATION_COOLDOWN = 0;
				RUNNING_SKILL = false;
				ANIMATION_TRIGGER = false;
				PATHING_TRIGGER = true; 
				state_machine = ""; 
				event_user(0);
			}
			// Verificando o random_range pra usar skill
		} else if RUNNING_SKILL == true	run_skill();
	}
	else {
		// Se não estiver, liga PATHING_TRIGGER
		PATHING_TRIGGER = false;
	}
 ///////////////// END

/// ==== TIMERS === ///
if ANIMATION_COOLDOWN > 0 ANIMATION_COOLDOWN--
if PATHING_COOLDOWN > 0 and ANIMATION_COOLDOWN <= 0 PATHING_COOLDOWN--

// Limpando os timers
	function clear_skill_script(){
		PATHING_TRIGGER = true; 
		state_machine = ""; 
		path_delete(path);
		path = path_add();
		pathing = false;
		sprite_index = spr_index;
		SKILL_COOLDOWNLING = true;
		RUNNING_SKILL = false;
	}
	
}
}