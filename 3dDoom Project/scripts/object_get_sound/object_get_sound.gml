/// @description object_get_sound(objindex)
/// @param objindex
function object_get_sound(argument0) {
	switch(argument0){
	    case obj_floor_dirt_sq64:
	    case obj_floor_sq256:
	        return snd_footstep_wood
        
	    case obj_floor_grass_sq64:
	    case obj_wall_hedge:
	        return snd_footstep_grass
    
	    case obj_floor_sandstone_sq64:
	    case obj_wall_sandstone_block64:
	    case obj_wall_graybrick_block64:
	        return snd_footstep_stone
        
	    default:
	        return snd_footstep_wood
	}



}
