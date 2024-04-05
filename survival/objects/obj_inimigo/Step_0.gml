depth = -y+camera_get_view_y(view_camera[0]);

var _col = instance_place(x, y, obj_colisao);
if (_col != noone) instance_destroy(_col);