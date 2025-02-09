// Set the horizontal padding between the sprite and the text
var padding = 10; 

// Draw the sprite on the left
var sprite_w = 0;
if (sprite_index != noone) {
    draw_sprite_ext(sprite_index, 0, x, y + sprite_get_height(SpriteLakeSurveyEntryCollisionMask)/2, 2, 2, 0, c_white, 1);
    // Get the sprite width
    sprite_w = sprite_get_width(sprite_index);
	
} 
if (sprite_w != 0) {
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	draw_text(x + sprite_w + padding, y, label);
}
// Draw the text to the right of the sprite


// Marking up collision for debug purposes
var left = bbox_left;
var top = bbox_top;
var right = bbox_right;
var bottom = bbox_bottom;

// Draw the collision mask as a rectangle
draw_set_color(c_red); // Set the rectangle color (change as needed)
draw_rectangle(left, top, right, bottom, true); // false = outline, true = filled
