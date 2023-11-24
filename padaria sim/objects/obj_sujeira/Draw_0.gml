draw_self();

if (timer != timer_max) draw_healthbar(x-40, y-40, x+40, y-45, timer/timer_max*100, c_black, c_lime, c_lime, 0, true, true);