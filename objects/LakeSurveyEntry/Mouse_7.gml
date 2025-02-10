
if (global.state == STATES.FISH_PICK_ZONE) {
	show_debug_message(fishIdToString(fishId));
	
	// take action here
	
} else if (global.state == STATES.SCAN_PICK_FISH) {
	show_debug_message(fishIdToString(fishId));
	
	// take action here 
	
	//transition to picking zone
	if (fishId != FishId.Empty and fishId != FishId.Anglerfish) {
		global.state = STATES.SCAN_PICK_ZONE;
	} else {
		show_message("Please pick something that is not empty or Anglerfish");
	}
	
	
	
}