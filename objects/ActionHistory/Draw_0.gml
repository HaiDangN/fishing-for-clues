// Check if surface exists, otherwise create it
if (!surface_exists(surf)) {
    surf = surface_create(view_width, view_height);
}

max_scroll = max(item_height, array_length(global.actionList) * item_height - view_height);
// Set target to surface
surface_set_target(surf);
draw_clear_alpha(c_white, 0); // Clear with transparency

// Draw list items inside the surface
draw_rectangle_color(0, 0, view_width, view_height, c_white, c_white, c_white, c_white, false);

for (var i = array_length(global.actionList) -1 ; i >=0; i--) {
    var draw_y = (array_length(global.actionList)-i) * item_height - scroll_offset;
    
    // Only draw items within the visible area
    if (draw_y + item_height >= 0 && draw_y <= view_height) {
		draw_set_color(c_white)
        draw_rectangle(0, draw_y, view_width, draw_y + item_height, true);
        draw_set_color(c_black)
		
		// Action # 
		var _x = 0;
		var action_width = 50;
		
		draw_line(action_width, draw_y - item_height, action_width, draw_y);
		draw_set_valign(fa_middle)
		draw_text_transformed(action_width/2, draw_y - item_height/2, i+1,2,2,0);
		_x += action_width;
		
		// Ability used
		var ability_width = 80;
		var action = global.actionList[i];
		switch (action.ability) {
			case "Fish":
				draw_sprite_stretched(SpriteFish, 0, _x + ability_width/10, draw_y - item_height + ability_width*0.2, ability_width * 0.8, ability_width * 0.8);
				break;
			case "Scan":
				draw_sprite_stretched(SpriteScanSmall, 0, _x + ability_width*0.25, draw_y - item_height + ability_width*0.2, ability_width * 0.5, ability_width * 0.5);
				draw_sprite_stretched(fishIdToIcon(action.fishSelected), 0, _x + ability_width*0.3, draw_y - item_height + ability_width*0.8, ability_width * 0.4, ability_width * 0.4);
				break;
			case "Data":
				draw_sprite_stretched(SpriteSendDataSmall, 0, _x + ability_width*0.25, draw_y - item_height + ability_width*0.2, ability_width * 0.5, ability_width * 0.5);
				draw_sprite_stretched(fishIdToIcon(action.fishSelected), 0, _x + ability_width*0.3, draw_y - item_height + ability_width*0.8, ability_width * 0.4, ability_width * 0.4);
				break;
			case "Anglerfish":
				draw_sprite_stretched(SpriteFindAngler, 0, _x + ability_width/10, draw_y - item_height + ability_width*0.2, ability_width * 0.8, ability_width * 0.8);
				break;
			default:
				break;
		}
		_x += ability_width;
		draw_line(_x, draw_y - item_height, _x, draw_y); // draws vertical line to the right
		
		// Zone selected
		var zone_width = 70;
		draw_line(_x + zone_width, draw_y - item_height, _x + zone_width, draw_y);
		draw_set_valign(fa_middle)
		draw_text_transformed(_x + zone_width/2, draw_y - item_height/2, string(action.zoneSelected),2,2,0);
		_x += zone_width;
		draw_line(0, draw_y, view_width, draw_y);
		
		// Result
		var result_width = view_width - _x;
		switch (action.ability) {
			case "Fish":
				draw_sprite_stretched(fishIdToIcon(action.result), 0, _x + result_width/10, draw_y - item_height + result_width*0.1, result_width * 0.8, result_width * 0.8);
				break;
			case "Scan":
				draw_text_transformed(_x + result_width/2, draw_y - item_height/2, string(action.result),2,2,0);
				break;
			case "Data":
				if (action.result) {
					draw_sprite_stretched(Checkmark, 0, _x + result_width/10, draw_y - item_height + result_width*0.1, result_width * 0.8, result_width * 0.8);
				} else {
					draw_sprite_stretched(Xmark, 0, _x + result_width/10, draw_y - item_height + result_width*0.1, result_width * 0.8, result_width * 0.8);
				}
				break;
			case "Anglerfish":
				if (action.result) {
					draw_sprite_stretched(Checkmark, 0, _x + result_width/10, draw_y - item_height + result_width*0.1, result_width * 0.8, result_width * 0.8);
				} else {
					draw_sprite_stretched(Xmark, 0, _x + result_width/10, draw_y - item_height + result_width*0.1, result_width * 0.8, result_width * 0.8);
				}
				break;
		}
    }
}

// Reset target
surface_reset_target();

// Draw the surface to screen
draw_surface(surf, x, y);