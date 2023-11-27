function create_sound_database(){
	global.sounddb = {
		menupop1: Popup1,
		menupop2: Popup2,
		menuclose1: Close1,
	}	
}

function sound_region(maxdistance, _audio){
	xx = (global.player.x - x);
	yy = (global.player.y - y);
	sound = sqrt(	power(xx,2) + power(yy,2)	)
	volume = sound / maxdistance;
	volume = -volume + 1;
	sdm(volume);
	volume = volume/10 * global.config.sound_volume;	
	audio_sound_gain(_audio,volume,1)
}