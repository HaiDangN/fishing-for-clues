// An array that tracks the background layers
var tutorialLayers = [
    "background",
    "Tutorial1",
	"Tutorial2",
    "Tutorial3",
    "Tutorial4",
    "Tutorial5",
    "Tutorial6",
    "Tutorial7",
    "Tutorial8",
    "Tutorial9"
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
			if (global.Tstep != 0 and global.Tstep != 6) {
				layer_set_visible("LakeSurveyEntries", false);
			} else {
				layer_set_visible("LakeSurveyEntries", true);
			}
        }
    }
}
