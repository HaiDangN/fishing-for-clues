if (global.state == STATES.FREE) {
	global.state = STATES.SCAN_PICK_FISH;
} else if (global.state == STATES.SCAN_PICK_ZONE or global.state == STATES.SCAN_PICK_FISH) {
	global.state = STATES.FREE;
	global.fishSelected = -1; // Clearing fish selected
}