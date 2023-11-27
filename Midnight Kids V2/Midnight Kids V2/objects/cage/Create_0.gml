/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if instance_exists(GridSetupEnemy)
{
	mp_grid_add_instances(GridSetupEnemy.grid,cage, 0);	
}

