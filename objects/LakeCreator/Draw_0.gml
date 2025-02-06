


function draw_lake(_x, _y, _radius, _col, _alpha, zones){
	var sprite_surface_id = surface_create(200, 200); // Create a blank surface
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
	draw_vertex(100, 100); // Center of the pie

	for (var i = 0; i <= segments; i++) {
	    var angle = angle_start + ((angle_end - angle_start) * (i / segments)); // Interpolate angles
	    var px = 100 + lengthdir_x(_radius, angle);
	    var py = 100 + lengthdir_y(_radius, angle);
	    draw_vertex(px, py);
	}

	draw_primitive_end();
	surface_reset_target();  
	var sprite = sprite_create_from_surface(sprite_surface_id, 0, 0, 200, 200, false, false, 100, 100); // Create a sprite from it
	sprite_collision_mask(sprite, false, 2, 0,200,200,0, bboxkind_precise, 0);
	surface_free(sprite_surface_id);
	return sprite;
}
var slice_count = 8;
ZoneSprite = draw_lake(0, 0, 100, c_aqua, 1, slice_count);

// Clean up the surface after creating the sprite



var slice_list = [];

object_set_sprite(Zone, ZoneSprite);
for (var i = 0; i < slice_count; i++)
{   
	var slice = instance_create_layer(x, y, "Instances", Zone);
	
	slice.sprite_index = ZoneSprite
    slice.image_angle = (i * 360) / slice_count;
	slice.image_xscale *= 2;
	slice.image_yscale *= 2;
    slice_list[i] = slice;
}