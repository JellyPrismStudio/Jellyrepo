
switch(room){
	case TelaInicial:
	ppfx_id.ProfileUnload()
	ppfx_id.ProfileLoad(title_profile);	
	break
	
	case rJunkyard1:
	break
	
	case rDinersIn:
	ppfx_id.ProfileUnload()
	ppfx_id.ProfileLoad(main_interior_profile);
	break
	
	case rGasConvenience:
	ppfx_id.ProfileUnload()
	ppfx_id.ProfileLoad(main_interior_profile);
	break
	
	case RoomTemplate:
	ppfx_id.ProfileUnload()
	ppfx_id.ProfileLoad(main_interior_profile);
	break
	
	case Factory01:
	ppfx_id.ProfileUnload()
	ppfx_id.ProfileLoad(main_interior_profile);
	break
	
	
	
	default:
	ppfx_id.ProfileUnload()
	ppfx_id.ProfileLoad(main_profile);
	break
}