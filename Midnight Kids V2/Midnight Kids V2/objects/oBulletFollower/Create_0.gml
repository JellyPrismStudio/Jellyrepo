fx = 0;
fy = 0;
class = 1;
deal_damage = true;
direction = 0;
image_angle = 0;
speed = 15;
super = noone;
life = irandom_range(30,220);
xx = (fx - x);
yy = (fy - y);
life = sqrt(	power(xx,2) + power(yy,2)	)

crit = global.player_stats[2].crit;
atack = global.player_stats[2].atack;
hitrate = global.player_stats[2].hitrate
hitted = false