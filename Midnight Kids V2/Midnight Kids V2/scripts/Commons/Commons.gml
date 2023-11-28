function outline_shader_common(){
		function draw_events(){
		draw_path(path, x, y, 1);
		draw_set_halign(fa_center);
		draw_text(x,y+sprite_height,hp);
		draw_circle_color(x,y,ww*1 + sprite_width/2, c_orange, c_orange, true);
		kget_radius(self, BATTLE_RANGE,false,true,true,global.player);
	}

	var mouse = battle_mouse_over();

	if mouse {
		shader_set(ShaderOutline);
		var texture = sprite_get_texture(self.sprite_index, self.image_index);
		var texture_width	= texture_get_texel_width(texture);
		var texture_height	= texture_get_texel_height(texture);

		shader_set_uniform_f(uniform_Handle, texture_width, texture_height)
		draw_self();
		if global.debug.draws draw_events();

		shader_reset();
	}
	else
	{
		draw_self();
		if global.debug.draws draw_events();	
	}
}


function enemies_draw(){
	generic_hover_enemy_common();	
}


function generic_hover_enemy_common(){
	//draw_events();
	draw_self();
	if global.debug.draws draw_events();
	var mouse = battle_mouse_over();
	if mouse image_blend = global.config.targetcolor;
	else image_blend = OWN_COLOR;
	
}

function draw_events(){
	draw_path(path, x, y, 1);
	draw_set_halign(fa_center);
	draw_text(x,y+sprite_height,hp);
	draw_circle_color(x,y,ww*1 + sprite_width/2, c_orange, c_orange, true);
	kget_radius(self, BATTLE_RANGE,false,true,true,global.player);
}