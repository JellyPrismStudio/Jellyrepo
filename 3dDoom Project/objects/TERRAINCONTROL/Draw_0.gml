/// @description Draw terrain
wsx = __view_get( e__VW.XView, 0 ) - wb
wsy = __view_get( e__VW.YView, 0 ) - wb

d3d_transform_set_identity()
draw_set_color(c_white)
var c1, c2, d1, d2, x1, x2, y1, y2;
c1 = max(0,wsx div GRIDSIZE_X)
c2 = min(c1 + ww,GRIDCELL_X - 2)
d1 = max(0,wsy div GRIDSIZE_Y)
d2 = min(d1 + ww,GRIDCELL_Y - 2)
for(dtx = c1;dtx <= c2;dtx += 1){
    for(dty = d1;dty <= d2;dty += 1){
        d3d_primitive_begin_texture(pr_trianglestrip,ds_grid_get(TEXGRID,dtx,dty))
        x1 = dtx*GRIDSIZE_X
        x2 = (dtx + 1)*GRIDSIZE_X
        y1 = dty*GRIDSIZE_Y
        y2 = (dty + 1)*GRIDSIZE_Y
        
        z1 = ds_grid_get(FLOORGRID,dtx,dty)
        z2 = ds_grid_get(FLOORGRID,dtx + 1,dty + 1)
        
        nx = 0
        ny = 0
        nz = 1
        
        d3d_vertex_normal_texture(x1,y1,ds_grid_get(FLOORGRID,dtx,dty),         nx,ny,nz,0,0)
        d3d_vertex_normal_texture(x1,y2,ds_grid_get(FLOORGRID,dtx,dty + 1),     nx,ny,nz,0,1)
        d3d_vertex_normal_texture(x2,y1,ds_grid_get(FLOORGRID,dtx + 1,dty),     nx,ny,nz,1,0)
        d3d_vertex_normal_texture(x2,y2,ds_grid_get(FLOORGRID,dtx + 1,dty + 1), nx,ny,nz,1,1)
        d3d_primitive_end()
    }
}

