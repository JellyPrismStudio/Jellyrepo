

function _procedural_check_collission(x1, x2, y1, y2){
	collides = false;
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

function _procedural_create_from_seed(xx, yy, seed, array){
	var _seed = _array_from_seed(seed, array);
	var inst = instance_create_depth(xx,yy,depth,_seed[procedural_i]);
	array_push(procedural_instances, inst.id);
	if procedural_i <= 9 procedural_i++;
	else procedural_i = 1;
}

/// Shuffle array of integers
/// @param arr The array to shuffle
function _shuffle_array(arr) {
    var n = array_length(arr);
    for (var i = n - 1; i > 0; i--) {
        var j = irandom_range(0, i);
        var temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
    }
}

/// Convert array of integers to real number
/// @param arr The array to convert
/// @returns The real number represented by the array
function _array_to_real(arr) {
    var str = "";
    var n = array_length(arr);
    for (var i = 0; i < n; i++) {
        str += string(arr[i]);
    }
    var num = real(str);
    return num;
}

// Função para ordenar uma array de acordo com um número de ordem
// Parâmetros:
// - arr: a array a ser ordenada
// - ordem: o número de ordem que indica a ordem de carregamento da array
// Retorno:
// - Uma nova array ordenada em ordem crescente
function _organize_by_order(arr, ordem) {
    var arrOrdenada = array_create(array_length(arr)); // cria uma nova array do mesmo tamanho da original
    var indiceDestino = 0;
    var indicesVisitados = array_create(30, false); // array para controlar quais índices já foram visitados
    for (var i = 0; i < 30; i++) {
        var indiceOrigem = ordem[i];
        if (indicesVisitados[indiceOrigem]) continue; // já visitou esse índice
        arrOrdenada[indiceDestino] = arr[indiceOrigem];
        indiceDestino++;
        indicesVisitados[indiceOrigem] = true;
    }
    return arrOrdenada;
}
	
function _array_from_seed(seed, nomes) {
    var len = array_length(nomes);
    var ordem = string_length(string(seed));
    var array_nova = array_create(ordem, "");
    for (var i = 0; i <= ordem; i++) {
        var digito = string_char_at(seed, i);
        if digito < array_length(nomes) array_seed[i] = digito;
		else {
			while digito >= array_length(nomes){
				digito -= array_length(nomes);
			}
			array_seed[i] = string(digito);
		}
		
    }
    for (var j = 1; j <= ordem; j++) {
		alpha_stringify(array_seed[j]);
        var indice = clamp(array_seed[j], 0, len-1);
        array_nova[j] = nomes[indice];
    }
	sdm("A:", array_nova);
	// A: Objetos
	sdm("B:", array_seed);
	// B: String dos numeros
    return array_nova;
}

/// organizar_array_ordenado(seed)
//
//  Cria uma array organizada com base na seed fornecida.
//  A seed deve ser um número inteiro de 30 dígitos sem repetições.
//
//  Argumentos:
//  seed: número inteiro de 30 dígitos sem repetições
//
//  Retorna:
//  Array organizada

function _split_seed(seed)
{
    // Converte a seed em uma array
    var ordem = string_digits(string(seed));
    
    // Cria a array de resultado
    var resultado = array_create(30, 0);
    
    // Preenche a array de resultado na ordem correta
    for (var i = 0; i < 30; i++)
    {
        resultado[i] = ordem[resultado];
    }
    
    return resultado;
}


function procedural_gen(width, height, objects, seed = 0){
	sdm(seed);
	if !variable_instance_exists(self, "procedural_i") variable_instance_set(self,"procedural_i", 1);
	if !variable_instance_exists(self, "procedural_instances") variable_instance_set(self,"procedural_instances", [0]);
	var sx = self.x;
	var sy = self.y;
	
	
	var sprw = ceil(sprite_width/width);
	var sprh = ceil(sprite_height/height);
	
	arr[sprw, sprh] = 0;
	var index = 0;
	for(iw=0;iw<sprw;iw++){
		
		var xx = x + iw * width;
		for (ih=0;ih<sprh;ih++){
			var yy = y + ih * height;
			
			var on_collission = _procedural_check_collission(xx,xx + width, yy, yy + height);
			if on_collission[0] {
				xv = 0//irandom_range(-sprw/2, sprw/2);
				yv = 0//irandom_range(-sprh/2, sprh/2);
				_procedural_create_from_seed(on_collission[1] + xv, on_collission[2]+yv, seed, objects)
			}
			arr[iw, ih] = index;
			index++;
		}
	}
	_shuffle_array(test);
	var num = _array_to_real(test);
}