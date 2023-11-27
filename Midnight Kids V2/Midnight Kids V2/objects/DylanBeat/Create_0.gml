if live_call() return live_result;

image_alpha = 0.8
deal_damage = true;
super = noone;
mult = 9.5;
sx = x;
sy = y;

crit = global.player_stats[3].crit;
atack = global.player_stats[3].atack;
hitrate = global.player_stats[3].hitrate

IDS = [];
atack = global.player_stats[3].magic
heal = false;
alarm_set(0,50);


/*

///////////////////

// Disable default drawing of application_surface, so we have full control of the final rendering.
// Only call this once. This will work to the rest of the game.
application_surface_draw_enable(false);


// create post-processing system id to be used by the other functions
ppfx_id = new PPFX_System();

// create profile with some effects
var _profile = new PPFX_Profile("Shockwaves", [
	new FX_Shockwaves(true, 0.1, 0.2, sprite_get_texture(__spr_ppf_prism_lut_gp, 0)),
	//new FX_LUT(true, sprite_get_texture(spr_lut_test_0, 0), 1),
	//new FX_DisplaceMap(true, 0.1, 20, 0.01, 270, sprite_get_texture(__spr_ppf_water_normal, 0)),
	//new FX_ChromaticAberration(true, 2, 35)
	
]);






ppfx_id = obj_post_processing.ppfx_id;


// load profile
ppfx_id.ProfileLoad(_profile);

// init shockwaves distortion surface
shockwaves_renderer_id = new PPFX_ShockwaveRenderer();
shockwaves_renderer_id.AddObject(__obj_ppf_shockwave2);

//ppfx_id = obj_post_processing.ppfx_id;



////////// STEP
*/
if !layer_exists("PostFX") layer_create(0, "PostFX")
shockwave_instance_create(x,y, "PostFX", 4, 1.5, 1.4, __obj_ppf_shockwave2);
