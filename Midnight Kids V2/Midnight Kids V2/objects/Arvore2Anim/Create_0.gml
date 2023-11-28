delay = 0;
delay_time = random_range(5,15);
skewX = 0;
skewX_max = 5;
_alpha = 1;
skew_dir = irandom_range(0,1);
old_skew = 0;
skew_var = 0.15;
colR = get_random("pine", 0.75);
colB = get_random("pine", 0.75);
colG = get_random("pine", 0.75);

col = instance_create_depth(self.x,self.y,depth-1,ColliderRound);
col.image_xscale = image_xscale/2;
col.image_yscale = image_yscale/2;
set_image_blend("pine");
image_speed = 0;
depth_sort();
alarm_set(0,10);
