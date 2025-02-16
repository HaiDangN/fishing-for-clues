if (position_meeting(mouse_x, mouse_y, id)) {
	instance_deactivate_object(BackButton);
	global.lakeSurvey = true;
	// Tutorial 1
	if (global.level == 1) {
		event_user(0);
	}
}
