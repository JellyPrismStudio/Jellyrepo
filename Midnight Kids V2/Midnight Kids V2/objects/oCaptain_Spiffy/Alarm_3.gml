xx1 = x;
if xx2 < xx1 {
	image_xscale = -1;
	sprite_index = sCaptainSpiffyMoving;
	sprite = 0;
}
else if xx2 > xx1 {
	image_xscale = 1;
	sprite_index = sCaptainSpiffyMoving;
	sprite = 0;
}
else {
		 if sprite == 0	sprite_index = sCaptainSpiffy;
	else if sprite == 1	sprite_index = sCaptainSpiffyOnFeet;
	else if sprite == 2 sprite_index = sCaptainSpiffyAttacking;
}
xx2 = x;
alarm_set(3,3);