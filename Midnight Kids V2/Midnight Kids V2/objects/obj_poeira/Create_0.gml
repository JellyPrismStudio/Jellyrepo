depth = global.intern.depths.system;
part_sys = part_system_create();
part_system_depth(part_sys, depth);
part = part_type_create();
size = 0.08

part_type_shape(part, pt_shape_square);
part_type_size(part, size, size*2, -0.0001, .02);
part_type_scale(part, .1, .1);
part_type_colour2(part, c_white, c_gray);
part_type_alpha3(part, .0, 1, .5);
part_type_speed(part, .1, .2, 0, 0);
part_type_direction(part, -90, -90, 0, 50);
part_type_gravity(part, 0, 0);
part_type_orientation(part, 0, 0, -1, 1, true);
part_type_blend(part, false);
part_type_life(part, 250, 500);

emitter = part_emitter_create(part_sys);
amount = 40;
timer = 0;
timer_max = 2;