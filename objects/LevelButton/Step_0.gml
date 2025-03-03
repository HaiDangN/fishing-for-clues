
// Tutorial2 part 2 Red Herring Logic
// LEVEL 1 SPECIFIC for tutorial
// Have player select a zone
// IF zone 1 --> Display Next Page
// IF any other zone --> Display keep fishing page
if (global.Tstep < 4 and global.level == 1 and array_length(global.actionList) > 0) {
	BackButton.visible = false;
	BackButton.isActive = false;
	if (global.zone_list[0].show_fish == true) {
		// Increment step so they are not stuck.
		global.Tstep = 4;
		
		layer_set_visible("Tutorial2", false);
				
		// Tutorial4 Introduce Flash Cards
		// Already found Red Herring
		layer_set_visible("Tutorial3Next", true);
		layer_set_visible("LakeSurveyEntries", true);
		LakeSurveyEntry.visible = true;
		global.lakeSurvey = true;
		LevelButton.visible = true;
		layer_set_visible("Tutorial3Next", false);
		layer_set_visible("Tutorial4", true);
			
		global.tutDone = true;
		visible = false;
			
		// Have lake survey be invisible on Angler page
		instance_deactivate_object(LakeSurveyEntry);
		global.lakeSurvey = false;

		// Show Angler Button
		instance_activate_object(FindAnglerButton);
		object_set_visible(FindAnglerButton, true);
		instance_deactivate_object(GoFishButton);
		
		// Spawn the definition for Anglerfish 
		var fish_definition = instance_create_layer(0, 680, "FishDefinitionLayer", FishDefinitionTemplate);
		fish_definition.fishId = FishId.Anglerfish;
		fish_definition.image_xscale = 1.5;
		fish_definition.image_yscale = 1.5;
	} else {
		global.Tstep = 3
		layer_set_visible("Tutorial2", false);
			
		// Tutorial4 Introduce Flash Cards
		layer_set_visible("Tutorial3", true);
		layer_set_visible("LakeSurveyEntries", true);
		LakeSurveyEntry.visible = true;
		LevelButton.visible = false;
		global.lakeSurvey = true;
	}
}