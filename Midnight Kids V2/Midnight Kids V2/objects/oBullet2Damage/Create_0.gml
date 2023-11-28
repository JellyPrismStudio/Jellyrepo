//image_xscale = 0.1;
//image_yscale = image_xscale;
image_alpha = 1;
mult = 0.08;
class = 0;
depth_sort();

event_inherited()

deal_damage = true;
crit = global.player_stats[0].crit;
atack = global.player_stats[0].magic;
hitrate = 120

atack = global.player_stats[0].magic * 1.8;