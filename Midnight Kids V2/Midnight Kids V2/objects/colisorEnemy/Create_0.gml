/// @description Insert description here
instance_family = INSTANCE_FAMILY.BLOCK;
_kcollider = false;
//visible = false;
// You can write your code in this editor
size_w = (image_xscale * sprite_width);
size_h = (image_yscale * sprite_height);
size_w = size_w + 4;
size_w = size_w / 16;
size_h = size_h + 4;
size_h = size_h / 16;

//if sprite_index == Sprite2 and room != RoomTemplate image_alpha = 0
/*
margin = instance_create_depth(x,y,depth-1,colisorFollower);
margin.image_xscale = size_w;
margin.image_yscale = size_h;
margin.image_angle = image_angle;