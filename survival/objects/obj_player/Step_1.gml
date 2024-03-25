
repeat (abs(vlh))
{
	if (!place_meeting(x+sign(vlh), y, obj_colisao)) x += sign(vlh);
	else
	{
		if (!place_meeting(x+sign(vlh), y-vl*3, obj_colisao)) y -= 1;
		else if (!place_meeting(x+sign(vlh), y+vl*3, obj_colisao)) y += 1;
	}
}
repeat (abs(vlv))
{
	if (!place_meeting(x, y+sign(vlv), obj_colisao)) y += sign(vlv);
	else
	{
		if (!place_meeting(x-vl*3, y+sign(vlv), obj_colisao)) x -= 1;
		else if (!place_meeting(x+vl*3, y+sign(vlv), obj_colisao)) x += 1;
	}
}