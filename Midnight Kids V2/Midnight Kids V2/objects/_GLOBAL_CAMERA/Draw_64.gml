if live_call() return live_result;








draw_set_font(Ruler);
draw_set_halign(fa_left);
//draw_mouse_coordinates();
chp = c_red;
csp = c_blue;
cnrm = c_white;
clvl = c_green;
catk = c_fuchsia;
simplified = true;

function draw_ultimate_bar()
{
	var rectWidth = 400; // Largura do retângulo
	var rectHeight = 20; // Altura do retângulo
	var percentage = (global.party.ultimate); // Substitua pela porcentagem desejada (de 0 a 100)
	var rectX = 640 - rectWidth / 2; // Posição X inicial do retângulo
	var rectY = 680; // Posição Y inicial do retângulo
	

	var fillX1 = rectX; // Defina a posição X inicial do preenchimento
	var fillX2 = rectX + (rectWidth * percentage / 100); // Defina a posição X final do preenchimento

	draw_roundrect_colour(rectX, rectY, rectX + rectWidth, rectY + rectHeight, c_dkgray, c_dkgray, false); // Desenha o retângulo de fundo
	
	plus_text_font(rectX + rectWidth + 20, rectY + rectHeight/2, string(percentage) + "%", c_orange, DayDream_pt6, fa_left, fa_middle)
	
	if percentage >= 100
	{
		plus_text_font(rectX + rectWidth/2, rectY - rectHeight/2, "Ultimate Ready!", c_white, DayDream_pt8, fa_center, fa_middle)
		draw_roundrect_colour(fillX1, rectY, fillX2, rectY + rectHeight, c_orange, c_orange, false); // Desenha o retângulo de preenchimento
	}
	else
	{
		
		draw_roundrect_colour(fillX1, rectY, fillX2, rectY + rectHeight, c_green, c_green, false); // Desenha o retângulo de preenchimento
	}
}

draw_ultimate_bar()
draw_set_halign(fa_left);
draw_set_valign(fa_top);

if global.debug.debugshow {
	if customtarget draw_text(10,30, "Focando em inimigo");
	else draw_text(10,30, "Focando player");
}


draw_hud();

if global.debug.debugshow{
	
	if variable_global_exists("player_stats") {
		if simplified {
		draw_text_color(600, 700, global.player,csp,csp,csp,csp,1);			
		draw_text_color(10, 700, "hp: " + string(global.player_stats[global.player_index].hp),chp,chp,chp,chp,1);
		draw_text_color(60, 700, "sp: " + string(global.player_stats[global.player_index].sp),csp,csp,csp,csp,1);
		draw_text_color(120, 700, "level: " + string(global.player_stats[global.player_index].level),clvl,clvl,clvl,clvl,1);
		draw_text_color(180, 700, "atk: " + string(global.player_stats[global.player_index].atack),catk,catk,catk,catk,1);
		}
		else draw_text(10,700, global.player_stats[global.player_index]);
	}
	if instance_exists(global.player) draw_text(300, 10, ("x: " + string(global.player.x) + " y: " + string(global.player.y) + " Mapa: " + room_get_name(room)));
	time = get_timer() / 1000000;
	draw_text(500,10,time);
	if global.debug.ghosting draw_text(200,10, "Ghost Mode");
	if instance_exists(oCaptain_Spiffy){
		if global.party.capagressive		draw_text(600,10,"Captain Spiffy Agressive");
		else if !global.party.capagressive	draw_text(600,10,"Captain Spiffy Decides to come in peace");
	}
}