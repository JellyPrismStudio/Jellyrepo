//x = global.player.x;
//y = global.player.y;
progress += 0.01 * spd;
if (progress > 1) instance_destroy();

image_scale = animcurve_channel_evaluate(curve_channel_scale, progress) * scale;
alpha = animcurve_channel_evaluate(curve_channel_alpha, progress);
