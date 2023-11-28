for(i=0;i<array_length(procedural_instances);i++){
	instance_destroy(procedural_instances[i]);
}


seed = get_string("Write the seed", "0000000000")

procedural_gen(16,16,objects, seed);