if (global.state == STATES.FISH_PICK_ZONE) {
    global.state = STATES.FREE;
} else {
	
	if (global.level == 1 and global.Tstep == 3) {
		global.Tstep += 1	
	}
	global.fishSelected = -1;
	global.state = STATES.FISH_PICK_ZONE;
}