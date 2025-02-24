if (show_fish && fishId != FishId.Empty) {
	var fish_x = x + lengthdir_x(radius * 1.25, 90 + image_angle + ((0.5 * 360) / slice_count) - 360/slice_count);
	var fish_y = y + lengthdir_y(radius * 1.25, 90 + image_angle + ((0.5 * 360) / slice_count) - 360/slice_count);
	draw_sprite_ext(fishIdToIcon(fishId), 0, fish_x, fish_y, 1, 1, 0, c_white, 1);	
} else if (array_length(marked_fish) > 0) {
	
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	
	var area_to_write = 0.6 * radius * image_xscale;
	var start_length = 0.4 * radius * image_xscale;
	for (var i = 0; i < array_length(marked_fish); i++) {
		var fish_x = x + lengthdir_x(start_length + i * area_to_write/array_length(marked_fish), 90 + image_angle + ((0.5 * 360) / slice_count) - 360/slice_count);
		var fish_y = y + lengthdir_y(start_length + i * area_to_write/array_length(marked_fish), 90 + image_angle + ((0.5 * 360) / slice_count) - 360/slice_count);
		draw_text_ext_transformed(fish_x, fish_y -5, marked_fish[i], 5, sprite_width*0.8, 1.3, 1.3, 0)
	}
	
}

if (image_blend != standard_col) {
	draw_sprite_ext(global.zone_sprite, 0, x,y, 2, 2, image_angle, image_blend, 0.7);	
}