function __global_object_depths() {
	// Initialise the global array that allows the lookup of the depth of a given object
	// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
	// NOTE: MacroExpansion is used to insert the array initialisation at import time
	gml_pragma( "global", "__global_object_depths()");

	// insert the generated arrays here
	global.__objectDepths[0] = 0; // obj_wall_sandstone_block64
	global.__objectDepths[1] = 0; // obj_wall_graybrick_block64
	global.__objectDepths[2] = 0; // obj_wall_hedge
	global.__objectDepths[3] = 1; // obj_floor_dirt_sq64
	global.__objectDepths[4] = 1; // obj_floor_sq256
	global.__objectDepths[5] = 1; // obj_floor_sandstone_sq64
	global.__objectDepths[6] = 1; // obj_floor_grass_sq64
	global.__objectDepths[7] = 0; // obj_ramp_l64
	global.__objectDepths[8] = 0; // obj_ramp_r64
	global.__objectDepths[9] = 0; // obj_ramp_u64
	global.__objectDepths[10] = 0; // obj_ramp_d64
	global.__objectDepths[11] = -50; // obj_deco1
	global.__objectDepths[12] = -50; // obj_torch
	global.__objectDepths[13] = -50; // obj_bluetorch
	global.__objectDepths[14] = -50; // obj_greentorch
	global.__objectDepths[15] = 0; // obj_shutterdoor_h
	global.__objectDepths[16] = 0; // obj_shutterdoor_v
	global.__objectDepths[17] = 0; // obj_normaldoor_h
	global.__objectDepths[18] = 0; // obj_normaldoor_v
	global.__objectDepths[19] = 0; // obj_door
	global.__objectDepths[20] = 0; // obj_doordestination
	global.__objectDepths[21] = 0; // obj_titlescreen
	global.__objectDepths[22] = -10000; // CONTROL
	global.__objectDepths[23] = 0; // TERRAINCONTROL
	global.__objectDepths[24] = 0; // TERRAINCEILCONTROL
	global.__objectDepths[25] = -1000; // obj_overlay
	global.__objectDepths[26] = -40; // obj_mode7drawingstart
	global.__objectDepths[27] = 0; // obj_player
	global.__objectDepths[28] = 0; // obj_bullet_pistol
	global.__objectDepths[29] = 0; // obj_bullet_machinegun
	global.__objectDepths[30] = 0; // parent_wall
	global.__objectDepths[31] = 0; // parent_camera
	global.__objectDepths[32] = 0; // parent_lightsource
	global.__objectDepths[33] = 0; // parent_active
	global.__objectDepths[34] = 0; // parent_enemy
	global.__objectDepths[35] = 0; // parent_damage
	global.__objectDepths[36] = 0; // parent_item
	global.__objectDepths[37] = 0; // parent_ammo
	global.__objectDepths[38] = 0; // parent_bullet
	global.__objectDepths[39] = 0; // obj_ceyespawn
	global.__objectDepths[40] = -50; // obj_enemy_slime
	global.__objectDepths[41] = 0; // obj_medkit
	global.__objectDepths[42] = 0; // obj_armor
	global.__objectDepths[43] = 0; // obj_ammo_pistol
	global.__objectDepths[44] = 0; // obj_ammo_machinegun
	global.__objectDepths[45] = 0; // obj_anifx


	global.__objectNames[0] = "obj_wall_sandstone_block64";
	global.__objectNames[1] = "obj_wall_graybrick_block64";
	global.__objectNames[2] = "obj_wall_hedge";
	global.__objectNames[3] = "obj_floor_dirt_sq64";
	global.__objectNames[4] = "obj_floor_sq256";
	global.__objectNames[5] = "obj_floor_sandstone_sq64";
	global.__objectNames[6] = "obj_floor_grass_sq64";
	global.__objectNames[7] = "obj_ramp_l64";
	global.__objectNames[8] = "obj_ramp_r64";
	global.__objectNames[9] = "obj_ramp_u64";
	global.__objectNames[10] = "obj_ramp_d64";
	global.__objectNames[11] = "obj_deco1";
	global.__objectNames[12] = "obj_torch";
	global.__objectNames[13] = "obj_bluetorch";
	global.__objectNames[14] = "obj_greentorch";
	global.__objectNames[15] = "obj_shutterdoor_h";
	global.__objectNames[16] = "obj_shutterdoor_v";
	global.__objectNames[17] = "obj_normaldoor_h";
	global.__objectNames[18] = "obj_normaldoor_v";
	global.__objectNames[19] = "obj_door";
	global.__objectNames[20] = "obj_doordestination";
	global.__objectNames[21] = "obj_titlescreen";
	global.__objectNames[22] = "CONTROL";
	global.__objectNames[23] = "TERRAINCONTROL";
	global.__objectNames[24] = "TERRAINCEILCONTROL";
	global.__objectNames[25] = "obj_overlay";
	global.__objectNames[26] = "obj_mode7drawingstart";
	global.__objectNames[27] = "obj_player";
	global.__objectNames[28] = "obj_bullet_pistol";
	global.__objectNames[29] = "obj_bullet_machinegun";
	global.__objectNames[30] = "parent_wall";
	global.__objectNames[31] = "parent_camera";
	global.__objectNames[32] = "parent_lightsource";
	global.__objectNames[33] = "parent_active";
	global.__objectNames[34] = "parent_enemy";
	global.__objectNames[35] = "parent_damage";
	global.__objectNames[36] = "parent_item";
	global.__objectNames[37] = "parent_ammo";
	global.__objectNames[38] = "parent_bullet";
	global.__objectNames[39] = "obj_ceyespawn";
	global.__objectNames[40] = "obj_enemy_slime";
	global.__objectNames[41] = "obj_medkit";
	global.__objectNames[42] = "obj_armor";
	global.__objectNames[43] = "obj_ammo_pistol";
	global.__objectNames[44] = "obj_ammo_machinegun";
	global.__objectNames[45] = "obj_anifx";


	// create another array that has the correct entries
	var len = array_length_1d(global.__objectDepths);
	global.__objectID2Depth = [];
	for( var i=0; i<len; ++i ) {
		var objID = asset_get_index( global.__objectNames[i] );
		if (objID >= 0) {
			global.__objectID2Depth[ objID ] = global.__objectDepths[i];
		} // end if
	} // end for


}
