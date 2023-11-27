// Instanciando variaveis para o draw:
//if live_call() return live_result;
pause_game();
global.onmenu = true;
cutscene = false;
super = noone;
spacing = 40;
_ggratio = GPT_window_ratio();
if global.config.fullscreen {
	init_x = window_get_width()/4 * _ggratio[0];
}
else init_x = window_get_width()/4; //global.config.camera_width/2;
init_y = 100 * _ggratio[1];
width = 600;
height = 38;
base_x = init_x;
base_y = init_y;
base_width = width;
base_height = height;
slots = int64(10*_ggratio[1]);
slots = slots+2;

itens = [0];
itens = array_concat(itens, global.inventory);
prices = [0];
prices = array_concat(prices, global.inventoryunit);
// Importar o inventário para criar o menu de venda

var size = ceil(array_length(itens) / slots);
if size = 1 size = 0;

//
page = 0;
pagemax = size;
pagemin = 0;

//
selected = []
selectedprices = []
for(a = 0; a<slots-1; a++)
{
	if a + page*(slots-2) < array_length(itens)	{
		array_push(selected, itens[a + page*(slots-2)])
		array_push(selectedprices, prices[a + page*(slots-2)])
	}
	else break
}
// 
purchasing = false;

function clean_quantity(){
	quantity = [];
	for(i=0;i<slots;i++)
	{
		quantity[i] = 2;
	}	
}

clean_quantity();