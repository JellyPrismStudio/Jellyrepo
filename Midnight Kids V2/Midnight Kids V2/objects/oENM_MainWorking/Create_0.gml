create_enemy_stats(0);
create_directions_variables(x, y, 7, 1, false);
create_pathfinding_variables();
ALARM_ATTACK = 60;
ALARM_DEFINE = false;
ANIMATION_COOLDOWN = 0;
ANIMATION_TRIGGER = false;
ANIMATION_ID = 0;
BATTLE_RANGE = 130;
BATTLE_AUX1 = BATTLE_RANGE;
BATTLE_ATACK = 40;
BATTLE_AUX2 = BATTLE_ATACK;
PATHING_COOLDOWN = 0;
PATHING_TRIGGER = false;
RUNNING_SKILL = false;
spr_index = sprite_index;
OWN_COLOR = choose(c_white,#b2cfed,#bfaedc,#a2b1a3,#787d66, #ee6767);
SKILL_FREQUENCY = 30 // %

SKILLS = [
	global.BATTLE_SKILLS.FROG.AUMENTAR_VELOCIDADE,
];
_SKILL_MAX = array_length(SKILLS);
SKILLS_RANGED = [
	global.BATTLE_SKILLS.GENERAL.NOTHING,
];
_SKILL_RANGED_MAX = array_length(SKILLS_RANGED);
SKILL_COOLDOWN = 5;
SKILL_COOLDOWNLING = false;


DirectionableIndexes = [Frog_Idle, Frog_Walking, Frog_WalkingInv, Frog_Walking, Frog_WalkingInv, Frog_Walking, Frog_Walking, Frog_WalkingInv, Frog_WalkingInv, Frog_IdleInv];
// Nomes dos sprites que vão ser as direções do jogador

nome = "";
obj_speed = random_range(0.6, 1.1);

image_speed = 1 * obj_speed; 
image_blend = OWN_COLOR;
damaged = false;
d = 5;
targdraw = 0;

battle_create();