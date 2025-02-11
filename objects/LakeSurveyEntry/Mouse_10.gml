if (global.state == STATES.SCAN_PICK_FISH or global.state == STATES.DATA_PICK_FISH) {
	mask_index.image_blend = c_green;	
} else{
	mask_index.image_blend = c_white;
}

definitionCardInstance = instance_create_layer(mouse_x, mouse_y, layer, FishDefinitionTemplate);
definitionCardInstance.fishId = fishId;