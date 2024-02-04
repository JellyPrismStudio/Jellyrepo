// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function _SCR_INITIALIZE(){
global.lang = "EN";
create_language();

create_materials();
create_itens_database();
create_equipments();
create_player_skills();
create_skill_database();
create_triggers();
create_sound_database();
create_enemy_database();


#region Global Settings (Variables)
	global.devmode = true;
	global.debug = {
		debugshow: false,
		objects: true,
		objinspect: 0,
		colors: false,	
		draws: false,
		ghosting: false,
		noclip: false,
	}
	global.config = {
		autoaim: true,
	    autocamera: false,
	    bigobjectspadding: 150,
	    directory: working_directory,
	    dynamiccamera: true,
	    dynamicdist: true,
	    fullscreen: false,
	    graphics: {
	        message_sprite: spr_BubbleSpeech
	    },
		camera_width: 1280,
		camera_height: 720,
	    guisize: 5,
		interaction: true,
	    music_volume: 100,
	    playeropacity: 0.7,
	    showhud: true,
	    sound_volume: 1,
	    targetcolor: #70174f,
	    targetname: true,
	    textcolor: #2a1c05,
	    view_range_max: 90,
	    view_range_min: 50,
		customize: {
			followersOpacity: 0.6,	
		},
		GPU:	{
			bloom: true,
			bloomintensity: 0.8,
			vhs: true,
			wobble: false,
			floorlight: true,
			weather: true,
			highFPS: false,
			lightFX: true,
			lightparticles: true,
			renderoffscreen: false,
		}
	}
	global.intern = {
		blockall: false,
		event: noone,
		enemyover: [noone,0],
		lastClickTime: -1,
		doubleClickDetected: false,
		////////////////////////////////
		////////////////////////////////
		firstmap: rJunkyard0,
		firstx: 400,
		firsty: 495,
		////////////////////////////////
		///////////////////////////////
		
		depths : {
			  over: -12000,
			 light: -10800,
			  menu: -10600,
			 setup: -10100,
			   msg: -11150,
			system: -10250,
		   weather: -10300,
			bellow:  12000,
		},
		
		effect : {
			rainparticle: 0,
		},
		procedural : {
			charactersmax : 52,	
			range: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
		},
		
	}
	global.cutscene = {
		priority: false,	
		
	}
	global.cleanfade = false;
	global.onmenu = false;
	global.on_popup = false;
	global.on_message = false;
	global.on_build = false;
	global.can_move = true;
	global.menuenabled = false;
	global.party = {
		players: [-1, -1],	
	}
	global.party = {
		ultimate: 0,
		players: [1, 2],
		captain: true,
		capagressive: false,
		follow: true,	
		playersobj: [playerB, playerHanna],
		isVisible: true,
		followersVisible: true,
	}

	global.player = asset_get_index(object_get_name(global.party.playersobj[0]));
	global.mainplayer = oMainPlayer;
	global.player_index = global.party.players[0];
	//////
	
	global.camera = {
		focus: global.player,	
		wwidth: 1280,
		wheight: 720,
		width: 640,
		height: 360,
		padding: 150,
		ratio: 2,
	};
	
	global.menu = {
		skillclicked: noone,	
		skillhovering: false,
		skillpage: global.player_index,
		equippage: 0,
		equipinventory: 0,
		equipuser: 0,
		equiphover: -1,
		bestiary: [0,1,2,3,4			],
	}
	
	//// INVENTORY ///
	
	global.inventory = [
		global.itens.POTION_SMALL, global.materials.SLIME, global.materials.FUR, global.materials.SHEET, 
		global.equipment.CRAFTARMOR1, global.equipment.ARMOR2, global.equipment.ARMOR3, global.equipment.ARMOR4,
		global.materials.CLOVER, global.materials.ANTENNA, global.materials.SHARPSTONE, global.itens.FEATHER_SIMPLE,
		global.itens.HERB1, global.itens.COIN,
		
	]
	global.inventoryunit = [
		3, 3, 5, 7, 
		1, 1, 1, 1, 
		20, 19, 40, 7,
		15, 15, 
	]
	global.gold = 1000;
	
	/// SAVE ///
	
	global.save = {
		debug: global.debug,
		inventory: global.inventory,
		units: global.inventoryunit,			
	};
	
	/// SOUND PLAYER ///
	
	global.sounds = {
		BGM1: noone,	
		BGM2: noone,
		BGM3: noone,
		SFX0: noone,
	}
	
	create_triggers();
	
	/// BASE ///
	global.base = [
		[xMagazineShelf, 100, 200],
	]
	global.furniture = [
		[furnitureBox, 1],
		[furnitureBox, 1],
		[furniturePlant, 1],
		[furniturePlant2, 1],
		[furniturePlant3, 1],
		[furnitureSit, 1],
		[furnitureSit, 1],
		[furnitureRadio, 1],
	]
	global.baseGUI = false;
	
	
	
	
#endregion	
	
	///
	
	battle_set_stats(0,80,20,15,4,0);
	// global.player_stats (name, mhp, msp, atack, magic, crit, xp, hitrate, evasion)

	
	var SystemManagementLog;	
	SystemManagementLog = file_text_open_write("G:/Meu Drive/- PROJETOS/Midnight Kids Game/Midnight Kids/data/" + "SystemManagementLog.ini");
	file_text_write_string(SystemManagementLog, "===== JOGO INICIADO =====\n");
	file_text_close(SystemManagementLog);
	
	
}