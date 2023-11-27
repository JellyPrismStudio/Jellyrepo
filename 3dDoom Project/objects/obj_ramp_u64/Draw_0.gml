//Due to Game Maker always slanting floors in x-axis, we gotta mess around with matrix transformations
//to get our y-axis slope to slant in the right way.

d3d_transform_add_rotation_z(270)
d3d_transform_add_translation(x,y,0)
d3d_draw_floor(0,-sprite_width,zmax,sprite_height,0,zmin,my_tex,4,2)
draw_set_color(c_gray)
d3d_draw_floor(0,-sprite_width,zmax - 1,sprite_height,0,zmin - 1,my_tex,4,2)
draw_set_color(c_white)
d3d_transform_set_identity()

