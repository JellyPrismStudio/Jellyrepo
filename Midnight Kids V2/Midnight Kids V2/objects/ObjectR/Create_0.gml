/// @description Insert description here
event_inherited();

create_battle_basics_player();
dist = irandom_range(0,90);
dist2 = irandom_range(0,90);
dist3 = irandom_range(0,90);
dist4 = irandom_range(0,90);
print = 0;
view_range = irandom_range(80,140);
self_index = 2; // Id no database
AIM_RANGE =  global.player_stats[self_index].aimrange;
normal_speed = 3;
dash_speed = 4;
sneak_speed = 2;
oDir[0] = 0;
depth = -y;
insttext = ["Ola amigos", "tudo bem com\nvoces?", "tomara\nque\nesteja\ntudo certo!"];
i = 0;
bool1 = false;
a = 0;
a0 = false;
// You can write your code in this editor
kshow_message(8,15,20, "ROBSO");