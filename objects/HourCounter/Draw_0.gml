draw_set_valign(fa_top);
draw_set_halign(fa_center);
draw_set_color(c_black);
draw_set_font(PixelFont);

draw_text_ext_transformed(x,y, string(global.hours) + " Hours", 25, 400, 3, 3, 0);

// Draw gauge background
draw_set_color(c_black);
draw_rectangle(gauge_x - 5, gauge_y-5, gauge_x + gauge_width + 5, gauge_y + gauge_height + 5, false);
draw_set_color(c_white);
draw_rectangle(gauge_x, gauge_y, gauge_x + gauge_width, gauge_y + gauge_height, false);
// Draw gauge fill (based on gauge_value)
draw_set_color(c_yellow);
draw_rectangle(gauge_x, gauge_y, gauge_x + (gauge_width * min(global.hours/12, 1)), gauge_y + gauge_height, false);

// Draw tick marks
draw_set_color(c_black);
for (var i = 0; i < tick_count; i++) {
   var tick_x = gauge_x + (i / tick_count) * gauge_width;
   draw_rectangle(tick_x - 5, gauge_y, tick_x, gauge_y + tick_height * 1.5, false);
   
	var star_count = i + 1; 
    var star_spacing = 45; // Distance between stars
    var star_y_start = gauge_y + tick_height * 2; // Start below the tick

    for (var j = 0; j <= i; j++) {
        var star_x = tick_x - ((star_count - 1) * star_spacing) / 2 + j * star_spacing; // Distribute evenly

		draw_sprite_ext(StarSprite, 0, star_x, gauge_y + tick_height * 1.5 + 10, 2,2, 0, c_white, 1.0)
   }
}