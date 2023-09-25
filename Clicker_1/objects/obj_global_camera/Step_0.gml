if (live_call()) return live_result;

atualizar_variavel = 4304;

#region funcoes
	// * Algumas funcoes precisam ser atualizadas a todo momento.
	// * as que não puderem ser definidas no create são definidas aqui
	// * Comentários ou nome das regiões em PT.
	// * nome de variáveis e funçoes sempre que possível em inglês.
	
	checar_margem = function()
	{
		// * Essa função não está mais sendo usada e é só um exemplo
		
		// Verifique se o mouse está próximo das bordas da janela
		margin = 50; // Defina a margem de proximidade desejada
		if (mouse_x_gui < margin) {
		    // O mouse está próximo da borda esquerda da janela
		} else if (mouse_x_gui > display_get_gui_width() - margin) {
		    // O mouse está próximo da borda direita da janela
		}

		if (mouse_y_gui < margin) {
		    // O mouse está próximo da borda superior da janela
		} else if (mouse_y_gui > display_get_gui_height() - margin) {
		    // O mouse está próximo da borda inferior da janela
		}
		
	/// ========== ///
	
	
	}
	
#endregion

#region main
	// * Agrupa todo o código que ficaria solto no step aqui.
	// * Pra desativar o step, basicamente é só desativar o main no final desse código.
	main = function(){
		
		// * A maioria (se não todos os projetos) vai vir com o LiveEdit instalado.
		// * Esse trecho da linha 1 é necessário para o objeto se tornar 'editável'
		// * Enquanto testa. Esse trecho deve ser sempre removido do código
		// * Depois de ter o objeto finalizado, pois pesa no processamento.
		
		if mouse_check_button_pressed(mb_right)
		{
			mouse_ox = window_mouse_get_x();
			mouse_oy = window_mouse_get_y();
	
		}

		mouse_x_gui = window_mouse_get_x() - mouse_ox;
		mouse_y_gui = window_mouse_get_y() - mouse_oy;

		checar_margem()

		if mouse_check_button(mb_right)
		{
			x += lerp(0,mouse_x_gui,0.04*(global.mouse_zoom*2));
			y += lerp(0,mouse_y_gui,0.04*(global.mouse_zoom*2));
		}
	}
#endregion

main();
// * Pode ter outros nomes ou outras execuções: main1, main2, premain, postmain, etc -
// * caso haja necessidade de ordem de carregamento e etc.