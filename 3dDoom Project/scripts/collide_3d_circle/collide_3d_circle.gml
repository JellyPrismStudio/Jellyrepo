/// @description collide_3d_circle(object)
/// @param object
function collide_3d_circle(argument0) {
	//Checks collisions between self and desired object. Returns NONE or id of what you collide with.
	with(argument0){
	    if (point_distance_3d(x,y,zbottom + (ztop - zbottom)*0.5,other.x,other.y,other.z) < other.radius){
	        return id
	    }
	}
	return NONE



}
