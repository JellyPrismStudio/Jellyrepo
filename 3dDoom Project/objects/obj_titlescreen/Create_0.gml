/// @description Init global variables
global.darkness     = 320//Visible area (radius of visible circle)
global.activate     = 400//Active area (radius of activate circle)

global.terrainceil  = false //Whether to use a ceiling (for caves)
global.floortex     = NONE  //Texture to default the floor with
global.ceiltex      = NONE  //Texture to default the ceiling with

global.sx           = NONE//Start position
global.sy           = NONE
global.sdir         = NONE//Start direction
global.sdx          = 0   //Start delta x/y (relative to the object - allows seamless transitions)
global.sdy          = 0
global.sdz          = 0
global.roomentry    = NONE

///Init terrain variables
globalvar FLOORGRID, TEXGRID, CEILGRID, CEILTEXGRID,
GRIDSIZE_X, GRIDSIZE_Y, GRIDCELL_X, GRIDCELL_Y;

FLOORGRID   = NONE
CEILGRID    = NONE
TEXGRID     = NONE
CEILTEXGRID = NONE


GRIDSIZE_X  = 128
GRIDSIZE_Y  = 128

///Init player variables
init_player_variables()

