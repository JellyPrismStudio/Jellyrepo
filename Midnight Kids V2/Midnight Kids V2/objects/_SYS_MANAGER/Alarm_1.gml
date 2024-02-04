// AFTER LOAD
if global.party.players[1] != -1 check_object_and_validate(global.party.playersobj[1],global.party.playersobj[0].x,global.party.playersobj[0].y, true, "Instances");
if global.party.captain == true {
	plus_instance_create_layer(global.player.x,global.player.y,"Instances",oCaptain_Spiffy);
}