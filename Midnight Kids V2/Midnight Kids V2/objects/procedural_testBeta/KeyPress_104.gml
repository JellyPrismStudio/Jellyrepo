for(i=0;i<array_length(procedural_instances);i++){
	instance_destroy(procedural_instances[i]);
}

seed = get_string("Write the seed", "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")

procedural_gen2(grid_w,grid_h,objects, seed);