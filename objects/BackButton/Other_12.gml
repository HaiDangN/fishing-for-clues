// Tutorial 1
if (isActive && mouse_check_button_pressed(mb_left)) {
    if (position_meeting(mouse_x, mouse_y, id)) {
		global.Tstep -= 1;
		
		if (global.Tstep == 1) {
			layer_set_visible("Tutorial1", false);
			layer_set_visible("Tutorial", true);
			
			// Hide back button when we go back to tut0
			visible = false;
			isActive = false;
		}
		
		// Tutorial2
		// Turn on Gofish visibility
		// Logic to check when player finds red herring is in zone object.
		if (global.Tstep == 2) {
			layer_set_visible("Tutorial2", false);
			layer_set_visible("Tutorial1", true);
			LevelButton.visible = true;
		}
		
		// Tutorial 3 Introduce Flashcards
		// Inside of object zone, left pressed
		//
		//
		//
		
		// Tutorial 4 Introduce Angler Fish button
		if (global.Tstep == 4) {
			layer_set_visible("Tutorial3Next", false);
			layer_set_visible("Tutorial4", true);
			visible = false;
			
			// Have lake survey be invisible on Angler page
			instance_deactivate_object(LakeSurveyEntry);
			
			// Show Angler Button
			instance_activate_object(FindAnglerButton);
		}

		// Moves to next step in the tutorial.
	}
}
