// For Levels past 4.
if (room != Level1 and room != Level2 and room != Level3) {
	instance_deactivate_object(BackButton);
} else {
	// All for tutorial stuff
	layer_set_visible("LakeSurveyEntries", false);
	LakeCreator.visible = false;
	instance_deactivate_layer("LakeSurveyEntries");
	instance_deactivate_object(FindAnglerButton);
	instance_deactivate_object(GoFishButton);
	instance_deactivate_object(ScanButton);
	instance_deactivate_object(SendDataButton);
}
