





// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function cutscene_manager(){
	///@description script_execute_alt
	///@arg ind
	///@arg [arg1,arg2,...]
	current_scene = self.current_scene;
	len = self.len;
	
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
	}
}