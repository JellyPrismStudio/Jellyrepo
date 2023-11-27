/// @description Insert description here

grid = mp_grid_create(0,0,room_width/8,room_height/8,8,8);
mp_grid_add_instances(grid,colisor, 1);

mp_grid_add_instances(grid,colisorFollower, 1);
mp_grid_add_instances(grid,ColliderRound, 1);
mp_grid_add_instances(grid,IsoMetric, 0);
mp_grid_add_instances(grid,obj_wall, 0);
mp_grid_add_instances(grid,playerA, 1);
mp_grid_add_instances(grid,playerB, 1);
mp_grid_add_instances(grid,playerHanna, 1);





// You can write your code in this editor


