


function draw_lake(_x, _y, _radius, _col, _alpha, zones){
	var sprite_surface_id = surface_create(_radius *2 + 10, _radius*2 + 10); // Create a blank surface
	surface_set_target(sprite_surface_id);       // Start drawing on the surface
	draw_clear_alpha(c_black, 0);        // Transparent background
	//draw_circle(1, 1, 20, false);
	var sizeOfSection = 360/zones;

	angle_start = 0;
	angle_end = sizeOfSection  +0;
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
if (array_length(global.zone_list) == 0) {
	
	ZoneSprite = draw_lake(0, 0, radius * 1, c_white, 1, slice_count);
	global.zone_sprite = ZoneSprite;
	// Clean up the surface after creating the sprite
	slice_count = array_length(global.fish_list);
	global.zone_highlight = array_create(slice_count, false);

	

	object_set_sprite(Zone, ZoneSprite);
	for (var i = 0; i < slice_count; i++)
	{   
		var slice = instance_create_layer(x, y , "Instances", Zone);
	
		slice.sprite_index = ZoneSprite
	    slice.image_angle = ((-i * 360) / slice_count);
		
		slice.zoneId = i + 1;
		slice.radius = radius;
		slice.slice_count = slice_count
		slice.image_xscale *= 2;
		slice.image_yscale *= 2;
		slice.fishId = global.fish_list[i];
	    global.zone_list[i] = slice;
		//show_debug_message(global.level_1[i]);
	}
	
} else {
	var lakeSprite;
	switch (slice_count) {
		case 4:
			lakeSprite = lake4;
			break;
		case 6:
			lakeSprite = lake6;
			break;
		case 8: 
			lakeSprite = lake8;
			break;
		case 12:
			lakeSprite = lake12;
			break;
		default:
			lakeSprite = SpriteLakeSurveyEntryCollisionMask
			break;
	}
	
	var x_scale = (radius*4.3)/sprite_get_width(lakeSprite);
	var y_scale = (radius*4.3)/sprite_get_height(lakeSprite);
	draw_sprite_ext(lakeSprite, 0, x,y-20, x_scale, y_scale, 0, c_white, 1);
	//draw_sprite_stretched(lakeSprite, 0, x-radius*2, y-radius*2, radius*4, radius*4 + 10);
}
if (global.state == STATES.SCAN_PICK_ZONE or global.state == STATES.FISH_PICK_ZONE or global.state == STATES.ANGLERFISH_PICK_ZONE or global.state ==STATES.DATA_PICK_ZONE) {
	blink += 0.1
	draw_set_alpha(0.5*sin(blink));
	if (global.state == STATES.DATA_PICK_ZONE) {
		for (var i = 0; i < slice_count; i++) {
			if (!global.zone_list[i].show_fish) {
				draw_sprite_ext(global.zone_sprite, 0, x,y-20, 2, 2, (-i*360)/ slice_count, c_green, 0.5*sin(blink))
			}
		}
	} else {
		draw_circle_color(x, y-20, radius*2 + 10, c_green, c_green, false);
	}	
	draw_set_alpha(1);
}