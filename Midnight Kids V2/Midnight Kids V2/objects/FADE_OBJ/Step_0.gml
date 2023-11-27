x = camera_get_view_x(view_camera[0]);
y = camera_get_view_y(view_camera[0]);

if image_alpha > 0.9 global.intern.blockall = true
else global.intern.blockall = false

if fading {
	
	if fadeeffect == 0{
		if image_alpha < 1 image_alpha += delta;
		else{
			fadeeffect = 1;			
		}
	}
	else if fadeeffect == 1 {
		if timer > 0 timer--;
		else if timer <= 0 fadeeffect = 2;		
	}
	else if fadeeffect == 2 {
		if image_alpha > 0 image_alpha -= 0.02;
		else{
			instance_destroy();
		}	
	}		
}