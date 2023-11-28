state_machine = "FOLLOW";
player_range = 70;
xx = 0;
yy = 0;
correctly_alligned = false;
mousex = x;
mousey = y;
xx1 = x;
yy1 = y;
xx2 = x;
yy2 = y;
timer1 = 500;
sprite = 0;
on_radius = kget_radius(self,player_range,true,true,false,global.player);
object = false;
attacking = false;
hide_obj = false;
hide_bol = false;
path = 0;

target_x = global.player.x;
target_y = global.player.y;
pxx = global.player.x;
pyy = global.player.y;
captain_damage = irandom_range(1,3);
hidden = false;

RADIUS = 110;
PATHING_COOLDOWN = 0;

obj_speed = 3;

alarm_set(0,10);
alarm_set(2,20);
alarm_set(3,3);