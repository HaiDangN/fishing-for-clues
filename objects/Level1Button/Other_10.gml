if (mouse_check_button_pressed(mb_left)) {
    if (position_meeting(mouse_x, mouse_y, id)) {
		
		// Tutorial1
		// Introduce lake
		if (global.Tstep == 1) {
			layer_set_visible("Tutorial1", true);
			LakeCreator.visible = true;
		}
		
		// Tutorial2
		// Turn on Gofish visibility
		// Logic to check when player finds red herring is in zone object.
		if (global.Tstep == 2) {
			layer_set_visible("Tutorial1", false);
			layer_set_visible("Tutorial2", true);
			
			// Fish button is visible
			GoFishButton.visible = true;
			
			// The tutorial next button is invisible
			visible =  false;
		}
		
		// Tutorial 3 Introduce Flashcards
		// Inside of object zone, left pressed
		
		// Introduce Angler Fish button
		if (global.Tstep == 4) {
			layer_set_visible("Tutorial3Next", false);
			layer_set_visible("Tutorial4", true);
			
			// Have lake survey be invisible on Angler page.
			layer_set_visible("LakeSurveyEntries", false);
			LakeSurveyEntry.visible = false;
			
			// Show Angler Button
			FindAnglerButton.visible = true;
		}

		// Moves to next step in the tutorial.
		global.Tstep += 1;
	}
}
