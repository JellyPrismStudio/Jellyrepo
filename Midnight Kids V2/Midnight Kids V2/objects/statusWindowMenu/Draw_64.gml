/// @description Insert description here
//250
cw = global.config.camera_width/2;
ch = global.config.camera_height/2;
ocw = object_viewport.x;
och = object_viewport.y;



n = 0;
nm = 0;

xpc = #B6FF55;
ptc = #FFBB56;


draw_set_font(DayDream_pt11);
draw_set_halign(fa_center);
draw_text(cw,(ch- 315+nm),"Party Status");
//56
for(i=0;i<space;i++){
	n =	global.party.players[i];
	if n != -1{
		draw_set_font(DayDream_pt11);
		draw_set_halign(fa_left);
		draw_text_color(cw - 120,(ch- 260+nm),global.player_stats[n].nome, c_orange, c_orange, c_orange, c_orange, 1);
		//draw_text(cw - 120,(ch- 260+nm),global.player_stats[n].nome);
		draw_set_font(Ruler);
	
		draw_text(cw - 120,(ch- 240+nm),"hp: " + string(int64(global.player_stats[n].hp)) + " | " + string(global.player_stats[n].mhp));
		draw_text(cw +   0,(ch- 240+nm),"sp: " + string(int64(global.player_stats[n].sp)) + " | " + string(global.player_stats[n].msp));

		draw_set_font(DayDream_pt11);
		draw_text(cw - 120,(ch- 190+nm),"ATK: " + string(global.player_stats[n].atack));
		draw_text(cw - 120,(ch- 170+nm),"DEF: " + string(global.player_stats[n].def));
		draw_text(cw - 120,(ch- 150+nm),"HIT: " + string(global.player_stats[n].hitrate));
		draw_sprite_ext(global.player_stats[n].idlegraph, 0, cw + 213, (ch-150+nm), 2, 2, 0, c_white, 1);

		draw_text(cw	  ,(ch- 190+nm),"MAG: " + string(global.player_stats[n].magic));
		draw_text(cw	  ,(ch- 170+nm),"CRI: " + string(global.player_stats[n].crit));
		draw_text(cw      ,(ch- 150+nm),"EVA: " + string(global.player_stats[n].evasion));
	
		draw_set_font(Ruler);
		draw_text_color(cw - 120 ,(ch- 128+nm), "points: " + string(global.player_stats[n].freepoints),ptc,ptc,ptc,ptc,1);
		draw_text_color(cw       ,(ch- 128+nm), "xp: " + string(global.player_stats[n].xp), xpc,xpc,xpc,xpc,1);
		//if i < 2 draw_text(cw - 120 ,(ch- 110+nm), "-----------------------------");
	
		draw_set_halign(fa_right)
		draw_text_color(cw + 110,(ch- 255+nm),"level: " + string(global.player_stats[n].level), c_orange,c_orange,c_orange,c_orange,1);
	  
		nm += 190;
	}
// You can write your code in this editor
}


