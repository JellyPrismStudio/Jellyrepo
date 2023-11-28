/// @description Change rooms
global.sx   = other.my_x
global.sy   = other.my_y
global.sdir = direction
global.stilt= ztilt
global.sdx  = x - other.x
global.sdy  = y - other.y
global.sdz  = z - other.z
global.bobstep = bobstep
global.roomentry = entry_DOOR
room_goto(other.my_room)

