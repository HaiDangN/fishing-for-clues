if (global.state == STATES.FREE) {
	global.state = STATES.ANGLERFISH_PICK_ZONE;
} else if (global.state == STATES.ANGLERFISH_PICK_ZONE) {
	global.state = STATES.FREE;
}

