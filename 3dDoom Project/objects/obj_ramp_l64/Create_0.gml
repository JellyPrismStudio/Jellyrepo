/// @description Iniherit
event_inherited()
zcheck_script_bottom = collide_slope_x2_bottom
zcheck_script_top    = collide_slope_x2_top
my_tex = background_get_texture(tex_floor_zuma)
z = 0
slope = 1//Slope factor - if the ramp should go 64 pixels up per 64 pixels wide, this is 1
         //               If the ramp should be steeper, e.g. go 128 pixels up per 64 wide,
         //               the slope factor should be 2 (128/64 = 2), aka larger than 1,
         //               and if the ramp should be less steep, e.g. 32 up 64 across,
         //               the slope factor would be smaller than 1 - in this case 0.5
         //               because 32/64 = 0.5.
event_user(0)

