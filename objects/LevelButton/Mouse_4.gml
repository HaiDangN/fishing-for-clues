if (mouse_check_button_pressed(mb_left)) {
    if (position_meeting(mouse_x, mouse_y, id)) {

		// When player clicks retry --> restarts the room
		if (global.lose) {
			event_user(0);
		}
		
		// When player clicks next --> goes to next level
		if (global.win) {
			event_user(1);
		}
		
		// Tutorial 1
		if (global.level == 1) {
			event_user(2);
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
