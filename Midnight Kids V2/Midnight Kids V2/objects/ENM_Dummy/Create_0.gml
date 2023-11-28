myid = 6
damage_type = 1;
loot = global.enemy_stats[myid].loot;
damaged = false;
damageid = noone;
aim_target = global.player;
depth_sort();
create_enemy_stats(myid);
battle_create();