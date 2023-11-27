/// @description bgm(sfx)
/// @param sfx
function bgm(argument0) {
	if(global.current_bgm <> NONE){
	    if(audio_is_playing(global.current_bgm)){
	        if(global.current_bgm == argument0){
	            exit
	        }
	        audio_stop_sound(global.current_bgm)
	    }
	}
	global.current_bgm = argument0
	if(argument0 <> NONE){
	    audio_play_sound(argument0,1000,true)
	    audio_sound_gain(argument0,1,0)
	}



}
