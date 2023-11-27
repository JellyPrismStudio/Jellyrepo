depth = global.intern.depths.weather;

part_sys = part_system_create();
part_system_depth(part_sys, global.intern.depths.weather);
part = part_type_create();

part_sys_chao = part_system_create();
part_chao = part_type_create();
if !layer_exists("RainDrops") layer_create(0,"RainDrops");
part_system_layer(part_sys_chao,"RainDrops");

amount = 20;
alpha = random_range(0.1,0.7);
additive = false;
size = 1;
runparticle = false;
alarm_set(0,2);