/// @description Draw HUD
//Setup projection
d3d_set_projection_ortho(0,0,__view_get( e__VW.WView, 0 ),__view_get( e__VW.HView, 0 ),0)
draw_set_alpha(1)
d3d_set_hidden(false)
d3d_set_lighting(false)
draw_set_color(c_white)
draw_set_alpha(1)
d3d_set_fog(0,0,0,0)

draw_set_font(font_hudstuff)
draw_set_valign(2)

//Current weapon
if(global.weapon_data[global.eq_weapon,wpd_HUDSPRITE] <> NONE){
    with(obj_player){
        if(reloading){
            with(other){
                draw_sprite(global.weapon_data[global.eq_weapon,wpd_RELOADSPRITE],0,__view_get( e__VW.WView, 0 )*0.5,__view_get( e__VW.HView, 0 ))
            }
        }
        else{
            with(other){
                draw_sprite(global.weapon_data[global.eq_weapon,wpd_HUDSPRITE],0,__view_get( e__VW.WView, 0 )*0.5,__view_get( e__VW.HView, 0 ))
            }
        }
    }
}
if(global.ammo[global.eq_weapon] <> NONE && global.eq_weapon <> wp_UNARMED){
    draw_set_color(c_aqua)
    draw_set_halign(1)
    draw_text(__view_get( e__VW.WView, 0 ) - 80,__view_get( e__VW.HView, 0 ) - 4,string_hash_to_newline(string(global.clip[global.eq_weapon]) + "|" + string(global.weapon_data[global.eq_weapon,wpd_CLIPSIZE]*global.ammo[global.eq_weapon])))
}

//Health/armor
draw_set_color(c_red)
draw_set_halign(0)
draw_text( 8,__view_get( e__VW.HView, 0 ) - 4,string_hash_to_newline("♥" + string(floor(global.hp))))
draw_set_color(c_orange)
draw_text(80,__view_get( e__VW.HView, 0 ) - 4,string_hash_to_newline("♦" + string(floor(global.armor))))
draw_set_valign(0)

//Debug text
draw_set_color($FFC026)
draw_set_font(font_nes)
draw_text(16,1,string_hash_to_newline("Fps:"+string(fps)+"  Active objects:" +string(instance_count)+"#WASD - move, mouse - look#LMB - shoot#mouse wheel - cycle weapons"))

//Death effects
if(drawhurt){
    draw_set_alpha(hurtalpha)
    draw_set_color(hurtcolor)
    draw_rectangle(0,0,__view_get( e__VW.WView, 0 ),__view_get( e__VW.HView, 0 ),false)
    draw_set_alpha(1)
}

d3d_set_hidden(true)
d3d_set_lighting(true)

