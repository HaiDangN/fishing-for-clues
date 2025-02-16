// Condition, turn everything except Retry button off

// Turn off lake survey
instance_deactivate_layer("LakeSurveyEntries");


// Turn off ability buttons
instance_deactivate_object(FindAnglerButton);
instance_deactivate_object(GoFishButton);
instance_deactivate_object(ScanButton);
instance_deactivate_object(SendDataButton);

// Turn off back button
instance_deactivate_object(BackButton);

// Turn off tabs
instance_deactivate_object(HelpTab);
instance_deactivate_object(SurveyTab);