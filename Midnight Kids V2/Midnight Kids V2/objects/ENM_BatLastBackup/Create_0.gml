event_inherited();
create_enemy_stats(2);
create_directions_variables(x, y, 7, 1, false);
create_pathfinding_variables();

ALARM_ATTACK = 60;
ALARM_DEFINE = false;
ANIMATION_COOLDOWN = 0;
ANIMATION_TRIGGER = false;
ANIMATION_ID = 0;
BATTLE_RANGE = 250;
BATTLE_AUX1 = BATTLE_RANGE;
BATTLE_ATACK = 30;
BATTLE_AUX2 = BATTLE_ATACK;
PATHING_COOLDOWN = 0;
PATHING_TRIGGER = false;
RUNNING_SKILL = false;
OWN_COLOR = choose(c_white,#b2cfed,#bfaedc,#a2b1a3,#787d66, #ee6767);

SKILLS = [
	global.BATTLE_SKILLS.BAT.ATAQUE_AEREO,
];
_SKILL_MAX = array_length(SKILLS);
SKILLS_RANGED = [
	global.BATTLE_SKILLS.GENERAL.NOTHING,
];
_SKILL_RANGED_MAX = array_length(SKILLS_RANGED);




DirectionableIndexes = [Bat_2, Bat_2, Bat_2, Bat_2, Bat_2, Bat_2, Bat_2, Bat_2, Bat_2, Bat_2];
// Nomes dos sprites que vão ser as direções do jogador

nome = global.language.enemy.bat;
obj_speed = random_range(0.9, 1.8);

image_speed = 1 * obj_speed; 
image_blend = OWN_COLOR;
damaged = false;
d = 5;
targdraw = 0;

battle_create();