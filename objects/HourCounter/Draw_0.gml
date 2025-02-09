draw_self();
draw_set_color(c_black);
draw_set_font(FontToBeReplaced);

// Set to the top right
draw_set_halign(fa_right);
draw_set_valign(fa_top);

draw_text(x,y, string(global.hours));