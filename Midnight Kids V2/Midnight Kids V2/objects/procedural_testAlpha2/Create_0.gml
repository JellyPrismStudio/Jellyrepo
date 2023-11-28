var items = [		BushNoAnim,		Arvore2Anim,	Rock2,		Rock3];
var weights = [				40,			5,				5,			5];	
objects = create_weighted_array(items, weights)

grid_w = 48;
noisemask = false;
grid_h = grid_w;
procedural_gen2(grid_w,grid_h,objects,seed);

image_alpha = 0;

//alfuajenqptielakmenpqoplsh