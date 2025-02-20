// Tutorial 1
if (mouse_check_button_pressed(mb_left)) {
    if (visible && position_meeting(mouse_x, mouse_y, id)) {
		
		// Introduce lake
		if (global.Tstep == 1) {
			layer_set_visible("Tutorial1", true);
			LakeCreator.visible = true;
			BackButton.isActive = true
			BackButton.visible = true
		}
		
		// Tutorial2
		// Turn on Gofish visibility
		// Logic to check when player finds red herring is in zone object.
		if (global.Tstep == 2) {
			layer_set_visible("Tutorial1", false);
			layer_set_visible("Tutorial2", true);
			
			// Fish button is visible
			instance_activate_object(GoFishButton);
			
			// The tutorial next button is invisible
			LevelButton.visible = false;
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
			
			global.tutDone = true;
			visible = false;
			
			// Have lake survey be invisible on Angler page
			instance_deactivate_object(LakeSurveyEntry);
			global.lakeSurvey = false;

			// Show Angler Button
			instance_activate_object(FindAnglerButton);
		}

		// Moves to next step in the tutorial.
		global.Tstep += 1;
	}
}
