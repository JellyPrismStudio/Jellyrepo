/////////////
// * Variaveis
/////////////

#region variaveis
	variavel_1 = 1;
	mouse_pos_x = x;
	mouse_pos_y = y;
	// * Nome de variavel claro. Pode ter nome comprido: posicao_x_do_mouse_na_tela = x;

	mouse_x_gui = window_mouse_get_x() - display_get_gui_width() / 2;
	mouse_y_gui = window_mouse_get_y() - display_get_gui_height() / 2;

	mouse_ox = display_get_gui_width() / 2;
	mouse_oy = display_get_gui_height() / 2;
	
#endregion


/////////////
// * Funções
/////////////

#region funcoes
	// * Funções sempre que possível com nome claro e descrição curta sobre o que faz.
	// * Se o código for muito longo, quanto mais fragmentar em funções locais
	// * E quanto mais deixar o código comentado, melhor
	
	
	/// ========================================================= ///
	/// DESENHAR PONTEIRO (f_draw_mouse_pointer):
	/// Desenha o ponteiro do mouse quando o mb_right for cllicado
	/// ========================================================= ///
	f_adicionar_a_variavel = function(_arg1 = 1)
	{
		// Adiciona um valor a variavel
		variavel_1 += _arg1;		
	}
	
	f_adicionar_o_valor_um_a_variavel = function(_arg1);
	
	f_draw_mouse_pointer = function() // * Método usado para funções locais
	{								  // * sempre dar enter, nos IFs também.
		// Pega a posição X e Y do mouse na window (e não na room como é o mouse_x)

		if mouse_check_button_pressed(mb_right)
		{
			
			mouse_drawx = window_mouse_get_x();
			mouse_drawy = window_mouse_get_y();
		}
		if mouse_check_button(mb_right)
		{
			draw_sprite(spr_mouse_move,0,mouse_drawx,mouse_drawy);	
		}
	
	}
	/// ============== ///
	
	
	/// ========================================================= ///
	/// DUPLICAR VALOR (f_duplicar_valor):
	/// Duplica o valor de uma variavel 
	/// ========================================================= ///
	f_duplicar_valor = function(_arg1)
	{
		color = c_yellow;
		var _color = c_red;
		_arg1 *= 2;
		return _arg1;		
	}
	/// ============== ///

#endregion

/////////////
// * Aplicação de Métodos, ou atribuição de variáveis que precisam de uma função custom,
// * Que precisem ser executados posteriormente, ou que para melhor organização seja melhor
// * Separar
/////////////

#region metodos
	display_set_gui_size(display_get_width(), display_get_height());
	display_set_gui_maximise(true);
	var _dobro = f_duplicar_valor(60); 
	f_adicionar_a_variavel();
	variavel_1 *= 2;
	// * variavel local com o _ na frente. Variável de objeto não precisa (linha 9)
#endregion