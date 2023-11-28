#region ------------ ENEMIES  -------------

function create_enemy_stats(_ind){
	nome=		global.enemy_stats[_ind].nome;
	hp=			global.enemy_stats[_ind].hp;
	mhp=		global.enemy_stats[_ind].mhp;
	msp=		global.enemy_stats[_ind].msp;
	atack=		global.enemy_stats[_ind].atack;
	def=		global.enemy_stats[_ind].def;
	magic=		global.enemy_stats[_ind].magic;
	crit=		global.enemy_stats[_ind].crit;
	xp=			global.enemy_stats[_ind].xp;
	hitrate=	global.enemy_stats[_ind].hitrate;
	evasion=	global.enemy_stats[_ind].evasion;
	loot=		global.enemy_stats[_ind].loot;
	lootchnc=	global.enemy_stats[_ind].lootchances;
	enemyid =	global.enemy_stats[_ind].enemyid;
}

function create_enemy_database(){
	global.enemy_stats = [
		{
		// ID 0
		enemyid:	0,
		nome:		global.language.enemy.snake,
		desc:		duplicateSpaces(global.language.enemydesc.snake),
		sprite:		BlueSnake_Idle,
		spd:		2,
		hp:			28,
		mhp:		128,
		msp:		15,
		atack:		6,
		def:		2,
		magic:		6,
		crit:		10,
		xp:			10,
		hitrate:	17,
		evasion:	0,
		loot:		[global.itens.COIN, global.itens.HERB1],
		lootchances:[10,				10],
		pull:		false,
		bonus:		[ 0,0, 0,  0, 0, 0, 0, 0, 0, 0, 0]
		//			spd,hp,mhp,sp,at,df,mg,cr,xp,ht,ev,
		},
		
		{
		// ID 1
		enemyid:	1,
		nome:		global.language.enemy.frog,
		desc:		duplicateSpaces(global.language.enemydesc.frog),
		sprite:		Frog_Walking,
		spd:		1.6,
		hp:			196,
		mhp:		296,
		msp:		13,
		atack:		6,
		def:		5,
		magic:		5,
		crit:		11,
		xp:			12,
		hitrate:	18,
		evasion:	0,
		loot:		[global.itens.COIN, global.itens.HERB1, global.itens.POTION_SMALL],
		lootchances:[90,				10,					0.3],
		pull:		true,
		bonus:		[ 0,0, 0,  0, 0, 0, 0, 0, 0, 0, 0]
		//			spd,hp,mhp,sp,at,df,mg,cr,xp,ht,ev,
		},
		
		{
		// ID 2
		enemyid:	2,
		nome:		global.language.enemy.bat,
		desc:		duplicateSpaces(global.language.enemydesc.bat),
		sprite:		Bat_2,
		spd:		1.8,
		hp:			15,
		mhp:		115,
		msp:		13,
		atack:		5,
		def:		1,
		magic:		5,
		crit:		16,
		xp:			9,
		hitrate:	16,
		evasion:	2,
		loot:		[global.itens.COIN, global.itens.HERB1],
		lootchances:[100,				10],
		pull:		true,
		bonus:		[ 0,0, 0,  0, 0, 0, 0, 0, 0, 0, 0]
		//			spd,hp,mhp,sp,at,df,mg,cr,xp,ht,ev,
		},
		
		{
		// ID 2
		enemyid:	3,
		nome:		global.language.enemy.mosquitoes,
		desc:		duplicateSpaces(global.language.enemydesc.mosquitoes),
		sprite:		Mosquitoes_walking,
		spd:		2.2,
		hp:			65,
		mhp:		165,
		msp:		13,
		atack:		5,
		def:		6,
		magic:		5,
		crit:		19,
		xp:			23,
		hitrate:	19,
		evasion:	3,
		loot:		[global.itens.COIN, global.itens.HERB1],
		lootchances:[100,				10],
		pull:		true,
		bonus:		[ 0,0, 0,  0, 0, 0, 0, 0, 0, 0, 0]
		//			spd,hp,mhp,sp,at,df,mg,cr,xp,ht,ev,
		},
		
		{
		// MOSQUITOS
		enemyid:	4,
		nome:		global.language.enemy.mosquito,
		desc:		duplicateSpaces(global.language.enemydesc.mosquito),
		sprite:		Mosquito_idle,
		spd:		2.4,
		hp:			75,
		mhp:		75,
		msp:		13,
		atack:		6,
		def:		2,
		magic:		5,
		crit:		22,
		xp:			15,
		hitrate:	19,
		evasion:	5,
		loot:		[global.itens.COIN, global.itens.HERB1],
		lootchances:[100,				10],
		pull:		true,
		bonus:		[ 0,0, 0,  0, 0, 0, 0, 0, 0, 0, 0]
		//			spd,hp,mhp,sp,at,df,mg,cr,xp,ht,ev,
		},
		
		{
		// MARIPOSA
		enemyid:	5,
		nome:		global.language.enemy.moth,
		desc:		duplicateSpaces(global.language.enemydesc.moth),
		sprite:		Butterfly_Idle,
		spd:		1.8,
		hp:			16,
		mhp:		116,
		msp:		13,
		atack:		6,
		def:		2,
		magic:		5,
		crit:		22,
		xp:			15,
		hitrate:	19,
		evasion:	4,
		loot:		[global.itens.COIN, global.itens.HERB1],
		lootchances:[100,				90],
		pull:		true,
		bonus:		[ 0,0, 0,  0, 0, 0, 0, 0, 0, 0, 0]
		//			spd,hp,mhp,sp,at,df,mg,cr,xp,ht,ev,
		},
		
		{
		// DUMMY
		enemyid:	6,
		nome:		global.language.enemy.moth,
		desc:		duplicateSpaces(global.language.enemydesc.moth),
		sprite:		Butterfly_Idle,
		spd:		1.7,
		hp:			5100,
		mhp:		21,
		msp:		13,
		atack:		6,
		def:		2,
		magic:		5,
		crit:		22,
		xp:			15,
		hitrate:	19,
		evasion:	-5,
		loot:		[global.itens.COIN, global.itens.HERB1],
		lootchances:[100,				10],
		pull:		true,
		bonus:		[ 0,0, 0,  0, 0, 0, 0, 0, 0, 0, 0]
		//			spd,hp,mhp,sp,at,df,mg,cr,xp,ht,ev,
		},
		
		{
		// ABELHA
		enemyid:	7,
		nome:		global.language.enemy.bee,
		desc:		duplicateSpaces(global.language.enemydesc.bee),
		sprite:		sBee_Idle,
		spd:		2.1,
		hp:			51,
		mhp:		51,
		msp:		13,
		atack:		11,
		def:		2,
		magic:		5,
		crit:		22,
		xp:			15,
		hitrate:	19,
		evasion:	4,
		loot:		[global.itens.COIN, global.itens.HERB1],
		lootchances:[100,				10],
		pull:		true,
		bonus:		[ 0,0, 0,  0, 0, 0, 0, 0, 0, 0, 0]
		//			spd,hp,mhp,sp,at,df,mg,cr,xp,ht,ev,
		},
	]	
}


#endregion