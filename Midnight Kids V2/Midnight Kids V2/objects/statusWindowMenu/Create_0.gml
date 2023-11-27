/// @description Insert description here
bg = instance_create_layer(object_viewport.x,object_viewport.y,"Menu", bgStatus);
nm = 0;
ocw = object_viewport.x + 50;
och = object_viewport.y + 5;

free = count_on_array(global.party.players, -1);
space = 3 - free;

// 215, 310
//bc = instance_create_layer(object_viewport.x + 108,object_viewport.y - 155,"Menu", menuClose);

for(i=0;i<space;i++){
	n = i;
	lup1 = instance_create_layer(ocw - 60,(och- 95+nm),"Menu", objLevelUP);
	lup1.atribute = "ATK";
	lup1.i = i
	lup2 = instance_create_layer(ocw - 60,(och- 85+nm),"Menu", objLevelUP);
	lup2.atribute = "DEF";
	lup2.i = i
	lup3 = instance_create_layer(ocw - 60,(och- 75+nm),"Menu", objLevelUP);
	lup3.atribute = "HIT";
	lup3.i = i
	lup4 = instance_create_layer(ocw	  ,(och- 95+nm),"Menu", objLevelUP);
	lup4.atribute = "MAG";
	lup4.i = i
	lup5 = instance_create_layer(ocw	  ,(och- 85+nm),"Menu", objLevelUP);
	lup5.atribute = "CRI";
	lup5.i = i
	lup6 = instance_create_layer(ocw      ,(och- 75+nm),"Menu", objLevelUP);
	lup6.atribute = "EVA";
	lup6.i = i
	lup7 = instance_create_layer(ocw	  ,(och- 120+nm),"Menu", objLevelUP);
	lup7.atribute = "SP";
	lup7.i = i;
	lup8 = instance_create_layer(ocw - 60 ,(och- 120+nm),"Menu", objLevelUP);
	lup8.atribute = "HP";
	lup8.i = i;
	nm += 95;
}
// You can write your code in this editor



