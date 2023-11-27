ocw = object_viewport.x;		// Instancias
och = object_viewport.y;
//party = global.party.players[global.menu.skillpage];
cw = global.config.camera_width/2;		// Texto
ch = global.config.camera_height/2;
color_green = #305f41;
color_black = #4b4030;

bl = plus_instance_create_layer(ocw - 20,	och - 120,	"Menu",		menuSetaEsquerdaEquip);
br = plus_instance_create_layer(ocw,		och - 120,	"Menu",		menuSetaDireitaEquip);
//be = plus_instance_create_layer(ocw + 200,	och - 120,	"Menu",		menuClose);

//////
player = global.party.players[0];
//////

_color = c_white;
_title = c_orange;


last_indexer = 0;
invsize = array_length(global.inventory);
set_last_indexer = 0;
draw = true;
array = [0];
array_size = 0;
equip = [];
pageidx = -1;
start = 0;

_COLUMN_MAX = 3;
_ROW_MAX = 5;

page_max = _COLUMN_MAX * _ROW_MAX;
for(i=0;i<invsize;i++){
	if global.inventory[i] != 0 and global.inventory[i] != -4 and global.inventory[i].tipo == "equip"{
		add_on_array(equip,i,0, false);
	}
}

equip_size = array_last(equip);
size = array_length(equip);

row = 1;
column = 0;
yy = 100;

wdw_w = ocw - 204/2 - 28 - 72;
wdw_h = och - 148/2 - 22;

//204 148

for(i=start;i<size;i++){
		//if i > size break;
		var inst = plus_instance_create_layer(wdw_w + (32 * (column + 1)),wdw_h + (32*row),"Menu",equipSlot);
		inst.i = i;
		inst.index = equip[i];
		inst.super = self;
		//draw_text(100 * ((column + 1)*2),yy + (24*row),global.inventory[equip[i]].nome);
		column++;
		if column == _COLUMN_MAX {
			row++;
			column = 0;
		}
		if row > _ROW_MAX {
			draw_text(100 * ((column + 1)*2),yy + (24*row),"Próxima Página");	
			set_last_indexer = i+1;
			break;			
		}
	}
	
bg1 = instance_create_layer(ocw - 140,och	 ,"Menu",equipInv);
bg1.depth += 3;
bg2 = instance_create_layer(ocw + 1,och - 45,"Menu",equipDescription);
bg2.depth += 3;
bg3 = instance_create_layer(ocw + 1,och + 54,"Menu",equipStatus);
bg3.depth += 3;
bg4 = instance_create_layer(ocw + 140,och	 ,"Menu",equipUnequip);
bg4.depth += 3;

function l_create_unequips()
{
	equipfix = 5;
	equip1 = plus_instance_create_layer(ocw + 190,och - 45 - equipfix,"Menu",menuDesequipar);
	equip1.tipe = 0;
	equip2 = plus_instance_create_layer(ocw + 190,och - 15 - equipfix,"Menu",menuDesequipar);
	equip2.tipe = 1;
	equip3 = plus_instance_create_layer(ocw + 190,och + 15 - equipfix,"Menu",menuDesequipar);
	equip3.tipe = 2;
	equip4 = plus_instance_create_layer(ocw + 190,och + 45 - equipfix,"Menu",menuDesequipar);
	equip4.tipe = 3;
	equip5 = plus_instance_create_layer(ocw + 190,och + 75 - equipfix,"Menu",menuDesequipar);
	equip5.tipe = 4;
}

l_create_unequips()