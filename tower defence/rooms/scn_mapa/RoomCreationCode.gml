ini_open("tower_defence.ini");
ini_write_real("menu", "nivel", global.fase);
ini_write_real("menu", "gold", global.gold);
#region visuais
#region visual atual
ini_write_real("monstro1", "visual", global.visual1);
ini_write_real("monstro2", "visual", global.visual2);
ini_write_real("monstro3", "visual", global.visual3);
ini_write_real("monstro4", "visual", global.visual4);
ini_write_real("monstro5", "visual", global.visual5);
#endregion
#region visuais comprados
ini_write_real("monstro1", "visual1", global.visual1_m1);
ini_write_real("monstro2", "visual1", global.visual1_m2);
ini_write_real("monstro3", "visual1", global.visual1_m3);
ini_write_real("monstro4", "visual1", global.visual1_m4);
ini_write_real("monstro5", "visual1", global.visual1_m5);

ini_write_real("monstro1", "visual2", global.visual2_m1);
ini_write_real("monstro2", "visual2", global.visual2_m2);
ini_write_real("monstro3", "visual2", global.visual2_m3);
ini_write_real("monstro4", "visual2", global.visual2_m4);
ini_write_real("monstro5", "visual2", global.visual2_m5);
#endregion
#endregion
ini_write_real("monstros", "strenght", global.strenght);
ini_write_real("monstros", "speed", global.sped);
ini_close();