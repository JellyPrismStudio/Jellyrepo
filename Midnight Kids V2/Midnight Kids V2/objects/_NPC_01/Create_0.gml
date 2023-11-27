// Thanks o FriendlyCosmonaut for the cutscene system <3
//scene_info = -1; // Scene indexer
scene = [0,0,0,0,0,0,0];
scene_indexer = 0;
timer = 0;
parEvent = TouchDummy;
//ev_son = event_touchDummy;
scene_info[0] = [
	[cutscene_goto,0],
];

scene_info[1] = [
	[cutscene_do_nothing],
	[cutscene_reset]
]
