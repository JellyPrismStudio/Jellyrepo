/// @description Insert description here
//if live_call() return live_result;



if keyboard_check_pressed(vk_f11){
	global.config.fullscreen = !global.config.fullscreen;
	if !global.config.fullscreen
	    {
	        window_set_fullscreen(false);
	    }
	    else
	    {
	        window_set_fullscreen(true);
	}
}



function window_management(){
	cursor_sprite = sprite_cursorMove2;
	if window_get_fullscreen() distancia_maxima = 110
	else distancia_maxima = 55;

	// Obtenha a largura e altura da janela do jogo
	
	largura_janela = window_get_width();
	altura_janela =  window_get_height();
	
	mousex = window_mouse_get_x();
	mousey = window_mouse_get_y();
	
	// Verifique se o mouse está a menos de distancia_maxima pixels da borda esquerda
	if (mousex < distancia_maxima) {
	    lerpx =	lerp(lerpx, -padding, lerpspeed);
		mouse_priority = true;
	}
	// Verifique se o mouse está a menos de distancia_maxima pixels da borda direita
	else if (mousex > largura_janela - distancia_maxima) {
	    lerpx =	lerp(lerpx, padding, lerpspeed);
		mouse_priority = true;
	}
	else 
	{
		lerpx =	lerp(lerpx, 0, lerpspeed/3);
		if lerpx < 3 mouse_priority = false;
	}
	lerpx = clamp(lerpx, -padding, padding);
	
	// Verifique se o mouse está a menos de distancia_maxima pixels da borda superior
	if (mousey < distancia_maxima/2) {
	   lerpy =	lerp(lerpy, -padding, lerpspeed);
	   mouse_priority = true;
	}
	// Verifique se o mouse está a menos de distancia_maxima pixels da borda inferior
	else if (mousey > altura_janela - distancia_maxima/2) {
	    lerpy =	lerp(lerpy, padding, lerpspeed);
		mouse_priority = true;
	}	
	
	else
	{
		lerpy =	lerp(lerpy, 0, lerpspeed/3);
		if lerpy < 3 mouse_priority = false;
	}
}
	
function window_reset(){
	lerpx =	lerp(lerpx, 0, lerpspeed/2);
	if lerpx < 3 mouse_priority = false;
	
	lerpy =	lerp(lerpy, 0, lerpspeed/2);
	if lerpy < 3 mouse_priority = false;
	
}

function run_camera_lerp(){
		#region keyboard
		if _WS and _AD _velmult = 0.5
		else _velmult = 1	
		
		var _local_lerp_mult = 2;
		var _local_lerp_div = 4 / _velmult;
		
		
		
		if !mouse_priority and global.config.dynamiccamera{
			
			
			
			if keyboard_check(vk_up) or keyboard_check(ord("W")){
				lerpy =	lerp(lerpy, -(padding*_local_lerp_mult)/1.5, lerpspeed/_local_lerp_div);
				_WS = true;
				//lerpy -= lerpspeed;
			}
			else if keyboard_check(vk_down) or keyboard_check(ord("S")){
				lerpy =	lerp(lerpy, (padding*_local_lerp_mult)/1.5, lerpspeed/_local_lerp_div);
				_WS = true;
				//lerpy += lerpspeed;
			}
			else {
				lerpy =	lerp(lerpy, 0, lerpspeed*0.1);
				_WS = false;
			}
			lerpy = clamp(lerpy, -padding*_local_lerp_mult, padding*_local_lerp_mult);
		
		
		
		
			if keyboard_check(vk_left) or keyboard_check(ord("A")){
				lerpx =	lerp(lerpx, -padding*_local_lerp_mult, lerpspeed/_local_lerp_div);
				_AD = true;
				//lerpx -= lerpspeed;
			}
			else if keyboard_check(vk_right) or keyboard_check(ord("D")){
				lerpx =	lerp(lerpx, padding*_local_lerp_mult, lerpspeed/_local_lerp_div);
				_AD = true;
				//lerpx += lerpspeed;
			}
			else {
				lerpx =	lerp(lerpx, 0, lerpspeed*0.1);
				_AD = false;
			}
			lerpx = clamp(lerpx, -padding*_local_lerp_mult, padding*_local_lerp_mult);
			
			
			
		}
		#endregion
		
		#region mouse
			if mouse_check_button_pressed(mb_right) and to_gamepad_pressed(vk_control){
				if !global.onmenu and !global.on_message {
					if instance_exists(_CAMERA_AUX) instance_destroy(_CAMERA_AUX);
					//global.intern.enemyover[camera] = noone;
					target = global.player;
					customtarget = false;
				}
				mb_delay = 50;	
			}
			if mouse_check_button(mb_right) and to_gamepad_pressed(vk_control) window_management()
			if mb_delay > 0 mb_delay--;
			else {
				window_reset()
			}
		#endregion
}

function auto_camera(){
	if global.config.autocamera
	{
		var focusenemy = instance_nearest(global.player.x,global.player.y,oENM_Main);
		if point_direction(global.player.x,global.player.y,focusenemy.x,focusenemy.y) <  150
		{
			customtarget = true;
		    targetobj = focusenemy.id;
			global.intern.enemyover[camera] = focusenemy.id;
		}
	}	
}

function get_objects(){
	with (oENM_Main)
	{
		remove_duplicates(global.intern.enemyover)
		if 	is_on_view
		{
			if !find_value_on_array_bool(global.intern.enemyover, id)
			{
				array_push(global.intern.enemyover, id)
			}
		}
		else
		{
			if find_value_on_array_bool(global.intern.enemyover, id)
			{
				array_delete(global.intern.enemyover,find_value_on_array(global.intern.enemyover, id),1)
			}	
		}
	}
	
	for(i=0;i<array_length(global.intern.enemyover) - 1;i++)
	{
		if !instance_exists(global.intern.enemyover[i])
		{
			array_delete(global.intern.enemyover,i,1)
			if camera > 0 camera--;
		}
	}
}

function run_mouse_wheel(){
	if mouse_wheel_down() and mouse_cooldown <= 0{
		if camera < (array_length(global.intern.enemyover) - 1)
		{
			camera++;
		}
		else
		{
			camera = 0;	
		}
		mouse_cooldown = 10;
	}
	else if mouse_wheel_up() and mouse_cooldown <= 0
	{
		//customtarget = true;
		//target = global.intern.enemyover[camera];
		if camera > 0
		{
			camera--;
		}
		else
		{
			camera = array_length(global.intern.enemyover) - 1;
		}
		mouse_cooldown = 10;
	}
}

function find_camera_aux(){
	if instance_exists(_CAMERA_AUX) {
			var inst2 = instance_find(_CAMERA_AUX, 0)
			inst2.super = targetobj;
		}
		else 
		{
			inst2 = instance_create_depth(x,y,depth,_CAMERA_AUX);
			inst2.super = targetobj;
		}	
	
}

//////////////////////////////////////////////////////////////////// OBJECT
if mouse_cooldown > 0 mouse_cooldown--

get_objects();
run_mouse_wheel();


auto_camera()

if camera < array_length(global.intern.enemyover)
{
	
	if instance_exists(global.intern.enemyover[camera]) and customtarget and !instance_exists(oCameraAim) {
		instance_create_depth(global.intern.enemyover[camera].x,global.intern.enemyover[camera].y,global.intern.depths.msg,oCameraAim)
	}
	else
	{
		
	}

}


if !customtarget {
	//camera = 0;
	target = global.player;
	if !global.onmenu run_camera_lerp();
	global.intern.enemyover[camera] = noone;
}
else {
	lerpx = 0;
	lerpy = 0;
	if instance_exists(targetobj) or targetobj != global.player 
	{
		target = targetobj;
	}
	else {
		target = global.player;
		customtarget = false;
	}
	if mouse_check_button(mb_right) and to_gamepad_pressed(vk_control) {
		run_camera_lerp();
	}
}

if (mouse_check_button_released(mb_right) and to_gamepad_pressed(vk_control)) and !global.on_message and !global.onmenu 
{
	var margem = 50;
	var int_procura = instance_position_margin(mouse_x, mouse_y, oENM_Main, margem)
	
	//////////// EDITAR AQUI \/ \/ \/ \/
	
	if int_procura == global.intern.enemyover[camera] int_procura = noone;
	
	if int_procura != noone
	{
		global.intern.enemyover[camera] = int_procura.id
	}	
	else global.intern.enemyover[camera] = noone
	global.intern.enemyover = remove_duplicates(global.intern.enemyover);
	
	////////////////////////////////////////
	
	if mb_delay > 1 and mb_delay < 70 {
	    // Verifica se o mouse está em cima do objeto
		try
		{
			var inst = global.intern.enemyover[camera];
		}
		catch (error)
		{
			var inst = noone;	
		}
	    // Se a função retornar uma instância, pega o ID dela
	    if inst != noone {//and customtarget == false{
			if instance_exists(global.intern.enemyover[camera]){
				if instance_exists(_CAMERA_AUX) {
					var inst2 = instance_find(_CAMERA_AUX, 0)
					inst2.super = inst.id;
				}
				else 
				{
					inst2 = instance_create_depth(x,y,depth,_CAMERA_AUX);
					inst2.super = inst.id;
				}
				customtarget = true;
		        targetobj = inst2.id;
			}
			else
			{
				target = global.player;
				customtarget = false;
			}
	    }
		else {
			target = global.player;
			customtarget = false;
		}
	}
	
}



if !instance_exists(target){
	if instance_exists(global.player) target = global.player	
	customtarget = false;
}
	var target_space_x = abs(x - target.x - lerpx);
	var target_space_y = abs(y - target.y - lerpy);
if !global.onmenu 
{
	entered_menu = false;
	if target_space_x > camera_w/2 or target_space_y > camera_h/2 {
		if target != noone {
			if instance_exists(target){
				if reset == true {
					x = lerp(x, target.x,cameraspeedmegarush);
					y = lerp(y, target.y,cameraspeedmegarush);
				}
				else {
					x = lerp(x, target.x + lerpx, cameraspeedmegarush);
					y = lerp(y, target.y + lerpy, cameraspeedmegarush);
				}
			}
		}	
	}
	else if target_space_x > camera_w/3 or target_space_y > camera_h/3 {
		if target != noone {
			if instance_exists(target){
				if reset == true {
					x = lerp(x, target.x,cameraspeedrush);
					y = lerp(y, target.y,cameraspeedrush);
				}
				else {
					x = lerp(x, target.x + lerpx, cameraspeedrush);
					y = lerp(y, target.y + lerpy, cameraspeedrush);
				}
			}
		}	
	}
	else {
		if target != noone {
			if instance_exists(target){
				if reset == true {
					x = lerp(x, target.x,cameraspeed);
					y = lerp(y, target.y,cameraspeed);
				}
				else {
					x = lerp(x, target.x + lerpx, cameraspeed);
					y = lerp(y, target.y + lerpy, cameraspeed);
				}
			}
		}
	}
	
	if !customtarget and to_gamepad_click(mb_left) and check_playable() <= 0
	{
		var largura_janela = window_get_width();
		var altura_janela =  window_get_height();
	
		var mousex = window_mouse_get_x();
		var mousey = window_mouse_get_y();
		if mousex > 0 and mousex < largura_janela and mousey > 0 and mousey < altura_janela
		{
			x = lerp(x, mouse_x + lerpx, cameraspeed/3);
			y = lerp(y, mouse_y + lerpy, cameraspeed/3);
		}
	}
}
else if global.onmenu or mouse_check_button(mb_middle)
	{
		if !entered_menu {
		lerpy =	0;
		lerpx =	0;
		x = target.x;
		y = target.y;
		entered_menu = true;
		}
	}
