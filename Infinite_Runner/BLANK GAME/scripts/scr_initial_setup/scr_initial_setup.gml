// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function initial_setup(){
	global.devmode = true;
	
	if global.devmode
	{
		global.config.directory = "C:/Users/Kauzz/Documents/Jellyfish Studios/Jellyrepo/Infinite_Runner/BLANK GAME/";	
		
	}
	else
	{
		global.config.directory = working_directory			
	}
}
