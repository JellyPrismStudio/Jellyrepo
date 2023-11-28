event_inherited();
myid = 4;
create_enemy_stats(myid);
create_directions_variables(x, y, 7, 1, false);
create_pathfinding_variables();

my_spr = global.enemy_stats[myid].sprite;
sprite_index = my_spr;

BATTLE_MIN_RANGE = 130;
// Range para seguir
BATTLE_MAX_RANGE = 180;
BATTLE_ATACK = 75;
// Range do ataque
BATTLE_MIN_ATACK = BATTLE_ATACK/2;
//OWN_COLOR = choose(c_white,#b2cfed,#bfaedc,#a2b1a3,#787d66, #ee6767);
// Nomes dos sprites que vão ser as direções do jogador
attack_cooldown = 20;

Skills = [
	global.BATTLE_SKILLS.GENERAL.NOTHING, global.BATTLE_SKILLS.GENERAL.REST
];
SkillChance = [
	100, 50,
];

SkillsRanged = [
	global.BATTLE_SKILLS.MOSQUITO.RUSH, global.BATTLE_SKILLS.GENERAL.REST,
];

SkillRangedChance = [
	80, 30,
];
OWN_COLOR = choose(c_white,#f4dbdb,#dcf4db,#dbf2f4,#ace0e5);
CustomAttack = true;
// Liga o ataque customizado (com animação e stop)
CustomAttackSprite = Mosquito_attacking;
// Sprite da animação de ataque
idleGraph = Mosquito_idle;

nome = global.language.enemy.mosquito;
obj_speed = random_range(global.enemy_stats[myid].spd/2, global.enemy_stats[myid].spd);

image_speed = 1 * obj_speed; 
image_blend = OWN_COLOR;

battle_create();