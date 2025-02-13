
var rect_width = 600;
var rect_height = 200;
var outline_thickness = 10;
draw_rectangle_color(x-rect_width/2 - outline_thickness, y - rect_height/2-outline_thickness, outline_thickness+x+rect_width/2, outline_thickness+ y + rect_height/2, c_black, c_black, c_black, c_black, false);
draw_rectangle_color(x-rect_width/2, y - rect_height/2, x+rect_width/2, y + rect_height/2, c_white, c_white, c_white, c_white, false);

draw_set_valign(fa_top);
draw_set_halign(fa_center);
draw_set_color(c_black);
draw_set_font(FontToBeReplaced);

draw_text_transformed(x, y - 3*rect_height/8, action, 2, 2, 0);

var description = "";

switch (action) {
	case "Go Fish":
		description = "Pick a zone and it will reveal the fish in it. The Angler will appear as empty.";
		break;
	case "Scan":
		description = "Pick a kind of fish (except for Anglerfish) and half the zones. The number of that fish in those zones will be revealed.";
		// maybe i can generate a rotating highlight of zones?
		break;
	case "Find Anglerfish":
		description = "Pick a zone. Tells you if the Anglerfish is in that zone or not."
		break;
	case "Send Data":
		description = "Pick a kind of fish and then a zone. If the kind of fish you choose IS in that zone - gain 1 hour!";
		break;
	default:
		description = "THERES A BUG, TEXT SHOULD NOT BE SHOWING. REPORT TO DEVS"
		break;
}
draw_text_ext_transformed(x, y - rect_height/6, description, rect_height/10, rect_width - 320, 2, 2, 0);
