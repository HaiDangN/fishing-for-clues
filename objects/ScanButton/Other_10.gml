show_message("Scan Button");


if (global.state == STATES.FREE) {
	global.state = STATES.SCAN_PICK_ZONE;
} else if (global.state == STATES.SCAN_PICK_ZONE) {
	global.state = STATES.FREE;	
}