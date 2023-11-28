create_enemy_stats("Slime",320,10,7,4,4,10,10,8,7);
create_directions_variables(x, y, 5, 6, false);
create_pathfinding_variables();
ALARM_ATTACK = 60;
ALARM_DEFINE = false;
ANIMATION_COOLDOWN = 0;
BATTLE_RANGE = 140;
BATTLE_ATACK = 20;
PATHING_COOLDOWN = 0;
PATHING_TRIGGER = false;
OWN_COLOR = choose(c_white,#b2cfed,#bfaedc,#a2b1a3,#787d66, #ee6767);

SKILLS = [
	global.BATTLE_SKILLS.CRITICO_LEVISSIMO,
	//global.BATTLE_SKILLS.CUSPIR_FOGO, 
	//global.BATTLE_SKILLS.CUSPIR_AGUA,
];
_SKILL_MAX = array_length(SKILLS);

DirectionableIndexes = [Frog_Idle, Frog_Walking, Frog_WalkingInv, Frog_Walking, Frog_WalkingInv, Frog_Walking, Frog_Walking, Frog_WalkingInv, Frog_WalkingInv, Frog_IdleInv];
// Nomes dos sprites que vão ser as direções do jogador

obj_speed = random_range(0.7, 1.5);

image_speed = 1 * obj_speed; 
damaged = false;
d = 5;

battle_create();