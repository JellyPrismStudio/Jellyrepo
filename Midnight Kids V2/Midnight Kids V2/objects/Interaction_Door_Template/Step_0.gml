// === DO NOT TOUCH VARIABLES BELLOW === //
#region DO NOT TOUCH

var scene_select = scene[scene_indexer];
var current_scene = scene_info[scene_indexer][scene_select]
var len = array_length(current_scene) -1;

switch(len){
	case  0: script_execute(current_scene[0]); break
	case  1: script_execute(current_scene[0],current_scene[1]); break
	case  2: script_execute(current_scene[0],current_scene[1],current_scene[2]); break
	case  3: script_execute(current_scene[0],current_scene[1],current_scene[2],current_scene[3]); break
	case  4: script_execute(current_scene[0],current_scene[1],current_scene[2],current_scene[3],current_scene[4]); break
	case  5: script_execute(current_scene[0],current_scene[1],current_scene[2],current_scene[3],current_scene[4],current_scene[5]); break
	case  6: script_execute(current_scene[0],current_scene[1],current_scene[2],current_scene[3],current_scene[4],current_scene[5],current_scene[6]); break
	case  7: script_execute(current_scene[0],current_scene[1],current_scene[2],current_scene[3],current_scene[4],current_scene[5],current_scene[6],current_scene[7]); break
	case  8: script_execute(current_scene[0],current_scene[1],current_scene[2],current_scene[3],current_scene[4],current_scene[5],current_scene[6],current_scene[7],current_scene[8]); break
	case  9: script_execute(current_scene[0],current_scene[1],current_scene[2],current_scene[3],current_scene[4],current_scene[5],current_scene[6],current_scene[7],current_scene[8],current_scene[9]); break
	case 10: script_execute(current_scene[0],current_scene[1],current_scene[2],current_scene[3],current_scene[4],current_scene[5],current_scene[6],current_scene[7],current_scene[8],current_scene[9],current_scene[10]); break
	case 11: script_execute(current_scene[0],current_scene[1],current_scene[2],current_scene[3],current_scene[4],current_scene[5],current_scene[6],current_scene[7],current_scene[8],current_scene[9],current_scene[10],current_scene[11]); break
	case 12: script_execute(current_scene[0],current_scene[1],current_scene[2],current_scene[3],current_scene[4],current_scene[5],current_scene[6],current_scene[7],current_scene[8],current_scene[9],current_scene[10],current_scene[11],current_scene[12]); break
	case 13: script_execute(current_scene[0],current_scene[1],current_scene[2],current_scene[3],current_scene[4],current_scene[5],current_scene[6],current_scene[7],current_scene[8],current_scene[9],current_scene[10],current_scene[11],current_scene[12],current_scene[13]); break
	case 14: script_execute(current_scene[0],current_scene[1],current_scene[2],current_scene[3],current_scene[4],current_scene[5],current_scene[6],current_scene[7],current_scene[8],current_scene[9],current_scene[10],current_scene[11],current_scene[12],current_scene[13],current_scene[14]); break
	case 15: script_execute(current_scene[0],current_scene[1],current_scene[2],current_scene[3],current_scene[4],current_scene[5],current_scene[6],current_scene[7],current_scene[8],current_scene[9],current_scene[10],current_scene[11],current_scene[12],current_scene[13],current_scene[14],current_scene[15]); break
	case 16: script_execute(current_scene[0],current_scene[1],current_scene[2],current_scene[3],current_scene[4],current_scene[5],current_scene[6],current_scene[7],current_scene[8],current_scene[9],current_scene[10],current_scene[11],current_scene[12],current_scene[13],current_scene[14],current_scene[15],current_scene[16]); break
}	
	
with(parEvent){
	x = super.x;
	y = super.y;
}

#endregion


// === Edit the statements here === //

if isDepthsorted kdepth_sort(true);
if isDirectionable check_position(20);