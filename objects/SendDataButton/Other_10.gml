show_message("Send Data Button");

if (global.state == STATES.FREE) {
	global.state = STATES.DATA_PICK_FISH;
} else if (global.state == STATES.DATA_PICK_ZONE or global.state == STATES.DATA_PICK_FISH) {
	global.state = STATES.FREE;
	global.fishSelected = -1; // Clearing fish selected
}