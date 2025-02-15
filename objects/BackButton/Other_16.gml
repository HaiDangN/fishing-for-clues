// Tutorial 1
if (isActive && mouse_check_button_pressed(mb_left)) {
    if (position_meeting(mouse_x, mouse_y, id)) {
		
		//Help2
		if (global.Hstep == 2) {
			layer_set_visible("Help2", false);
			layer_set_visible("Help1", true);
			
			// Hide back button when we go back to help1
			visible = false;
			isActive = false;
		}
		
		//Help3
		if (global.Hstep == 3) {
			layer_set_visible("Help3", false);
			layer_set_visible("Help2", true);
			LevelButton.visible = true;
			
		}
		
		//Help4
		if (global.Hstep == 4) {
			layer_set_visible("Help4", false);
			layer_set_visible("Help3", true);
			LevelButton.visible = true;
			
		}
		
		global.Hstep -= 1;

	}
}
