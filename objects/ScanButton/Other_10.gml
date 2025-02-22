if (global.state == STATES.SCAN_PICK_ZONE or global.state == STATES.SCAN_PICK_FISH) {
	global.state = STATES.FREE;
	global.fishSelected = -1; // Clearing fish selected
} else {
	global.fishSelected = -1;
	global.state = STATES.SCAN_PICK_FISH;
	if (global.Tstep == 1 and room == Level2) {
		global.Tstep += 1;
		instance_activate_object(FindAnglerButton);
		instance_activate_object(GoFishButton);
		FindAnglerButton.visible = true;
		GoFishButton.visible = true;
	}
}