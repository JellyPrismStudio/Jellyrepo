
function battle_create(){
	state_machine = "";
	BATTLE_CREATE = ds_list_create();
	pathing = false;
}

function battle_create_range(range)		{
	BATTLE_RANGE = range;
	ds_list_add(BATTLE_CREATE, "RANGE");
}

function battle_calculate_damage(selfid = self, enemy, player = 0){
	var initialhit = random_range(0,(   global.player_stats[player].hitrate * global.player_stats[player].multiplier[2])   ) - random_range(0,enemy.evasion/2);
	// RNG da precisão MENOS a evasão do inimigo. Se o resultado for maior que 0, acerta.
	var  atkmult = global.player_stats[player].multiplier[0];
	var critmult = global.player_stats[player].multiplier[4];

	if initialhit > 0 {
		if initialhit > enemy.evasion/3
			{
			// Se o initialhit, que foi o calculo precisão - evasão for maior que 1/3 da evasão, chance de critar.
			crit = random_range(0,100);
			if crit <= global.player_stats[player].crit var critical = 2*critmult;
			else critical = 1.5*critmult;
			}
		else critical = 1;
		critical_damage = ((global.player_stats[player].atack*atkmult)*critical);
		// Calcula o critico, sendo o ATK * Multiplicador do Crit
		
		final_damage = random_range(critical_damage - (critical_damage/4), critical_damage + (critical_damage/4));
		// Dano final: RNG: Minimo: 75% Ataque*crit mult. ; Maximo: 125% Ataque*crit mult.
		
		final_def = random_range(enemy.def - (enemy.def/2), enemy.def);
		// Defesa final: RNG: Minimo 66% Defesa ; Máximo 133% Defesa
		
		damage = (final_damage - final_def);
		// Dano final: Dano final - Defesa final
		
		if damage < 1 damage = 0;
		// Evita que o inimigo não tome dano, caso a defesa seja muito alta, logo, da o dano de 1 no inimigo.
		
		return int64(damage);
	}	
	else return 0;
}
	
function battle_buff_debuff(stats = "", value = 0, time = 0)
{
	for(i=0;i<array_length(_BATTLE_BUFF); i++)
	{
		if _BATTLE_BUFF[i][2] <= 0
		{
			_BATTLE_BUFF[i][0] = stats
			_BATTLE_BUFF[i][1] = value
			_BATTLE_BUFF[i][2] = time
			battle_add_buff(_BATTLE_BUFF[i][0], _BATTLE_BUFF[i][1])
			break
		}
		else if i == array_length(_BATTLE_BUFF)-1 and _BATTLE_BUFF[i][2] != 0
		{
			array_push(_BATTLE_BUFF, [stats, value, time])
			i = 0;
		}
		else
		{
			show_message("no")
		}
	}	
}

function battle_add_buff(buff, amount)
{	
	if buff == "HP"		hp +=		amount;
	if buff == "HP"		mhp +=		amount;
	if buff == "MSP"	msp +=		amount;
	if buff == "ATK"	atack +=	amount;
	if buff == "DEF"	def +=		amount;
	if buff == "MAG"	magic +=	amount;
	if buff == "CRI"	crit +=		amount;
	if buff == "XP"		xp +=		amount;
	if buff == "HIT"	hitrate +=	amount;
	if buff == "EVA"	evasion +=	amount;
}

function battle_remove_buff(buff, amount)
{	
	if buff == "HP"		hp -=		amount;
	if buff == "MSP"	msp -=		amount;
	if buff == "ATK"	atack -=	amount;
	if buff == "DEF"	def -=		amount;
	if buff == "MAG"	magic -=	amount;
	if buff == "CRI"	crit -=		amount;
	if buff == "XP"		xp -=		amount;
	if buff == "HIT"	hitrate -=	amount;
	if buff == "EVA"	evasion -=	amount;
}

function battle_buff_timer()
{
	for(j2=0;j2<array_length(_BATTLE_BUFF); j2++)
	{
		if _BATTLE_BUFF[j2][2] >= 1
		{
			image_blend = c_red;
			_BATTLE_BUFF[j2][2]--;
		}
		else if _BATTLE_BUFF[j2][2] == 0
		{
			image_blend = c_white;
			battle_remove_buff(_BATTLE_BUFF[j2][0], _BATTLE_BUFF[j2][1]);
			_BATTLE_BUFF[j2][2]--;
		}
	}	
}

function battle_calculate_object_damage(selfid = self, enemy){
	var initialhit = random_range(0,selfid.hitrate) - random_range(0,enemy.evasion);
	// RNG da precisão MENOS a evasão do inimigo. Se o resultado for maior que 0, acerta.
	if initialhit > 0
	{
		if initialhit > enemy.evasion/3
		{
			// Se o initialhit, que foi o calculo precisão - evasão for maior que 1/3 da evasão, chance de critar.
			crit = random_range(0,100);
			if crit <= selfid.crit var critical = 3;
			else critical = 1.5;
		}
		else critical = 1;
		critical_damage = (selfid.atack*critical);
		// Calcula o critico, sendo o ATK * Multiplicador do Crit
		
		final_damage = random_range(critical_damage - (critical_damage/4), critical_damage + (critical_damage/4));
		// Dano final: RNG: Minimo: 75% Ataque*crit mult. ; Maximo: 125% Ataque*crit mult.
		
		final_def = random_range(enemy.def - (enemy.def/3), enemy.def + (enemy.def/3));
		// Defesa final: RNG: Minimo 66% Defesa ; Máximo 133% Defesa
		
		damage = (final_damage - final_def);
		// Dano final: Dano final - Defesa final
		
		if damage < 1 damage = 0;
		// Evita que o inimigo não tome dano, caso a defesa seja muito alta, logo, da o dano de 1 no inimigo.
		
		return int64(damage);
	}	
	else return 0;
}

function battle_enemy_calculate_damage(selfid = self, enemy, player = 0, dmgmult = 1){
	var initialhit = random_range(0,hitrate) - random_range(0,global.player_stats[player].evasion); //
	if initialhit > 0{
		if initialhit > global.player_stats[player].evasion/4{//
			var crit2 = random_range(0,100);
			if crit2 <= self.crit var critical = 3;//
			else critical = 1.5;
		}
		else critical = 1;
		critical_damage = (atack*critical);//
		final_damage = random_range(critical_damage - (critical_damage/4), critical_damage + (critical_damage/4));//
		final_def = random_range(global.player_stats[player].def - (global.player_stats[player].def/3), global.player_stats[player].def + (global.player_stats[player].def/3));
		damage = (final_damage - final_def/2);
		damage = damage * dmgmult;
		if damage < 0 damage = 0;
		return int64(damage);
	}	
	else return 0;
}

function battle_deal_damage(damage, target = 0){
	var _pindex = global.party.players[target];
	damage = damage - (global.player_stats[_pindex].def)/10;
	damage = int64(damage);
	var object = global.party.playersobj[target];
	var yy = object.y - object.sprite_height;
	if damage < 0 damage = 0;
	global.player_stats[_pindex].hp -= damage;
	var dmg_inst = instance_create_depth(object.x,yy,global.intern.depths.over,_BATTLE_DMG);
	dmg_inst.dmg = damage;
	dmg_inst.super = self;
}

function battle_deal_magic_damage(damage){
	damage = damage - (global.player_stats[global.player_index].mdef)/10;
	damage = int64(damage);
	var object = global.player;
	var yy = object.y - object.sprite_height;
	if damage < 0 damage = 0;
	global.player_stats[global.player_index].hp -= damage;
	var dmg_inst = instance_create_depth(object.x,yy,global.intern.depths.over,_BATTLE_DMG);
	dmg_inst.dmg = damage;
	dmg_inst.super = self;
}
	
function battle_get_damage(dmg = 0, _alpha = 0, super){
	if live_call(dmg, _alpha, super) return live_result;
	dyy = y;
	dxx = x;
	//dyy = super.y - super.sprite_height - 2;
	
	if super == global.player draw_set_font(RulerBattle);
	else draw_set_font(DayDream_pt6);
	//if dmg <= global.player_stats[global.player_index].atack and dmg !=0 draw_text_color(x,y,string(dmg),c_orange,c_orange,c_orange,c_orange,_alpha);
	var _color = c_black;
	//else if dmg > global.player_stats[global.player_index].atack  draw_text_color(x,y,"-"+string(dmg)+"-",c_red,c_red,c_red,c_red,_alpha);
	if super = global.player {
		if dmg == 0 {
			draw_text_color(dxx,dyy,"Miss",c_gray,c_gray,c_gray,c_gray,_alpha/2);
		}
		else
		{
			draw_text_color(x-1,y,string(dmg),_color,_color,_color,_color,_alpha);
			draw_text_color(x+1,y,string(dmg),_color,_color,_color,_color,_alpha);
			draw_text_color(x,y-1,string(dmg),_color,_color,_color,_color,_alpha);
			draw_text_color(x,y+1,string(dmg),_color,_color,_color,_color,_alpha);
			draw_text_color(x,y,string(dmg),c_orange,c_orange,c_orange,c_orange,_alpha);	
		}
	}	
	else
	{
		if dmg == 0 {
			draw_text_color(dxx,dyy,"Miss",c_gray,c_gray,c_gray,c_gray,_alpha/2);
		}
		else
		{
			var  str = "";
			var str2 = "";
			draw_text_color(x-1,y,str+string(dmg)+str2,_color,_color,_color,_color,_alpha);
			draw_text_color(x+1,y,str+string(dmg)+str2,_color,_color,_color,_color,_alpha);
			draw_text_color(x,y-1,str+string(dmg)+str2,_color,_color,_color,_color,_alpha);
			draw_text_color(x,y+1,str+string(dmg)+str2,_color,_color,_color,_color,_alpha);
			draw_text_color(x,y,  str+string(dmg)+str2,c_red,c_red,c_red,c_red,_alpha);	
			
		}		
	}
}

function battle_set_stats(player,_hp,_sp,_atck,_magic,_crit){
	create_player_stats(player,_hp,_sp,_atck,_magic,_crit);
	name	= global.player_stats[player].nome;
	hp		= global.player_stats[player].hp;
	sp		= global.player_stats[player].sp;
	mhp		= global.player_stats[player].mhp;
	msp		= global.player_stats[player].msp;
	atack	= global.player_stats[player].atack;
	magic	= global.player_stats[player].magic;
	crit	= global.player_stats[player].crit;
	xp		= global.player_stats[player].xp;
	hitrate = global.player_stats[player].hitrate;
	evasion = global.player_stats[player].evasion;
	
}

function battle_simple_click(){
	return kget_radius(global.player, (global.player.AIM_RANGE + (global.player_stats[global.party.players[0]].hitrate)/4),false,true,false,self)
}

function battle_complex_click(){
	var _on_radius = kget_radius(global.player, (global.player.AIM_RANGE + (global.player_stats[global.party.players[0]].hitrate)/4),false,true,false,self)
	var _radius_direction = point_direction(global.player.x,global.player.y,mouse_x,mouse_y);
	//
	var _distance = point_distance(global.player.x,global.player.y,mouse_x,mouse_y);
	var _distance = clamp(_distance, 0, global.player.AIM_RANGE);
	var new_x = global.player.x + lengthdir_x(_distance, _radius_direction);
	var new_y = global.player.y + lengthdir_y(_distance, _radius_direction);
	//
	var _on_intersec = kget_radius_by_pos(new_x,new_y,global.player.AIM_RANGE,false,self);
	if _on_intersec {
		image_blend = c_purple;
		return true
	}
	else {
		image_blend = c_white;
		return false
	}
}

function levelup(player){
	    global.player_stats[player].level++;
	if global.player_stats[player].level % 2 == 1
	{
		global.player_stats[player].mhp += 10;
		global.player_stats[player].msp += 2;
		global.player_stats[player].atack += 1;
		global.player_stats[player].def += 1;
		global.player_stats[player].magic += 2;
	}
	else
	{
		global.player_stats[player].mhp += 10;
		global.player_stats[player].msp += 2;
		global.player_stats[player].atack += 1;
		global.player_stats[player].def += 1;
		global.player_stats[player].magic += 2;
		global.player_stats[player].crit += 1;
		global.player_stats[player].hitrate += 1;
		global.player_stats[player].evasion += 1;
	}
	global.player_stats[player].hp = global.player_stats[player].mhp
}

function damage_functions(){
	if to_gamepad_pressed(mb_left) or keyboard_check_pressed(vk_space){
			if kget_radius(global.player, (global.player.AIM_RANGE + (global.player_stats[global.party.players[0]].hitrate)/4),false,true,false,self){
			
					if global.player_stats[global.party.players[0]].style != 1 {
						if mouse_radius(self, 0, (global.player_stats[global.party.players[0]].hitrate)/2) and global.player.attack_cooldown <= 8{
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
						if global.player.attack_cooldown <= 5 {
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

	
}
	
function calculate_player_damage(){
	if to_gamepad_pressed(mb_left) or keyboard_check_pressed(vk_space){
		show_debug_message("Clicks");
			var insts = get_multiple_radius(self, (self.AIM_RANGE + (global.player_stats[global.party.players[0]].hitrate)/4),false,true,false,self);
			for(b_i=0;b_i<array_length(insts);b_i++){
				insts[b_i].image_alpha = 0.1;
			}
	}	
}
	
function create_damage(playeridx = get_player, dmgmult = 1){
	if get_player > - 1
		{
		if !instance_exists(global.party.playersobj[playeridx]) {
			var object = global.party.playersobj[playeridx]
		}
		else
		{
			var object = global.party.playersobj[0]	
		}
		var stats = global.player_stats[object.self_index];
		var dmg = battle_enemy_calculate_damage(self, self, global.party.players[playeridx], dmgmult);
		var yy = object.y - object.sprite_height;
		var dmg_inst = instance_create_depth(object.x,yy,global.intern.depths.over,_BATTLE_DMG);
		dmg_inst.super = self;
		if global.player.invulnerable != true
		{	
			dmg_inst.dmg = dmg;
			stats.hp -= dmg*dmgmult;			
		}
		else {
			dmg_inst.dmg = 0
		}
		if dmg > 0 object.damaged = true;
	}
}
	
function battle_create_popup(target, text, cure = false, super = self){
	var object = target;
	var yy = object.y - object.sprite_height;
	var dmg_inst = instance_create_depth(object.x,yy,global.intern.depths.over,_BATTLE_POPUP);
	dmg_inst.text = text;
	dmg_inst.super = super;
	if cure {
		dmg_inst._color = c_green;
	}
}
	
function get_loot(rate, loot){
	if !find_value_on_array_bool(global.menu.bestiary, enemyid){
		add_on_array(global.menu.bestiary, enemyid)
	}
	var xx = irandom_range(-30,30);
	var yy = irandom_range(-30,30);
	if rdrg == -1 rdrg = random_range(0,100);
	if rdrg <= rate instance_create_depth(x+xx,y+yy,depth+1,loot);
}
	
function battle_mouse_over(mult = 1){
	var _on_radius = kget_radius(global.player, (global.player.AIM_RANGE + (global.player_stats[global.party.players[0]].hitrate)/4),false,true,false,self)
	var _radius_direction = point_direction(global.player.x,global.player.y,mouse_x,mouse_y);
	//
	var _distance = point_distance(global.player.x,global.player.y,mouse_x,mouse_y);
	var _distance = clamp(_distance, 0, global.player.AIM_RANGE);
	var new_x = global.player.x + lengthdir_x(_distance, _radius_direction);
	var new_y = global.player.y + lengthdir_y(_distance, _radius_direction);
	//
	var _on_intersec = kget_radius_by_pos(new_x,new_y,global.player.AIM_RANGE,false,self);
	var _on_intersec_global = kget_radius_by_pos(new_x,new_y,global.player.AIM_RANGE,false,oENM_Main);
	if _on_intersec
	{
			//if _on_intersec_global global.intern.enemyover[0] = id;
			if targdraw == 0 {
				
				targdraw = instance_create_depth(x,y,depth,oTarget_Arrow);
				targdraw.name = nome;
				targdraw.super = self;
			
			}
			return true;

	}
	else {
			//if !_on_intersec_global global.intern.enemyover[0] = noone;
			//global.intern.enemyover[0] = noone;
			if variable_instance_exists(self,"targdraw"){
				instance_destroy(targdraw);
				targdraw = 0;
			}
			//image_blend = OWN_COLOR;	
		}
}
	
function battle_enemies_get_range(_mult = 1){
	if global.debug.ghosting == false {
		if kget_radius(self.id,BATTLE_RANGE*_mult,false,true,true,global.party.playersobj[0]) 
		{
			if global.player_stats[global.party.players[0]].hp > 0 return true
		}
		else if kget_radius(self.id,BATTLE_RANGE*_mult,false,true,true,global.party.playersobj[1])
		{
			if global.player_stats[global.party.players[1]].hp > 0 return true
			else return false
		}
		else return false
	}
	else return false
}

function battle_vision_range(_mult = 1){
	if global.debug.ghosting == false {
		if kget_radius(self.id,VIEW_RANGE*_mult,false,true,true,global.party.playersobj[0]) or kget_radius(self.id,VIEW_RANGE*_mult,false,true,true,global.party.playersobj[1]) or taunted
		{
			return true
		}
		else return false
	}
	else return false
}

function battle_enemies_get_range_multiple(_mult = 1){
	if global.debug.ghosting == false {
		if kget_radius(self.id,BATTLE_RANGE*_mult,false,true,true,global.party.playersobj[0]) return true
		else if kget_radius(self.id,BATTLE_RANGE*_mult,false,true,true,global.party.playersobj[1]) return true
		else return false
	}
	else return false
}

function battle_enemies_get_player(_mult = 1){
	if global.debug.ghosting == false {
		if kget_radius(self.id,BATTLE_RANGE*_mult,false,true,true,global.party.playersobj[0]) {
			
			if !kget_radius(self.id,BATTLE_RANGE*_mult,false,true,true,global.party.playersobj[1]) 
			{
				return 0	
			}
			{
				if distance_to_object(global.party.playersobj[0]) < distance_to_object(global.party.playersobj[1]) return 0
				else return 1
			}
			
		}
		else if kget_radius(self.id,BATTLE_RANGE*_mult,false,true,true,global.party.playersobj[1]) 
		{
			
			if !kget_radius(self.id,BATTLE_RANGE*_mult,false,true,true,global.party.playersobj[0]) 
			{
				return 1	
			}
			{
				if global.player_stats[global.party.players[1]].hp > 0
				{
					if distance_to_object(global.party.playersobj[0]) < distance_to_object(global.party.playersobj[1]) return 0
					else return 1
				}
				else return 0
			}
			
			
			
			
			
		}
		else return -1
	}
	else return -1
}

function battle_enemies_get_attack(_mult = 1){
	if global.debug.ghosting == false {
		if kget_radius(self.id,BATTLE_ATACK*_mult,false,true,true,global.party.playersobj[0]) return true
		else if kget_radius(self.id,BATTLE_ATACK*_mult,false,true,true,global.party.playersobj[1]) and global.player_stats[global.party.players[1]].hp > 0 return true
		else return false
	}
	else return false
}

function battle_enemies_get_attack_multiple(_mult = 1){
	if global.debug.ghosting == false {
		if kget_radius(self.id,BATTLE_ATACK*_mult,false,true,true,global.party.playersobj[0]) return true
		else if kget_radius(self.id,BATTLE_ATACK*_mult,false,true,true,global.party.playersobj[1]) return true
		else return false
	}
	else return false
}

function battle_enemies_get_attack_range(_mult = 1){
	if global.debug.ghosting == false {
		if kget_radius(self.id,BATTLE_MIN_ATACK*_mult,false,true,true,global.party.playersobj[0]) return true
		else return false
	}
	else return false
}

function battle_enemies_get_index(_mult = 1){
	// Pega o index DA PARTY
	if kget_radius(self.id,BATTLE_RANGE*_mult,false,true,true,global.party.playersobj[0]) {
			 if !kget_radius(self.id,BATTLE_RANGE*_mult,false,true,true,global.party.playersobj[1])	
			 {
				 return 0
			 }
			 else {
				 if distance_to_object(global.party.playersobj[0]) < distance_to_object(global.party.playersobj[1]) return 0
				 else return 1
			 }
		 }
	else if  kget_radius(self.id,BATTLE_RANGE*_mult,false,true,true,global.party.playersobj[1]){
			 if !kget_radius(self.id,BATTLE_RANGE*_mult,false,true,true,global.party.playersobj[0])	
			 {
				 return 1
			 }
			 else {
				 if distance_to_object(global.party.playersobj[0]) < distance_to_object(global.party.playersobj[1]) return 0
				 else return 1
			 }
		
	}
	//else if kget_radius(self.id,BATTLE_RANGE*_mult,false,true,true,global.party.playersobj[2]) return 2
	else return false	
}
	
function get_indexs(){
	PL1 = global.party.playersobj[0];
	PL2 = global.party.playersobj[1];
	PL3 = global.party.playersobj[2];
	
	P1 = object_get_name(PL1);
	P2 = object_get_name(PL2);
	P3 = object_get_name(PL3);
	
	if global.party.players[0] != -1 and instance_exists(global.party.playersobj[0]) PlID1 = asset_get_index(P1).self_index; else PlID1 = -1
	if global.party.players[1] != -1 and instance_exists(global.party.playersobj[1]) PlID2 = asset_get_index(P2).self_index; else PlID2 = -1
	if global.party.players[2] != -1 and instance_exists(global.party.playersobj[2]) PlID3 = asset_get_index(P3).self_index; else PlID3 = -1
}

function change_player(){
	if global.party.players[0] == -1 and global.party.players[1] == -1 game_restart();
	_GLOBAL_CAMERA.target = global.player;
	get_indexs();
	if global.party.players[1] != -1 {		
		global.player = asset_get_index(P2);
		global.player_index = PlID2;
		if global.party.players[2] != -1
		{	
			global.party.players = [PlID2,PlID3,PlID1];
			global.party.playersobj = [asset_get_index(P2), asset_get_index(P3), asset_get_index(P1)];
			check_if_is_locked();
		}
		else
		{
			global.party.players = [PlID2,PlID1,PlID3];
			global.party.playersobj = [asset_get_index(P2), asset_get_index(P1), asset_get_index(P3)];
			check_if_is_locked();
		}
	}
	else {		
		if global.party.players[2] != -1 {
			global.player = asset_get_index(P3);
			global.player_index = PlID3;
			global.party.players = [PlID3,PlID2,PlID2];
			global.party.playersobj = [asset_get_index(P3), asset_get_index(P1), asset_get_index(P2)];
			check_if_is_locked();
		}
	}
	
	
	
	if global.party.players[0] != 3
	{
		sdm("Trocou");
		change_audio("BGM3", -global.config.music_volume, 100);	
	}
}

function check_if_is_locked(){
	//if place_meeting(global.party.playersobj[0].x,global.party.playersobj[0].y,colisor){
			
		
	//}
}