if (global.state == STATES.FISH_PICK_ZONE) {
    global.state = STATES.FREE;
} else {
	global.fishSelected = -1;
	global.state = STATES.FISH_PICK_ZONE;
}