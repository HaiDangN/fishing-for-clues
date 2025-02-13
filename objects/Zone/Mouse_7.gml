show_debug_message("Clicked on zone " + string_format(zoneId, 0, 0) + " which contains the fish " + fishIdToString(global.fish_list[zoneId-1]));

// Fish Button
if (global.state == STATES.FISH_PICK_ZONE) {

	// Get the fish in the selected zone
    var fishFound = global.fish_list[zoneId - 1];
	
	// Check if player selected the same fish
	if (global.zone_list[zoneId-1].show_fish) {
		show_message("you alrady found this fish!");	
	} else {
		// If the found fish is an Anglerfish or if the zone is empty
		// the player finds nothing.
		if (fishFound == FishId.Anglerfish or fishFound == FishId.Empty) {
			show_message("You found nothing! This could mean the Anglerfish is here, or it could be truly empty!");
		} else {
			show_message("You found " + fishIdToString(fishFound) + " in this zone!");
			show_fish = true;	
		}
	    global.state = STATES.FREE;
	
		// Tutorial2 part 2
		// LEVEL 1 SPECIFIC for tutorial
		// Have player select a zone
		// IF zone 1 --> Display Next Page
		// IF any other zone --> Display keep fishing page
		if (global.Tstep == 3 and global.IsTutorial1 == true) {
		
			if (global.zone_list[0].show_fish == true) {
				// Increment step so they are not stuck.
				global.Tstep += 1;
				layer_set_visible("Tutorial2", false);
			
				// Tutorial4 Introduce Flash Cards
				layer_set_visible("Tutorial3Next", true);
				layer_set_visible("LakeSurveyEntries", true);
				LakeSurveyEntry.visible = true;
			} else {
				layer_set_visible("Tutorial2", false);
			
				// Tutorial4 Introduce Flash Cards
				layer_set_visible("Tutorial3", true);
				layer_set_visible("LakeSurveyEntries", true);
				LakeSurveyEntry.visible = true;
			}
		}
	
		// if not tutorial1 or tutorial2, include hour system
		if (global.IsTutorial1 == false and global.IsTutorial2 == false) {
			global.hours -= 2;	
		}
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
	
	// if not tutorial1 or tutorial2, include hour system
	if (global.IsTutorial1 == false and global.IsTutorial2 == false) {
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
			if (global.IsTutorial1 == false and global.IsTutorial2 == false) {
				global.hours += 1;	
			}
	    } else {
	        show_debug_message("Incorrect.");
		
			// if not tutorial1 or tutorial2, include hour system
			if (global.IsTutorial1 == false and global.IsTutorial2 == false) {
				global.hours -= 1;	
			}
	    }
		global.fishSelected = -1;
	    global.state = STATES.FREE; // Reset game state
	} else {
		show_message("That zone is already revealed!");
	}
}

// Anglerfish button
if (global.state == STATES.ANGLERFISH_PICK_ZONE) {
	
	// Check if user guessed Anglerfish correctly.
    if (global.fish_list[zoneId - 1] == FishId.Anglerfish) {
        show_debug_message("Found Angler");
		show_fish = true;
		global.win = true;
		
    } else {
		
        show_debug_message(zoneId);
		layer_set_visible("Gameover", true);
		instance_deactivate_layer("LakeSurveyEntries");
		instance_deactivate_object(FindAnglerButton);
		instance_deactivate_object(GoFishButton);
		instance_deactivate_object(ScanButton);
		instance_deactivate_object(SendDataButton);
		
		
		global.lose = true;
    }
    global.state = STATES.FREE;
}

// Win condition
if (global.win == true) {
	
	layer_set_visible("Victory", true);
	
	if (global.IsTutorial1 == true) {
		show_message("Click on the next level button to go to the next level.");	
	}
	instance_deactivate_layer("LakeSurveyEntries");
	instance_deactivate_object(FindAnglerButton);
	instance_deactivate_object(GoFishButton);
	instance_deactivate_object(ScanButton);
	instance_deactivate_object(SendDataButton);
	instance_deactivate_object(SendDataButton);
	
	
	// with " + string(global.hours) + " hours remaining!");
}

// Game over conditions.

if (global.IsTutorial1 == false and global.IsTutorial2 == false) {
	if (global.hours <= 0) {
		global.lose = true;
		layer_set_visible("Gameover", true);
		instance_deactivate_layer("LakeSurveyEntries");
		instance_deactivate_object(FindAnglerButton);
		instance_deactivate_object(GoFishButton);
		instance_deactivate_object(ScanButton);
		instance_deactivate_object(SendDataButton);
	}
}

