for(i=0;i<array_length(procedural_instances);i++){
	instance_destroy(procedural_instances[i]);
}

var num = int64(irandom_range(0, 999999999999999999999999999999));

if string_length(num) < 30 {
	while string_length(num) < 30 {
		var zeros = -string_length(num) + 30;
		num = "0" + string(num);	
	}
	procedural_gen(16,16,objects, num);
}
else {
	
	procedural_gen(16,16,objects, num);
}