state = "idle";
vlh = 0;
vlv = 0;
vl = 6;
slide = .3;
raio = 200;
timer_max = 20;
timer = 0;

instance_create_depth(x, y, 0, obj_camera);

item[0] = [spr_bloco, spr_bloco, spr_bloco, spr_bloco, spr_bloco, spr_bloco, spr_bloco, spr_bloco, noone, spr_bloco];
item[1] = [0, 0, 0, 0, 0, 0, 0, 0, noone, 0];
item[2] = [1, 1, 1, 1, 1, 1, 1, 1, 0, 1];
mining_damage = 40;

side = 1;
lenght = 20;