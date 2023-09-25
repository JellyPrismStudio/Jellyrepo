// ALARME DOS PONTOS / AUTO-CLICK
// Adiciona os pontos e reinicia o alarme

scale = 1.8;
image_yscale = scale;
image_xscale = scale;
PASSIVE = 13;
global.points += PASSIVE;
var num = instance_create_depth(x,y,depth-1000,obj_numberpopup)
num.number = PASSIVE;
num.col = c_white;
alarm[0] = TIME;