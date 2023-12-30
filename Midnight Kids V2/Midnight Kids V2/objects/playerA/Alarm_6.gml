if global.party.players[0] != self_index and global.player_stats[self_index].hp > 0
{
	var inst = instance_nearest(x, y, oENM_Main)
	if inst != -4
	{
		if inst.get_player > -1 and point_distance(x,y,inst.x,inst.y) < 370
		{
			var _ins = instance_create_depth(x,y,global.intern.depths.system,oBulletFollower2);
			_ins.x1 = inst.x;
			_ins.y1 = inst.y;
			_ins.xmult = (_ins.x1 - _ins.x0) / _ins.points;
			_ins.ymult = (_ins.y1 - _ins.y0) / _ins.points;
			_ins.direction = point_direction(x,y, inst.x, inst.y);
			_ins.image_angle = _ins.direction;
			//_ins.direction = point_direction(x,y,inst.x,inst.y);
			//_ins.angle = _ins.direction
		}
	}
}
alarm_set(6, global.player_stats[self_index].DPS/0.6)