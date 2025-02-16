draw_set_valign(fa_top);
draw_set_halign(fa_center);
draw_set_color(c_black);
draw_set_font(PixelFont);
draw_text_ext_transformed(x,y, "Level: " + string(global.level), 25, 200, 3, 3, 0);