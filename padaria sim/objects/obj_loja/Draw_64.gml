draw_text(room_width-100, 20, "xp: " + string(global.xp));
draw_text(room_width-100, 40, "level: " + string(global.level));
draw_text(room_width-100, 60, "gold: " + string(global.gold));

if (global.xp >= level[lvl]*10)
{
	global.level++;
	lvl++;
	show_message("level up")
}