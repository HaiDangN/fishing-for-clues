if (global.win) {
	if (alarm[0] == -1) {
        alarm[0] = game_get_speed(gamespeed_fps) * 3; // Start the alarm for 30 seconds
	}	
	show_debug_message(alarm[0])
}