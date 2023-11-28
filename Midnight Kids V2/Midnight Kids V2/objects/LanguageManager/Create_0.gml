lang = "EN";


if lang == "PT"{
	instance_create_layer(0,0,"Setup",Language_PT);
	instance_destroy();
}
else if lang == "EN"{
	instance_create_layer(0,0,"Setup",Language_EN);
	instance_destroy();
}