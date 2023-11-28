var xport = camera_get_view_x(view_camera[0]);
var yport = camera_get_view_y(view_camera[0]);
var wport = camera_get_view_width(view_camera[0]);
var hport = camera_get_view_width(view_camera[0]);

if runparticle {
	part_emitter_region(part_sys, emitter, xport-wport/1.5, xport+wport*2.8, yport+20, yport-50, ps_shape_rectangle, ps_distr_linear);
	part_emitter_burst(part_sys, emitter, part, amount);
	
	part_emitter_region(part_sys_chao, emitter_chao, xport, xport+wport, yport, yport+hport, ps_shape_rectangle, ps_distr_linear);
	part_emitter_burst(part_sys_chao, emitter_chao, part_chao, amount);
}