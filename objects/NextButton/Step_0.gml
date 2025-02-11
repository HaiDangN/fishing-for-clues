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
			
			if (global.Tstep == 3) {
				x = 1300; // New X position
				y = 250; // New Y position
				visible = false;
				image_xscale = 1;
				image_yscale = 1;
			}
			
			if (global.Tstep == 4) {
				x = 691;
				y = 641;
				visible = true;
			}
			
			
			if (global.Tstep == 5 || global.Tstep == 9) {
			    layer_set_visible("LakeSurveyEntries", true);
			} else {
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
