// An array that tracks the background layers
var tutorialLayers = [
    "Tutorial1",
	"Tutorial2",
    "Tutorial3",
    "Tutorial4",
	"Tutorial4B",
    "Tutorial5",
	"Background"
];

// Initialize the global variable if it doesn’t exist
if (!variable_global_exists("Tstep")) {
    global.Tstep = 0; 
}

if (mouse_check_button_pressed(mb_left)) {
    if (position_meeting(mouse_x, mouse_y, id)) {
		
        var currentLayer = tutorialLayers[global.Tstep];

        // Check if layer exists before trying to modify it
        if (layer_exists(currentLayer)) {
            layer_set_visible(currentLayer, false);
        }

        // Move to the next step if not at the last one
        if (global.Tstep < array_length(tutorialLayers) - 1) {
            global.Tstep += 1;
        }

        var nextLayer = tutorialLayers[global.Tstep];

        // Ensure the new layer exists before making it visible
        if (layer_exists(nextLayer)) {
            layer_set_visible(nextLayer, true);
			
			// Tutorial2
			if (global.Tstep == 1) {
				LakeSurveyEntry.visible = true;
				LakeCreator.visible = true;
			}
			
			// Tutorial3
			// Turn on Gofish visibility
			// Have player select a zone
			// IF zone 1 --> Display Next Page Tut4B
			// IF zone 2,3,4 --> Display keep fishing page Tut4
			
			// How do I check if they chose zone1?
			// if red herring is found
			// check if red herring is shown
			// how?
			// too tired 
			// check what zone player chose specifically
			
			// but how do we get them to click on the
			// "Level1 Button" to trigger this again?
			// hide button inside slice entire circle?
			
			if (global.Tstep == 2) {
				GoFishButton.visible = true;
				
				// Button hidden behind the GoFishButton.
				x = 128;
				y = 910;
				
				// Issue: Else triggers automatically.
				/*
				// if player chose zone1
				if ( conditional for red herring found ) {
					// global.zone_list[0].show_fish = true;
					global.Tstep += 2; // Goes into Tutorial 4B
				} else { 
					// if player chose zones 2,3,4
					global.Tstep+=1; // Goes into Tutorial 4
				}
				*/
			}

			
			// Tutorial 4 Introduce Flashcards
			// If player has already found red herring they go to Tutorial 4B instead
			if (global.Tstep == 3) {
				// Show fish entries
				layer_set_visible("LakeSurveyEntries", true);
				
				// Sprite fits zone so when player selects a zone
				// sprite will go to the next tutorial step.
				image_angle = 90;
				x = 1390;
				y = 480 - sprite_get_height(global.zone_sprite); // New Y position
				
				// Debug
				// Show True, change to false later.
				visible = true;
				
				// Scale to fit inside the slice
				image_xscale = 2.2;
				image_yscale = 2.2;
				
				// Reveal the fish in zone1
				global.zone_list[0].show_fish = true;
				global.state = STATES.FREE; // JUST incase they hit the corner that is outside the zone
			}
			
			// Tutorial 4B
			// Displays "Next" button when player has already found red herring.
			// This will make them read the flash cards.
			if (global.Tstep == 4) {
				// The next button is then shown
				visible = true;
				
				// Reset Tutorial button position
				image_angle = 0;
				visible = true;
				image_xscale = 1.1;
				image_yscale = 1.1;
				x = 755;
				y = 694
			}
			
			// Tutorial 5 Introduce Angler Button
			if (global.Tstep == 5) {
				visible = false;
				layer_set_visible("LakeSurveyEntries", false);
				FindAnglerButton.visible = true;
			}
        }
    }
}
