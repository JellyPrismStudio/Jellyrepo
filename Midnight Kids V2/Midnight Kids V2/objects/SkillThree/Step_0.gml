if (!descendo)
{
	if (forca <= 7) forca += .1;
	else descendo = true;
}
if (descendo)
{
	if (forca > 0) forca -= .02;
	else instance_destroy();
}

//se quiser diminuir a quantidade de espuma só criar um alarm com o delay q vc quer entre a criação de uma e outra e botar esse código aqui:
var esp = instance_create_depth(x, y, -y, obj_espuma);
esp.vlv = -min(forca, 3.5);