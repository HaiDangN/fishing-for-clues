draw_set_alpha(0.8)
draw_rectangle_color(0, 0, 1920, 1080, c_black, c_black, c_black, c_black, false);
if (global.level == 2) {
	fishId = FishId.Clownfish	
}


draw_set_alpha(1)

draw_set_color(c_white)
draw_text_transformed(1920/2, 100, "NEW FISH", 10, 10,0)

draw_text_transformed(1920/2, 1000, "Click to continue", 10, 10,0)
show_debug_message("draw fish display")
var sprite = -1 

switch (global.level) {
	case 2:
		sprite = ClownfishDefinition
		break;
	case 4:
		sprite = PrimefishDefinition
		break;
	case 5:
		sprite = GoldfishDefinition;
		break;
}

draw_sprite_ext(sprite, 0,  300, 200, 3, 3, 0, c_white, 1);