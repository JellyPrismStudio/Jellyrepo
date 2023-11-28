/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if live_call() return live_result;
if to_gamepad_pressed(vk_tab) or global.config.interaction or image_blend != c_white
{
	if kget_radius(id, 120, true, true, false, global.player.id) {
		image_alpha = 0.8
		image_xscale = 1;
		image_yscale = 1;
	}
	else {
		if image_blend == c_white	{
			image_alpha = 0.5;
			image_xscale = 0.4;
			image_yscale = 0.4;
		}
	}
	
}
else image_alpha = 0

if global.on_message or global.onmenu or global.on_build image_alpha = 0