// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function call_menu(){
	if layer_exists("Menu") {
		draw = instance_create_layer(x,y,"Menu",MENU);
	}
	else {
		layer_create(global.intern.depths.menu, "Menu");
		draw = instance_create_layer(x,y,"Menu",MENU);
	}
}

function close_itens_menu(){
	if instance_exists(itemMenu)				instance_destroy(itemMenu);
	if instance_exists(skillMenu)				instance_destroy(skillMenu);
	if instance_exists(statsMenu)				instance_destroy(statsMenu);
	if instance_exists(equipMenu)				instance_destroy(equipMenu);
	if instance_exists(configMenu)				instance_destroy(configMenu);
	if instance_exists(bestiaryMenu)			instance_destroy(bestiaryMenu);
}

function close_itens_main_menu(){
	if instance_exists(configMenu)				instance_destroy(configMenu);
	if instance_exists(itemMenu)				instance_destroy(itemMenu);
	if instance_exists(skillMenu)				instance_destroy(skillMenu);
	if instance_exists(statsMenu)				instance_destroy(statsMenu);
	if instance_exists(equipMenu)				instance_destroy(equipMenu);
	if instance_exists(itemWindowMenu)			instance_destroy(itemWindowMenu);
	if instance_exists(skillWindowMenu)			instance_destroy(skillWindowMenu);
	if instance_exists(itemSlots)				instance_destroy(itemSlots);
	if instance_exists(bgInv)					instance_destroy(bgInv);
	if instance_exists(bgInvDesc)				instance_destroy(bgInvDesc);
	if instance_exists(menuPlayer)				instance_destroy(menuPlayer);
	if instance_exists(menuOffBackground)		instance_destroy(menuOffBackground);
	if instance_exists(menuSetaDireita)			instance_destroy(menuSetaDireita);
	if instance_exists(menuSetaEsquerda)		instance_destroy(menuSetaEsquerda);
	if instance_exists(menuClose)				instance_destroy(menuClose);
	if instance_exists(statusWindowMenu)		instance_destroy(statusWindowMenu);
	if instance_exists(bgSkill)					instance_destroy(bgSkill);
	if instance_exists(bgSkillDesc)				instance_destroy(bgSkillDesc);
	if instance_exists(bgStatus)				instance_destroy(bgStatus);
	if instance_exists(objLevelUP)				instance_destroy(objLevelUP);
	if instance_exists(skillSlot)				instance_destroy(skillSlot);
	if instance_exists(SkillKeyboardQ)			instance_destroy(SkillKeyboardQ);
	if instance_exists(SkillKeyboardF)			instance_destroy(SkillKeyboardF);
	if instance_exists(SkillKeyboardR)			instance_destroy(SkillKeyboardR);
	if instance_exists(SkillKeyboardE)			instance_destroy(SkillKeyboardE);
	if instance_exists(ShortcutSkill)			instance_destroy(ShortcutSkill);
	if instance_exists(menuSetaDireitaSkill)	instance_destroy(menuSetaDireitaSkill);
	if instance_exists(menuSetaEsquerdaSkill)	instance_destroy(menuSetaEsquerdaSkill);
	if instance_exists(equipInvWindow)			instance_destroy(equipInvWindow);
	if instance_exists(equipWindowMenu)			instance_destroy(equipWindowMenu);
	if instance_exists(equipSlot)				instance_destroy(equipSlot);
	if instance_exists(equipStatus)				instance_destroy(equipStatus);
	if instance_exists(equipInv)				instance_destroy(equipInv);
	if instance_exists(equipDescription)		instance_destroy(equipDescription);
	if instance_exists(menuSetaDireitaEquip)	instance_destroy(menuSetaDireitaEquip);
	if instance_exists(menuSetaEsquerdaEquip)	instance_destroy(menuSetaEsquerdaEquip);
	if instance_exists(equipUnequip)			instance_destroy(equipUnequip);
	if instance_exists(bestiaryMenu)			instance_destroy(bestiaryMenu);
	if instance_exists(BestiaryWindowMenu)		instance_destroy(BestiaryWindowMenu);
	var inst = menuDesequipar					if instance_exists(inst)			instance_destroy(inst);
	var inst = button_configs					if instance_exists(inst)			instance_destroy(inst);
	var inst = configManager					if instance_exists(inst)			instance_destroy(inst);
	var inst = Options							if instance_exists(inst)			instance_destroy(inst);
	var inst = object_change_player				if instance_exists(inst)			instance_destroy(inst);
	global.menu.skillclicked = noone;
}
	
function reload_menu(){
	if instance_exists(bgSkill)					instance_destroy(bgSkill);
	if instance_exists(bgSkillDesc)				instance_destroy(bgSkillDesc);
	if instance_exists(statusWindowMenu)		instance_destroy(statusWindowMenu);
	if instance_exists(skillSlot)				instance_destroy(skillSlot);
	if instance_exists(SkillKeyboardQ)			instance_destroy(SkillKeyboardQ);
	if instance_exists(SkillKeyboardF)			instance_destroy(SkillKeyboardF);
	if instance_exists(SkillKeyboardR)			instance_destroy(SkillKeyboardR);
	if instance_exists(SkillKeyboardE)			instance_destroy(SkillKeyboardE);
	if instance_exists(ShortcutSkill)			instance_destroy(ShortcutSkill);
	if instance_exists(skillWindowMenu)			instance_destroy(skillWindowMenu);
	if instance_exists(menuSetaDireitaSkill)	instance_destroy(menuSetaDireitaSkill);
	if instance_exists(menuSetaEsquerdaSkill)	instance_destroy(menuSetaEsquerdaSkill);
	if instance_exists(itemSlots)				instance_destroy(itemSlots);
	if instance_exists(menuPlayer)				instance_destroy(menuPlayer);
	if instance_exists(bgInv)					instance_destroy(bgInv);
	if instance_exists(equipSlot)				instance_destroy(equipSlot);
	if instance_exists(equipInvWindow)			instance_destroy(equipInvWindow);
	if instance_exists(itemWindowMenu)			instance_destroy(itemWindowMenu);
	if instance_exists(skillWindowMenu)			instance_destroy(skillWindowMenu);
	if instance_exists(statusWindowMenu)		instance_destroy(statusWindowMenu);
	var inst = menuSetaEsquerdaEquip			if instance_exists(inst)			instance_destroy(inst);
	var inst = menuSetaDireitaEquip				if instance_exists(inst)			instance_destroy(inst);
	var inst = menuDesequipar					if instance_exists(inst)			instance_destroy(inst);
	var inst = button_configs					if instance_exists(inst)			instance_destroy(inst);
	var inst = configManager					if instance_exists(inst)			instance_destroy(inst);
	global.menu.skillclicked = noone;		
}

function refresh_equip_menu(){
	if instance_exists(equipSlot)				instance_destroy(equipSlot);
	if instance_exists(equipInvWindow)			instance_destroy(equipInvWindow);
	var inst = menuSetaEsquerdaEquip			if instance_exists(inst)			instance_destroy(inst);
	var inst = menuSetaDireitaEquip				if instance_exists(inst)			instance_destroy(inst);
	var inst = menuDesequipar					if instance_exists(inst)			instance_destroy(inst);
	instance_create_depth(x,y,-1,equipInvWindow);
}

function refresh_item_menu(){
	if instance_exists(itemWindowMenu)			instance_destroy(itemWindowMenu);
	if instance_exists(itemSlots)				instance_destroy(itemSlots);
	if instance_exists(menuPlayer)				instance_destroy(menuPlayer);
	if instance_exists(bgInv)					instance_destroy(bgInv);
	if instance_exists(menuSetaDireita)			instance_destroy(menuSetaDireita);
	if instance_exists(menuSetaEsquerda)		instance_destroy(menuSetaEsquerda);
	if instance_exists(bgInvDesc)				instance_destroy(bgInvDesc);
	instance_create_depth(x,y,-51,itemWindowMenu);
}

function reload_inventory(){
	close_itens_main_menu()
	instance_create_depth(x,y,-51,itemWindowMenu);
}

function refresh_skill_page(){
	if instance_exists(bgSkill)					instance_destroy(bgSkill);
	if instance_exists(bgSkillDesc)				instance_destroy(bgSkillDesc);
	if instance_exists(skillSlot)				instance_destroy(skillSlot);
	if instance_exists(SkillKeyboardQ)			instance_destroy(SkillKeyboardQ);
	if instance_exists(SkillKeyboardF)			instance_destroy(SkillKeyboardF);
	if instance_exists(SkillKeyboardR)			instance_destroy(SkillKeyboardR);
	if instance_exists(SkillKeyboardE)			instance_destroy(SkillKeyboardE);
	if instance_exists(ShortcutSkill)			instance_destroy(ShortcutSkill);
	if instance_exists(skillWindowMenu)			instance_destroy(skillWindowMenu);
	if instance_exists(menuSetaDireitaSkill)	instance_destroy(menuSetaDireitaSkill);
	if instance_exists(menuSetaEsquerdaSkill)	instance_destroy(menuSetaEsquerdaSkill);
	
	MENU.notspawn = true;
	instance_create_depth(x,y,-1,skillWindowMenu);
	close_itens_menu();
}

function back_main_menu(){
	close_itens_main_menu();
	call_menu();
}
	
function inventory_array_organize(){
	var array = global.inventoryunit;
	var m_inv = global.inventory;
	var arg = 0;
	for(i=0;i<array_length(array);i++){
		if array[i] == 0
		{
			for(j=i;j<array_length(array);j++){
				if array[j] != 0{
					array[i] = array[j];
					array[j] = 0;
					m_inv[i] = m_inv[j]
					m_inv[j] = 0;
					break;
				}				
			}			
		}		
	}	
}
	
function inventory_resize(){
	for(i=0;i<array_length(global.inventoryunit);i++){
		if global.inventoryunit[i] == 0{
			array_resize(global.inventory,i);
			array_resize(global.inventoryunit,i);
		}
	}	
}
	
function get_pages(){
	page_max = (array_length(global.inventoryunit)+1/9);
	if (frac(page_max) > 0)
	{
	    page_max = floor(page_max);
		page_max++;
	}	
}
	
function previous_skill_page(){
	value = global.menu.skillpage;
	if value == 0{
		if global.party.players[2] != -1 {
			global.menu.skillpage = 2;
			refresh_skill_page();			
		}
		else if global.party.players[1] != -1 {
			global.menu.skillpage = 1;
			refresh_skill_page();			
		}
	}
	else if value == 1{	
		if global.party.players[0] != -1 {
			global.menu.skillpage--;
			refresh_skill_page();			
		}
		else if global.party.players[2] != -1 {
			global.menu.skillpage = 2;
			refresh_skill_page();			
		}
	}
	else if value == 2{
		if global.party.players[1] != -1 {
			global.menu.skillpage--;
			refresh_skill_page();			
		}
		else if global.party.players[0] != -1 {
			global.menu.skillpage = 0;
			refresh_skill_page();			
		}
	}			
}

function next_skill_page(){
	//var value = find_value_on_array(global.party.players,global.menu.skillpage);
	value = global.menu.skillpage;
	if value == 0{
		if global.party.players[1] != -1 {
			global.menu.skillpage++;
			refresh_skill_page();			
		}
		else if global.party.players[2] != -1 {
			global.menu.skillpage = 2;
			refresh_skill_page();			
		}
	}
	else if value == 1{
		if global.party.players[2] != -1 {
			global.menu.skillpage++;
			refresh_skill_page();			
		}
		else if global.party.players[0] != -1 {
			global.menu.skillpage = 0;
			refresh_skill_page();			
		}
		
	}
	else if value == 2{
		if global.party.players[0] != -1 {
			global.menu.skillpage = 0;
			refresh_skill_page();			
		}
		else if global.party.players[1] != -1 {
			global.menu.skillpage = 1;
			refresh_skill_page();			
		}
	}	
}

function next_page(value){
	//var value = find_value_on_array(global.party.players,global.menu.skillpage);
	if global.menu.equippage == 0{
		if global.party.players[1] != -1 {
			global.menu.equippage++;
			//refresh_skill_page();			
		}
		else if global.party.players[2] != -1 {
			global.menu.equippage = 2;
			//refresh_skill_page();			
		}
	}
	else if global.menu.equippage == 1{
		if global.party.players[2] != -1 {
			global.menu.equippage++;
			//refresh_skill_page();			
		}
		else if global.party.players[0] != -1 {
			global.menu.equippage = 0;
			//refresh_skill_page();			
		}
		
	}
	else if global.menu.equippage == 2{
		if global.party.players[0] != -1 {
			global.menu.equippage = 0;
			//refresh_skill_page();			
		}
		else if global.party.players[1] != -1 {
			global.menu.equippage = 1;
			//refresh_skill_page();			
		}
	}	
}

function previous_page(value){
	if global.menu.equippage == 0{
		if global.party.players[2] != -1 {
			global.menu.equippage = 2;
			//refresh_skill_page();			
		}
		else if global.party.players[1] != -1 {
			global.menu.equippage = 1;
			//refresh_skill_page();			
		}
	}
	else if global.menu.equippage == 1{	
		if global.party.players[0] != -1 {
			global.menu.equippage--;
			//refresh_skill_page();			
		}
		else if global.party.players[2] != -1 {
			global.menu.equippage = 2;
			//refresh_skill_page();			
		}
	}
	else if global.menu.equippage == 2{
		if global.party.players[1] != -1 {
			global.menu.equippage--;
			//refresh_skill_page();			
		}
		else if global.party.players[0] != -1 {
			global.menu.equippage = 0;
			//refresh_skill_page();			
		}
	}			
}
	
function equip_equipiment(){
	var _equipment = global.player_stats[user].equip[equipid].atribute;
	global.player_stats[user].atack		 += _equipment[0];
	global.player_stats[user].def		 += _equipment[1];
	global.player_stats[user].magic		 += _equipment[2];
	global.player_stats[user].crit		 += _equipment[3];
	global.player_stats[user].evasion	 += _equipment[4];
	global.player_stats[user].hitrate	 += _equipment[5];
	global.player_stats[user].mhp		 += _equipment[6];
	global.player_stats[user].msp		 += _equipment[7];
}

function unequip_equipment(){
	var _equipment = global.player_stats[user].equip[tipe].atribute;
	global.player_stats[user].atack		 -= _equipment[0];
	global.player_stats[user].def		 -= _equipment[1];
	global.player_stats[user].magic		 -= _equipment[2];
	global.player_stats[user].crit		 -= _equipment[3];
	global.player_stats[user].evasion	 -= _equipment[4];
	global.player_stats[user].hitrate	 -= _equipment[5];
	global.player_stats[user].mhp		 -= _equipment[6];
	global.player_stats[user].msp		 -= _equipment[7];
}
	
function draw_hud(){
	if global.config.showhud == true
	{
		if global.config.fullscreen display_set_gui_maximize(1,1)
		sprite_set_live(sGUIbg, true);
		_gratio = GPT_window_ratio();
		_width = global.camera.wwidth * _gratio[0];
		_height = global.camera.wheight * _gratio[1];
		draw_sprite(sGUIbg, 0, _width, _height)
		draw_spiffs();
		draw_text(30,10, fps_real);
		draw_text(120,10, fps);
		for(i=0;i<array_length(global.party.players);i++){
			draw_life(global.party.players[i],i*95);	
		}
	
		reset_display_GUI()
	}
}

function draw_life(player, yy){
	if player != -1 {
		// Defina a porcentagem da variável
		
		var percentage = global.player_stats[player].hp / global.player_stats[player].mhp;
		var percentageshield = global.player_stats[player].hp / global.player_stats[player].mhp;
		var percentagemana = global.player_stats[player].stamina / global.player_stats[player].staminamax;
		var _cur_font = draw_get_font();
		var _cur_allign = draw_get_halign();
		var _cur_vallign = draw_get_valign();
		var _font_comp = -12;
		var _sp_color = #649dd9;
		var _hp_color = #e17575;
		var _hp_base = _hp_color;
		var _shield_color = #ecac2f;
		var _sprite = Sprite246;
		var _guisize = 1;//global.config.guisize;
		//var _gratio = GPT_window_ratio();
		//var _width = global.camera.wwidth * _gratio[0];
		//var _height = global.camera.wheight * _gratio[1];

		// Defina o número de frames do sprite
		var num_frames = 18;
		var mana_num_frames = 6;
		
		// Calcule o índice do frame com base na porcentagem
		if global.player_stats[player].hp > 0 and global.player_stats[player].hp <= global.player_stats[player].mhp {
			_hp_color = _hp_base;
			var frame_index = num_frames - floor(percentage * num_frames);
			spriteindex = _sprite;
		}
		else if global.player_stats[player].hp > global.player_stats[player].mhp {
			_hp_color = _shield_color
			var frame_index = (num_frames - floor(percentageshield * num_frames));
			if frame_index >= -1 frame_index = 18;
			spriteindex = sGUIShield;	
		}
		else {
			_hp_color = _hp_base;
			var frame_index = num_frames;
			spriteindex = _sprite;
		}
		
		if global.player_stats[player].stamina > 0 {
			//sdm(mana_num_frames, percentagemana, (mana_num_frames - floor(percentagemana * mana_num_frames)))
			var mana_frame_index = mana_num_frames - floor(percentagemana * mana_num_frames);
		}
		else if global.player_stats[player].stamina > global.player_stats[player].staminamax {
			var mana_frame_index = 0;
		}
		else if global.player_stats[player].stamina <= 0 {
			mana_frame_index = mana_num_frames;
		}
		else {
			var mana_frame_index = mana_num_frames;
		}
		// Defina o sprite e o frame a serem desenhados
		
		imageindex = frame_index;
		manaspriteindex = sGUIMana;
		manaimageindex = mana_frame_index;
		difference = 0.5
		
			draw_set_font(Varnished);
			draw_set_halign(fa_right);
			draw_set_valign(fa_middle);
		if global.party.players[0] == player {
			
			draw_text_color((_width - 55) - sprite_get_width(spriteindex)/2 + _font_comp,(_height-53)+sprite_get_height(spriteindex)/2+_font_comp*3, "SP: " + string(int64(global.player_stats[player].stamina))+"/"+string(global.player_stats[player].staminamax),_sp_color,_sp_color,_sp_color,_sp_color,1)
			draw_text_color((_width - 55) - sprite_get_width(spriteindex)/2 + _font_comp,(_height-53)+sprite_get_height(spriteindex)/2+_font_comp*2, "HP: " + string(global.player_stats[player].hp)+"/"+string(global.player_stats[player].mhp),_hp_color,_hp_color,_hp_color,_hp_color,1)
			draw_text((_width - 55) - sprite_get_width(spriteindex)/2 + _font_comp,(_height-53)+sprite_get_height(spriteindex)/2+_font_comp, string(global.player_stats[player].nome))
			
			draw_sprite_ext(spriteindex, imageindex, (_width - 55), (_height-53)-yy,_guisize,_guisize,0,c_white,1);
			draw_sprite_ext(manaspriteindex, manaimageindex, (_width - 55), (_height-53)-yy,_guisize,_guisize,0,c_white,1);
			draw_sprite_ext(sGUIPlayer, global.player_stats[player].ind, (_width - 55), (_height-53)-yy,_guisize,_guisize,0,c_white,1);
		}
		else {
			draw_text_color((_width - 55) + _font_comp,(_height-53)+sprite_get_height(spriteindex)/2-yy+_font_comp*2,"SP: " + string(int64(global.player_stats[player].stamina))+"/"+string(global.player_stats[player].staminamax),_sp_color,_sp_color,_sp_color,_sp_color,1)
			draw_text_color((_width - 55) + _font_comp,(_height-53)+sprite_get_height(spriteindex)/2-yy+_font_comp, "HP: " + string(global.player_stats[player].hp)+"/"+string(global.player_stats[player].mhp),_hp_color,_hp_color,_hp_color,_hp_color,1)
			draw_text((_width - 55) + _font_comp,(_height-53)+sprite_get_height(spriteindex)/2-yy, string(global.player_stats[player].nome))
			
			draw_sprite_ext(spriteindex, imageindex, (_width - 55) + sprite_get_width(spriteindex) * difference/2, (_height-53)-yy/(1+difference),(1-difference)*_guisize,(1-difference)*_guisize,0,c_white,0.3);
			draw_sprite_ext(manaspriteindex, manaimageindex, (_width - 55) + sprite_get_width(manaspriteindex) * difference/2, (_height-53)-yy/(1+difference),(1-difference)*_guisize,(1-difference)*_guisize,0,c_white,0.3);
			draw_sprite_ext(sGUIPlayer, global.player_stats[player].ind, (_width - 55) + sprite_get_width(spriteindex) * difference/2, (_height-53)-yy/(1+difference),(1-difference)*_guisize,(1-difference)*_guisize,0,c_white,0.3);
		}
		draw_set_font(_cur_font);
		draw_set_halign(_cur_allign);
		draw_set_valign(_cur_vallign);
		
		
	}// IF do player != -1
}
	
function reset_display_GUI()
{
	if global.config.fullscreen {
			var _getratio = GPT_window_ratio();
			display_set_gui_maximize(_getratio[0],_getratio[1])
		}
	else display_set_gui_maximize(-1,-1)	
}
	
function draw_spiffs(){
	if global.party.captain{
		var _cur_font = draw_get_font();
		var _cur_allign = draw_get_halign();
		var _cur_vallign = draw_get_valign();
		//var _gratio = GPT_window_ratio();
		//var _width = global.camera.wwidth * _gratio[0];
		//var _height = global.camera.wheight * _gratio[1];
		var xx = 50;
		
		draw_sprite(sGUISpiffs,0,xx,(_height-53));
		draw_set_font(Varnished);
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		if global.party.capagressive {
			draw_text(xx + 10 + sprite_get_width(sGUISpiffs)/2, (_height-53), "Agressive Mode");
		} else {
			draw_text(xx + 10 + sprite_get_width(sGUISpiffs)/2, (_height-53), "Pacific Mode");
		}
		
		
		draw_set_font(_cur_font);
		draw_set_halign(_cur_allign);
		draw_set_valign(_cur_vallign);
	}

}
	
function remove_item(qtt = 1, arg = 0){
	var itemoninv = arg;
	global.inventoryunit[itemoninv] -= qtt;
	if global.inventoryunit[itemoninv] <= 0 {
		array_delete(global.inventory,itemoninv,1);
		array_delete(global.inventoryunit,itemoninv,1);
		if variable_instance_exists(id, run_funct)
		{
			run_funct[0] = false;
			run_funct[1] = -4;
		}
		//refresh_item_menu();
	}
}
	
function add_item(item, qtd){
	// Verificar inv
	for(s = 0; s<array_length(global.inv);s++)
	{
		if global.inv[s][0] == -1
		{
			array_delete(global.inv,i,1);	
		}
		else if global.inv[s][0] == item
		{
			global.inv[s][1] += qtd; 	
		}
		else
		{
			var array = [item, qtd]
			array_push(array);
		}
	}
}

function call_options()
{
	//if live_call() return live_result;
		draw_set_alpha(1);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);	
		draw_sprite_ext(Sprite102,0,0,0,2,2,0,c_white,1);
		volumebgm = drawVolumeScrollbar(250, 100, 200, 20, 0, 100, volumebgm, global.language.system.config1, 110);
		volumesfx = drawVolumeScrollbar(250, 150, 200, 20, 0, 100, volumesfx, global.language.system.config2, 110);
		distance = drawVolumeScrollbar(250, 200, 200, 20, 0, 150, distance, global.language.system.config3, 110, "px", global.language.system.desc3);
		bloom = drawVolumeScrollbar(690, 200, 200, 20, 0, 150, bloom, global.language.system.config4, 550, "x");
		global.config.bigobjectspadding = drawVolumeScrollbar(250, 250, 200, 20, 0, 150, global.config.bigobjectspadding, global.language.system.config5, 110, "px", global.language.system.desc5);
		opacity = (drawVolumeScrollbar(250, 300, 200, 20, 10, 100, opacity, global.language.system.config6, 110,"%",global.language.system.desc6));
		global.config.customize.followersOpacity = opacity/100
		global.config.dynamicdist = drawOnOffButton(110, 350, 25, 25, global.language.system.config7, global.config.dynamicdist, 380, 350, global.language.system.desc7);
		global.config.GPU.lightFX = drawOnOffButton(110, 400, 25, 25, global.language.system.config8, global.config.GPU.lightFX, 380, 400);
		global.config.GPU.floorlight = drawOnOffButton(110, 450, 25, 25, global.language.system.config9, global.config.GPU.floorlight, 380, 450);
		global.config.dynamiccamera = drawOnOffButton(110, 500, 25, 25, global.language.system.config10, global.config.dynamiccamera, 380, 500, global.language.system.desc10);
		global.config.GPU.bloom = drawOnOffButton(110, 550, 25, 25, global.language.system.config11, global.config.GPU.bloom, 380, 550);
		global.config.GPU.vhs = drawOnOffButton(110, 600, 25, 25, global.language.system.config12, global.config.GPU.vhs, 380, 600);
		global.config.autoaim = drawOnOffButton(550, 100, 25, 25, global.language.system.config13, global.config.autoaim, 550+270, 100, global.language.system.desc13);
		global.config.fullscreen = drawOnOffButton(550, 150, 25, 25, global.language.system.config14, global.config.fullscreen, 550+270, 150);
		global.config.GPU.wobble = drawOnOffButton(550, 250, 25, 25, global.language.system.config15, global.config.GPU.wobble, 550+270, 250);
		global.config.interaction = drawOnOffButton(550, 350, 25, 25, global.language.system.config16, global.config.interaction, 550+270, 350, global.language.system.desc16);
		
		var array = ["Ingles", "Português", "Espanhol"];
		var _lang = drawLanguageSlider(550,300, "Language: ", array, "idx") // create_language()
		
		
		if !global.config.fullscreen
	    {
	        window_set_fullscreen(false);
			//window_set_caption("O game da galera")
	    }
	    else
	    {
	        window_set_fullscreen(true);
	    }
	
		//if global.config.GPU.bloom
		//{
	
	
		obj_post_processing.ppfx_id.SetEffectEnable(FX_EFFECT.BLOOM, global.config.GPU.bloom);
		obj_post_processing.ppfx_id.SetEffectEnable(FX_EFFECT.VHS, global.config.GPU.vhs);
		obj_post_processing.ppfx_id.SetEffectEnable(FX_EFFECT.VIGNETTE, global.config.GPU.vhs);
		obj_post_processing.ppfx_id.SetEffectEnable(FX_EFFECT.SCANLINES, global.config.GPU.vhs);

		//}PP_BLOOM_INTENSITY

		global.config.view_range_min = 50 + int64(distance*2);
		global.config.view_range_max = 90 + int64(distance*2);

		//sdm(global.config.view_range_min);

		global.config.GPU.bloomintensity = bloom/10

			obj_post_processing.ppfx_id.SetEffectParameter(FX_EFFECT.BLOOM, PP_BLOOM_INTENSITY, global.config.GPU.bloomintensity);
	
		global.config.sound_volume = volumesfx
		global.config.music_volume = volumebgm

		change_audio("BGM1");
		change_audio("SFX");
		config_reset_lfx()
		save_options();
//change_audio("SFX");	
}

function config_reset_lfx(){
	if global.config.GPU.floorlight == false {
			if instance_exists(obj_light_torch2)				instance_deactivate_object(obj_light_torch2);
			if instance_exists(obj_uls_collider2)				instance_deactivate_object(obj_uls_collider2);	
			if instance_exists(obj_uls_controller2)				instance_deactivate_object(obj_uls_controller2);	
			if instance_exists(obj_uls_light2nd)				instance_deactivate_object(obj_uls_light2nd);	
			if instance_exists(obj_light_lamp2)					instance_deactivate_object(obj_light_lamp2);
			if instance_exists(obj_uls_light_renderer2)			instance_deactivate_object(obj_uls_light_renderer2);
			if instance_exists(obj_uls_shadow_renderer2)		instance_deactivate_object(obj_uls_shadow_renderer2);
		}
		if global.config.GPU.floorlight == true {
			instance_activate_object(obj_light_torch2);
			instance_activate_object(obj_uls_collider2);	
			instance_activate_object(obj_uls_controller2);	
			instance_activate_object(obj_uls_light2nd);	
			instance_activate_object(obj_light_lamp2);
			instance_activate_object(obj_uls_light_renderer2);
			instance_activate_object(obj_uls_shadow_renderer2);
		}
		if global.config.GPU.weather == false {
				instance_deactivate_object(_SYS_WEATHER_RAIN);
		}
		if global.config.GPU.weather == true {
				instance_activate_object(_SYS_WEATHER_RAIN);
		}
		if global.config.GPU.lightFX == false {
			if instance_exists(obj_light_torch)					instance_deactivate_object(obj_light_torch);
			if instance_exists(obj_uls_light)					instance_deactivate_object(obj_uls_light);	
			if instance_exists(obj_light_lamp)					instance_deactivate_object(obj_light_lamp);
		}
		if global.config.GPU.lightFX == true {
			instance_activate_object(obj_light_torch);
			instance_activate_object(obj_uls_light);	
			instance_activate_object(obj_light_lamp);
		}	
	
}
