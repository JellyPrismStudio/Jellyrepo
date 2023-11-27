event_inherited();
myid = 1;
create_enemy_stats(myid);
create_directions_variables(x, y, 7, 1, false);
create_pathfinding_variables();



BATTLE_MIN_RANGE = 70;
BATTLE_MAX_RANGE = 140;
BATTLE_ATACK = 55;
// Range do ataque
BATTLE_MIN_ATACK = BATTLE_ATACK/2;
attack_cooldown = 50;

OWN_COLOR = choose(c_white,#f4dbdb,#dcf4db,#dbf2f4,#ace0e5);
// Nomes dos sprites que vão ser as direções do jogador

Skills = [
	global.BATTLE_SKILLS.FROG.ATTACK, global.BATTLE_SKILLS.BUFFS.SPD,
];
SkillChance = [
	100, 80,
];

SkillsRanged = [
	global.BATTLE_SKILLS.GENERAL.NOTHING, global.BATTLE_SKILLS.FROG.SUPERJUMP, global.BATTLE_SKILLS.BUFFS.SPD, global.BATTLE_SKILLS.GENERAL.REST,
];

SkillRangedChance = [
	100, 60, 70, 5,
];

SkillFrequencyMax = 150

SkillFrequency = irandom_range(SkillFrequencyMax*.85,SkillFrequencyMax*1.15);

CustomAttack = true;
// Liga o ataque customizado (com animação e stop)
CustomAttackSprite = Frog_AttackingII;
// Sprite da animação de ataque
idleGraph = Frog_Idle;

nome = global.language.enemy.frog;
obj_speed = random_range(global.enemy_stats[myid].spd/1.2, global.enemy_stats[myid].spd);

image_speed = 1 * obj_speed; 
image_blend = OWN_COLOR;

battle_create();

sdm(atack);