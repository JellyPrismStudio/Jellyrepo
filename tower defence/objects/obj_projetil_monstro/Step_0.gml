x += lengthdir_x(sped*global.game_speed, image_angle);
y += lengthdir_y(sped*global.game_speed, image_angle);

var col = instance_place(x, y, obj_tower);
if (col)
{
	_dano = 10+global.strenght/3+1;
	col.vida -= _dano;
	instance_destroy();
}