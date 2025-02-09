image_blend = c_white
if (global.state == STATES.SCAN_PICK_ZONE) {
	for (var i = zoneId; i < zoneId + array_length(global.zone_list)/2 - 1; i++) {
		show_debug_message(i);
		global.zone_list[i % array_length(global.zone_list)].image_blend = c_white;
	}
}
