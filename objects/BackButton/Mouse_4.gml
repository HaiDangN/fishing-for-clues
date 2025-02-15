if (mouse_check_button_pressed(mb_left)) {
    if (position_meeting(mouse_x, mouse_y, id)) {
		
		// Tutorial 1
		if (global.level == 1) {
			if (global.tutDone) {
				event_user(6);
			} else {
				event_user(2);
			}
		}
		
		// Scan Tutorial
		if (global.level == 2) {
			event_user(3);	
		}
		
		// Send Data
		if (global.level == 3) {
			event_user(4);
		}
	}
}
