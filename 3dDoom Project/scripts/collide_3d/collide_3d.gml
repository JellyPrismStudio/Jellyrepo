/// @description collide_3d(object)
/// @param object
function collide_3d(argument0) {
	//Checks collisions between self and desired object. Returns NONE or id of what you collide with.
	with(argument0){
	    if not(zbottom > other.ztop || ztop < other.zbottom){
	        if(place_meeting(x,y,other)){
	            return id
	        }
	    }
	}
	return NONE




}
