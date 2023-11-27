if target > -1
{
	fx = global.party.playersobj[target].x;
	fy = global.party.playersobj[target].y;
}
else
{
	if random_dir == false
	{
		fx = irandom_range(0,room_width);
		fy = irandom_range(0,room_height);
		random_dir = true;
	}	
}
dir = point_direction(x,y,fx,fy);
direction = dir;
image_angle = dir;
speed = 5;

if target > -1 
{
	if place_meeting(x,y,global.party.playersobj[target])
	{
		battle_deal_damage(dmg, target);
		instance_destroy();
	}
}

if !on_view instance_destroy();