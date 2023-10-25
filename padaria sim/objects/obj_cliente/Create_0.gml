randomize();
sped = 3;
caminho = path_add();
cliente = irandom(6);

nomes = ["Juca", "Joao", "Maria", "Jossoares", "Viniccius13", "Jubscresvauda", "Paulinha"];
idades = ["15", "72", "pi", "178", "28", "45", "-10"];
genero = ["m", "m", "f", "m", "m", "f", "f"];
dinheiro = irandom_range(1, 10);

estado = "comprando";

timer_max = 60;
timer = 0;

item = choose("bolo", "pão", "pão de forma", "presunto", "queijo", noone, noone);
list = ds_list_create();
pos = 0;
collision_rectangle_list(0, 0, room_width, room_height, obj_balcao, false, true, list, false);