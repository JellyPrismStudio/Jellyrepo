d3d_draw_floor(x,y,zmin,x + sprite_width,y + sprite_height,zmax,my_tex,2,2)
draw_set_color(c_gray)
d3d_draw_floor(x,y,zmin - 1,x + sprite_width,y + sprite_height,zmax - 1,my_tex,2,2)
draw_set_color(c_white)

