 if image_index == 5
{
	atack = global.player_stats[0].magic * 1;
}
else if image_index == 15
{
	atack = global.player_stats[0].magic * .9;
}
if image_index == 30
{
	atack = global.player_stats[0].magic/2 * .8;
}
else if image_index == 40
{
	atack = global.player_stats[0].magic * .7;
}
else if image_index == 60
{
	atack = global.player_stats[0].magic * .5;
}
/*image_xscale += mult;
image_yscale = image_xscale;
image_alpha -= mult;

if image_alpha <= 0.05 instance_destroy();
