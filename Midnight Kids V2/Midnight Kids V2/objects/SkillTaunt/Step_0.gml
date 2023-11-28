// Função para verificar e definir o estado "TAUNTED" para inimigos no raio
function applyTauntEffect(x, y) {
    // Defina o raio de colisão em pixels
    var radius = 100;
    
    // Crie uma lista para armazenar os IDs dos inimigos no raio
    var enemyList = ds_list_create();

    // Use collision_circle_list para verificar colisões no raio
    var numCollisions = collision_circle_list(x, y, radius, oENM_Main, false, true, enemyList, false);
    
    // Verifique se houve colisões e atualize o estado dos inimigos
    if (numCollisions > 0) {
        for (var i = 0; i < numCollisions; i++) {
            var enemyID = ds_list_find_value(enemyList, i);
            
            // Mude a variável state_machine para "TAUNTED"
            enemyID.state_machine = "TAUNTED";
        }
    }
	
	global.party.ultimate += (0.005 + ds_list_size(enemyList)/500);
    
    // Libere a lista após o uso
    ds_list_destroy(enemyList);
}

applyTauntEffect(x, y);