if (global.tutDone) {
	layer_set_visible("", false);
	layer_set_visible("Help4", false);
	layer_set_visible("Help3", false);
	layer_set_visible("Help2", false);
	layer_set_visible("Help1", false);
	layer_set_visible("Background1", true)
	// Show Fish Survey
	instance_activate_object(LakeSurveyEntry);
	
	// Back button disabled when viewing Survey
	BackButton.visible = false;
	BackButton.isActive = false;
}