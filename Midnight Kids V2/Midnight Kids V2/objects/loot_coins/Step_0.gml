/// @description Insert description here
if instance_exists(self){
	kdepth_sort();

	if kget_radius(self,35,false,true,false,global.player) {
		add_item_to_inv(global.itens.COIN,5,"code_gold_coin");
		instance_destroy();
	}
}
// You can write your code in this editor


