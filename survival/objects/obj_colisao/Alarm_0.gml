var _col1 = instance_place(x-sprite_width, y, obj_colisao);
var _col2 = instance_place(x+sprite_width, y, obj_colisao);
var _col3 = instance_place(x, y-sprite_width, obj_colisao);
var _col4 = instance_place(x, y+sprite_width, obj_colisao);
var _col5 = instance_place(x-sprite_width, y-sprite_width, obj_colisao);
var _col6 = instance_place(x+sprite_width, y-sprite_width, obj_colisao);
var _col7 = instance_place(x-sprite_width, y+sprite_width, obj_colisao);
var _col8 = instance_place(x+sprite_width, y+sprite_width, obj_colisao);

if (_col1) with (_col1) {event_user(0);};
if (_col2) with (_col2) {event_user(0);};
if (_col3) with (_col3) {event_user(0);};
if (_col4) with (_col4) {event_user(0);};
if (_col5) with (_col5) {event_user(0);};
if (_col6) with (_col6) {event_user(0);};
if (_col7) with (_col7) {event_user(0);};
if (_col8) with (_col8) {event_user(0);};

event_user(0);

if image_index > 40
{
	image_blend = c_red;
}
else if image_index > 30
{
	image_blend = c_blue;
}
else if image_index > 20
{
	image_blend = c_green;
}
else if image_index > 10
{
	image_blend = c_orange;
}
else if image_index > 0
{
	image_blend = c_white;
}