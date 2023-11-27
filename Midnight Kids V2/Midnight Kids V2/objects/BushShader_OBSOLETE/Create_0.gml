//randomize();
delay = 0;
delay_time = random_range(2,9);
skewX = 0;
skewX_max = 3;
_alpha = 1;
skew_dir = irandom_range(0,1);
old_skew = 0;
skew_var = 0.15;

colormult = 0.85;
colR = get_random("pine", colormult);
colB = get_random("pine", colormult);
colG = get_random("pine", colormult);

sprite_index= choose(Bush5, Bush6, Bush7, Bush8);


//sprite_index= choose(Bush5, Bush8);


