show_debug_message("Clicked on zone " + string_format(zoneId, 0, 0) + " which contains the fish " + fishIdToString(global.fish_list[zoneId-1]));

if (global.state == STATES.SCAN_PICK_ZONE) {
	var fishToScan = global.fishSelected; // fish seelcted during STATES.SCAN_PICK_FISH
	var count = 0;
	for (var i = 0; i < array_length(global.zone_list); i++) {
		if (global.zone_highlight[i] and global.fish_list[i] == fishToScan) {
			count += 1;
			
		}
		global.zone_highlight[i] = false;
	}
	
	show_debug_message("There are " + string_format(count, 0, 0) + " " + fishIdToString(fishToScan));
	global.state = STATES.FREE;
	global.hours -= 2;
}

// If user clicks on fish button
if (global.state == STATES.FISH_PICK_ZONE) {
    var fishFound = global.fish_list[zoneId - 1]; // Get the fish in the selected zone
	if (fishFound == FishId.Anglerfish or fishFound == FishId.Empty) {
		show_message("You found nothing! This could mean the Anglerfish is here, or it could be truly empty!");	
	} else {
		show_message("You found " + fishIdToString(fishFound) + " in this zone!");
		show_fish = true;
	}
    global.state = STATES.FREE;
	global.hours -= 3; // change to corrosponding value later.
}

// If user clicks on Anglerfish button
if (global.state == STATES.ANGLERFISH_PICK_ZONE) {
    if (global.fish_list[zoneId - 1] == FishId.Anglerfish) {
        show_message("Found Angler");
		show_fish = true;
    } else {
        show_message(zoneId);
    }
            
    global.state = STATES.FREE;
	global.hours -= 4;
}