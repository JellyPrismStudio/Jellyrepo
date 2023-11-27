





// CREATION KIT (paste on the creation page)
// kvspeed = 1
// old_dept = depth;
//





// MOVEMENT METHOD
// ========================================
// place on: Step Event
// lspd = speed | ldir = direction (up, down, left, right) | lent = entity/object to apply these changes



function kmove(lspd, ldir, lent)
{
	switch (ldir){
		case "up":
		lent.y -= lspd;
		break;		
		
		case "down":
		lent.y += lspd;
		break;		
		
		case "left":
		lent.x -= lspd;
		break		
		
		case "right":
		lent.x += lspd;
		break;	
	}	
}





// Check direction
// ========================================
// use this method to asign direction to an variable
// linput: 0 = arrows | 1 = WASD | 2 = both
// turn ldiag to true if you want to check the diagonal movement
// lup, llf, lrg and ldw can be defined as 0.
// you will need to create an variable as an single array with the default value.
// sugestion: oDir[0] = 0; // Can be renamed, resized or revalued.
// LDIRVAR DOESN'T ALLOW THE INDEX -------> [0]
// you need to put the whole array (just write the array without the index)

function kget_dir(linput, ldirvar, ldiag, lup, llf, lrg, ldw){
	kstarter("moving?");
	if linput == 0{
	lup = keyboard_check(vk_up);	ldw = keyboard_check(vk_down);
	llf = keyboard_check(vk_left);	lrg = keyboard_check(vk_right);}
	
	if linput == 1{
	lup =  keyboard_check(ord("W"));	ldw =  keyboard_check(ord("S"));
	llf =  keyboard_check(ord("A"));	lrg =  keyboard_check(ord("D"));
	}		
	
	if linput == 2{
		lup = keyboard_check(ord("W")) or keyboard_check(vk_up);
		llf = keyboard_check(ord("A")) or keyboard_check(vk_left);
		lrg = keyboard_check(ord("D")) or keyboard_check(vk_right);
		ldw = keyboard_check(ord("S")) or keyboard_check(vk_down);
	}
	
	if global.can_move{
		if lup ldirvar[@ 0] = 8;
		if llf ldirvar[@ 0] = 4;
		if lrg ldirvar[@ 0] = 6;
		if ldw ldirvar[@ 0] = 2;
	
		if ldiag{
			if lup && llf ldirvar[@ 0] = 7;
			if lup && lrg ldirvar[@ 0] = 9;
			if ldw && llf ldirvar[@ 0] = 1;
			if ldw && lrg ldirvar[@ 0] = 3;
		}
	}
}


// Check direction
// ========================================
// use this method to asign direction to an variable
// turn ldiag to true if you want to check the diagonal movement
// lup, llf, lrg and ldw can be defined as 0.
// you will need to create an variable as an single array with the default value.
// sugestion: oDir[0] = 0; // Can be renamed, resized or revalued.
// NOTE: needs the index -----> [0];

function kset_dir_graphic(ldiag, ldirvar,l1,l2,l3,l4,l6,l7,l8,l9){
	if ldirvar == 2 self.sprite_index = l2;
	if ldirvar == 4 self.sprite_index = l4;
	if ldirvar == 6 self.sprite_index = l6;
	if ldirvar == 8 self.sprite_index = l8;
	if ldiag == true{		
		if ldirvar == 1 self.sprite_index = l1;
		if ldirvar == 3 self.sprite_index = l3;
		if ldirvar == 7 self.sprite_index = l7;
		if ldirvar == 9 self.sprite_index = l9;		
	}


}





// MOVEMENT METHOD INPUT
// ========================================
// use this method to directly add the movement loop function on your object
// just paste the "kmove_input" with the variables:
// lspd = speed and lent = entity/object

function kmove_input(lspd, lent){
	if keyboard_check(vk_up) lent.y -= lspd;
	if keyboard_check(vk_down) lent.y += lspd;
	if keyboard_check(vk_left) lent.x -= lspd;
	if keyboard_check(vk_right) lent.x += lspd;	
}



function kmove_allow(bol = true){
	global.can_move = bol;	
}




// MOVEMENT METHOD INPUT WITH ONE COLLIDER
// ========================================
// use this method to directly add the movement loop function on your object
// just paste the "kmove_input" with the variables:
// lspd = speed and lent = entity/object to move
// lcol = object to colide, k_lappr = activate the minor approaching? (pixel by pixel) true/false

function kmove_input_collider(lspd, lent, lcol, k_lappr){

	if keyboard_check(vk_up) {		
		if !place_meeting(x,y-lspd,lcol) lent.y -= lspd;
		else if k_lappr and !place_meeting(x,y-1,lcol) lent.y -= 1;
	}
	if keyboard_check(vk_down) {
		if !place_meeting(x,y+lspd,lcol) lent.y += lspd;
		else if k_lappr and !place_meeting(x,y+1,lcol) lent.y += 1;
	}
	if keyboard_check(vk_left) {
		if !place_meeting(x-lspd,y,lcol) lent.x -= lspd;
		else if k_lappr and !place_meeting(x-1,y,lcol) lent.x -= 1;
	}
	if keyboard_check(vk_right) {
		if !place_meeting(x+lspd,y,lcol) lent.x += lspd;
		else if k_lappr and !place_meeting(x+1,y,lcol) lent.x += 1;
	}
}

function kgravity(localstrength, ldir, lcol1, lcol2, lcol3){
	kstarter("jump");
	if ldir == 1 and !global.jumping{
		if !place_meeting(x,y+localstrength,lcol1) && !place_meeting(x,y+localstrength,lcol2) && !place_meeting(x,y+localstrength,lcol3)		self.y += localstrength;
		else if !place_meeting(x,y+localstrength/2,lcol1) && !place_meeting(x,y+localstrength/2,lcol2) && !place_meeting(x,y+localstrength/2,lcol3)	self.y += localstrength/2;
		else if !place_meeting(x,y+1,lcol1) && !place_meeting(x,y+1,lcol2) && !place_meeting(x,y+1,lcol3)	self.y += 1;		
	}
}







// MOVEMENT METHOD INPUT
// ========================================
// use this method to directly add the movement loop function on your object
// just paste the "kmove_input" with the variables:
// linput: 0 = arrows | 1 = WASD | 2 = both
// lspd = speed and lent = entity/object to move
// lcol1/lcol2/lcol/3 = objects to colide, k_lappr = activate the minor approaching? (pixel by pixel) true/false
// if you have just 2 objects to colide, for example, you can use "-1" on the 'blank' space.
// this number is the object by creation order (from bottom to top). if you put '0' instead, he will collide with the first object created

function kmove_input_multiple_collider(linput, lspd, lent, k_lappr, lcol1 = _SYS_OBJECT_NULL, lcol2 = _SYS_OBJECT_NULL, lcol3 = _SYS_OBJECT_NULL, lcol4 = _SYS_OBJECT_NULL, lcol5 = _SYS_OBJECT_NULL){
	kstarter("moving?");
	var lspdh, lspdv;
	if linput == 0 {
		var iup = keyboard_check(vk_up);	var idw = keyboard_check(vk_down);
		var ilf = keyboard_check(vk_left);	var irt = keyboard_check(vk_right);
	}
	
	if linput == 1{
		var iup =  keyboard_check(ord("W"));	var idw =  keyboard_check(ord("S"));
		var ilf =  keyboard_check(ord("A"));	var irt =  keyboard_check(ord("D"));
		
	}	
	if linput == 2{
		var iup = keyboard_check(ord("W")) or keyboard_check(vk_up);
		var ilf = keyboard_check(ord("A")) or keyboard_check(vk_left);
		var irt = keyboard_check(ord("D")) or keyboard_check(vk_right);
		var idw = keyboard_check(ord("S")) or keyboard_check(vk_down);
		
	}
	
	
	if iup  && global.can_move{		
		if !place_meeting(x,y-lspd,lcol1) && !place_meeting(x,y-lspd,lcol2) && !place_meeting(x,y-lspd,lcol3) && !place_meeting(x,y-lspd,lcol4) && !place_meeting(x,y-lspd,lcol5) lent.y -= lspd;
		else if k_lappr and (!place_meeting(x,y-1,lcol1) && !place_meeting(x,y-1,lcol2) && !place_meeting(x,y-1,lcol3) && !place_meeting(x,y-1,lcol4) && !place_meeting(x,y-1,lcol5)) lent.y -= 1;
	}
	else if idw  && global.can_move{
		if !place_meeting(x,y+lspd,lcol1) && !place_meeting(x,y+lspd,lcol2) && !place_meeting(x,y+lspd,lcol3) && !place_meeting(x,y+lspd,lcol4) && !place_meeting(x,y+lspd,lcol5) lent.y += lspd;
		else if k_lappr and (!place_meeting(x,y+1,lcol1) && !place_meeting(x,y+1,lcol2) && !place_meeting(x,y+1,lcol3) && !place_meeting(x,y+1,lcol4) && !place_meeting(x,y+1,lcol5)) lent.y += 1;
	}
	
	if ilf  && global.can_move{
		if !place_meeting(x-lspd,y,lcol1) && !place_meeting(x-lspd,y,lcol2) && !place_meeting(x-lspd,y,lcol3) && !place_meeting(x-lspd,y,lcol4) && !place_meeting(x-lspd,y,lcol5) lent.x -= lspd;
		else if k_lappr and (!place_meeting(x-1,y,lcol1) && !place_meeting(x-1,y,lcol2) && !place_meeting(x-1,y,lcol3) && !place_meeting(x-1,y,lcol4) && !place_meeting(x-1,y,lcol5)) lent.x -= 1;
	}
	else if irt  && global.can_move{
		if !place_meeting(x+lspd,y,lcol1) && !place_meeting(x+lspd,y,lcol2) && !place_meeting(x+lspd,y,lcol3) && !place_meeting(x+lspd,y,lcol4) && !place_meeting(x+lspd,y,lcol5) lent.x += lspd;
		else if k_lappr and (!place_meeting(x+1,y,lcol1) && !place_meeting(x+1,y,lcol2) && !place_meeting(x+1,y,lcol3) && !place_meeting(x+1,y,lcol4) && !place_meeting(x+1,y,lcol5)) lent.x += 1;
	}
}

function move_player(linput, lspd, lent, k_lappr, lcol1 = _SYS_OBJECT_NULL){
	kstarter("moving?");
	var slopes = true;
	var noclip = global.debug.noclip
	var lspdv, lspdh;
	if linput == 0 {
	var iup = keyboard_check(vk_up);	var idw = keyboard_check(vk_down);
	var ilf = keyboard_check(vk_left);	var irt = keyboard_check(vk_right);}
	
	if linput == 1{
	var iup =  keyboard_check(ord("W"));	var idw =  keyboard_check(ord("S"));
	var ilf =  keyboard_check(ord("A"));	var irt =  keyboard_check(ord("D"));
	}	
	if linput == 2{
		var iup = keyboard_check(ord("W")) or keyboard_check(vk_up);
		var ilf = keyboard_check(ord("A")) or keyboard_check(vk_left);
		var irt = keyboard_check(ord("D")) or keyboard_check(vk_right);
		var idw = keyboard_check(ord("S")) or keyboard_check(vk_down);
	}
	if linput == 3
	{
		
		var iup = key_up;
		var idw = key_down;
		var ilf = key_left;
		var irt = key_right;
		lspdv = ( idw + iup ) * lspd;
		lspdh = ( irt + ilf ) * lspd;
	}
	
	if iup  && global.can_move{		
		if !place_meeting(x,y-lspdv,lcol1) or noclip lent.y -= lspdv;
		else if k_lappr and (!place_meeting(x,y-1,lcol1) or noclip) lent.y -= 1;
		else
		{
			if slopes{
				repeat(lspdv)
				{
					if (!place_meeting(x-lspd, y-1, lcol1)) or noclip
					{
						lent.y--;
						lent.x -= lspd-1;
					}
					if (!place_meeting(x+lspd, y-1, lcol1)) or noclip
					{
						lent.y--;
						lent.x += lspd-1;
					}
				}
			}
		}
	}
	else if idw  && global.can_move{
		if !place_meeting(x,y+lspdv,lcol1) or noclip lent.y += lspdv;
		else if k_lappr and (!place_meeting(x,y+1,lcol1) or noclip) lent.y += 1;
		else
		{
			if slopes{
				repeat(lspdv)
				{
					if (!place_meeting(x-lspd, y+1, lcol1)) or noclip
					{
						lent.y++;
						lent.x -= lspd-1;
					}
					if (!place_meeting(x+lspd, y+1, lcol1)) or noclip
					{
						lent.y++;
						lent.x += lspd-1;
					}
				}
			}
		}
	}
	
	if ilf  && global.can_move{
		if !place_meeting(x-lspdh,y,lcol1) or noclip lent.x -= lspdh;
		else if k_lappr and (!place_meeting(x-1,y,lcol1) or noclip) lent.x -= 1;
		else
		{
			if slopes{
				repeat(lspdh)
				{
					if (!place_meeting(x-1, y-lspd, lcol1)) or noclip
					{
						lent.x--;
						lent.y -= lspd;
					}
					if (!place_meeting(x-1, y+lspd, lcol1)) or noclip
					{
						lent.x--;
						lent.y += lspd;
					}
				}
			}
		}
	}
	else if irt  && global.can_move{
		if !place_meeting(x+lspdh,y,lcol1) or noclip lent.x += lspdh;
		else if k_lappr and (!place_meeting(x+1,y,lcol1) or noclip) lent.x += 1;
		else
		{
			if slopes{
				repeat(lspdh)
				{
					if (!place_meeting(x+1, y-lspd, lcol1)) or noclip
					{
						lent.x++;
						lent.y -= lspd;
					}
					if (!place_meeting(x+1, y+lspd, lcol1)) or noclip
					{
						lent.x++;
						lent.y += lspd;
					}
				}
			}
		}
	}
}


// MOVEMENT WITH COLLISOR
// ========================================
// lspd = speed | ldir = direction (up, down, left, right) | lent = entity/object to apply these changes | ltobj = Collider Object


function kmove_allowed(lspd, ldir, lent, lcol, k_lappr){
	switch (ldir){
		case "up":
		if !place_meeting(x,y-lspd,lcol) lent.y -= lspd;
		else if k_lappr and !place_meeting(x,y-1,lcol) lent.y -= 1;
		break;		
		
		case "down":
		if !place_meeting(x,y+lspd,lcol) lent.y += lspd;
		else if k_lappr and !place_meeting(x,y+1,lcol) lent.y += 1;
		break;		
		
		case "left":
		if !place_meeting(x-lspd,y,lcol) lent.x -= lspd;
		else if k_lappr and !place_meeting(x-1,y,lcol) lent.x -= 1;
		break		
		
		case "right":
		if !place_meeting(x+lspd,y,lcol) lent.x += lspd;
		else if k_lappr and !place_meeting(x+1,y,lcol) lent.x += 1;
		break;	
	}	
}




// CHANGE OBJECT SPEED
// CAUTION: To use this method, you NEED to use the variable 'kvspeed' for set the speed. (on 'Create Event' or etc)
// If you don't have this variable, only the SPEED variable, you can use the kchange_standard_speed function instead
// This script doesn't save any variable (old or new speeds), just change them to the new one.
// ========================================
// lobj_n = Object name | lval = new speed.

function kchange_speed(lobj_n, lval){
	lobj_n.kvspeed = lval;
}





// CHANGE THE STANDARD SPEED USING THE 'SPEED' ARGUMENT
// ========================================
// lobj_n = Object name | lval = new speed.


function kchange_standard_speed(lobj_n, lval){
	lobj_n.speed = lval;
}





// DASH METHOD (PARALLEL OBJECT)
// ========================================
// lobj_n = Object name | lval = new speed.
// EXAMPLE: 

// on creation code, add
// oNormal_speed = 3; oDash_speed = 6; kvspeed = 3;

// on step event:
// kdash(normal_speed,dash_speed, self);


function kdash_parallel(lo_vel, ld_vel, lobj){
	if keyboard_check(vk_shift) lobj.kvspeed = ld_vel;
	else lobj.kvspeed = lo_vel;
}






// DASH METHOD 
// ========================================
// lo_vel = normal speed
// ld_vel = dash speed
// to use, you need the speed variable of your game (that one needs to be an real 'variable', and not an constant one, because we will change his value
// so, after that, you just need to add the function: (your variable here) = kdash(lo_vel, ld_vel)

function kdash(lo_vel, ld_vel){
	if keyboard_check(vk_shift) return ld_vel;
	else return lo_vel;
}






// SNEAK METHOD 
// ========================================
// lo_vel = normal speed
// ls_vel = sneak speed
// to use, you need the speed variable of your game (that one needs to be an real 'variable', and not an constant one, because we will change his value
// so, after that, you just need to add the function: (your variable here) = kdash(lo_vel, ls_vel)

function ksneak(lo_vel, ls_vel){
	if keyboard_check(vk_control) return ls_vel;
	else return lo_vel;
}





// SNEAK and DASH METHOD 
// ========================================
// lo_vel = normal speed
// ls_vel = sneak speed
// to use, you need the speed variable of your game (that one needs to be an real 'variable', and not an constant one, because we will change his value
// so, after that, you just need to add the function: (your variable here) = kdash(lo_vel, ls_vel)

function kdash_and_sneak(lo_vel, ld_vel, ls_vel){
	if keyboard_check(vk_shift)			return ld_vel; 
	else if keyboard_check(vk_control)	return ls_vel;
	else return lo_vel;
}




// CHECK ONLY ONE COLLISION
// ========================================
// ltobj_n = Object name | ldir = Direction | lspd = Speed
function kcheck_collide(ltobj, ldir, lspd){
	switch(ldir){
		case "up":
		if place_meeting(y-lspd,y,ltobj) return true;
		else return true;
		break;
		
		case "down":
		if place_meeting(y+lspd,y,ltobj) return true;
		else return true;
		break;
		
		case "left":
		if place_meeting(x-lspd,y,ltobj) return true;
		else return true;
		break;
		
		case "right":
		if place_meeting(x+lspd,y,ltobj) return true;
		else return true;
		break;
		
	}
}






// MOVEMENT METHOD INPUT WITH ONE COLLIDER
// ========================================
// use this method to directly add the movement loop function on your object

// just paste the "kmove_input" with the variables:
// lspd = speed and lent = entity/object to move
// lcol = object to colide, k_lappr = activate the minor approaching? (pixel by pixel) true/false
// if using the dir method, needs the index -----> [0];

// Como verificar se o objeto pulou em cima?
// ==============================================
// Simples, basta verificar se a posição é a mesma (place_meeting) e se a global.jumping é TRUE

function kjump(lstrength, lspd, linput, ldepth = undefined, lcol1 = _SYS_OBJECT_NULL, lcol2 = _SYS_OBJECT_NULL, lcol3 = _SYS_OBJECT_NULL){
	if ldepth != undefined{
		kdepth_sort_input(true, self, ldepth);
	}
	kstarter("jump");
	kstarter("moving?");
	
	if keyboard_check_pressed(vk_space) and global.jumping != true{
		global.jumping = true;
		global.jump_time = lstrength;
	}
	if linput == 0 {
		var iup = keyboard_check(vk_up);	var idw = keyboard_check(vk_down);
		var ilf = keyboard_check(vk_left);	var irt = keyboard_check(vk_right);
	}	
	if linput == 1{
		var iup =  keyboard_check(ord("W"));	var idw =  keyboard_check(ord("S"));
		var ilf =  keyboard_check(ord("A"));	var irt =  keyboard_check(ord("D"));
	}	
	if linput == 2{
		var iup = keyboard_check(ord("W")) or keyboard_check(vk_up);
		var ilf = keyboard_check(ord("A")) or keyboard_check(vk_left);
		var irt = keyboard_check(ord("D")) or keyboard_check(vk_right);
		var idw = keyboard_check(ord("S")) or keyboard_check(vk_down);
	}	
	
	if global.jumping and global.jump_time > 0{
		global.falling = false;
		global.can_move = false;
		self.image_blend = c_red;
		self.image_xscale = 1.2;
		self.image_yscale = 1.2;
		if iup  {//&& global.can_move{		
		if !place_meeting(x,y-lspd,lcol1) && !place_meeting(x,y-lspd,lcol2) && !place_meeting(x,y-lspd,lcol3) self.y -= lspd;
		}
		else if idw  {//&& global.can_move{
			if !place_meeting(x,y+lspd,lcol1) && !place_meeting(x,y+lspd,lcol2) && !place_meeting(x,y+lspd,lcol3) self.y += lspd;
		}
	
		if ilf  {//&& global.can_move{
			if !place_meeting(x-lspd,y,lcol1) && !place_meeting(x-lspd,y,lcol2) && !place_meeting(x-lspd,y,lcol3) self.x -= lspd;
		}
		else if irt  {//&& global.can_move{
			if !place_meeting(x+lspd,y,lcol1) && !place_meeting(x+lspd,y,lcol2) && !place_meeting(x+lspd,y,lcol3) self.x += lspd;
		}
		global.jump_time--;
	}
	else if global.jump_time == 0 { global.falling = true; global.jump_time-- }
	else if global.jump_time <= 0 {
		global.falling = false;
		global.can_move = true;
		global.jumping = false;
		self.image_blend = c_white;
		self.image_xscale = 1;
		self.image_yscale = 1;
		kdepth_sort_input(false, self, ldepth);
	}
}
	

// Função usada para pegar as teclas do teclado ou gamepad, se conectado.
// GAMEPAD
// 10 = L2
// 0 = DPAD

function to_gamepad_pressed(key){
	if key == "X"
	{
		return keyboard_check_pressed(ord("X")) or gamepad_button_check_pressed(0,4)
	}
	if key == "ESC"
	{
		return keyboard_check_pressed(vk_escape) or gamepad_button_check_pressed(0,4)
	}
	if key == vk_space
	{
		return keyboard_check_pressed(vk_space) or gamepad_button_check_pressed(0,12)
	}
	if key == vk_shift
	{
		return keyboard_check_pressed(vk_shift) or gamepad_button_check_pressed(0,13)
	}
	if key == "F"
	{
		return keyboard_check_pressed(ord("F")) or gamepad_button_check_pressed(0,15)
	}
	if key == mb_left
	{
		return mouse_check_button_pressed(mb_left) or gamepad_button_check_pressed(0,9)
	}
	if key == mb_right
	{
		return mouse_check_button_pressed(mb_right)
	}
	if key == "D"
	{
		if gamepad_axis_value(0, gp_axislh) > 0 or keyboard_check(ord("D")) return true
		else return false
	}
	if key == vk_control
	{
		if keyboard_check(vk_control) return true
		else return false
	}
	if key == "A"
	{
		if gamepad_axis_value(0, gp_axislh) < 0 or keyboard_check(ord("A")) return true
		else return false
	}
	if key == vk_tab
	{
		if keyboard_check(vk_tab) return true
		else return false
	}
}

// Função usada para pegar as teclas do teclado ou gamepad, se conectado.
function to_gamepad_click(key){
	if key == "X"
	{
		return keyboard_check_pressed(ord("X")) or gamepad_button_check_pressed(0,4)
	}
	if key == vk_space
	{
		return keyboard_check_pressed(vk_space) or gamepad_button_check_pressed(0,12)
	}
	if key == vk_shift
	{
		return keyboard_check_pressed(vk_shift) or gamepad_button_check_pressed(0,13)
	}
	if key == "F"
	{
		return keyboard_check_pressed(ord("F")) or gamepad_button_check_pressed(0,15)
	}
	if key == mb_left
	{
		return mouse_check_button(mb_left) or gamepad_button_check(0,9)
	}
	if key == mb_right
	{
		return mouse_check_button(mb_right) //or gamepad_button_check(0,9)
	}
}

// Função usada para pegar os botões do mouse ou gamepad, se conectado.
function mouse_to_gamepad(){
	
	var deadzone2 = 0.2; // Valor de zona morta para evitar movimentos indesejados

	var axisX = gamepad_axis_value(0, gp_axisrh); // Valor do eixo X do analógico direito
	var axisY = gamepad_axis_value(0, gp_axisrv); // Valor do eixo Y do analógico direito

	// Verificar a zona morta
	if (abs(axisX) > deadzone2 || abs(axisY) > deadzone2) {
    // Obter a posição atual do mouse
    var mouseX = window_mouse_get_x();
	clamp(mouseX, 0, window_get_width());
    var mouseY = window_mouse_get_y();
	clamp(mouseY, 0, window_get_height());
    // Calcular o deslocamento com base nos valores dos eixos
    var offsetX = axisX * 20; // Multiplicador para ajustar a velocidade do movimento
    var offsetY = axisY * 20;

    // Mover o cursor do mouse
    window_mouse_set(mouseX + offsetX, mouseY + offsetY);
}	
	
	
}





// ========================================
// Depth Sorting
// old_depth = original depth (Y?)
// ========================================

function kdepth_sort(lbol = true){
	if lbol self.depth = -y;		
}

function kdepth_sort_input(lbol, lent, ldepth){
	if lbol lent.depth = -ldepth;	
}