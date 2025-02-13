shader_set(ShOutline);
shader_set_uniform_f(upixelW, texelW);
shader_set_uniform_f(upixelH, texelH);
draw_self();

//draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,true); // displays collision

shader_reset();
if (variable_global_exists("fish_shown_start") and global.fish_shown_start[zoneId -1]) {
	show_fish = true;
}
if (global.zone_highlight[zoneId - 1]) {
	image_blend = c_green;
} else {
	image_blend = c_white;
}

// draws number
var text_x = x + lengthdir_x(radius * 2.75, 90 + image_angle + ((0.5 * 360) / slice_count) - 360/slice_count);
var text_y = y + lengthdir_y(radius * 2.75, 90 + image_angle + ((0.5 * 360) / slice_count) - 360/slice_count);
draw_set_halign(fa_center);
draw_set_valign(fa_middle)
draw_text_transformed_color(text_x, text_y, zoneId, 3, 3, 0, c_black, c_black, c_black, c_black, 1);

if (show_fish && fishId != FishId.Empty) {
	var fish_x = x + lengthdir_x(radius * 1.25, 90 + image_angle + ((0.5 * 360) / slice_count) - 360/slice_count);
	var fish_y = y + lengthdir_y(radius * 1.25, 90 + image_angle + ((0.5 * 360) / slice_count) - 360/slice_count);
	draw_sprite_ext(fishIdToIcon(fishId), 0, fish_x, fish_y, 3, 3, 0, c_white, 1);	
}