if (keyboard_check_pressed(ord("W"))) scr_writekey(KEY_UP, true);
if (keyboard_check_released(ord("W"))) scr_writekey(KEY_UP, false);
if (keyboard_check_pressed(ord("A"))) scr_writekey(KEY_LEFT, true);
if (keyboard_check_released(ord("A"))) scr_writekey(KEY_LEFT, false);
if (keyboard_check_pressed(ord("S"))) scr_writekey(KEY_DOWN, true);
if (keyboard_check_released(ord("S"))) scr_writekey(KEY_DOWN, false);
if (keyboard_check_pressed(ord("D"))) scr_writekey(KEY_RIGHT, true);
if (keyboard_check_released(ord("D"))) scr_writekey(KEY_RIGHT, false);