if (live_call()) return live_result;

draw_text(10,10, "F3 - Perlin Noise - Proc. Gen")
draw_text(10,30, "F2 - Change Seed")



/// Função para desenhar uma ds_grid na tela
function draw_ds_grid(grid, x, y, largura_celula, altura_celula) {
    var largura = ds_grid_width(grid);
    var altura = ds_grid_height(grid);

    // Loop para percorrer cada célula da grid
    for (var grid_y = 0; grid_y < altura; grid_y++) {
        for (var grid_x = 0; grid_x < largura; grid_x++) {
            // Obtém o valor da célula
            var valor_celula = ds_grid_get(grid, grid_x, grid_y);
            
            // Calcula as coordenadas de desenho para a célula
            var draw_x = x + (grid_x * largura_celula);
            var draw_y = y + (grid_y * altura_celula);

            // Desenha o valor da célula na tela
			var _color = make_color_hsv(valor_celula,255,valor_celula)         
			draw_text_color(draw_x, draw_y, "0", _color, _color, _color, _color, 1);
        }
    }
}

// Exemplo de uso
if perlin == true
{
	var pos_x = 0; // Posição x inicial para desenho da grid
	var pos_y = 0; // Posição y inicial para desenho da grid
	var largura_celula = gridsize; // Largura da célula da grid
	var altura_celula = gridsize; // Altura da célula da grid
	draw_ds_grid(someGrid, pos_x, pos_y, largura_celula, altura_celula); // Chama a função para desenhar a ds_grid
}