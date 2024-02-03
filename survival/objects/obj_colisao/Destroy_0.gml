var _col1 = instance_place(x-1, y, obj_colisao);
var _col2 = instance_place(x+1, y, obj_colisao);
var _col3 = instance_place(x, y-1, obj_colisao);
var _col4 = instance_place(x, y+1, obj_colisao);

if (_col1) _col1.image_blend = c_white;
if (_col2) _col2.image_blend = c_white;
if (_col3) _col3.image_blend = c_white;
if (_col4) _col4.image_blend = c_white;