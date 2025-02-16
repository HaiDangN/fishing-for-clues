draw_set_color(c_black);
draw_set_font(FontToBeReplaced);
draw_self()

// handles highlights
blink += 0.09
if ((isStatePickingFish() and isFishSelectable(fishId)) or fishId == global.fishSelected) {
	if (isStatePickingFish()) {
		// pulses if fish is selectable
		draw_set_alpha(0.3*sin(blink))
		if (position_meeting(mouse_x, mouse_y, self)) {
			// when hovered over, make it steady 
			draw_set_alpha(0.5);
		}
	}
	// this means that this fish was selected so we can have a solid background 
	else {draw_set_alpha(.5)}
	draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_green, c_green, c_green, c_green, false );
	//draw_rectangle_color(x, y+33, x + sprite_get_width(sprite_index)-50, y + sprite_get_height(sprite_index)+33, c_green, c_green, c_green, c_green, false);
	draw_set_alpha(1);
}
draw_set_valign(fa_middle)
draw_text_transformed(750, y + sprite_get_height(sprite_index)/2 - 10, label, 3, 3, 0);
// Draw the text to the right of the sprite


// Marking up collision for debug purposes
//var left = bbox_left;
//var top = bbox_top;
//var right = bbox_right;
//var bottom = bbox_bottom;

//// Draw the collision mask as a rectangle
//draw_set_color(c_red); // Set the rectangle color (change as needed)
//draw_rectangle(left, top, right, bottom, true); // false = outline, true = filled
