/// @description AI
if(aggro){
    if(instance_exists(obj_player)){
        if(x > obj_player.x){
            xspeed = max(-movespeed,xspeed - accel)
        }
        else{
            xspeed = min( movespeed,xspeed + accel)
        }
        
        if(y > obj_player.y){
            yspeed = max(-movespeed,yspeed - accel)
        }
        else{
            yspeed = min( movespeed,yspeed + accel)
        }
    }
}
else{
    if(instance_exists(obj_player)){
        if(point_distance(x,y,obj_player.x,obj_player.y) < aggro_distance){
            aggro = true
        }
    }
}

///Movement
pxs = xspeed
pys = yspeed
ground_movement()
if(blocked){
    if(xspeed == 0){
        xspeed = -pxs
    }
    if(yspeed == 0){
        yspeed = -pys
    }
}

vertical_movement()

///Update collision data
ztop   = z + zheight
zbottom= z

