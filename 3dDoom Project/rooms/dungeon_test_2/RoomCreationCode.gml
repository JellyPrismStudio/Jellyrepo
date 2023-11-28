global.terrainceil = false
global.terrainfloor= true
global.floortex    = tex_floor_zuma
global.ceiltex     = tex_wall_sandstone

global.level_chunk_width = 2560;
terrain_flat_to_3d()
if(!audio_is_playing(snd_ambience_rain)){audio_play_sound(snd_ambience_rain,100,true)}