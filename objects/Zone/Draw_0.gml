shader_set(ShOutline);
shader_set_uniform_f(upixelW, texelW);
shader_set_uniform_f(upixelH, texelH);
draw_self();

//draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,true); // displays collision

shader_reset();

