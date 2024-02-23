/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


// Script para tirar print da tela e salvar em pasta

// Definindo a pasta de destino


// Função para tirar print da tela
function TirarPrint(nome_arquivo) {
  // Criando superfície para armazenar a imagem
  var pasta_destino = "C:/Users/Kauzz/Desktop/";
  var superficie = surface_create(50000, 50000);
  
  // Copiando a tela para a superfície
  surface_copy(pasta_destino,0, 0, superficie);
  
  // Salvando a superfície como PNG
  surface_save(superficie, "Test.pn");
  
  // Liberando a superfície
  surface_free(superficie);
}

// Definindo nome do arquivo
var nome_arquivo = "PrintGMS_";

// Tirando print da tela
TirarPrint(nome_arquivo);

// Mostrando mensagem de sucesso
show_message("Print salvo com sucesso!");






