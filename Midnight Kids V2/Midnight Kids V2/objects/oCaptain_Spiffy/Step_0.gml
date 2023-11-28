depth_sort();
on_radius = kget_radius(self,RADIUS-20,true,true,false,global.player);
timer1--;
if timer1 <= 0{	
	_var = random_range(0,100);
	if _var > 70 {
		sprite = 1;
	}
	else {
		sprite = 0;
	}
	timer1 = 200;
} else if attacking sprite = 2;


if !global.party.follow {
	state_machine = "GOTO";
	
}
else state_machine = "FOLLOW";

if keyboard_check_pressed(ord("C")){
	global.party.capagressive = !global.party.capagressive;
	if state_machine == "ATTACK" {
		object = false;
		attacking = false;
		state_machine = "FOLLOW";
	}
}










//object_get_parent(obj);