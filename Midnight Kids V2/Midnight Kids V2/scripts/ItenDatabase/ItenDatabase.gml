#region ------------ ITENS --------------
function create_itens_database(){
	global.itens = {
		// if global.itens[i]
		// ig global.itens[i].code == 0;
		COIN: 
			{
				itemid: 0,
				nome: global.language.itens.coin1,
				text: global.language.itens.coin1desc,				
				effect_text: global.language.itens.noeffect,
				value: 23,
				tipo: "hidden",
				code: "code_gold_coin",
				worlditem: loot_coins, // Object
				icon: sCoinSack1, // Sprite
				iconid: 4,
				effect: noone, //function
				arg0: 150,
				arg1: "",
				sellable: true,
			},
		
		POTION_SMALL: 
			{
				itemid: 1,
				nome: global.language.itens.potion1,
				text: global.language.itens.potion1desc,
				tipo: "usable",
				effect_text: global.language.itens.potion1effect,
				value: 55,
				code: "code_small_pot",
				worlditem: loot_potion_small_1, // Object
				icon: sItenDatabase, // Sprite
				iconid: 2,
				effect: item_use_potion, //function
				arg0: 50,
				arg1: 1,
				sellable: true,
			},
			
		POTION_MED: 
			{
				itemid: 2,
				nome: global.language.itens.potion2,
				text: global.language.itens.potion2desc,
				tipo: "usable",
				effect_text: global.language.itens.potion2effect,
				value: 135,
				code: "code_medium_pot",
				worlditem: loot_potion_small_1, // Object
				icon: sHealthPotion, // Sprite
				iconid: 0,
				effect: item_use_potion, //function
				arg0: 120,
				arg1: 2,
				sellable: true,
			},
			
			FEATHER_SIMPLE: 
			{
				itemid: 3,
				nome: global.language.itens.feather1,
				text: global.language.itens.feather1desc,
				tipo: "usable",
				effect_text: global.language.itens.feather1effect,
				value: 300,
				code: "code_feather_simple",
				worlditem: loot_feather_simple, // Object
				icon: sFeather, // Sprite
				iconid: 0,
				effect: item_use_feather, //function
				arg0: 1,
				arg1: 3,
				sellable: false,
			},
			
		HERB1: 
			{
				itemid: 4,
				nome: global.language.itens.herb1,
				text: global.language.itens.herb1desc,
				tipo: "usable",
				effect_text: global.language.itens.herb1effect,
				value: 5,
				code: "code_herb_one",
				worlditem: loot_herb_1, // Object
				icon: sHerb1, // Sprite
				iconid: 0,
				effect: item_use_potion, //function
				arg0: 10,
				arg1: 4,
				sellable: true,
			},
	}
}
#endregion

#region ------------------- EQUIPMENTS ------------------
function create_equipments(){
	global.equipment = {
		// if global.itens[i]
		// ig global.itens[i].code == 0;
		CRAFTARMOR1:
		{
			nome: global.language.itens.craftarmorname1,
			text: global.language.itens.craftarmortext1,
			effect_text: global.language.itens.craftarmorefct1,
			equipable: [0,1,2,3,4,5,6],
			value: 0,
			tipo: "craftable",
			equip: 1,
			code: "code_craft_armor_one",
			worlditem: noone, // Object
			icon: sItenDatabase, // Sprite
			iconid: 282,
			effect: noone, //function
			arg0: 150,
			arg1: "",
			sellable: true,
			//			0		1		2		3		4		5		6		7
			atribute:	[00,	5,		00,		05,		10,		00,		300,		00],
			//			atk		def		mag		crit	eva		hit		hp		sp
			recipe: [[global.materials.ANTENNA, 1],
					 [global.materials.FUR, 3]]
			
		},
		
		CRAFTARMOR2:
		{
			nome: global.language.itens.craftarmorname2,
			text: global.language.itens.craftarmortext2,
			effect_text: global.language.itens.craftarmorefct2,
			equipable: [0,1,2,3,4,5,6],
			value: 0,
			tipo: "equip",
			equip: 1,
			code: "code_craft_armor_two",
			worlditem: noone, // Object
			icon: sItenDatabase, // Sprite
			iconid: 283,
			effect: noone, //function
			arg0: 150,
			arg1: "",
			sellable: true,
			//			0		1		2		3		4		5		6		7
			atribute:	[12,	00,		00,		10,		00,		03,		01,		100],
			//			atk		def		mag		crit	eva		hit		hp		sp
			recipe: [[global.materials.FUR, 7],
					 [global.materials.CLOVER, 1]]
			
		},
		
		CRAFTARMOR3:
		{
			nome: global.language.itens.craftarmorname3,
			text: global.language.itens.craftarmortext3,
			effect_text: global.language.itens.craftarmorefct3,
			equipable: [0,1,2,3,4,5,6],
			value: 0,
			tipo: "equip",
			equip: 1,
			code: "code_craft_armor_two",
			worlditem: noone, // Object
			icon: sItenDatabase, // Sprite
			iconid: 286,
			effect: noone, //function
			arg0: 150,
			arg1: "",
			sellable: true,
			//			0		1		2		3		4		5		6		7
			atribute:	[12,	00,		00,		10,		00,		03,		01,		100],
			//			atk		def		mag		crit	eva		hit		hp		sp
			recipe: [[global.materials.SLIME, 3],
					 [global.materials.SHEET, 1]]
			
		},
		
		CRAFTARMOR4:
		{
			nome: global.language.itens.craftarmorname4,
			text: global.language.itens.craftarmortext4,
			effect_text: global.language.itens.craftarmorefct4,
			equipable: [0,1,2,3,4,5,6],
			value: 0,
			tipo: "equip",
			equip: 1,
			code: "code_craft_armor_two",
			worlditem: noone, // Object
			icon: sItenDatabase, // Sprite
			iconid: 291,
			effect: noone, //function
			arg0: 150,
			arg1: "",
			sellable: true,
			//			0		1		2		3		4		5		6		7
			atribute:	[12,	00,		00,		10,		00,		03,		01,		100],
			//			atk		def		mag		crit	eva		hit		hp		sp
			recipe: [[global.materials.SHEET, 7],
					 [global.materials.ANTENNA, 5]]
			
		},
		
		ARMOR1: 
			{
				nome: global.language.itens.armorname1,
				text: global.language.itens.armortext1,
				effect_text: global.language.itens.armorefct1,
				equipable: [0,1,2,3,4,5,6],
				value: 0,
				tipo: "equip",
				equip: 1,
				code: "code_armor_one",
				worlditem: noone, // Object
				icon: sArmor1, // Sprite
				iconid: 0,
				effect: noone, //function
				arg0: 150,
				arg1: "",
				sellable: true,
				//			0		1		2		3		4		5		6		7
				atribute:	[00,	00,		00,		00,		00,		00,		00,		00],
				//			atk		def		mag		crit	eva		hit		hp		sp
			},
		ARMOR2: 
			{
				nome: "Armadura 1",
				text: "Uma armadura fraquinha",
				effect_text: "Recupera 50 de HP",
				equipable: [0,1,2,3,4,5,6],
				value: 0,
				tipo: "equip",
				equip: 1,
				code: "code_armor_two",
				worlditem: noone, // Object
				icon: sArmor1, // Sprite
				iconid: 0,
				effect: noone, //function
				arg0: 150,
				arg1: "",
				sellable: true,
				//			0		1		2		3		4		5		6		7
				atribute:	[05,	03,		09,		00,		00,		-2,		00,		00],
				//			atk		def		mag		crit	eva		hit		hp		sp
			},
		ARMOR3: 
			{
				nome: "Armadura 2",
				text: "Uma armadura",
				effect_text: "Recupera 50 de HP",
				equipable: [0,1,2,3,4,5,6],
				value: 0,
				tipo: "equip",
				equip: 1,
				code: "code_armor_two",
				worlditem: noone, // Object
				icon: sArmor1, // Sprite
				iconid: 0,
				effect: noone, //function
				arg0: 150,
				arg1: "",
				sellable: true,
				//			0		1		2		3		4		5		6		7
				atribute:	[01,	08,		05,		00,		00,		00,		500,		00],
				//			atk		def		mag		crit	eva		hit		hp		sp
			},
		ARMOR4: 
			{
				nome: "Armadura 3",
				text: "Armadura super forte",
				effect_text: "Recupera 50 de HP",
				equipable: [0,1,2,3,4,5,6],
				value: 0,
				tipo: "equip",
				equip: 1,
				code: "code_armor_two",
				worlditem: noone, // Object
				icon: sArmor1, // Sprite
				iconid: 0,
				effect: noone, //function
				arg0: 150,
				arg1: "",
				sellable: true,
				//			0		1		2		3		4		5		6		7
				atribute:	[06,	03,		00,		02,		05,		00,		00,		00],
				//			atk		def		mag		crit	eva		hit		hp		sp
			},
	
	}
	
}
#endregion

function create_materials(){
	global.materials = {
		ANTENNA: 
			{
				nome: global.language.itens.antenna,
				text: global.language.itens.antennadesc,
				effect_text: global.language.itens.noeffect,
				value: 23,
				tipo: "material",
				code: "code_gold_coin",
				worlditem: loot_coins, // Object
				icon: sItenDatabase, // Sprite
				iconid: 125,
				effect: noone, //function
				arg0: 150,
				arg1: "",
				sellable: true,
			},
		
		CLOVER: 
			{
				nome: global.language.itens.clover,
				text: global.language.itens.cloverdesc,
				effect_text: global.language.itens.noeffect,
				value: 23,
				tipo: "material",
				code: "code_gold_coin",
				worlditem: loot_coins, // Object
				icon: sItenDatabase, // Sprite
				iconid: 106,
				effect: noone, //function
				arg0: 150,
				arg1: "",
				sellable: true,
			},	
			
		FUR: 
			{
				nome: global.language.itens.fur,
				text: global.language.itens.furdesc,
				effect_text: global.language.itens.noeffect,
				value: 23,
				tipo: "material",
				code: "code_gold_coin",
				worlditem: loot_coins, // Object
				icon: sItenDatabase, // Sprite
				iconid: 108,
				effect: noone, //function
				arg0: 150,
				arg1: "",
				sellable: true,
			},
			
		SHEET: 
			{
				nome: global.language.itens.sheet,
				text: global.language.itens.sheetdesc,
				effect_text: global.language.itens.noeffect,
				value: 23,
				tipo: "material",
				code: "code_gold_coin",
				worlditem: loot_coins, // Object
				icon: sItenDatabase, // Sprite
				iconid: 155,
				effect: noone, //function
				arg0: 150,
				arg1: "",
				sellable: true,
			},
			
		SHARPSTONE: 
			{
				nome: global.language.itens.sharpstone,
				text: global.language.itens.sharpstonedesc,
				effect_text: global.language.itens.noeffect,
				value: 23,
				tipo: "material",
				code: "code_gold_coin",
				worlditem: loot_coins, // Object
				icon: sItenDatabase, // Sprite
				iconid: 162,
				effect: noone, //function
				arg0: 150,
				arg1: "",
				sellable: true,
			},
			
		SLIME: 
			{
				nome: global.language.itens.slime,
				text: global.language.itens.slimedesc,
				effect_text: global.language.itens.noeffect,
				value: 23,
				tipo: "material",
				code: "code_gold_coin",
				worlditem: loot_coins, // Object
				icon: sItenDatabase, // Sprite
				iconid: 128,
				effect: noone, //function
				arg0: 150,
				arg1: "",
				sellable: true,
			},
			
		
	}
}

#region ------------ ITENS EFFECTS -------


function item_heal(amount = 50, player = global.player_index)
{
	global.player_stats[player].hp += amount;
}

function item_draw_chooses()
{
		var yy1 = -10
		var yy2 = 70
		var _return = -4;
		plus_text_font(global.camera.width + 445, global.camera.height - 105, global.language.menu.useon, c_white, DayDream_pt8,fa_center,fa_top)
		if gui_image_hitbox(global.config.camera_width - 200, global.config.camera_height/2 + yy1, spr_BubbleSpeech, 2, 1)
		{
			draw_sprite_ext(spr_BubbleSpeech,0,global.config.camera_width - 200, global.config.camera_height/2 + yy1, 2, 1, 0, c_white, 1)
			if mouse_check_button_pressed(mb_left)
			{
				_return = 0
			}
		}
		else
		{
			draw_sprite_ext(spr_BubbleSpeech,0,global.config.camera_width - 200, global.config.camera_height/2 + yy1, 2, 1, 0, c_gray, 1)
		}
		plus_text_font(global.config.camera_width - 200, global.config.camera_height/2 -40, global.player_stats[global.party.players[0]].nome, global.config.textcolor, DayDream_pt8);

		if gui_image_hitbox(global.config.camera_width - 200, global.config.camera_height/2 + yy2, spr_BubbleSpeech, 2, 1)
		{
			draw_sprite_ext(spr_BubbleSpeech,0,global.config.camera_width - 200, global.config.camera_height/2 + yy2, 2, 1, 0, c_white, 1)
			if mouse_check_button_pressed(mb_left)
			{
				_return = 1
				
			}
			
		}
		else
		{
			draw_sprite_ext(spr_BubbleSpeech,0,global.config.camera_width - 200, global.config.camera_height/2 + yy2, 2, 1, 0, c_gray, 1)
		}
		plus_text_font(global.config.camera_width - 200, global.config.camera_height/2 +yy2 - 30, global.player_stats[global.party.players[1]].nome, global.config.textcolor, DayDream_pt8);
		if variable_instance_exists(id,"run_funct")
		{
			if _return == 0 or _return == 1 run_funct[5] = true;	
		}
		return _return
}


function item_use_potion(hp = arg0, type = arg1){
		var _p = item_draw_chooses();
		if _p != -4  and run_funct[5] == true
		{
			if global.player_stats[global.party.players[_p]].hp >= global.player_stats[global.party.players[_p]].mhp or global.player_stats[global.party.players[_p]].hp == 0 {
					play_audio("SFX", Sound14, 1, false, 1);
			}
			else {
				global.player_stats[global.party.players[_p]].hp += hp;
				if global.player_stats[global.party.players[_p]].hp > global.player_stats[global.party.players[_p]].mhp {
					global.player_stats[global.party.players[_p]].hp = global.player_stats[global.party.players[_p]].mhp;	
				}
				remove_item(1, run_funct[1])
			}
			if variable_instance_exists(id,"run_funct")
			{
				run_funct[5] = false;	
			}
		}
		
		
}

function item_use_feather(arg = arg0, type = arg1){
	var _p = item_draw_chooses();
	if global.party.players[1] != -1 and run_funct[5] == true
	{
		if global.player_stats[_p].hp <= 0 {
			item_heal(50, _p);
			remove_item(1, run_funct[1])
		}
		
		if variable_instance_exists(id,"run_funct")
			{
				run_funct[5] = false;	
			}
		
	}
	
}
#endregion