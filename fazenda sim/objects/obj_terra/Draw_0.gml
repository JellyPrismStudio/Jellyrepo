draw_self();
draw_sprite_ext(sprite[spr], planta, x, y-13, 2, 2, 0, c_white, 1);
if (vida < 100) draw_healthbar(x-40, y-100, x+40, y-93, vida, c_black, c_red, c_lime, 0, true, true);