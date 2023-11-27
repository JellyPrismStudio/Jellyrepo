/// @description collidecheck(x,y,zbottom,ztop)
/// @param x
/// @param y
/// @param zbottom
/// @param ztop
function collidecheck(argument0, argument1, argument2, argument3) {
	//Returns ID if there is a collision, FALSE if not. Since ID > 0, it will be treated as boolean TRUE.
	with(parent_wall){
	    if(point_distance(x,y,other.x,other.y < abs(2*sprite_width*sprite_height))){
	        if(!(script_execute(zcheck_script_bottom,argument0,argument1) >= argument3 || script_execute(zcheck_script_top,argument0,argument1) <= argument2)){
	            with(other){
	                //if(collision_point(argument0,argument1,other,true,false)){
	                if(place_meeting(round(argument0),round(argument1),other)){
	                    global.last_touch_terrain = other.id
	                    return other.id
	                }
	            }
	        }
	    }
	}
	return false



}
