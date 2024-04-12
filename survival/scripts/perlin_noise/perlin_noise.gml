/// noise(grid, min_radius, max_radius, margin, value, upper_limit, lower_limit)
function noise(_grid, _minr, _maxr, _margin, _val, _upwl, _lowl, _seed = irandom_range(0,9999999999999999)) {
	var seed_atual = random_get_seed();
	//random_set_seed(_seed);
	show_message(_seed);
	
    var grid = _grid; // Grade para popular
    var w = ds_grid_width(grid);
    var h = ds_grid_height(grid);

    // Limpar a grade
    ds_grid_clear(grid, 0);

    // Argumentos para geração
    var rmn = _minr; // Raio mínimo
    var rmx = _maxr; // Raio máximo
    var sep = _margin; // Separação entre discos

    // Variáveis de inicialização
    var v = 0;
    var randi = _val; // Valor máximo dos discos

    // Gerar discos na grade
    for (var iy = 0; iy < h; iy += sep) {
        for (var ix = 0; ix < w; ix += sep) {
            // Gerar disco com valor aleatório
            v = random(randi);
            ds_grid_add_disk(grid, ix, iy, random_range(rmn, rmx), v);
        }
    }

    // NORMALIZAÇÃO: Normalizar os valores
    var gridmx = (ds_grid_get_max(grid, rmx, rmx, w - rmx, h - rmx) + 1);
    var gridmn = ds_grid_get_min(grid, rmx, rmx, w - rmx, h - rmx);

    // Argumentos de limite
    var ul = _upwl; // Limite superior
    var ll = _lowl; // Limite inferior

    // Loop através da grade e definir valores dentro do intervalo [ll, ul]
    for (var iy = 0; iy < h; iy++) {
        for (var ix = 0; ix < w; ix++) {
            // Normalizar
            v = floor((grid[# ix, iy] - gridmn) * ul / (gridmx - gridmn));

            // Se o valor for igual ao limite inferior, reduzir para 0
            var r = max(v, ll);
            if (r == ll) r = 0;

            // Atualizar a grade
            grid[# ix, iy] = r;
        }
    }
	
	random_set_seed(seed_atual);
}


/// noise(grid, min_radius, max_radius, margin, value, upper_limit, lower_limit, min_value)
function noise2(_grid, _minr, _maxr, _margin, _val, _upwl, _lowl, _min_value, _seed = irandom_range(0,9999999999999999)) {
    //var seed_atual = random_get_seed();
    
    var grid = _grid; // Grade para popular
    var w = ds_grid_width(grid);
    var h = ds_grid_height(grid);

    // Limpar a grade
    ds_grid_clear(grid, 0);

    // Argumentos para geração
    var rmn = _minr; // Raio mínimo
    var rmx = _maxr; // Raio máximo
    var sep = _margin; // Separação entre discos
    var randi = _val; // Valor máximo dos discos

    // Variáveis de inicialização
    var v = 0;
    
    // Gerar discos na grade
    for (var iy = 0; iy < h; iy += sep) {
        for (var ix = 0; ix < w; ix += sep) {
            // Gerar disco com valor aleatório
            v = random(randi);
            
            // Garante que o valor mínimo seja respeitado
            v = max(v, _min_value);

            // Gerar disco com forma escolhida
            ds_grid_add_disk(grid, ix, iy, random_range(rmn, rmx), v);
        }
    }
	


    // NORMALIZAÇÃO: Normalizar os valores
    var gridmx = (ds_grid_get_max(grid, rmx, rmx, w - rmx, h - rmx) + 1);
    var gridmn = ds_grid_get_min(grid, rmx, rmx, w - rmx, h - rmx);

    // Argumentos de limite
    var ul = _upwl; // Limite superior
    var ll = _lowl; // Limite inferior

    // Loop através da grade e definir valores dentro do intervalo [ll, ul]
    for (var iy = 0; iy < h; iy++) {
        for (var ix = 0; ix < w; ix++) {
            // Normalizar
            v = floor((grid[# ix, iy] - gridmn) * ul / (gridmx - gridmn));

            // Se o valor for igual ao limite inferior, reduzir para 0
            var r = max(v, ll);
            if (r == ll) r = 0;

            // Atualizar a grade
            grid[# ix, iy] = r;
        }
    }
    save_grid_to_txt(grid, "C:/Users/Kauzz/Documents/Jellyfish Studios/Jellyrepo/survival/datafiles/level1.txt");
    //random_set_seed(seed_atual);
	
}

/// noise_dynamic(grid, min_radius, max_radius, margin, value, upper_limit, lower_limit, min_value, _seed)
function noise3(_grid, _minr, _maxr, _margin, _val, _upwl, _lowl, _min_value, _seed = irandom_range(0,9999999999999999)) {
    var seed_atual = random_get_seed();
    //random_set_seed(_seed);
    show_message(_seed);

    var grid = _grid; // Grade para popular
    var w = ds_grid_width(grid);
    var h = ds_grid_height(grid);

    // Limpar a grade
    ds_grid_clear(grid, 0);

    // Argumentos para geração
    var rmn = _minr; // Raio mínimo
    var rmx = _maxr; // Raio máximo
    var sep = _margin; // Separação entre discos
    var randi = _val; // Valor máximo dos discos

    // Variáveis de inicialização
    var v = 0;
    
    // Tamanho da região
    var region_size = 300;

    // Variáveis para dividir em regiões
    var region_x = 0;
    var region_y = 0;

    // Gerar discos na grade divididos em regiões
    while (region_y < h) {
        // Criar uma ds_grid para a região
        var region_grid = ds_grid_create(region_size, region_size);
        ds_grid_clear(region_grid, 0);

        // Gerar discos na região
        for (var iy = 0; iy < region_size && region_y < h; iy++) {
            for (var ix = 0; ix < region_size && region_x < w; ix++) {
                // Gerar disco com valor aleatório
                v = random(randi);
                
                // Garante que o valor mínimo seja respeitado
                v = max(v, _min_value);

                // Gerar disco com forma escolhida na região
                ds_grid_add_disk(region_grid, ix, iy, random_range(rmn, rmx), v);

                // Atualizar coordenadas globais
                var global_x = region_x + ix;
                var global_y = region_y + iy;
                if (global_x < w && global_y < h) {
                    ds_grid_set(grid, global_x, global_y, v);
                }
            }
        }
		


        // Salvar a região em um arquivo de texto
        

        // Destruir a ds_grid da região para liberar memória
        ds_grid_destroy(region_grid);

        // Atualizar coordenadas da próxima região
        region_x += region_size;
        if (region_x >= w) {
            region_x = 0;
            region_y += region_size;
        }
    }
	
	

    random_set_seed(seed_atual);
}


/// removePrimeirasLinhasColunas(ds_grid, num_linhas, num_colunas)


function normalize_grid(ds_grid, linhas_inicio, linhas_fim = linhas_inicio, colunas_inicio = linhas_inicio, colunas_fim = linhas_inicio)
{
    var new_grid;
    var width = ds_grid_width(ds_grid) - colunas_inicio - colunas_fim;
    var height = ds_grid_height(ds_grid) - linhas_inicio - linhas_fim;
    
    if (width <= 0 || height <= 0)
    {
        show_debug_message("Erro: Grid resultante tem dimensões negativas ou nulas.");
        return undefined;
    }

    new_grid = ds_grid_create(width, height);
    
    var i, j;
    for (i = linhas_inicio; i < ds_grid_height(ds_grid) - linhas_fim; i++)
    {
        for (j = colunas_inicio; j < ds_grid_width(ds_grid) - colunas_fim; j++)
        {
            ds_grid_set(new_grid, j - colunas_inicio, i - linhas_inicio, ds_grid_get(ds_grid, j, i));
        }
    }
    
    return new_grid;
}




/// save_grid_to_txt(grid, file_name)
function save_grid_to_txt(_grid, _file_name) {
    var w = ds_grid_width(_grid);
    var h = ds_grid_height(_grid);

    // Abrir arquivo de texto para escrita
    var file = file_text_open_write(_file_name);

    // Verificar se o arquivo foi aberto corretamente
    if (file >= 0) {
        // Escrever os valores da ds_grid no arquivo de texto
        for (var iy = 0; iy < h; iy++) {
            for (var ix = 0; ix < w; ix++) {
                var value = ds_grid_get(_grid, ix, iy);
                file_text_write_real(file, value);
                file_text_write_string(file, "\t"); // Adiciona um tab para separar os valores
            }
            file_text_write_string(file, "\n"); // Adiciona uma quebra de linha no final de cada linha
        }
        
        // Fechar o arquivo
        file_text_close(file);
    } else {
        show_message("Erro ao abrir o arquivo de texto para escrita.");
    }
}

