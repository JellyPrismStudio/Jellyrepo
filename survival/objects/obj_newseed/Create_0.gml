perlin = false;
gridsize = 8;
seedserial = irandom_range(0,100000000000000000)
show_debug_message(seedserial);
someGrid = ds_grid_create(view_get_wport(view_camera[1])/gridsize,view_get_hport(view_camera[1])/gridsize)

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