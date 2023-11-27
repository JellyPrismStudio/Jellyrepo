/// @description Insert description here
sizevar = random_range(size, 1);
wspeed = 3.7 + (amount/10) * 7;
part_type_sprite(part, Rain1, 0, 0, 0);
part_type_size(part, sizevar, 1, 0, 0);
part_type_scale(part, 1, 1);
part_type_colour1(part, c_white);
part_type_alpha3(part, alpha, alpha, alpha/3);
part_type_speed(part, 3.7, 3.7, 0, 0);
part_type_direction(part, 250, 255, 0, 0);
part_type_gravity(part, 0, 270);
part_type_orientation(part, 0, 0, 0, 0, 0);
part_type_blend(part, additive);
part_type_life(part, 100, 500);
alarm_set(1,irandom_range(20000/(wspeed/3), 50000/(wspeed/3)));

emitter = part_emitter_create(part_sys);
// You can write your code in this editor
runparticle = true;

//part_type_shape(part_chao, rain_drip_floor);
part_type_sprite(part_chao, rain_drip_floor, 0, 0, 0);
part_type_size(part_chao, sizevar, 1, 0, 0);
part_type_scale(part_chao, 1, 1);
part_type_colour1(part_chao, c_white);
part_type_alpha3(part_chao, alpha*4, alpha, alpha/3);
part_type_speed(part_chao, 0, 0, 0, 0);
part_type_direction(part_chao, 250, 255, 0, 0);
part_type_gravity(part_chao, 0, 270);
part_type_orientation(part_chao, 0, 0, 0, 0, 0);
part_type_blend(part_chao, additive);
part_type_life(part_chao, 15, 35);

emitter_chao = part_emitter_create(part_sys_chao);