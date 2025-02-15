// Check if surface exists, otherwise create it
if (!surface_exists(surf)) {
    surf = surface_create(view_width, view_height);
}

max_scroll = max(item_height, array_length(global.actionList) * item_height - view_height);
var action_width = 50;
var ability_width = 80;
var zone_width = 70;
var result_width = view_width - action_width - ability_width - zone_width;

// Create the header
var header_height = 100;
draw_set_color(c_white);
draw_rectangle(x, y - header_height, x + view_width, y, false);

draw_set_color(c_black);
draw_line(x, y - header_height, x + view_width, y - header_height);


// Turn # column header

draw_set_valign(fa_top);
draw_set_halign(fa_center);

draw_line(x + action_width, y - header_height, x+ action_width, y);
draw_text_transformed(x + action_width/2, y - header_height/2, "#",2,2,0);

draw_line( x + action_width + ability_width, y - header_height, x+ action_width + ability_width, y);
draw_text_ext_transformed( x + action_width + ability_width/2, y - header_height/2, "Ability",0, ability_width, 1.5,1.5,0);

draw_line( x + action_width + ability_width + zone_width, y - header_height, x+ action_width + ability_width + zone_width, y);
draw_text_ext_transformed( x + action_width + ability_width + zone_width/2, y - header_height/2, "Zone(s)",0, zone_width, 1.3,1.3,0);

draw_line( x + action_width + ability_width + zone_width + result_width, y - header_height,x + action_width + ability_width + zone_width + result_width, y);
draw_text_ext_transformed( x + action_width + ability_width + zone_width + result_width/2 , y - header_height/2, "Result",0, result_width, 1.5,1.5,0);

draw_line(x, y-1,x+ view_width, y-1);
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
		
		
		draw_line(action_width, draw_y - item_height, action_width, draw_y);
		draw_set_valign(fa_middle)
		draw_text_transformed(action_width/2, draw_y - item_height/2, i+1,2,2,0);
		_x += action_width;
		
		// Ability used
		
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
		
		draw_line(_x + zone_width, draw_y - item_height, _x + zone_width, draw_y);
		draw_set_valign(fa_middle)
		draw_text_transformed(_x + zone_width/2, draw_y - item_height/2, string(action.zoneSelected),2,2,0);
		_x += zone_width;
		draw_line(0, draw_y, view_width, draw_y);
		
		// Result
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