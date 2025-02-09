if (global.state == STATES.FREE) {
	global.zone_highlight[zoneId-1] = true;
} else if (global.state == STATES.SCAN_PICK_ZONE) {
	for (var i = zoneId-1; i < zoneId + array_length(global.zone_list)/2 -1 ; i++) {
		global.zone_highlight[i % array_length(global.zone_list)] = true;
	}
}