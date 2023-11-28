var w = sprite_width;
var h = sprite_height;
var x0 = sprite_get_xoffset(sprite_index);
var y0 = sprite_get_yoffset(sprite_index);

function findArrayIndex(array1, value)
{
    var index = -1;

    for (var i = 0; i < array_length(array1); i++)
    {
        if (array_equals(array1[i], value))
        {
            index = i;
            break;
        }
    }

    return index;
}

if	point_in_rectangle(mouse_x,mouse_y, x - x0, y - y0, x + (w-x0), y + (h-y0)) and !global.baseGUI		//position_meeting(mouse_x,mouse_y,id)
{
	if global.on_build image_blend = c_red
	
	if mouse_check_button_pressed(mb_right)
	{	
		array_push(global.furniture, [asset_get_index(object_get_name(object_index)), 1]);
		var val = findArrayIndex(global.base, [asset_get_index(object_get_name(object_index)),x,y]);
		remove_from_base(val);
		instance_destroy();		
	}
}
else {
	image_blend = c_white
	image_alpha = 1;
}

