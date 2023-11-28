function kshow_message(lfontsize,lposx,lposy, ltext){
	var lsprite = instance_create_depth(0,0,0,_SYS_OBJECT_MESSAGE_HELPER);
	//lsprite.sprite_width = (lfontsize * 2 + (string_width(ltext) * 8));
	//draw_text(30,30,"OLA");
	
}


function kw_draw_simple_message_with_name(object = self.id,text,names){
	var draw = _SYS_OBJECT_MESSAGE_HELPER;
	instance_create_depth(0,0,0,draw);
	draw.kw_name = names;
	draw.kw_object = object ; draw.kw_text = text ; draw.kw_x = x ; draw.kw_y = y ; draw.kw_spacing = 0; draw.kw_margin = 10;
}