// Check if the surface exists; create if necessary
if (global.Tstep < 5) {
	if (!surface_exists(global.surf)) {
	    global.surf = surface_create(1920, 1080);
	}

	// Set surface as the target
	surface_set_target(global.surf);
	draw_clear_alpha(c_black, 0); // Clear surface

	// Draw the dark overlay
	gpu_set_blendmode(bm_normal);
	draw_set_alpha(0.8)
	draw_rectangle_color(0, 0, 1920, 1080, c_black, c_black, c_black, c_black, false);

	if (global.Tstep < 3) {
		draw_set_alpha(1)
		draw_set_color(c_white)
		var text = ""
		switch (global.Tstep) {
			case 2:
				text = "Hover over a fish to progress"
				break;
			default: 
				text = "Click to Progress"
		}
		draw_text_transformed(960, 900, text, 5, 5, 0);
	}
	// Cut out a fixed hole (for example, a 200x150 rectangle at position (300, 200))
	gpu_set_blendmode(bm_subtract);
	// Lake centered at 1280, 384
	
	if (global.Tstep == 1) {
		draw_rectangle(1030, 134, 1530, 634, false); // Adjust size and position as needed	
		instance_deactivate_object(GoFishButton)
	} else if (global.Tstep == 2) {
		LakePopup.visible = false;
		draw_rectangle(100, 0, 800, 750, false); 
	} else if (global.Tstep == 3) {
		instance_activate_object(GoFishButton)
		SurveyPopup.visible = false;
		draw_rectangle(50, 800, 1150, 1000, false);
	} else if (global.Tstep == 4) {
		AbilityPopup.visible = false;
		draw_rectangle(1280, 150, 1500, 384, false);
	} 
	// Reset blend mode and surface
	gpu_set_blendmode(bm_normal);
	surface_reset_target();

	// Draw the surface to the screen
	draw_surface(global.surf, 0, 0);
	

} else {
	LakePopup.visible = true 
	SurveyPopup.visible = true;
}