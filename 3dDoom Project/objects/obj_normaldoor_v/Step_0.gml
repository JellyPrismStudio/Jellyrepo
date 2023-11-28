/// @description State machine
switch(state){
    case 0://Stationary
        //Check 64x64 square using mask_index = spr_movedoormask
        mask_index = spr_movedoormask
        if(place_meeting(x,y,obj_player)){
            if(abs(obj_player.z - z) < 4){
                state = 1
                sfx(snd_door)
            }
            if(obj_player.x < x){
                side = -1
            }
            else{
                side = 1
            }
        }
        mask_index = sprite_index
    break
    
    case 1://Opening (dx)
        dx = min(90,dx + 4)
        if(dx == 90){
            state = 2
            cntr  = 6
        }
    break
    
    case 2://Wait until place free
        cntr--
        if(!cntr){
            mask_index = spr_movedoormask
            if(place_meeting(x,y,obj_player)){
                cntr = 6
            }
            else{
                state = 3
            }
            mask_index = sprite_index
        }
    break
    
    case 3://Close
        dx = max(0,dx - 4)
        if(dx == 0){
            state = 0
        }
    break
}

