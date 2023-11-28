//randomize();
if global.config.GPU.wobble image_speed = random_range(0.6,1.3);
else image_speed = 0;
conf = global.config.GPU.wobble;

sprite_index= choose(BushAnim6, BushAnim7, BushAnim8);
image_blend = choose(#f5efe7, #e5edd8, #d3f1dd);

touchwobble = false;
touchcooldown = 0;

//sprite_index= choose(Bush5, Bush8);


