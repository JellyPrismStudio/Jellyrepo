var xport = camera_get_view_x(view_camera[0]);
var yport = camera_get_view_y(view_camera[0]);
var wport = camera_get_view_width(view_camera[0]);
var hport = camera_get_view_height(view_camera[0]);

if (timer > 0) timer--;
else
{
	timer = timer_max;
	timer_max = random_range(room_speed/2, room_speed*1.5);
	
	part_emitter_region(part_sys, emitter, xport-wport*2, xport+wport*2, yport-80, yport+hport, ps_shape_rectangle, ps_distr_linear);
	part_emitter_burst(part_sys, emitter, part, irandom_range(amount*.8, amount*1.2));
}