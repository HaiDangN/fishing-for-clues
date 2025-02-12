// Initialize the global variable if it doesn’t exist
if (!variable_global_exists("Tstep")) {
    global.Tstep = 1; // Tracks what step we are on in the tutorial.
}

if (mouse_check_button_pressed(mb_left)) {
    if (position_meeting(mouse_x, mouse_y, id)) {
	
		// Tutorial2: Show the lake
		if (global.Tstep == 1) {
			layer_set_visible("Tutorial2", true);
			LakeCreator.visible = true;
		}
			
		// Tutorial3
		// Turn on Gofish visibility
		// Sprite is fitted into the entire lake
		if (global.Tstep == 2) {
			layer_set_visible("Tutorial2", false);
			layer_set_visible("Tutorial3", true);
			
			// Fish button is visible
			GoFishButton.visible = true;
			
			// Sprite fits zone so when player selects a zone
			// sprite will go to the next tutorial step.
			event_user(0);
		}
		
		// Have player select a zone
		// IF zone 1 --> Display Next Page Tut4B
		// IF zone 2,3,4 --> Display keep fishing page Tut4
		if (global.Tstep == 3) {
			layer_set_visible("Tutorial3", false);
			layer_set_visible("Tutorial3B", true);	
			
			// if player finds red herring, they still see lake survey with next button
			// if player doesn't find red herring, they see lakee survey but no next button
			if (global.zone_highlight[0]) {
				// Go to tutorial 4B
				global.Tstep += 2;
			} else if (!global.zone_highlight[0]) {
				// Go to tutorial 4
				global.Tstep += 1;
			}
		}

		// Tutorial 4 Introduce Flashcards
		// If player has already found red herring they go to Tutorial 4B instead
		// If player has not found red herring, they just need to select zone1
		if (global.Tstep == 4) {
			layer_set_visible("Tutorial3B", false);
			layer_set_visible("Tutorial3", false);
			layer_set_visible("Tutorial4", true);
			
			// Show fish entries
			layer_set_visible("LakeSurveyEntries", true);
			LakeSurveyEntry.visible = true;
				
			event_user(1);
				
			// JUST incase they hit the corner that is outside the zone
			global.state = STATES.FREE;
		}
			
		// Tutorial 4B
		// Displays "Next" button when player has already found red herring.
		// This will make them read the flash cards.
		if (global.Tstep == 5) {
			layer_set_visible("Tutorial3B", false);
			layer_set_visible("Tutorial3", false);
			layer_set_visible("Tutorial4Next", true);
			
			// Show fish entries
			layer_set_visible("LakeSurveyEntries", true);
			LakeSurveyEntry.visible = true;
			
			// Resets button to default state and position.
			event_user(2);
		}
			
		// Tutorial 5 Introduce Angler Button
		if (global.Tstep == 6) {
			layer_set_visible("Tutorial4Next", false);
			layer_set_visible("Tutorial4", false);
			layer_set_visible("Tutorial5", true);
			
			// Hide during angler button
			layer_set_visible("LakeSurveyEntries", false);
			
			FindAnglerButton.visible = true;
			
			// Fit entire lake
			event_user(0);
		}
		
		// Tutorial 5 Click on zone and check if player wins or loses.
		if (global.Tstep == 7) {
			layer_set_visible("Tutorial5", false);
			layer_set_visible("Tutorial5B", true);
			
			// If player suceeds in finding anglerfish.
			if (global.zone_highlight[2]) {
				// win
				global.Tstep += 1;
			} else if (!global.zone_highlight[2]) {
				// lose
				global.Tstep += 2;	
			}
		}
		
		// Win
		if (global.Tstep == 8) {
			layer_set_visible("Tutorial5B", false);
			layer_set_visible("Background", true);
			
			// JUST incase they hit the corner that is outside the zone
			global.state = STATES.FREE;
			show_fish = true;
			
			show_message("yeah you found it okay");
		}
		
		// Lose
		if (global.Tstep == 9) {
			layer_set_visible("Tutorial5B", false);
			layer_set_visible("Lose", true);
			// JUST incase they hit the corner that is outside the zone
			global.state = STATES.FREE;
			
			show_message("you lost idiot");
		}
		
		// Moves to next step in the tutorial.
		global.Tstep += 1;
	}
}
