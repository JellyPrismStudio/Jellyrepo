/// @description terrain_cleanup()
function terrain_cleanup() {
	if(FLOORGRID <> NONE){
	    ds_grid_destroy(FLOORGRID)
	    FLOORGRID = NONE
	}
	if(CEILGRID <> NONE){
	    ds_grid_destroy(CEILGRID)
	    CEILGRID = NONE
	}
	if(TEXGRID <> NONE){
	    ds_grid_destroy(TEXGRID)
	    TEXGRID = NONE
	}
	if(CEILTEXGRID <> NONE){
	    ds_grid_destroy(CEILTEXGRID)
	    CEILTEXGRID = NONE
	}



}
