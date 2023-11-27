/// @description terrain_flat_to_3d()
function terrain_flat_to_3d() {
	if(!global.terrain_compressed){
		with(all){
		    z = 64*(x div global.level_chunk_width)
		    x =     x mod global.level_chunk_width
		    event_user(0)
		}
		__background_set( e__BG.Visible, 0, false )
	}
	global.terrain_compressed = true


}
