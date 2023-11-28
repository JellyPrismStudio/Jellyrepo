if global.config.GPU.wobble {
	delay--
	if delay<=0{
		if skewX <  skewX_max and skew_dir == 0	skewX+=skew_var;	
		if skewX >= skewX_max and skew_dir == 0	{skew_dir = 1; skewX = skewX_max - skew_var}
		if skewX >  -skewX_max and skew_dir == 1	skewX-=skew_var;	
		if skewX <= -skewX_max and skew_dir == 1	{skew_dir = 0; skewX = -skewX_max + skew_var}
		delay = delay_time;
	}
}
depth_sort();
//blend_behind();