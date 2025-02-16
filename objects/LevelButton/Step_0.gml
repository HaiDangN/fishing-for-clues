
// Tutorial2 part 2 Red Herring Logic
// LEVEL 1 SPECIFIC for tutorial
// Have player select a zone
// IF zone 1 --> Display Next Page
// IF any other zone --> Display keep fishing page
if (global.Tstep == 3 and global.level = 1 and array_length(global.actionList) > 0) {
	BackButton.visible = false;
	BackButton.isActive = false;
	if (global.zone_list[0].show_fish == true) {
		// Increment step so they are not stuck.
		global.Tstep += 1;
		layer_set_visible("Tutorial2", false);
				
		// Tutorial4 Introduce Flash Cards
		// Already found Red Herring
		layer_set_visible("Tutorial3Next", true);
		layer_set_visible("LakeSurveyEntries", true);
		LakeSurveyEntry.visible = true;
		global.lakeSurvey = true;
		LevelButton.visible = true;
	} else {
		layer_set_visible("Tutorial2", false);
			
		// Tutorial4 Introduce Flash Cards
		layer_set_visible("Tutorial3", true);
		layer_set_visible("LakeSurveyEntries", true);
		LakeSurveyEntry.visible = true;
		global.lakeSurvey = true;
	}
}