image_angle = irandom_range(0,359);

_speed = 0.3;
inst = plus_instance_create_layer(x,y+105,"BottomLight",xVentiladorShadow);
inst.image_angle = image_angle;
inst.image_alpha = 0.3;
