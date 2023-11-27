d3d_draw_floor(x,y,zmax,x + sprite_width,y + sprite_height,zmin,my_tex,2,2)
draw_set_color(c_gray)
d3d_draw_floor(x,y,zmax - 1,x + sprite_width,y + sprite_height,zmin - 1,my_tex,2,2)
draw_set_color(c_white)

