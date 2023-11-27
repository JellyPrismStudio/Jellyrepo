event_inherited();
myid = 2;
create_enemy_stats(myid);
create_directions_variables(x, y, 7, 1, false);
create_pathfinding_variables();

BATTLE_MIN_RANGE = 100;
BATTLE_MAX_RANGE = 200;
BATTLE_ATACK = 50;
// Range do ataque
BATTLE_MIN_ATACK = BATTLE_ATACK/2;

OWN_COLOR = choose(c_white,#b2cfed,#bfaedc,#a2b1a3,#787d66, #ee6767);

DirectionableIndexes = [Bat_2, Bat_2, Bat_2, Bat_2, Bat_2, Bat_2, Bat_2, Bat_2, Bat_2, Bat_2];
// Nomes dos sprites que vão ser as direções do jogador

nome = global.language.enemy.bat;
obj_speed = random_range(global.enemy_stats[myid].spd/1.2, global.enemy_stats[myid].spd);

image_speed = 1 * obj_speed; 
image_blend = OWN_COLOR;

battle_create();