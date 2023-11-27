depth = -y;

x += lengthdir_x(vl, dir);
y += lengthdir_y(vl, dir);

timer--;
if (place_meeting(x, y, colisor) or place_meeting(x, y, oENM_Main)) timer = 0;

if (timer <= 0)
{
	instance_destroy();
	instance_create_depth(x, y, depth, SkillFour);
}