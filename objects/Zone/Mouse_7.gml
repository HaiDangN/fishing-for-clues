show_debug_message("Clicked on zone " + string_format(zoneId, 0, 0) + " which contains the fish " + fishIdToString(global.fish_list[zoneId-1]));

// Fish Button
if (global.state == STATES.FISH_PICK_ZONE) {
	// Get the fish in the selected zone
    var fishFound = global.fish_list[zoneId - 1];
	
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
	
	// IF NOT TUTORIAL1 AND NOT TUTORIAL2
	// THEN SUBTRACT THESE HOURS YO
	//global.hours -= 2;
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
	show_debug_message("There are " + string_format(count, 0, 0) + " " + fishIdToString(fishToScan));
	global.state = STATES.FREE;
	//global.hours -= 2;
}

// Send Data button
if (global.state == STATES.DATA_PICK_ZONE) {
	// Get the fish in the selected zone
	var actualFish = global.fish_list[zoneId - 1];
	
	global.state = STATES.DATA_PICK_FISH;
	
	// fish selected during STATES.SCAN_PICK_FISH
    var guessedFish = global.fishSelected;
    
	// Check if the player guessed the fish in the zone correctly.
    if (actualFish == guessedFish) {
        show_debug_message("You are correct!");
		show_fish = true;
		//global.hours += 1; 
    } else {
        show_debug_message("Incorrect.");
		//global.hours -= 1; 
    }
	global.fishSelected = -1;
    global.state = STATES.FREE; // Reset game state
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
		global.lose = true;
    }
            
    global.state = STATES.FREE;
	//global.hours -= 4;
}

// Win condition
if (global.win == true) {
	
	layer_set_visible("Victory", true);
	
	if (global.IsTutorial1 == true) {
		show_message("Click on the next level button to go to the next level.");	
	}
	// with " + string(global.hours) + " hours remaining!");
}

// Game over conditions.
// Implement 1x use Anglerfish later
/*
if (global.hours <= 0) {
	show_message("Game Over, you lost");
	game_restart();
}
*/