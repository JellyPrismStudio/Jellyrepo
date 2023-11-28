/// @description Cam variables
z           = terrain_floor_get_z(x,y) + 10
zheight     = 24
zfeet       = z
zhead       = z + zheight

ztop        = z + zheight
zbottom     = z

zdelta      = 0.8*zheight
bobstep     = 0

direction   = 0
ztilt       = 0

mouse       = true
mwsx        = window_mouse_get_x()
mwsy        = window_mouse_get_y()
mwspx       = mwsx
mwspy       = mwsy
mwsdelx     = 0
mwsdely     = 0

footsound   = NONE
stepcntr    = 20

///Movement variables
get_keys()
onground        = true
canjump         = true
canhurt         = true
canshoot        = true
reloading       = 0

xspeed          = 0
yspeed          = 0
zspeed          = 0

zgravity        = 0.15

movespeedmax    = 2
jumpspeed       = 4
terminalvelocity= 8
accel           = 0.2

