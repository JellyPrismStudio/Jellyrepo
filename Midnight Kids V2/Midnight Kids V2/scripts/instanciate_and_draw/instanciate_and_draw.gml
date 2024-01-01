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



function instanciate_var_if_null(instanceid, variable, set, except = false){
	if !variable_instance_exists(instanceid,variable){
		variable_instance_set(instanceid,variable, set);
		instanceid.variable = set;
	}	
}

#endregion