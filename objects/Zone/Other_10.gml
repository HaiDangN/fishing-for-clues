// Condition, turn everything except Retry button off

// Turn off lake survey
instance_deactivate_layer("LakeSurveyEntries");

if (global.level == 1) {
	instance_deactivate_object(FishDefinitionTemplate);	
}
// Turn off ability buttons
instance_deactivate_object(FindAnglerButton);
instance_deactivate_object(GoFishButton);
instance_deactivate_object(ScanButton);
instance_deactivate_object(SendDataButton);
instance_deactivate_object(MarkButton);

// Turn off back button
instance_deactivate_object(BackButton);

// Turn off tabs
instance_deactivate_object(HelpTab);
instance_deactivate_object(SurveyTab);


// Spawn stars based off hours left 



if (global.win) {
	var stars = 3
	if (global.hours < 4) {
		stars = 1;
	} else if (global.hours < 8) {
		stars = 2;
	}

	var distance_between_stars = 250
	for (var i = 0; i < 3; i++) {
		var star = instance_create_layer(room_width/2 * i, 0, "FishDefinitionLayer", Star, 
		{
			target_x : 200 + distance_between_stars * i,
			target_y : 900,
			isDark: stars < i + 1,
			angle_offset : 60 * i
		});
    
	}
	
	
}