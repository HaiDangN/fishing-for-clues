// Initialize variables
layer_set_visible("LakeSurveyEntries", false);
LakeCreator.visible = false;
show_fish = false;
global.tutorial = true;
instance_deactivate_object(FindAnglerButton);
instance_deactivate_object(GoFishButton);
instance_deactivate_object(ScanButton);
instance_deactivate_object(SendDataButton);

global.IsTutorial1 = true;