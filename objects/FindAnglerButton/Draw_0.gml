
draw_self()

if (revealedFish() == fishCount() - 1 and variable_global_exists("group") and global.group == "A") {
	draw_set_alpha(0.7 * sin(current_time/500))
	draw_rectangle_color(x- sprite_width/2, y - sprite_height/2, x + sprite_width/2, y + sprite_height/2, c_yellow, c_yellow, c_yellow, c_yellow, false);
	draw_set_alpha(1)
	
}
//
//	
//}