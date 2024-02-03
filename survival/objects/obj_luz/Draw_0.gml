var _viewx = camera_get_view_x(view_camera[0]);
var _viewy = camera_get_view_y(view_camera[0])

if (!surface_exists(surf)) surf = surface_create(view_wport[0], view_hport[0]);
surface_set_target(surf);
draw_set_color(c_black);
draw_rectangle(0, 0, view_wport[0], view_hport[0], false);
draw_set_color(c_white);
gpu_set_blendmode(bm_subtract);
with (obj_player)
{
	var _raio = keyboard_check(vk_shift)? obj_luz.raio_player_lanterna : obj_luz.raio_player_normal;
	for (var i = 0; i < _raio; i++;)
	{
		draw_set_alpha(.4-(i/_raio)/2);
		draw_circle(x-_viewx, y-_viewy-sprite_height/2, i, false);
		draw_set_alpha(1);
	}
}
gpu_set_blendmode(-1);
surface_reset_target();

draw_surface(surf, _viewx, _viewy);