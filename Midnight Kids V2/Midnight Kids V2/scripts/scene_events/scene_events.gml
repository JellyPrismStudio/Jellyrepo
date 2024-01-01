#region INTERN (NOT CUTSCENES)
// MÉTODOS USADOS DENTRO DOS MÉTODOS DAS CUTSCENES, E NÃO COMO MÉTODOS DE CUTSCENE EM SI


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
	// Inicia uma seção de cutscene, travando o player, dando prioridade a esse evento, resetando a camera,
	// travando menus,
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
	// Fecha a seção da cutscene
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
	// _triggerEvent = Método de ativação
	
	// Se o triggerEvent for 0, inicia a cutscene no toque.
	// Se o triggerEvent for 1, inicia a cutscene quando aperta espaço
	
	// _blockmovement = Bloquear movimento na cutscene
	
	// _blockInputs = bloqueia menu
	
	// _popup = Se o evento tera uma popup de interação
	
	// _popupname = nome da popup
	
	// _triggerID = verifica se o trigger desse ID é igual ao
	// _triggerVAL, e caso seja igual, a página do evento é modificada para
	// _triggerPage.
	
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
	// Muda o gráfico de um objeto
	_intern_graphic(obj, graphic, dir);
	obj.customspr = false;
	cutscene_end_action();
}

function cutscene_change_graphic_timed(obj, graphic, time, dir = 1)
{
	// Espera 'time' frames para mudar o gráfico de um objeto.
	// Esse método é uma junção de WAIT com cutscene_change_graphic
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
	// dir: 8= norte
	//      6= leste
	//      4= oeste
	//      2= sul
	// spd: velocidade
	// stime: por quanto tempo se move
	// initsprite: sprite inicial que o objeto tem
	// sprite: sprite que deve ter enquanto performa a ação de mover
	// xdir: ---
	// lockplayer: trava o input do player
	// instanceid: ---
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
	if condition == conditionvalue {
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
	// Muda a página de eventos
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
	// Adiciona trigger
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
		// Muda o foco da câmera
		if !instance_exists(_GLOBAL_CAMERA) instance_create_depth(0,0,global.intern.depths.over,_GLOBAL_CAMERA)
		if target == "player" {
			_GLOBAL_CAMERA.customtarget = false;
			_GLOBAL_CAMERA.targetobj = global.player;
		}
		else {
			if instance_exists(target)
			{
				_GLOBAL_CAMERA.customtarget = true;
				_GLOBAL_CAMERA.targetobj = target;	
			}
		}
		cutscene_end_action();
	}

	function cutscene_look_direction(object = self, side = "R", opposite = false){
		// Faz um objeto olhar em uma direção (L ou R)
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
		// Faz um objeto olhar para um ponto x e y
		var mult = 1;
		if opposite mult = -1
		if object.x < xpoint object.image_xscale = 1*mult;
		else if object.x > xpoint object.image_xscale = -1*mult;	
		cutscene_end_action();
	}

	function cutscene_pathfind_move(mainobj, reach_x, reach_y, objspeed){
		// Faz o objeto ir até a coord
		// Use o cutscene_move_path ao invés desse método
		/////////////////////////////////////////////////
		
		
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
		// É necessário por um alarm_set(ID DO ALARM) no create tb, para iniciar ele
		// OBS: O evento é feito em alarm pois precisa atualizar com menos frequencia
		// que um step
		with (object) {
			reach_x = _x;
			reach_y = _y;
			reach_vel = objspeed;
			state_machine = "SCENE_PATH";
		}
			if GPT_compare_with_margin(object.x,object.reach_x,objspeed * 2) and GPT_compare_with_margin(object.y, object.reach_y, objspeed * 2)
			{
				cutscene_end_action();			
			}
	}
	
	function cutscene_change_coordinates(object,xx,yy, validate = false){
		// Muda a coordenada do objeto X
		if validate{
			if !instance_exists(object) instance_create_depth(xx,yy,0,object);	
		}
		object.x = xx;
		object.y = yy;
		cutscene_end_action();		
	}
	
	function cutscene_wait_reach_pos(object,reach_x,reach_y){
		// Espera o objeto X se mover para x e y
			if int64(object.x) == reach_x and int64(object.y) == reach_y {
				cutscene_end_action();
			}
	}

#endregion

#region CHANGE_ROOM
function cutscene_change_room(room_name){
	// Muda a room
	room_goto(room_name);
	cutscene_end_action();
}

function teleport_between_room(room_name,xx1,yy1,obj = other){
	// OBSOLETO
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
	// Espera por um input do teclado ou mouse
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
		// Muda o valor de uma variavel de um objeto
		variable_instance_set(object,variable_name,variable_value);
		variable_name = variable_value;
		cutscene_end_action();
	}
	
	function cutscene_self_variable(variable, value)
	{
		// muda a própria variável
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
	
function instanciate_choices(arg1, arg2, arg3 = "", page1 = noone, page2 = noone , page3 = noone){
	var screen = global.config.camera_width/2/2;
	var plus_y = 0;
	var window_x = camera_get_view_x(view_camera[0]) + screen;
	var window_y = camera_get_view_y(view_camera[0]);
	if arg3 == "" plus_y = 50
	if !instance_exists(choiceManager){
		var cm = instance_create_depth(0,0,global.intern.depths.msg+1,choiceManager);
			/////////////////////////////
			var opt1 = instance_create_depth(window_x,window_y + 100 + plus_y,global.intern.depths.msg,choiceBox);
			opt1.texto = arg1;
			opt1.image_xscale = 4;
			opt1.super = cm;
			opt1.myid = 1;
			
			var opt2 = instance_create_depth(window_x,window_y + 200 + plus_y,global.intern.depths.msg,choiceBox);
			opt2.texto = arg2;
			opt2.image_xscale = 4;
			opt2.super = cm;
			opt2.myid = 2;
			
			if arg3 != "" 
			{
				var opt3 = instance_create_depth(window_x,window_y + 300,global.intern.depths.msg,choiceBox);
				opt3.texto = arg3;
				opt3.image_xscale = 4;
				opt3.super = cm;
				opt3.myid = 3;
			}
			/////////////////////////////
			
		
	}
	else 
	{
		var cm = instance_find(choiceManager, 0);
		if cm.parid != -1 
		{
			_choice = cm.parid;
			if _choice == 1 and page1 != noone
			{
				self.scene_indexer = page1;	
				self.scene[self.scene_indexer] = -1;
			}
			else if _choice == 2 and page2 != noone
				{
					self.scene_indexer = page2;	
					self.scene[self.scene_indexer] = -1;
				}
				else if _choice == 3 and page3 != noone
					{
						self.scene_indexer = page3;	
						self.scene[self.scene_indexer] = -1;
					}
			
			cutscene_end_action();
		}
		
	}
}

function bubble_speech(object, text, name, waitforinput = true, yfix = 0, color = c_black, namecolor = #2a1c05, graphic = spr_BubbleSpeech, pointergraphic = PointerSpeech){
	//show_debug_message(object);
	// Usar o WITH para ver cada instancia
	if !instance_exists(_SYS_BUBBLE_SPEECH){		
		//show_debug_message("Criou");
		draw = inst_bubble();
		draw.instanciator = object;
		draw.object = object; draw.text = text; draw.bubblename = name;  draw.colortext = color; draw.graphic = graphic; draw.graphicpointer = pointergraphic; draw.yfix = yfix;
		draw.colorname = namecolor; draw.pointergraph = pointergraphic;
	}
	else{
		var check_object = object;
		var _exists = false;
		with(_SYS_BUBBLE_SPEECH){
			if instanciator == check_object { 
				draw = self.id;
				draw.object = object; draw.text = text; draw.bubblename = name;  draw.colortext = color; 
				draw.graphic = graphic; draw.graphicpointer = pointergraphic; draw.yfix = yfix; draw.colorname = namecolor;
				_exists = true; break}
		}
		if _exists == false {
			draw = inst_bubble();
			draw.instanciator = check_object;
			draw.object = object; draw.text = text; draw.bubblename = name;  draw.colortext = color; draw.graphic = graphic; draw.graphicpointer = pointergraphic; draw.yfix = yfix;
			draw.colorname = namecolor;
			_exists = true;
		}
	}
		
	if waitforinput and draw.message_ended{
		if keyboard_check_pressed(vk_space){
			cutscene_end_action();
			instance_destroy(draw);
		}
	}
	
}
	
function bubble_speech_choices(object, text, name, page1, page2, opt1 = "sim", opt2 = "não", horz = true){
	var waitforinput = true; 
	var yfix = 0; 
	var color = c_black; 
	var namecolor = #2a1c05; 
	var graphic = spr_BubbleSpeech; 
	var pointergraphic = PointerSpeech
	//show_debug_message(object);
	// Usar o WITH para ver cada instancia
	if !instance_exists(_SYS_BUBBLE_SPEECH_CHOICE){		
		//show_debug_message("Criou");
		draw = inst_bubble_choice();
		draw.instanciator = object; draw.super = self; draw.page1 = page1; draw.page2 = page2; draw.horz = horz;
		draw.object = object; draw.text = text; draw.bubblename = name;  draw.colortext = color; draw.graphic = graphic; draw.graphicpointer = pointergraphic; draw.yfix = yfix;
		draw.colorname = namecolor; draw.pointergraph = pointergraphic; draw.opt1 = opt1; draw.opt2 = opt2;
	}
	else{
		var check_object = object;
		var _exists = false;
		with(_SYS_BUBBLE_SPEECH_CHOICE){
			if instanciator == check_object { 
				draw = self.id; draw.super = self; draw.page1 = page1; draw.page2 = page2; draw.horz = horz;
				draw.object = object; draw.text = text; draw.bubblename = name;  draw.colortext = color; 
				draw.graphic = graphic; draw.graphicpointer = pointergraphic; draw.yfix = yfix; draw.colorname = namecolor;
				_exists = true; break}
		}
		if _exists == false {
			draw = inst_bubble();
			draw.instanciator = check_object;  draw.super = self; draw.page1 = page1; draw.page2 = page2; draw.horz = horz;
			draw.object = object; draw.text = text; draw.bubblename = name;  draw.colortext = color; draw.graphic = graphic; draw.graphicpointer = pointergraphic; draw.yfix = yfix;
			draw.colorname = namecolor;
			_exists = true;
		}
	}
		
	if waitforinput and draw.message_ended and draw.choice != 0 {
		if draw.choice == 1
		{
			self.scene_indexer = page1;	
			self.scene[self.scene_indexer] = -1;
		}
		else if draw.choice == 2
		{
			self.scene_indexer = page2;	
			self.scene[self.scene_indexer] = -1;
		}
		cutscene_end_action();
		instance_destroy(draw);
	}
}

function bubble_speech_party(object, text, name, waitforinput = true, yfix = 0, color = c_black, namecolor = #2a1c05, graphic = spr_BubbleSpeech, pointergraphic = PointerSpeech){

	if object == global.player {
		if global.player_stats[global.player.self_index].ind == 0 {
			if text.lisa != "" text = text.lisa else text = text._default
		}
		else if global.player_stats[global.player.self_index].ind == 1 {
			if text.ryan != "" text = text.ryan else text = text._default 
		}
		else if global.player_stats[global.player.self_index].ind == 2 {
			if text.hanna != "" text = text.hanna else text = text._default
		}
		else if global.player_stats[global.player.self_index].ind == 3 {
			if text.dylan != "" text = text.dylan else text = text._default
		}	
	}
	if !instance_exists(_SYS_BUBBLE_SPEECH){		
		//show_debug_message("Criou");
		draw = inst_bubble();
		draw.instanciator = object;
		draw.object = object; draw.text = text; draw.bubblename = name;  draw.colortext = color; draw.graphic = graphic; draw.graphicpointer = pointergraphic; draw.yfix = yfix;
		draw.colorname = namecolor;
	}
	else{
		var check_object = object;
		var _exists = false;
		with(_SYS_BUBBLE_SPEECH){
			if instanciator == check_object { 
				draw = self.id;
				draw.object = object; draw.text = text; draw.bubblename = name;  draw.colortext = color; 
				draw.graphic = graphic; draw.graphicpointer = pointergraphic; draw.yfix = yfix; draw.colorname = namecolor;
				_exists = true; break}
		}
		if _exists == false {
			draw = inst_bubble();
			draw.instanciator = check_object;
			draw.object = object; draw.text = text; draw.bubblename = name;  draw.colortext = color; draw.graphic = graphic; draw.graphicpointer = pointergraphic; draw.yfix = yfix;
			draw.colorname = namecolor;
			_exists = true;
		}
	}
		
	if waitforinput and draw.message_ended{
		if keyboard_check_pressed(vk_space){
			cutscene_end_action();
			instance_destroy(draw);
		}
	}
	
}

function bubble_speech_timed(time, object, text, name, waitforinput = true, yfix = 0, color = c_black, namecolor = #2a1c05, graphic = spr_BubbleSpeech, pointergraphic = PointerSpeech){
	//show_debug_message(object);
	// Usar o WITH para ver cada instancia

	if !instance_exists(_SYS_BUBBLE_SPEECH){		
		//show_debug_message("Criou");
		draw = inst_bubble();
		draw.instanciator = object;
		draw.object = object; draw.text = text; draw.bubblename = name;  draw.colortext = color; draw.graphic = graphic; draw.graphicpointer = pointergraphic; draw.yfix = yfix;
		draw.colorname = namecolor;
	}
	else{
		var check_object = object;
		var _exists = false;
		with(_SYS_BUBBLE_SPEECH){
			if instanciator == check_object { 
				draw = self.id;
				draw.object = object; draw.text = text; draw.bubblename = name;  draw.colortext = color; 
				draw.graphic = graphic; draw.graphicpointer = pointergraphic; draw.yfix = yfix;
				draw.colorname = namecolor;
				_exists = true; break}
		}
		if _exists == false {
			draw = inst_bubble();
			draw.instanciator = check_object;
			draw.object = object; draw.text = text; draw.bubblename = name;  draw.colortext = color; draw.graphic = graphic; draw.graphicpointer = pointergraphic; draw.yfix = yfix; draw.colorname = namecolor;
			_exists = true;
		}
	}
		
		
	if !instance_exists(_AUX_TIMER_SPEECH){
		timerobj = instance_create_depth(0,0,0,_AUX_TIMER_SPEECH);		
		variable_instance_set(timerobj,"varname","_BUBBLESPEECH");
		variable_instance_set(timerobj,"vartimer",time);
	}
	else
	{
		if !variable_instance_exists(_AUX_TIMER_SPEECH,"varname")
		{
			timerobj = instance_create_depth(0,0,0,_AUX_TIMER_SPEECH);		
			variable_instance_set(timerobj,"varname","_BUBBLESPEECH");
			variable_instance_set(timerobj,"vartimer",time);
		}
		else
		{
			if _AUX_TIMER_SPEECH.varname == "_BUBBLESPEECH"
			{
				var objecttimer = _AUX_TIMER_SPEECH;
				if objecttimer.vartimer > 0 {
					objecttimer.vartimer--;
					
				}
				else
				{
					cutscene_end_action();
					instance_destroy(draw);
					instance_destroy(objecttimer);
				}
			}
		}
	}	
		
}

function bubble_speech_on_trigger(object, messageobject, text, name, namecolor = c_red, yfix = 0, reset = true, resid = 0, collider1, collider2 = collider1, collider3 = collider1, collider4 = collider1){
	//show_debug_message(object);
	
	isTrigger = (
		place_meeting(object.x,object.y,collider1) or 
		place_meeting(object.x,object.y,collider2) or	
		place_meeting(object.x,object.y,collider3) or 
		place_meeting(object.x,object.y,collider4)
	)
	
	
	inst = _SYS_BUBBLE_MANAGER;
	
	
	
	if !instance_exists(_SYS_BUBBLE_SPEECH){
		//show_debug_message("Criou");
		draw = inst_bubble();
		draw.instanciator = object;
		draw.object = messageobject; draw.text = text; draw.bubblename = name;  draw.yfix = yfix;
		draw.colorname = namecolor;
	}
	else if instance_exists(_SYS_BUBBLE_SPEECH){
		var check_object = object;
		var _exists = false;
		with(_SYS_BUBBLE_SPEECH){
			if instanciator == check_object { 
				draw = self.id;
				draw.object = messageobject; draw.text = text; draw.bubblename = name;  draw.yfix = yfix;
				draw.colorname = namecolor;
				_exists = true; break}
		}
		if _exists == false {
			draw = inst_bubble();
			draw.instanciator = check_object;
			draw.object = messageobject; draw.text = text; draw.bubblename = name;  draw.yfix = yfix;
			draw.colorname = namecolor;
			_exists = true;
		}
	}
	
	if isTrigger{
		if keyboard_check_pressed(vk_space){
			cutscene_end_action();
			instance_destroy(draw);
		}
	}
	if !isTrigger and reset == true {cutscene_goto(resid); instance_destroy(draw);}
	if !isTrigger and reset == false{ instance_destroy(draw)}
}

function bubble_speech_on_radius(object, messageobject, text, name, rad = 15, yfix = 0, reset = true, resid = 0, collider1, collider2 = collider1, collider3 = collider1, collider4 = collider1){
	
	isTrigger = kget_radius(object, rad, false, true, false, collider1, collider2, collider3, collider4);
	
	inst = _SYS_BUBBLE_MANAGER;	
	
	if !instance_exists(_SYS_BUBBLE_SPEECH){
		//show_debug_message("Criou");
		draw = instance_create_depth(0,0,0,_SYS_BUBBLE_SPEECH);
		draw.instanciator = object;
		draw.object = messageobject; draw.text = text; draw.bubblename = name;  draw.yfix = yfix;
	}
	else if instance_exists(_SYS_BUBBLE_SPEECH){
		var check_object = object;
		var _exists = false;
		with(_SYS_BUBBLE_SPEECH){
			if instanciator == check_object { 
				draw = self.id;
				draw.object = messageobject; draw.text = text; draw.bubblename = name;  draw.yfix = yfix;				
				_exists = true; break}
		}
		if _exists == false {
			draw = inst_bubble();
			draw.instanciator = check_object;
			draw.object = messageobject; draw.text = text; draw.bubblename = name;  draw.yfix = yfix;
			_exists = true;
		}
	}
	
	if isTrigger{
		if keyboard_check_pressed(vk_space){
			cutscene_end_action();
			instance_destroy(draw);
		}
	}
	if !isTrigger and reset == true {cutscene_goto(resid); instance_destroy(draw);}
	if !isTrigger and reset == false{ instance_destroy(draw)}	
	
	//if !instance_exists(_SYS_BUBBLE_SPEECH){
	//	var draw = _SYS_BUBBLE_SPEECH;
	//	instance_create_depth(0,0,0,draw);
	//	draw.object = messageobject; draw.text = text; draw.bubblename = name;  draw.yfix = yfix;
	//}
	//else{
	//	var draw = _SYS_BUBBLE_SPEECH;
	//	draw.object = messageobject; draw.text = text; draw.bubblename = name;  draw.yfix = yfix;
	//}
	
	
	//if isTrigger{
	//	if keyboard_check_pressed(vk_space){
	//		cutscene_end_action();
	//		instance_destroy(draw);
	//	}
	//}
	//if !isTrigger and reset == true {cutscene_goto(resid); instance_destroy(draw)}
	//if !isTrigger and reset == false{ instance_destroy(draw)}
}

function bubble_speech_on_trigger_ext(object, text, name, yfix = 0, color = c_white, graphic = BubbleSpeech, pointergraphic = PointerSpeech, collider1, collider2 = collider1, collider3 = collider1, collider4 = collider1){
	
	isTrigger = (
		place_meeting(object.x,object.y,collider1) or 
		place_meeting(object.x,object.y,collider2) or	
		place_meeting(object.x,object.y,collider3) or 
		place_meeting(object.x,object.y,collider4)
	)
	
	if !instance_exists(_SYS_BUBBLE_SPEECH){
		var draw = _SYS_BUBBLE_SPEECH;
		instance_create_depth(0,0,0,draw);
		draw.object = object; draw.text = text; draw.bubblename = name;  draw.colortext = color; draw.graphic = graphic; draw.graphicpointer = pointergraphic; draw.yfix = yfix;
	}
	else{
		var draw = _SYS_BUBBLE_SPEECH;
		draw.object = object; draw.text = text; draw.bubblename = name; draw.colortext = color; draw.graphic = graphic; draw.graphicpointer = pointergraphic; draw.yfix = yfix;
	}
	
	if isTrigger{
		if keyboard_check_pressed(vk_space){
			cutscene_end_action();
			instance_destroy(draw);
		}
	}
}
	
function popup(object, text, name, waitforinput = true, yfix = 0, color = c_black, namecolor = #2a1c05, graphic = NullSprite, pointergraphic = NullSprite){
	//show_debug_message(object);
	// Usar o WITH para ver cada instancia
	if !instance_exists(_SYS_POPUP){		
		draw = inst_popup();
		draw.instanciator = object;
		draw.object = object; draw.text = text; draw.bubblename = name;  draw.colortext = color; draw.graphic = graphic; draw.graphicpointer = pointergraphic; draw.yfix = yfix;
		draw.colorname = namecolor;
	}
	else{
		var check_object = object;
		var _exists = false;
		with(_SYS_POPUP){
			if instanciator == check_object { 
				draw = self.id;
				draw.object = object; draw.text = text; draw.bubblename = name;  draw.colortext = color; 
				draw.graphic = graphic; draw.graphicpointer = pointergraphic; draw.yfix = yfix; draw.colorname = namecolor;
				_exists = true; break}
		}
		if _exists == false {
			draw = inst_popup();
			draw.instanciator = check_object;
			draw.object = object; draw.text = text; draw.bubblename = name;  draw.colortext = color; draw.graphic = graphic; draw.graphicpointer = pointergraphic; draw.yfix = yfix;
			draw.colorname = namecolor;
			_exists = true;
		}
	}
		
	if waitforinput{
		if keyboard_check_pressed(vk_space){
			cutscene_end_action();
			instance_destroy(draw);
		}
	}
}

function cutscene_low_priority(){
	if global.cutscene.priority == false
	{
		
		cutscene_end_action();	
	}	
}
	
function popup_on_trigger(object, messageobject, text, name, namecolor = c_white, yfix = 0, reset = true, resid = 0, collider1, collider2 = collider1, collider3 = collider1, collider4 = collider1, cutscene = true){
	//show_debug_message(object);
	
	if !global.onmenu
	{
		
				
		
		if  collider1 == "player" collider1 = global.player;
	
		isTrigger = (
			
				place_meeting(object.x,object.y,collider1) or 
				place_meeting(object.x,object.y,collider2) or	
				place_meeting(object.x,object.y,collider3) or 
				place_meeting(object.x,object.y,collider4)
			
		)
		sdm(id, global.intern.event);
		if isTrigger
		{
			sdm("ist");
			if !instance_exists(global.intern.event) global.intern.event = noone;
			if global.intern.event == noone	global.intern.event = id			
		}
		else
		{
			sdm("nst");
			if global.intern.event == id global.intern.event = noone;
		}
	
		inst = _SYS_POPUP;
	
	
		if !instance_exists(inst){
			//show_debug_message("Criou");
			draw = instance_create_depth(0,0,0,inst);
			draw.instanciator = object;
			draw.object = messageobject; draw.text = text; draw.bubblename = name;  draw.yfix = yfix;
			draw.colorname = namecolor;
		}
		else if instance_exists(inst){
			var check_object = object;
			var _exists = false;
			with(inst){
				if instanciator == check_object { 
					draw = self.id;
					draw.object = messageobject; draw.text = text; draw.bubblename = name;  draw.yfix = yfix;
					draw.colorname = namecolor;
					_exists = true; break}
			}
			if _exists == false {
				draw = instance_create_depth(0,0,0,inst);
				draw.instanciator = check_object;
				draw.object = messageobject; draw.text = text; draw.bubblename = name;  draw.yfix = yfix;
				draw.colorname = namecolor;
				_exists = true;
			}
		}
	
		if isTrigger and global.intern.event == id{
			global.on_popup = true
			if keyboard_check_pressed(vk_space)
			{
				
				if cutscene {
					cutscene_end_action();
					global.on_popup = false;
				}
				instance_destroy(draw);
			}
		}
		if !isTrigger and reset == true {global.on_popup = false;cutscene_goto(resid); instance_destroy(draw);}
		if !isTrigger and reset == false{global.on_popup = false;instance_destroy(draw)}
	}
}

function balloon(sprite, event, wait = false,  yfix = 0, cutscene = true, loopable = false){

	if !instance_exists(balloonObject) {
		var bubble = instance_create_depth(event.x, event.y - event.sprite_height +yfix, global.intern.depths.over, balloonObject);
		bubble.sprite_index = sprite;
		bubble.loop = loopable;
		_baloon = bubble;
	}
	else 
	{
		var bubble = instance_find(balloonObject, 0);
		bubble.x = event.x;
		bubble.y = event.y - event.sprite_height + yfix;
		bubble.loop = loopable;
		_baloon = bubble;
	}
	
	if cutscene
	{
		if wait 
		{
			
			if bubble.ended == true {
				cutscene_end_action();
				instance_destroy(bubble);
			}
		}
		else 
		{
			cutscene_end_action();
		}
	}
}
	

#endregion

#region Text and Draw

function text_on_view(_x,_y,_text,_textspeed = 0,_color = c_white,_font = Ruler,_align = fa_center){
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
}

#endregion

#region PLAYER
function heal_player(playerid = 0, amount = 999999){
	item_heal(amount);
	cutscene_end_action();
}

#endregion