depth = -y;
image_xscale = 2;
image_yscale = 2;

if (place_meeting(x, y, obj_player) and keyboard_check(vk_space)) vida--;
else vida = 100;

if (vida == 0)
{
	instance_destroy();
	obj_player.dinheiro += 5;
}