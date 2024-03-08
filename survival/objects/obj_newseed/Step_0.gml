if (live_call()) return live_result;

/// Converte cada número em uma string para seu equivalente em módulo 2
/// @param string_input A string contendo vários números

function numeros_para_modulo_2(string_input) {
    var resultado = "";

    // Percorre cada caractere na string de entrada
    for (var i = 0; i < string_length(string_input); i++) {
        // Obtém o número atual da string de entrada
		if string_char_at(string_input, i) == "." break
        var numero = real(string_char_at(string_input, i));
        // Calcula o módulo 2 do número e adiciona ao resultado
        resultado += string(numero mod 3);
    }

    return resultado;
}

// Exemplo de uso
if keyboard_check_pressed(vk_f1)
{
    _str = "z";	
	var _res1 = string_byte_at(_str, 1);
	var _res2 = string_byte_at(_str, 2);
	var _
	
	
	var _val1 = (power(floor(_res1/10),int64(_res1 + _res2)));
	var _val2 = _val1 * 3;
	var _val3 = _val2 * 6;
	var _final = string(abs(_val1));
	var _final2 = string(abs(_val2));
	var _final3 = string(abs(_val3));
	show_message(_final);
	var _seed = numeros_para_modulo_2(_final) + numeros_para_modulo_2(_final2) + numeros_para_modulo_2(_final3)
	seedserial = int64(_seed);
	show_message(seedserial);
	show_message(string_length(_seed))
	
}

if keyboard_check_pressed(vk_f2)
{
	seedserial = get_string_async("Seed:", "01039902");
	
}


//////////////////////

/// Função para gerar ruído Perlin
function perlin_noise(xx, yy) {
    // Calcular a grade (grid) da célula
    var x0 = floor(xx);
    var x1 = x0 + 1;
    var y0 = floor(yy);
    var y1 = y0 + 1;

    // Calcular a posição do ponto dentro da célula
    var sx = x - x0;
    var sy = y - y0;

    // Gerar gradientes aleatórios para os vértices da célula
    var n00 = random(255);
    var n01 = random(255);
    var n10 = random(255);
    var n11 = random(255);

    // Interpolar os gradientes ao longo do eixo x
    var ix0 = lerp(n00, n10, sx);
    var ix1 = lerp(n01, n11, sx);

    // Interpolar os resultados anteriores ao longo do eixo y
    return lerp(ix0, ix1, sy);
}


////





