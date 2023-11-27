/// @description terrain_init()
function terrain_init() {
	terrain_cleanup()
	var cx, cy;

	FLOORGRID = ds_grid_create(ceil(room_width/GRIDSIZE_X),ceil(room_height/GRIDSIZE_Y))
	TEXGRID   = ds_grid_create(ceil(room_width/GRIDSIZE_X),ceil(room_height/GRIDSIZE_Y))

	GRIDCELL_X = ds_grid_width(FLOORGRID)
	GRIDCELL_Y = ds_grid_height(FLOORGRID)

	ds_grid_clear(FLOORGRID,-1)
	tex = background_get_texture(global.floortex)
	ds_grid_clear(TEXGRID,tex)



	if(global.terrainceil){
	    CEILGRID    = ds_grid_create(ceil(room_width/GRIDSIZE_X),ceil(room_height/GRIDSIZE_Y))
	    CEILTEXGRID = ds_grid_create(ceil(room_width/GRIDSIZE_X),ceil(room_height/GRIDSIZE_Y))
	    ds_grid_clear(CEILGRID,128)

	    tex = background_get_texture(global.ceiltex)
	    ds_grid_clear(CEILTEXGRID,tex)
	}



	///Add some debug terrain for now
	/*repeat(800){
	    cx = irandom(GRIDCELL_X - 1)
	    cy = irandom(GRIDCELL_Y - 1)
	    ds_grid_add(FLOORGRID,cx,cy,choose(-10,10,-20,20,-30,30))
	    if(global.terrainceil){
	        ds_grid_set(CEILGRID,cx,cy,ds_grid_get(FLOORGRID,cx,cy) + 32 + irandom_range(0,8)*10)
	    }
	}*/



}
