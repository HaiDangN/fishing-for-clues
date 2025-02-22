
if (global.state == STATES.DATA_PICK_ZONE or global.state == STATES.DATA_PICK_FISH) {
	global.state = STATES.FREE;
	global.fishSelected = -1; // Clearing fish selected
} else {
	global.fishSelected = -1;
	global.state = STATES.DATA_PICK_FISH;
}