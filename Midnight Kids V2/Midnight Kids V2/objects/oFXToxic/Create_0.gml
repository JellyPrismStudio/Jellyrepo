// Defina o número de objetos a serem instanciados
var numObjetos = 12;

numObjetos = irandom_range(numObjetos - numObjetos/3, numObjetos + numObjetos*.6);

var corR = 168//irandom_range(0, 255);
var corG = 148//irandom_range(0, 255);
var corB = 167//irandom_range(0, 255);
var novaCor = make_colour_rgb(corR, corG, corB);
image_blend = make_colour_rgb(corR, corG, corB);
// 168 148 167 Marrom/Cinza

// Defina a distância que cada objeto deve estar do objeto inicial
var distancia = 50;

// Calcule o ângulo entre cada objeto com base no número de objetos a serem instanciados
var angulo = 360 / numObjetos;

// Instancie os objetos e defina sua posição e velocidade com base no ângulo e na distância
for (var i = 0; i < numObjetos; i++) {
    var novoObjeto = instance_create_depth(x, y, depth, oFX_ToxicParticle);
    var anguloRad = i * angulo;
    novoObjeto.speed = 1; // ou qualquer velocidade que você quiser
    novoObjeto.direction = anguloRad;
	novoObjeto.image_angle = anguloRad;
	novoObjeto.image_blend = novaCor;
}