// Initialize variables
layer_set_visible("LakeSurveyEntries", false);
LakeCreator.visible = false;
show_fish = false;

instance_deactivate_layer("LakeSurveyEntries");
instance_deactivate_object(FindAnglerButton);
instance_deactivate_object(GoFishButton);
instance_deactivate_object(ScanButton);
instance_deactivate_object(SendDataButton);

// next Button object is invisible
// this is for levels 4+
visible = false;