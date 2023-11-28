draw_set_color(c_gray)
d3d_draw_floor(x    ,y,     zbottom+0.01,x + sprite_width,y + sprite_height,zbottom+0.01,my_fex,image_xscale,image_yscale)
draw_set_color(c_white)
d3d_draw_floor(x    ,y,     ztop-0.01   ,x + sprite_width,y + sprite_height,ztop-0.01,my_fex,image_xscale,image_yscale)
d3d_draw_wall(x  ,y  ,zbottom+0.01,x + sprite_width,y     ,ztop-0.01,my_wex,image_xscale,1)
d3d_draw_wall(x     ,y   + sprite_height,zbottom+0.01,x     ,y,ztop-0.01,my_wex,image_yscale,1)
d3d_draw_wall(x + sprite_width,y,zbottom+0.01,x + sprite_width,y  + sprite_height,ztop-0.01,my_wex,image_yscale,1)
d3d_draw_wall(x + sprite_width    ,y + sprite_height,zbottom+0.01,x,y + sprite_height,ztop-0.01,my_wex,image_xscale,1)

