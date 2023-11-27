if global.config.GPU.wobble {
shader_set(ShaderBlendColor)

	var getR = shader_get_uniform(ShaderBlendColor, "colorR");
	shader_set_uniform_f(getR,colR);
	var getG = shader_get_uniform(ShaderBlendColor, "colorG");
	shader_set_uniform_f(getG,colG);
	var getB = shader_get_uniform(ShaderBlendColor, "colorB");
	shader_set_uniform_f(getB,colB);
	


	draw_sprite_pos(sprite_index,
	    image_index,
		bbox_left + skewX, bbox_top,
		bbox_right + skewX, bbox_top,
		bbox_right, bbox_bottom, 
		bbox_left, bbox_bottom, _alpha);
	
}else {
	draw_self();	
}

if global.config.GPU.wobble shader_reset();
