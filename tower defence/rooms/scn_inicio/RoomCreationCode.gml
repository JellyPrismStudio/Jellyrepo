global.game_speed = 1;
ini_open("tower_defence.ini");
global.fase = ini_read_real("menu", "nivel", 1);
global.gold = ini_read_real("menu", "gold", 0);
#region visual
#region visual atual
global.visual1 = ini_read_real("monstro1", "visual", 0);
global.visual2 = ini_read_real("monstro2", "visual", 0);
global.visual3 = ini_read_real("monstro3", "visual", 0);
global.visual4 = ini_read_real("monstro4", "visual", 0);
global.visual5 = ini_read_real("monstro5", "visual", 0);
#endregion
#region visuais comprados
global.visual1_m1 = ini_read_real("monstro1", "visual1", false);
global.visual1_m2 = ini_read_real("monstro2", "visual1", false);
global.visual1_m3 = ini_read_real("monstro3", "visual1", false);
global.visual1_m4 = ini_read_real("monstro4", "visual1", false);
global.visual1_m5 = ini_read_real("monstro5", "visual1", false);

global.visual2_m1 = ini_read_real("monstro1", "visual2", false);
global.visual2_m2 = ini_read_real("monstro2", "visual2", false);
global.visual2_m3 = ini_read_real("monstro3", "visual2", false);
global.visual2_m4 = ini_read_real("monstro4", "visual2", false);
global.visual2_m5 = ini_read_real("monstro5", "visual2", false);
#endregion
#endregion
global.sped = ini_read_real("monstros", "speed", 0);
global.strenght = ini_read_real("monstros", "strenght", 0);
global.monstro4 = ini_read_real("monstros", "4", false);
global.monstro5 = ini_read_real("monstros", "5", false);
ini_close();
room_goto(scn_mapa);