/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
scene_info[0] = [
	[cutscene_wait_for_input_on_collission, "k", vk_space, self.id,global.player],
	[bubble_speech_on_trigger, self.id,objectSuper,"...","Sigmund",c_red,0,true,0,global.player],
	[bubble_speech_on_trigger, self.id,objectSuper,"Ah, olá","Sigmund",c_red,0,true,0,global.player],
	[bubble_speech_on_trigger, self.id,objectSuper,"Não tinha lhe visto ai","Sigmund",c_red,0,true,0,global.player],
	[bubble_speech_on_trigger, self.id,objectSuper,"Você está pronto para começar a jornada?\nPode ser perigoso lá fora","Sigmund",c_red,0,true,0,global.player],
	[bubble_speech_on_trigger, self.id,objectSuper,"De qualquer modo, preciso conversar com você antes\nEsse mundo não é mais como era","Sigmund",c_red,0,true,0,global.player],
	[bubble_speech_on_trigger, self.id,objectSuper,"Na verdade, ele está voltando a ser o que era, \nmas nós não conheciamos isso.","Sigmund",c_red,0,true,0,global.player],
	[bubble_speech_on_trigger, self.id,global.player,"n sei pora kkkkkkkkk","Hero",c_olive,0,true,0,global.player],
	//[bubble_speech_on_trigger, self.id,objectSuper,"Beautiful night, huh?","Tim",0,true,0,global.player],
	//[bubble_speech_on_trigger, self.id,global.player,"Yup!","Tim",0,true,0,global.player],
	[cutscene_goto,0]
]