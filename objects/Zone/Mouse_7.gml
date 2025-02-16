show_debug_message("Clicked on zone " + string_format(zoneId, 0, 0) + " which contains the fish " + fishIdToString(global.fish_list[zoneId-1]));

// Fish Button
if (global.state == STATES.FISH_PICK_ZONE) {

	// Get the fish in the selected zone
    var fishFound = global.fish_list[zoneId - 1];
	
	// Check if player selected the same fish
	if (!global.zone_list[zoneId -1].show_fish) {
		// If the found fish is an Anglerfish or if the zone is empty
		// the player finds nothing.
		if (fishFound == FishId.Anglerfish or fishFound == FishId.Empty) {
			show_message("You found nothing! This could mean the Anglerfish is here, or it could be truly empty!");
			fishFound = FishId.Empty;
		} else {
			show_message("You found " + fishIdToString(fishFound) + " in this zone!");
			show_fish = true;	
		}
	    global.state = STATES.FREE;
		var action = new Action("Fish", fishFound, string(zoneId), fishFound);
		array_push(global.actionList, action);
		logAction(action, array_length(global.actionList));
		show_debug_message(global.actionList);
		// Tutorial2 part 2
		// LEVEL 1 SPECIFIC for tutorial
		// Have player select a zone
		// IF zone 1 --> Display Next Page
		// IF any other zone --> Display keep fishing page
		if (global.Tstep == 3 and global.level = 1) {
			BackButton.visible = false;
			BackButton.isActive = false;
			if (global.zone_list[0].show_fish == true) {
				// Increment step so they are not stuck.
				global.Tstep += 1;
				layer_set_visible("Tutorial2", false);
			
				// Tutorial4 Introduce Flash Cards
				layer_set_visible("Tutorial3Next", true);
				layer_set_visible("LakeSurveyEntries", true);
				LakeSurveyEntry.visible = true;
				instance_activate_object(LevelButton);
			} else {
				layer_set_visible("Tutorial2", false);
			
				// Tutorial4 Introduce Flash Cards
				layer_set_visible("Tutorial3", true);
				layer_set_visible("LakeSurveyEntries", true);
				LakeSurveyEntry.visible = true;
			}
		}
	
		// if not tutorial1 or tutorial2, include hour system
		if (global.level >= 3) {
			global.hours -= 2;	
		}
	} else {
		show_message("That zone is already revealed!");	
	}
}

// Scan Button
if (global.state == STATES.SCAN_PICK_ZONE) {
	// fish selected during STATES.SCAN_PICK_FISH
	var fishToScan = global.fishSelected;
	var count = 0;
	for (var i = 0; i < array_length(global.zone_list); i++) {
		if (global.zone_highlight[i] and global.fish_list[i] == fishToScan) {
			count += 1;
		}
		// Reset the highlight for all zones after the scan is complete
		global.zone_highlight[i] = false;
	}
	
	// Result of the scan.
	global.fishSelected = -1;
	var end_zoneId = (zoneId + array_length(global.zone_list)/2 - 1) % (array_length(global.zone_list) + 1)
	if (end_zoneId < zoneId) {end_zoneId +=1;}
	GenericTextbox.label = "There are " + string_format(count, 0, 0) + " " + fishIdToString(fishToScan) + " in zones " + string(zoneId) + "-" + string(end_zoneId);
	
	global.state = STATES.FREE;
	var action = new Action("Scan", count, string(zoneId) + "-" + string(end_zoneId), fishToScan);
	array_push(global.actionList, action);
	logAction(action, array_length(global.actionList));
	show_debug_message(global.actionList);
	// if not tutorial1 or tutorial2, include hour system
	if (global.level >= 3) {
		global.hours -= 2;	
	}
}

// Send Data button
if (global.state == STATES.DATA_PICK_ZONE) {
	if (!global.zone_list[zoneId -1].show_fish) {
		// Get the fish in the selected zone
		var actualFish = global.fish_list[zoneId - 1];
	
		global.state = STATES.DATA_PICK_FISH;
	
		// fish selected during STATES.SCAN_PICK_FISH
	    var guessedFish = global.fishSelected;
    
		// Check if the player guessed the fish in the zone correctly.
	    if (actualFish == guessedFish) {
	        show_debug_message("You are correct!");
			show_fish = true;
			
			// if not tutorial1 or tutorial2, include hour system
			if (global.level >= 3) {
				global.hours += 1;	
			}
	    } else {
	        show_debug_message("Incorrect.");
		
			// if not tutorial1 or tutorial2, include hour system
			if (global.level >= 3) {
				global.hours -= 1;	
			}
	    }
		var action = new Action("Data", show_fish, string(zoneId), guessedFish);
		array_push(global.actionList, action);
		logAction(action, array_length(global.actionList));
		global.fishSelected = -1;
	    global.state = STATES.FREE; // Reset game state
	} else {
		show_message("That zone is already revealed!");
	}
}

// Anglerfish button
if (global.state == STATES.ANGLERFISH_PICK_ZONE) {
	if (!global.zone_list[zoneId -1].show_fish) {
		// Check if user guessed Anglerfish correctly.
	    if (global.fish_list[zoneId - 1] == FishId.Anglerfish) {
	        show_debug_message("Found Angler");
			show_fish = true;
			global.win = true;
			global.lakeSurvey = false;
			LevelButton.visible = true;
		
	    } else {
			
	        show_debug_message(zoneId);
			layer_set_visible("Gameover", true);
			instance_deactivate_layer("LakeSurveyEntries");
			instance_deactivate_object(FindAnglerButton);
			instance_deactivate_object(GoFishButton);
			instance_deactivate_object(ScanButton);
			instance_deactivate_object(SendDataButton);
			instance_deactivate_object(BackButton);
			instance_deactivate_object(HelpTab);
			instance_deactivate_object(SurveyTab);
		
			global.lose = true;
	    }
		var action = new Action("Anglerfish", global.win, string(zoneId), FishId.Anglerfish);
		array_push(global.actionList, action);
		logAction(action, array_length(global.actionList));
	    global.state = STATES.FREE;
	} else {
		show_message("That zone is already revealed!");
	}
}

// Win condition
if (global.win == true) {
	
	layer_set_visible("Victory", true);
	
	instance_deactivate_layer("LakeSurveyEntries");
	instance_deactivate_object(FindAnglerButton);
	instance_deactivate_object(GoFishButton);
	instance_deactivate_object(ScanButton);
	instance_deactivate_object(SendDataButton);
	instance_deactivate_object(SendDataButton);
	instance_deactivate_object(HelpTab);
	instance_deactivate_object(SurveyTab);
	
	
	// with " + string(global.hours) + " hours remaining!");
}

// Game over conditions.

if (global.level >= 3) {
	if (global.hours <= 0) {
		global.lose = true;
		instance_activate_object(RestartButton);
		layer_set_visible("Gameover", true);
		instance_deactivate_layer("LakeSurveyEntries");
		instance_deactivate_object(FindAnglerButton);
		instance_deactivate_object(GoFishButton);
		instance_deactivate_object(ScanButton);
		instance_deactivate_object(SendDataButton);
		instance_deactivate_object(HelpTab);
		instance_deactivate_object(SurveyTab);
	}
}

