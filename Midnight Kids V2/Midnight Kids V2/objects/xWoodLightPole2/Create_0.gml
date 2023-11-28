lampida = plus_instance_create_layer(x + 36, y-54,"BottomLight",obj_light_torch2);
lampida.image_blend = #D67C00;
lampida.image_initial_alpha = lamp/2;

light = plus_instance_create_layer(x + 36, y-54,"Light",obj_light_soft_torch);
light.image_blend = #FFAB1A;
light.image_initial_alpha = lamp;
light.light_initial_radius = 10;