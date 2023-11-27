/// @description Move
x += xspeed
y += yspeed
z += zspeed

///Destroy?
if(collidecheck(x,y,z,z+1)){
    instance_destroy()
}

n = collide_3d_circle(parent_enemy)
if(instance_exists(n)){
    n.hp -= atk
    if(n.hp <= 0){
        with(n){
            event_user(15)
            instance_destroy()
        }
    }
    instance_destroy()
}

