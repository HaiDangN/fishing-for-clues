if (global.state == STATES.SCAN_PICK_FISH or global.state == STATES.DATA_PICK_FISH) {
	mask_index.image_blend = c_green;	
} else{
	mask_index.image_blend = c_white;
}