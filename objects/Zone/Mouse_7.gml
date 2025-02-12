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
		show_debug_message("You found " + fishIdToString(fishFound) + " in this zone!");
		show_fish = true;
	}
    global.state = STATES.FREE;
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

    global.state = STATES.FREE; // Reset game state
}

// Anglerfish button
if (global.state == STATES.ANGLERFISH_PICK_ZONE) {
	
	// Check if user guessed Anglerfish correctly.
    if (global.fish_list[zoneId - 1] == FishId.Anglerfish) {
        show_debug_message("Found Angler");
		show_fish = true;
		global.anglerfishFound = true;
    } else {
        show_debug_message(zoneId);
    }
            
    global.state = STATES.FREE;
	//global.hours -= 4;
}

// Win condition
if (global.anglerfishFound == true) {
	show_message("Congrats you found the Angler fish!");
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