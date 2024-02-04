function check_position(vtimer = 5){
	//verify_timer = vtimer;
	//range = vrange;
	if !verify_pos{
		if verify_timer <= 0{
			
			verify_x = x;
			verify_y = y;
			verify_timer = vtimer;
		}
		else verify_timer--
	}
	else{
		var xdif;
		var ydif;
		xdif = verify_x - x;
		ydif = verify_y - y;
		if xdif < 0 xdif = xdif * -1;
		if ydif < 0 ydif = ydif * -1;
		
		// ========= //
		if ydif > range and xdif < range{
			if verify_y < y {sprite_index = DirectionableIndexes[1];	last=1}//	↑
			if verify_y > y {sprite_index = DirectionableIndexes[2];	last=2}//  ↓
		}
		// ========= //
		else if xdif > range and ydif < range{
			if verify_x < x {sprite_index = DirectionableIndexes[3];	last=3}//	→
			if verify_x > x {sprite_index = DirectionableIndexes[4];	last=4}//  ←
		}
		else if xdif > range and ydif > range{
			if  verify_x > x and verify_y < y {sprite_index = DirectionableIndexes[7];	}//last=7}// →↑
			if  verify_x > x and verify_y > y {sprite_index = DirectionableIndexes[8];	}//last=8}// →↓
			if  verify_x < x and verify_y > y {sprite_index = DirectionableIndexes[6];	}//last=6}// ←↓
			if  verify_x < x and verify_y < y {sprite_index = DirectionableIndexes[5];	}//last=5}// ←↑
		}
		else {
			if verify_y == y and verify_x == x {
				if last == 4 or last == 2 or last == 6 or last == 5{
					sprite_index = DirectionableIndexes[0];
				}
				else if last == 1 or last == 3 or last == 7 or last == 8 {
					sprite_index = DirectionableIndexes[9];
				}
				else sprite_index = DirectionableIndexes[0];
			}
		}
	}
	verify_pos = !verify_pos
}

function check_position_axis(vtimer = 5){
	//verify_timer = vtimer;
	//range = vrange;
	if !verify_pos{
		if verify_timer <= 0{
			
			verify_x = x;
			verify_y = y;
			verify_timer = vtimer;
		}
		else verify_timer--
	}
	else{
		var xdif;
		var ydif;
		xdif = verify_x - x;
		ydif = verify_y - y;
		if xdif < 0 xdif = xdif * -1;
		if ydif < 0 ydif = ydif * -1;
		
		// ========= //
		if ydif > range and xdif < range{
			sprite_index = my_spr;
		}
		// ========= //
		else if xdif > range and ydif < range{
			sprite_index = my_spr;
			if verify_x < x {image_xscale = 1	last=3}//	→
			if verify_x > x {image_xscale = -1	last=4}//  ←
		}
		else if xdif > range and ydif > range{
			sprite_index = my_spr;
			if  verify_x > x and verify_y < y {image_xscale = -1;	}//last=7}// →↑
			if  verify_x > x and verify_y > y {image_xscale = -1;	}//last=8}// →↓
			if  verify_x < x and verify_y > y {image_xscale = 1;	}//last=6}// ←↓
			if  verify_x < x and verify_y < y {image_xscale = 1;	}//last=5}// ←↑
		}
		else {
			if verify_y == y and verify_x == x {
				if last == 4 or last == 2 or last == 6 or last == 5{
					if !spr_aux sprite_index = idleGraph;
				}
				else if last == 1 or last == 3 or last == 7 or last == 8 {
					if !spr_aux sprite_index = idleGraph;
					image_xscale = -1;
				}
				else {
					if !spr_aux sprite_index = idleGraph;
					image_xscale = 1;
				}
			}
		}
	}
	verify_pos = !verify_pos
}
	
function check_playable()
{
	var ret = 0;
	if global.on_popup ret = -1
	
	if global.on_build ret = 1
	if global.on_message ret = 2
	if global.onmenu ret = 5
	return ret
	
}
	
function direction_create(vx,vy,vtimer,vpos,vrange){
	//verify_timer = vtimer;
	//range = vrange;
	verify_x = vx;
	verify_y = vy;
	verify_timer = vtimer;
	verify_pos = vpos;
	range = vrange;
	
}
	
function on_trigger(object, collider1, collider2 = collider1, collider3 = collider1, collider4 = collider1){
	//show_debug_message(object);
	
	
	isTrigger = (
		place_meeting(object.x,object.y,collider1) or 
		place_meeting(object.x,object.y,collider2) or	
		place_meeting(object.x,object.y,collider3) or 
		place_meeting(object.x,object.y,collider4)
	)
	
	if isTrigger {		
		cutscene_end_action();
	}
}

function on_trigger_priority(object, collider1, collider2 = collider1, collider3 = collider1, collider4 = collider1){
	//show_debug_message(object);
	
	
	isTrigger = (
		place_meeting(object.x,object.y,collider1) or 
		place_meeting(object.x,object.y,collider2) or	
		place_meeting(object.x,object.y,collider3) or 
		place_meeting(object.x,object.y,collider4)
	)
	
	if isTrigger{
		//global.cutscene.priority = self.id;
		cutscene_end_action();
	}
}
	
function blend_behind(_min = 0.5, padding = global.config.bigobjectspadding)
{
	var xx = global.player.x;
	var yy = global.player.y;
	if instance_exists(oCaptain_Spiffy)
	{
		if ((xx > bbox_left - padding and xx < bbox_right + padding) and (yy > bbox_top - padding and yy < bbox_bottom)) {
			_alpha = lerp(image_alpha,_min,0.1);
			image_alpha = _alpha;
		}
		else if ((oCaptain_Spiffy.x > bbox_left - padding/2 and oCaptain_Spiffy.x < bbox_right + padding/2) and (oCaptain_Spiffy.y > bbox_top - padding/2 and oCaptain_Spiffy.y < bbox_bottom)) {
				_alpha = lerp(image_alpha,_min,0.1);
				image_alpha = _alpha;
		}
		else 
		{
			_alpha = lerp(image_alpha,1,0.06);
			image_alpha = _alpha;
		}
	}
	else 
	{
		if ((global.player.x > bbox_left - padding and global.player.x < bbox_right + padding) and (global.player.y > bbox_top - padding and global.player.y < bbox_bottom)) 
		{
			_alpha = lerp(image_alpha,_min,0.1);
			image_alpha = _alpha;
		}
		else 
		{
			_alpha = lerp(image_alpha,1,0.06);
			image_alpha = _alpha;
		}		
	}
}

function blend_behind_margin(x1, x2, y1, y2, _min = 0.5)
{
	if ((global.player.x > bbox_left + x1 and global.player.x < bbox_right + x2) and (global.player.y > bbox_top + y1 and global.player.y < bbox_bottom + y2)) {
	_alpha = lerp(image_alpha,_min,0.1);
	image_alpha = _alpha;
	}
	else {
		_alpha = lerp(image_alpha,1,0.04);
		image_alpha = _alpha;
	}
}

function blend_behind_object(){	
	yy = sprite_height - sprite_yoffset;
	xx = sprite_width - sprite_xoffset;
	
	yy1 = y - sprite_yoffset;
	yy2 = y + yy;
	
	xx1 = x - sprite_xoffset;
	xx2 = x + xx;
	// offset + xx = sprite_width;
	
	if (global.player.y > yy1 and global.player.y < y) and (global.player.x > xx1 and global.player.x < xx2) {
		_alpha = lerp(image_alpha,0.5,0.1);
		image_alpha = _alpha;
	}
	else {
		_alpha = lerp(image_alpha,1,0.04);
		image_alpha = _alpha;
	}
		
}
	
function pause_game(){
	instance_deactivate_object(oENM_Main);
	instance_deactivate_object(oDmgObject);
	instance_deactivate_object(Interaction_TemplateParty);
	instance_deactivate_object(skillCooldownManager);
	instance_deactivate_object(oTarget_ArrowPlayer);
}

function unpause_game(){
	instance_activate_object(oENM_Main);
	instance_activate_object(oDmgObject);
	instance_activate_object(Interaction_TemplateParty);
	instance_activate_object(skillCooldownManager);
	instance_activate_object(oTarget_ArrowPlayer);
}
	
function set_image_blend(arg){
	if arg == "pine" {
		image_blend = choose(#f5efe7, #e5edd8, #d3f1dd);	
	}
}

function get_random(arg1,arg2 = 0.0, arg3 = 1.0){
	if arg1 == "pine" {
		return random_range(arg2,arg3);
	}
}
	
function depth_sort(super = self.id, depths = 1, input = false){
	if super != self.id {
		var dist_y = super.y - self.y;
		depth = -y - dist_y;
	}
	else {
		depth = -y +1;		
	}
}
	
function array_organize(array,arg){
	for(i=0;i<array_length(array);i++){
		if array[i] == 0
		{
			for(j=i;j<array_length(array);j++){
				if array[j] != 0{
					array[i] = array[j];
					array[j] = 0;
					break;
				}				
			}			
		}		
	}	
}

function add_on_array(array, value, empty = -1, organize = true, index = noone){
	var _length = array_length(array);
	if organize {
		array_organize(array,empty);
		for (i=0;i<_length;i++){
			if array[i] == empty and i > 0{
				array_resize(array,i);	
				break;
			}
		}
	}
	_length = array_length(array);
	resize_array(array, _length+1);
	array[_length] = value;
}

function resize_array(array, value){
	if value = array_length(array) value++;
	array_resize(array,value);	
}
	
function find_code_on_array(array, name){
	// ARG = o ID do item
	for(i=0;i<array_length(array);i++){
		if array[i] != 0{
			if array[i].code == name{
			return i;
			//if unique break;
			}		
		}
	}	
}

function find_on_inventory(name){
	// ARG = o ID do item
	for(i=0;i<array_length(global.inventory[i]);i++){
		if global.inventory[i] != 0{
			if global.inventory[i].code == name{
			return i;
			//if unique break;
			}		
		}
	}	
}

function find_id_on_inventory(_id){
	// ARG = o ID do item
	for(i=0;i<array_length(global.inventory[i]);i++){
		if global.inventory[i] != 0{
			if global.inventory[i].itemid == _id{
			return i;
			break;
			//if unique break;
			}		
		}
	}	
}

function count_on_array(array, value){
	var count = 0;
	for(i=0;i<array_length(array);i++){
		if array[i] != 0{
			if array[i] == value{
			count++;
			//if unique break;
			}		
		}
	}
	return count;
}

function find_value_on_array(array, name){
	// ARG = o ID do item
	var found = -1
	for(i=0;i<array_length(array);i++){
		if string(array[i]) == string(name){
			return i;
			//found = i;
		}
	}
	//return found
}
	
function find_value_on_array_2d(array2D, searchValue, targetVector) {
    var vectorIndex = 0;
    if (targetVector == 2) {
        vectorIndex = 1;
    }
    
	var val = -1;
    var arrayLength = array_length(array2D);
    for (var i = 0; i < arrayLength; i++) {
        if (array2D[i, vectorIndex] == searchValue) {
            val = i;
        }
    }
    
    return val;
}

function find_value_on_array_bool(array, name){
	// ARG = o ID do item
	check = false
	for(i=0;i<array_length(array);i++){
		if array[i] == name{	
			check = true;
		}
	}
	return check;
}

function on_view(renderoffscreen = false){
	if !global.config.GPU.renderoffscreen and renderoffscreen == false{
		var view_x1 = camera_get_view_x(view_camera[0]) - global.camera.padding;
		var view_y1 = camera_get_view_y(view_camera[0]) - global.camera.padding;
		var view_x2 = camera_get_view_x(view_camera[0]) + global.config.camera_width/2 + global.camera.padding;
		var view_y2 = camera_get_view_y(view_camera[0]) + global.config.camera_height/2 + global.camera.padding;
		if x > view_x1 and x < view_x2 and y > view_y1 and y < view_y2 return true
		else return false
	} else return true
}
	
function on_view_margin(margin){
	var view_x1 = camera_get_view_x(view_camera[0]) - margin;
	var view_y1 = camera_get_view_y(view_camera[0]) - margin;
	var view_x2 = camera_get_view_x(view_camera[0]) + global.config.camera_width/2 + margin;
	var view_y2 = camera_get_view_y(view_camera[0]) + global.config.camera_height/2 + margin;
	if x > view_x1 and x < view_x2 and y > view_y1 and y < view_y2 return true
	else return false
}

function find_string_on_array(array, name){
	// ARG = o ID do item
	var index = -4;
	for(i=0;i<array_length(array);i++){
		if string(array[i]) == string(name){	
			index = i;
		}
	}
	return index;
}

function separate_value_on_array(array, array_sep, name){
	// ARG = o ID do item
	for(i=0;i<array_length(array);i++){
		if array[i] == name{	
			add_on_array(array_sep,i);
			return i;
		}
	}	
}

function exists_on_array(array, value){
	var exists = false;
	for(i=0;i<array_length(array);i++){
		if array[i] == value{
			exists = true;
		}
	}
	return exists;
}

function find_on_inv(array, arg, unique = true){
	// ARG = o ID do item
	/*
		O que da para fazer é ao invés de armazenarmos o global.item.NOME_DO_ITEM, armazenar um código (que é o code do item).
	
	*/
	arg = 0;
	for(i=0;i<array_length(array);i++){
		if array[i].code == arg{
			return i;
			//if unique break;
		}	
	}	
}
	
function add_item_to_inv(item, qtd, code){
	if instance_exists(self) {
		//var find = find_code_on_array(global.inventory,item,code);
		var find = find_code_on_array(global.inventory, code);
		// O item é = global.itens.COIN
		if find == undefined
		{
			var zero = find_code_on_array(global.inventory,false);
			if zero != undefined{
				global.inventory[zero] = item;
				global.inventoryunit[zero] = qtd;
			}
			else{
				var length = array_length(global.inventory);
				array_resize(global.inventory,length);
				array_resize(global.inventoryunit,length);
				length = array_length(global.inventory);
				global.inventory[length] = item;
				global.inventoryunit[length] = qtd;
			}
		}else {	
			global.inventory[find] = item;
			global.inventoryunit[find] += qtd;		
		}
	}
}

function set_path(pathid = 1)
{
	validate_variable("reach_x");
	validate_variable("reach_y");
	validate_variable("reach_vel");
	validate_variable("state_machine");
	if state_machine == "SCENE_PATH"
	{
		path = path_add();
		mp_grid_path(GridSetup.grid, path, x,y, reach_x, reach_y, 1);
		path_start(path, reach_vel, path_action_stop, true);
		pathing = false;
	}
	alarm_set(pathid,5)
}

function remove_from_inv(item, qtd, code, ignore = false)
{
		//var find = find_code_on_array(global.inventory,item,code);
		var find = find_code_on_array(global.inventory, code);
		// O item é = global.itens.COIN
		if find == undefined
		{
			//
		}else {	
			if global.inventory[find].sellable {
				global.inventory[find] = item;
				global.inventoryunit[find] -= qtd;
			}
			
			if global.inventoryunit[find] <= 0
			{				
				array_delete(global.inventory, find, 1)
				array_delete(global.inventoryunit, find, 1)
			}
		}
}

function add_item_to_inv2(item, qtd, code){
	if instance_exists(self) {
		//var find = find_code_on_array(global.inventory,item,code);
		var find = find_value_on_array_2d(global.inv, code, 0)
		// O item é = global.itens.COIN
		if find == -1
		{
			
			array_push(l);
		}
		else {	
			global.inventory[find] = item;
			global.inventoryunit[find] += qtd;		
		}
	}
}

function global_add_item(item, qtd, code){
}

function add_equip_to_inv(equip){
	//var find = find_code_on_array(global.inventory,item,code);
	var find = undefined;
	// O item é = global.itens.COIN
	if find == undefined{
		// Não tem o item no inventário
		//var zero = find_code_on_array(global.inventory,0,false);
		var zero = undefined;
		if zero != undefined{
			global.inventory[zero] = equip;
			global.inventoryunit[zero] = 1;
		}
		else{
			var length = array_length(global.inventory);
			array_resize(global.inventory,length);
			array_resize(global.inventoryunit,length);
			length = array_length(global.inventory);
			global.inventory[length] = equip;
			global.inventoryunit[length] = 1;
		}
	}else {	
		global.inventory[find] = equip;
		global.inventoryunit[find] += 1;		
	}
}
	
function play_audio(variable,_sound,_priority,_loop,_gain,_offset = 0){
	clamp(_gain,0,100);
	clamp(_gain,0,100);
	if variable == "BGM1"
	{
		if string(global.sounds.BGM1) != string(_sound)
		{
			audio_stop_sound(global.sounds.BGM1);
			global.sounds.BGM1 = (_sound);
			audio_play_sound(_sound,_priority,_loop,_gain/100,_offset);	
		}		
		change_audio("BGM1")
	}
	else if variable == "BGM3"
	{
		if string(global.sounds.BGM3) != string(_sound)
		{
			audio_stop_sound(global.sounds.BGM3);
			global.sounds.BGM3 = (_sound);
			audio_play_sound(_sound,_priority,_loop,_gain/100,_offset);	
		}		
		change_audio("BGM3")		
	}
	else if variable=="SFX"{
		audio_play_sound(_sound,_priority,_loop,_gain/100,_offset);		
	}
}

function change_audio(audio, vol = 1, time = 1)
{
	clamp(global.config.music_volume,0,100);
	clamp(global.config.sound_volume,0,100);
	if audio == "BGM1" or audio == "ALL"
	{
		if global.sounds.BGM1 != noone
		{
			audio_sound_gain(global.sounds.BGM1, (global.config.music_volume/100), time);
		}
	}
	 if audio == "BGM2" or audio == "ALL"
	{
		if global.sounds.BGM2 != noone
		{
			audio_sound_gain(global.sounds.BGM2, (global.config.music_volume/100), time);
		}
	}
	if audio == "BGM3" or audio == "ALL"
	{
		if global.sounds.BGM3 != noone
		{
			audio_sound_gain((global.sounds.BGM3), (global.config.music_volume/100), time);
		}
	}
	
	if audio == "SFX" or audio == "ALL"
	{
		if global.sounds.SFX0 != noone{
			audio_sound_gain((global.sounds.SFX0), (global.config.music_volume/100), time);
		}
	}
}

function get_icon_index(variable)
{
	if !is_int64(variable)
	{
		if sprite_exists(variable)
		{
			return variable
		}
	}
	else
	{
		return 
	}
}

function check_if_move(x1 = x, localtimer = 1){
	if	!variable_instance_exists(self, "_locaLX") variable_instance_set(self,"_locaLX", x);
	if  !variable_instance_exists(self, "_locaLY") variable_instance_set(self,"_locaLY", y);
	
	if x != _locaLX or y != _locaLY return true
	else return false
	
	_locaLX = x;
	_locaLY = y;
}
	
function look_to_direction(invert = 1){
	if invert == true invert = -1
	if invert == false invert = 1
	///@parm
	if x > global.player.x image_xscale = 1*invert
	else image_xscale = -1*invert
}
	
function set_blend(arg){
	gpu_set_blendmode(arg);
	draw_self();
	gpu_set_blendmode(bm_normal);	
}
	
function config_bools(arg){
	if arg == "0" {
		global.config.GPU.lightFX = !global.config.GPU.lightFX;
		instance_activate_object(obj_light_torch);
		instance_activate_object(obj_uls_light);	
		instance_activate_object(obj_light_lamp);
	}
	
}

function in_viewport(inst)
{
	var bol = false;
	if instance_exists(inst)
	{
		
		var padding = 100;
		var inst_left = inst.x;
		var inst_right = inst.x;
		var inst_bottom = inst.y;
		var inst_top = inst.y;
		/*
	    var inst_left = inst.x - inst.sprite_width/2;
	    var inst_right = inst.x + inst.sprite_width/2;
	    var inst_top = inst.y - inst.sprite_height/2;
	    var inst_bottom = inst.y + inst.sprite_height/2;
		*/
	
    
	    var view_left = camera_get_view_x(0) - padding;
	    var view_right = view_left + camera_get_view_width(0) + padding;
	    var view_top = camera_get_view_y(0) - padding;
	    var view_bottom = view_top + camera_get_view_height(0) + padding;
		
		var onscreen = room_to_gui_dimension(inst.x, inst.y, view_camera[0], view_right, view_bottom, 0)
    
		/*
	    if (inst_right < view_left || inst_left > view_right || inst_bottom < view_top || inst_top > view_bottom)
	    {
	        bol = true;
	    }
	    else
	    {
	        bol = false;
	    }
		*/
		
		if (onscreen.x > view_left and onscreen.x < view_right and onscreen.y > view_top and onscreen.y < view_bottom)
	    {
	        bol = true;
	    }
	    else
	    {
	        bol = false;
	    }
	}
	return bol;
}

function run_once(argumento){
    if (!variable_instance_exists(self, "_runonce")) {
        variable_instance_set(self, "_runonce", []);
    }
    if (find_string_on_array(_runonce, argumento) != -4) {
        return false;
    }
    array_push(_runonce, argumento);
    return true;
}

function run_once_timed(argumento, timer){
    if (!variable_instance_exists(self, "_runonce")) {
        variable_instance_set(self, "_runonce", []);
    }
	if (!variable_instance_exists(self, "_runoncetimer")){
		variable_instance_set(self, "_runoncetimer", []);
	}
    if (find_string_on_array(_runonce, argumento) != -4) {
		if array_length(_runoncetimer) < array_length(_runonce) {
			array_resize(_runoncetimer, array_length(_runonce));
			_runoncetimer[find_string_on_array(_runonce, argumento)] = timer;
		}
		else _runoncetimer[find_string_on_array(_runonce, argumento)] -= 1;
		if _runoncetimer[find_string_on_array(_runonce, argumento)] > 0 return false;
		else remove_from_runonce_timer(argumento)
    }
	array_push(_runonce, argumento);
    return true;
}

function remove_from_runonce(argumento) {
    if (variable_instance_exists(self, "_runonce")) {
        var _runonce = variable_instance_get(self, "_runonce");
        var index = find_string_on_array(_runonce, argumento);
        if (index != -4) {
            array_delete(_runonce, index, 1);
            variable_instance_set(self, "_runonce", _runonce);
            return true;
        }
    }
    return false;
}

function remove_from_runonce_timer(argumento) {
    if (variable_instance_exists(self, "_runonce")) {
        var _runonce = variable_instance_get(self, "_runonce");
		var _runoncetimer = variable_instance_get(self, "_runoncetimer");
        var index = find_string_on_array(_runonce, argumento);
        if (index != -4) {
            array_delete(_runonce, index, 1);
			array_delete(_runoncetimer, index, 1);
            variable_instance_set(self, "_runonce", _runonce);
			variable_instance_set(self, "_runoncetimer", _runoncetimer);
            return true;
        }
    }
    return false;
}

function change_graphic(sprite){
	sprite_index = sprite;
	image_index = 0;
}

function drawAndResizeSprite(sprite, xx, yy, desiredWidth, desiredHeight) {
    var spriteWidth = sprite_get_width(sprite);
    var spriteHeight = sprite_get_height(sprite);
    
    var scaleX = desiredWidth / spriteWidth + 1;
    var scaleY = desiredHeight / spriteHeight + 1;
    
    draw_sprite_ext(sprite, 0, xx, yy, scaleX, scaleY, 0, c_white, 1);
}

function instance_position_margin(xx, yy, object, margin){
	var padding = int64(margin/2)
	var bol = noone
	for(i=-padding;i<padding;i++){
		
		for(j=-padding;j<padding;j++){
			
			if instance_position(xx + i, yy + j, object)
			{
				bol = instance_position(xx + i, yy + j, object);
			}
			if bol != noone
			{
				break
			}
			
		}
		
	}
	return bol
}
	
function over_image(sprite, xx, yy)
{	
	if plus_point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), xx - sprite_get_xoffset(sprite), yy - sprite_get_yoffset(sprite), xx + sprite_get_width(sprite), yy + sprite_get_height(sprite)) return true
	else return false	
}

function over_image_ext(sprite, xx, yy, width, height, ongui = true)
{	
	if ongui == true
	{
		if plus_point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), xx - sprite_get_xoffset(sprite), yy - sprite_get_yoffset(sprite), xx + sprite_get_width(sprite) + width, yy + sprite_get_height(sprite)+height) return true
		else return false	
	}
	else
	{
		if plus_point_in_rectangle(mouse_x, mouse_y, xx - sprite_get_xoffset(sprite), yy - sprite_get_yoffset(sprite), xx + sprite_get_width(sprite) + width, yy + sprite_get_height(sprite)+height) return true
		else return false	
	}
}

function run_weather(type, strength, additive, size){
	if type == "Rain" or type == 0 {
		var rain = instance_create_layer(0,0,"Setup",obj_chuva);
		rain.amount = strength;
		rain.additive = additive;
		rain.size = size;
	}
	if type == "Dust" or type == 1{
		var dust = instance_create_layer(0,0,"Setup",obj_poeira);
		dust.amount = strength;
		dust.additive = 1;
		dust.size = 0.08;		
	}
}
