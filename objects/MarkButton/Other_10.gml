if (global.state == STATES.MARK_PICK_FISH or global.state == STATES.MARK_PICK_ZONE) {
    global.state = STATES.FREE;
	global.fishSelected = -1;
} else {
	global.fishSelected = -1;
	global.state = STATES.MARK_PICK_FISH;
}