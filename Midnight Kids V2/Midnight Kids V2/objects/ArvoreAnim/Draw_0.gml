if global.config.GPU.wobble {
	draw_sprite_pos(sprite_index,
	    image_index,
		bbox_left + skewX, bbox_top,
		bbox_right + skewX, bbox_top,
		bbox_right, bbox_bottom, 
		bbox_left, bbox_bottom, _alpha);
}else draw_self();
