if (live_call()) return live_result;

#region functions
	// Função para modificar várias propriedades de aparência de um sprite.
	f_mudar_aparencia = function(sprite_index, blend_mode, alpha, rotation, scale_x, scale_y)
	{
    if (sprite_index != -1)
    {
        if (blend_mode != -1)
        {
            image_blend = blend_mode;
        }
        
        if (alpha != -1)
        {
            image_alpha = alpha;
        }
        
        if (rotation != -1)
        {
            image_angle = rotation;
        }
        
        if (scale_x != -1)
        {
            image_xscale = scale_x;
        }
        
        if (scale_y != -1)
        {
            image_yscale = scale_y;
        }
    }
}

	// Função que faz qualquer coisa
	f_qualquer_coisa = function()
	{
		
	}
	
#endregion

main = function()
{
	
	f_mudar_aparencia(spr_qualquer_coisa,c_red,0.6,195,2,3);
	
}
main()