show_debug_message("Clicked on zone " + string_format(zoneId, 0, 0) + " which contains the fish " + fishIdToString(global.fish_list[zoneId-1]));

if (global.state == STATES.SCAN_PICK_ZONE) {
	// replace fishToScan with whatever fish is selected during STATES.SCAN_PICK_FISH
	var fishToScan = FishId.RedHerring;
	var count = 0;
	for (var i = 0; i < array_length(global.zone_list); i++) {
		if (global.zone_highlight[i] and global.fish_list[i] == fishToScan) {
			count += 1;
		}
	}
	show_debug_message("There are " + string_format(count, 0, 0) + " " + fishIdToString(fishToScan));
	global.state = STATES.FREE;
}