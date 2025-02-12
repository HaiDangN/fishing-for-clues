// An array that tracks the background layers
var tutorialLayers = [
    "Tutorial1",
	"Tutorial2",
    "Tutorial3",
    "Tutorial4",
    "Tutorial5",
    "Tutorial6",
    "Tutorial7",
    "Tutorial8",
    "Tutorial9",
	"background"
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
			
			// Turn on Gofish visibility
			if (global.Tstep == 2) {
				x = 64; // New X position
				y = 832; // New Y position
				image_xscale = 1.3;
				image_yscale = 1.3;
				GoFishButton.visible = true;
			}
			
			// Slice
			if (global.Tstep == 3) {
				x = 1280; // New X position
				image_angle = 90;
				y = 600 - sprite_get_height(global.zone_sprite); // New Y position
				visible = true; // change to false after
				
				// Sprite fits zone so when player selects a zone
				// sprite will go to the next tutorial step.
				image_xscale = sprite_get_width(global.zone_sprite);
				image_yscale = sprite_get_height(global.zone_sprite);
			}
			
			if (global.Tstep == 4) {
				image_angle = 0;
				x = 691;
				y = 641;
				visible = true;
				image_xscale = 1;
				image_yscale = 1;
				global.zone_list[0].show_fish = true;
				global.state = STATES.FREE; // JUST incase they hit the corner that is outside the zone
			}
			
			
			if (global.Tstep == 5 || global.Tstep == 9) {
			    LakeSurveyEntry.visible = true;
				layer_set_visible("LakeSurveyEntries", true);
			} else {
				LakeSurveyEntry.visible = false;
			    layer_set_visible("LakeSurveyEntries", false);
			}
			
			if (global.Tstep == 7) {
				x = 736;
				y = 832;
				FindAnglerButton.visible = true;
			}
			
			if (global.Tstep == 8) {
				x = 691;
				y = 641;
			}
			
			if (global.Tstep == 9) {
				visible = false;
			}
        }
    }
}
