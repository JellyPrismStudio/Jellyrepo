/// @description Insert description here
self_index = 0;
AIM_RANGE =  global.player_stats[self_index].aimrange;

event_inherited()
alarm_set(5, global.player_stats[self_index].skillfreq)
alarm_set(6, global.player_stats[self_index].DPS*4)