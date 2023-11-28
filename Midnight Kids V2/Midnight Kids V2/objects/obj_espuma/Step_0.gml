y += vlv;
x += vlh;

if (y > ystart+random(50))
{
	vlv = 0;
}

if (y < ystart) vlv += .05;
else
{
	vlh = clamp(vlh, -1, 1);
	if (timer > 0) timer -= .5;
	else instance_destroy();
}

image_alpha = timer/60;