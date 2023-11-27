kdepth_sort(true);

/*if keyboard_check_direct(vk_backspace) {
	xxo = 64;
	yyo = 64;
	yy1 = sprite_yoffset; // Origin
	xx1 = sprite_xoffset; // 
	xxf = xxo - xx1;
	yyf = yyo - yy1;
	if yy1 != yyo and xx1 != xxo {
		sprite_set_offset(sprite_index, xxo, yyo);
		x += xxf; y += yyf;
	}
	
}// Está funcionando, mas quando aperta bckspace e tem mais de um objeto, executa
// uma vez pra cada. Quando reentra na room, a pos da linha 11 reseta.
*/blend_behind_object();