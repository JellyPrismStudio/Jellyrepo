/// @description Draw wall
//from x-32,y,z to x+32,y,z+64 at +dx and -dx using my_tex
d3d_draw_wall(x-1,y - 32,z + dx,x - 1,y + 32,z + dx + 64,my_tex,1,1)
d3d_draw_wall(x+1,y + 32,z - dx,x + 1,y - 32,z - dx + 64,my_tex,1,1)

