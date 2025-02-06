


function draw_lake(_x, _y, _radius, _col, _alpha, zones){
	var sizeOfSection = 360/zones;

	angle_start = 0;
	angle_end = sizeOfSection;
	segments = 10;
	draw_set_color(_col);
	draw_primitive_begin(pr_trianglefan);
	draw_vertex(_x, _y); // Center of the pie

	for (var i = 0; i <= segments; i++) {
	    var angle = angle_start + ((angle_end - angle_start) * (i / segments)); // Interpolate angles
	    var px = _x + lengthdir_x(_radius, angle);
	    var py = _y + lengthdir_y(_radius, angle);
	    draw_vertex(px, py);
	}

	draw_primitive_end();
	
	
}

var sprite_surface_id = surface_create(200, 200); // Create a blank surface
surface_set_target(sprite_surface_id);       // Start drawing on the surface
draw_clear_alpha(c_black, 0);        // Transparent background
draw_lake(0, 0, 100, c_aqua, 1, 4);
surface_reset_target();              // Stop drawing on the surface

ZoneSprite = sprite_create_from_surface(sprite_surface_id, 0, 0, 200, 200, false, true, 0, 0); // Create a sprite from it

// Clean up the surface after creating the sprite
surface_free(sprite_surface_id);


var slice_list = [];
var slice_count = 4;
object_set_sprite(Zone, ZoneSprite);
for (var i = 0; i < slice_count; i++)
{   
	var slice = instance_create_layer(x, y, "Instances", Zone);
	
	slice.sprite_index = ZoneSprite
    slice.image_angle = (i * 360) / slice_count;

    slice_list[i] = slice;
}