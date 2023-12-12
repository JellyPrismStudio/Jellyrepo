draw_set_font(fnt_padrao);

function scr_item(sprite, index, quantidade)
{
	var retrun = false;
	for (var i = 0; i < 7; i++)
	{
		if (obj_player.inventario[0, i] == noone)
		{
			obj_player.inventario[0, i] = sprite;
			obj_player.inventario[1, i] = index;
			obj_player.inventario[2, i] = quantidade;
			retrun = true;
			break;
		}
		if (obj_player.inventario[0, i] == sprite and obj_player.inventario[1, i] == index)
		{
			obj_player.inventario[2, i] += quantidade;
			retrun = true;
			break;
		}
	}
	if (!retrun)
	{
		for (var i = 0; i < 20; i++)
		{
			if (global.inventario[i, 0] == noone)
			{
				global.inventario[i, 0] = sprite;
				global.inventario[i, 1] = index;
				global.inventario[i, 2] = quantidade;
				retrun = true;
				break;
			}
			if (global.inventario[i, 0] == sprite and global.inventario[i, 1] == index)
			{
				global.inventario[i, 2] += quantidade;
				retrun = true;
				break;
			}
		}
	}
	return retrun;
}

function scr_vender(sprite, index, quantidade)
{
	var retrun = false;
	for (var i = 0; i < 7; i++;)
	{
		if (obj_player.inventario[0, i] == sprite and obj_player.inventario[1, i] == index and obj_player.inventario[2, i] >= quantidade)
		{
			obj_player.inventario[2, i] -= quantidade;
			if (obj_player.inventario[2, i] == 0)
			{
				obj_player.inventario[0, i] = noone;
				obj_player.inventario[1, i] = 0;
			}
			retrun = true;
			break;
		}
	}
	if (!retrun)
	{
		for (var i = 0; i < 20; i++;)
		{
			if (global.inventario[i, 0] == sprite and global.inventario[i, 1] == index and global.inventario[i, 2] >= quantidade)
			{
				global.inventario[i, 2] -= quantidade;
				if (global.inventario[i, 2] == 0)
				{
					global.inventario[i, 0] = noone;
					global.inventario[i, 1] = 0;
				}
				retrun = true;
				break;
			}
		}
	}
	
	return retrun;
}