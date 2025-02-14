if (mouse_wheel_up() && scroll_offset > 0) {
    scroll_offset -= scroll_speed;
} 
if (mouse_wheel_down() && scroll_offset < max_scroll) {
    scroll_offset += scroll_speed;
}
scroll_offset = clamp(scroll_offset, 0, max_scroll);