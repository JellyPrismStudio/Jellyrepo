if (instance_exists(obj))
{
	f_draw();
	f_cliente();
	f_close();
}
else
{
	instance_destroy();
}