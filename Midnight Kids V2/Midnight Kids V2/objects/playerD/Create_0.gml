/// @description Insert description here
self_index = 3;
AIM_RANGE =  global.player_stats[self_index].aimrange;
play_audio("BGM3", dylan_loop, 0, true, 0, irandom_range(0,200));
change_audio("BGM3", 0);
change_audio("BGM3", -global.config.music_volume);
event_inherited();
