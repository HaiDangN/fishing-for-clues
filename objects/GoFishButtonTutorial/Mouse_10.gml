// Inherit the parent event
event_inherited();

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