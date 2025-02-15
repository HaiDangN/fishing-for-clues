if (global.tutDone && position_meeting(mouse_x, mouse_y, id)) {
		// Tutorial 1
		if (global.level == 1) {
			event_user(0);
		}
		
		// Scan Tutorial
		if (global.level == 2) {
			event_user(1);	
		}
		
		// Send Data
		if (global.level == 3) {
			event_user(2);
		}
		
		if (global.level == 4) {
			event_user(3);
		}
}
