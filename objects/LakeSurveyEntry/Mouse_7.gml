
if (global.state == STATES.FISH_PICK_ZONE) {
	show_debug_message(fishIdToString(fishId));
	
	// take action here
	
} else if (global.state == STATES.SCAN_PICK_FISH) {
	show_debug_message(fishIdToString(fishId));
	
	// take action here 
	
	//transition to picking zone
	if (fishId != FishId.Empty and fishId != FishId.Anglerfish) {
		global.state = STATES.SCAN_PICK_ZONE;
		global.fishSelected = fishId;
	} else {
		GenericTextbox.label = "Please pick something that is not empty or Anglerfish";
	}
}

if (global.state == STATES.DATA_PICK_FISH) {
	show_debug_message(fishIdToString(fishId));
	
	if (fishId != FishId.Empty and fishId != FishId.Anglerfish) {
		global.state = STATES.DATA_PICK_ZONE;
		global.fishSelected = fishId;
	} else {
		GenericTextbox.label = "Please pick something that is not empty or Anglerfish";
	}
}

if (isStateMarking()) {
	global.state = STATES.MARK_PICK_ZONE;
	global.fishSelected = fishId;
}