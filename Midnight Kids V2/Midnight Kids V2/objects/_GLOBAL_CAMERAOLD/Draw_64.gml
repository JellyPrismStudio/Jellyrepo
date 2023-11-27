draw_set_font(Ruler);
draw_set_halign(fa_left);
//draw_mouse_coordinates();
chp = c_red;
csp = c_blue;
cnrm = c_white;
clvl = c_green;
catk = c_fuchsia;
simplified = true;

draw_set_halign(fa_left);
draw_set_valign(fa_top);

if global.debug.debugshow {
	if customtarget draw_text(10,30, "Focando em inimigo");
	else draw_text(10,30, "Focando player");
}


draw_hud();

if global.debug.debugshow{
	draw_text(30,10, fps_real);
	draw_text(120,10, fps);
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