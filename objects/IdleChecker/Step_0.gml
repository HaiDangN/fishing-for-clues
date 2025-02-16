if (keyboard_check_pressed(vk_anykey) || mouse_check_button_pressed(mb_any)) {
    last_action_time = current_time;
}

if (current_time - last_action_time > idle_threshold) {
    logIdle(last_action_time);
	last_action_time = current_time;
	
}