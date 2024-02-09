if timer <= 1{
		timer += delta;
	}
	else {
		if alarmed == false {
			//sdm("PRINT<-----------------------");
			loading = true;
			alarm_set(1,3);
			
			alarm_set(0,4);
			alarmed = true;
		}
	}