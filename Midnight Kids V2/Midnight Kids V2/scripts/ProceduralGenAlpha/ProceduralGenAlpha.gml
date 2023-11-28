function alpha_stringify(num){
	if num == "a" return 0;
	if num == "b" return 1;
	if num == "c" return 2;
	if num == "d" return 3;
	if num == "e" return 4;
	if num == "f" return 5;
	if num == "g" return 6;
	if num == "h" return 7;
	if num == "i" return 8;
	if num == "j" return 9;
	if num == "k" return 10;
	if num == "l" return 11;
	if num == "m" return 12;
	if num == "n" return 13;
	if num == "o" return 14;
	if num == "p" return 15;
	if num == "q" return 16;
	if num == "r" return 17;
	if num == "s" return 18;
	if num == "t" return 19;
	if num == "u" return 20;
	if num == "v" return 21;
	if num == "w" return 22;
	if num == "y" return 23;
	if num == "x" return 24;
	if num == "z" return 25;
	if num == "A"  return 26;
	if num == "B"  return 27;
	if num == "C"  return 28;
	if num == "D"  return 29;
	if num == "E"  return 30;
	if num == "F"  return 31;
	if num == "G"  return 32;
	if num == "H"  return 33;
	if num == "I"  return 34;
	if num == "J"  return 35;
	if num == "K"  return 36;
	if num == "L"  return 37;
	if num == "M"  return 38;
	if num == "N"  return 39;
	if num == "O"  return 40;
	if num == "P"  return 41;
	if num == "Q"  return 42;
	if num == "R"  return 43;
	if num == "S"  return 44;
	if num == "T"  return 45;
	if num == "U"  return 46;
	if num == "V"  return 47;
	if num == "W"  return 48;
	if num == "X"  return 49;
	if num == "Y"  return 50;
	if num == "Z"  return 51;
}

function _generate_noise_map(object, rotation = 0) {
	if !noisemask{		
		var son = instance_create_depth(x,y, depth-1, _noiseObj);	
		son.super = self.id;
		with(son){
			image_xscale = super.sprite_width / sprite_height;
			image_yscale = super.sprite_height / sprite_height;
		}
		return son.id
		noisemask = true;
	}
	else return instance_id_get(object)
}

function _get_noise(){
	if !variable_instance_exists(self.id, "_noiseObj") _noiseObj = _noiseObj8
	if array_code[1] == "1" _noiseObj = _noiseObj1
	else if array_code[1] == "2" _noiseObj = _noiseObj2
	else if array_code[1] == "3" _noiseObj = _noiseObj3
	else if array_code[1] == "4" _noiseObj = _noiseObj4
	else if array_code[1] == "5" _noiseObj = _noiseObj5
	else if array_code[1] == "6" _noiseObj = _noiseObj6
	else if array_code[1] == "7" _noiseObj = _noiseObj7
	else if array_code[1] == "8" _noiseObj = _noiseObj8
	else if array_code[1] == "9" _noiseObj = _noiseObj9
	else return _noiseObj = _noiseEmpty
}

function _procedural_check_collission2(x1, x2, y1, y2){
	array = [false, 0, 0]
	for(i=x1;i<x2;i++){
		for(j=y1;j<y2;j++){
			if position_meeting(i, j, self){
				array = [true, i, j]
				i=x2;
				j=y2;
			}
		}		
	}
	return array
}

function _sub_procedural_check_collission2(x1, x2, y1, y2){
	array = [false, 0, 0]
	for(i=x1;i<x2;i++){
		for(j=y1;j<y2;j++){
			if !position_meeting(i, j, self){
				array = [true, i, j]
				i=x2;
				j=y2;
			}
		}		
	}
	return array
}

function _son_sub_procedural_check_collission2(x1, x2, y1, y2, object){
	var son = _generate_noise_map(object, 0);
	array = [false, 0, 0]
	for(i=x1;i<x2;i++){
		for(j=y1;j<y2;j++){
			if !position_meeting(i, j, self) and !position_meeting(i, j, object){
				array = [true, i, j]
				i=x2;
				j=y2;
			}
		}		
	}
	instance_destroy(son);
	noisemask = false;
	return array
}

function _son_procedural_check_collission2(x1, x2, y1, y2, object){
	var son = _generate_noise_map(object, 0);
	array = [false, 0, 0]
	for(i=x1;i<x2;i++){
		for(j=y1;j<y2;j++){
			if !position_meeting(i, j, self) and !position_meeting(i, j, object) and !position_meeting(i,j,colisor){
				array = [true, i, j]
				i=x2;
				j=y2;
			}
		}		
	}
	instance_destroy(son);
	noisemask = false;
	return array
}

function _procedural_jump_object(){
	if procedural_i <= global.intern.procedural.charactersmax - 1 procedural_i++
	else procedural_i = 0;
	
}

function _procedural_create_from_seed2(xx, yy, seed, array){
	var _seed = _array_from_seed2(seed, array);
	sdm("LENGTH", array_length(_seed));
	if procedural_i <= global.intern.procedural.charactersmax - 1 {
		var plus = _calculate_pos(seed, procedural_i);
		var inst = instance_create_depth(xx + plus[0],yy+plus[1],depth,_seed[procedural_i]);
		array_push(procedural_instances, inst.id);
		procedural_i++;
	}
	else {
		procedural_i = 1;
	}
}
	
function _calculate_pos(seed, i){
	if !variable_instance_exists(self.id, "_procGen_pos") _procGen_pos = false;
	while i > global.intern.procedural.charactersmax/2{
		i -= global.intern.procedural.charactersmax/2;
	}
	if i mod 4 == 0 {
		coord = [i, i]
	}
	else if i mod 3 == 0 {
		coord = [i, -i]
	}
	else if i mod 2 == 0 {
		coord = [-i, i]
	}
	else {
		coord = [-i, -i]
	}
	return coord;
}

function _procedural_create_from_seed2b(xx, yy, seed, array){
	var _seed = _array_from_seed2(seed, array);
	
	if procedural_i <= global.intern.procedural.charactersmax - 1 {
		var inst = instance_create_depth(xx,yy,depth,_seed[procedural_i]);
		array_push(procedural_instances, inst.id);
		procedural_i++;
	}
	else {
		procedural_i = 1;
	}
}

function _shuffle_array2(arr) {
    var n = array_length(arr);
    for (var i = n - 1; i > 0; i--) {
        var j = irandom_range(0, i);
        var temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
    }
}

function _array_to_real2(arr) {
    var str = "";
    var n = array_length(arr);
    for (var i = 0; i < n; i++) {
        str += string(arr[i]);
    }
    var num = real(str);
    return num;
}

function _organize_by_order2(arr, ordem) {
    var arrOrdenada = array_create(array_length(arr)); // cria uma nova array do mesmo tamanho da original
    var indiceDestino = 0;
    var indicesVisitados = array_create(global.intern.procedural.charactersmax, false); // array para controlar quais índices já foram visitados
    for (var i = 0; i < global.intern.procedural.charactersmax; i++) {
        var indiceOrigem = ordem[i];
        if (indicesVisitados[indiceOrigem]) continue; // já visitou esse índice
        arrOrdenada[indiceDestino] = arr[indiceOrigem];
        indiceDestino++;
        indicesVisitados[indiceOrigem] = true;
    }
    return arrOrdenada;
}
	
function _array_from_seed2(seed, nomes) {
    var len = array_length(nomes);
    var ordem = string_length(string(seed));
    var array_nova = array_create(ordem, "");
    for (var i = 0; i <= ordem; i++) {
        var digito = string_char_at(seed, i);
		
        if alpha_stringify(digito) < array_length(nomes) array_seed[i] = alpha_stringify(digito);
		else {
			newdigit = alpha_stringify(digito);
			while newdigit >= array_length(nomes){
				newdigit -= array_length(nomes);
			}
			array_seed[i] = string(alpha_stringify(newdigit));
		}
		
    }
    for (var j = 1; j <= ordem; j++) {
        var indice = clamp(array_seed[j], 0, len-1);
        array_nova[j] = nomes[indice];
		
    }
    return array_nova;
}

function _split_seed2(seed)
{
    // Converte a seed em uma array
    var ordem = string_digits(string(seed));
    
    // Cria a array de resultado
    var resultado = array_create(global.intern.procedural.charactersmax, 0);
    
    // Preenche a array de resultado na ordem correta
    for (var i = 0; i < global.intern.procedural.charactersmax; i++)
    {
        resultado[i] = ordem[resultado];
    }
    
    return resultado;
}

function procedural_gen2(width, height, objects, seed = 0){
	if !variable_instance_exists(self, "procedural_i") variable_instance_set(self,"procedural_i", 1);
	if !variable_instance_exists(self, "procedural_instances") variable_instance_set(self,"procedural_instances", [0]);
	var sx = self.x;
	var sy = self.y;
	procedural_i = 1;
	procedural_instances = [0];
	seed = _take_procedural_config(seed);
	
	var sprw = ceil(sprite_width/width);
	var sprh = ceil(sprite_height/height);
	
	arr[sprw, sprh] = 0;
	var index = 0;
	
	if array_code[0] == "1"{
		for(iw=0;iw<sprw;iw++){
		
			var xx = x + iw * width;
			for (ih=0;ih<sprh;ih++){
				var yy = y + ih * height;
			
				var on_collission = _procedural_check_collission2(xx,xx + width, yy, yy + height);
			
					if on_collission[0] == true {
						xv = irandom_range(-sprw/2, sprw/2);
						yv = irandom_range(-sprh/2, sprh/2);
						_procedural_create_from_seed2(on_collission[1] + xv, on_collission[2] + yv, seed, objects)
					}
					else if on_collission[0] == 2 _procedural_jump_object()
				arr[iw, ih] = index;
				index++;
			}
		}
	}
	else if array_code[0] == "2"{
		for(iw=0;iw<sprw;iw++){
		
			var xx = x + iw * width;
			for (ih=0;ih<sprh;ih++){
				var yy = y + ih * height;
			
				var on_collission = _procedural_check_collission2(xx,xx + width, yy, yy + height);
					if on_collission[0] == true {
					xv = irandom_range(-sprw, sprw);
					yv = irandom_range(-sprh, sprh);
					_procedural_create_from_seed2(on_collission[1] + xv, on_collission[2] + yv, seed, objects)
				}
					else if on_collission[0] == 2 _procedural_jump_object()
				arr[iw, ih] = index;
				index++;
			}
		}
	}
	else if array_code[0] == "3"{
		for(iw=sprw;iw>0;iw-=2){
		
			var xx = x + iw * width;
			for (ih=sprh;ih>0;ih-=2){
				var yy = y + ih * height;
				var on_collission = _procedural_check_collission2(xx,xx + width, yy, yy + height);
				if on_collission[0] == true {
					_procedural_create_from_seed2(on_collission[1], on_collission[2], seed, objects)
				}
				else if on_collission[0] == 2 _procedural_jump_object()
				arr[iw, ih] = index;
				index++;
			}
		}
		for(iw=sprw-1;iw>0;iw-=2){
		
			var xx = x + iw * width;
			for (ih=sprh-1;ih>0;ih-=2){
				var yy = y + ih * height;
				var noise = _get_noise();
				var on_collission = _son_procedural_check_collission2(xx,xx + width, yy, yy + height, _noiseObj);
				if on_collission[0] == true {
					_procedural_create_from_seed2(on_collission[1], on_collission[2], seed, objects)
				}
				else if on_collission[0] == 2 _procedural_jump_object()
				arr[iw, ih] = index;
				index++;
			}
		}
		
	}
	else if array_code[0] == "4"{
		for(iw=sprw;iw>0;iw--){
		
			var xx = x + iw * width;
			for (ih=sprh;ih>0;ih--){
				var yy = y + ih * height;
				var noise = _get_noise();
				var on_collission = _son_procedural_check_collission2(xx,xx + width, yy, yy + height, _noiseObj);
				if on_collission[0] == true {
					_procedural_create_from_seed2(on_collission[1], on_collission[2], seed, objects)
				}
				else if on_collission[0] == 2 _procedural_jump_object()
				arr[iw, ih] = index;
				index++;
			}
		}	
		
	}
	else if array_code[0] == "5"{
		for(iw=0;iw<sprw;iw++){
			var xx = x + iw * width;
			for (ih=0;ih<sprh;ih++){
				var yy = y + ih * height;
				var noise = _get_noise();
				var on_collission = _son_procedural_check_collission2(xx,xx + width, yy, yy + height, _noiseObj);
			
					if on_collission[0] == true {
						_procedural_create_from_seed2(on_collission[1], on_collission[2], seed, objects)
					}
				arr[iw, ih] = index;
				index++;
			}
		}
	}
	else if array_code[0] == "6"{
		for(iw=0;iw<sprw;iw++){
			var xx = x + iw * width;
			for (ih=0;ih<sprh;ih++){
				var yy = y + ih * height;
				var noise = _get_noise();
				var on_collission = _son_sub_procedural_check_collission2(xx,xx + width, yy, yy + height, _noiseObj);
			
					if on_collission[0] == true {
						xv = irandom_range(-sprw/2, sprw/2);
						yv = irandom_range(-sprh/2, sprh/2);
						_procedural_create_from_seed2(on_collission[1], on_collission[2], seed, objects)
					}
					else if on_collission[0] == 2 _procedural_jump_object()
				arr[iw, ih] = index;
				index++;
			}
		}
	}
	else if array_code[0] == "7"{
		for(iw=0;iw<sprw;iw++){
		
			var xx = x + iw * width;
			for (ih=0;ih<sprh;ih++){
				var yy = y + ih * height;
				var noise = _get_noise();
				var on_collission = _son_procedural_check_collission2(xx,xx + width, yy, yy + height, _noiseObj);
				
					if on_collission[0] == true {
						_procedural_create_from_seed2(on_collission[1], on_collission[2], seed, objects)
					}
					else if on_collission[0] == 2 _procedural_jump_object()
				arr[iw, ih] = index;
				index++;
			}
		}
	}
	else {
		for(iw=0;iw<sprw;iw++){
			var xx = x + iw * width;
			for (ih=0;ih<sprh;ih++){
				var yy = y + ih * height;
				var noise = _get_noise();
				var on_collission = _son_procedural_check_collission2(xx,xx + width, yy, yy + height, _noiseObj);
			
					if on_collission[0] == true {
						_procedural_create_from_seed2(on_collission[1], on_collission[2], seed, objects)
					}
					else if on_collission[0] == 2 _procedural_jump_object()
				arr[iw, ih] = index;
				index++;
			}
		}
	}
}
	
function _take_procedural_config(stringinput){
	// Exemplo de string
	my_string = stringinput;
	
	// Salva os 3 primeiros caracteres em uma nova string
	my_new_string = string_copy(my_string, 1, 3);
	array_code = array_create(3, 0);
	for (var i = 0; i < 3; i++) {
		var my_char = string_char_at(my_new_string, i+1);
		array_code[i] = my_char;
	}
	// Remove os 3 primeiros caracteres da string original
	my_string = string_delete(my_string, 1, 3);
	
	return my_string;
}

function create_weighted_array(items, weights) {
    var weighted_array = [];
    var total_weight = 0;

    // Calcular a soma total das porcentagens para normalizar os pesos
    for (var i = 0; i < array_length(weights); i++) {
        total_weight += weights[i];
    }

    // Normalizar os pesos para que somem 100%
    for (var i = 0; i < array_length(weights); i++) {
        weights[i] = weights[i] / total_weight * 100;
    }
    
    // Preencher a array com a string "nulo"
    for (var i = 0; i < global.intern.procedural.charactersmax; i++) {
        weighted_array[i] = gpt1;
    }

    // Adicionar cada item à nova array com base na sua porcentagem
    var index = 0;
    for (var i = 0; i < array_length(items); i++) {
        var item_weight = weights[i] / 100;
        var item_count = round(item_weight * global.intern.procedural.charactersmax); // Aproxima o número de ocorrências com base no tamanho da array
        for (var j = 0; j < item_count; j++) {
            if (index < global.intern.procedural.charactersmax) {
                weighted_array[index] = items[i];
                index++;
            }
        }
		
    }
    sdm(array_length(weighted_array));
    return weighted_array;
}
