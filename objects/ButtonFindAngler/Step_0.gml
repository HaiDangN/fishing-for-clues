// Default state of the button
label = "Find Angler"

// State of button if user is hovering over the button
if position_meeting(mouse_x, mouse_y, id) {
	label = "hovering"
}


// If mouse is held down on button
// it will display a different state
if mouse_check_button(mb_left) {
	// collision between mouse x, mouse y, and object then label changes
	if position_meeting(mouse_x, mouse_y, id) {
		label = "holding"
	}
}

// Action:
if mouse_check_button_released(mb_left) {
	if position_meeting(mouse_x, mouse_y, id) {
		event_user(0);
		
	}
}