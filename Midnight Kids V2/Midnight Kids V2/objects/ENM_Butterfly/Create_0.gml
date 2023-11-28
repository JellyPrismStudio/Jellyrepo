event_inherited();
// Herda o ENM_Main

myid = 5;

BATTLE_MIN_RANGE = 135;
BATTLE_MAX_RANGE = 190;
// Range do ataque ranged
BATTLE_ATACK = 55;
// Range do melee
BATTLE_MIN_ATACK = BATTLE_ATACK/2;
// Range do minimo do melee

Dynamic_Range = false;
// True = O RANGED tem vários tamanhos | False = O RANGED é fixo, use o VIEW instead
VIEW_RANGE = BATTLE_MAX_RANGE + BATTLE_MAX_RANGE/2;
// VIEW_RANGE = Range de visão, apenas. Sem ataques, sem skills.

attack_cooldown = 40;

Skills = [
	global.BATTLE_SKILLS.MOTH.POISON, global.BATTLE_SKILLS.MOTH.SPIT,
];
SkillChance = [
	50, 80,
];

SkillsRanged = [
	global.BATTLE_SKILLS.GENERAL.NOTHING, global.BATTLE_SKILLS.MOTH.POISON,  
];

SkillRangedChance = [
	10, 80,
];

SkillFrequencyMax = 60

SkillFrequency = irandom_range(SkillFrequencyMax*.85,SkillFrequencyMax*1.15);

CustomAttack = true;
// Liga o ataque customizado (com animação e stop)
CustomAttackSprite = Butterfly_Attacking;
// Sprite da animação de ataque
idleGraph = Butterfly_Idle;

battle_create();