// Set the horizontal padding between the sprite and the text
var padding = 50; 
var vpadding = 0;
// Draw the sprite on the left
var sprite_w = 0;
if (sprite_index != noone) {
	var new_sprite_height = sprite_get_height(mask_index) - vpadding * 2;
	var new_sprite_width = sprite_get_width(sprite_index) * new_sprite_height/sprite_get_height(sprite_index);
    draw_sprite_stretched(sprite_index, 0, x + padding, y + vpadding, new_sprite_width, new_sprite_height);
    // Get the sprite width
    sprite_w = new_sprite_width;
	
} 
if (sprite_w != 0) {
	draw_set_valign(fa_middle);
	draw_set_color(c_black)
	draw_text_transformed(x + sprite_w + padding * 4, y + sprite_get_height(mask_index)/2, label, 3, 3, 0);
}
// Draw the text to the right of the sprite


//// Marking up collision for debug purposes
//var left = bbox_left;
//var top = bbox_top;
//var right = bbox_right;
//var bottom = bbox_bottom;

//// Draw the collision mask as a rectangle
//draw_set_color(c_red); // Set the rectangle color (change as needed)
//draw_rectangle(left, top, right, bottom, true); // false = outline, true = filled
