/// @description Insert description here
//if place_meeting(x,y,oENM_Main) instance_destroy();
if !on_view() instance_destroy();
if position_meeting(x,y,oENM_Main) and !hitted {
	alarm_set(0,4);
	hitted = true
}
// You can write your code in this editor


