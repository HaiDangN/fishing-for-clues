x = mouse_x
y = mouse_y
draw_self();


draw_text_transformed(x + sprite_width/2, y - 4*sprite_height/5, fishIdToString(fishId), 2, 2, 0);

var slice_count = array_length(global.fish_list);
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
if (fishId == FishId.RedHerring) {
	
	var description = "The Red Herring is not adjacent to the Anglerfish"
	draw_set_halign(fa_left);
	draw_set_valign(fa_top)
	draw_text_ext_transformed(x + 1*sprite_width/10, y - 3* sprite_height/5, description, sprite_height/10, 2*sprite_width/5, 1.5, 1.5, 0);
	draw_zone(x + 4*sprite_width/5, y - 2*sprite_height/5, FishId.RedHerring, 90, true, 0.5);
	draw_zone(x + 4*sprite_width/5, y - 2*sprite_height/5, FishId.Empty, 90 -360/slice_count , false, 0.5);
	draw_zone(x + 4*sprite_width/5, y - 2*sprite_height/5, FishId.Anglerfish, 90 - 2*360/slice_count , true, 0.5);
}

