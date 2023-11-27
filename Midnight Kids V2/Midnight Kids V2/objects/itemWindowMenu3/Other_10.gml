if end_i >= invsize-1 end_i = invsize-1;
for(i=lastnumpages[page-1]+1;k<=8;i++){
	// Ao invés do I começar no start_i e ser um valor fixo da array, ele tem que ver
	// QUAL foi o ultimo index da array a ser posicionado, e salvar ele como o próximo inicial.
	if(i>=invsize) or (i<0) break;
	if global.inventoryunit[i] != 0 and global.inventory[i] != -4{
		var object = instance_create_layer(vx+180 + 34*j			,vy+140 + yfix + yyfix + 10,"Menu", itemSlots);
		object.yyfix = yyfix - 20;
		object.indexer = i;
		object.quantity = global.inventoryunit[i];
		object.icon = global.inventory[i].icon;
		object.sprite_index = global.inventory[i].icon;
		object.image_index = global.inventory[i].iconid;
		object.code = global.inventory[i].code;
		object.nome = global.inventory[i].nome;
		object.description = global.inventory[i].text;
		object.effect = global.inventory[i].effect;
		object.arg0 = global.inventory[i].arg0;
		object.arg1 = global.inventory[i].arg1;
		object.effect_text = global.inventory[i].effect_text;
		j++;
		k++;
	}
	if k!= 0 and k % 3 == 0 {
		if global.inventoryunit[i] != 0{
			yfix += 32;
			j = 0;
		}
	}
	lastnumpages[page] = i;	
}
if k==0{
	array_resize(lastnumpages,page-1);
	page_max = page-1;
}


var bg = instance_create_layer(object_viewport.x - 105,object_viewport.y +yyfix,"Menu", bgInv);

var bg2 = instance_create_layer(object_viewport.x + 105,object_viewport.y +yyfix,"Menu", bgInvDesc);

plyr = instance_create_layer(object_viewport.x,object_viewport.y+30 + yyfix,"Menu", menuPlayer);



