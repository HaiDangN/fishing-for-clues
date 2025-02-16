if (position_meeting(mouse_x, mouse_y, id)) {
		global.lakeSurvey = true;
		// Tutorial 1
		if (global.level == 1) {
			event_user(0);
		}
		
		// Scan Tutorial
		if (global.level == 2) {
			event_user(0);	
		}
		
		// Send Data
		if (global.level == 3) {
			event_user(0);
		}
		
		if (global.level == 4) {
			event_user(0);
		}
}
