if (global.state == STATES.FREE or global.state == STATES.FISH_PICK_ZONE or global.state == STATES.ANGLERFISH_PICK_ZONE or global.state == STATES.DATA_PICK_ZONE) {
	global.zone_highlight[zoneId-1] = false;
} else if (global.state == STATES.SCAN_PICK_ZONE) {
	var mouseOverAnotherZone = -infinity;
    
    for (var i = 0; i < array_length(global.zone_list); i++) {
        if (position_meeting(mouse_x, mouse_y, global.zone_list[i])) {
            mouseOverAnotherZone = i;
            break;
        }
    }
	// hard enforce the scan only highlighting the areas it is supposed to
	global.zone_highlight = array_create(array_length(global.zone_list), false);
    if (mouseOverAnotherZone != -infinity) {
		
		for (var i = mouseOverAnotherZone; i < mouseOverAnotherZone + array_length(global.zone_list)/2; i++) {
			global.zone_highlight[i % array_length(global.zone_list)] = true;
		}
	}
	show_debug_message(global.zone_highlight);
}
