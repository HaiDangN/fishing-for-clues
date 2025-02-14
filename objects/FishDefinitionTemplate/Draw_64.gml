draw_set_color(c_black);
draw_set_font(FontToBeReplaced);

x = mouse_x
y = mouse_y

show_debug_message(id);

draw_text_transformed(x + sprite_width/2, y - 4*sprite_height/5, fishIdToString(fishId), 2, 2, 0);

var slice_count = array_length(global.fish_list);

// draws a singular zone, rotated at the given angle. will draw fish in middle of zone if given fishToDraw and show_fish is true
function draw_zone(_x, _y, fishToDraw, rot, show_fish, scale) {
	
	draw_sprite_ext(global.zone_sprite, 0, _x+1, _y, scale,scale, rot, c_black, 1);
	draw_sprite_ext(global.zone_sprite, 0, _x-1, _y, scale,scale, rot, c_black, 1);
	draw_sprite_ext(global.zone_sprite, 0, _x, _y+1, scale,scale, rot, c_black, 1);
	draw_sprite_ext(global.zone_sprite, 0, _x, _y-1, scale,scale, rot, c_black, 1);
	draw_sprite_ext(global.zone_sprite, 0, _x, _y, scale,scale, rot, c_white, 1);
	if (show_fish) {
		var slice_count = array_length(global.fish_list);
		var fish_x = _x + lengthdir_x(sprite_get_width(global.zone_sprite) * scale/3, 90 + rot + ((0.5 * 360) / slice_count) - 360/slice_count);
		var fish_y = _y + lengthdir_y(sprite_get_width(global.zone_sprite)* scale/3,  90 + rot + ((0.5 * 360) / slice_count) - 360/slice_count);
		draw_sprite_ext(fishIdToIcon(fishToDraw), 0, fish_x, fish_y, 3* scale, 3 * scale, 0, c_white, 1);	
	}
}

// description and any other graphics
if (fishId == FishId.RedHerring or fishId == FishId.Anglerfish) {
	
	var description = fishId == FishId.RedHerring ? "The Red Herring is never adjacent to the Anglerfish" : "The Anglerfish is never adjacent to the Red Herring";
	draw_set_halign(fa_left);
	draw_set_valign(fa_top)
	draw_text_ext_transformed(x + 1*sprite_width/10, y - 3* sprite_height/5, description, sprite_height/10, 3*sprite_width/10, 1.5, 1.5, 0);
	draw_zone(x + 4*sprite_width/5, y - 2*sprite_height/5, FishId.RedHerring, 90, true, 0.5);
	draw_zone(x + 4*sprite_width/5, y - 2*sprite_height/5, FishId.Empty, 90 -360/slice_count , false, 0.5);
	draw_zone(x + 4*sprite_width/5, y - 2*sprite_height/5, FishId.Anglerfish, 90 - 2*360/slice_count , true, 0.5);
} else if (fishId == FishId.Empty) {
	var description = "A truly empty zone has no fish in it.";
	draw_set_halign(fa_left);
	draw_set_valign(fa_top)
	draw_text_ext_transformed(x + 1*sprite_width/10, y - 3* sprite_height/5, description, sprite_height/10, 4*sprite_width/5, 1.5, 1.5, 0);	
} else if (fishId == FishId.Clownfish) {
	var description = "Clownfish come in pairs. Pairs can also be adjacent to each other";
	draw_set_halign(fa_left);
	draw_set_valign(fa_top)
	draw_text_ext_transformed(x + 1*sprite_width/10, y - 3* sprite_height/5, description, sprite_height/10, 2*sprite_width/5, 1.25, 1.25, 0);
	draw_zone(x + 4*sprite_width/5, y - 2*sprite_height/5, FishId.Clownfish, 90, true, 0.5);
	draw_zone(x + 4*sprite_width/5, y - 2*sprite_height/5, FishId.Clownfish, 90 -360/slice_count, true, 0.5);
} else if (fishId == FishId.Primefish) {
	var description = "Primefish only exist in prime-numbered zones."
	draw_set_halign(fa_left);
	draw_set_valign(fa_top)
	draw_text_ext_transformed(x + 1*sprite_width/10, y - 3* sprite_height/5, description, sprite_height/10, 2*sprite_width/5, 1.25, 1.25, 0);
	var prime_list = [2, 3, 5, 7, 11];
	for (var i = 0; i < slice_count; i++) {	
		show_debug_message(i);
		var is_prime = array_contains(prime_list, i);
		draw_zone(x + 4*sprite_width/5, y - 2*sprite_height/5, FishId.Primefish, 90 - i*360/slice_count - 360/slice_count, is_prime, 0.5);
	}
} else if (fishId == FishId.Goldfish) {
	var description = "Goldfish are adjacent to at least one truly empty zone.";
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_ext_transformed(x + 1*sprite_width/10, y - 3* sprite_height/5, description, sprite_height/10, 2*sprite_width/5, 1.25, 1.25, 0);
	
	draw_zone(x + 4*sprite_width/5, y - 2*sprite_height/5, FishId.Empty, 90, true, 0.5);
	draw_zone(x + 4*sprite_width/5, y - 2*sprite_height/5, FishId.Goldfish, 90 -360/slice_count, true, 0.5);
	draw_zone(x + 4*sprite_width/5, y - 2*sprite_height/5, FishId.Empty, 90 -2*360/slice_count, true, 0.5);
}