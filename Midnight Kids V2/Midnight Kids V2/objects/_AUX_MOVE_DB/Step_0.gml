if live_call() return live_result;
sdm(array_length(data));


if run_next == true
{
	indexes = [];
	for(var i = 0; i < array_length(data); i++)
	{
		sdm(data[i][0]);
		var _bol = false
		// Checando se tem o valor nos indexes já
		for(var j = 0; j < array_length(indexes); j++)
		{			
			if indexes[j][0] == data[i][0] _bol = true
		}
		
		// Caso não tenha, ele é adicionado
		if _bol == false
		{
			if !check_instances_for_variable(_AUX_MOVING, "instanceid", data[i][0]) and data[i][0] != -1
			{
				indexes[array_length(indexes)] = [data[i][0], i];
				instanceaux = instance_create_depth(0,0,0,_AUX_MOVING);			
				instanceaux.dir =			data[i][1];
				instanceaux.spd =			data[i][2];
				instanceaux.length =		data[i][3];
				instanceaux.initsprite =	data[i][4];
				instanceaux._local1 =		data[i][3];
				instanceaux.sprite =		data[i][5];
				instanceaux.instanceid =	data[i][0];
				instanceaux.xdir =			data[i][6];
				instanceaux.lockplayer =	data[i][7]
				instanceaux.arrayid =		i;
				sdm(array_length(data))
			}
			else
			{
				sdm("Já foi instanciado");
			}
			//lista = [];
			//instanceaux.xdir = 2;
			// >>>>>> Creio que aqui deve ser instanciado
		}
		
	}
	sdm(lista, data);
	run_next = false;
}



//sdm(_arr);