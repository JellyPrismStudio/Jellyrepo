draw_sprite_ext(spr_sementes, 0, 45, room_height-45, 4, 4, 0, c_white, 1);
draw_set_valign(fa_center);
draw_text(75, room_height-45, ": "+string(sementes));
draw_set_valign(-1);