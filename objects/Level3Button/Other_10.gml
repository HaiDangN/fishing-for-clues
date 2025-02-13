if (mouse_check_button_pressed(mb_left)) {
    if (position_meeting(mouse_x, mouse_y, id)) {
		
		// Tutorial1
		if (global.Tstep == 0) {
			layer_set_visible("Background", true);
			instance_activate_object(FindAnglerButton);
			instance_activate_object(GoFishButton);
			instance_activate_object(ScanButton);
			instance_activate_object(SendDataButton);
			
			FindAnglerButton.visible = true;
			GoFishButton.visible = true;
			ScanButton.visible = true;
			SendDataButton.visible = true;
			
			LakeSurveyEntry.visible = true;
			LakeCreator.visible = true;
			layer_set_visible("LakeSurveyEntries", true);
			
			global.Tstep +=1;
		}
	}
}
