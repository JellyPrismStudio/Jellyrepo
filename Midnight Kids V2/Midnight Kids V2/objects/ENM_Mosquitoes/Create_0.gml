event_inherited();
myid = 3;
create_enemy_stats(myid);
create_directions_variables(x, y, 7, 1, false);
create_pathfinding_variables();

my_spr = global.enemy_stats[myid].sprite;
sprite_index = my_spr;

BATTLE_MIN_RANGE = 120;
BATTLE_MAX_RANGE = 180;
BATTLE_ATACK = 85;
// Range do ataque
BATTLE_MIN_ATACK = BATTLE_ATACK/20;
//OWN_COLOR = choose(c_white,#b2cfed,#bfaedc,#a2b1a3,#787d66, #ee6767);
// Nomes dos sprites que vão ser as direções do jogador

CustomAttack = true;
// Liga o ataque customizado (com animação e stop)
CustomAttackSprite = Mosquitoes_attacking;
// Sprite da animação de ataque
idleGraph = Mosquitoes_walking;

nome = global.language.enemy.mosquitoes;
obj_speed = random_range(global.enemy_stats[myid].spd/2, global.enemy_stats[myid].spd);
idleGraph = Mosquitoes_walking;

image_speed = 1 * obj_speed; 
image_blend = OWN_COLOR;
damaged = false;
d = 5;
targdraw = 0;

battle_create();

alarm_set(11,200);


///