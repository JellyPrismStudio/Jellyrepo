timer = 0;

tempo = function()
{
	timer++;
	draw_text(10, 10, "TIMER: " + string(timer/60));
}