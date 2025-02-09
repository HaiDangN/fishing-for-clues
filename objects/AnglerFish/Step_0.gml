if (global.selecting_fish && mouse_check_button_pressed(mb_left)) {
    if (position_meeting(mouse_x, mouse_y, id)) {
        global.selecting_fish = false; // Exit selection mode
        show_message("You selected an Angler!"); // Replace with actual action
    }
}