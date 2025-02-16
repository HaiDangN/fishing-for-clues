if (mouse_check_button_pressed(mb_left)) {
    if (position_meeting(mouse_x, mouse_y, id)) {
		// Tutorial 1
		if (global.level == 1) {
			event_user(0);
		}
	}
}
