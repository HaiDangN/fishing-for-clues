// Default state of the button
label = "button"

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
if (mouse_check_button_pressed(mb_left)) {
    // Ensure the mouse is over the button before changing the background
    if (position_meeting(mouse_x, mouse_y, id)) {

		// Check if background1 is visible
		if (layer_get_visible("background")) {
		    layer_set_visible("background", false);
		    layer_set_visible("Tutorial1", true);
			
		} else if (layer_get_visible("tutorial1")) {
			layer_set_visible("Tutorial1", false);
		    layer_set_visible("Tutorial3", true);
			
		} else if (layer_get_visible("tutorial3")) {
			layer_set_visible("Tutorial3", false);
		    layer_set_visible("Tutorial4", true);
		} else {
			
			layer_set_visible("background", true);	
		}

    }
}
