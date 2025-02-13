if (mouse_check_button_pressed(mb_left)) {
    if (position_meeting(mouse_x, mouse_y, id)) {
		event_user(0);		

		// If player loses click again to reset
		if (global.lose) {
			event_user(1);
		}
		
		// If player wins click to go to next level
		if (global.win) {
			event_user(2);	
		}
	}
}

