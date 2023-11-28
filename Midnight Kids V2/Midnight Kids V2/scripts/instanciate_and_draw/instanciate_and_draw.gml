// INSTANCIANDO OBJETO
// 

function inst_bubble(){
	if layer_exists("Messages") draw = instance_create_layer(0,0,"Messages",_SYS_BUBBLE_SPEECH);
	else draw = instance_create_depth(0,0,global.intern.depths.over,_SYS_BUBBLE_SPEECH);
	return draw;
}

function inst_bubble_choice(){
	if layer_exists("Messages") draw = instance_create_layer(0,0,"Messages",_SYS_BUBBLE_SPEECH_CHOICE);
	else draw = instance_create_depth(0,0,global.intern.depths.over,_SYS_BUBBLE_SPEECH_CHOICE);
	return draw;
}

function inst_popup(){
	if layer_exists("Messages") draw = instance_create_layer(0,0,"Messages",_SYS_POPUP);
	else draw = instance_create_depth(0,0,-1000000,_SYS_POPUP);
	return draw;
}

function cutscene_clear_all(){
	
	
	
}

function kinstanciate_object(lobj,lx = undefined,ly = undefined, llayerdepth = undefined){
	//if llayerdepth == undefined llayerdepth = 0;
	llayerdepth ??= 0;
	//show_debug_message(llayerdepth);
	if is_string(llayerdepth)			instance_create_layer(lx, ly, llayerdepth, lobj);
	else instance_create_depth(lx, ly, llayerdepth, lobj);
}

#region Desenhar Radius

// OBTER RAIO DE COLISÃO  
// • RETURN - DRAW (OPICIONAL)
// ========================================
// Use esse método RETORNÁVEL para verificar se o player está dentro da área de colisão (raio).
// Caso o player esteja fora, o valor retorna falso. Coloque a chamada do método no espaço "DRAW" caso você queira desenhar a colisão.
// Modo de usar: IF kget_radius() == true { /// } else { /// }
// lnotme = not trigger itself


function kget_radius(lobj, lrad, lnotme = false, lpixelperfect = true, ldraw = undefined, lcol_obj1 = _SYS_OBJECT_NULL, lcol_obj2 = _SYS_OBJECT_NULL,
lcol_obj3 = _SYS_OBJECT_NULL, lcol_obj4 = _SYS_OBJECT_NULL, lcol_obj5 = _SYS_OBJECT_NULL, lcol_obj6 = _SYS_OBJECT_NULL, lcol_obj7 = _SYS_OBJECT_NULL, lcol_obj8 = _SYS_OBJECT_NULL){
	if ldraw == true {
		draw_circle_color(lobj.x,lobj.y,lrad, c_orange, c_white, true);
	}
		 if	collision_circle(lobj.x, lobj.y, lrad, lcol_obj1, lpixelperfect, lnotme)	return true;
	else if	collision_circle(lobj.x, lobj.y, lrad, lcol_obj2, lpixelperfect, lnotme)	return true;
	else if	collision_circle(lobj.x, lobj.y, lrad, lcol_obj3, lpixelperfect, lnotme)	return true;
	else if	collision_circle(lobj.x, lobj.y, lrad, lcol_obj4, lpixelperfect, lnotme)	return true;
	else if	collision_circle(lobj.x, lobj.y, lrad, lcol_obj5, lpixelperfect, lnotme)	return true;
	else if	collision_circle(lobj.x, lobj.y, lrad, lcol_obj6, lpixelperfect, lnotme)	return true;
	else if	collision_circle(lobj.x, lobj.y, lrad, lcol_obj7, lpixelperfect, lnotme)	return true;
	else if	collision_circle(lobj.x, lobj.y, lrad, lcol_obj8, lpixelperfect, lnotme)	return true;
		 else return false;
}

function kget_radius_by_pos(xx, yy, rad, lnotme=false, lobj1 = _SYS_OBJECT_NULL){
	if	collision_circle(xx, yy, rad, lobj1, true, lnotme)	return true;
	else return false;
}

function get_object_on_radius(lobj, lrad, lnotme = false, lpixelperfect = true, ldraw = undefined, lcol_obj1 = _SYS_OBJECT_NULL){
	if ldraw == true {
		draw_circle_color(lobj.x,lobj.y,lrad, c_orange, c_white, true);
	}
		 if	collision_circle(lobj.x, lobj.y, lrad, lcol_obj1, lpixelperfect, lnotme)	return collision_circle(lobj.x, lobj.y, lrad, lcol_obj1, lpixelperfect, lnotme);
		 else return false;
}

function radius_onClickUnused(lobj, lrad, lnotme = false, lpixelperfect = true, ldraw = undefined, lcol_obj1 = _SYS_OBJECT_NULL, lcol_obj2 = _SYS_OBJECT_NULL,
lcol_obj3 = _SYS_OBJECT_NULL, lcol_obj4 = _SYS_OBJECT_NULL, lcol_obj5 = _SYS_OBJECT_NULL, lcol_obj6 = _SYS_OBJECT_NULL, lcol_obj7 = _SYS_OBJECT_NULL, lcol_obj8 = _SYS_OBJECT_NULL){
	if ldraw == true {
		draw_circle_color(lobj.x,lobj.y,lrad, c_orange, c_white, true);
	}
		 if	collision_circle(lobj.x, lobj.y, lrad, lcol_obj1, lpixelperfect, lnotme)	return true;
	else if	collision_circle(lobj.x, lobj.y, lrad, lcol_obj2, lpixelperfect, lnotme)	return true;
	else if	collision_circle(lobj.x, lobj.y, lrad, lcol_obj3, lpixelperfect, lnotme)	return true;
	else if	collision_circle(lobj.x, lobj.y, lrad, lcol_obj4, lpixelperfect, lnotme)	return true;
	else if	collision_circle(lobj.x, lobj.y, lrad, lcol_obj5, lpixelperfect, lnotme)	return true;
	else if	collision_circle(lobj.x, lobj.y, lrad, lcol_obj6, lpixelperfect, lnotme)	return true;
	else if	collision_circle(lobj.x, lobj.y, lrad, lcol_obj7, lpixelperfect, lnotme)	return true;
	else if	collision_circle(lobj.x, lobj.y, lrad, lcol_obj8, lpixelperfect, lnotme)	return true;
		 else return false;
}

function kreturn_object_radius(lobj, lrad, lnotme = false, lpixelperfect = true, ldraw = undefined, lcol_obj1 = _SYS_OBJECT_NULL, lcol_obj2 = _SYS_OBJECT_NULL,
lcol_obj3 = _SYS_OBJECT_NULL, lcol_obj4 = _SYS_OBJECT_NULL, lcol_obj5 = _SYS_OBJECT_NULL, lcol_obj6 = _SYS_OBJECT_NULL, lcol_obj7 = _SYS_OBJECT_NULL, lcol_obj8 = _SYS_OBJECT_NULL){
	if ldraw == true {
		draw_circle_color(lobj.x,lobj.y,lrad, c_orange, c_white, true);
	}
		 if	collision_circle(lobj.x, lobj.y, lrad, lcol_obj1, lpixelperfect, lnotme)	return lcol_obj1.id;
	else if	collision_circle(lobj.x, lobj.y, lrad, lcol_obj2, lpixelperfect, lnotme)	return lcol_obj2.id;
	else if	collision_circle(lobj.x, lobj.y, lrad, lcol_obj3, lpixelperfect, lnotme)	return lcol_obj3.id;
	else if	collision_circle(lobj.x, lobj.y, lrad, lcol_obj4, lpixelperfect, lnotme)	return lcol_obj4.id;
	else if	collision_circle(lobj.x, lobj.y, lrad, lcol_obj5, lpixelperfect, lnotme)	return lcol_obj5.id;
	else if	collision_circle(lobj.x, lobj.y, lrad, lcol_obj6, lpixelperfect, lnotme)	return lcol_obj6.id;
	else if	collision_circle(lobj.x, lobj.y, lrad, lcol_obj7, lpixelperfect, lnotme)	return lcol_obj7.id;
	else if	collision_circle(lobj.x, lobj.y, lrad, lcol_obj8, lpixelperfect, lnotme)	return lcol_obj8.id;
		 else return false;
}

function radius_onClick(lobj, lrad, lnotme = false, lpixelperfect = true, ldraw = undefined, lcol_obj1 = _SYS_OBJECT_NULL, lcol_obj2 = _SYS_OBJECT_NULL,
lcol_obj3 = _SYS_OBJECT_NULL, lcol_obj4 = _SYS_OBJECT_NULL, lcol_obj5 = _SYS_OBJECT_NULL, lcol_obj6 = _SYS_OBJECT_NULL, lcol_obj7 = _SYS_OBJECT_NULL, lcol_obj8 = _SYS_OBJECT_NULL){
	if ldraw == true {
		draw_circle_color(lobj.x,lobj.y,lrad, c_orange, c_white, true);
	}
		 if	collision_circle(lobj.x, lobj.y, lrad, lcol_obj1, lpixelperfect, lnotme) and position_meeting(mouse_x,mouse_y,lcol_obj1)	return lcol_obj1.id;
	else if	collision_circle(lobj.x, lobj.y, lrad, lcol_obj2, lpixelperfect, lnotme) and position_meeting(mouse_x,mouse_y,lcol_obj2)	return lcol_obj2.id;
	else if	collision_circle(lobj.x, lobj.y, lrad, lcol_obj3, lpixelperfect, lnotme) and position_meeting(mouse_x,mouse_y,lcol_obj3)	return lcol_obj3.id;
	else if	collision_circle(lobj.x, lobj.y, lrad, lcol_obj4, lpixelperfect, lnotme) and position_meeting(mouse_x,mouse_y,lcol_obj4)	return lcol_obj4.id;
	else if	collision_circle(lobj.x, lobj.y, lrad, lcol_obj5, lpixelperfect, lnotme) and position_meeting(mouse_x,mouse_y,lcol_obj5)	return lcol_obj5.id;
	else if	collision_circle(lobj.x, lobj.y, lrad, lcol_obj6, lpixelperfect, lnotme) and position_meeting(mouse_x,mouse_y,lcol_obj6)	return lcol_obj6.id;
	else if	collision_circle(lobj.x, lobj.y, lrad, lcol_obj7, lpixelperfect, lnotme) and position_meeting(mouse_x,mouse_y,lcol_obj7)	return lcol_obj7.id;
	else if	collision_circle(lobj.x, lobj.y, lrad, lcol_obj8, lpixelperfect, lnotme) and position_meeting(mouse_x,mouse_y,lcol_obj8)	return lcol_obj8.id;
		 else return false;
}

function mouse_radius(lobj, lrad, add = 0){
	 
	 
	 if lrad == 0{
		ww = sprite_width + add;
		hh = sprite_height + add;
		lrad = ww;
	 }
	 if	collision_circle(mouse_x, mouse_y, lrad*1, lobj, true, false) return true
	 //draw_circle_color(lobj.x,lobj.y,lrad, c_orange, c_orange, true);
	
}

#endregion

#region Instanciate

function instanciate_choices(arg1, arg2, arg3 = "", page1 = noone, page2 = noone , page3 = noone){
	var screen = global.config.camera_width/2/2;
	var plus_y = 0;
	var window_x = camera_get_view_x(view_camera[0]) + screen;
	var window_y = camera_get_view_y(view_camera[0]);
	if arg3 == "" plus_y = 50
	if !instance_exists(choiceManager){
		var cm = instance_create_depth(0,0,global.intern.depths.msg+1,choiceManager);
			/////////////////////////////
			var opt1 = instance_create_depth(window_x,window_y + 100 + plus_y,global.intern.depths.msg,choiceBox);
			opt1.texto = arg1;
			opt1.image_xscale = 4;
			opt1.super = cm;
			opt1.myid = 1;
			
			var opt2 = instance_create_depth(window_x,window_y + 200 + plus_y,global.intern.depths.msg,choiceBox);
			opt2.texto = arg2;
			opt2.image_xscale = 4;
			opt2.super = cm;
			opt2.myid = 2;
			
			if arg3 != "" 
			{
				var opt3 = instance_create_depth(window_x,window_y + 300,global.intern.depths.msg,choiceBox);
				opt3.texto = arg3;
				opt3.image_xscale = 4;
				opt3.super = cm;
				opt3.myid = 3;
			}
			/////////////////////////////
			
		
	}
	else 
	{
		var cm = instance_find(choiceManager, 0);
		if cm.parid != -1 
		{
			_choice = cm.parid;
			if _choice == 1 and page1 != noone
			{
				self.scene_indexer = page1;	
				self.scene[self.scene_indexer] = -1;
			}
			else if _choice == 2 and page2 != noone
				{
					self.scene_indexer = page2;	
					self.scene[self.scene_indexer] = -1;
				}
				else if _choice == 3 and page3 != noone
					{
						self.scene_indexer = page3;	
						self.scene[self.scene_indexer] = -1;
					}
			
			cutscene_end_action();
		}
		
	}
}

function instanciate_var_if_null(instanceid, variable, set, except = false){
	if !variable_instance_exists(instanceid,variable){
		variable_instance_set(instanceid,variable, set);
		instanceid.variable = set;
	}	
}

function bubble_speech(object, text, name, waitforinput = true, yfix = 0, color = c_black, namecolor = #2a1c05, graphic = spr_BubbleSpeech, pointergraphic = PointerSpeech){
	//show_debug_message(object);
	// Usar o WITH para ver cada instancia
	if !instance_exists(_SYS_BUBBLE_SPEECH){		
		//show_debug_message("Criou");
		draw = inst_bubble();
		draw.instanciator = object;
		draw.object = object; draw.text = text; draw.bubblename = name;  draw.colortext = color; draw.graphic = graphic; draw.graphicpointer = pointergraphic; draw.yfix = yfix;
		draw.colorname = namecolor; draw.pointergraph = pointergraphic;
	}
	else{
		var check_object = object;
		var _exists = false;
		with(_SYS_BUBBLE_SPEECH){
			if instanciator == check_object { 
				draw = self.id;
				draw.object = object; draw.text = text; draw.bubblename = name;  draw.colortext = color; 
				draw.graphic = graphic; draw.graphicpointer = pointergraphic; draw.yfix = yfix; draw.colorname = namecolor;
				_exists = true; break}
		}
		if _exists == false {
			draw = inst_bubble();
			draw.instanciator = check_object;
			draw.object = object; draw.text = text; draw.bubblename = name;  draw.colortext = color; draw.graphic = graphic; draw.graphicpointer = pointergraphic; draw.yfix = yfix;
			draw.colorname = namecolor;
			_exists = true;
		}
	}
		
	if waitforinput and draw.message_ended{
		if keyboard_check_pressed(vk_space){
			cutscene_end_action();
			instance_destroy(draw);
		}
	}
	
}
	
function bubble_speech_choices(object, text, name, page1, page2, opt1 = "sim", opt2 = "não", horz = true){
	var waitforinput = true; 
	var yfix = 0; 
	var color = c_black; 
	var namecolor = #2a1c05; 
	var graphic = spr_BubbleSpeech; 
	var pointergraphic = PointerSpeech
	//show_debug_message(object);
	// Usar o WITH para ver cada instancia
	if !instance_exists(_SYS_BUBBLE_SPEECH_CHOICE){		
		//show_debug_message("Criou");
		draw = inst_bubble_choice();
		draw.instanciator = object; draw.super = self; draw.page1 = page1; draw.page2 = page2; draw.horz = horz;
		draw.object = object; draw.text = text; draw.bubblename = name;  draw.colortext = color; draw.graphic = graphic; draw.graphicpointer = pointergraphic; draw.yfix = yfix;
		draw.colorname = namecolor; draw.pointergraph = pointergraphic; draw.opt1 = opt1; draw.opt2 = opt2;
	}
	else{
		var check_object = object;
		var _exists = false;
		with(_SYS_BUBBLE_SPEECH_CHOICE){
			if instanciator == check_object { 
				draw = self.id; draw.super = self; draw.page1 = page1; draw.page2 = page2; draw.horz = horz;
				draw.object = object; draw.text = text; draw.bubblename = name;  draw.colortext = color; 
				draw.graphic = graphic; draw.graphicpointer = pointergraphic; draw.yfix = yfix; draw.colorname = namecolor;
				_exists = true; break}
		}
		if _exists == false {
			draw = inst_bubble();
			draw.instanciator = check_object;  draw.super = self; draw.page1 = page1; draw.page2 = page2; draw.horz = horz;
			draw.object = object; draw.text = text; draw.bubblename = name;  draw.colortext = color; draw.graphic = graphic; draw.graphicpointer = pointergraphic; draw.yfix = yfix;
			draw.colorname = namecolor;
			_exists = true;
		}
	}
		
	if waitforinput and draw.message_ended and draw.choice != 0 {
		if draw.choice == 1
		{
			self.scene_indexer = page1;	
			self.scene[self.scene_indexer] = -1;
		}
		else if draw.choice == 2
		{
			self.scene_indexer = page2;	
			self.scene[self.scene_indexer] = -1;
		}
		cutscene_end_action();
		instance_destroy(draw);
	}
}

function bubble_speech_party(object, text, name, waitforinput = true, yfix = 0, color = c_black, namecolor = #2a1c05, graphic = spr_BubbleSpeech, pointergraphic = PointerSpeech){

	if object == global.player {
		if global.player_stats[global.player.self_index].ind == 0 {
			if text.lisa != "" text = text.lisa else text = text._default
		}
		else if global.player_stats[global.player.self_index].ind == 1 {
			if text.ryan != "" text = text.ryan else text = text._default 
		}
		else if global.player_stats[global.player.self_index].ind == 2 {
			if text.hanna != "" text = text.hanna else text = text._default
		}
		else if global.player_stats[global.player.self_index].ind == 3 {
			if text.dylan != "" text = text.dylan else text = text._default
		}	
	}
	if !instance_exists(_SYS_BUBBLE_SPEECH){		
		//show_debug_message("Criou");
		draw = inst_bubble();
		draw.instanciator = object;
		draw.object = object; draw.text = text; draw.bubblename = name;  draw.colortext = color; draw.graphic = graphic; draw.graphicpointer = pointergraphic; draw.yfix = yfix;
		draw.colorname = namecolor;
	}
	else{
		var check_object = object;
		var _exists = false;
		with(_SYS_BUBBLE_SPEECH){
			if instanciator == check_object { 
				draw = self.id;
				draw.object = object; draw.text = text; draw.bubblename = name;  draw.colortext = color; 
				draw.graphic = graphic; draw.graphicpointer = pointergraphic; draw.yfix = yfix; draw.colorname = namecolor;
				_exists = true; break}
		}
		if _exists == false {
			draw = inst_bubble();
			draw.instanciator = check_object;
			draw.object = object; draw.text = text; draw.bubblename = name;  draw.colortext = color; draw.graphic = graphic; draw.graphicpointer = pointergraphic; draw.yfix = yfix;
			draw.colorname = namecolor;
			_exists = true;
		}
	}
		
	if waitforinput and draw.message_ended{
		if keyboard_check_pressed(vk_space){
			cutscene_end_action();
			instance_destroy(draw);
		}
	}
	
}

function bubble_speech_timed(time, object, text, name, waitforinput = true, yfix = 0, color = c_black, namecolor = #2a1c05, graphic = spr_BubbleSpeech, pointergraphic = PointerSpeech){
	//show_debug_message(object);
	// Usar o WITH para ver cada instancia

	if !instance_exists(_SYS_BUBBLE_SPEECH){		
		//show_debug_message("Criou");
		draw = inst_bubble();
		draw.instanciator = object;
		draw.object = object; draw.text = text; draw.bubblename = name;  draw.colortext = color; draw.graphic = graphic; draw.graphicpointer = pointergraphic; draw.yfix = yfix;
		draw.colorname = namecolor;
	}
	else{
		var check_object = object;
		var _exists = false;
		with(_SYS_BUBBLE_SPEECH){
			if instanciator == check_object { 
				draw = self.id;
				draw.object = object; draw.text = text; draw.bubblename = name;  draw.colortext = color; 
				draw.graphic = graphic; draw.graphicpointer = pointergraphic; draw.yfix = yfix;
				draw.colorname = namecolor;
				_exists = true; break}
		}
		if _exists == false {
			draw = inst_bubble();
			draw.instanciator = check_object;
			draw.object = object; draw.text = text; draw.bubblename = name;  draw.colortext = color; draw.graphic = graphic; draw.graphicpointer = pointergraphic; draw.yfix = yfix; draw.colorname = namecolor;
			_exists = true;
		}
	}
		
		
	if !instance_exists(_AUX_TIMER_SPEECH){
		timerobj = instance_create_depth(0,0,0,_AUX_TIMER_SPEECH);		
		variable_instance_set(timerobj,"varname","_BUBBLESPEECH");
		variable_instance_set(timerobj,"vartimer",time);
	}
	else
	{
		if !variable_instance_exists(_AUX_TIMER_SPEECH,"varname")
		{
			timerobj = instance_create_depth(0,0,0,_AUX_TIMER_SPEECH);		
			variable_instance_set(timerobj,"varname","_BUBBLESPEECH");
			variable_instance_set(timerobj,"vartimer",time);
		}
		else
		{
			if _AUX_TIMER_SPEECH.varname == "_BUBBLESPEECH"
			{
				var objecttimer = _AUX_TIMER_SPEECH;
				if objecttimer.vartimer > 0 {
					objecttimer.vartimer--;
					
				}
				else
				{
					cutscene_end_action();
					instance_destroy(draw);
					instance_destroy(objecttimer);
				}
			}
		}
	}	
		
}

function bubble_speech_on_trigger(object, messageobject, text, name, namecolor = c_red, yfix = 0, reset = true, resid = 0, collider1, collider2 = collider1, collider3 = collider1, collider4 = collider1){
	//show_debug_message(object);
	
	isTrigger = (
		place_meeting(object.x,object.y,collider1) or 
		place_meeting(object.x,object.y,collider2) or	
		place_meeting(object.x,object.y,collider3) or 
		place_meeting(object.x,object.y,collider4)
	)
	
	
	inst = _SYS_BUBBLE_MANAGER;
	
	
	
	if !instance_exists(_SYS_BUBBLE_SPEECH){
		//show_debug_message("Criou");
		draw = inst_bubble();
		draw.instanciator = object;
		draw.object = messageobject; draw.text = text; draw.bubblename = name;  draw.yfix = yfix;
		draw.colorname = namecolor;
	}
	else if instance_exists(_SYS_BUBBLE_SPEECH){
		var check_object = object;
		var _exists = false;
		with(_SYS_BUBBLE_SPEECH){
			if instanciator == check_object { 
				draw = self.id;
				draw.object = messageobject; draw.text = text; draw.bubblename = name;  draw.yfix = yfix;
				draw.colorname = namecolor;
				_exists = true; break}
		}
		if _exists == false {
			draw = inst_bubble();
			draw.instanciator = check_object;
			draw.object = messageobject; draw.text = text; draw.bubblename = name;  draw.yfix = yfix;
			draw.colorname = namecolor;
			_exists = true;
		}
	}
	
	if isTrigger{
		if keyboard_check_pressed(vk_space){
			cutscene_end_action();
			instance_destroy(draw);
		}
	}
	if !isTrigger and reset == true {cutscene_goto(resid); instance_destroy(draw);}
	if !isTrigger and reset == false{ instance_destroy(draw)}
}

function bubble_speech_on_radius(object, messageobject, text, name, rad = 15, yfix = 0, reset = true, resid = 0, collider1, collider2 = collider1, collider3 = collider1, collider4 = collider1){
	
	isTrigger = kget_radius(object, rad, false, true, false, collider1, collider2, collider3, collider4);
	
	inst = _SYS_BUBBLE_MANAGER;	
	
	if !instance_exists(_SYS_BUBBLE_SPEECH){
		//show_debug_message("Criou");
		draw = instance_create_depth(0,0,0,_SYS_BUBBLE_SPEECH);
		draw.instanciator = object;
		draw.object = messageobject; draw.text = text; draw.bubblename = name;  draw.yfix = yfix;
	}
	else if instance_exists(_SYS_BUBBLE_SPEECH){
		var check_object = object;
		var _exists = false;
		with(_SYS_BUBBLE_SPEECH){
			if instanciator == check_object { 
				draw = self.id;
				draw.object = messageobject; draw.text = text; draw.bubblename = name;  draw.yfix = yfix;				
				_exists = true; break}
		}
		if _exists == false {
			draw = inst_bubble();
			draw.instanciator = check_object;
			draw.object = messageobject; draw.text = text; draw.bubblename = name;  draw.yfix = yfix;
			_exists = true;
		}
	}
	
	if isTrigger{
		if keyboard_check_pressed(vk_space){
			cutscene_end_action();
			instance_destroy(draw);
		}
	}
	if !isTrigger and reset == true {cutscene_goto(resid); instance_destroy(draw);}
	if !isTrigger and reset == false{ instance_destroy(draw)}	
	
	//if !instance_exists(_SYS_BUBBLE_SPEECH){
	//	var draw = _SYS_BUBBLE_SPEECH;
	//	instance_create_depth(0,0,0,draw);
	//	draw.object = messageobject; draw.text = text; draw.bubblename = name;  draw.yfix = yfix;
	//}
	//else{
	//	var draw = _SYS_BUBBLE_SPEECH;
	//	draw.object = messageobject; draw.text = text; draw.bubblename = name;  draw.yfix = yfix;
	//}
	
	
	//if isTrigger{
	//	if keyboard_check_pressed(vk_space){
	//		cutscene_end_action();
	//		instance_destroy(draw);
	//	}
	//}
	//if !isTrigger and reset == true {cutscene_goto(resid); instance_destroy(draw)}
	//if !isTrigger and reset == false{ instance_destroy(draw)}
}

function bubble_speech_on_trigger_ext(object, text, name, yfix = 0, color = c_white, graphic = BubbleSpeech, pointergraphic = PointerSpeech, collider1, collider2 = collider1, collider3 = collider1, collider4 = collider1){
	
	isTrigger = (
		place_meeting(object.x,object.y,collider1) or 
		place_meeting(object.x,object.y,collider2) or	
		place_meeting(object.x,object.y,collider3) or 
		place_meeting(object.x,object.y,collider4)
	)
	
	if !instance_exists(_SYS_BUBBLE_SPEECH){
		var draw = _SYS_BUBBLE_SPEECH;
		instance_create_depth(0,0,0,draw);
		draw.object = object; draw.text = text; draw.bubblename = name;  draw.colortext = color; draw.graphic = graphic; draw.graphicpointer = pointergraphic; draw.yfix = yfix;
	}
	else{
		var draw = _SYS_BUBBLE_SPEECH;
		draw.object = object; draw.text = text; draw.bubblename = name; draw.colortext = color; draw.graphic = graphic; draw.graphicpointer = pointergraphic; draw.yfix = yfix;
	}
	
	if isTrigger{
		if keyboard_check_pressed(vk_space){
			cutscene_end_action();
			instance_destroy(draw);
		}
	}
}
	
function popup(object, text, name, waitforinput = true, yfix = 0, color = c_black, namecolor = #2a1c05, graphic = NullSprite, pointergraphic = NullSprite){
	//show_debug_message(object);
	// Usar o WITH para ver cada instancia
	if !instance_exists(_SYS_POPUP){		
		draw = inst_popup();
		draw.instanciator = object;
		draw.object = object; draw.text = text; draw.bubblename = name;  draw.colortext = color; draw.graphic = graphic; draw.graphicpointer = pointergraphic; draw.yfix = yfix;
		draw.colorname = namecolor;
	}
	else{
		var check_object = object;
		var _exists = false;
		with(_SYS_POPUP){
			if instanciator == check_object { 
				draw = self.id;
				draw.object = object; draw.text = text; draw.bubblename = name;  draw.colortext = color; 
				draw.graphic = graphic; draw.graphicpointer = pointergraphic; draw.yfix = yfix; draw.colorname = namecolor;
				_exists = true; break}
		}
		if _exists == false {
			draw = inst_popup();
			draw.instanciator = check_object;
			draw.object = object; draw.text = text; draw.bubblename = name;  draw.colortext = color; draw.graphic = graphic; draw.graphicpointer = pointergraphic; draw.yfix = yfix;
			draw.colorname = namecolor;
			_exists = true;
		}
	}
		
	if waitforinput{
		if keyboard_check_pressed(vk_space){
			cutscene_end_action();
			instance_destroy(draw);
		}
	}
}

function cutscene_low_priority(){
	if global.cutscene.priority == false
	{
		
		cutscene_end_action();	
	}	
}
	
function popup_on_trigger(object, messageobject, text, name, namecolor = c_white, yfix = 0, reset = true, resid = 0, collider1, collider2 = collider1, collider3 = collider1, collider4 = collider1, cutscene = true){
	//show_debug_message(object);
	
	if !global.onmenu
	{
		
				
		
		if  collider1 == "player" collider1 = global.player;
	
		isTrigger = (
			
				place_meeting(object.x,object.y,collider1) or 
				place_meeting(object.x,object.y,collider2) or	
				place_meeting(object.x,object.y,collider3) or 
				place_meeting(object.x,object.y,collider4)
			
		)
		sdm(id, global.intern.event);
		if isTrigger
		{
			sdm("ist");
			if !instance_exists(global.intern.event) global.intern.event = noone;
			if global.intern.event == noone	global.intern.event = id			
		}
		else
		{
			sdm("nst");
			if global.intern.event == id global.intern.event = noone;
		}
	
		inst = _SYS_POPUP;
	
	
		if !instance_exists(inst){
			//show_debug_message("Criou");
			draw = instance_create_depth(0,0,0,inst);
			draw.instanciator = object;
			draw.object = messageobject; draw.text = text; draw.bubblename = name;  draw.yfix = yfix;
			draw.colorname = namecolor;
		}
		else if instance_exists(inst){
			var check_object = object;
			var _exists = false;
			with(inst){
				if instanciator == check_object { 
					draw = self.id;
					draw.object = messageobject; draw.text = text; draw.bubblename = name;  draw.yfix = yfix;
					draw.colorname = namecolor;
					_exists = true; break}
			}
			if _exists == false {
				draw = instance_create_depth(0,0,0,inst);
				draw.instanciator = check_object;
				draw.object = messageobject; draw.text = text; draw.bubblename = name;  draw.yfix = yfix;
				draw.colorname = namecolor;
				_exists = true;
			}
		}
	
		if isTrigger and global.intern.event == id{
			global.on_popup = true
			if keyboard_check_pressed(vk_space)
			{
				
				if cutscene {
					cutscene_end_action();
					global.on_popup = false;
				}
				instance_destroy(draw);
			}
		}
		if !isTrigger and reset == true {global.on_popup = false;cutscene_goto(resid); instance_destroy(draw);}
		if !isTrigger and reset == false{global.on_popup = false;instance_destroy(draw)}
	}
}

function balloon(sprite, event, wait = false,  yfix = 0, cutscene = true, loopable = false){

	if !instance_exists(balloonObject) {
		var bubble = instance_create_depth(event.x, event.y - event.sprite_height +yfix, global.intern.depths.over, balloonObject);
		bubble.sprite_index = sprite;
		bubble.loop = loopable;
		_baloon = bubble;
	}
	else 
	{
		var bubble = instance_find(balloonObject, 0);
		bubble.x = event.x;
		bubble.y = event.y - event.sprite_height + yfix;
		bubble.loop = loopable;
		_baloon = bubble;
	}
	
	if cutscene
	{
		if wait 
		{
			
			if bubble.ended == true {
				cutscene_end_action();
				instance_destroy(bubble);
			}
		}
		else 
		{
			cutscene_end_action();
		}
	}
}
	

#endregion

#region Text and Draw

function text_on_view(_x,_y,_text,_textspeed = 0,_color = c_white,_font = Ruler,_align = fa_center){
	_obj = validate_object(_SYS_TEXT);
	if _obj != false {
		_obj.xx = _x;
		_obj.yy = _y;
		_obj.texto = _text;
		_obj.textspeed = _textspeed;
		_obj.colortext = _color;
		_obj.font = _font;
		_obj.align = _align;
		
	}	
}
#endregion