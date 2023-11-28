set_x = 0;
set_y = 0;
fading = true;
alarmed = false;
timer = 0;
delta = 0.05;
fade = instance_create_depth(0,0,0,FADE_OBJ);//check_object_and_validate(FADE_OBJ,0,0);
fade.delta = delta;
loading = false;

