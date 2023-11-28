function load_base()
{
	//load_file("Base.json", "base");
	for(i=0;i<array_length(global.base);i++)
	{
		var mobile = instance_create_depth(global.base[i][1],global.base[i][2],depth,global.base[i][0]);
		variable_instance_set(mobile, "i", i);
	}
}

function save_base()
{
		
	
}

function instanciate_on_base(xx,yy,object)
{
	var isd = instance_create_depth(xx,yy,global.player.depth,object);
	add_to_base([object,xx,yy]);
	return isd.id;
}

function add_to_base(value){
	array_push(global.base, value);
	save_file("Base.json", global.base);
}

function remove_from_base(value){
	array_delete(global.base,value,1);
	save_file("Base.json", global.base);
}

