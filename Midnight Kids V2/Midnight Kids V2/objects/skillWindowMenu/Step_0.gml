/// @description Insert description here
party = global.party.players[global.menu.skillpage];
if position_meeting(mouse_x,mouse_y,skillSlot){
	var col = position_meeting(mouse_x,mouse_y,skillSlot);
	if col != global.menu.skillclicked global.menu.skillhovering = true;
	
}
else {
	global.menu.skillhovering = false;
}
// You can write your code in this editor




