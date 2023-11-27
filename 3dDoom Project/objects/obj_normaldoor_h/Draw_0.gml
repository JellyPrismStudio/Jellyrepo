/// @description Draw wall
//from x-32,y,z to x+32,y,z+64 at +dx and -dx using my_tex
d3d_draw_wall(x-31.9,y,z,x - 31.9+lengthdir_x(32,dx*side),y+lengthdir_y(32,dx*side),z + 64,my_tex,1,1)
d3d_draw_wall(x+31.9,y,z,x + 31.9-lengthdir_x(32,dx*side),y+lengthdir_y(32,dx*side),z + 64,my_tex,1,1)

