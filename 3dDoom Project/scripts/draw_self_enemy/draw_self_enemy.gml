/// @description draw_self_enemy()
function draw_self_enemy() {
	d3d_transform_set_identity();
	var d = cameradirection, w = sprite_get_width(my_sprite), h = sprite_get_height(my_sprite);
	d3d_draw_wall(x - lengthdir_x(0.25*w,d),y - lengthdir_y(0.25*w,d),z + 0.5*sprite_get_yoffset(my_sprite),x + lengthdir_x(0.25*w,d),y + lengthdir_y(0.25*w,d),z - 0.5*h + 0.5*sprite_get_yoffset(my_sprite),sprite_get_texture(my_sprite,floor(image_index)),1,1)
	/*d3d_transform_add_rotation_x(90)
	d3d_transform_add_rotation_y(0)
	d3d_transform_add_rotation_z(cameradirection)
	d3d_transform_add_translation(x,y,z)
	draw_set_color(c_white)
	draw_sprite_ext(my_sprite,image_index,0,0,0.5,0.5,0,image_blend,1)
	d3d_transform_set_identity();
	*/



}
