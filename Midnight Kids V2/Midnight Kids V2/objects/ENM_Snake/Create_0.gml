event_inherited();
myid = 0;
create_enemy_stats(myid);
create_directions_variables(x, y, 7, 1, false);
create_pathfinding_variables();

BATTLE_MIN_RANGE = 110;
BATTLE_MAX_RANGE = 230;
BATTLE_ATACK = 40;
// Range do ataque
BATTLE_MIN_ATACK = BATTLE_ATACK/2;

OWN_COLOR = choose(c_white,#b2cfed,#bfaedc,#a2b1a3,#787d66, #ee6767);

//	

DirectionableIndexes = [BlueSnake_Idle, BlueSnake_Walking, BlueSnake_WalkingInv, BlueSnake_Walking, BlueSnake_WalkingInv, BlueSnake_Walking, BlueSnake_Walking, BlueSnake_WalkingInv, BlueSnake_WalkingInv, BlueSnake_IdleInv];
// Nomes dos sprites que vão ser as direções do jogador

Skills = [
	global.BATTLE_SKILLS.GENERAL.NOTHING, global.BATTLE_SKILLS.GENERAL.REST
];
// Skill Melee

SkillChance = [
	50, 30,
];
// Skill Chance

//////////////////////////////////////////////////////

SkillsRanged = [
	global.BATTLE_SKILLS.GENERAL.CUSPIR_ACIDO,
];
// Skil Ranged

SkillRangedChance = [
	100,
];

SkillFrequencyMax = 50
SkillFrequency = 10;



nome = global.language.enemy.snake;
obj_speed = random_range(global.enemy_stats[myid].spd/1.2, global.enemy_stats[myid].spd);

image_speed = 1 * obj_speed; 
image_blend = OWN_COLOR;

battle_create();