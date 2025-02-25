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
			GenericTextbox.label = ("You found nothing! This could mean the Anglerfish is here, or it could be truly empty!");
			fishFound = FishId.Empty;
		} else {
			GenericTextbox.label = ("You found " + fishIdToString(fishFound) + " in this zone!");
			show_fish = true;	
		}
		// Reset Game State
	    global.state = STATES.FREE;
		
		// Logging stuff
		var action = new Action("Fish", fishFound, string(zoneId), fishFound);
		array_push(global.actionList, action);
		logAction(action, array_length(global.actionList));
		show_debug_message(global.actionList);
		
		
	
		// if not tutorial1 or tutorial2, include hour system
		if (global.level >= 3) {
			global.hours -= 2;	
		}
	} else {
		GenericTextbox.label = ("That zone is already revealed!");	
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
	
	// Reset game state.
	global.state = STATES.FREE;
	
	// Logging stuff
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
	        GenericTextbox.label = ("There is a " + fishIdToString(guessedFish) + " in zone " + string(zoneId));
			show_fish = true;
			
			// if not tutorial1 or tutorial2, include hour system
			if (global.level >= 3) {
				global.hours += 1;	
			}
	    } else {
	         GenericTextbox.label = ("There is not a " + fishIdToString(guessedFish) + " in zone " + string(zoneId));
		
			// if not tutorial1 or tutorial2, include hour system
			if (global.level >= 3) {
				global.hours -= 1;	
			}
	    }
		
		// Logging stuff
		var action = new Action("Data", show_fish, string(zoneId), guessedFish);
		array_push(global.actionList, action);
		logAction(action, array_length(global.actionList));
		
		// Reset game state.
		global.fishSelected = -1;
	    global.state = STATES.FREE;
	} else {
		GenericTextbox.label = ("That zone is already revealed!");
	}
}

// Anglerfish button
if (global.state == STATES.ANGLERFISH_PICK_ZONE) {
	if (!global.zone_list[zoneId -1].show_fish) {
		// Check if user guessed Anglerfish correctly.
	    if (global.fish_list[zoneId - 1] == FishId.Anglerfish) {
			GenericTextbox.label = "";
	        show_debug_message("Found Angler");
			show_fish = true;
			global.win = true;
			global.lakeSurvey = false;
			
			// Specifically to re-activate in levels +3
			instance_activate_object(LevelButton);
			LevelButton.visible = true;
	    } else {
			GenericTextbox.label = "";
			// If player selects incorrectly.
	        show_debug_message(zoneId);
			layer_set_visible("Gameover", true);
			
			// Specifically to re-activate in levels +3
			instance_activate_object(LevelButton);
			LevelButton.visible = true;
			
			// Disables game buttons and fish survey.
			event_user(0);
			global.lose = true;
	    }
		
		// Logging stuff
		var action = new Action("Anglerfish", global.win, string(zoneId), FishId.Anglerfish);
		array_push(global.actionList, action);
		logAction(action, array_length(global.actionList));
	    global.state = STATES.FREE;
	} else {
		GenericTextbox.label = ("That zone is already revealed!");
	}
}

// Marking 
if (global.state == STATES.MARK_PICK_ZONE) {
	var initial = fishIdToInitial(global.fishSelected);
	if (array_contains(marked_fish, initial)) {
		var fish_index = array_get_index(marked_fish, initial);
		array_delete(marked_fish, fish_index, 1);
	} else {
		array_push(marked_fish, initial);
	}
	
	var action = new Action("Mark", marked_fish, string(zoneId), global.fishSelected);
	logMark(action, array_length(global.actionList));
}

// Win condition
if (global.win == true) {
	layer_set_visible("Victory", true);
	
	// Disables game buttons and fish survey.
	event_user(0);
	
	// with " + string(global.hours) + " hours remaining!");
}

// If player loses by hour mechanic.
if (global.level >= 3) {
	if (global.hours <= 0) {
		global.lose = true;
		layer_set_visible("Gameover", true);
		GenericTextbox.label = "You ran out of hours!";
		
		// Specifically to re-activate in levels +3
		instance_activate_object(LevelButton);
		LevelButton.visible = true;
		
		// Disables game buttons and fish survey.
		event_user(0);
	}
}