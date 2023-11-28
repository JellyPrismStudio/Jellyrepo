BattleRun();
check_position();
kdepth_sort();

cww = _GLOBAL_CAMERA.camera_w;
chh = _GLOBAL_CAMERA.camera_h;
cxx = global.player.x;
cyy = global.player.y;
fxx1 = cxx - cww;
fxx2 = cxx + cww;
fyy1 = cyy - chh;
fyy2 = cyy + chh;

if (x > fxx1 and x < fxx2) and (y > fyy1 and y < fyy2) {
if kget_radius(self.id,BATTLE_RANGE,false,true,true,global.player) and !pathing and ANIMATION_COOLDOWN <= 0{
	if PATHING_TRIGGER == true	pathing = false;
	else pathing = true;
	state_machine = "ON_RANGE";
	alarm_set(0,10);
}
else
{
	//var rr = 0;
	var rr = random_range(0,1000);
	if rr > 993{
		if !pathing and ANIMATION_COOLDOWN <= 0{
			if PATHING_TRIGGER == true	pathing = false;
			else pathing = true;
			state_machine = "WALKING";
			alarm_set(0,10);
		}
	}
}
	

if to_gamepad_pressed(mb_left) or keyboard_check_pressed(vk_space){
	if kget_radius(global.player, (global.player.sprite_width)*4,false,true,false,self){
		if mouse_radius(self, 0) {
			//Se clicar no inimigo e estiver no Range:
			var dmg = battle_calculate_damage(global.player, self, global.player_index);
			var yy = y - sprite_height;
			var dmg_inst = instance_create_depth(x,yy,-1010001,_BATTLE_DMG);
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



/// Verificando se o player está no range de ataque, se estiver, roda o alarm pro ataque
if kget_radius(self, BATTLE_ATACK,false,true,true,global.player){
	if PATHING_COOLDOWN <= 0 {
		// Verificando o random_range pra usar skill
		var rdm = irandom_range(0,100);
		if rdm >= 80{
			var skill = irandom_range(0,(_SKILL_MAX-1));
			choosedskill = SKILLS[skill];
			script_execute(choosedskill.code);
			///
			clear_skill_script();
		}
		else{
			PATHING_TRIGGER = true; 
			state_machine = ""; 
			event_user(0);
		}
	}
}
else PATHING_TRIGGER = false;

if place_meeting(x,y,OBJ_HIT){
			
}
	
	
/// ==== TIMERS === ///
if PATHING_COOLDOWN > 0 and ANIMATION_COOLDOWN <= 0 PATHING_COOLDOWN--
if ANIMATION_COOLDOWN > 0 ANIMATION_COOLDOWN--

// Limpando os timers

function clear_skill_script(anim_cd = 60, path_cd = 100){
	PATHING_TRIGGER = true; 
	state_machine = ""; 
	ANIMATION_COOLDOWN = anim_cd;
	PATHING_COOLDOWN = path_cd;
	path_delete(path);
	path = path_add();
	pathing = false;		
}
	
}