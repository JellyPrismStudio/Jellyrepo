image_blend = c_white;
var _col1 = instance_place(x-1, y, obj_colisao);
var _col2 = instance_place(x+1, y, obj_colisao);
var _col3 = instance_place(x, y-1, obj_colisao);
var _col4 = instance_place(x, y+1, obj_colisao);
if (_col1 and _col2 and _col3 and _col4) image_blend = c_black;;

if (_col1) with (_col1) {event_user(0)};
if (_col2) with (_col2) {event_user(0)};
if (_col3) with (_col3) {event_user(0)};
if (_col4) with (_col4) {event_user(0)};