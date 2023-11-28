dist = irandom_range(30,90);
dist2 = irandom_range(30,90);
dist3 = irandom_range(30,90);
dist4 = irandom_range(30,90);
stay = false;
invtimetotal = 20;
player_index = 0;
invtime = invtimetotal;
inputplace = false;
pdx = 0;
pdy = 0;
dist = 0; dist2 = 0; dist3 = 0; dist4 = 0;
invulnerable = false;
customspr = false;
create_battle_basics_player();
vr1 = global.config.view_range_min;
vr2 = global.config.view_range_max;
view_range = irandom_range(vr1,vr2);
wd1 = 5; // Walk Delay
wd2 = 25;
following = false;
atacking_anim = false;
DPS = global.player_stats[self_index].DPS - global.player_stats[self_index].evasion;
attack_cooldown = DPS;
passive_cooldown = DPS;
cured = false;
enemy_ranged = false;
old_xx = x;
old_yy = y;
alarm_set(2,3);
targdraw = 0;
rangecircle = 0;
_dylans = 60;
// Range para seguir a party

print = 0;
// Range da Mira

dash_dir = -1;
dash_timing = 10;
normal_speed = 3;
dash_speed = 4;
sneak_speed = 2;
pathing_speed = 3
oDir[0] = 0;
depth = -y;
i = 0;
bool1 = false;
a = 0;
a0 = false;
a4 = false;



///////////

function dash(distance)
{
	
		
		var spd = 0.3 + (gplayeridx.evasion / 50);
		var dst = 1;
		
		if  gplayeridx.stamina > 25 {
			var instdash = instance_create_depth(x,y,depth+1,oFx_Explosion1);
			instdash.image_xscale = 0.5;
			instdash.image_yscale = 0.5;
			invtime = 0;
			while(distance) > 0 
			{
				gplayer.invulnerable = true;
				switch(dash_dir){
				
				case 1:
				if !place_meeting(x-spd,y+spd,colisor) or noclip{
					x-=spd;
					y+=spd;
					distance-=dst*2;
				} else distance = 0;
				break
			
				case 2:
				if !place_meeting(x,y+spd,colisor) or noclip{
					y+=spd;
					distance-=dst;
				} else distance = 0;
				break
			
				case 3:
				if !place_meeting(x+spd,y+spd,colisor) or noclip{
					x+=spd;
					y+=spd;
					distance-=dst*2;
				} else distance = 0;
				break
				
				case 4:
				if !place_meeting(x-spd,y,colisor) or noclip{
					x-=spd;
					distance-=dst;
				} else distance = 0;
				break
				
			
				case 6:
				if !place_meeting(x+spd,y,colisor) or noclip{
					x+=spd;
					distance-=dst;
				} else distance = 0;
				break
			
				case 7:
				if !place_meeting(x-spd,y-spd,colisor) or noclip{
					x-=spd;
					y-=spd;
					distance-=dst*2;
				} else distance = 0;
				break
			
				case 8:
				if !place_meeting(x,y-spd,colisor) or noclip{
					y-=spd;
					distance-=dst;
				} else distance = 0;
				break
			
				case 9:
				if !place_meeting(x+spd,y-spd,colisor) or noclip{
					x+=spd;
					y-=spd;
					distance-=dst*2;
				} else distance = 0;
				break
				
				default:
				distance = 0
				break
			
				}
			}
			
			gplayeridx.stamina -= 25;
		}
}

function dash_point(distance)
{
		var _math = 0.0111111111111111;

			var instdash = instance_create_depth(x,y,depth+1,oFx_Explosion1);
			instdash.image_xscale = 0.5;
			instdash.image_yscale = 0.5;
			
			var ddir = point_direction(x, y, mouse_x, mouse_y);
			
			if ddir >= 0 and ddir <= 180 
			{
				var _mx = ddir * _math - 1;
			}
			else {
				var _mx = -(ddir * _math - 3);
			}
		
			if ddir >= 90 and ddir <= 270 
			{
				var _my = -((ddir) * _math - 2);
			}
			else if ddir < 90
			{
				var _my = ((ddir) * _math);
			}
			else {
				var _my = ((ddir) * _math) - 4;
			}
			
			
			repeat(distance)
			{
			    // Mover o objeto A na direção do mouse
					 if !place_meeting(x-_mx,y-_my,colisor) or noclip  {
						 x -= (_mx)	
						 y -= (_my)
					 }
				//else if !place_meeting(x,y-_my,colisor)  y -= (_my)//lengthdir_x(0.3, ddir);
				else break
			   // y -= (_my)//lengthdir_y(0.3, ddir);
			}
			////////////
			
			invtime = 0;

		
}

function updateInputs()
{
    // Inputs do teclado
    key_left = keyboard_check(ord("A"));
    key_right = keyboard_check(ord("D"));
    key_down = keyboard_check(ord("S"));
    key_up = keyboard_check(ord("W"));
	
	// 12 = x, 13 = o, 14 = quad, 15 = tri
    key_menu = to_gamepad_pressed("X");
	key_config = to_gamepad_pressed("ESC");
    key_dash = to_gamepad_pressed(vk_shift);
    
    // Inputs do joystick
    var joystick = 0; // Índice do joystick desejado (0 para o primeiro joystick, 1 para o segundo, etc.)
    var joystick_deadzone = 0; // Zona morta do joystick
	
    var joy_x = gamepad_axis_value(joystick, gp_axislh);
    var joy_y = gamepad_axis_value(joystick, gp_axislv);
	
    
	if joy_x != 0 and joy_y != 0 {
		if joy_x > 0
		{
			key_right = joy_x;
			key_left  = 0;
		}
		else
		{
			key_right = 0;
			key_left  = -joy_x;
		}
	
		if joy_y > 0
		{
			key_up    = 0;
			key_down  = joy_y;
		}
		else
		{
			key_up    = -joy_y;
			key_down  = 0;
		}
	}
    // Outros inputs do joystick, se necessário
    
	if key_left					 dash_dir = 4
	if key_right				 dash_dir = 6
	if key_up					 dash_dir = 8
	if key_down					 dash_dir = 2
	if key_left and key_down	 dash_dir = 1
	if key_left and key_up		 dash_dir = 7
	if key_right and key_down	 dash_dir = 3
	if key_right and key_up		 dash_dir = 9
    // Restante do código do jogo
}