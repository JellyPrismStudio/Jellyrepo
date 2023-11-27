/// @description Insert description here
self_index = 2;
AIM_RANGE =  global.player_stats[self_index].aimrange;

event_inherited();
alarm_set(5, global.player_stats[self_index].skillfreq)
alarm_set(6, global.player_stats[self_index].DPS*4)