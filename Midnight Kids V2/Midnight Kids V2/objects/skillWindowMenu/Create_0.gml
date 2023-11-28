ocw = object_viewport.x;		// Instancias
och = object_viewport.y;
party = global.party.players[global.menu.skillpage];
cw = global.config.camera_width/2;		// Texto
ch = global.config.camera_height/2;


build_skill_tree();
















bg		= instance_create_layer(object_viewport.x,object_viewport.y,"Menu", bgSkill);
bgd		= instance_create_layer(object_viewport.x + 240,object_viewport.y,"Menu", bgSkillDesc);

page_button_e = instance_create_layer(object_viewport.x + 153,object_viewport.y+120,"Menu", menuSetaEsquerdaSkill);
page_button_d = instance_create_layer(object_viewport.x + 173,object_viewport.y+120,"Menu", menuSetaDireitaSkill);

short1 =  instance_create_layer(object_viewport.x - 60,object_viewport.y + 130,"Menu", ShortcutSkill);
short1.key = "Q";
short1.identificator = 0;

short2 =  instance_create_layer(object_viewport.x - 20,object_viewport.y + 130,"Menu", ShortcutSkill);
short2.key = "E";
short2.identificator = 1;

short3 =  instance_create_layer(object_viewport.x + 20,object_viewport.y + 130,"Menu", ShortcutSkill);
short3.key = "R";
short3.identificator = 2;

short4 =  instance_create_layer(object_viewport.x + 60,object_viewport.y + 130,"Menu", ShortcutSkill);
short4.key = "F";
short4.identificator = 3;
