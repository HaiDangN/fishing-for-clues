var slice_list = [];
var slice_count = 4;

for (var i = 0; i < slice_count; i++)
{   
	var slice = instance_create_layer(x, y, "Instances", Zone);
	slice.sprite_index = ZoneSprite
    slice.image_angle = (i * 360) / slice_count;

    slice_list[i] = slice;
}