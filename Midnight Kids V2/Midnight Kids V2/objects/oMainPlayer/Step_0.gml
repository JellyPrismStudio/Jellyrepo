if live_call() return live_result;

if attack_cooldown >= -2 attack_cooldown--
if passive_cooldown >= -2 passive_cooldown--
gplayeridx = global.player_stats[self_index]
DPS = gplayeridx.DPS - gplayeridx.evasion;
noclip = global.debug.noclip;
gplayer = global.player;
enemy_ranged = false;
depth_sort();
// Função para atualizar os inputs do teclado e joystick


function local_look_direction(_xx = gplayer.x, _yy = gplayer.y){
	if _xx < x image_xscale = -1;
	else if _xx > x image_xscale = 1;	
}

//if keyboard_check_twice(vk_alt, 500) show_message("Clickskskskskj");

// Chamada da função no evento Step ou onde for adequado
updateInputs();
	
if keyboard_check_pressed(ord("Z")) stay = !stay;
if !stay
{
if global.config.dynamicdist {
	if global.party.players[1] != -1 and (global.player_stats[global.party.players[1]].hp < global.player_stats[global.party.players[1]].mhp/2)
	{
		vr1 = 50;
		vr2 = 90;
	}
	else
	{
		vr1 = global.config.view_range_min;
		vr2 = global.config.view_range_max;
	}
}
else
{
	vr1 = global.config.view_range_min;
	vr2 = global.config.view_range_max;
}
	if keyboard_check_released(ord("W")) or keyboard_check_released(ord("A")) or keyboard_check_released(ord("S")) or keyboard_check_released(ord("D")) {
		view_range = irandom_range(vr1,vr2);
	}
}
else view_range = 99999999



if !global.onmenu and gplayeridx.stamina <  gplayeridx.staminamax {
	gplayeridx.stamina +=  gplayeridx.staminarcv;
	clamp( gplayeridx.stamina,0, gplayeridx.staminamax);
}



// Função para realizar um dash na direção desejada
// Retorna true se o dash foi bem-sucedido, false caso contrário (colisão ou impossibilidade de mover)







if global.player_index == self_index and !global.on_message  {
	//calculate_player_damage();
	if self_index == 3 and !global.onmenu and passive_cooldown < 3 and gplayeridx.hp > 0 and !global.on_build
	{
		if to_gamepad_click(mb_left) and attack_cooldown < 3
		{
			var _on_radius = kget_radius(global.player, (gplayer.AIM_RANGE + (global.player_stats[global.party.players[0]].hitrate)/4),false,true,false,self)
			var _radius_direction = point_direction(gplayer.x,gplayer.y,mouse_x,mouse_y);
			//
			var _distance = point_distance(gplayer.x,gplayer.y,mouse_x,mouse_y);
			var _distance = clamp(_distance, 0, gplayer.AIM_RANGE);
			var new_x = gplayer.x + lengthdir_x(_distance, _radius_direction);
			var new_y = gplayer.y + lengthdir_y(_distance, _radius_direction);
			var _beat = instance_create_depth(new_x,new_y,depth+1,DylanBeat);
			_beat.sx = new_x;
			_beat.sy = new_y
			passive_cooldown = DPS*1.7;
		}
	}
	if self_index == 2 and attack_cooldown < 3 and !global.onmenu and !global.on_build
	{
		if to_gamepad_click(mb_left)
		{
			instance_create_depth(x,y-25,global.intern.depths.system,oBullet1);
			attack_cooldown = DPS;
		}
	}
	if self_index == 1 and attack_cooldown < 3 and !global.onmenu and !global.on_build
	{
		if to_gamepad_pressed(mb_left)
		{
			dash_point(70);
		}
	}
	if self_index == 0 and attack_cooldown < 3 and !global.onmenu and !global.on_build
	{
		if to_gamepad_click(mb_left)
		{
			instance_create_depth(x,y,global.intern.depths.system,oBullet2);
			attack_cooldown = DPS;
		}
	}
	
	if !instance_exists(oTarget_ArrowPlayer) {
		targdraw = instance_create_depth(x,y,depth,oTarget_ArrowPlayer);
		targdraw.name = gplayeridx.nome;
		targdraw.super = self;
	}

	/// VANILLA ///
	image_alpha = 1;
	image_blend = c_white;
	if !global.onmenu {
		if key_left or key_right or key_up or key_down{
			if !global.on_message sprite_index = gplayeridx.graphic;
			else if !customspr sprite_index = gplayeridx.idlegraph;
		
		
		
		
			if key_left image_xscale = -1;
			else if key_right image_xscale = 1;
		} else if !customspr sprite_index = gplayeridx.idlegraph;
	
	
		if to_gamepad_pressed(mb_left){
		
			if attack_cooldown <= 0
			{			
				if !customspr sprite_index = gplayeridx.atkgraph;
				alarm_set(3,1);
			}
		}
	}
	else 
	{
		sprite_index = gplayeridx.atkgraph;
	}
	normal_speed = gplayeridx.spd;
	dash_speed = gplayeridx.spd + 1;
	sneak_speed = gplayeridx.spd - 1;
	oSpeed = normal_speed;
	if key_dash and !global.on_message and !global.onmenu dash(100);
	//oSpeed = kdash_and_sneak(normal_speed, dash_speed, sneak_speed);
	if !global.onmenu move_player(3, oSpeed, self, true, colisor);
	call_skill_on_map();
	if key_menu and !global.onmenu {
		if global.menuenabled == true call_menu();
	}
	if key_config and !global.onmenu {
		if global.menuenabled == true call_menu();
	}

	if global.player_stats[global.player_index].hp > 0 and damaged
	{
		if BATTLE_D>0 {
			BATTLE_D--; // A função dessa variável é só pra dar um timerzinho no blendmode, e ficar mais visivel
			image_blend = c_red;
		}
		else {
			BATTLE_D = 6;
			damaged = false;
			image_blend = c_white;
		}
	}
	else if global.player_stats[global.player_index].hp <= 0 and !global.onmenu {
		global.player_stats[global.player_index].hp = 0;
		if global.player_stats[global.party.players[1]].hp > 0	change_player();
		else {
			if global.devmode
			{
				global.player_stats[global.party.players[1]].hp = global.player_stats[global.party.players[1]].mhp
				global.player_stats[global.party.players[0]].hp = global.player_stats[global.party.players[0]].mhp
			}
			else game_restart();
			
		}
	}
	
	/// VANILLA ///
	
	
	
	if place_meeting(x,y,colisor) and !noclip{
	for(i=-10;i<10;i++){
		if !place_meeting(x + i,y,colisor) {
				x += i;
				break
			}
		else if !place_meeting(x,y + i,colisor) {
				y += i;
				break;
			}
		}
	}
	
	
	
	// DASH
	if invtime < invtimetotal {
	
	// declarando as variáveis iniciais	
	var start_color = [57, 135, 203];
	var end_color = [255, 255, 255];

	// Calcula a cor intermediária
	var fraction = clamp(invtime/invtimetotal, 0, 1); // calcula o valor intermediário entre 0 e 1
	var current_color = make_color_rgb(
	    lerp(start_color[0], end_color[0], fraction),
	    lerp(start_color[1], end_color[1], fraction),
	    lerp(start_color[2], end_color[2], fraction)
	);

	// atualizando a imagem_blend
	image_blend = current_color;
	
	invtime++;
	if invtime > invtimetotal/2 invulnerable = false;
	else invulnerable = true;
	}
	else invulnerable = false;
	
	
}
else
{
	if stay global.player.stay = true;
	else global.player.stay = false;
	if to_gamepad_click(mb_right) and !to_gamepad_pressed(vk_control)
	{
		if !position_meeting(mouse_x,mouse_y,colisor)
		{
			inputplace = true;
			pdx = mouse_x;
			pdy = mouse_y;
		}
	}
	if !instance_exists(oTarget_ArrowPlayer2) {
		targdraw2 = instance_create_depth(x,y,depth,oTarget_ArrowPlayer2);
		targdraw2.name = gplayeridx.nome;
		targdraw2.super = self.id;
	}
	if global.on_message or global.onmenu {
		 if !customspr sprite_index = gplayeridx.idlegraph;
	}
	if global.party.followersVisible {
		if global.player_index != self_index image_alpha = global.config.customize.followersOpacity;
	}
	else image_alpha = 0;
	if !global.on_message image_blend = #a39fac;
	if inputplace == false {
			if a0 == false and !kget_radius(self,view_range,true,true,false,global.party.playersobj[0]){
				local_look_direction();
				alarm_set(1,irandom_range(wd1,wd2));
				a0 = true;
			}
			else if kget_radius(self,view_range,true,true,false,global.party.playersobj[0]){
				local_look_direction();
				if variable_instance_exists(self, "path") {
					if path_exists(path) path_delete(path);		
				}
			}
		}
	else
	{	
		
		if pdx != int64(x) or pdy != int64(y)
		{
			sdm(x, pdx, y, pdy);
			if a4 == false 
			{
				local_look_direction(pdx,pdy);
				stay = true;
				alarm_set(4,irandom_range(wd1,wd2));
				a4 = true
			}				
		}
		else
		{
			//stay = true;
			if path_exists(path) path_delete(path);
			inputplace = false;
		}
		
	}
		
		
		////// ANIMAÇÃO
		if variable_instance_exists(self, "path") {
			if path_exists(path) {
				if check_if_move() and !global.on_message and !customspr sprite_index = gplayeridx.graphic;
			}
			else  if !customspr sprite_index = gplayeridx.idlegraph;
		}
		
		// COMPANION
}

if global.player_stats[global.player_index].hp > 0 and cured
	{
		if BATTLE_D>0 {
			BATTLE_D--; // A função dessa variável é só pra dar um timerzinho no blendmode, e ficar mais visivel
			image_blend = c_green;
		}
		else {
			BATTLE_D = 6;
			cured = false;
			image_blend = c_white;
		}		
	}

