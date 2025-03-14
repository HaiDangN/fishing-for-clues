if (global.level != 2) {
	 count = 1	
}
if (visible and count == 1) {
	instance_deactivate_object(definitionInstance)
	instance_deactivate_object(NewFishDisplay)
} else {
	count += 1
}