// Tutorial 1
if (mouse_check_button_pressed(mb_left)) {
    if (position_meeting(mouse_x, mouse_y, id)) {
		
		// Help 1
		if (global.Hstep == 1) {
			layer_set_visible("Help2", true);
			
			BackButton.isActive = true
			BackButton.visible = true
		}
		
		// Help 2
		if (global.Hstep == 2) {
			layer_set_visible("Help2", false);
			layer_set_visible("Help3", true);
			
		}
		
		// Help 3
		if (global.Hstep == 3) {
			layer_set_visible("Help3", false);
			layer_set_visible("Help4", true);
			
			LevelButton.visible = false;
			LevelButton.isActive = false;
			
		}
		
		global.Hstep += 1;
	}
}
