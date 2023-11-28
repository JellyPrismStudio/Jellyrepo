	var pointval = 9
	if _GLOBAL_CAMERA.camera < array_length(global.intern.enemyover){
		if global.intern.enemyover[_GLOBAL_CAMERA.camera] != noone and global.config.autoaim {
			pointval = 21
		}
	}

	points = point_distance(x0,y0,x1,y1)/pointval;
	pointsdiv = int64(points / 2);
	points = point_distance(x0,y0,x1,y1)/(pointval+pointsdiv);
	yincr = (points/2)/points;
	
	
	xmult = (x1 - x0) / points;
	ymult = (y1 - y0) / points;
	pointincr = 1/points;
	h = (x0 + x1) / 2
	k = (y0 + y1) / 2
	bol = true;


//a = (x - k) / (y - h)^2;
//sdm(a);

if point <= 1
{
	if point < 0.4  {
		yy -= (vel);
	}
	//else if point <= 0.4 and point < 0.5 yy -= vel/2
	//else if point >= 0.5 and point < 0.6 yy += vel/2
	else if point > 0.6 {
		yy += (vel);
	}
	
	x = (x0 + point*(x1-x0))
	y = (y0 + point*(y1-y0)) + yy;
	point += pointincr;
}
else
{
	instance_create_depth(x1,y1,depth,oBullet2Damage);
	instance_destroy();
}