if (visible) {
	if (global.state == STATES.ANGLERFISH_PICK_ZONE) {
		global.fishSelected = -1;
		global.state = STATES.FREE;
	} else {
		global.fishSelected = -1;
		global.state = STATES.ANGLERFISH_PICK_ZONE;
	} 
}

