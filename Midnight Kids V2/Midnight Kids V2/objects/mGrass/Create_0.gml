sprite = BushAnim5;
frames = sprite_get_number(sprite);
texture = sprite_get_texture(sprite, 0);

width = sprite_get_width(sprite);
height = sprite_get_height(sprite);

amount = 8000;

color = c_white;
alpha = 1;


gpu_set_ztestenable(true);
gpu_set_alphatestenable(true);

vertex_format_begin();

vertex_format_add_position_3d();
vertex_format_add_texcoord();
vertex_format_add_color();

format = vertex_format_end();
vbuff = vertex_create_buffer();

vertex_begin(vbuff, format);

repeat (amount){
	var x1 = irandom_range(bbox_left,bbox_right);
	var y1=  irandom_range(bbox_top,bbox_bottom);
	var x2 = x1 + width;
	var y2 = y1 + height;
	
	var ddepth = -y2
	
	var frame = irandom(frames - 1);
	var uvs = sprite_get_uvs(sprite, frame);
	
	vertex_position_3d(vbuff, x1, y1, ddepth);
	vertex_texcoord(vbuff, uvs[0], uvs[1]);
	vertex_color(vbuff, color, alpha);
	
	vertex_position_3d(vbuff, x2, y1, ddepth);
	vertex_texcoord(vbuff, uvs[2], uvs[1]);
	vertex_color(vbuff, color, alpha);
	
	vertex_position_3d(vbuff, x1, y2, ddepth);
	vertex_texcoord(vbuff, uvs[0], uvs[3]);
	vertex_color(vbuff, color, alpha);
	
	/// TRIANGULO 2
	
	vertex_position_3d(vbuff, x2, y1, ddepth);
	vertex_texcoord(vbuff, uvs[2], uvs[1]);
	vertex_color(vbuff, color, alpha);
	
	vertex_position_3d(vbuff, x1, y2, ddepth);
	vertex_texcoord(vbuff, uvs[0], uvs[3]);
	vertex_color(vbuff, color, alpha);
	
	vertex_position_3d(vbuff, x2, y2, ddepth);
	vertex_texcoord(vbuff, uvs[2], uvs[3]);
	vertex_color(vbuff, color, alpha);	
}

vertex_end(vbuff);
vertex_freeze(vbuff);