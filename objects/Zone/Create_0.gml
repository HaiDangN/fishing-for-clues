upixelH = shader_get_uniform(ShOutline, "pixelH");
upixelW = shader_get_uniform(ShOutline, "pixelW");

texelW = 2*texture_get_texel_width(sprite_get_texture(sprite_index, 0));
texelH = 2*texture_get_texel_height(sprite_get_texture(sprite_index, 0));
show_fish = false;
global.anglerfishFound = "";
standard_col = $4E7E09;
image_blend = standard_col;