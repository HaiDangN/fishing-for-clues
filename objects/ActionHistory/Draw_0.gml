// Check if surface exists, otherwise create it
if (!surface_exists(surf)) {
    surf = surface_create(view_width, view_height);
}

// Set target to surface
surface_set_target(surf);
draw_clear_alpha(c_white, 0); // Clear with transparency

// Draw list items inside the surface
draw_rectangle_color(0, 0, view_width, view_height, c_white, c_white, c_white, c_white, false);
for (var i = 0; i < array_length(list_items); i++) {
    var draw_y = i * item_height - scroll_offset;
    
    // Only draw items within the visible area
    if (draw_y + item_height > 0 && draw_y < view_height) {
		draw_set_color(c_white)
        draw_rectangle(0, draw_y, view_width, draw_y + item_height, false);
        draw_set_color(c_black)
		draw_text(5, draw_y + 5, list_items[i]);
		
    }
}

// Reset target
surface_reset_target();

// Draw the surface to screen
draw_surface(surf, x, y);