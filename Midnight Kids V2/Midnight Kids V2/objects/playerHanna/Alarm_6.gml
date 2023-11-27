if global.party.players[0] != self_index 
{
	var inst = instance_nearest(x, y, oENM_Main)
	if inst != -4
	{
		if inst.get_player > -1
		{
			var _ins = instance_create_depth(x,y,global.intern.depths.system,oBulletFollower);
			_ins.image_blend = c_orange;
			_ins.fx = inst.x;
			_ins.fx = inst.y;
			_ins.direction = point_direction(x,y, inst.x, inst.y);
			_ins.image_angle = _ins.direction;
			//_ins.direction = point_direction(x,y,inst.x,inst.y);
			//_ins.angle = _ins.direction
		}
	}
}
alarm_set(6, global.player_stats[self_index].DPS/0.6)