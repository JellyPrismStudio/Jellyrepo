/// @description ground_movement()
function ground_movement() {
	//Requirements: xspeed, yspeed, zbottom, ztop, z
	blocked = false; var tzt = z;
	if(xspeed <> 0){ 
	    success = false
	    for(c = z - BIGGESTHURDLEWALK*onground;c < z + BIGGESTHURDLEWALK;c++){
	        if(!collidecheck(x + xspeed,y,c,c + zheight)){
	            x += xspeed
	            z  = c
	            zbottom = z
	            ztop    = z + zheight
	            success = true
	            break
	        }
	    }
	    if not(success){
	        xspeed = 0
	        blocked= true
	    }
	    if(collidecheck(x,y,zbottom,ztop)){ 
	        x = xprevious 
	    } 
	} 
	if(yspeed <> 0){ 
	    success = false
	    for(c = z - BIGGESTHURDLEWALK*onground;c < z + BIGGESTHURDLEWALK;c++){
	        if(!collidecheck(x,y+ yspeed,c,c + zheight)){
	            y += yspeed
	            z  = c
	            zbottom = z
	            ztop    = z + zheight
	            success = true
	            break
	        }
	    }
	    if not(success){
	        yspeed = 0
	        blocked= true
	    }
	    if(collidecheck(x,y,zbottom,ztop)){ 
	        y = yprevious
	    } 
	}



}
