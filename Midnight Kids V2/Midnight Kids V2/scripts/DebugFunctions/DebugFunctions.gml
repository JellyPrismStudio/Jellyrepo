function DEBUG_get_variables(){
	if global.debug.objects and global.debug.debugshow{
		if !variable_instance_exists(id, "_debug_vobject") _debug_vobject = "";
		if !variable_instance_exists(id, "_debug_vlocal")  _debug_vlocal = "";
		if position_meeting(mouse_x,mouse_y,self.id){
			if global.debug.objinspect != id {
				if mouse_check_button_pressed(mb_right){
					global.debug.objinspect = id;	
				}	
			}
			else
			{
				if mouse_check_button_pressed(mb_right){
					_debug_vlocal = get_string("Digite a Variável que deseja ter acesso", "variavel");
					if variable_instance_exists(id,string(_debug_vlocal)){
						_debug_vobject = variable_instance_get(id, string(_debug_vlocal));
						show_message(_debug_vobject);
						
					}
					else show_message("A variável não existe");
				}
			}
		}
		
		
		
		if global.debug.objinspect == id {
			draw_set_font(Varnished);
			draw_text_ext(0,30,self,10,600);
			_debug_vobject = variable_instance_get(id, string(_debug_vlocal));
			draw_text_ext_color(620,60,_debug_vobject,60,510, c_red, c_red, c_red, c_red, 1);
		}
	}
}