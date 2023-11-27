function create_skill_database(){
	global.BATTLE_SKILLS = {
		GENERAL:{
			NOTHING :
			{
				name: "Nada",
				code: skill_nada,
				arg  : "",
				cooldown : 1,
			},
			
			NONE :
			{
				name: "Nada",
				code: skill_nada,
				arg  : "",
				cooldown : 400,
			},
				
			REST :
			{
				name: "Descansar",
				code: skill_stop,
				arg: "",
				cooldown: 1,
			},
			
			CUSPIR_ACIDO :
			{
				name : "Cuspir Acido",
				code : skill_cuspir_acido,
				arg  : "",
				cooldown: 350,
			},
			
		},
			
		BUFFS:
		{
			SPD :
			{
				name: "BuffSpeed",
				code: buff_speed,
				arg  : "",
				cooldown : 375,
			},	
		},
		FROG:{
			ATTACK :
			{
				name: "Attack",
				code: attack_frog,
				arg  : "",
				cooldown : 100,
			},	
			SUPERJUMP:
			{
				name: "Super Jump",
				code: skill_super_jump,
				arg: "",
				cooldown: 530,
			}
		},
		
		MOTH:{
			POISON:
			{
				name: "Poison",
				code: skill_moth_poison,
				arg: "",
				cooldown: 120,
			},
			
			SPIT:
			{
				name: "Spit",
				code: skill_moth_spit,
				arg: "",
				cooldown: 20,				
			},
			
		},
		
		MOSQUITO:{
			RUSH:
			{
				name: "Encontrão",
				code: skill_rush,
				arg: "",
				cooldown: 100,
				
			}
			
		}
	}
}


#region Functions

function animation_end(anim_sprite)
{
	var check = false;
	if sprite_index == anim_sprite
	{
		if image_index >= sprite_get_number(anim_sprite) -0.25
		{
			check = true	
		}
	}
	return check
}

function wait_for_anim(anim_sprite)
{
	if sprite_index == anim_sprite
	{
		if image_index >= sprite_get_number(anim_sprite) -0.25
		{
			stages[stageid] = 0;
			//stageid++;	
		}
	}
}

function wait_for_anim_ext(anim_sprite, stage)
{
	if stageid == stage {
		if sprite_index == anim_sprite
		{
			if image_index >= sprite_get_number(anim_sprite) -0.25
			{
				stages[stageid] = 0;
				//stageid++;	
			}
		}
		else
		{
			image_index = 0;
			sprite_index = anim_sprite
			image_index = 0;
		}
	}
}

function set_anim(pre_anim,pre_anim2,pos_anim,pos_anim2){
	if stageid == -1 {
		stageid = 0;
		stages[0] = pre_anim;
		stages[1] = pre_anim2;
		stages[3] = pos_anim;
		stages[4] = pos_anim2;
	}
}

function do_damage(range){
	if kget_radius(self.id,range,false,true,true,global.party.playersobj[0])
	{
		create_damage(get_player, 1);
	}
}

function check_stage(_var){
	if stageid == _var return true
	else return false
}

function before_dmg_stage(){
	if stageid <= 1 return true
	else return false
}

function after_dmg_stage(){
	if stageid >= 3 return true
	else return false
}

function start_stage(){
	if stageid == 0 return true
	else return false
}

function pre_damage_stage(){
	if stageid == 1 return true
	else return false
}

function damage_stage(){
	if stageid == 2 return true
	else return false
}

function pos_damage_stage(){
	if stageid == 3 return true
	else return false
}

function end_stage(){
	if stageid == 4 and stages[4] <= 0 return true
	else return false	
}

function end_damage_stage(){
	stageid = 3;
}

function end_skill_action(){
	if stageid == 4 and stages[4] <= 1{
		force_stop = false;
		
	}
}

function end_skill(){
	if stageid == 4 and stages[4] <= 1{
		return true
	}
	else return false
}

function clear_stages(stage){
	if stageid == 1 stages[0] = 0
	if stageid == 2 stages[1] = 0
	if stageid == 3 stages[2] = 0
	if stageid == 4 stages[3] = 0
}
	
function wait(time, timeII, timeIII, timeIV)
{
	if stageid == -1 {
		stages[0] = time;
		stages[3] = timeIII;	
		stages[1] = timeII;
		stages[4] = timeIV;
		stageid = 0;
	}	
	clear_stages(stageid)
}

function set_prestage(stage1,stage2,stage3,stage4)
{
	if stageid == -1 {
		stages[0] = stage1;
		stages[3] = stage3;	
		stages[1] = stage2;
		stages[4] = stage4;
		stageid = 0;
	}	
	clear_stages(stageid)
}

function set_prestage_anim(pre_anim, pre_anim2, pos_anim, pos_anim2, pregraphic = spr_index, posgraphic = spr_index, reset = true){
	if stageid == -1 {
		stages[0] = pre_anim;
		stages[3] = pos_anim;	
		stages[1] = pre_anim2;
		stages[4] = pos_anim2;
		if reset {
			sprite_index = spr_index;	
			//spr_aux = false;
		}
		stageid = 0;
	}	
	if stageid == 0 {
		sprite_index = pregraphic;	
		//spr_aux = true;
	}
	if stageid == 1 {
		stages[0] = 0;
		sprite_index = pregraphic;	
		//spr_aux = true;
	}
	if stageid == 3 {
		stages[2] = 0;
		stages[1] = 0;
		sprite_index = posgraphic;
		//spr_aux = true;
	}
	if stageid == 4 {
		stages[0] = 0;
		stages[1] = 0;
		stages[2] = 0;
		stages[3] = 0;
		sprite_index = posgraphic;
		//spr_aux = true;
	}
	clear_stages(stageid)
}

function set_prestage_anim_ext(pre_anim, pre_start, pos_anim, pos_end, pregraphic = spr_index, pregraphic2 = spr_index, posgraphic = spr_index,  posgraphic2 = spr_index, reset = true){
	if stageid == -1 {
		stages[0] = pre_anim;
		stages[1] = pre_start;
		stages[3] = pos_anim;	
		stages[4] = pos_end;
		if reset {
			sprite_index = spr_index;	
			//spr_aux = false;
		}
		stageid = 0;
	}	
	if stageid == 0 {
		sprite_index = pregraphic;	
		//spr_aux = true;
	}
	if stageid == 1 {
		sprite_index = pregraphic2;	
		//spr_aux = true;
	}
	if stageid == 3 {
		sprite_index = posgraphic;
		//spr_aux = true;
	}
	if stageid == 4 {
		sprite_index = posgraphic2;
		//spr_aux = true;
	}
	clear_stages(stageid)
}

function lock_movement(stage){
	if stageid == stage {
		if path_exists(path) path_delete(path);
		force_stop = true;
	}
}

function unlock_movement(stage=-1){
	if stageid == stage {
		force_stop = false;
	}
	if stageid <= -1 {
		force_stop = false;
	}	
}
	
function skill_end_basic()
{
	if end_skill(){
		lock_direction = false;
		force_pacify = false;	
		deactivate_range = false;
		shrinkarray = [];
		useskill = 0; // Melee ou ranged
		clear_variables();
		on_skill = false;
		stages = [0,0,0,0,0]
		force_stop = false;
	}	
}

function clear_variables_skill(){
	force_pacify = false;	
	deactivate_range = false;
	shrinkarray = [];
	useskill = 0; // Melee ou ranged
	clear_variables();
	on_skill = false;
	stages = [0,0,0,0,0]
	force_stop = false;	
}

#endregion



#region Buffs

function buff_text(text)
{
	var binfo = instance_create_depth(x,y,depth,_BATTLE_INFO);
	binfo.text = text;	
}

function buff_speed()
{
	if check_stage(0){
		tool_waiting();
	}
	wait(90,20,50,0);
	lock_movement(0);
	lock_movement(1);
	lock_movement(3);
	if damage_stage()
	{		
		battle_buff_debuff("HIT", 2, 450)
		battle_buff_debuff("EVA", 3, 450)
		buff_text("Agility Up")
		end_damage_stage();
	}
	unlock_movement(4);
	skill_end_basic()
}
#endregion

function skill_preset(){
	lock_movement(0);
	lock_movement(1);
	// Com Lock Movement você trava o inimigo, no stage indicado no argumento.
	// Você pode duplicar esse comando e colocar outro stage, caso queira que mais de um stage fique
	// travado
	unlock_movement(4);
	// O oposto do Lock Movement, destrava o personagem no stage do arg.
	set_prestage_anim(100,0,400,0,Bat_Attacking,BlueSnake_Walking);
	// set_prestage_anim( A, B, C, D, E );
	// Essa função seta as variaveis e os timers da skill:
	// A - Seta o tempo (frames) que leva para o inimigo conjurar a magia
	// B - Seta o tempo (frames) que leva para o inimigo descansar após a magia, pós casting, animação
	// C - Gráfico da conjuração da magia
	// D - Gráfico do pós cast
	// E - Reseta o gráfico para o original (padrão = true)
	if damage_stage(){
		var drop = instance_create_depth(x,y,depth-1,oVenom_Spit);
		drop.super = self;
		drop.dmg = global.enemy_stats[myid].magic;
		end_damage_stage(); 
		// Obrigatório.
		// Essa função avança pro próximo stage quando o dano for executado
	}
}

function skill_cuspir_acido(){
	lock_movement(0);
	unlock_movement(4);
	//unlock_movement(2);
	set_prestage_anim(30,0,140,0,BlueSnake_Idle,BlueSnake_Walking);
	if damage_stage(){
		var drop = instance_create_depth(x,y,depth-1,oVenom_Spit);
		drop.super = self;
		drop.target = get_player;
		drop.dmg = global.enemy_stats[myid].magic;
		end_damage_stage(); // Obrigatório
	}
	if end_stage(){
		unlock_movement();
	}
	skill_end_basic()
}

function skill_nada(){
	set_anim(0,0,1,0)
	if damage_stage(){
			
	}
	skill_end_basic()
}

function skill_rush(){
	 set_prestage_anim(100,0,50,0,Mosquito_skill,Mosquito_idle);
	 state_machine = "DIRECT";
	 unstopable = true;
	 obj_speed = global.enemy_stats[myid].spd*1.3;
	 force_range = true;
	 BATTLE_ATACK = BATTLE_BASIC*2;
	 if damage_stage(){
		do_damage(BATTLE_ATACK);
		force_range = false;
		BATTLE_ATACK = BATTLE_BASIC;
		end_damage_stage();				
	}
	 if end_stage(){
		
		state_machine = "ON_RANGE"
		unstopable = false;
		obj_speed = random_range(global.enemy_stats[myid].spd/2, global.enemy_stats[myid].spd);
	}
	 skill_end_basic()
}

function skill_pre_rush(){
	set_anim(50,0,150,0)
	if damage_stage(){
		end_damage_stage();
	}
	if end_stage() {
		skill_rush();		
	}
	
}
	
function skill_run_on_direction(){
	set_anim(50,100,150,0)
	if check_stage(0)
	{
		skillvars[0] = global.player.x;
		skillvars[1] = global.player.y;
	}
	if check_stage(2)
	{
		target_x = skillvars[0];
		target_y = skillvars[1];
	}
}
	
function attack_frog(){
	lock_movement(0);
	lock_movement(4);
	var anim = Frog_Attacking;
	var val = sprite_get_speed(anim) * (sprite_get_number(anim)-1);
	set_prestage_anim(val,0,15,0,anim,spr_index);
	if damage_stage(){
		create_damage(get_player, 1);
		end_damage_stage();
	}
	skill_end_basic()
	
}
	
function skill_stop(){
	lock_direction = true;
	set_prestage(1,irandom_range(100,250),0,0);
	force_pacify = true;
	lock_movement(0);
	lock_movement(1);
	lock_movement(2);
	lock_movement(3);
	if check_stage(0){
		tool_waiting();
	}
	skill_end_basic();
}
	
function skill_super_jump(){
	set_prestage_anim_ext(0,520,20,1,Frog_Idle,Frog_Idle, sShadow, sShadow);
	wait_for_anim_ext(Frog_Idle, 1);
	lock_movement(0);
	lock_movement(1);
	lock_movement(2);
	lock_movement(3);
	unlock_movement(4);
	
	if check_stage(0)
	{
		tool_warning();
		image_index = 0;
		skillvars[0] = global.player.x;
		skillvars[1] = global.player.y;
	}
	if start_stage(){
		BATTLE_RANGE = BATTLE_MAX_RANGE*3;
		deactivate_range = true;
		force_pacify = true;	
	}
	if damage_stage(){
		x = skillvars[0];
		y = skillvars[1];
	}
	if check_stage(4)
	{
		if !instance_exists(oFX_Landing) instance_create_depth(x,y,depth,oFX_Landing);
		if on_attack_range create_damage(get_player);
	}
	skill_end_basic()
}
	
function skill_moth_poison(){
	lock_direction = true;
	lock_movement(0);
	lock_movement(1);
	lock_movement(2);
	set_prestage_anim_ext(0,60,15,1,Butterfly_Attacking,Butterfly_Attacking,Butterfly_Attacking,Butterfly_Attacking);
	force_stop = true;
	if check_stage(0){
		tool_warning();
	}
	if check_stage(2){
		if !instance_exists(oFXToxic) instance_create_depth(x,y,depth,oFXToxic);	
	}
	skill_end_basic()
}
	
function skill_moth_spit(){
	lock_direction = true;
	set_prestage_anim_ext(0,60,30,1,Butterfly_Idle,Butterfly_Attacking,Butterfly_Idle,Butterfly_Idle);
	var localbol = false
	lock_movement(0);
	lock_movement(1);
	lock_movement(2);
	lock_movement(3);
	if check_stage(0){
		tool_warning();
	}
	
	if check_stage(2) and localbol == false
	{
		var obj2 = global.player;
		var dir = point_direction(x, y-20, obj2.x, obj2.y);
		var instspit = instance_create_depth(x,y-20,depth,oFX_MothSpit);
		instspit.image_angle = dir;
		instspit.magic = global.enemy_stats[myid].magic;
		localbol = true;
	}
	skill_end_basic();
}

function tool_warning(){
	var _inst = instance_create_depth(x,y-sprite_height,depth-1,balloonWarning)	
	_inst.destroy = true
	_inst.super = id;
	image_index = 0;
}

function tool_waiting(){
	var _inst = instance_create_depth(x,y-sprite_height,depth-1,balloonWaiting)	
	_inst.destroy = true
	_inst.super = id;
	image_index = 0;
}

function tool_balloon(spr){
	var _inst = instance_create_depth(x,y-sprite_height,depth-1,balloonObject)	
	_inst.destroy = true
	_inst.super = id;
	_inst.sprite_index = spr
	image_index = 0;
}