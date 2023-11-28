/// @description Draw wall
//from x-32,y,z to x+32,y,z+64 at +dx and -dx using my_tex
d3d_draw_wall(x + lengthdir_y(32,dx*side),y-31.9+lengthdir_x(32,dx*side),z,x,y-31.9,z + 64,my_tex,1,1)
d3d_draw_wall(x,y+31.9,z,x + lengthdir_y(32,dx*side),y+31.9-lengthdir_x(32,dx*side),z + 64,my_tex,1,1)

