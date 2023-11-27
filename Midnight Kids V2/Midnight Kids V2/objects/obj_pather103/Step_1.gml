// = RANGES = //


if hp > 0 and damaged
{
	if d>0 {
		d--; // A função dessa variável é só pra dar um timerzinho no blendmode, e ficar mais visivel
	}
	else {
		d = 6;
		damaged = false;
	}
}
else if hp <= 0 instance_destroy();

// You can write your code in this editor


