if (live_call()) return live_result;

draw_self();
if INGREDIENTS == 3 image_blend = c_red;
if INGREDIENTS == 1 image_blend = c_olive;
if INGREDIENTS == 2 image_blend = c_green;
if INGREDIENTS == 0 image_blend = c_white;


for(i=0;i<INGREDIENTS;i++)
{
	if i == 0 var _ing = spr_ingrLaranja;
	if i == 1 var _ing = spr_ingrAwa;
	if i == 2 var _ing = spr_ingrGelo;
	
	draw_sprite(_ing, 0, x+150,  y + i*64 - 50)

}
draw_text(x, y-100, "INGREDIENTES: " + string(INGREDIENTS) +"/" + string(INGREDIENTS_MAX))