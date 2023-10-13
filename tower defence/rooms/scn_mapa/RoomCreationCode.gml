global.game_speed = 1;
ini_open("tower_defence.ini");
global.fase = ini_read_real("menu", "nivel", 1);
ini_close();