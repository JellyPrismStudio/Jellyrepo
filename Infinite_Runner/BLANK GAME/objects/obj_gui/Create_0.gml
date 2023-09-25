timer = 0;

tempo = function()
{
	timer++;
	plus_text_font(10, 10, "TIMER: " + string(timer/60), c_black, fnt_DayDream, fa_left);
}