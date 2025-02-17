
var rect_width = 600;
var rect_height = 200;
var outline_thickness = 10;
draw_rectangle_color(x-rect_width/2 - outline_thickness, y - rect_height/2-outline_thickness, outline_thickness+x+rect_width/2, outline_thickness+ y + rect_height/2, c_black, c_black, c_black, c_black, false);
draw_rectangle_color(x-rect_width/2, y - rect_height/2, x+rect_width/2, y + rect_height/2, c_white, c_white, c_white, c_white, false);

draw_set_valign(fa_top);
draw_set_halign(fa_center);
draw_set_color(c_black);
draw_set_font(PixelFont);

draw_text_transformed(x, y - 4*rect_height/8, action, 2, 2, 0);

var description = "";

// Levels 3+
if (room != Level1 and room != Level2) {
	switch (action) {
		case "Go Fish":
			description = " Select a zone to reveal the fish in it. The Anglerfish will appear as empty. Uses 2 hours.";
			break;
		case "Scan":
			description = "Select a type of fish (except Anglerfish) and half of the zones. The number of that fish in those zones will be revealed. Uses 2 hours!";
			break;
		case "Find Anglerfish":
			description = "Select a zone to check for the Anglerfish. Guess correctly to win! Guess wrong and you lose.";
			break;
		case "Send Data":
			description =  "Choose a type of fish and a zone. If the selected fish is in that zone, you gain 1 hour! If it's not, you lose 1 hour.";
			break;
		default:
			description = "THERES A BUG, TEXT SHOULD NOT BE SHOWING. REPORT TO DEVS"
			break;
	}
} else { // Tutorial 1, 2
	// No Time consumption
	switch (action) {
		case "Go Fish":
			description = " Select a zone to reveal the fish in it. The Anglerfish will appear as empty.";
			break;
		case "Scan":
			description = "Select a type of fish (except Anglerfish) and half of the zones. The number of that fish in those zones will be revealed.";
			break;
		case "Find Anglerfish":
			description = "Select a zone to check for the Anglerfish. Guess correctly to win! Guess wrong and you lose.";
			break;

		default:
			description = "THERES A BUG, TEXT SHOULD NOT BE SHOWING. REPORT TO DEVS"
			break;
	}
}
	
draw_text_ext_transformed(x, y - 2.5*rect_height/8, description, rect_height/10, rect_width - 320, 2, 2, 0);
