event_inherited();
// Herda o ENM_Main

myid = 7;

atacktype = "ranged";
atackprojectile = BeeProjectile;

BATTLE_MIN_RANGE = 165;
BATTLE_MAX_RANGE = 190;
// Range do ataque ranged
BATTLE_ATACK = 115;
// Range do melee
BATTLE_MIN_ATACK = BATTLE_ATACK/2;
// Range do minimo do melee

Dynamic_Range = false;
// True = O RANGED tem vários tamanhos | False = O RANGED é fixo, use o VIEW instead
VIEW_RANGE = BATTLE_MAX_RANGE + BATTLE_MAX_RANGE/2;
// VIEW_RANGE = Range de visão, apenas. Sem ataques, sem skills.

attack_cooldown = 40;

Skills = [
	global.BATTLE_SKILLS.MOTH.POISON,
];
SkillChance = [
	50,
];

SkillsRanged = [
	global.BATTLE_SKILLS.GENERAL.NOTHING, global.BATTLE_SKILLS.MOTH.POISON,  global.BATTLE_SKILLS.MOTH.SPIT,
];

SkillRangedChance = [
	10, 60, 60,
];

CustomAttack = true;
// Liga o ataque customizado (com animação e stop)
CustomAttackSprite = sBee_Attacking;
// Sprite da animação de ataque
idleGraph = sBee_Idle;

battle_create();