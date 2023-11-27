myid = 0
on_view_range = false;
damage_type = 1;
target_x = x;
target_y = y;
get_player = -1;
// Bool para ver se está no range de visão
damageid = [];
atacktype = "melee";
atackprojectile = noone;
alarm_setted = [false, false, false];
is_on_view = on_view();
alarm_set(4,10);
// Alarme setado? (do Pathfinding, necessário para não atualizar a cada frame)

create_enemy_stats(myid);
create_directions_variables(x, y, 7, 1, false);
create_pathfinding_variables();

stateruntime = 0;
// contador do statemachine

_BATTLE_BUFF = 
[
["", 0, -1],
["", 0, -1],
]



BATTLE_MIN_RANGE = 65;
// Minimo do range de batalha, ou seja, o range quando está idle

BATTLE_MAX_RANGE = 130;
// Maximo do range de batalha, ou seja, quando está triggered

BATTLE_RANGE = BATTLE_MIN_RANGE;
// Setar os inimigos para 'calmos' ao serem criados

Dynamic_Range = true;

VIEW_RANGE = BATTLE_MAX_RANGE// + BATTLE_MAX_RANGE/2;
VIEW_BASIC = BATTLE_MAX_RANGE// + BATTLE_MAX_RANGE/2;

BATTLE_ATACK = 40;
// Range do ataque
BATTLE_BASIC = 0;
// Deixa o range um pouco dinamico (Room Start)

OLD_X = x;
OLD_Y = y;

BATTLE_MIN_ATACK = BATTLE_ATACK/3;

on_attack_range = false;
// Se está no range de ataque

on_view_range = false;
// Se está no range da visão

spr_index = sprite_index;
// Sprite index do inimigo (IDLE)

spr_aux = false;
// Bool para verificação do sprite especial (skill)

range_alarm_aux = false;
// Alarme para resetar a _RANGE_MAX e _MIN

spr_attack_aux = false;
// Bool para verificação do sprite de ataque

attack_aux = false;
// Bool para verificação de métodos de ataque

OWN_COLOR = choose(c_white,#b2cfed,#bfaedc,#a2b1a3,#787d66,#ee6767);
// Cores

attacked = false;
// Bool para verificar se o inimigo foi atacado ou não

attacked_aux = false;
// Bool para ativação da attacked

new_wait = false;
// Variável que define se o inimigo vai esperar antes de andar de novo quando não estiver com range em alguem (rotina)

new_wait_rangemax = 500;
// Define o valor máximo que o inimigo vai esperar antes de andar de novo

new_wait_rangemin = 0;
// Define o valor minimo que o inimigo vai esperar antes de andar de novo

new_attack_cooldown = 100;
// Define o tempo do Cooldown do ataque (DPS)

attack_cooldown = 60;
new_choose_skill = false;

aim_target = global.player;
// Variável para triggar a seleção de skill.

new_on_range = false;
// Saiu e entrou do range?

enter_on_range = 0;

unstopable = false;

new_on_attack_range = false;
// Saiu e entrou no range de ataque?

force_stop = false;
// Força o inimigo a parar todos os movimentos, incluindo o de andar. Util para congelar 
// Essa variavel está sendo usada primordialmente nas skills. Para forçar completamente, use o 
// Grant_stop logo abaixo

force_pacify = false;
// Deixa ele pacifico

lock_direction = false;

deactivate_range = false;

grant_stop = false;
// GARANTE que o evento vá parar. O Force_stop é constantemente resetado devido as rotinas.

force_ignore = false;
// Força o inimigo a ignorar o player e andar por ai, caso queira.

loot = global.enemy_stats[myid].loot;
// Loot list

rdrg = -1;
// RDRG é para o loot

Skills = [
	global.BATTLE_SKILLS.GENERAL.NOTHING, global.BATTLE_SKILLS.GENERAL.REST
];
// Skill Melee

SkillChance = [
	80, 20
];
// Skill Chance

SkillsRanged = [
	global.BATTLE_SKILLS.GENERAL.NOTHING, global.BATTLE_SKILLS.GENERAL.REST
];
// Skil Ranged

SkillRangedChance = [
	50, 50,
];
// Skill Ranged Chance

on_skill = false;
// Verifica se está em uma skill ou não

finished_skill = false;

SkillUsed = 0;
// Skill usada 0: nada 2: ranged 1: melee

CustomAttack = false;
// Tem ataque custom? (bool)

CustomAttackSprite = Frog_Attacking;
// Sprite do ataque custom

CustomAttackSound = false;

Timers = [

];

SkillFrequencyMax = 230

SkillFrequency = irandom_range(SkillFrequencyMax*.85,SkillFrequencyMax*1.15);

stageid = -1;
// stage indexer

stages = [0, 0, 0, 0, 0];
// array que armazena os timers pro casting e pós casting das skills [0 e 2]
// o 1 é a fase de dano

choosedskill = -1;
// Inicializando o RNG que escolhe as skills disponiveis

sort_skill = -1;
// RNG que sorteia a skill entre as disponiveis para usar

taunted = false;
// PRovocado

nome = "";
// Obsoleto

obj_speed = random_range(0.9, 1.3);
// Obsoleto

image_speed = 1 * obj_speed;
// Seta a velocidade do sprite de acordo com a speed do objeto

image_blend = OWN_COLOR;
// Blend das cores

sprite_index = sENM_spritePlaceholder;

damaged = false;
// Damaged effect (red)
d = 0;
// Damaged timer
targdraw = 0;
// If mouse over
_aux_alarm_unstopable = false;
// Auxiliar do Pathfinding para sklls
_aux_x = 0;
_aux_y = 0;

is_on_view = false;
force_range = false;
// Força a mudança de range

#region PRE-CREATE

	create_enemy_stats(myid);
	create_directions_variables(x, y, 7, 1, false);
	create_pathfinding_variables();
	// Id do database (EnemyDatabase), criação dos status (linkando), directions_var (most unused)

	my_spr = global.enemy_stats[myid].sprite;
	sprite_index = my_spr;

	obj_speed = random_range(global.enemy_stats[myid].spd/1.2, global.enemy_stats[myid].spd);

	image_speed = 1 * obj_speed; 
	image_blend = OWN_COLOR;
	nome = global.enemy_stats[myid].nome;

	VIEW_BASIC = VIEW_RANGE;
	BATTLE_RANGE = BATTLE_MIN_RANGE;
	BATTLE_BASIC = BATTLE_ATACK;

#endregion

battle_create();




