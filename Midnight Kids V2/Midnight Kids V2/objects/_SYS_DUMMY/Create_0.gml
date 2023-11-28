// Thanks o FriendlyCosmonaut for the cutscene system <3
//scene_info = -1; // Scene indexer
	scene = [0,0,0,0,0,0,0];
	scene_indexer = 0;
	timer = 0;
	parEvent = TouchDummy;
	life = 4;
	damaged = false;
    
//ev_son = event_touchDummy;
scene_info[0] = [
	[cutscene_pathfind_move, self, 1100, 220, 1],
	[cutscene_move,"up",1,100,false,self],
	[cutscene_move,"left",1,100,false,self],
	[cutscene_move,"down",1,100,false,self],
	[cutscene_move,"right",1,100,false,self],
	[cutscene_goto,0],
];

scene_info[1] = [
	[cutscene_do_nothing],
	[cutscene_reset]
]
