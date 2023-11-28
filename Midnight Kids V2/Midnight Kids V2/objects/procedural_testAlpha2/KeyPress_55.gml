if !lock {
	for(i=0;i<array_length(procedural_instances);i++){
		instance_destroy(procedural_instances[i]);
	}



	/// Código para gerar uma seed aleatória de até 26 caracteres

	// Define o tamanho máximo da string
	var max_length = global.intern.procedural.charactersmax;

	// Define a string de caracteres a serem usados
	var chars = global.intern.procedural.range;

	// Inicializa a string vazia
	seed = "";

	// Loop para adicionar caracteres aleatórios à string até que ela atinja o tamanho máximo
	while (string_length(seed) < max_length)
	{
	    // Seleciona um caractere aleatório da string de caracteres
	    var char_index = irandom_range(0, string_length(chars));
	    var char = string_char_at(chars, char_index);
    
	    // Adiciona o caractere à string
	    seed += char;
	}
	if string_length(seed) < 50 {
		while string_length(seed) < 50 {
			var zeros = -string_length(seed) + 60;
			seed = "0" + string(seed);	
		}
		var _num = irandom_range(111,999);
		seed = string_insert(_num, seed, 1);
		procedural_gen2(grid_w,grid_h,objects, seed);
	}
	else {
		var _num = irandom_range(111,999);
		seed = string_insert(_num, seed, 1);
		procedural_gen2(grid_w,grid_h,objects, seed);
	}

}