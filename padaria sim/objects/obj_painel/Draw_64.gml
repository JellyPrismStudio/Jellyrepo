if (instance_exists(obj))
{
	scr_draw();
	f_cliente();
	scr_close();
}
else
{
	instance_destroy();
}