/// @description vertical_movement()
function vertical_movement() {
	if(collidecheck(x,y,zbottom - 1 + zspeed,ztop - 1 + zspeed)){
	    if(zspeed < 0){//Precise collision towards the floor
	        while(!collidecheck(x,y,zbottom-1,ztop-1)){
	            z -= 1
	            zbottom = z
	            ztop    = z + zheight 
	        }
	        onground = true
	    }
	    zspeed   = 0
	}
	else{
	    zhead = terrain_ceil_get_z(x,y + yspeed)
	    if not(z + zheight + zspeed < zhead){
	        zspeed   = 0
	    }
	    else{
	        zfeet = terrain_floor_get_z(x,y)
	        if(z - 1 + zspeed <= zfeet){
	            zspeed = 0
	            onground = true
	            z = zfeet
	        }
	        else{
	            z += zspeed
	            zspeed = max(-terminalvelocity,zspeed - zgravity)
	            zdelta = zheight*0.8 - 0.25*zspeed
	            onground = false
	        }
	    }
	}



}
