/// @description Movement
//direction -= median(-30,30,mwsdelx div 5)
//ztilt      = median(-25,25,ztilt + (mwsdely div 10))

xprevious = x
yprevious = y
zprevious = z

d = point_direction(x,y,xprevious,yprevious)

if(mouse){
    direction+=((window_get_width() div 2 - window_mouse_get_x())/3)*MOUSESENSITIVITY
    ztilt=median(-90,90, ztilt - MOUSESENSITIVITY*0.3*((window_get_height() div 2 - window_mouse_get_y())))
    window_mouse_set(window_get_width() div 2,window_get_height() div 2)
}

xspeed *= 0.92
yspeed *= 0.92

if(k_u){
    xspeed = median(-movespeedmax,movespeedmax,xspeed + lengthdir_x(accel,direction))
    yspeed = median(-movespeedmax,movespeedmax,yspeed + lengthdir_y(accel,direction))
}
if(k_d){
    xspeed = median(-movespeedmax,movespeedmax,xspeed - lengthdir_x(accel,direction))
    yspeed = median(-movespeedmax,movespeedmax,yspeed - lengthdir_y(accel,direction))
}
if(k_l){
    xspeed = median(-movespeedmax,movespeedmax,xspeed + lengthdir_x(accel,direction + 90))
    yspeed = median(-movespeedmax,movespeedmax,yspeed + lengthdir_y(accel,direction + 90))
}
if(k_r){
    xspeed = median(-movespeedmax,movespeedmax,xspeed + lengthdir_x(accel,direction - 90))
    yspeed = median(-movespeedmax,movespeedmax,yspeed + lengthdir_y(accel,direction - 90))
}


ground_movement()




__view_set( e__VW.XView, 0, x )
__view_set( e__VW.YView, 0, y )


if(collidecheck(x,y,zbottom - 1 + zspeed,ztop - 1 + zspeed)){
    if(zspeed < 0){//Precise collision towards the floor
        while(!collidecheck(x,y,zbottom-1,ztop-1)){
            z -= 1
            zbottom = z
            ztop    = z + zheight 
        }
        if(zspeed <= -1){
            footsound= object_get_sound(global.last_touch_terrain.object_index)
            audio_sound_pitch(sfx(footsound),random_range(0.8,1.2))
        }
        if(!(k_u||k_l||k_r||k_d)){
            xspeed = 0
            yspeed = 0
        }
        onground = true
    }
    zspeed   = 0
    if(k_a){
        if(canjump){
            audio_sound_pitch(sfx(footsound),random_range(0.8,1.2))
            zspeed  = jumpspeed
            canjump = false
            onground= false
        }
    }
    if(xspeed <> 0 || yspeed <> 0){
        bobstep += 4*(xspeed + yspeed) 
        zdelta = zheight*0.8 + lengthdir_y(2,bobstep)
    }
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
            if(k_a){
                if(canjump){
                    sfx(footsound)
                    zspeed  = jumpspeed
                    canjump = false
                    onground= false
                }
            }
        }
        else{
            z += zspeed
            zspeed = max(-terminalvelocity,zspeed - zgravity)
            zdelta = zheight*0.8 - 0.25*zspeed
            onground = false
        }
    }
}


///Move outside wall
/*pl = 1
if(collidecheck(x,y,zbottom,ztop)){
    cx = x
    cy = y
    for(l = 1;l < 32;l++){
        for(ccc = 0;ccc < 360;ccc += 30){
            a = point_direction(xspeed,yspeed,0,0) + ccc//direction + ccc + 180
            if(!collidecheck(x - lengthdir_x(l,a),y - lengthdir_y(l,a),zbottom,ztop)){
                x -= lengthdir_x(l,a)
                y -= lengthdir_y(l,a)
                pl = l
                l = 99999
                break
            }
        }
    }
    //An extra step
    x -= lengthdir_x(pl,a)
    y -= lengthdir_y(pl,a)
    
}*/


if(!k_a){
    canjump = true
    if(zspeed > 3){
        zspeed = 3
    }
}

if(onground){
    stepcntr -= point_distance(0,0,xspeed,yspeed)
    if(!stepcntr){
        stepcntr = 60
        collidecheck(x,y,zbottom,ztop)
        footsound= object_get_sound(global.last_touch_terrain.object_index)
        audio_sound_pitch(sfx(footsound),random_range(0.8,1.2))
    }
}

/* */
///Shoot/Reload
if(mouse_check_button(mb_left)){
    if(canshoot){
        if(global.clip[global.eq_weapon] > 0){
            global.clip[global.eq_weapon]--
            alarm[1] = global.weapon_data[global.eq_weapon,wpd_AUTOFIRE]
            canshoot = false
            if(global.weapon_data[global.eq_weapon,wpd_SHOOTSCRIPT] <> NONE){
                script_execute(global.weapon_data[global.eq_weapon,wpd_SHOOTSCRIPT])
            }
        }
    }
}
else{
    canshoot = true
}
if(global.clip[global.eq_weapon] <= 0 && !reloading && global.ammo[global.eq_weapon] > 0){
    reloading = global.weapon_data[global.eq_weapon,wpd_RELOADTIME]
    sfx(snd_reload)
}
if(k_rl){
    if(!reloading){
        if(global.ammo[global.eq_weapon] > 0){
            reloading = global.weapon_data[global.eq_weapon,wpd_RELOADTIME]
            sfx(snd_reload)
        }
    }
}

//Reloading
if(reloading){
    reloading--
    if(!reloading){
        global.ammo[global.eq_weapon]--
        global.clip[global.eq_weapon] = global.weapon_data[global.eq_weapon,wpd_CLIPSIZE]
    }
}

/* */
///Take damage from enemies/hazaards?
if(canhurt){
    n = collide_3d(parent_damage)
    if(instance_exists(n)){
        if(global.armor > 0){
            global.armor = max(0,global.armor - n.atk)
            global.hp    = max(0,global.hp    - n.atk*0.1)
        }
        else{
            global.hp    = max(0,global.hp    - n.atk)
        }
        sfx(snd_damage)
        with(obj_overlay){
            drawhurt = true
            hurtalpha= 0.5
            hurtcolor= c_red
        }
        canhurt = false
        alarm[0]= 30
        d       = point_direction(n.x,n.y,x,y)
        zd      = point_direction(0,n.z,point_distance(x,y,n.x,n.y),z)
        xspeed  = 2*lengthdir_x(1,d)*lengthdir_x(1,zd)
        yspeed  = 2*lengthdir_x(1,d)*lengthdir_x(1,zd)
        zspeed  =-2*lengthdir_y(1,zd)
    }
}

//Collide with items
n = collide_3d(parent_item)
if(instance_exists(n)){
    item_get(n.object_index)
    with(n){
        instance_destroy()
    }
}

/* */
///Fall-out/die
if(z < -1000 || global.hp <= 0){
    sound_stop_all()
    sfx(snd_die)
    global.hp = 100
    with(obj_overlay){
        drawdeath = true
    }
    room_restart()
}

/* */
/*  */
