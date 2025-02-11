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
    "Tutorial9"
];
var tutorial2InstanceLayer = "Tutorial2Objects";
var tutorial3InstanceLayer = "Tutorial3Objects";
var tutorial5InstanceLayer = "LakeSurveyEntries";
var tutorial7InstanceLayer = "Tutorial7Objects";
// Initialize the global variable if it doesn’t exist
if (!variable_global_exists("Tstep")) {
    global.Tstep = 0; 
}

layer_set_visible(tutorialLayers[0], true);

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
			            // ✅ Show the instance layer only when on "Tutorial2"
            if (global.Tstep == 1) { // 1 because Tutorial2 is at index 1
                layer_set_visible(tutorial2InstanceLayer, true);
            } 
            if (global.Tstep == 2) {
				x = 146; // New X position
				y = 850; // New Y position
				layer_set_visible(tutorial3InstanceLayer, true);
            } else {
				x = 695; // New X position
				y = 601; // New Y position
			}
            if (global.Tstep == 5) {
				layer_set_visible(tutorial5InstanceLayer, true);
            } 
            if (global.Tstep == 7) {
				x = 695; // New X position
				y = 850; // New Y position
				layer_set_visible(tutorial7InstanceLayer, true);
            } else {
				x = 695; // New X position
				y = 601; // New Y position
			}
        }
    }
}
