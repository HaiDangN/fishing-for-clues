if (show_fish && fishId != FishId.Empty) {
	var fish_x = x + lengthdir_x(radius * 1.25, 90 + image_angle + ((0.5 * 360) / slice_count) - 360/slice_count);
	var fish_y = y + lengthdir_y(radius * 1.25, 90 + image_angle + ((0.5 * 360) / slice_count) - 360/slice_count);
	draw_sprite_ext(fishIdToIcon(fishId), 0, fish_x, fish_y, 1, 1, 0, c_white, 1);	
}

if (image_blend != standard_col) {
	draw_sprite_ext(global.zone_sprite, 0, x,y, 2, 2, image_angle, image_blend, 0.7);	
}