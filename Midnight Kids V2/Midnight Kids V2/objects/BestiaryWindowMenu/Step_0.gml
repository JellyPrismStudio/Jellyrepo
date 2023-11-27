if (keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"))) and enemy_page < enemies_known -1 {
	enemy_page++;
	itens = [
    [0, 0],
	];
	name = [];
}
if (keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"))) and enemy_page > 0 {
	enemy_page--;
	itens = [
    [0, 0],
	];
	name = [];
}