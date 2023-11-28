/// @description Insert description here
y -= yy;
x += xx;
_alpha -= 0.02;

if _alpha <= 0.09 instance_destroy();
if !sound and super != global.player{
	if dmg != "0" and dmg != "Miss" {
		play_audio("SFX", sfxGetDamage1, 0, 0, global.config.sound_volume)
	}
	else {
		play_audio("SFX", sfxMiss1, 0, 0, global.config.sound_volume)
	}
	sound = true;	
}
// You can write your code in this editor


