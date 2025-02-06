


function draw_lake(_x, _y, _radius, _col, _alpha, zones){
	var sprite_surface_id = surface_create(_radius * 2, _radius * 2); // Create a blank surface
	surface_set_target(sprite_surface_id);       // Start drawing on the surface
	draw_clear_alpha(c_black, 0);        // Transparent background
	//draw_circle(1, 1, 20, false);
	var sizeOfSection = 360/zones;

	angle_start = 0;
	angle_end = sizeOfSection;
	segments = 10;
	draw_set_color(_col);
	draw_primitive_begin(pr_trianglefan);
	draw_set_alpha(_alpha);
	draw_vertex(surface_get_width(sprite_surface_id)/2, surface_get_height(sprite_surface_id)/2); // Center of the pie
	var center_x = surface_get_width(sprite_surface_id)/2;
	var center_y = surface_get_height(sprite_surface_id)/2;
	for (var i = 0; i <= segments; i++) {
	    var angle = angle_start + ((angle_end - angle_start) * (i / segments)); // Interpolate angles
	    var px = center_x + lengthdir_x(_radius, angle + 90 - sizeOfSection);
	    var py = center_y + lengthdir_y(_radius, angle + 90 - sizeOfSection);
	    draw_vertex(px, py);
	}

	draw_primitive_end();
	surface_reset_target();  
	var sprite = sprite_create_from_surface(sprite_surface_id, 0, 0, center_x * 2, center_y*2, false, false, center_x, center_y); // Create a sprite from it
	sprite_collision_mask(sprite, false, 2, 0, center_x * 2,center_y * 2,0, bboxkind_precise, 0);
	surface_free(sprite_surface_id);
	draw_set_alpha(1);
	return sprite;
}

ZoneSprite = draw_lake(0, 0, radius * 1, c_white, 1, slice_count);

// Clean up the surface after creating the sprite



var slice_list = [];

object_set_sprite(Zone, ZoneSprite);
for (var i = 0; i < slice_count; i++)
{   
	var slice = instance_create_layer(x, y, "Instances", Zone);
	
	slice.sprite_index = ZoneSprite
    slice.image_angle = ((-i * 360) / slice_count);
	var text_x = x + lengthdir_x(radius * 2.75, 90 + slice.image_angle + ((0.5 * 360) / slice_count) - 360/slice_count);
	var text_y = y + lengthdir_y(radius * 2.75, 90 + slice.image_angle + ((0.5 * 360) / slice_count) - 360/slice_count);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle)
	draw_text_transformed_color(text_x, text_y, i + 1, 3, 3, 0, c_black, c_black, c_black, c_black, 1);
	
	slice.image_xscale *= 2;
	slice.image_yscale *= 2;
    slice_list[i] = slice;
}