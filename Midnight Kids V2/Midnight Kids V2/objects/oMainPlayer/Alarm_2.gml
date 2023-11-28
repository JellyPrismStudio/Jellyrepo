if global.player_index != self_index {
	//if old_xx < x image_xscale = 1;
	//else image_xscale = -1;
	old_xx = x;
	old_yy = y;
	alarm_set(2,3);
}