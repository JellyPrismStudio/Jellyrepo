initial_setup();

ini_open("stats.ini");
global.timer = ini_read_real("stats", "timer", 0);
global.moedas = ini_read_real("stats", "moedas", 0);
global.pontos = ini_read_real("stats", "pontos", 0);
global.ima = ini_read_real("stats", "imã", 0);
global.shield = ini_read_real("stats", "escudo", 0);
global.star = ini_read_real("stats", "estrela", 0);
ini_close();

room_goto(scn_jogo);