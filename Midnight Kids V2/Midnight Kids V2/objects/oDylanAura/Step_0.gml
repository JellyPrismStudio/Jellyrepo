// Loop que percorre todos os objetos da room
for (var i = 0; i < instance_number(oENM_Main); i++) {
    var obj = instance_find(oENM_Main,i);

    // Verifica se o objeto está colidindo com o retângulo de colisão
   if place_meeting(x,y,obj) {
        // Adiciona o ID do objeto à array
        if !find_value_on_array_bool(IDS,obj)
		{
			array_push(IDS, obj)
		}
    }
}