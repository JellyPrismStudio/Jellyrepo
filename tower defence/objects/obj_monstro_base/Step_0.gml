if (create == 0)
{
	create = 1;
	sped *= global.sped/3+1;
	dano *= global.strenght/3+1;
}

main = function()
{
	f_movimento();
	f_tiro();
	f_dano();
	f_gold();
}

main();