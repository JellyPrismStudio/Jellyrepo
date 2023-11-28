// Instanciando variaveis para o draw:
//if live_call() return live_result;
spacing = 40;
init_x = 320;
init_y = 100;
width = 600;
height = 38;
slots = 10;
slots = slots+2;
itens = [
    "0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
    "A", "B", "C", "D", "E", "F", "G", "H", "I", "J",
    "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T",
    "U", "V", "W", "X", "Y", "Z",
    "a", "b", "c", "d", "e", "f", "g", "h", "i", "j",
    "k", "l", "m", "n", "o", "p", "q", "r", "s", "t",
    "u", "v", "w", "x", "y", "z"
];

//
page = 2;
pagemax = 4;
pagemin = 0;

//
selected = []
for(a = 0; a<slots-1; a++)
{
	array_push(selected, itens[a + page*(slots-2)])
}