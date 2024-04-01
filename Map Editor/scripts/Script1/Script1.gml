function load_graphic(obj = self)
{
	var file;
	file = get_open_filename("Select an image", "*.png"); 
	// Abre o navegador de arquivos para selecionar um arquivo PNG

	if file != ""
	{
    
	    // Carrega a imagem como um sprite
	    spriteindex = sprite_add(file, 1, false, false, 0, 0);
    
	    // Verifica se o sprite foi carregado com sucesso
	    if spriteindex != -1
	    {
	        // Define o sprite_index do objeto para o sprite carregado
	        obj.sprite_index = spriteindex;
			var surf, spr_custom;
			surf = surface_create(sprite_get_width(spriteindex), sprite_get_height(spriteindex));
			surface_set_target(surf);
			draw_clear_alpha(c_black, 0);
			draw_sprite(spriteindex, 0, 0, 0);
			spr_custom = sprite_create_from_surface(surf, 0, 0, sprite_get_width(spriteindex), sprite_get_height(spriteindex), false, false, 16, 16);
			surface_reset_target();
			surface_free(surf);
			show_message(file);
			sprite_save(spr_custom, 0, "C:/Users/Kauzz/Documents/GameMakerStudio2/Map Editor/screenshots/" + file + ".png");
			sprite_delete(spr_custom);
	    }
	    else
	    {
	        show_debug_message("Erro ao carregar o sprite.");
	    }
	}		
}



function capture_and_save_room_screenshot() {
    // Cria uma surface para capturar o print da sala
    global.surface = surface_create(room_width, room_height);
	surface_set_target(global.surface);
    // Inicia a captura na surface
	
	with(all)
	{
		draw_self();	
	}
	
    var caminho_arquivo = working_directory + "/screenshots/Teste3.png";
    surface_save(global.surface, caminho_arquivo);

    // Destroi a surface
	surface_reset_target();
	surface_free(global.surface);
}

