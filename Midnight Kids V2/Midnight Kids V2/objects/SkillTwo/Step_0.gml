if (subindo == 2)
{
	alpha += .02;
	if (alpha >= 1) subindo = 1;
}
if (subindo == 1)
{
	timer--;
	if (timer <= 0) subindo = 0;
}
if (subindo == 0)
{
	alpha -= .02;
}
if (timer <= 0 and alpha <= 0)
{
	instance_destroy();
}

//			CÓDIGO DO UPGRADE



