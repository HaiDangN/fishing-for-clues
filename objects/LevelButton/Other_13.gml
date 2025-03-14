// Tutorial 2

if (mouse_check_button_pressed(mb_left)) {
    if (position_meeting(mouse_x, mouse_y, id)) {
		
		if (global.Tstep == 0) {
			layer_set_visible("Tutorial1", false);
			LakeCreator.visible = true;
			layer_set_visible("LakeSurveyEntries", true);
			LakeSurveyEntry.visible = true;
			instance_activate_object(ScanButton);
			ScanButton.visible = true;
			// Moves to next step in the tutorial.
			global.lakeSurvey = true;
			visible = false;
			instance_create_layer(0, 0, "FishDefinitionLayer", NewFishDisplay)
			
			global.Tstep += 1;
		}
	}
}
