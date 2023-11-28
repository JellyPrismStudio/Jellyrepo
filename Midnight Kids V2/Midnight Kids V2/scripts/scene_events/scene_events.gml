#region INTERN (NOT CUTSCENES)
function _intern_timer(stime)
{
	var instanceid = self.id;
	var inSeconds = false;
	var value = false
	time[self.scene_indexer] = stime;
	if !variable_instance_exists(instanceid,"_sceneTimer[" + string(self.scene_indexer) +"]"){
		variable_instance_set(instanceid,"_sceneTimer[" + string(self.scene_indexer) +"]", 0);
		instanceid._sceneTimer[self.scene_indexer] = 0;
	}
	// Verificando se ele tem a variável timer, que vamos usar no script. Se não tiver, ele instancia no objeto.	
	instanceid._sceneTimer[self.scene_indexer]++
	
	if(!inSeconds && instanceid._sceneTimer[self.scene_indexer] >= time[self.scene_indexer]){
		value = true;
		//variable_instance_set(instanceid,"_sceneTimer[" + string(self.scene_indexer) +"]",0);
	}
	else if(inSeconds && instanceid._sceneTimer[self.scene_indexer] >= time[self.scene_indexer] * game_get_speed(gamespeed_fps)){
		value = true;
		//variable_instance_set(instanceid,"_sceneTimer[" + string(self.scene_indexer) +"]",0);
	}	
	return value
	
}

function _intern_graphic(obj, graphic, xscale = 1){
	if instance_exists(obj)
	{
		if obj == global.player
		{
			if sprite_exists(graphic)
			{
				obj.sprite_index = graphic;
				obj.image_xscale = xscale
				obj.customspr = true;
			}
			else
			{
				obj.sprite_index = global.player_stats[global.party.players[0]].idlegraph
				obj.image_xscale = xscale
				obj.customspr = false;
			}
		}
		else obj.sprite_index = graphic;
	}	
}
#endregion




// cutscene_end_action();
#region MANAGEMENT

//======================================================//
//======================================================//
//======================================================//

function cutscene_end_action(){
	// Esse comando é chamado dentro de cada action, e simboliza o fim daquele evento (ação).
	// Por exemplo: O personagem se move 10 pixels e chama o end_action, pra ir pra proxima ação
		instanceid = self.id;
		self.scene[self.scene_indexer]++;
		if(self.scene[self.scene_indexer] > array_length(self.scene_info[self.scene_indexer]) - 1) instance_destroy();
		if variable_instance_exists(instanceid,"_sceneTimer[" + string(self.scene_indexer) +"]") instanceid._sceneTimer[self.scene_indexer] = 0;
	
}

function cutscene_break(msg){
	// Mostra uma break message (show_message)
	show_message(msg);
	cutscene_end_action();
}

function clean_cutscene_2d_arrays(){
	// Limpa as Páginas
	
	self.scene[16] = 0;
	self.scene[15] = 0;
	self.scene[14] = 0;
	self.scene[13] = 0;
	self.scene[12] = 0;
	self.scene[11] = 0;
	self.scene[10] = 0;
	self.scene[9] = 0;
	self.scene[8] = 0;
	self.scene[7] = 0;
	self.scene[6] = 0;
	self.scene[5] = 0;
	self.scene[4] = 0;
	self.scene[3] = 0;
	self.scene[2] = 0;
	self.scene[1] = 0;
	self.scene[0] = 0;	
}

function cutscene_page_cleaner(){
	// Chama o limpador de páginas
	clean_cutscene_2d_arrays();
	cutscene_end_action();
}

function cutscene_return(){
	// É o inverso do cutscene_end_action, ao invés de ir para a proxima ação, volta uma
	instanceid = self.id;
	self.scene[self.scene_indexer]--;
	if(self.scene[self.scene_indexer] > array_length(self.scene_info[self.scene_indexer]) - 1) instance_destroy();
	if variable_instance_exists(instanceid,"_sceneTimer[" + string(self.scene_indexer) +"]") instanceid._sceneTimer[self.scene_indexer] = 0;
}

function cutscene_do_nothing(){
	// Não faz nada, a não ser que aperte espaço
	if keyboard_check_pressed(vk_space)
	self.scene[self.scene_indexer]++;
}

function cutscene_nothing(){
	// Não faz nada
	if keyboard_check_pressed(vk_space) and keyboard_check_pressed(vk_control) and keyboard_check_pressed(vk_f12) and global.onmenu show_message("Don't try this again")//self.scene[self.scene_indexer]++;
}

function cutscene_do_nothing_trigger(object = self.id, collider1, collider2 = collider1, collider3 = collider2, collider4 = collider3){
	// Não faz nada, a nãoser que o objeto colida e aperte espaço
	isTrigger = (
		place_meeting(object.x,object.y,collider1) or 
		place_meeting(object.x,object.y,collider2) or	
		place_meeting(object.x,object.y,collider3) or 
		place_meeting(object.x,object.y,collider4)
	)
	if keyboard_check_pressed(vk_space) and isTrigger	self.scene[self.scene_indexer]++;
	
}

function cutscene_scripting_renamming_variables(){
	
	
}
	
function trigger_change(trigger, value){
	// Função para mudar o valor dos triggers por NOME OU ID
	_length = array_length(global.triggers);
	
	if trigger != "noone" and trigger != "none" and trigger != "empty" and trigger != ""{
		for(i=0;i<_length;i++){
			if trigger == global.triggers[i].name or trigger == global.triggers[i].id {
				global.triggers[i].value = value;
				break;
			}
		}
	}
	cutscene_end_action();
}

function create_trigger(){
	
}
	
function manage_follower(pid = 1, val = -1, obj = playerHanna){
	global.party.players[pid] = val;
	
	if val == -1 and instance_exists(global.party.playersobj[pid])
	{
		instance_destroy(global.party.playersobj[pid]);
	}
	
	global.party.playersobj[pid] = obj;
	
	if val != -1 and !instance_exists(global.party.playersobj[pid])
	{
		instance_create_depth(global.player.x,global.player.y,global.player.depth,global.party.playersobj[pid])
	}
	
	cutscene_end_action()
}
	
function manage_player(pid){
	var oldplayer = global.player;
	instance_create_depth(global.player.x,global.player.y,global.player.depth,global.player_stats[pid].object);
	global.player = asset_get_index(object_get_name(global.player_stats[pid].object));
	global.player_index = pid;
	global.party.players[0] = pid;
	global.party.playersobj[0] = asset_get_index(object_get_name(global.player_stats[pid].object));
	
	instance_destroy(oldplayer);
	cutscene_end_action()
}

function manage_spiffs(spiffs){
	global.party.captain = spiffs;
	if spiffs == false and instance_exists(oCaptain_Spiffy)
	{
		instance_destroy(oCaptain_Spiffy);
	}	
	global.party.capagressive = false;
	cutscene_end_action()
}

function manage_party(pid, pid2, val = 1){
	global.party.players[val] = pid2;
	
		if pid2 == -1 and instance_exists(global.party.playersobj[val])
		{
			instance_destroy(global.party.playersobj[val]);
		}
	
		if pid2 != -1 global.party.playersobj[val] = global.player_stats[pid2].object;
	
		if pid2 != -1 and !instance_exists(global.party.playersobj[val])
		{
			instance_create_depth(global.player.x,global.player.y,global.player.depth,global.party.playersobj[val])
		}
	
	
	var oldplayer = global.player;
	instance_create_depth(global.player.x,global.player.y,global.player.depth,global.player_stats[pid].object);
	global.player = asset_get_index(object_get_name(global.player_stats[pid].object));
	global.player_index = pid;
	global.party.players[0] = pid;
	global.party.playersobj[0] = asset_get_index(object_get_name(global.player_stats[pid].object));
	
	instance_destroy(oldplayer);


		
	cutscene_end_action()	
	
}

//======================================================//
//======================================================//
//======================================================//
#endregion

#region SECTIONS
//======================================================//
//======================================================//
//======================================================//

function cutscene_section_start(unlockplayer = false, priority = false, camerareset = true){
	// cutscene_section_start(travar player, prioridade, resetar camera)
	if camerareset _GLOBAL_CAMERA.reset = true;	
	global.cutscene.priority = priority;
	global.intern.event = id;
	global.on_message = true;
	global.menuenabled = false;
	
	kmove_allow(unlockplayer);
	cutscene_end_action();
}

function cutscene_section_end(unlockplayer = true, priority = false){
	// destravar player, prioridade, resetar camera
	_GLOBAL_CAMERA.reset = false;
	_GLOBAL_CAMERA.customtarget = false;
	_GLOBAL_CAMERA.targetobj = global.player;
	global.cutscene.priority = priority;
	global.intern.event = noone;
	global.on_message = false;
	global.menuenabled = true;
	kmove_allow(unlockplayer);
	cutscene_end_action();
}


function cutscene_start(_triggerEvent = 0, _blockmovement = true, _blockinputs = true, _popup = true, _popupname = "Interact", _triggerID = "", _triggerVAL = "", _triggerPAGE = 0, _camerareset = true)
{
	isTrigger = false;
	
	if _triggerEvent < 0
	{
		isTrigger = true;
	}
	
	if _triggerEvent == 0 or string_com_margem_erro(_triggerEvent, "Touch")
	{
		isTrigger = (
			place_meeting(object.x,object.y,collider1) or 
			place_meeting(object.x,object.y,collider2) or	
			place_meeting(object.x,object.y,collider3) or 
			place_meeting(object.x,object.y,collider4)
		)
	}
	
	if _triggerEvent == 1 or string_com_margem_erro(_triggerEvent, "Click")
	{
		if to_gamepad_pressed(vk_space)
			{
				isTrigger = (			
				place_meeting(object.x,object.y,collider1) or 
				place_meeting(object.x,object.y,collider2) or	
				place_meeting(object.x,object.y,collider3) or 
				place_meeting(object.x,object.y,collider4)
				)
		}
	}
	
	
	
	if isTrigger
	{
		_length = array_length(global.triggers);
		_triggered = false;
	
		if _triggerID != "noone" and _triggerID != "none" and _triggerID != "empty" and _triggerID != ""
		{
			for(i=0;i<_length;i++)
			{
				if _triggerID == global.triggers[i].name or _triggerID == global.triggers[i].id 
				{
					if global.triggers[i].value == _triggerVAL	
					{
						cutscene_skip_page(_triggerPAGE);
						self.scene[self.scene_indexer] = 0;
						_triggered = true;
						cutscene_end_action();
					}
				}
			}
		}	
		if _triggered = false 
		{
			if _camerareset _GLOBAL_CAMERA.reset = true;	
			global.intern.event = id;
			global.on_message = _blockinputs;
			global.menuenabled = false;
			kmove_allow(!_blockmovement);		
		}
		if _popup == true
		{
			popup_on_trigger(id, id, _popupname, _popupname)	
		}
		else
		{
			cutscene_end_action();	
		}
	}
}
	
function cutscene_priority(){
	// Dá prioridade a cutscene
	global.cutscene.priority = true;
	if instance_exists(_SYS_BUBBLE_SPEECH) instance_destroy(_SYS_BUBBLE_SPEECH);
	else cutscene_end_action();
}

function cutscene_end_priority(){
	// Remove a prioridade
	global.cutscene.priority = false;
	cutscene_end_action();
}

//======================================================//
//======================================================//
//======================================================//
#endregion

#region WAIT
//======================================================//
//======================================================//
//======================================================//

///description Evento que espera X segundos. O valor de segundos é definido em time. Instanceid é self.id. inSeconds é se o tempo deve ser em segundos.
function cutscene_wait(stime, inSeconds = false, instanceid = self.id){
	time[self.scene_indexer] = stime;
	if !variable_instance_exists(instanceid,"_sceneTimer[" + string(self.scene_indexer) +"]"){
		variable_instance_set(instanceid,"_sceneTimer[" + string(self.scene_indexer) +"]", 0);
		instanceid._sceneTimer[self.scene_indexer] = 0;
	}
	// Verificando se ele tem a variável timer, que vamos usar no script. Se não tiver, ele instancia no objeto.	
	instanceid._sceneTimer[self.scene_indexer]++
	
	if(!inSeconds && instanceid._sceneTimer[self.scene_indexer] >= time[self.scene_indexer]){
		cutscene_end_action();
		//variable_instance_set(instanceid,"_sceneTimer[" + string(self.scene_indexer) +"]",0);
	}
	else if(inSeconds && instanceid._sceneTimer[self.scene_indexer] >= time[self.scene_indexer] * game_get_speed(gamespeed_fps)){
		cutscene_end_action();
		//variable_instance_set(instanceid,"_sceneTimer[" + string(self.scene_indexer) +"]",0);
	}
}

//======================================================//
//======================================================//
//======================================================//
#endregion

#region OBJECT MANIPULATION

function cutscene_set_persistent(object = self, bol = true){
	// Torna o objeto persistente
	object_set_persistent(object, bol);
	//instance_change(object, bol);
	cutscene_end_action();
}

function cutscene_delete_object(instance){
	// Remove o objeto
	if instance_exists(instance) instance_destroy(instance)
	cutscene_end_action();
}

function cutscene_visibile(lobj, lbool = true){
	// Torna o objeto visivel
	if instance_exists(lobj) lobj.visible = lbool;
	cutscene_end_action();
}
	
function cutscene_change_graphic(obj, graphic, dir = 1)
{
	
	_intern_graphic(obj, graphic, dir);
	obj.customspr = false;
	cutscene_end_action();
}

function cutscene_change_graphic_timed(obj, graphic, time, dir = 1)
{
	
	_intern_graphic(obj, graphic, dir);
	if _intern_timer(time)
	{
		obj.customspr = false;
		cutscene_end_action();
	}
}

#region MOVE
//======================================================//
//======================================================//
//======================================================//

///@description Move o objeto em uma direção.
function cutscene_move(dir,spd,stime, lockplayer = true, instanceid = self.id){
	// Move algum objeto
	time[self.scene_indexer] = stime;
	if !variable_instance_exists(instanceid,"_sceneTimer[" + string(self.scene_indexer) +"]"){
		variable_instance_set(instanceid,"_sceneTimer[" + string(self.scene_indexer) +"]", 0);
		instanceid._sceneTimer[self.scene_indexer] = 0;
		instanceid._timerbol = true;
	}
	else
	{
		
	}
	if instanceid._sceneTimer[self.scene_indexer] < time[self.scene_indexer]
	{
		if dir == "downleft"	or dir == 1			{	instanceid.y += spd/2 ; instanceid.x -= spd/2;	}
		if dir == "down"		or dir == 2										instanceid.y += spd
		if dir == "downright"	or dir == 3			{	instanceid.y += spd/2 ; instanceid.x += spd/2;	}
		if dir == "left"		or dir == 4										instanceid.x -= spd
		if dir == "right"		or dir == 6										instanceid.x += spd
		if dir == "upleft"		or dir == 7			{	instanceid.y -= spd/2 ; instanceid.x -= spd/2;	}
		if dir == "up"			or dir == 8										instanceid.y -= spd
		if dir == "upright"		or dir == 9			{	instanceid.y -= spd/2 ; instanceid.x += spd/2;	}
		instanceid._sceneTimer[self.scene_indexer]++;
	}
	else if instanceid._sceneTimer[self.scene_indexer] >= time[self.scene_indexer]
	{
		instanceid._sceneTimer[self.scene_indexer] = 0;
		cutscene_end_action();		
	}
}
	
function cutscene_move_anim(dir,spd,stime, initsprite, sprite, xdir = 1, lockplayer = true, instanceid = self.id){
	// Move algum objeto
	time[self.scene_indexer] = stime;
	_intern_graphic(instanceid, sprite, xdir);
	if !variable_instance_exists(instanceid,"_sceneTimer[" + string(self.scene_indexer) +"]"){
		variable_instance_set(instanceid,"_sceneTimer[" + string(self.scene_indexer) +"]", 0);
		instanceid._sceneTimer[self.scene_indexer] = 0;
		instanceid._timerbol = true;
	}
	else
	{
		
	}
	if instanceid._sceneTimer[self.scene_indexer] < time[self.scene_indexer]
	{
		if dir == "downleft"	or dir == 1			{	instanceid.y += spd/2 ; instanceid.x -= spd/2;	}
		if dir == "down"		or dir == 2										instanceid.y += spd
		if dir == "downright"	or dir == 3			{	instanceid.y += spd/2 ; instanceid.x += spd/2;	}
		if dir == "left"		or dir == 4										instanceid.x -= spd
		if dir == "right"		or dir == 6										instanceid.x += spd
		if dir == "upleft"		or dir == 7			{	instanceid.y -= spd/2 ; instanceid.x -= spd/2;	}
		if dir == "up"			or dir == 8										instanceid.y -= spd
		if dir == "upright"		or dir == 9			{	instanceid.y -= spd/2 ; instanceid.x += spd/2;	}
		instanceid._sceneTimer[self.scene_indexer]++;
	}
	else if instanceid._sceneTimer[self.scene_indexer] >= time[self.scene_indexer]
	{
		instanceid._sceneTimer[self.scene_indexer] = 0;
		if instanceid = global.player instanceid.customspr = false;
		else _intern_graphic(instanceid, initsprite, xdir);
		cutscene_end_action();		
	}
}

function cutscene_lock_movement(boolean = false){
	// Trava o movimento
	global.can_move = boolean
	cutscene_end_action();
}

//======================================================//
//======================================================//
//======================================================//
#endregion


#endregion

#region RESET ROTINE
function cutscene_reset(value = 0){
	// Reseta a rotina daquela página
	self.scene[self.scene_indexer] = value;	
}

function cutscene_full_reset(value = 0){
	// Reseta todo o evento
	self.scene_indexer = 0;
	self.scene[self.scene_indexer] = value;	
}

function store_value(oname, value,object){
	// Armazena um valor e cria uma variável se não houver
	if !variable_instance_exists(object,name) variable_instance_set(object,oname,value)
	else object.oname = value	
}
#endregion

#region NEXT STEP AND STEP SELECTOR

//======================================================//
//======================================================//
//======================================================//
// [cutscene_next_step, condition, conditionvalue, goto, reset=false, resetval = 0],

function cutscene_next_step(condition,conditionvalue,reset=false,resetval = 0){
	// Esse é um IF. Se as informações e condições baterem, prossegue.
	if condition = conditionvalue {
		cutscene_end_action();
	}
	else if reset {
		self.scene[self.scene_indexer] = resetval;	
	}
}

function cutscene_step_selection(cond1, condval1, step1, cond2 = undefined, condval2 = undefined, step2 = undefined, cond3 = undefined, condval3 = undefined, step3 = undefined){
	// O mesmo que o anterior, mas com seleção para qual ponto da cena vai
	cond2 ??= 0 ; cond3 ??= 0;
	if condval1 == cond1 self.scene[self.scene_indexer] = step1;
	else if condval2 == cond2 self.scene[self.scene_indexer] = step2;
	else if condval3 == cond1 self.scene[self.scene_indexer] = step3;
	else cutscene_end_action();
}

function cutscene_next_step_collider(object = self, trigger = false, collider1, collider2 = collider1, collider3 = collider2, collider4 = collider3){
	// Avança caso esteja colidindo e apertando uma tecla (DO_NOTHING_TRIGGER)
	isTrigger = (
		place_meeting(object.x,object.y,collider1) or 
		place_meeting(object.x,object.y,collider2) or	
		place_meeting(object.x,object.y,collider3) or 
		place_meeting(object.x,object.y,collider4)
	)
	if isTrigger{
		if trigger != false{
			if keyboard_check_pressed(trigger)	cutscene_end_action();
		}
		else cutscene_end_action();
	}
	
}


function cutscene_goto(resetval){
	// Vai para a ação
	self.scene[self.scene_indexer] = resetval;
}

function cutscene_goto_page(page, resetval){
	// Vai para a página
	self.scene_indexer = page;
	self.scene[self.scene_indexer] = resetval;
	cutscene_end_action();
}

function cutscene_goto_page_clean(page, resetval){
	// Vai para a página e limpa os indexers
	clean_cutscene_2d_arrays();
	self.scene_indexer = page;
	self.scene[self.scene_indexer] = resetval;
	
	cutscene_end_action();
}

function cutscene_switched_page(trigger, value, pageval){
	_length = array_length(global.triggers);
	_triggered = false;
	
	if trigger != "noone" and trigger != "none" and trigger != "empty" and trigger != ""{
		for(i=0;i<_length;i++){
			if trigger == global.triggers[i].name or trigger == global.triggers[i].id {
				if global.triggers[i].value == value	{
					cutscene_skip_page(pageval);
					self.scene[self.scene_indexer] = 0;
					_triggered = true;
				
				}
			}
		}
	}
	if !_triggered cutscene_end_action();
}

function cutscene_switch(trigger, value, pageval){
	_length = array_length(global.triggers);
	_triggered = false;
	
	if trigger != "noone" and trigger != "none" and trigger != "empty" and trigger != ""{
		for(i=0;i<_length;i++){
			if trigger == global.triggers[i].name or trigger == global.triggers[i].id {
				if global.triggers[i].value == value	{
					cutscene_skip_page(pageval);
					self.scene[self.scene_indexer] = 0;
					_triggered = true;
				
				}
			}
		}
	}
	if !_triggered cutscene_end_action();
}

function cutscene_variable_page(trigger, value, pageval, ind = 0){
	// Se cumprir as condições (trigger == value), vai pra página pageval
	_length = array_length(global.triggers);
	_triggered = false;
	
	if trigger == value
	{
		cutscene_skip_page(pageval);
		self.scene[self.scene_indexer] = ind;
		_triggered = true;	
	}
	if !_triggered cutscene_end_action();
}

function cutscene_skip_page(pageval){
	// Pula a página
	self.scene_indexer = pageval;
}

function cutscene_skip_page_other(pageval, object = self, indexer){
	// Pula a página do outro objeto
	object.scene_indexer = pageval;
	object.scene[object.scene_indexer] = indexer;
	cutscene_end_action();
}


//======================================================//
//======================================================//
//======================================================//
#endregion

#region FADE
//cutscene_object_fade, "out", 0.01, 4
function clean_fade(){
	if instance_exists(_SYS_FADE) {
		global.cleanfade = true;
		variable_instance_set(self.id,"_sceneIndexerHelperFade", ""); 
		instance_destroy(_SYS_FADE);
		}
	else {
		global.cleanfade = false;
		cutscene_end_action();
	}
}

function cutscene_object_fade(effect, speed, reach, reachstart, object = self.id, keep = false){
	// Seta o fade in ou out
	//image_alpha = reachstart;
	if global.cleanfade != true {
		if !instance_exists(_SYS_FADE) {
			sys_fade = instance_create_depth(0,0,-10000, _SYS_FADE);
		}
		else {
			sys_fade = _SYS_FADE;		
		}
		object = sys_fade
		switch(effect){
			case "in":
				if !variable_instance_exists(object,"_sceneIndexerHelperFade"){
					variable_instance_set(object,"_sceneIndexerHelperFade", effect);
					object.image_alpha = reachstart;
				}
				else if variable_instance_exists(object,"_sceneIndexerHelperFade") and object._sceneIndexerHelperFade != effect object._sceneIndexerHelperFade = effect
				else if variable_instance_exists(object, "_sceneIndexerHelperFade") and object._sceneIndexerHelperFade == effect{
					if object.image_alpha < reach {object.image_alpha += speed}
					else {if !keep instance_destroy(sys_fade); cutscene_end_action();}
				}	
			break
		
			case "out":
				if !variable_instance_exists(object,"_sceneIndexerHelperFade"){
					variable_instance_set(object,"_sceneIndexerHelperFade", effect);
					object.image_alpha = reachstart;
				}
				else if variable_instance_exists(object,"_sceneIndexerHelperFade") and object._sceneIndexerHelperFade != effect {object._sceneIndexerHelperFade = effect}
				else if variable_instance_exists(object, "_sceneIndexerHelperFade") and object._sceneIndexerHelperFade == effect{
					if object.image_alpha > reach {
						object.image_alpha -= speed;
						}
					else {
						if !keep instance_destroy(sys_fade); 
						cutscene_end_action();
						}
				}
			break
			
			case "delete":
				instance_destroy();
			break
		}
	}
	else
	{
		instance_destroy();
			
	}
}
#endregion

#region MOVE

	function cutscene_camera_change(target = "player"){
		if !instance_exists(_GLOBAL_CAMERA) instance_create_depth(0,0,global.intern.depths.over,_GLOBAL_CAMERA)
		if target == "player" {
			_GLOBAL_CAMERA.customtarget = false;
			_GLOBAL_CAMERA.targetobj = global.player;
		}
		else {
			_GLOBAL_CAMERA.customtarget = true;
			_GLOBAL_CAMERA.targetobj = target;			
		}
		cutscene_end_action();
	}

	function cutscene_look_direction(object = self, side = "R", opposite = false){
		var mult = 1;
		if opposite mult = -1
		if object != global.player
		{
			if side == "R" or side == 1{
				if object.x > global.player.x object.image_xscale = -1*mult;
				else if object.x < global.player.x object.image_xscale = 1*mult;
			}
			else if side == "L" or side == -1 {
				if object.x < global.player.x object.image_xscale = -1*mult;
				else if object.x > global.player.x object.image_xscale = 1*mult;			
			}
			else {
				if object.x < side.x object.image_xscale = 1*mult;
				else if object.x > side.x object.image_xscale = -1*mult;	
			}
		}
		else
		{
			if side == "R" or side == 1 object.image_xscale = 1;
			if side == "L" or side == -1 object.image_xscale = -1;
			
		}
		cutscene_end_action();
	}
	
	function cutscene_look_at_point(object, xpoint, opposite){
		var mult = 1;
		if opposite mult = -1
		if object.x < xpoint object.image_xscale = 1*mult;
		else if object.x > xpoint object.image_xscale = -1*mult;	
		cutscene_end_action();
	}

	function cutscene_pathfind_move(mainobj, reach_x, reach_y, objspeed){
		// Faz o objeto ir até a coord
		variable_instance_set(mainobj,"target_x",reach_x);
		variable_instance_set(mainobj,"target_y",reach_x);
		variable_instance_set(mainobj,"obj_speed",objspeed);
		variable_instance_set(mainobj,"path",path_add());
		
		
		_aux = instance_create_depth(0,0,0,_SYS_PATHFINDER);
		_aux.target_x = reach_x;
		_aux.target_y = reach_y;
		_aux.obj_speed = objspeed// random_range(1.6, 2.4);
		_aux.parobj = mainobj;		
		/*
		mp_grid_path(GridSetup.grid, path, x,y, target_x, target_y, 1);
		path_start(path, obj_speed, path_action_stop, true);		
		if mainobj.x == reach_x and mainobj.y == reach_y cutscene_end_action();
		*/
	}
		
	function cutscene_move_path(_x, _y, objspeed, alarm_id, object)
	{
		// Pra usar esse método, é necessário criar um ALARM.
		// Nele, você precisa chamar a função SET_PATH();
		// Como argumento do set_path, você pode por o ID do alarm.
		// É necessário por um alarm_set(ID DO ALARM) no create tb
		with (object) {
			reach_x = _x;
			reach_y = _y;
			reach_vel = objspeed;
			state_machine = "SCENE_PATH";
		}
			if GPT_compare_with_margin(object.x,object.reach_x,objspeed * 2) and GPT_compare_with_margin(object.y, object.reach_y, objspeed * 2)
			{
				sdm("EEEEEEEEEEEEEEEE");
				cutscene_end_action();			
			}
	}
	
	function cutscene_change_coordinates(object,xx,yy, validate = false){
		if validate{
			if !instance_exists(object) instance_create_depth(xx,yy,0,object);	
		}
		object.x = xx;
		object.y = yy;
		cutscene_end_action();		
	}
	
	function cutscene_wait_reach_pos(object,reach_x,reach_y){
			if int64(object.x) == reach_x and int64(object.y) == reach_y {
				cutscene_end_action();
			}
	}

#endregion

#region CHANGE_ROOM
function cutscene_change_room(room_name){
	room_goto(room_name);
	cutscene_end_action();
}

function teleport_between_room(room_name,xx1,yy1,obj = other){
	var object = instance_create_depth(obj.x,obj.y,+1,Teleporter);
	object._xx = xx1;
	object._yy = yy1;
	object._r = room_name;
	object.obj = obj;
	cutscene_end_action();
}

function perform_transfer(room_name,xx1,yy1,obj,fade = true, _wait = true){
	var object = instance_create_depth(0,0,0,TP);
	object.set_room = room_name;
	object.fade = true;
	object.set_x = xx1;
	object.set_y = yy1;
	object.set_object = obj;
	if !_wait cutscene_end_action();
	else
	{
		if room_get_name(room) == room_get_name(room_name) cutscene_end_action();
	}
}
#endregion

#region CUTSCENE INPUT

function cutscene_wait_for_input(keyormouse = "k", input){
	if keyormouse == "key" or keyormouse == "keyboard" or keyormouse == "k" keyormouse = "k";
	if keyormouse == "mouse" or keyormouse == "m" keyormouse = "m";
	
	if keyormouse == "k"{
		if keyboard_check_pressed(input) cutscene_end_action();
		
	}
	else if keyormouse == "m"{
		if mouse_check_button_pressed(input) cutscene_end_action();
		
	}
	
}

function cutscene_wait_for_input_on_region(keyormouse = "k", input, object = self.id, radius, collider1, collider2 = collider1, collider3 = collider1, collider4 = collider1){
	if keyormouse == "key" or keyormouse == "keyboard" or keyormouse == "k" keyormouse = "k";
	if keyormouse == "mouse" or keyormouse == "m" keyormouse = "m";
	
	isTrigger = kget_radius(object, radius, false, true, false, collider1, collider2, collider3, collider4);
	
	if keyormouse == "k" and isTrigger{
		if keyboard_check_pressed(input) cutscene_end_action();
		
	}
	else if keyormouse == "m" and isTrigger{
		if mouse_check_button_pressed(input) cutscene_end_action();
		
	}	
}

function cutscene_wait_for_input_on_collission(keyormouse = "k", input, object, collider1, collider2 = collider1, collider3 = collider1, collider4 = collider1){
	if keyormouse == "key" or keyormouse == "keyboard" or keyormouse == "k" keyormouse = "k";
	if keyormouse == "mouse" or keyormouse == "m" keyormouse = "m";
	

		if keyormouse == "k"{
			if place_meeting(object.x,object.y,collider1) or 
			place_meeting(object.x,object.y,collider2) or	
			place_meeting(object.x,object.y,collider3) or 
			place_meeting(object.x,object.y,collider4) isTrigger = true
			else isTrigger = false
		}
		else if keyormouse == "m"
		{
			
			if	position_meeting(mouse_x,mouse_y,collider1) or
				position_meeting(mouse_x,mouse_y,collider2) or	
				position_meeting(mouse_x,mouse_y,collider3) or 
				position_meeting(mouse_x,mouse_y,collider4) isTrigger = true
			else isTrigger = false
		}		
	
	if keyormouse == "k" and isTrigger{
		if keyboard_check_pressed(input) cutscene_end_action();
		
	}
	else if keyormouse == "m" and isTrigger{
		if mouse_check_button_pressed(input) cutscene_end_action();
		
	}
	
}

#endregion

#region INSTANCE MANAGEMENT
	function cutscene_destroy_object(object_id = self.id){
		instance_destroy(object_id);
		cutscene_end_action();
	}
		
	function cutscene_instanciate_object(xx, yy, sdepth, object_id = self.id, slayer = noone)
	{
		if slayer != noone
		{
			instance_create_layer(xx, yy, slayer, object_id);
		}
		else
		{
			instance_create_depth(xx, yy, sdepth, object_id);
		}
		cutscene_end_action();
	}
#endregion

#region VARIABLES MANAGEMENT
	function cutscene_variable(object, variable_name, variable_value){
		variable_instance_set(object,variable_name,variable_value);
		variable_name = variable_value;
		cutscene_end_action();
	}
	
	function cutscene_self_variable(variable, value)
	{
		variable = value;	
	}
	
	function global_variable(variable_name, variable_value){
		variable_name = variable_value;
		cutscene_end_action();
	}
#endregion

#region ALARM MANAGEMENT
	function cutscene_set_alarm(alarm_id, alarm_time, object = self)
	{
		with(object){
		alarm_set(alarm_id, alarm_time);
		}
		cutscene_end_action();		
	}
	
	function cutscene_set_alarm_machine(object, variable_name, variable_value, alarm_id, alarm_time){
		variable_instance_set(object,variable_name,variable_value);
		variable_name = variable_value;
		alarm_set(alarm_id, alarm_time);
		cutscene_end_action();		
	}
	
	function cutscene_alarm_pathfinder(object, variable_name, variable_value, alarm_id, alarm_time, xx, yy, spd)
	{
			if !variable_instance_exists(object, "alarmpath") variable_instance_set(object, "alarmpath", false);
			variable_instance_set(object,variable_name,variable_value);
			if object.alarmpath == false{
				object.target_x = xx;
				object.target_y = yy;
				object.obj_speed = spd;
				
				with(object){
					variable_name = variable_value;
					alarm_set(alarm_id, alarm_time);
				}
				object.alarmpath = true;
			}
			else if object.alarmpath == true{
				if int64(object.x) == xx and int64(object.y) == yy {
					object.alarmpath = false;
					cutscene_end_action();
				}
			}	
		
		
		
	}
	
	function cutscene_self_pathfinder(object, variable_name, variable_value, alarm_id, alarm_time, xx, yy, spd)
	{
		validate_variable("target_x");
		validate_variable("target_y");
		validate_variable("obj_speed");
		if !variable_instance_exists(self, "alarmpath") variable_instance_set(self, "alarmpath", false)
			if alarmpath == false{
				target_x = xx;
				target_y = yy;
				obj_speed = spd;
				variable_instance_set(self,variable_name,variable_value);
				alarm_set(alarm_id, alarm_time);
				alarmpath = true;
			}
			else if alarmpath == true{
				if int64(x) == xx and int64(y) == yy {
					alarmpath = false;
					cutscene_end_action();
				}
			}	
		
		
		
	}
	
	function cutscene_set_alarm_path(object, variable_name, variable_value, reach_x, reach_y, alarm_id, alarm_time){
			if !variable_instance_exists(object, "alarmpath") variable_instance_set(object, "alarmpath", false);
			if object.alarmpath == false{
				
				variable_instance_set(object,variable_name,variable_value);
				with(object){
				variable_name = variable_value;
				alarm_set(alarm_id, alarm_time);
				}
				object.alarmpath = true;
			}
			else if object.alarmpath == true{
				if int64(object.x) == reach_x and int64(object.y) == reach_y {
					object.alarmpath = false;
					cutscene_end_action();
				}
			}		
		}
#endregion

#region MENU

function cutscene_lock_menu(){
	global.menuenabled = false;
	cutscene_end_action();
	
}

function cutscene_unlock_menu(){
	global.menuenabled = true;
	cutscene_end_action();
	
}

#endregion

#region SCENE
	
function call_shop(type = 0){
	if type == 0
	{
		if !instance_exists(sceneShop)	var shop = instance_create_depth(x,y,depth,sceneShop)
	}
	else
	{
		if !instance_exists(sceneShopSell)	var shop = instance_create_depth(x,y,depth,sceneShopSell)
	}
	if to_gamepad_pressed("X")	cutscene_end_action();
}
	
#endregion

#region DRAWS

function cutscene_clean_graphics(){
	
	
}

function cutscene_text_on_gui(_x,_y,_text,_textspeed = 4,_color = c_white,_font = Ruler,_align = fa_center){
	_obj = validate_object(_SYS_TEXT);
	if _obj != false {
		_obj.xx = _x;
		_obj.yy = _y;
		_obj.texto = _text;
		_obj.textspeed = _textspeed;
		_obj.colortext = _color;
		_obj.font = _font;
		_obj.align = _align;
		
	}
	cutscene_end_action()
}

function cutscene_text_on_gui_timed(_x,_y,_text,time,_textspeed = 4,_color = c_white,_font = Ruler,_align = fa_center){
	var texttime = _intern_timer(time);
	if texttime {
		if instance_exists(_SYS_TEXT) instance_destroy(_SYS_TEXT);
	}
	else _obj = validate_object(_SYS_TEXT);
	
	if _obj != false 
	{
		_obj.xx = _x;
		_obj.yy = _y;
		_obj.texto = _text;
		_obj.textspeed = _textspeed;
		_obj.colortext = _color;
		_obj.font = _font;
		_obj.align = _align;
	}
	
	if texttime cutscene_end_action()
}
	
function cutscene_fade_in(time){
	var inst = validate_object(_SYS_FADE);
	inst.finished2 = false;
	inst.effect = "in";
	inst.spd = time;
	if inst.finished1 cutscene_end_action()
}

function cutscene_fade_out(time){
	var inst = validate_object(_SYS_FADE);
	inst.finished1 = false;
	inst.effect = "out";
	inst.spd = time;
	if inst.finished2 cutscene_end_action()
}

#endregion

#region PLAYER
function heal_player(playerid = 0, amount = 999999){
	item_heal(amount);
	cutscene_end_action();
}

#endregion