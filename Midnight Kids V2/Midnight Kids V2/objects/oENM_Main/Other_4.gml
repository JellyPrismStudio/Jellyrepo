create_directions_variables(x, y, 7, 1, false);
create_pathfinding_variables();
// Id do database (EnemyDatabase), criação dos status (linkando), directions_var (most unused)

my_spr = global.enemy_stats[myid].sprite;
sprite_index = my_spr;

obj_speed = random_range(global.enemy_stats[myid].spd/1.2, global.enemy_stats[myid].spd);

image_speed = 1 * obj_speed; 
image_blend = OWN_COLOR;
nome = global.enemy_stats[myid].nome;

VIEW_BASIC = VIEW_RANGE*2;
BATTLE_RANGE = BATTLE_MIN_RANGE;
BATTLE_BASIC = BATTLE_ATACK;