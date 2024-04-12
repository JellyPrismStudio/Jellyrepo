perlin = false;
gridsize = 6;
seedserial = irandom_range(0,100000000000000000)
show_debug_message(seedserial);
someGrid = ds_grid_create(view_get_wport(view_camera[1])/gridsize,view_get_hport(view_camera[1])/gridsize)

///////////////
_quantidade_chunks = 13;
_altura_chunk = 90;
_largura_chunk = 90;
_local_git = "C:/Users/Kauzz/Documents/Jellyfish Studios/Jellyrepo/survival/datafiles/";
///////////////

for(_cont = 0; _cont < _quantidade_chunks; _cont++)
	{
	
	ds_grid_destroy(someGrid);
	someGrid = ds_grid_create(_altura_chunk,_largura_chunk)
	//someGrid = ds_grid_create(1000,1000)
	noise2(someGrid,5,35, 1, 1,255,20,40);
	someGrid = normalize_grid(someGrid, 30, 30, 30, 30);
	perlin = true;
	var file_name = "region_" + string(_cont);
    save_grid_to_txt(someGrid, _local_git + file_name);
	}
//////////////



global.gradientVectors[0][0] = 0;
global.gradientVectors[0][1] = -1;
global.gradientVectors[1][0] = 1;
global.gradientVectors[1][1] = -1;
global.gradientVectors[2][0] = 1;
global.gradientVectors[2][1] = 0;
global.gradientVectors[3][0] = 1;
global.gradientVectors[3][1] = 1;
global.gradientVectors[4][0] = 0;
global.gradientVectors[4][1] = 1;
global.gradientVectors[5][0] = -1;
global.gradientVectors[5][1] = 1;
global.gradientVectors[6][0] = -1;
global.gradientVectors[6][1] = 0;
global.gradientVectors[7][0] = -1;
global.gradientVectors[7][1] = -1;