/// @description Draw wall
//from x-32,y,z to x+32,y,z+64 at +dx and -dx using my_tex
d3d_draw_wall(x-32,y - 1,z + dx,x + 32,y - 1,z + dx + 64,my_tex,1,1)
d3d_draw_wall(x-32,y + 1,z - dx,x + 32,y + 1,z - dx + 64,my_tex,1,1)

