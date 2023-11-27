// Call it only once
application_surface_draw_enable(false);

// Create ppfx system
ppfx_id = new PPFX_System();

// Create profile with all effects
var title = [
    //new FX_Colorize(true, color_get_hue(c_orange), 200, 240),
	new FX_VHS(global.config.GPU.vhs, 0.98, 0.33, 0.00035, 50, 0, 1.3, 0.2, 0.1, 0.3, 0.12, 0.01, 0, 0.05, 1.33, 0),
	new FX_Vignette(global.config.GPU.bloom, 0.56, 0.6, 0.15, 1.1),
	new FX_Bloom(global.config.GPU.bloom, 6, 0.7, 1.2),
	new FX_Shockwaves(global.config.GPU.vhs, 0.1, 0.3, sprite_get_texture(__spr_ppf_prism_lut_gp, 0)),
	new FX_ScanLines(global.config.GPU.vhs, 0.012, 1, 0.3, #ff00aa, 1.8, 0, 1),
	new FX_SunShafts(true),
];
var extern1 = [
    //new FX_Colorize(true, color_get_hue(c_orange), 200, 240),
	new FX_VHS(global.config.GPU.vhs, 0.53, 0.33, 0.00006, 50, 0, 1, 0.2, 0.2, 0.5, 0.12, 0.01, 0, 0.05, 1.33, 0),
	new FX_Vignette(global.config.GPU.bloom, 0.56, 0.6, 0.15, 1.1),
	new FX_Mist(true, 0.5, 0.5, 1, -0.27, 0, 0.8, 1, 0.8, c_white, 1, 0.14),
	new FX_Bloom(global.config.GPU.bloom, 6, 0.7, 0.8),
	new FX_Shockwaves(global.config.GPU.vhs, 0.1, 0.2, sprite_get_texture(__spr_ppf_prism_lut_gp, 0)),
	new FX_ScanLines(global.config.GPU.vhs, 0.008, 1, 0.3, #ff00aa, 1.8, 0, 1)
];
var intern1 = [
    //new FX_Colorize(true, color_get_hue(c_orange), 200, 240),
	new FX_VHS(global.config.GPU.vhs, 0.53, 0.33, 0.00006, 50, 0, 1, 0.2, 0.2, 0.5, 0.12, 0.01, 0, 0.05, 1.33, 0),
	new FX_Vignette(global.config.GPU.bloom, 0.56, 0.6, 0.15, 1.1),
	new FX_Bloom(global.config.GPU.bloom, 6, 0.7, 0.8),
	new FX_Shockwaves(global.config.GPU.vhs, 0.1, 0.2, sprite_get_texture(__spr_ppf_prism_lut_gp, 0)),
	new FX_ScanLines(global.config.GPU.vhs, 0.008, 1, 0.3, #ff00aa, 1.8, 0, 1)
];
main_profile = new PPFX_Profile("PostFX", extern1);
main_interior_profile = new PPFX_Profile("PostFX", intern1);
title_profile = new PPFX_Profile("PostFX", title);

shockwaves_renderer_id = new PPFX_ShockwaveRenderer();
shockwaves_renderer_id.AddObject(__obj_ppf_shockwave2);


// Load profile, so all effects will be used
