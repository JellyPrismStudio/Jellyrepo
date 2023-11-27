// = RANGES = //


if hp > 0 and damaged
{
	if d>0 {
		image_blend = c_red;
		d--; // A função dessa variável é só pra dar um timerzinho no blendmode, e ficar mais visivel
	}
	else {
		d = 6;
		damaged = false;
		image_blend = OWN_COLOR;
	}
}
else if hp <= 0 instance_destroy();

// You can write your code in this editor


