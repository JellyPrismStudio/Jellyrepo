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
